// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Structure for student details
    struct Student {
        uint256 rollNo;
        string name;
        uint256 age;
    }

       // Array to store students
    Student[] public students;

    // Add new student
    function addStudent(uint256 _rollNo, string memory _name, uint256 _age) public {
        Student memory newStudent = Student(_rollNo, _name, _age);
        students.push(newStudent);
    }

    // Get student details by index
    function getStudent(uint256 index) public view returns (uint256, string memory, uint256) {
        require(index < students.length, "Invalid index");
        Student memory s = students[index];
        return (s.rollNo, s.name, s.age);
    }

    // Get total number of students
    function getTotalStudents() public view returns (uint256) {
        return students.length;
    }

    // Fallback function (executed if no function matches)
    fallback() external payable {
        // If someone sends ETH or calls invalid function, just accept silently
    }

    // Receive function to accept ETH (optional)
    receive() external payable {}
}
