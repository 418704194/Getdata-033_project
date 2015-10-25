# Code Book

This code book describes the code, the var, and any 
transformations or work that I performed to clean up 
the data .

## Code
    1. download file and unzip it 
	2. read all needs to memory and named by it's origin attributions.
	For example: 
	train.data means the data file in train folder 
	train.label means the label file in train folder
	3. use the features to changes raw data's colnames
	4. use label names replace activity id.
	5. merge subject, activity label and data to a new dataset, named by it's source, 
	as train.data or test.data
	6. For efficiency, load the `data.table` packages, and transform merged data.
	Then, use `j` and `by` to mean average.
	7. write out with `rownames=FALSE`.
## Identifiers

* `subject` - The ID of the test.
* `activity` - The type of activity, For example: WALKING, SITTING, STANDING, LAYING)
## variables

Any variables with '-XYZ' is used to denote 3-axial signals 
in the X, Y and Z directions.

