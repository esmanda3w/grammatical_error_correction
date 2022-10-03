echo "Starting preprocess...\n"

echo "Removing previous train.src and train.tgt"
rm "train.src"
rm "train.tgt"

echo "Done. Generating train.src and train.tgt\n"
touch "train.src"
touch "train.tgt"

echo "Done. Collating files...\n"

data_dir="" # replace this
for file_path in "$data_dir"/*
do 
    echo "Generating file for $file_path"
    python3 m2_to_parallel.py --data "$file_path" --erroneous_only

    file_name="${file_path%.*}"

    echo "Done generating. Adding $file_name.src to train.src"
    cat "$file_name.src" >> train.src
    rm "$file_name.src"

    echo "Done. Adding $file_name.tgt to train.tgt"
    cat "$file_name.tgt" >> train.tgt
    rm "$file_name.tgt"

    echo "Done\n"
done 
