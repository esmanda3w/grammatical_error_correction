echo "Starting preprocess...\n"

echo "Removing previous train.all.src and train.all.tgt"
rm "train.all.src"
rm "train.all.tgt"

echo "Done. Generating train.src and train.tgt\n"
touch "train.all.src"
touch "train.all.tgt"

echo "Done. Collating files...\n"

data_dir="m2_files" # replace this
for file_path in "$data_dir"/*
do 
    echo "Generating file for $file_path"
    python3 m2_to_parallel.py --data "$file_path"

    file_name="${file_path%.*}"

    echo "Done generating. Adding $file_name.src to train.all.src"
    cat "$file_name.src" >> train.all.src
    rm "$file_name.src"

    echo "Done. Adding $file_name.tgt to train.all.tgt"
    cat "$file_name.tgt" >> train.all.tgt
    rm "$file_name.tgt"

    echo "Done\n"
done 
