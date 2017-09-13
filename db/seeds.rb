Like.destroy_all
Reply.destroy_all
Question.destroy_all
User.destroy_all

user_1 = User.create(name: "Tim", email: "tim.freeman@flatironschool.com")
user_2 = User.create(name: "Gabi", email: "gabriela.ferrara@flatironschool.com")

question_1 = Question.create(questioner: user_1, title: "First question?", content: "Content of the first question.")
question_2 = Question.create(questioner: user_1, title: "Second question?", content: "Content of the second question.")
question_3 = Question.create(questioner: user_2, title: "Third question?", content: "Content of the third question.")

reply_1 = Reply.create(replier: user_2, question: question_1, title: "Proven wrong", content: "You can do X instead")
reply_2 = Reply.create(replier: user_1, question: question_3, title: "Syntactic Sugar", content: "ES6 classes are syntactic sugar for JS")
reply_3 = Reply.create(replier: user_1, question: question_2, title: "When is the next test?", content: "In 3 weeks")
reply_4 = Reply.create(replier: user_2, question: question_2, title: "How long is the bootcamp?", content: "15 weeks")

like_1 = Like.create(user: user_1, reply: reply_1)
like_2 = Like.create(user: user_2, reply: reply_2, point: -1)
like_3 = Like.create(user: user_1, reply: reply_3, point: -1)
like_4 = Like.create(user: user_2, reply: reply_4, point: -1)
like_5 = Like.create(user: user_1, reply: reply_4)
like_6 = Like.create(user: user_2, reply: reply_4)
like_7 = Like.create(user: user_1, reply: reply_2, point: -1)
like_8 = Like.create(user: user_2, reply: reply_1, point: -1)

