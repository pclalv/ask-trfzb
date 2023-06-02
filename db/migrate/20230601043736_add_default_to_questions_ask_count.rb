class AddDefaultToQuestionsAskCount < ActiveRecord::Migration[7.0]
    def change
        change_column_default :questions, :ask_count, 0
  end
end