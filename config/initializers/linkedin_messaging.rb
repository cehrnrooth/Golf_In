LinkedIn::Client.class_eval do
# options should be a hash like this:
# options = {:recipients => {:values => [:person => {:_path => "/people/~" }, :person =>   {:_path => "/people/USER_ID"} ]}, :subject => "Something",:body => "To read" }
  def send_message(options)
    path = "/people/~/mailbox"
    post(path, options.to_json, "Content-Type" => "application/json")
  end
end