class AddDetailsToResume < ActiveRecord::Migration[5.0]
  def change
  	add_column :resumes, :content, :text
  	add_column :resumes, :job_id, :integer
  	add_column :resumes, :user_id, :integer
  	add_column :resumes, :attachment, :string
  end
end
