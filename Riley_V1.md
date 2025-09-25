# College Database – EER Diagram

## 📌 Project Overview
This project contains an **Enhanced Entity–Relationship (EER) diagram** designed to model a college database system. The diagram was created using **MySQL Workbench** and reflects the entities, attributes, and relationships necessary to store and manage academic information.  

The goal of this database is to provide a structured schema to manage data about students, teachers, courses, enrollment, and other related entities in a college environment.  

---

## 🖼️ EER Diagram

<img width="877" height="828" alt="image" src="https://github.com/user-attachments/assets/a5edbb0c-f359-491d-82fc-cc87ccb5bd81" />


---

## 🗂️ File Information
- **File name:** `college_v1.mwb`  
- **Tool used:** MySQL Workbench (EER Diagram)  
- **Version:** 1.0  
- **Author:** Riley Teeter and Tyler Lucas 
- **Date Created:** 09/08/2025

---

## 📊 Entities and Attributes
The EER diagram includes the following **main entities** (with key attributes):  

- **Student**  
  - StudentID (PK)  
  - FirstName, LastName  
  - Major  
  - Year  

- **Teacher**  
  - TeacherID (PK)  
  - FirstName, LastName  
  - Department  

- **Course**  
  - CourseID (PK)  
  - CourseName  
  - Credits  

- **Room**  
  - RoomID (PK)  
  - Capacity  
  - Location  

- **Enrollment** (junction table)  
  - EnrollmentID (PK)  
  - StudentID (FK)  
  - CourseID (FK)  
  - Grade  


---

## 🔗 Relationships
- **One-to-Many:**  
  - Teacher → Course (a teacher can teach many courses)  
  - Room → Course (a room can host many courses)  

- **Many-to-Many:**  
  - Student ↔ Course (resolved via Enrollment)
---

## ⚙️ Constraints & Business Rules
- Each **student** must have a unique `StudentID`.  
- Each **course** must be assigned a **teacher**.  
- A **room’s capacity** sets the maximum number of students enrolled in that course.  
- A student may enroll in multiple courses, but cannot enroll in the same course more than once.  

---

## 🚀 How to Use
1. Open **MySQL Workbench**.  
2. Load the file: `college_v1.mwb`.  
3. Review the diagram and modify if necessary.  
4. Use **Forward Engineer** to generate the SQL schema.  
5. Deploy the schema to a MySQL database. 

---
## 👩‍💻 Authors
- **Name:** Tyler Lucas
  - GitHub: https://github.com/TylerLucas1  

- **Name:** Riley Teeter 
  - GitHub: https://github.com/RileyTeeter
---

## 📖 License
This project is for educational purposes. Modify and use as needed.  
