## Fork of https://github.com/ruotianluo/ImageCaptioning.pytorch

An implementation of neuraltalk2 for image captioning of Amazon product images 
with it's product description for a hackathon. Data set included 100k images scraped from 
Amazon.com's product page focused primarily on clothing products.

### Completed During hackathon

- Cleaned data and transformed product images and description to 
[COCO-Format](http://cocodataset.org/#format)

- used a pretrained `resnet101` and stripped off last classification layer to train

- Was able to setup data and initial model to train for 1 - 2 hrs 

See:

[first version](https://github.com/cheeseblubber/caption_generator/blob/master/notebooks/model_setup.ipynb)
[second version](https://github.com/cheeseblubber/caption_generator/blob/master/notebooks/test_out_model.ipynb)

### Model

```
FCModel(
  (img_embed): Linear(in_features=2048, out_features=512)
  (core): LSTMCore(
    (i2h): Linear(in_features=512, out_features=2560)
    (h2h): Linear(in_features=512, out_features=2560)
    (dropout): Dropout(p=0.5)
  )
  (embed): Embedding(13016, 512)
  (logit): Linear(in_features=512, out_features=13016)
)
```


### Future tasks

- Load pretrained weights of the model - Need to randomize word values in embedding of missing words
- try different vocab embeddings
- try training embeddings separately with descriptions then loading the model in
- Original time constraint of 72 hours limited how much training could be done 
	- continue to train model


## Acknowledgements

A fork of:

```
@misc{Luo2017,
author = {Ruotian Luo},
title = {An Image Captioning codebase in PyTorch},
year = {2017},
publisher = {GitHub},
journal = {GitHub repository},
howpublished = {\url{https://github.com/ruotianluo/ImageCaptioning.pytorch}},
}
```

Original nerualtalk2: https://github.com/karpathy/neuraltalk2
