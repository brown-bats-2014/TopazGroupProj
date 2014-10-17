get '/survey/:id/question_new' do
  redirect_to_login
  survey = Survey.find(params[:id])
  check_ownership(survey)
  @question = survey.questions.new
  erb :question_form
end

get '/survey/:sid/question_edit/:qid' do
  redirect_to_login
  @question = Question.find(params[:qid])
  check_ownership @question.survey
  erb :question_form
end


get '/survey/:sid/question/:qid' do
  redirect_to_login
  erb :question, layout: false
end

post '/survey/:id/question' do
  redirect_to_login
  survey = Survey.find(params[:id])
  check_ownership survey
  q = survey.questions.create(params)
  if q.id.nil?
    redirect "/survey/#{params[:id]}" unless request.xhr?
    status 422

  else
    redirect "/survey/#{params[:id]}" unless request.xhr?
  end
end

put '/survey/:sid/question/:qid' do
  redirect_to_login
  q = Question.find(params[:qid])
  if q.nil?
    status 422
    redirect "/survey/#{params[:sid]}" unless request.xhr?
  else
    check_ownership q.survey
    q.content = params[:content]
    if q.save
      redirect "/survey/#{params[:sid]}" unless request.xhr?
    else
      redirect "/survey/#{params[:sid]}" unless request.xhr?
    end
  end
end

delete '/survey/:sid/question/:qid' do
  redirect_to_login
  q = Question.find(params[:qid])
  check_ownership
  q.delete
  redirect "/survey/#{params[:sid]}" unless request.xhr?
end
