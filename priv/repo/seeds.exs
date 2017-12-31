# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Talk.Repo.insert!(%Talk.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.
alias Talk.User
alias Talk.Repo
names = ["aaran", "aaren", "aarez", "aarman", "aaron", "aaron-James", "aarron", "aaryan", "aaryn", "aayan", "aazaan", "abaan", "abbas", "abdallah", "abdalroof", "abdihakim", "abdirahman", "abdisalam", "abdul", "abdul-aziz", "abdulbasir", "abdulkadir", "abdulkarem", "abdulkhader", "abdullah", "abdul-majeed", "abdulmalik", "abdul-rehman", "abdur", "abdurraheem", "abdur-rahman", "abdur-rehmaan", "abel", "abhinav", "abhisumant", "abid", "abir", "abraham", "abu", "abubakar", "ace", "adain", "adam", "adam-james", "addison", "addisson", "adegbola", "adegbolahan", "aden", "adenn", "adie", "adil", "aditya", "adnan", "adrian", "adrien", "aedan", "aedin", "aedyn", "aeron", "afonso", "ahmad", "ahmed", "ahmed-aziz", "ahoua", "ahtasham", "aiadan", "aidan", "aiden", "aiden-jack", "aiden-vee", "aidian", "aidy", "ailin", "aiman", "ainsley", "ainslie", "airen", "airidas", "airlie", "aj", "ajay", "a-jay", "ajayraj", "akan", "akram", "al", "ala"]

gender = ["male", "female", "non-binary"]

Enum.each 0..10, fn(num) ->
  first_name = Faker.Name.first_name
  last_name = Faker.Name.last_name
  user_params = (%{uid: Faker.Code.isbn10, bio: Faker.Lorem.Shakespeare.as_you_like_it, token: Faker.Code.iban, email: Faker.Internet.email, gender: Enum.random(gender), fb_image_url: Faker.Avatar.image_url(Enum.random(names), 200, 200), provider: "facebook", first_name: first_name, last_name: last_name, full_name: "#{first_name} #{last_name}"})
  changeset = User.changeset(%User{}, user_params)
  Repo.insert!(changeset)
end
