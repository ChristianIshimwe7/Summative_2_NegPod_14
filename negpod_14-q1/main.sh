#!/bin/bash

STUDENT_LIST_FILE="students-list_1023.txt"

#Function to add a new student's information
create_new_student() {
    echo "Enter student's ID:"
    read id

    echo "Enter student's email:"
    read email

    echo "Enter student's age:"
    read age

    # Check if ID or email is found
    if grep -q "^$id," "$STUDENT_LIST_FILE"; then
        echo "Student with ID $id exists."
    elif grep -q "$email" "$STUDENT_LIST_FILE"; then
        echo "Student with email $email exists."
    else
        echo "$id, $email, $age" >> "$STUDENT_LIST_FILE"
        echo "The Student's information is added successfully."
}

#Function to display students' information
view_all_students() {
if [ -s "$STUDENT_LIST_FILE" ]; then
        echo "List of all students"
        echo "ID  | Student Email        | Age"
        echo "----|-----------------------|----"
        awk -F ", " '{printf "%-4s| %-23s| %-3s\n", $1, $2, $3}' "$STUDENT_LIST_FILE"
    else
        echo "No students found!"
    fi
}

#Function to delete student's information
delete_student_data() {
    echo "Enter student ID to delete:"
    read id

    # Check if ID exists before deletion
    if grep -q "^$id," "$STUDENT_LIST_FILE"; then
        sed -i "/^$id,/d" "$STUDENT_LIST_FILE"
        echo "Student with ID $id deleted successfully."
    else
        echo "Student with ID $id is not found!"
    fi
}

#Function to update  student's information
update_student_data() {
echo "Enter student's ID:"
    read update_id

    # Check if ID exists before updating
    if grep -q "^$update_id," "$STUDENT_LIST_FILE"; then
        echo "Enter updated email:"
        read updated_email
        echo "Enter updated age:"
        read updated_age

        # Update the student record
        awk -v id="$update_id" -v email="$updated_email" -v age="$updated_age" 'BEGIN {FS = ", "} $1 == id {$1 = id; $2 = email; $3 = age; printf "%s, %s, %s\n", $1, $2, $3; next} {print}' "$S
}

# Function to exit the application
exit_application() {
    echo "Thank you for using our system."
    exit 0
}

# Main menu
while true; do
    echo "Choose an option:"
    echo "1. Add New Student"
    echo "2. View all existing students"
    echo "3. Update student information"
    echo "4. Delete student information"
    echo "5. Exit"
    read -p "Enter the number of your choice:" choice

    case $choice in
        1) create_new_student ;;
        2) view_all_students ;;
        3) update_student_data ;;
        4) delete_student_data ;;
        5) exit_application ;;
        *) echo "Invalid option."
    esac
done

