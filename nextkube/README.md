# NextCloud in Kubernetes with all the fixins
The iterations of this project, 'Gens' evolve in complexity as the number
increases. Each generation is ideally built from the last with some piece
abstracted away. All generations should be functional


## Generation 1
This Generation is the All-in-One solution to Nextcloud. There is no persistent
data. and a single container is present using an internal sqlite database
## Generation 2
Adds persistent storage for data. Identifies issue where nextcloud container
always reinitializes database.
