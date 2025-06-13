class Student: 
    def __init__(self, name, roll, marks):
        self.name = name
        self.roll = roll
        self.marks = marks
        
    def calculate_cgpa(self):
        return round(sum(self.marks)/len(self.marks)/10,2)
    
    def display(self):
        print(f"{self.name} - CGPA: {self>calculate_cgpa()}")    