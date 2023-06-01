# frozen_string_literal: true

class QuestionsController < ApplicationController
    DEFAULT_QUESTION = 'What is "Pride and Prejudice" about?'
    def index
        render locals: {
            question: DEFAULT_QUESTION
        }
    end

    def create
        question = params[:question].strip
        question += '?' unless question.ends_with?('?')

        previously_asked_question = Question.find_one(question: question)

        if previously_asked_question
            previously_asked_question.ask_count += 1
            previously_asked_question.save!
            render json: { question: previously_asked_question.question, answer: previously_asked_question.answer, id: previously_asked_question.id }
            return
        end

        answer, context = OpenAI.answer_question(question)

        question_record = Question.create!(question: question, answer: answer, context: context)

        render json: { question: question, answer: answer, id: question_record.id }
    end
end
