Build a Complete Ruby on Rails application that manages related data through complex forms and RESTful routes. The goal of the application is to build a Content Management System, whether the content being managed is Blog Posts, Recipes, a Library of Resources, or any domain model that lends itself to these requirements (the majority of ideas you could come up with would probably meet the requirements).

What to Expect from the Project Review
Project reviews are focused on preparing you for technical interviews. Treat project reviews as if they were technical presentation.

During you project review, be prepared to:
1. Explain your code from execution point to exit point. Use the best technical vocabulary you can(15 minutes)
2. Live code. This could be refactoring, adding a new feature, or both. (20 minutes)
3. You will also be asked questions that test your knowledge of Rails fundamental.(20 minutes)

Requirements
Check 1. User the Ruby on Rails framework.
Check 2. Your models must:
    - Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships.
    -> has many car
    -> car belong to user
    - Include a many-to-many relationship implemented with has_many :through associations.
    ->    car t part to user    user t part to car
    -The join table must include a user-submittable attribute -- that is to say, some attribute other than its foregin keys that can be submitted by the app's user
    -> part -> name:string


3. Your models must include resonalable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data

4. You must include at least one class level ActiveRecord scope method.a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it(such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

Check 5. Your application must provide standard user authentication, including signup, login, logout, and passwords.
-> has signup, login, logout, and password

6. Your authentication system must also allow login from some other service. Facebook, Twitter, etc.

Check 7. You must include and make use of a nested resource with the appropriate RESTFUL URLs.
    Check - You must include a nester new route with form that relates to the parent resource
    -> Parts is nested within car. Submits Parts to the car to build
    - You must include a nested index or show rout
    -> Nested indes is on car show page
    -> Part can be clicked on and looked at

Check 8. Your forms should correctly display validation errors.
    Check - Your fields should be enclosed within a fields_with_errors class
    Check - Errors messages describing the validation failures must be present within the view.

9. You application must be, within reason, a DRY(Do-Not-Repeat-Yourself) rails app.
    - Logic present in your controllers should be encapsulated as methods in your models.
    - Your views should use helper methods and partials when appropriate.
    - Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Check 10. Do not use saffolding to build your project. Your goal here is to learn. Scffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.

Instructions

1. Create a new repo on GitHub
Check 2. add the spec.md to the project
3. Build your application.
4. Record at least a 30 min coding session.
5. Make sure to check each box in your spec.md
6. Write a README.md
7. Submit a video of how a user would interact with
    your working web application.
8. Write a blog post about the project and process.
9. When done, submit your GitHub repo's url, a link
    to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm" to wrap it up.

___________________________
How to Get Started On a Successful Project Build

1. Read through the project requirements here
    carefully before getting started
Check Come up with the project idea of your own, and
    devote some time to a planning session. Think about the following:
    a. What will your app do?
    -> Share music with others who can comment and rate songs.
    b. What is the user experience?
    -> The user can make their songs, views comments, make comments, make ratings.
    c. What will your models be?
    -> User, Song, Genre, Comment
    d. What are their associations?
    -> See bottom
    e. What are the possible views for your app?
        See bottom

User the Self-Paced Build Form
1. Create a skeleton app and repo on Github.

2. Plan your schedule.

Check 3. You should already by on Slack channel #rails-section; It is a great palce to ocnnect with others who are working on their projects as well.

Making a User Story
Check   1. Who is your User.
->  My user is a musician that will be sharing their songs with other who will then rate the music.

Check 2. What is their pain point?
->  They are looking to post their music for feedback.
Check 3. How do they use our solution to overcome this problem?
->  Provides a platform where people can share info.

        In other words
        1. As a <type of user>
            As a musician
        2. I want <some goal>
            I want to post my music
        3. So that <some reason>
            To receive feedback from others

Consider this:

Homepage on localhost
 - As a guest
 - I want to get information about music
 - So I can then rate it

Check User signup -> /users/new
    - As a guest
    - I want to sign up
    - So I can submit a concept

Create song -> /songs/new
    - As a user
    - I want to submit a concept
    - So that others can gain inspiration

Section index -> /sections/rails/concepts
    - As a user
    - I want to view all concepts for a section
    - So that others can gain inspiration from my project

Choosing Your Models; Modeling Your Data
 - What are all the models associated with my app?
    User, Song, Genre, Comment
 - How are they related to one another?

User:
    - email:string
    - encrypted_password:string

    - has_many :songs
    - has_many :comments
    - has_many :commented_songs, through: :comments
    - has_many :genres, through: :songs


Song:
    - title:string
    - lyric:text
    - user_id:integer
    - genre_id:integer

    - belongs_to :user
    - belongs_to :genre
    - has_many :comments
    - has_many :users, through: :comments

Genre:
    - name:string
    - description :string

    - has_many :songs
    - has_many :users, through: :songs

Comment:
    - content:string
    - rating:integer
    - user_id:integer
    - song_id:integer

    - belongs_to :user
    - belongs_to :song


Songs CRUD
Create
Read Update
Delete/

Rails
    - config/routes/rb
    - HUGE separation of concern

files that we're dealing with
- app
- config/routes.rb
- db


/list/1/items
    PUT/PATCH /lists/1/items/1
    PUT/PATCH /lists/:iist_id/items/1

I know I need to steal the checkbox HTML
<input class="toggle" type="checkbox" >
Need JSto submit the form when complete

Then we