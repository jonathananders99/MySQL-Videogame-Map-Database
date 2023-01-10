### Program Name: ***Forge DBS***

### Description: 
This is a copy of a portion of a database I built for a gaming group and is meant to keep track of maps within the group. The relationships between the entities will include all 3 types of relationships and will represent all the information needed to keep track of the maps and the forgers. (A forger is someone who makes maps). It would be too much to try and put everything into words so ill give some examples of the relationships between the entities. There are multiple different map sectors that have a lot of maps, but an individual map can only have one sector. Another example is that a single map edit entry can only have one map while a map can have multiple map edits. Similarly with individual edits and map edits you can have multiple individual edits for one map edit but an individual map edit can only have one map edit. This is created just like with the individual map verifications to allow for multiple different forgers/verification personnel per overall each entry. (side note: there are more than one status because one can be an active forger but not be an active verification personnel.

A Visual representation of the database can be found in the `Visual` file.

The `main` file is separated by sections:
- Table Creation
- Record Insertion
- Queries

### How to run the project:
Simply copy and paste the SQL code into a MySQL server query and run it.