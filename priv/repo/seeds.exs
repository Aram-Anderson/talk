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

alias Talk.{User, Repo, Question, UserResponse}

names = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
"q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

questions = ["Do you believe there is a life after death?", "How often do you pray?", "The United States Supreme Court has ruled that no state or local government may require the reading of the Lord's prayer or Bible verses in public schools. What are your views on this: do you approve or disapprove of the court ruling?", "On the average African Americans have worse jobs, income, and housing than white people. Do you think these differences mainly due to discrimination?", "On the average African Americans have worse jobs, income, and housing than white people. Do you think these differences are because most African Americans have less in-born ability to learn?", "On the average African Americans have worse jobs, income, and housing than white people. Do you think  these differences are because most African Americans don't have the chance for education that it takes to rise out of poverty?", "On the average African Americans have worse jobs, income, and housing than white people. Do you think  these differences are because most African Americans just don't have the motivation or will power to pull themselves up out of poverty?", "If your party nominated a African American for President, would you vote for him or her if he or she were qualified for the job?", "How strong would you say your religious beliefs are?", "Do you think it should be possible for a pregnant woman to obtain a legal abortion if the woman wants it for any reason?", "Do you think it should be possible for a pregnant woman to obtain a legal abortion if the woman's own health is seriously endangered by the pregnancy?", "Do you think affirmative action is a good idea?", "How often do you attend religious services?", "Do you believe the Bible is the word of God?", "Have conditions for African Americans improved?", "In general, do you favor or oppose the busing of African American and white school children from one school district to another?", "Do you favor or oppose the death penalty for persons convicted of murder?", "On a scale of 1-5, 1 being lowest and 5 being highest, what socio-economic class would you say you are in?", "There are always some people whose ideas are considered bad or dangerous by other people. For instance, somebody who is agianst all churches and religion... Should such a person be allowed to teach in a college or university?", "Suppose a communist is teaching in a college. Should he or she be fired?", "Should a homosexual be allowed to teach in a college or university?", "Should someone who is openly racist be allowed to teach in a college or university?"]

gender = ["male", "female", "non-binary"]

Enum.each 0..10, fn(num) ->
  first_name = Faker.Name.first_name
  last_name = Faker.Name.last_name
  user_params = (%{uid: Faker.Code.isbn10, bio: Faker.Lorem.Shakespeare.as_you_like_it, token: Faker.Code.iban, email: Faker.Internet.email, gender: Enum.random(gender), fb_image_url: "http://i.pravatar.cc/300?u=#{Enum.random(names)}#{Enum.random(1..9999)}", provider: "facebook", first_name: first_name, last_name: last_name, full_name: "#{first_name} #{last_name}"})
  changeset = User.changeset(%User{}, user_params)
  Repo.insert!(changeset)
end

Enum.each questions, fn(question) ->
  changeset = Question.changeset(%Question{}, %{content: question})
  Repo.insert!(changeset)
end

Enum.each 1..11, fn(user_id) ->
    Enum.each 1..22, fn(question_id) ->
    question = Repo.get(Question, question_id)
    changeset = question
    |> Ecto.build_assoc(:user_responses, user_id: user_id)
    |> UserResponse.changeset(%{answer: Enum.random(1..10)})
    Repo.insert(changeset)
  end
end
