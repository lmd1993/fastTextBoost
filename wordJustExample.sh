RESULTDIR=result
DATADIR=data


cut -f 1,2 "${DATADIR}"/rw/rw.txt | awk '{print tolower($0)}' | tr '\t' '\n' > "${DATADIR}"/queries.txt

cat "${DATADIR}"/queries.txt | ./fasttext print-word-vectors "${RESULTDIR}"/$1 > "${RESULTDIR}"/vectors.txt

python eval.py -m "${RESULTDIR}"/vectors.txt -d "${DATADIR}"/rw/rw.txt
~                                                                        
