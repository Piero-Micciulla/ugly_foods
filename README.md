# UGLY FOODS

Context:
This is a project build around the theme of sustainability. It helps connecting local groceries stores to customer to sell goods that don't meet the beauty standards (Ugly) but are still completely editable, in the city of Amsterdam.

Collaborators:
The project was built by a team of four developer throough usage of Git and GitHub.

Tech stack:
The application's backbone is developed in Ruby on Rails using PostgresQl as a database. The front end is created in HTML, (S)CSS and JS. In production the application is running on Heroku.

Gems and Tools :
- Redis
- Cloudinary
- Geocoder
- PG Search
- Noticed
- Stripe
- Prybug
- Byebug

User Journey and details:
The website allows you to login both as a shopowner or a buyer (the authentication is handled by devise).

AS A BUYER

The website open on an Homepage. Rails main feature is the search bar created through PG search. It allows you to filter by type of products as well as single products (as reflected in the schema). The animation on scroll on this page depends on intersection observer (app/javascript/plugins/init_scroll.js). We used the plugin folder to import all of the js functions from the different files.
Browsing from the search bar there is an index page with all of the shops available sourranding the area searched dinamically rendered from the seed.rb . Main feature is is the map . We used mapboxgl to implement that (app/javascript/plugins/init_mapbox.js) and customized the css adding relevant classes. The items displayed in each shop are retrieved from the seeds and are based on how much stock other users have consumed.
Clicking on a single shop from the index the show page will open . In here noticeable features are teh reviews (nested in the shope resources in the root.rb) and the product search bar which is rendered in pure javascript getting the user input and updating the search in real time (app/javascript/plugins/init_autocomplete.js). Logic like the stars for the shop are handled in the controller through ruby functions as well.
The cart is ever present (if logged in) and putting items in the cart will automatically decrease the amount of items of the related shop stock. It has just to actions , a post (to add items) and a delete. 
If the user decide to purchase the app redirect to a Stripe payment page.

AS A SHOPOWNER

Both the shopowner and the buyer are redirected to their respective dashboard upon login. In the shopower case the dashboard has three layers . The "home" which displays basic data related to his shop such as likes (handled by a rails model/controller in the back end and in js for how concern the actual heart animation ) , stock left and reviews from the clients. The second layer consists in the upcoming orders , while the third displays messages.
In this last section the messages are simply reported from a chatroom which is built on the fly through a "find_or_create_by" ruby function (app/controllers/chatrooms_controller.rb). The chat is running on actioncable for instantaneous updates of the messages(app/javascript/channels).
Obviously the owner is allowed to delete or create another shop.




