#  Fetch iOS Coding Challenge

## Objective
The objective of this project is to build a native iOS app that can
- Retrive data from 2 given api endpoints
- Decode data into swfit data structures
- Handle items that has null field
- Sort menus in alphabetical order
- Display each menu in a detailed view

## Components
### NetworkService
- Retrieve data from the api endpints
- Decode data into swift data strcutures

### ContentView
- Use NetworkService to get dessert items
- Display dessert items in a NavigationStack with NavigationLinks to detailed views

### MealsViewModel
- Provide logic for ContentView to retrieve data and sort data

### MealRow
- A veiw
- Label for each dessert item
- Display image and meal name

### MealRowViewModel
- Provide logic for MealRow to display meal name and image

### RecipeView
- Detailed view for each dessert
- Display image, name, instructions, ingredients, and measure for each recipe

### RecipeViewModel
- Provide logic to display recipe


## Design Decisions
1. MVVM Architecture to make sure no logic in the view layer
2. CustomCodingKeys used to decode the ingredients and measures as in json data they are 20 different fields. This way all ingredients and measures are grouped into corresponding arrays. This way it eliminates the need to declare 40 redundant fields in the recipe struct
3. Included images for better look

## Results

## Area of Improvements
1. Testing
2. Adding logo to the app
3. Use constants instead of hard-coded urls
4. Better UI design

