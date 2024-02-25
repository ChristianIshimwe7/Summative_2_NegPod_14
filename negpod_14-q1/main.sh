#!/bin/bash

STUDENT_LIST_FILE="students-list_1023.txt"

#Function to add a new student's information
create_new_student() {

}

view_all_students() {

}

delete_student_data() {
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

