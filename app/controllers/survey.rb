get '/survey/new' do
  @survey = session[:last_entry] if session[:last_entry]
  sesion[:last_entry] = nil
  erb :_newsurvey
end

post '/survey/new' do
  @survey = Survey.create(id: params[:id], name: params[:name], description: params[:description])
  if @survey.save
    redirect ('survey/new/:id')
  else
    flash[:notice] = "Did not enter valid survey information"
    redirect ('survey/new')
  end
end

get '/survey/new/:id' do
  erb :_create_survey
end

post '/survey/new/:id' do
  @survey = Survey.find(params[:id])

end