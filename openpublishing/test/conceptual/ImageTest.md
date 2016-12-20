# Image testing for Art Scanner

### The image displayed normal with Alt text

> ![I am flower](./Image/flower.jpg "This is A/t text")

### The image displayed normal with no Alt text
    ![](./Image/flower.jpg)
    
### The image displayed normal with reference insert
  ![Flower][Flower]
  [Flower]: ./Image/flower.jpg
  
### invalid insert style
![flower][./Image/flower.jpg]


### invalid image source
![flower](./Image/flowers.jpg)


### The normal image with too greater width (External image)
<img src="http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg" width = "860" height ="645"/>


### The normal image with normal width (External image)
<img src="http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg" width = "200" height ="100"/>


