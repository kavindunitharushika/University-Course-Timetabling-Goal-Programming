# University Course Timetabling Using Goal Programming

**Applying Operations Research Techniques to Solve a Real-World University Problem**

**University of Ruhuna | Faculty of Science | 2024**

**Project Type:** Undergraduate Group Case Study  
**Course:** MSF 1222 – Operational Research 2  
**Programming Language:** MATLAB  
**Research Area:** Operations Research and Optimization

## Project Overview

This project explores the application of **Goal Programming (GP)** to university course timetabling at the Faculty of Science, University of Ruhuna.

The case study focuses on balancing multiple scheduling objectives, including faculty preferences, classroom utilization, student course conflicts, and the distribution of courses throughout the academic week.

## Project Objectives

- Maximize faculty teaching-time preferences.
- Optimize classroom utilization while considering room capacities.
- Minimize student course scheduling conflicts.
- Balance course distribution across weekdays.

## Methodology

The study uses a multi-objective Goal Programming approach.

The proposed model considers:

- 20 courses
- 12 available time slots
- 6 classrooms with different capacities
- Student enrollment numbers
- Faculty teaching-time preferences

Binary decision variables represent course-to-time-slot assignments.

A weighted objective function combines the four scheduling goals, while constraints address course assignments and classroom capacities.

MATLAB was used to formulate and explore the optimization problem.

## Tools and Technologies

- MATLAB
- Goal Programming
- Mathematical Optimization
- Operations Research
- Binary Decision Variables
- University Timetable Scheduling

## Results and Discussion

The report presents a binary course-scheduling matrix and a proposed weekly timetable.

The study illustrates how Goal Programming can be applied to university scheduling problems involving multiple competing objectives.

**Limitation:** The reported scheduling matrix contains multiple assignments for some courses, despite the model specifying one time slot per course. The report also identifies coding and input-data challenges. Therefore, the timetable should be considered a case-study result rather than a fully validated optimal schedule.

## Repository Contents

- `12948-casestudy.pdf` – Complete case study report
- `university_course_timetabling.m` – MATLAB source code
- `README.md` – Project documentation

## Group Members

1. H. K. T. Handagala
2. U. G. N. Induwara
3. J. M. D. R. L. Jayamaha
4. S. M. T. N. Siriwardhana
5. T. M. Wasala

## Academic Information

**University:** University of Ruhuna, Sri Lanka  
**Faculty:** Faculty of Science  
**Degree Programme:** Financial Mathematics and Industrial Statistics  
**Course:** MSF 1222 – Operational Research 2  
**Course Coordinator:** Dr. Samarathunga Dissanayake  
**Year:** 2024

## Conclusion

This case study demonstrates the potential of Goal Programming as a decision-support approach for university course scheduling. It highlights the importance of balancing faculty preferences, student needs, and classroom resources when developing academic timetables.

---

*This repository is maintained for academic and educational purposes.*.
