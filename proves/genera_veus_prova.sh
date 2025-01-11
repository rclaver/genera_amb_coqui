#!/bin/bash
source colors
veu=$1
text=$2
if [[ "$veu" == "" ]]; then
   echo -e "\tNo has indicat el id de la veu"
   echo -e "\tPer obtenir ids, fes servir:\n\t\t${CB_YLW}\$ ${CB_CYN}tts --model_name \"tts_models/ca/custom/vits\" --list_speaker_idxs${C_NONE}"
   echo -e "\tSintaxi:\n\t\t${0:2} ${CB_WHT}id_de_la veu"
   exit
fi
if [[ "$text" == "" ]]; then
   text="Aquest és un text de mostra, ho pots repetir, si us plau?"
fi
tts --text "${text}" --model_name "tts_models/ca/custom/vits" --speaker_idx "${veu}" --out_path "sortida/prova_${veu}.wav"
