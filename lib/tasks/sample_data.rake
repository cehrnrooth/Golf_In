namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_courses
  end
end

def make_courses
  #admin = User.create!(name:     "Example User",
  #                     email:    "example@railstutorial.org",
  #                     password: "foobar",
  #                     password_confirmation: "foobar")
  #admin.toggle!(:admin)
  
  course_list = [
  ['Blackhawk Country Club - Lakeside Course',
  18,
  6835,
  72,
  'Private',
  '599 Blackhawk Club Dr',
  'Danville',
  'CA',
  '94506-4522',
  9257366550],

  ['Blackhawk Country Club - The Falls Course',
  18,
  6738,
  72,
  'Private',
  '599 Blackhawk Club Dr',
  'Danville',
  'CA',
  '94506-4522',
  9257366550],

  ['Boundary Oak Golf Course',
  18,
  7063,
  72,
  'Municipal',
  '3800 Valley Vista Rd',
  'Walnut Creek', 
  'CA',
  '94598-4097',
  9259344775],

  ['Brentwood Golf Club - Creekside Course',
  9,
  3282, 
  36,
  'Daily Fee',
  '100 Summerset Dr',
  'Brentwood', 
  'CA',
  '94513-6426',
  9255163400],

  ['Buchanan Fields Golf Course',
  9,
  1982, 
  31,
  'Daily Fee',
  '1091 Concord Ave',
  'Concord',
  'CA',
  '94520-5603',
  9256821846]
  ]
  
  5.times do |n|
    course = course_list[n-1]
    link = course[0].gsub(/ /,'+')
    
    Course.create!(
                name: course[0],
                holes: course[1],
                yards: course[2],
                par: course[3],
                facility: course[4],
                street: course[5],
                city: course[6],
                state: course[7],
                zip: course[8],
                phone: course[9],
                link: "http://www.google.com/search?q=#{link}",
                description: 'The best golf course in the world'
                 )
  end
end

