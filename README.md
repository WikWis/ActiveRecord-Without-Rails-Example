# ActiveRecord-Without-Rails-Example
Simple example of using ActiveRecord without Rails, with one to many association.

##**Running Project**

Open project and in console type:

    bundle install

Later config development.yml, test.yml. Create needed
 databases and run db_init.rb by typing:
 
    cd db
    ruby db_init.rb

**And that's it.** Now you can run tests.

    cd test
    ruby test_class_user.rb
    ruby test_class_post.rb
    ruby post_with_db_test.rb
    ruby user_with_db_test.rb

After running tests you can run example program

    cd bin
    ruby ActiveRecord-Without-Rails-Example
    
You should see this:

    Users from database with their posts:
    -----------------------------------------------------------
    Robert Skóra (id: 1) with posts:
    id: 1, title: some title, body: some body, user_id: 1
    -----------------------------------------------------------
