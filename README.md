# Spotify-Wrapped-Project
Spotify Wrapped Project showing most popular insights from my streaming history.

1. Excel files with streaming history were downloaded, combined and saved as .csv file
2. Newly created .csv file was uploaded into MySQL Workbench using appropriate query and checked for eventual invalid data
3. After making sure the data is correct, necessary transformation like changing the column name or column type were done
4. Next, queries were written for obtaining appropriate insights taking into account the date column value and Spotify related characteristics like counting the stream only if the song was played for at least 30 seconds
5. All of the queries were used to create SQL views, which then were uploaded into PowerBI Desktop
6. Last step was adjusting some of the columns for the need of visualization and creation of the dashboard showing chosen insights
