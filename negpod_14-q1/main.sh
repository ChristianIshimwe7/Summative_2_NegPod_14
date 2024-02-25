#!/bin/bash

STUDENT_LIST_FILE="students-list_1023.txt"

#Function to add a new student's information
create_new_student() {

}

view_all_students() {

}

delete_student_data() {
}

update_student_data() {

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

