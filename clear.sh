conda deactivate
conda env remove -n QServe -y
conda create -n QServe python=3.10 -y
conda activate QServe
# bash scripts/install/qserve.sh && bash scripts/install/lm-quant.sh