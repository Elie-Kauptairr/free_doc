# Créer des villes
city1 = City.create(name: "Paris")
city2 = City.create(name: "Lyon")
city3 = City.create(name: "Marseille")

# Créer des spécialités
specialty1 = Specialty.create(name: "Cardiologie")
specialty2 = Specialty.create(name: "Dermatologie")
specialty3 = Specialty.create(name: "Généraliste")

# Créer des docteurs et les associer à des villes et spécialités
doctor1 = Doctor.create(first_name: "Jean", last_name: "Dupond", city: city1)
doctor2 = Doctor.create(first_name: "Marie", last_name: "Curie", city: city2)
doctor3 = Doctor.create(first_name: "Albert", last_name: "Einstein", city: city3)

# Associer les docteurs à des spécialités
doctor1.specialties << specialty3  # Jean Dupond est Généraliste
doctor2.specialties << specialty2  # Marie Curie est Dermatologue
doctor3.specialties << specialty1  # Albert Einstein est Cardiologue
doctor3.specialties << specialty3  # Albert Einstein est aussi Généraliste

# Créer des patients et les associer à des villes
patient1 = Patient.create(first_name: "Alice", last_name: "Smith", city: city1)
patient2 = Patient.create(first_name: "Bob", last_name: "Johnson", city: city2)
patient3 = Patient.create(first_name: "Charlie", last_name: "Brown", city: city3)

# Créer des rendez-vous et les associer aux docteurs, patients et villes
Appointment.create(date: DateTime.now, doctor: doctor1, patient: patient1, city: city1)
Appointment.create(date: DateTime.now + 1.day, doctor: doctor2, patient: patient2, city: city2)
Appointment.create(date: DateTime.now + 2.days, doctor: doctor3, patient: patient3, city: city3)
Appointment.create(date: DateTime.now + 3.days, doctor: doctor1, patient: patient3, city: city1)
Appointment.create(date: DateTime.now + 4.days, doctor: doctor2, patient: patient1, city: city2)
