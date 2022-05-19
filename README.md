Rick and Morty Solution Description 

This repo contains the solution for  ios code challenge using the RICK and Morty API.
The app contains 2 main views: 1st View on launch is showing a list of characters from the  Rick and Morty API and secondly the Detail View on tap of one of the characters. Also there is a Search bar that allows user to search for a character by name.


Architecture/Design patterns. 

The solution has been realised using MVVM-Coordinator combination. Coordinator helps to decouple the 2 views to achieve Separation on Concerns on Viewcontroller level.
MVVM takes care  of fetching the API data and  showing it in List/Detail views in a decoupled manner. 
A generic Network layer has been written which can be resued to work with any API. Networking code has been comppletely written using native support and no 3rd party library has been used.
Unit tests have been included for APIs and ViewModels.



## Platforms/ToolS used
- iOS 15.4
- Xcode 13.3.1
- Swift 5.0 


