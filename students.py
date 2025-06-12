s1 = Student("Asha", "EC101", [85,78,90,88,76,80])
s2 = Student("Ravi", "EC102", [92,81,85,79,88,90])

cgpa1= s1.calculate_cgpa()
cgpa2= s2.calculate_cgpa()

if cgpa1> cgpa2:
    print("Asha has higher CGPA")
elif cgpa2>cgpa1:
    print("Ravi hashigher CGPA")
else:
    print("Both have same CGPA")    
    