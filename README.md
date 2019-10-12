# Big-Data-Analytics-on-IMDB-movies-dataset
Data analytics on the movie dataset using Hadoop cluster ,pig mapreduce<br>
<strong>Data source:-</strong> https://www.kaggle.com/orgesleka/imdbmovies & a http://media.sundogsoft.com/hadoop/ml-100k/u.item <br>
 The project has the following components:-<br>
  2. Saved the data into HDFS<br>
  3. streaming file location<br>
          /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.7.7.jar <br>
  4.  Now printing the total number of ratings for each rating <br>
          python RatingsBreakdown.py -r hadoop --hadoop-streaming-jar <br>
  5.  Total no. Of ratings for each movie <br>
        python movie.py -r hadoop --hadoop-streaming-jar <br>
  6.   Using step 3 and step 4, finding the average ratings for each movie <br>
        python TopMovies.py -r hadoop --hadoop-streaming-jar <br>
  7.   Using PIG, finding the oldest and best movie based on the average rating from the
u.item dataset
