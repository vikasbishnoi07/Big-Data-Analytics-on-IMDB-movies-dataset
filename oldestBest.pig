ratings = LOAD '/vikas/input/u.data'  AS (userID:int,movieID:int,rating:int,ratingTime:int);

metadata = LOAD '/vikas/input/u.item' USING PigStorage('|')
AS(movieID:int,movieTitle:chararray,releaseDate:chararray,videoRelease:chararray,imdbLink:chararray);

nameLookup = FOREACH metadata GENERATE movieID, movieTitle,
ToUnixTime(ToDate(releaseDate, 'dd-MMM-yyyy')) AS releaseTime;

ratingsByMovie = Group ratings BY movieID;

avgRatings = FOREACH ratingsByMovie GENERATE group AS movieID, AVG(ratings.rating) AS avgRating;

fiveStarMovies = FILTER avgRatings By avgRating > 4.0;

fiveStarsWithData = JOIN fiveStarMovies BY movieID, nameLookup BY movieID;

oldestFiveStarMovies = ORDER fiveStarsWithData BY nameLookup::releaseTime;

DUMP oldestFiveStarMovies;
