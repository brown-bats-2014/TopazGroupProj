module Seed
  # Create Users
  def self.populate
    10.times do
      User.create(email: Faker::Internet.email, password_hash: Faker::Internet.password(8))
    end

    # Create Surveys
    5.times do
      User.all.each do |user|
        user.surveys.create(name: Faker::Lorem.word , description: Faker::Lorem.sentence(3, true, 4))
      end
    end

    # Create Questions
    5.times do
      Survey.all.each do |survey|
        survey.questions.create(content: Faker::Lorem.sentence(3, true, 4))
      end
    end

    # Possible (Answer) Choices
    5.times do
      Question.all.each do |question|
        question.choices.create(content: Faker::Lorem.word)
      end
    end

    # Chosen Answers
    1250.times do
      Answer.create(user_id: User.all.sample.id, question_id: Question.all.sample.id, choice_id: Choice.all.sample.id)
    end
  end
end



