# Data Analytics Bootcamp. Final Project

## Research and model to understand the US aviation market

This project is the conclusion of the Data Analytics Bootcamp at Ironhack Berlin, where we have learned about coding in Python, querying in SQL, visualizing in Tableau and applying Machine Learning models.

The motivation behind it is mainly my passion for the transport sector. I decided my project would be related with some airline issue and try to find out some interesting insights of a particular market. I have used data on all flights within two US cities for the year 2019, and have conducted a study on how the amount of flights within two cities can be estimated and forecasted. This holds in a model that is able to extract a model with the current data of real flights within the US and apply it to potential new connections between unconnected cities. This points out to a market opportunity that carriers could exploit.

The project itself has started with the treatment of data, grouping by routes, carriers and months, and then performed EDA visualisation and an interactive dashboard that allows us to retreive all the available information from each of the airports and routes we are interested in. This was supported by some SQL queries to understand how the data works, how the grouping would provide the best results, and how many different routes (observations) was I going to have to deal with. Through visualisation, we have managed to find a couple of interesting patterns that could be interesting to showcase and study further. Finally, we have ran a Machine Learning model that has allowed us to get the effects of economic and demographic variables into the quantity of flights in each route, and we have forecasted how many flights would fit in a new route if a carrier was to start operating it.

In this Github repository you can find all 7 notebooks I have worked on with my data in Python, the SQL file of the queries ran and a Tableau Compressed Notebook with the dashboards and the data extract required to run it, along with the slides I used to support my presentation of the project.

Note: Due to some technical issues, there are 7 different notebooks I have worked on, chronologically labeled. Some of the dataframes had problems running through many different commands, but it was something I managed to solve by exporting the dataframe, opening a different notebook, and importing the dataframe. This is the reason why there are so many notebooks. I will work on unifying it soon to try to optimize it and make it fit in one notebook.
