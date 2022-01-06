/*Elective Advisory System for Mtech CSE Students*/

electiveadvisorysys :-
    expert_sys,
    reset_sys,
    choose_electives(Elective),
    choose_project(Project),
    choose_theory(Theory),
    choose_system(System),
    choose_software(Software),
    choose_openelec(Openelec),
    detail(Elective),
    describe_project(Project),
    describe_theory(Theory),
    describe_system(System),
    describe_software(Software),
    describe_openelec(Openelec),nl.

/*In case the advisory system is not able to find any right elective courses for the student*/

electiveadvisorysys :-
    write('Looks like we could\'nt find the right electives for you!'),nl,
    write('Want to give it another try? (Type electiveadvisorysys followed by a dot to try again!)'),nl.

/*This takes care of the Welcome Message when the advisory system is consulted and called*/

expert_sys :-
    write('Welcome to M-Tech CSE Elective Advisory System!'),nl,
    write('I\'ll help you find the best elective courses for your M-Tech CSE Programme'),nl,
    write('For each question asked, enter your choice followed by a dot. Let us begin!'),nl,nl.


/*These are the different components that will be tested for trueness in order to display the result*/

choose_electives(Elective) :-
    elective(Elective),!.

choose_project(Project) :-
    project(Project),!.

choose_theory(Theory) :-
    theory(Theory),!.

choose_system(System) :-
    system(System),!.

choose_software(Software) :-
    software(Software),!.

choose_openelec(Openelec) :-
    openelec(Openelec),!.


/*These are the different core elective courses a student can take based on their input options*/

elective(aibasic) :-
    field(ai),
    (
        (gparange(lowgpa),test_position(napos));
        (gparange(nagpa),test_position(bottompos))
    ).

elective(aimixed) :-
    field(ai),
    (
        (gparange(medgpa),test_position(napos));
        (gparange(nagpa),test_position(midpos))
    ).

elective(aiadvanced) :-
    field(ai),
    (
        (gparange(highgpa),test_position(napos));
        (gparange(nagpa),test_position(toppos))
    ).

elective(databasic) :-
    field(data),
    (
        (gparange(lowgpa),test_position(napos));
        (gparange(nagpa),test_position(bottompos))
    ).

elective(datamixed) :-
    field(data),
    (
        (gparange(medgpa),test_position(napos));
        (gparange(nagpa),test_position(midpos))
    ).

elective(dataadvanced) :-
    field(data),
    (
        (gparange(highgpa),test_position(napos));
        (gparange(nagpa),test_position(toppos))
    ).

elective(infosecbasic) :-
    field(inforsys),
    (
        (gparange(lowgpa),test_position(napos));
        (gparange(nagpa),test_position(bottompos))
    ).

elective(infosecmixed) :-
    field(inforsys),
    (
        (gparange(medgpa),test_position(napos));
        (gparange(nagpa),test_position(midpos))
    ).

elective(infosecadvanced) :-
    field(inforsys),
    (
        (gparange(highgpa),test_position(napos));
        (gparange(nagpa),test_position(toppos))
    ).

elective(mobcompmixed) :-
    field(mobcomp),
    (
        (
        (gparange(lowgpa);gparange(medgpa)),
         test_position(napos));
        (gparange(nagpa),
         (test_position(bottompos);test_position(midpos)))
    ).

elective(mobcompadv) :-
    field(mobcomp),
    (
        (gparange(highgpa),test_position(napos));
        (gparange(nagpa),test_position(toppos))
    ).

elective(netwmixed) :-
    field(netw),
    (
        (
        (gparange(lowgpa);gparange(medgpa)),
         test_position(napos));
        (gparange(nagpa),
         (test_position(bottompos);test_position(midpos)))
    ).

elective(netwadvanced) :-
    field(netw),
    (
        (gparange(highgpa),test_position(napos));
        (gparange(nagpa),test_position(toppos))
    ).

elective(sdevbasic) :-
    field(sdev),
    (
        (gparange(lowgpa),test_position(napos));
        (gparange(nagpa),test_position(bottompos))
    ).

elective(sdevadvanced) :-
    field(sdev),
    (
        (
        (gparange(medgpa);gparange(highgpa)),
         test_position(napos));
        (gparange(nagpa),
         (test_position(midpos);test_position(toppos)))
    ).

elective(gamedevcomm) :-
    field(gamedev),
    (
        (
        (gparange(lowgpa);gparange(medgpa);gparange(highgpa)),
         test_position(napos));
        (gparange(nagpa),
         (test_position(bottompos);test_position(midpos);test_position(toppos)))
    ).

elective(webdevcomm) :-
    field(webdev),
    (
        (
        (gparange(lowgpa);gparange(medgpa);gparange(highgpa)),
         test_position(napos));
        (gparange(nagpa),
         (test_position(bottompos);test_position(midpos);test_position(toppos)))
    ).


/*This is made in order to understand the number of credits of coursework a student needs to complete if thesis/paper/project are being taken*/

project(optresearch) :-
    research_or_industry(research).

project(optindustry) :-
    research_or_industry(industry).

project(optscholarly) :-
    research_or_industry(docm).

project(optcourse) :-
    research_or_industry(coursework).


/*This is for the choice of course for the student from the theory bucket*/

theory(alggrad) :-
    theory_bucket(gradalgo).

theory(madalg) :-
    theory_bucket(modernalgo).

theory(ralg) :-
    theory_bucket(randalgo).


/*This is for the choice of course for the student from the systems bucket*/

system(archi) :-
    system_bucket(comparch).

system(mob) :-
    system_bucket(mobile).

system(wirnet) :-
    system_bucket(network).


/*This is for the choice of course for the student from the software bucket*/

software(programaly) :-
    software_bucket(progaly).

software(retrinf) :-
    software_bucket(inforet).

software(compiprog) :-
    software_bucket(compiler).


/*This is for the list of open elective courses for the students based on their preference*/

openelec(healthmed) :-
    type_industry(health).

openelec(designing) :-
    type_industry(design).

openelec(financial) :-
    type_industry(finance).

openelec(technosoc) :-
    type_industry(sociotech).

openelec(entrepreneural) :-
    type_industry(entrep).


/*The messages to be displayed for each elective result based on student input*/

detail(aibasic) :-
  write('You can take up the basic AI courses. This includes:'),nl,
  write('Machine Learning - CSE543'),nl,
  write('Image Analysis - CSE540'),nl,
  write('Multi-Agent Systems - CSE531'),nl,
  write('Artificial Intelligence - CSE643'),nl,
  write('Reinforcement Learning - CSE564'),nl,
  write('Data Mining - CSE506'),nl,nl.

detail(aimixed) :-
  write('You can take up the slightly advanced AI courses. This includes:'),nl,
  write('Machine Learning - CSE543'),nl,
  write('Image Analysis - CSE540'),nl,
  write('Deep Learning - CSE641'),nl,
  write('Artificial Intelligence - CSE643'),nl,
  write('Trustworthy AI systems - CSE660'),nl,
  write('Edge AI - CSE663'),nl,nl.

detail(aiadvanced) :-
  write('You can take up the highly advanced AI courses. This includes:'),nl,
  write('Machine Learning - CSE543'),nl,
  write('Topics in Software Engineering: AI in SE - CSE701'),nl,
  write('Deep Learning - CSE641'),nl,
  write('Artificial Intelligence - CSE643'),nl,
  write('Trustworthy AI systems - CSE660'),nl,
  write('Edge AI - CSE663'),nl,nl.

detail(databasic) :-
  write('You can take up the basic Data Science and Analytics courses. This includes:'),nl,
  write('Machine Learning - CSE543'),nl,
  write('Image Analysis - CSE540'),nl,
  write('Information Retrieval - CSE508'),nl,
  write('Big Data Analytics - CSE510A'),nl,
  write('Database system Implementation - CSE507'),nl,
  write('Data Mining - CSE506'),nl,nl.

detail(datamixed) :-
  write('You can take up the slightly advanced Data Science and Analytics courses. This includes:'),nl,
  write('Machine Learning - CSE543'),nl,
  write('Collaborative Filtering - CSE640'),nl,
  write('Data warehousing - CSE606'),nl,
  write('Natural Language Processing - CSE556'),nl,
  write('GPU Computing - CSE560'),nl,
  write('Probabilistic Graphical Models - CSE561'),nl,nl.

detail(dataadvanced) :-
  write('You can take up the highly advanced Data Science and Analytics courses. This includes:'),nl,
  write('Machine Learning - CSE543'),nl,
  write('Collaborative Filtering - CSE640'),nl,
  write('Data warehousing - CSE606'),nl,
  write('Mining Large Networks - CSE559'),nl,
  write('Semantic Web - CSE632'),nl,
  write('Probabilistic Graphical Models - CSE561'),nl,nl.

detail(infosecbasic) :-
  write('You can take up the basic Information Security courses. This includes:'),nl,
  write('Secure Coding - CSE500'),nl,
  write('Theory of Modern Cryptography - CSE524'),nl,
  write('Foundations of Conputer Security - CSE545'),nl,
  write('Applied Cryptography - CSE546'),nl,
  write('Security Engineering - CSE552'),nl,
  write('Internet Security and Privacy - CSE5xx'),nl,nl.

detail(infosecmixed) :-
  write('You can take up the slightly advanced Information Security courses. This includes:'),nl,
  write('Secure Coding - CSE500'),nl,
  write('Topics in Computer Security - CSE694A'),nl,
  write('Foundations of Conputer Security - CSE545'),nl,
  write('Applied Cryptography - CSE546'),nl,
  write('Privacy and Security in Online Social Media - CSE648'),nl,
  write('Digital and Cyber Forensics - CSE645'),nl,nl.

detail(infosecadvanced) :-
  write('You can take up the highly advanced Information Security courses. This includes:'),nl,
  write('Network Security - CSE550'),nl,
  write('Topics in Computer Security - CSE694A'),nl,
  write('Foundations of Conputer Security - CSE545'),nl,
  write('Network Anonymity and Privacy - CSE749'),nl,
  write('Privacy and Security in Online Social Media - CSE648'),nl,
  write('Ethical Hacking - CSE798A'),nl,nl.

detail(mobcompmixed) :-
  write('You can take up these Mobile Computing courses which include:'),nl,
  write('Network Security - CSE550'),nl,
  write('Distributed Systems Security - CSE530'),nl,
  write('Embedded Systems - CSE537'),nl,
  write('Cellular Data Networks - CSE539'),nl,
  write('Introduciton to Spatial Computing - CSE555'),nl,
  write('Mobile Computing - CSE535'),nl,nl.

detail(mobcompadv) :-
  write('You can take up these advanced Mobile Computing courses which include:'),nl,
  write('Smart sensing for Internet of Things - CSE576'),nl,
  write('Advanced Topics in Mobile Computing - CSE734'),nl,
  write('Embedded Systems - CSE537'),nl,
  write('Programming Cloud Services for Mobile Applications - CE635'),nl,
  write('Mobile and Cellular Network Security - CSE647'),nl,
  write('Mobile Computing - CSE535'),nl,nl.

detail(netwmixed) :-
  write('One of the good options for General degree with no specialization'),nl,
  write('You can take up these Networking based courses which include:'),nl,
  write('Network Security - CSE550'),nl,
  write('Wireless Networks - CSE538'),nl,
  write('Communication Networks - CSE636'),nl,
  write('Cellular Data Networks - CSE539'),nl,
  write('Ad Hoc Wireless Networks - CSE5xx'),nl,
  write('Network Science - CSE655'),nl,nl.

detail(netwadvanced) :-
  write('One of the good options for General degree with no specialization'),nl,
  write('You can take up these advanced Networking based courses which include:'),nl,
  write('Networks and System Security II - CSE550'),nl,
  write('Wireless Networks - CSE538'),nl,
  write('Communication Networks - CSE636'),nl,
  write('Cellular Data Networks - CSE539'),nl,
  write('Network Anonymity and Privacy - CSE749'),nl,
  write('Network Science - CSE655'),nl,nl.

detail(sdevbasic) :-
  write('One of the good options for General degree with no specialization'),nl,
  write('You can take up these sofware development based courses which include:'),nl,
  write('Software defined networking - CSE565'),nl,
  write('Software Production Evolution and Maintenance - CSE582'),nl,
  write('Software Development using Open Source - CSE583'),nl,
  write('Foundations of Parallel Programming - CSE502'),nl,
  write('Program Verification - CSE584'),nl,nl.

detail(sdevadvanced) :-
  write('One of the good options for General degree with no specialization'),nl,
  write('You can take up these sofware development based courses which include:'),nl,
  write('Software defined networking - CSE565'),nl,
  write('Software Production Evolution and Maintenance - CSE582'),nl,
  write('Software Development using Open Source - CSE583'),nl,
  write('Topics in Software Engineering: AI in SE - CSE701'),nl,
  write('Program Verification - CSE584'),nl,nl.

detail(gamedevcomm) :-
  write('One of the good options for General degree with no specialization and may also include open electives'),nl,
  write('You can take up these Game development and Graphic Designing based courses which include:'),nl,
  write('Multi-Agent Systems - CSE531'),nl,
  write('Game Design and Development - DES512'),nl,
  write('Introduction to 3D Production Design for Animation and Games - DES516'),nl,
  write('Introduction to Motion Graphics - DES518'),nl,
  write('Computer Graphics - CSE533'),nl,nl.

detail(webdevcomm) :-
  write('One of the good options for General degree with no specialization'),nl,
  write('You can take up these Web development based courses which include:'),nl,
  write('Semantic Web - CSE632'),nl,
  write('Network Science - CSE655'),nl,
  write('Students can take up online courses as Independent Study from some Faculty such as:'),nl,
  write('Web Designing'),nl,
  write('Introduction to WordPress'),nl,
  write('Essentials of Responsive Web Designing'),nl,
  write('UI and Web Design Tutorial'),nl,nl.


/*The messages to be displayed for each project option based on student input*/

describe_project(optresearch) :-
  write('You have a strong inclination towards full-fledged research.'),nl,
  write('For this you need to complete atleast 32 credits of course work for a 16 credit thesis.'),nl,nl.

describe_project(optindustry) :-
  write('You have a strong inclination towards opting for industry based projects.'),nl,
  write('In this case there are two options:'),nl,
  write('A 4 credit capstone project with 44 credits of coursework'),nl,
  write('An 8 credit capstone project with 40 credits of coursework'),nl,
  write('If you have a specialization then try to take up the capstone project based on your specialization, else you can also take one based on the field of your interest'),nl,nl.

describe_project(optscholarly) :-
  write('You have a strong inclination towards analysing and comprehending the work done behind the topic that interests you along with impeccable desire for reporting and documentation.'),nl,
  write('In this case there are two options:'),nl,
  write('A 4 credit scholarly paper work with 44 credits of coursework'),nl,
  write('An 8 credit scholarly paper work with 40 credits of coursework'),nl,nl.

describe_project(optcourse) :-
  write('You have chosen the option of completing degree without Thesis/Capstone/Scholarly Paper'),nl,
  write('In this case you have to complete a total of 48 credits of coursework'),nl,nl.


/*The messages to be displayed for each bucket course (one from each of the 3 buckets - theory, systems and software) based on student input*/

describe_theory(alggrad) :-
  write('For the theory bucket, \"Introduction to Graduate Algorithms - CSE525\" is the right choice for you.'),nl,nl.

describe_theory(madlag) :-
  write('For the theory bucket, \"Modern Algorithm Design - CSE519\" is the right choice for you.'),nl,nl.

describe_theory(ralg) :-
  write('For the theory bucket, \"Randomized Algorithms - CSE523\" is the right choice for you.'),nl,nl.



describe_system(archi) :-
  write('For the systems bucket, \"Computer Architecture - CSE511\" is the right choice for you.'),nl,nl.

describe_system(mob) :-
  write('For the systems bucket, \"Mobile Compting - CSE535\" is the right choice for you.'),nl,nl.

describe_system(wirnet) :-
  write('For the systems bucket, \"Wireless Networks - CSE638\" is the right choice for you.'),nl,nl.



describe_software(programaly) :-
  write('For the software bucket, \"Program Analysis - CSE503\" is the right choice for you.'),nl,nl.

describe_software(retrinf) :-
  write('For the software bucket, \"Information Retrieval - CSE508\" is the right choice for you.'),nl,nl.

describe_software(compiprog) :-
  write('For the software bucket, \"Compiler - CSE601\" is the right choice for you.'),nl,nl.


/*The messages to be displayed for the open elective types based on student input*/

describe_openelec(healthmed) :-
  write('You can take from the following open electives for your interest:'),nl,
  write('Biomedical Image Processing - BIO524'),nl,
  write('Machine Learning for Biomedical Applications - CSE542'),nl,
  write('Computing for Medicine - CSE585'),nl,
  write('Computer Aided Drug Design - CSE561'),nl,nl.

describe_openelec(designing) :-
  write('You can take from the following open electives for your interest:'),nl,
  write('Designing Human Centered Systems - CSE501'),nl,
  write('Game Design and Development - DES512'),nl,
  write('Design of Interactive Systems - DES519'),nl,
  write('Introduction to 3D Production Design for Animation and Games - DES516'),nl,nl.

describe_openelec(financial) :-
  write('You can take from the following few open electives for your interest:'),nl,
  write('The course ID at 200s/300s/400s can only be taken for 8 credits / two 4 credit courses'),nl,
  write('Foundations of Finance - ECO331'),nl,
  write('Macroeconomics - ECO201'),nl,
  write('Microeconomics - ECO301'),nl,
  write('Valuation and Portfolio Management - ECO332'),nl,nl.

describe_openelec(technosoc) :-
  write('You can take from the following few open electives for your interest:'),nl,
  write('The course ID at 200s/300s/400s can only be taken for 8 credits / two 4 credit courses'),nl,
  write('Information Technology and Society - SOC207'),nl,
  write('Science, Technology and Society - SOC211'),nl,
  write('Technology and the Future of Work - SOC512'),nl,
  write('Philosophy of Technology - SSH3PT'),nl,nl.

describe_openelec(entrepreneural) :-
  write('You can take from the following few open electives for your interest:'),nl,
  write('The course ID at 200s/300s/400s can only be taken for 8 credits / two 4 credit courses'),nl,
  write('Entrepreneurial Communication - ENT411'),nl,
  write('Entrepreneurial Khichadi - ENT412'),nl,
  write('Entrepreneurial Finance - ENT413'),nl,
  write('Healthcare Innovation and Entrepreneuriship Essentials - ENT421'),nl,nl.


/*Call to built-in dynamic for the advisory system*/


:- dynamic(answered/2).

/*Retracts all the options chosen for each question and resets the advisory system for a new set of inputs*/

reset_sys :-
    retractall(answered(_,_)).
reset_sys.


/*Different questions asked to the student to give them advice on the electives one can choose*/

question(field) :-
    write('In which computer science field are you interested in ?'),nl.

question(gparange) :-
    write('In which range does your GPA fall under ? (Select \'Not Applicable\' if you have not completed atleast one semester in this degree)'),nl.

question(test_position) :-
    write('What was the position that you acquired in your MTech Admission test result ? (Select \'Not Applicable\' if you have completed atleast one semester in this degree)'),nl.

question(research_or_industry) :-
    write('Please select your preference in terms of research or industry'),nl.

question(theory_bucket) :-
    write('In terms of Algorithm design, choose your preference from the following options:'),nl.

question(system_bucket) :-
    write('Which system do you want to work with ?'),nl.

question(software_bucket) :-
    write('Which type of software knowledge do you want to gain ?'),nl.

question(type_industry) :-
    write('Which type of type of industry would you like to learn and perhaps work in the future ?'),nl.

/*Option for Question 1*/

option(ai) :- write('Artificial Intelligence - AI').
option(data) :- write('Data Science and Analytics').
option(inforsys) :- write('Information Security').
option(mobcomp) :- write('Mobile Computing').
option(netw) :- write('Networking').
option(sdev) :- write('Software Development and Testing').
option(gamedev) :- write('Game Development and Graphic Designing').
option(webdev) :- write('Web Development').

/*Option for Question 2*/

option(lowgpa) :- write('6 to 8 cgpa').
option(medgpa) :- write('8 to 9 cgpa').
option(highgpa) :- write('9 to 10 cgpa').
option(nagpa) :- write('Not Applicable').

/*Option for Question 3*/

option(toppos) :- write('1st to 20th position in admission result').
option(midpos) :- write('21st to 60th position in admission result').
option(bottompos) :- write('61st to 100th position in admission result').
option(napos) :- write('Not Applicable').

/*Option for Question 4*/

option(research) :- write('I want to into research and perhaps do a PhD').
option(industry) :- write('I want to acquire skills and gain experience throigh projects for industry based career').
option(docm) :- write('I like learning about different technologies and the work that goes behind it and love to write a paper on it, like some documentation instead of a full-fledged project').
option(coursework) :- write('I would rather like to do all course-work to gain my mtech degree').

/*Option for Question 5*/

option(gradalgo) :- write('After learning Data Structures and Algorithms, I want to learn advanced form of algorithmic concepts that will help me design better optimised algorithm solutions for my interviews and future job').
option(modernalgo) :- write('After DSA, I want to now learn and understand algorithms that solve problems of various disciplines by utilising modern tools').
option(randalgo) :- write('I want to learn algorithms that deal with probabilistic events, by analysing a given input distribution and hence be able to design algorithms with provable bounds').

/*Option for Question 6*/

option(comparch) :- write('I want to learn about the architecture of computer systems and how the programs run internally in computer systems').
option(mobile) :- write('I want to learn a new skill that is relevant for the tech industry and requires the knowledge of android programming and mobile functionalities, features, internal architecture, security and permissions').
option(network) :- write('Related to the field of networking, I want to delve deeper into the concept of wireless networks and understand their architecture and application').

/*Option for Question 7*/

option(progaly) :- write('I like to analyse and understand programs which is an advancement of DSA and Advanced Programming courses and implement dataflow analysis and flow-sensitive inter-procedural analysis').
option(inforet) :- write('I like to dive deep into the methods by which we can retrieve information using different algorithms and hence utilising the resultant retrieved data or information for making data-driven decisions and providing accurate services').
option(compiler) :- write('I like to learn how a normal program in any language is compiled by machines to be able to compute and give ouput or result in some machine action by being able to parse the different elements in a program for the correct computation using grammar and hence be able to build programming languages through compiler knowledge').

/*Option for Question 8*/

option(health) :- write('Healthcare Industry').
option(design) :- write('Design Industry').
option(finance) :- write('Finance based Industry').
option(sociotech) :- write('Technology for Social Cause').
option(entrep) :- write('Entrepreneurship').


/*Combining the questions with their corresponding questions*/

field(Answer) :-
    answered(field,Answer),!.
field(Answer) :-
    \+ answered(field,_),
    ask(field, Answer, [ai,data,inforsys,mobcomp,netw,sdev,gamedev,webdev]).

gparange(Answer) :-
    answered(gparange,Answer),!.
gparange(Answer) :-
    \+ answered(gparange,_),
    ask(gparange, Answer, [lowgpa,medgpa,highgpa,nagpa]).

test_position(Answer) :-
    answered(test_position,Answer),!.
test_position(Answer) :-
    \+ answered(test_position,_),
    ask(test_position, Answer, [toppos,midpos,bottompos,napos]).

research_or_industry(Answer) :-
    answered(research_or_industry,Answer),!.
research_or_industry(Answer) :-
    \+ answered(research_or_industry,_),
    ask(research_or_industry, Answer, [research,industry,docm,coursework]).

theory_bucket(Answer) :-
    answered(theory_bucket,Answer),!.
theory_bucket(Answer) :-
    \+ answered(theory_bucket,_),
    ask(theory_bucket, Answer, [gradalgo,modernalgo,randalgo]).

system_bucket(Answer) :-
    answered(system_bucket,Answer),!.
system_bucket(Answer) :-
    \+ answered(system_bucket,_),
    ask(system_bucket, Answer, [comparch,mobile,network]).

software_bucket(Answer) :-
    answered(software_bucket,Answer),!.
software_bucket(Answer) :-
    \+ answered(software_bucket,_),
    ask(software_bucket, Answer, [progaly,inforet,compiler]).

type_industry(Answer) :-
    answered(type_industry,Answer),!.
type_industry(Answer) :-
    \+ answered(type_industry,_),
    ask(type_industry, Answer, [health,design,finance,sociotech,entrep]).


/*Ask function in order to retrieve the options opted/selected by user for each question*/

ask(Question, Answer, Options) :-
	question(Question),
	generate_options(Options, 1),
	read(Index),
	find_option(Index, Options, Selection),
	asserta(answered(Question, Selection)),
	Selection = Answer.


/*Find Option utility element to find the correct option selected by the user/student*/

find_option(1, [Head|_] , Head).
find_option(Index, [_|Tail], Result) :-
	Nextindex is Index -1,
	find_option(Nextindex, Tail, Result).


/*Generating options for each question for the advisory system*/

generate_options([],_).
generate_options([Head|Tail], Index) :-
	write(Index), write(' '),
	option(Head), nl,
	Nextindex is Index +1,
	generate_options(Tail, Nextindex).























