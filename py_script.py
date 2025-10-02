import random
from datetime import datetime, timedelta

def random_date(start, end):
    """Generate a random date between start and end"""
    return start + timedelta(days=random.randint(0, (end - start).days))

def generate_people(n):
    """Generate insert statements for people"""
    first_names = ["John", "Jane", "Alex", "Emily", "Chris", "Katie", "Mike", "Sarah", "David", "Laura"]
    last_names = ["Smith", "Johnson", "Brown", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin"]
    genders = ["M", "F"]
    people_sql = []
    for i in range(1, n + 1):
        fn = random.choice(first_names)
        ln = random.choice(last_names)
        email = f"{fn.lower()}.{ln.lower()}{i}@example.com"
        dob = random_date(datetime(1980, 1, 1), datetime(2005, 12, 31)).strftime('%Y-%m-%d')
        gender = random.choice(genders)
        address = f"{random.randint(100, 999)} Main St, City {i}"
        phone = f"555-{random.randint(1000, 9999)}"
        sql = f"('{fn}', '{ln}', '{email}', '{dob}', '{gender}', '{address}', '{phone}', 1)"
        people_sql.append(sql)
    return people_sql

# Generate 500 rows
people_data = generate_people(500)

# Final SQL
insert_people_sql = "INSERT INTO people (first_name, last_name, email, date_of_birth, gender, address, phone_number, audit_user_id) VALUES\n"
insert_people_sql += ",\n".join(people_data) + ";"

# Save to file (optional)
with open("insert_people.sql", "w") as f:
    f.write(insert_people_sql)

print("✅ SQL data for 500 people generated successfully.")


# mysql -u your_user -p af25enoca1_college_db_v2 < insert_people.sql
