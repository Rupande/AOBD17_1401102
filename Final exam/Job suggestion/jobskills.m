clear all
load jobskills

X = skills_mat(1:100,1:1000);        %taking skills of 400 users as features
y = job_mat(1:100,1:500);           %corresponding job titles(in work experience)

xn = skills_mat(600,1:1000);         %test user
yn = job_mat(600,1:500);            %job titles in their work experience

sz = size(yn);
for i = 1:sz(2)                      %iterating over all job titles
    model = fitcknn(X,y(:,i));          %knn binary classifier
    z(i) = predict(model,xn);           %predict binary value for each job title
end
%%
zn = yn;                                %true binary values for each job title
predicted_jobs = find(z == 1);          %indices of predicted jobs
done_jobs = find(zn == 1);              %indices of jobs in work ex
recommended_jobs = [];                  %to be filled with indices of jobs in predicted jobs but not in work ex
for i = 1:length(predicted_jobs)
    flag = 0;                          
    for j = 1:length(done_jobs)
        if predicted_jobs(i) == done_jobs(j)
            flag = 1;
        end
    end
    if flag == 0
        recommended_jobs = [recommended_jobs,predicted_jobs(i)];
    end
end
%%
recommended_skills = zeros(length(recommended_jobs),3); %to be filled with indices of predicted skills not in existing skill-set of candidate
has_skills = find(xn == 1); %indices of sills in candidate's skill-set
for k = 1:length(recommended_jobs)
    clear reference_persons predicted_skills rec_skills flag;
    reference_persons = find(job_mat(:,recommended_jobs(k)) == 1);  %candidates with jobs reccommended to user
    predicted_skills = find(skills_mat(reference_persons,:) == 1);  %all skills of all of these candidates
    rec_skills = [];                        %skills in predicted but not in candidate's skill-set
    for i = 1:length(predicted_skills)
        flag = 0;
        for j = 1:length(has_skills)
            if predicted_skills(i) == has_skills(j)
                flag = 1;
            end
        end
        if flag == 0
            rec_skills = [rec_skills,predicted_skills(i)];
        end
    end
    if length(rec_skills) <= 3
        rec_skills = [rec_skills,zeros(1,3-length(rec_skills))];
    end
    rec_skills = rec_skills(1:3);               %taking maximum 3 recommended skills for each recommended job
    recommended_skills(k,:) = rec_skills;
end

% X = [X;xn];         %incrementing training data
% y = [y;yn];         %incrementing labels