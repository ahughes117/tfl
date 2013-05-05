/*
 * The "populate stations" SQL insert query.
 *
 * Info taken from: 
 *
 * http://en.wikipedia.org/wiki/List_of_London_Underground_stations
 * http://en.wikipedia.org/wiki/List_of_Docklands_Light_Railway_stations
 * http://en.wikipedia.org/wiki/London_Overground
 *
 * ahughes & vikgana are working on this file
 */

INSERT INTO `station` (`Name`, `Authority`, `DateOpened`, `AltNames`, `Usage`) VALUES
('Acton Town', 'Ealing', '1879-07-01', 'Mill Hill Park: 1879-1910', 5.46),
('Aldgate', 'City of London', '1876-11-18', null, 6.24);