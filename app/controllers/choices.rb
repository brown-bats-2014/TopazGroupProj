post '/survey/questions/:qid/choices' do
  redirect_to_login
  q = Question.find(params[:qid])
  check_ownership q.survey
  choice = q.choices.create(params[:content])
  if choice.id.nil?
    flash[:notice] = "Can't be blank."
    redirect "/survey/questions/#{q.id}/choices/new"
  else
    redirect "/survey/#{q.survey.id}/questions/#{q.id}"
  end
end

put '/survey/questions/:qid/choices' do
  redirect_to_login
  choice = Choice.find(params[:id])
  check_ownership choice.question.survey
  choice.content = params[:content]
  if choice.save
    redirect "/survey/questions/#{choice.question.id}"
  else
    flash[:notice] = "Can't be blank."
    redirect "/survey/questions/#{q.id}/choices/new"
  end
end

get '/survey/questions/:qid/choices/new' do
  @choice = Question.find(params[:qid]).choices.new
  erb :choice_form
end

get '/survey/questions/:qid/choices/:id/edit' do
  @choice = Choice.find(params[:id])
  erb :choice_form
end
