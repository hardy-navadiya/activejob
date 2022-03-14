class User < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :clip
	def self.import(file)
    xlsx = Roo::Excelx.new(file.tempfile)
    xlsx.each_row_streaming(offset: 1) do |row|
      user = self.new(id: row[0].value, name: row[1].value, email: row[2].value)
      next if self.pluck(:id).include?(user.id)
      user.save
    end
  end

  def self.to_csv
  	CSV.generate do |csv|
  		csv << column_names
  		all.each do |user|
  			csv << user.attributes.values_at(*column_names)
  		end
  	end
  end
end
