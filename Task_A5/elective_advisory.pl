/*The messages to be displayed for the option chosen in case of field of interest*/

field(data):-
    write('Take up Data Engineering Courses like:'),nl,
    write('Machine Learning - CSE543'),nl,
    write('Information Retrieval - CSE508'),nl,
    write('Big Data Analytics - CSE510A'),nl,
    write('Database System Implementation - CSE507'),nl,
    write('Machine Learning - CSE543'),nl,
    write('Data Mining - CSE506'),nl,nl.

field(software):-
    write('Take up Software Engineering Courses like:'),nl,
    write('Software defined networking - CSE565'),nl,
    write('Software Production Evolution and Maintenance - CSE582'),nl,
    write('Software Development using Open Source - CSE583'),nl,
    write('Foundations of Parallel Programming - CSE502'),nl,
    write('Program Verification - CSE584'),nl,nl.

field(networking):-
    write('Take up Networking Courses like:'),nl,
    write('Network Security - CSE550'),nl,
    write('Wireless Networks - CSE538'),nl,
    write('Communication Networks - CSE636'),nl,
    write('Cellular Data Networks - CSE539'),nl,
    write('Ad Hoc Wireless Networks - CSE5xx'),nl,
    write('Network Science - CSE655'),nl,nl.

field(any):-
    write('You can take up other courses like:'),nl,
    write('Artificial Intelligence'),nl,
    write('Information Security related subjects'),nl,nl.


/*The messages to be displayed in case of grade input given by the user*/

grade(average):-
    write('Take up 500 to some of max 600 level general courses based on your field of interest'),nl,nl.

grade(high):-
    write('Take up advanced level courses of 600 to 700 level also based on your field of interest'),nl,nl.

grade(any):-
    write('Generally, take up lower to medium level courses based on you interest'),nl,nl.


/*The messages to be displaed in case of the project or only courses preference input given by the user*/

preference(projects):-
    write('You can do either:'),nl,
    write('1. Full-fleged research - For this you need to complete atleast 32 credits of course work for a 16 credit thesis.'),nl,
    write('2. Capstone Project as:'),nl,
    write('--- A 4 credit capstone project with 44 credits of coursework'),nl,
    write('--- An 8 credit capstone project with 40 credits of coursework'),nl,nl.

preference(courses):-
      write('You have chosen the option of completing degree without Thesis/Capstone/Scholarly Paper'),nl,
      write('In this case you have to complete a total of 48 credits of coursework'),nl,nl.

preference(any):-
     write('Based on research - choose thesis'),nl,
     write('Based on industry - choose capstone'),nl,
     write('Based on deeper knowledge - choose scholarly paper'),nl,
     write('Default - full 48 credits of courses'),nl,nl.


