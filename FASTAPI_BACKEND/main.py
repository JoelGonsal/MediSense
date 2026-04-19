from fastapi import FastAPI, HTTPException, Response, Query
from pydantic import BaseModel
import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.preprocessing import LabelEncoder
import random
from twilio.rest import Client
from fastapi.responses import JSONResponse
from fastapi import UploadFile, File
from fastapi import FastAPI, File, UploadFile
from PIL import Image,ImageDraw, ImageFont
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
from tensorflow.keras.optimizers import Adam
from fuzzywuzzy import process
from rapidfuzz import process, fuzz
from fpdf import FPDF
import os
import io
import cv2
from sklearn.cluster import KMeans
from fastapi.responses import FileResponse


# **🔹 Initialize FastAPI App**
app = FastAPI()
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # or restrict later
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# **🔹 Load Datasets**
sym_des = pd.read_csv("/Users/joelgonsalves/Downloads/symtoms_df.csv")
precautions = pd.read_csv("/Users/joelgonsalves/Downloads/precautions_df.csv")
workout = pd.read_csv("/Users/joelgonsalves/Downloads/workout_df.csv")
description = pd.read_csv("/Users/joelgonsalves/Downloads/description.csv")
medications = pd.read_csv('/Users/joelgonsalves/Downloads/medications.csv')
diets = pd.read_csv("/Users/joelgonsalves/Downloads/diets.csv")

# **🔹 Load Training Data**
dataset = pd.read_csv("/Users/joelgonsalves/Downloads/Training-2.csv")

# Extract symptoms and prognosis labels
X_columns = dataset.columns[:-1]  # All columns except 'prognosis'
y_labels = dataset["prognosis"].values  # Disease labels

# **🔹 Encode Disease Labels at Runtime (Without Pickle)**
label_encoder = LabelEncoder()
y_encoded = label_encoder.fit_transform(y_labels)
disease_classes = label_encoder.classes_

# **🔹 Load TFLite Model**
tflite_model_path = "/Users/joelgonsalves/Downloads/disease_model.tflite"
interpreter = tf.lite.Interpreter(model_path=tflite_model_path)
interpreter.allocate_tensors()

# Get input and output details
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# **🔹 Helper Function to Get Disease Details**
def get_disease_info(predicted_disease):
    # Get Description
    desc = description[description['Disease'] == predicted_disease]['Description']
    desc = " ".join(desc.values) if not desc.empty else "No description available."

    # Get Precautions
    pre = precautions[precautions['Disease'] == predicted_disease][['Precaution_1', 'Precaution_2', 'Precaution_3', 'Precaution_4']]
    pre = [col for col in pre.values.flatten() if not pd.isna(col)]

    # Get Medications
    med = medications[medications['Disease'] == predicted_disease]['Medication']
    med = eval(med.values[0]) if not med.empty else ["No medications available."]

    # Get Diet Recommendations
    diet = diets[diets['Disease'] == predicted_disease]['Diet']
    diet = eval(diet.values[0]) if not diet.empty else ["No diet recommendations available."]

    # Get Workout Recommendations
    wrkout = workout[workout['disease'] == predicted_disease]['workout']
    wrkout = wrkout.values.tolist() if not wrkout.empty else ["No workout recommendations available."]

    return desc, pre, med, diet, wrkout

# **🔹 Define API Request Model**
class SymptomsRequest(BaseModel):
    symptoms: list[str]


# **🔹 Prediction Function**
def predict_disease(symptoms):
    # Convert input symptoms to a feature vector
    symptom_vector = np.zeros(len(X_columns))
    for symptom in symptoms:
        if symptom in X_columns:
            symptom_vector[list(X_columns).index(symptom)] = 1

    # Convert to TensorFlow Lite format
    input_data = np.array(symptom_vector, dtype=np.float32).reshape(1, -1)

    # Run inference
    interpreter.set_tensor(input_details[0]['index'], input_data)
    interpreter.invoke()

    # Get predicted output
    output_data = interpreter.get_tensor(output_details[0]['index'])
    predicted_class_index = np.argmax(output_data, axis=1)[0]
    predicted_disease = disease_classes[predicted_class_index]  # Convert back to disease name

    # Get additional details
    desc, pre, med, diet, wrkout = get_disease_info(predicted_disease)

    return {
        "predicted_disease": predicted_disease,
        "description": desc,
        "precautions": pre,
        "medications": "\n".join([f"{i + 1}. {med[i]}" for i in range(len(med))]),
        "diet_recommendations": "\n".join([f"{i + 1}. {diet[i]}" for i in range(len(diet))]),
        "recommended_workouts": "\n".join([f"{i + 1}. {wrkout[i]}" for i in range(len(wrkout))])
    }

# **🔹 API Endpoints**

@app.get("/")
def home():
    return {"message": "Welcome to the Disease Prediction API!"}


@app.post("/predict/")
def predict(request: SymptomsRequest):
    prediction = predict_disease(request.symptoms)
    return prediction

symptoms_list = [
    "itching", "skin_rash", "nodal_skin_eruptions", "dischromic _patches", "continuous_sneezing",
    "shivering", "chills", "watering_from_eyes", "stomach_pain", "acidity", "ulcers_on_tongue",
    "vomiting", "cough", "yellowish_skin", "nausea", "loss_of_appetite", "burning_micturition",
    "spotting_ urination", "abdominal_pain", "passage_of_gases", "indigestion", "muscle_wasting",
    "patches_in_throat", "high_fever", "extra_marital_contacts", "fatigue", "weight_loss",
    "restlessness", "lethargy", "irregular_sugar_level", "sunken_eyes", "dehydration",
    "diarrhoea", "breathlessness", "family_history", "headache", "chest_pain", "dizziness",
    "loss_of_balance", "lack_of_concentration", "blurred_and_distorted_vision",
    "excessive_hunger", "back_pain", "weakness_in_limbs", "neck_pain",
    "weakness_of_one_body_side", "altered_sensorium", "sweating", "joint_pain", "dark_urine",
    "yellowing_of_eyes", "swelling_of_stomach", "distention_of_abdomen", "constipation",
    "pain_during_bowel_movements", "pain_in_anal_region", "bloody_stool", "irritation_in_anus",
    "cramps", "bruising", "obesity", "swollen_legs", "weight_gain", "cold_hands_and_feets",
    "mood_swings", "anxiety", "knee_pain", "hip_joint_pain", "swelling_joints", "muscle_weakness",
    "stiff_neck", "movement_stiffness", "painful_walking", "spinning_movements",
    "pus_filled_pimples", "blackheads", "scurring", "bladder_discomfort", "foul_smell_of urine",
    "continuous_feel_of_urine", "skin_peeling", "silver_like_dusting", "small_dents_in_nails",
    "blister", "red_sore_around_nose", "yellow_crust_ooze","yellow_urine"
]

# API Endpoint to Get List of Symptoms
@app.get("/symptoms/")
def get_symptoms():
    return {"symptoms": symptoms_list}

medical_tips = [
    "Drink at least 8 glasses of water daily to stay hydrated.",
    "Exercise for at least 30 minutes a day to boost your heart health.",
    "Eat a balanced diet with plenty of fruits and vegetables.",
    "Get 7-9 hours of sleep each night for better overall health.",
    "Wash your hands regularly to prevent infections.",
    "Practice deep breathing to reduce stress and anxiety.",
    "Limit sugar and processed foods to maintain a healthy weight.",
    "Take regular breaks if working on a computer to prevent eye strain.",
    "Stretch your body every morning to improve flexibility and circulation.",
    "Always wear sunscreen to protect your skin from harmful UV rays.",
    "Drink at least 8 glasses of water daily to stay hydrated.",
    "Get 7-9 hours of quality sleep every night for better health.",
    "Eat a balanced diet rich in fruits, vegetables, and whole grains.",
    "Engage in at least 30 minutes of physical activity daily.",
    "Maintain good posture to prevent back and neck pain.",
    "Reduce screen time before bed to improve sleep quality.",
    "Practice mindfulness or meditation for mental clarity.",
    "Wash fresh fruits and vegetables before eating to remove pesticides.",
    "Keep your living space clean to reduce allergens and germs.",
    "Avoid smoking and limit alcohol intake for better overall health.",
    "Stay socially connected to boost emotional well-being.",
    "Regularly visit a doctor for health check-ups and screenings.",
    "Manage stress through hobbies, music, or spending time in nature.",
    "Avoid skipping meals to maintain stable energy levels.",
    "Listen to your body, rest when you feel tired or unwell."
]

tipjoel = [
    "hello my name is joel"
]

@app.get("/tips/")
def get_health_tip():
    tip = random.choice(medical_tips)  # Select a random tip
    return {"message": "Stay healthy!", "tip": tip}


file_path = "/Users/joelgonsalves/Downloads/Indian-Medicine-Dataset-main/DATA/updated_indian_medicine_data.csv"
df = pd.read_csv(file_path, encoding='utf-8', low_memory=False, on_bad_lines='skip')

# Clean up column names and medicine names
df.columns = df.columns.str.strip()
df["name"] = df["name"].astype(str).str.strip().str.lower()


# Request model for getting detailed info
class MedicineRequest(BaseModel):
    medicine_name: str


# ✅ Endpoint 1: Suggest medicine names (fuzzy + partial match)
class SuggestRequest(BaseModel):
    query: str


@app.post("/suggest")
def suggest_medicine_names(request: SuggestRequest):
    all_names = df["name"].dropna().unique()
    matches = process.extract(request.query.lower(), all_names, limit=10)
    suggestions = [match[0].title() for match in matches if match[1] >= 60]

    if not suggestions:
        raise HTTPException(status_code=404, detail="No matches found.")

    return {"suggestions": suggestions}


# ✅ Endpoint 2: Get detailed medicine info (exact match)
@app.post("/medicine")
def get_medicine_details(request: MedicineRequest):
    medicine_name = request.medicine_name.strip().lower()
    medicine_data = df[df["name"].str.lower() == medicine_name]

    if medicine_data.empty:
        raise HTTPException(status_code=404, detail="Medicine not found.")

    med = medicine_data.iloc[0].fillna("N/A")

    return {
        "name": med["name"].title(),
        "price": f"{med['price']} Rs.",
        "manufacturer": med["manufacturer_name"].title(),
        "description": med["medicine_desc"],
        "pack_size_label": med["pack_size_label"].title(),
        "side_effects": "\n".join([effect.strip().title() for effect in str(med["side_effects"]).split(",")]),
        "short_composition1": med["short_composition1"],
        "short_composition2": med["short_composition2"],

    }
@app.get("/status")
def check_status():
    status = {}

    # Check Disease Prediction Model
    try:
        dummy_symptoms = ["itching", "skin_rash"]
        predict_disease(dummy_symptoms)
        status["DiseasePrediction"] = "Working"
    except Exception as e:
        status["DiseasePrediction"] = f"Error: {str(e)}"

    # Check Medicine Lookup
    try:
        if not df.empty:
            status["MedicineLookup"] = "Working"
        else:
            status["MedicineLookup"] = "Error: Medicine dataset is empty"
    except Exception as e:
        status["MedicineLookup"] = f"Error: {str(e)}"




model1 = load_model("/Users/joelgonsalves/Downloads/diabetes_model_improved.h5")


# Define input data format
class DiabetesInput(BaseModel):
    Pregnancies: float
    Glucose: float
    BloodPressure: float
    SkinThickness: float
    Insulin: float
    BMI: float
    DiabetesPedigreeFunction: float
    Age: float

# Class labels
class_labels = ["No Diabetes", "Diabetes"]

@app.post("/dia")
def predict(data: DiabetesInput):
    # Convert input data to NumPy array
    input_data = np.array([[data.Pregnancies, data.Glucose, data.BloodPressure,
                            data.SkinThickness, data.Insulin, data.BMI,
                            data.DiabetesPedigreeFunction, data.Age]])

    # Make prediction
    prediction = model1.predict(input_data)
    class_index = np.argmax(prediction)
    confidence = round(float(np.max(prediction) * 100), 2)

    return {"prediction": class_labels[class_index], "confidence": confidence}

import numpy as np
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

data = pd.read_csv("/Users/joelgonsalves/Downloads/stress-level-predection-main/StressLevelDataset.csv")
encoder = LabelEncoder()
data["stress_level"] = encoder.fit_transform(data["stress_level"])

# Split dataset into features and target
X = data.drop("stress_level", axis=1)
y = data["stress_level"]

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train a decision tree classifier
tree_clf = DecisionTreeClassifier(max_depth=7, random_state=100)
tree_clf.fit(X_train, y_train)

# Pydantic model for request validation
class StressInput(BaseModel):
    anxiety_level: float
    mental_health_history: float
    depression: float
    headache: float
    sleep_quality: float
    breathing_problem: float
    living_conditions: float
    academic_performance: float
    study_load: float
    future_career_concerns: float
    extracurricular_activities: float

# Route to handle form submission and prediction
@app.post("/stress/")
async def predict_stress_level(user_input: StressInput):
    try:
        # Extract values from the user input model
        input_values = np.array([[user_input.anxiety_level, user_input.mental_health_history, user_input.depression,
                                  user_input.headache, user_input.sleep_quality, user_input.breathing_problem,
                                  user_input.living_conditions, user_input.academic_performance, user_input.study_load,
                                  user_input.future_career_concerns, user_input.extracurricular_activities]])

        # Predict stress level
        predicted_stress_level = tree_clf.predict(input_values)[0]

        # Map encoded label back to original class
        predicted_stress_level = encoder.inverse_transform([predicted_stress_level])[0]

        # Return the stress level as a simple response
        stress_level = {
            0: "Low Stress",
            1: "Medium Stress",
            2: "High Stress"
        }

        return {"predicted_stress_level": stress_level.get(predicted_stress_level, "Unknown")}

    except ValueError:
        raise HTTPException(status_code=400, detail="Invalid input. Please enter numeric values for all fields.")

model1 = load_model("/Users/joelgonsalves/Downloads/diabetes_model_improved.h5")


# Define input data format
class DiabetesInput(BaseModel):
    Pregnancies: float
    Glucose: float
    BloodPressure: float
    SkinThickness: float
    Insulin: float
    BMI: float
    DiabetesPedigreeFunction: float
    Age: float

# Class labels
class_labels = ["No Diabetes", "Diabetes"]

@app.post("/dia")
def predict(data: DiabetesInput):
    # Convert input data to NumPy array
    input_data = np.array([[data.Pregnancies, data.Glucose, data.BloodPressure,
                            data.SkinThickness, data.Insulin, data.BMI,
                            data.DiabetesPedigreeFunction, data.Age]])

    # Make prediction
    prediction = model1.predict(input_data)
    class_index = np.argmax(prediction)
    confidence = round(float(np.max(prediction) * 100), 2)

    return {"prediction": class_labels[class_index], "confidence": confidence}



