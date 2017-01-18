class AddCompanyLogoToJob < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :logo, :string
  end
end
