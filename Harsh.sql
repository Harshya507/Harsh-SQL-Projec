-- Create Tables
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Class VARCHAR(50)
);

CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(100)
);

CREATE TABLE Marks (
    MarkID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    MarksObtained INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

-- Insert Sample Data
INSERT INTO Students VALUES (1, 'Harsh Patil', '12th Science');
INSERT INTO Students VALUES (2, 'Sneha Rao', '12th Commerce');

INSERT INTO Subjects VALUES (101, 'Mathematics');
INSERT INTO Subjects VALUES (102, 'Physics');
INSERT INTO Subjects VALUES (103, 'Economics');

INSERT INTO Marks VALUES (1, 1, 101, 88);
INSERT INTO Marks VALUES (2, 1, 102, 91);
INSERT INTO Marks VALUES (3, 2, 103, 77);

-- Query: Average marks of each student
SELECT s.Name, AVG(m.MarksObtained) AS Average_Marks
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
GROUP BY s.Name;

-- Query: Top marks in each subject
SELECT sub.SubjectName, MAX(m.MarksObtained) AS Top_Score
FROM Marks m
JOIN Subjects sub ON m.SubjectID = sub.SubjectID
GROUP BY sub.SubjectName;
