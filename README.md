# clone_assignment3
> An app designed to replicate Netflix's recommended screen page and new and hot page. Allowing for users to see the latest and upcoming shows and movies.

## Screenshots
<img width="449" height="764" alt="image" src="https://github.com/user-attachments/assets/8388db26-98ba-47eb-a2d4-9bf0fb2a6ece" /> <img width="430" height="765" alt="image" src="https://github.com/user-attachments/assets/8e24a874-a5ad-43d9-8840-c322be28876a" />

## Project Environment
### - Development Team
- 1 developer
### - Development Period: 
- 2026.08.03 - 2026.08.13 

### - Development Environment
iOS Version
**Architecture**                    MVVM
**Reactive**              Flutter

### Technology Stack & Libraries
**Language**: Dart  
**Framework**: Flutter  
**Libraries**: HTTP  
**Database**: TMDB  
**Tools**: Git, GitHub  

## Core Features
- Track the weekly trending movies and any upcoming movies
- Displays these movies in an infinite scrolling screen
- Different tabs allowing users to see upcoming movies or trending movies

## Key Technical Implementations  
### API Calling  
- Called data from the TMBD database and created a model structure to build and display these data in an infinite scrolling bar
- Implemented multiple pages and tabs to allow users to see call and see different types of movies like weekly trending or upcoming

## Troubleshooting
### 1. The application did not show next page of data when reaching the end of the screen
**Situation**
- The data wouldn't get the next page of data when reaching the end of the scroll

**Root Cause**
- The scrollcontroller.onset wasn't being properly used and the boolean expression of onset being equalled to the max scrolling position may have been overshot

**Solution**
- Change the boolean expression from scrollController.offset == scrollController.position.maxScrollExtent to scrollController.offset >= scrollController.position.maxScrollExtent


