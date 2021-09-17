# Details

Date : 2021-09-17 13:10:15

Directory /home/keeganpratt/sei/projects/02-crud

Total : 51 files,  3336 codes, 22 comments, 339 blanks, all 3697 lines

[summary](results.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [Gemfile](/Gemfile) | Gemfile | 5 | 0 | 1 | 6 |
| [config.ru](/config.ru) | Ruby | 2 | 0 | 4 | 6 |
| [db/db_connectors.rb](/db/db_connectors.rb) | Ruby | 8 | 0 | 1 | 9 |
| [db/schema.sql](/db/schema.sql) | SQL | 43 | 0 | 7 | 50 |
| [db_console.rb](/db_console.rb) | Ruby | 8 | 0 | 2 | 10 |
| [helpers/auth.rb](/helpers/auth.rb) | Ruby | 16 | 0 | 3 | 19 |
| [helpers/globals.rb](/helpers/globals.rb) | Ruby | 1 | 0 | 0 | 1 |
| [helpers/sanitize.rb](/helpers/sanitize.rb) | Ruby | 5 | 0 | 0 | 5 |
| [main.rb](/main.rb) | Ruby | 211 | 9 | 43 | 263 |
| [models/comment.rb](/models/comment.rb) | Ruby | 44 | 2 | 7 | 53 |
| [models/follower.rb](/models/follower.rb) | Ruby | 36 | 0 | 6 | 42 |
| [models/thought.rb](/models/thought.rb) | Ruby | 107 | 1 | 14 | 122 |
| [models/topic.rb](/models/topic.rb) | Ruby | 14 | 0 | 2 | 16 |
| [models/user.rb](/models/user.rb) | Ruby | 80 | 1 | 10 | 91 |
| [models/vote.rb](/models/vote.rb) | Ruby | 52 | 2 | 8 | 62 |
| [public/images/branding/Logo.svg](/public/images/branding/Logo.svg) | XML | 271 | 0 | 1 | 272 |
| [public/images/graphics/empty.svg](/public/images/graphics/empty.svg) | XML | 1 | 0 | 0 | 1 |
| [public/images/graphics/nousers.svg](/public/images/graphics/nousers.svg) | XML | 1 | 0 | 0 | 1 |
| [public/images/graphics/search-background.svg](/public/images/graphics/search-background.svg) | XML | 96 | 0 | 1 | 97 |
| [public/images/graphics/welcome.svg](/public/images/graphics/welcome.svg) | XML | 92 | 0 | 1 | 93 |
| [public/images/icons/comment.svg](/public/images/icons/comment.svg) | XML | 59 | 0 | 1 | 60 |
| [public/images/icons/edit.svg](/public/images/icons/edit.svg) | XML | 59 | 0 | 1 | 60 |
| [public/images/icons/login.svg](/public/images/icons/login.svg) | XML | 59 | 0 | 1 | 60 |
| [public/images/icons/logout.svg](/public/images/icons/logout.svg) | XML | 59 | 0 | 1 | 60 |
| [public/images/icons/search.svg](/public/images/icons/search.svg) | XML | 59 | 0 | 1 | 60 |
| [public/images/icons/thumbs-down-outline.svg](/public/images/icons/thumbs-down-outline.svg) | XML | 60 | 0 | 1 | 61 |
| [public/images/icons/thumbs-down.svg](/public/images/icons/thumbs-down.svg) | XML | 59 | 0 | 1 | 60 |
| [public/images/icons/thumbs-up-outline.svg](/public/images/icons/thumbs-up-outline.svg) | XML | 64 | 0 | 1 | 65 |
| [public/images/icons/thumbs-up.svg](/public/images/icons/thumbs-up.svg) | XML | 59 | 0 | 1 | 60 |
| [public/images/icons/trash.svg](/public/images/icons/trash.svg) | XML | 59 | 0 | 1 | 60 |
| [public/scripts/characterCounter.js](/public/scripts/characterCounter.js) | JavaScript | 6 | 0 | 3 | 9 |
| [public/scripts/commentScrollPersistor.js](/public/scripts/commentScrollPersistor.js) | JavaScript | 9 | 0 | 1 | 10 |
| [public/scripts/popup.js](/public/scripts/popup.js) | JavaScript | 9 | 0 | 3 | 12 |
| [public/scripts/scrollPersistor.js](/public/scripts/scrollPersistor.js) | JavaScript | 11 | 1 | 1 | 13 |
| [public/styles/css/style.css](/public/styles/css/style.css) | CSS | 490 | 2 | 91 | 583 |
| [public/styles/style.scss](/public/styles/style.scss) | SCSS | 501 | 0 | 32 | 533 |
| [seed.rb](/seed.rb) | Ruby | 0 | 4 | 3 | 7 |
| [tests/db_tests.rb](/tests/db_tests.rb) | Ruby | 0 | 0 | 1 | 1 |
| [views/create_thought.erb](/views/create_thought.erb) | erb | 16 | 0 | 1 | 17 |
| [views/create_user.erb](/views/create_user.erb) | erb | 16 | 0 | 5 | 21 |
| [views/edit_comment.erb](/views/edit_comment.erb) | erb | 17 | 0 | 0 | 17 |
| [views/edit_thought.erb](/views/edit_thought.erb) | erb | 24 | 0 | 1 | 25 |
| [views/index.erb](/views/index.erb) | erb | 98 | 0 | 16 | 114 |
| [views/layout.erb](/views/layout.erb) | erb | 43 | 0 | 4 | 47 |
| [views/login.erb](/views/login.erb) | erb | 14 | 0 | 4 | 18 |
| [views/search_user_results.erb](/views/search_user_results.erb) | erb | 19 | 0 | 1 | 20 |
| [views/thought.erb](/views/thought.erb) | erb | 159 | 0 | 25 | 184 |
| [views/user_edit_bio.erb](/views/user_edit_bio.erb) | erb | 16 | 0 | 0 | 16 |
| [views/user_page.erb](/views/user_page.erb) | erb | 107 | 0 | 16 | 123 |
| [views/user_page_followers.erb](/views/user_page_followers.erb) | erb | 46 | 0 | 5 | 51 |
| [views/user_page_following.erb](/views/user_page_following.erb) | erb | 46 | 0 | 5 | 51 |

[summary](results.md)