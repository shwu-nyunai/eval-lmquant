pwd
rm -rf \
    /home/shwu/eval/outputs/* # clears lmquant cache and outputs
    # /home/shwu/eval/data/.cache/llm/cache \
python -m lmquant.llm.run configs/llm.yaml \
    configs/qoq/gchn.yaml --smooth-xw-alpha 0.05 --smooth-xw-beta 0.95 --smooth-yx-strategy GridSearch --smooth-yx-beta " -2" #\
wait

python /home/shwu/eval/qserve/scripts/ckpt_converter/checkpoint_converter.py \
    --model-path /home/shwu/eval/data/models/llama3/llama3-8b \
    --quant-path /home/shwu/eval/outputs_eval/outputs/llm/llama3/llama3-8b/w.4-x.8-y.4/w.zint4-x.sint8-y.zint4/w.gchn.fp16-x.gchn.fp16-y.g128.fp16/rot-w.static.kernel.orange/skip.y.[q]-krnl-rot-w.range.[0p2.1.g80]-pileval.128x1024.[0-0].RUNNING  \
    --output-path /home/shwu/eval/outputs_eval/qserve \
    --w-bit 4 \
    --device cpu
