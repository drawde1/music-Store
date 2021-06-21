# music-Store

API Used: "https://itunes.apple.com/search?term={artistName}&entity=album"

Testing if this text will be shared across projects

Onboarding: Sign In

UI: Username and Email textField for user input

Sign In Button should validate if user exists in database

IF True: Signs user in and land on Account Tab

IF False: Show an alert that read “Username or email do not exist”

Onboarding: Create User

UI: Username and Email textField for user input

Create User Button should validate email for

Should have only a-z and 0-9 before the @ symbol

Should have only 1 occurrence of “@” and “.” as special characters

Email should not already exist in database

IF email is valid, create the user as a data point and signs user in

TabBarController: User Account Tab

??

??

TabBarController: My Music Tab

IF the user has no songs in their collection, show a label that shows “Shop for songs to add to your collection“

font name: "HelveticaNeue-Thin", size: 24

IF the user has songs in their collection

Show tableview/cells that shows the album’s name, artist, and album image

TabBarController: Product Tab

Shows a collection view with each cell showing

Album name

Artist Name

Price

Album Art

Clicking on each album will show option to “Add To Cart”

Shows a cart navigation icon 

Click on icon to navigate to Product Cart page

Product Cart page should have a list of items which were added to cart with “Add To Cart” action

TabBarController: Product Cart

Show a list of items that were added to cart from Product page

Show a cell that contains

Subtotal: sum of all the items in the cart

Number of items

Tax: at a tax rate of 8%

Total: Combine of subtotal and tax

Buy Now Button

Buy Now Button (Assuming user has infinite money)

Should add the current items in the cart to the user lists of songs in database

Clear out the cart (since it has been bought)

Should navigate to TabBarController → Music Tab


