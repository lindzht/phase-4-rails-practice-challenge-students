class ErrorMessageSerializer < ActiveModel::Serializer
  # attributes :id

  def self.errors (errors)
    errors.map do |error|
      "#{error.attribute} #{error.message}"
    end

  end



end
