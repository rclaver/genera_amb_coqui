#!/bin/bash

text=$1
if [[ "$text" == "" ]]; then
   text="Aquest és un text de mostra, ho pots repetir, si us plau?"
fi

remove_chars="\{\}\'"   #caracters que cal eliminar

while IFS=: read -r veu index
do
   #les línies en blanc i les que comencen amb #, són ignorades
   if [[ $veu && $index && "${veu:0,1}" != "#" ]]; then
      veu=${veu//[$remove_chars]}
      tts --text "${text}" --model_name "tts_models/ca/custom/vits" --speaker_idx "${veu}" --out_path "sortida/prova_${veu}.wav"
   fi
done < list_speaker_idxs.txt
