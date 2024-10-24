# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Commentaires perso : 

les étapes que j'ai faites et les commandes que j'ai utilisé pour faire le projet du jour : 

1 : création du fichier : rails new free_doc 

2 : bundle install 

3 : config de la base de données : rails db:create 

4 : création du modèle Doctor : rails g model Doctor first_name:string last_name:string specialty:string zip_code:string

5 : création du modèle Patient : rails g model Patient first_name:string laste_name:string 

6 : création du modèle Appointment : rails g model Appointment date:datetime doctor:references patient:references 

En gros, l'utilisation du doctor.references et du patient.references permet de lier chaque RDV à un doc et à un patient 

7: vérification et exécution des migrations : les fichiers ont bien été créés dans db/migrate donc exécution des migrations avec : rails db:migrate

8 : migrations réussies, création des relations dans les modèles, modification du fichier doctor.rb avec has_many

9 : modification du fichier patient.rb pour inclure les relations avec has_many

10 : définition des relations dans le fichier appointments.rb avec belongs_to 

11 : test des relations depuis la console. Avec création d'objets pour voir si les liens se font correctement entre Doctor/Patient/Appointment 
avec : # Créer un docteur
doctor1 = Doctor.create(first_name: "Jean", last_name: "Dupond", specialty: "Généraliste", zip_code: "67000")

# Créer un patient
patient1 = Patient.create(first_name: "Jean", last_name: "Luc")

12 : création du RDV avec : 
appointment1 = Appointment.create(date: DateTime.now, doctor: doctor1, patient: patient1)  // utilisation du DateTime.now pour avoir la date actuelle 

13 : test des relations suite à la création des objets avec : doctor1.patients pour obtenir les patients d'un docteur 

14 : patient1.doctors pour obtenir les docteurs d'un patient 

15 : vérif qu'un RDV a bien été lié entre un doc et un patient avec : appointment1.doctor (renvoie le docteur du RDV) et appointment1.patient (renvoie le patient du RDV)

16 : création du fichier seeds.rb pour avoir une base de données en exemple pour pouvoir tester l'appli. Commentaires explicatifs dans le fichier seeds.rb

17 : exécution du fichier seeds.rb avec Doctor.all / Patient.all / Appointment.all et ça nous affiche les différentes listes. 

18 : Ajout de city avec : rails g model City name:string  Cela va créer un modèle city avec un champ name pour stocker le nom de la ville. 

19 : migration pour ajouter city_id au modèle Doctor avec rails g migration AddCityToDoctors city:references 
ça va nous ajouter une colonne city_id dans la table doctors et lier chaque docteur  à une ville. 

20: pareil pour patient avec le même type de commande sauf qu'on remplace doctors par patients : 
rails g migration AddCityToPatients city:references

21 : et enfin pareil pour les RDV avec appointments : 
rails g migration AddCityToAppointments city:references

22 : modification de city.rb ou on créé les relations entre toutes les variables doc/pat/app/city
Une ville peut avoir plusieurs docteurs, patients, et rendez-vous.

23 : modifications des dossiers Doctor/Patient/Appointment avec belongs_to :city 

24 : modifications des null: false en null: true dans les dossiers db/migrate/ patients, doctors, appointements comme solution temporaire pour permettre à la migration de passer sans problème. 

25 : on réexecute les migrations pour que les nouvelles colonnes soient ajoutées à la base de données. 

26 : MAJ du seed, ou on ajoute des lignes de city 

27 : la j'ai eu pleins de trucs bizarres j'ai r capté bordel et mercé CHATGPT ptn de ses morts 

28 : test dans la console rails avec doctor.all pour vérifier les docs

29 : test pour vérifier les spécialités d'un doc avec doctor1 = Doctor.first doctor.specialties 

30 : vérif des RDV d'un doc avec doctor1.appointments

31 : vérif des patients d'une ville avec city1 = City.first
city1.patients
