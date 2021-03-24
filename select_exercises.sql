Use albums_db;

#Question 3 - Explore the structure of the albums table.

#3a How many rows are in the albums table?
#3a Answer: There are 31 rows in the albums table.
#3a Code: 

Select * 
FROM albums

#3b How many unique artist names are in the albums table?
#3b Answer: There are 23 unique artists names inthe albums table.
#3b Code: 

Select distinct artist
from albums;

#3c What is the primary key for the albums table?
#3c Answer: Primary key for albums table is ID
#3c Code: 

CREATE TABLE `albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artist` varchar(240) DEFAULT NULL,
  `name` varchar(240) NOT NULL,
  `release_date` int(11) DEFAULT NULL,
  `sales` float DEFAULT NULL,
  `genre` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

#3d What is the oldest release data for any album in the albums table? What is the most recent release date?
#3d Answer: The oldest release data is 1967 and the most recent release date is 2011 in the albums table.
#3d Code:

Select * 
from albums
Order by release_date asc;

Select *
from albums
order by release_date desc;


#4 Write queries to find the following information: 

#4a The name of all albums by Pink Floyd
#4a Answer: The Dark side of the Moon and The Wall are the names of all albums by Pink Floyd.
#4a Code:

Select * 
from albums
where artist = 'Pink Floyd'

#4b The year Sgt. Pepper's Lonely Hearts Club Band was released?
#4b Answer: Release date is 1967.
#4b Code: 

Select *
from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band"

#4c The genre for the album Nevermind?
#4c Answer: Grunge and Alternative Rock is the genre for the album Nevermind.
#4c Code: 

Select *
from albums
where name = "Nevermind";

#4d Which albums were released in the 1990s?
#4d Answer: 11 albums were released in the 1990s
#4d Answer cont: The Bodygaurd, Jagged Little Pill, Come on Over, Falling into You, Let's Talk about Love
#4d Answer cont: Dangerous, The Immaculate Collection, Titanic: Music from the Motion Picture, Metallica,
#4d Answer cont: Nevermind, Supernatural
#4d Code

Select * 
from albums
where release_date between 1990 and 1999;

#4e Which albums had less than 20 million certified sales?
#4e Answer: Using the where clause and the less than operator we can see 13 albums had less than 20 million in certified sales.
#4e Answer cont: Grease: The Original Soundtrack from the Motion Picture, Bad, Sgt. Pepper's Lonely Hearts Club Band,
#4e Answer cont: Dirty Dancing, Let's Talk About Love, Dangerous, The Immaculate Collection, Abbey Road, 
#4e Answer cont: Born in the U.S.A, Brothers in Arms, Titanic: Music from the Motion Picture, Nevermind, The Wall
#4e Code:

Select *
From albums
where sales < 20.0;

#4f All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
#4f Answer: It will not be included due to each string is a unique identifier, such as Rock
#4f Answer cont: != Hard Rock and is != 'Progressive Rock'. Therefore the sting will not return
#4f Answer cont: any other values other than "Rock".
#4f Code: N/A






