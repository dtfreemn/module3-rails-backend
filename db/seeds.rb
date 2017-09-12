User.destroy_all
Question.destroy_all
Reply.destroy_all
Like.destroy_all

user_1 = User.create(name: "Tim", email: "tim.freeman@flatironschool.com")
user_2 = User.create(name: "Gabi", email: "gabriela.ferrara@flatironschool.com")

question_1 = Question.create(questioner: user_1, title: "First question?", content: "Content of the first question.")
question_2 = Question.create(questioner: user_1, title: "Second question?", content: "Content of the second question.")
question_3 = Question.create(questioner: user_2, title: "Third question?", content: "Content of the third question.")

reply_1 = Reply.create(replier: user_2, question: question_1, title: "Proven wrong", content: "You can do X instead")
reply_2 = Reply.create(replier: user_1, question: question_3, title: "Syntactic Sugar", content: "ES6 classes are syntactic sugar for JS")

like_1 = Like.create(user: user_1, reply: reply_1)
like_2 = Like.create(user: user_2, reply: reply_2, positive: false)
