Thoughtify is a full-stack social media app created with Sinatra, Javascript and SCSS.

LIVE DEMO: https://thoughtify-ga.herokuapp.com/
Technology used

    HTML5
    SASS/SCSS
    Ruby Sinatra
    Webrick
    Deployed using Heroku

Features

Hashed password encryption
pass words are all stored using the bcrypt hashing system
Post Creation
Users can create posts, called thoughts.
Commenting
users can comment on posts.
Liking
Users can like and dislike posts and comments. Shown on each comment and thought is a bar showing the like dislike ration
Following Users
Users can follow one another. Users can then sort posts either by all posts or just posts
Auto generated profile picture
Once a user has signed up they are automatically generated a profile picture using the DICEBEARS api
Persistent scrolling
Using session storage and javascript the site remembers the scroll position allowing users to like/dislike or go back to the homepage without loosing scroll
Pagination
All thoughts and comments are delivered using a pagination system
Character counting
Using javascript the page shows an automatically updating character counter
User searching
Users can search for other users using by searching for any part of there name, along with that users can search for multiple users at once simply by separating search queries with a space
Approach

I began the project by outline the database schema using a tool called dbgram.io
This allowed me to visualize the data storage and flow before moving on to any wire framing or coding.

Once the database had been out lined I moved onto creating wire frame mockups of the application. This allowed me to not only decide the layout and style of my application but also allowed me to plan the different components needed.

Next began the coding phase I started by writing the different data models for all my resources. My goal was to create a mvp within the command line, where all intended functions could be used and tested by just calling functions within cmd. This approach allowed be to get up running and testing extremely quickly.

From there it just became a process of writing the intended routes and templates.

Along with that in a separate project I wrote all CSS using a component system. This meant that I could work on the logic of the app without the CSS getting in the way and without having to save writing all the CSS to the very end.
Lessons Learnt

This project really showed me the important of good planning and a consistent structure within the project. I am certain without these things the project would not be nearly as successful.
Future Improvements

In the future I would like to ensure that the site is more responsive.
I would like to create the ability to sort thoughts based on popularity as well
