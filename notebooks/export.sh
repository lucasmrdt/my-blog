#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
INPUT_DIR="$SCRIPT_DIR/src"
OUTPUT_DIR="$SCRIPT_DIR/generated"

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Mac OS detected."
  gsed_cmd="gsed"
else
  echo "Linux detected."
  gsed_cmd="sed"
fi

should_watch=0
if [[ "$1" == "--watch" ]]; then
  should_watch=1
fi

export-nb-to-md() {
  echo "Exporting notebooks to markdown..."
  rm -rf $OUTPUT_DIR
  mkdir -p $OUTPUT_DIR
  cp $INPUT_DIR/notebooks.json $OUTPUT_DIR
  cp $INPUT_DIR/**/*.png $OUTPUT_DIR
  cp $INPUT_DIR/**/*.gif $OUTPUT_DIR
  jupyter nbconvert $INPUT_DIR/**/*.ipynb --TagRemovePreprocessor.enabled=True --TagRemovePreprocessor.remove_cell_tags remove_cell --TagRemovePreprocessor.remove_all_outputs_tags remove_output --TagRemovePreprocessor.remove_input_tags remove_input --to markdown --output-dir $OUTPUT_DIR
  $gsed_cmd -i 's/!\[png\](\(.*\))/{% imageMd ".\/src\/notebooks\/.\/\1", "", "", "img-container grid-column-center", "img-post", "", "" %}/gm' $OUTPUT_DIR/*.md
  $gsed_cmd -i 's/!\[svg\](\(.*\))/{% imageMd ".\/src\/notebooks\/.\/\1", "", "", "img-container grid-column-center", "img-post", "", "" %}/gm' $OUTPUT_DIR/*.md
  $gsed_cmd -i 's/!\[gif\](\(.*\))/{% imageMd ".\/src\/notebooks\/.\/\1", "", "", "img-container grid-column-center", "img-post", "", "" %}/gm' $OUTPUT_DIR/*.md
  echo "Done."
}

export-nb-to-md;

if [[ $should_watch -eq 0 ]]; then
  exit 0
fi

while [ 1 ]; do
  echo "Watching for changes in $INPUT_DIR..."
  watch -d -t -g ls -lR $INPUT_DIR > /dev/null
  export-nb-to-md;
done
