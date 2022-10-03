echo "Starting preprocess...\n"

echo "Removing previous dev.src and dev.tgt"
rm "dev.src"
rm "dev.tgt"

echo "Done. Generating dev.src and dev.tgt\n"
touch "dev.src"
touch "dev.tgt"

echo "Done. Collating files...\n"

data_dir="" # replace this
for file_path in "$data_dir"/*
do 
    echo "Generating file for $file_path"
    python3 m2_to_parallel.py --data "$file_path"

    file_name="${file_path%.*}"

    echo "Done generating. Adding $file_name.src to dev.src"
    cat "$file_name.src" >> dev.src
    rm "$file_name.src"

    echo "Done. Adding $file_name.tgt to dev.tgt"
    cat "$file_name.tgt" >> dev.tgt
    rm "$file_name.tgt"

    echo "Done\n"
done 
