require 'json'
image_data = File.open('image_data.txt', 'r').read()

image_data = image_data.split("\n")
image_data = image_data.map { |image| image.split("\",\"").map { |img| img.gsub("\"","") }}
file_path = "/home/ubuntu/workspace/raw_folder/ImageCaptioning.pytorch/images"
image_info = {
  images: []
}


splits = ['train','train','train',
          'train','train','train',
          'train','train','val','test']
image_data.each do |data|
  asin = data[0]
  caption = data[2]
  next if caption.nil?
  info = {
    cocoid: asin,
    sentences: [{ tokens: caption.split(" ")}],
    split: splits.sample()
  # [caption]
  }

  image_info[:images] << info
end

File.open("input.json","w") do |f|
  f.write(JSON.pretty_generate(image_info))
end






# imgs = json.load(open(params['input_json'], 'r'))
# imgs = imgs['images']
# N = len(imgs)

# seed(123) # make reproducible

# dir_fc = params['output_dir']+'_fc'
# dir_att = params['output_dir']+'_att'
# if not os.path.isdir(dir_fc):
#   os.mkdir(dir_fc)
# if not os.path.isdir(dir_att):
#   os.mkdir(dir_att)

# for i,img in enumerate(imgs):
#   # load the image
#   I = skimage.io.imread(os.path.join(params['images_root'], img['filepath'], img['filename']))
#   # handle grayscale input images
#   if len(I.shape) == 2:
#     I = I[:,:,np.newaxis]
#     I = np.concatenate((I,I,I), axis=2)

#   I = I.astype('float32')/255.0
#   I = torch.from_numpy(I.transpose([2,0,1])).cuda()
#   I = Variable(preprocess(I), volatile=True)
#   tmp_fc, tmp_att = my_resnet(I, params['att_size'])
#   # write to pkl
#   np.save(os.path.join(dir_fc, str(img['cocoid'])), tmp_fc.data.cpu().float().numpy())
#   np.savez_compressed(os.path.join(dir_att, str(img['cocoid'])), feat=tmp_att.data.cpu().float().numpy())

#   if i % 1000 == 0:
#     print('processing %d/%d (%.2f%% done)' % (i, N, i*100.0/N))
# print('wrote ', params['output_dir'])

