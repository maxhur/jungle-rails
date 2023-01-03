class Authenticate_with_credentials
  def self.authenticate_with_credentials(input)
    # eliminates any spaces before and after an email
    newinput = input.strip


    # converts all letters to a lowercase
    newinput.downcase
  end
end
