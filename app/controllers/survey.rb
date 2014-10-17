get '/survey/new' do
  @survey = Survey.new
  erb :survey_form, layout: false
end

post '/survey/new' do
  redirect_to_login
  puts params
  @survey = current_user.surveys.create(params)
  unless @survey.id.nil?
    redirect ("/survey/#{@survey.id}")
  else
    flash[:notice] = "Did not enter valid survey information"
    redirect ('/survey/new')
  end
end

get '/survey/edit/:id' do
  @survey = Survey.find(params[:id])
  erb :survey_form
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end
