##******************* Import libaries *******************##
import imageio
import numpy as np
import matplotlib.pyplot as plt
import scipy
import scipy.signal
import math
import time

## ****************** Function ***********************##
# Function rgb to gray
# convert a RGB image to gray image
# Lizhong Wang 6 Feb
def rgb2gray(rgb_image):
    gray_image=1/3*rgb_image[:,:,0]+1/3*rgb_image[:,:,1]+1/3*rgb_image[:,:,2]
    #gray_image=1/3*gray_image;   
    return gray_image

# Function 1 dimensional Gaussian filter generator(sigma)
# sigma is the size of Gaussian filter, larger sigma cause image more blurred
# Design the Gaussian filter
# Lizhong Wang 6 Feb
def gaussian_filter_1d(sigma):
    # sigma: the parameter sigma in the Gaussian kernel (unit: pixel)
    #
    # return: a 1D array for the Gaussian kernel
    N = 3*sigma*2+1
    pi = math.pi
    h = np.zeros([1,N])
    for i in range(N):
        h[0,i] = 1/((2*pi)**(1/2)*sigma)*math.exp(-((i-(N-1)/2)**2)/(2*sigma**2));
    h = h/np.sum(h)
    return h

# Function Canny edge detection(gray image input, sigma, threshold)
# Implementation of Canny edge detection
# gray image is size M x N x 1
# sigma is the size of Gaussian filter, larger sigma cause less details in coloring image
# threshold controls the noisy line, low value cause more noisy line
# Lizhong Wang 6 Feb
def Canny(input_directory, output_directory, sigma, threshold=5):
    # input image file
    image = imageio.imread(input_directory)
    image = rgb2gray(image)
    
    # Design the Prewitt filters
    prewitt_x = np.array([[1,0,-1],[1,0,-1],[1,0,-1]])
    prewitt_y = np.array([[1,1,1],[0,0,0],[-1,-1,-1]])   

    # The Gaussian filter along x-axis. Its shape is (1, sz).
    h_x = gaussian_filter_1d(sigma)

    # The Gaussian filter along y-axis. Its shape is (sz, 1).
    h_y = gaussian_filter_1d(sigma).T

    # Perform separable Gaussian smoothing
    image_smoothed = scipy.signal.convolve2d(image,h_x,mode='same',boundary='symm')
    image_smoothed = scipy.signal.convolve2d(image_smoothed,h_y,mode='same',boundary='symm')

    # Prewitt filtering
    image_filtered_x = scipy.signal.convolve2d(image_smoothed,prewitt_x,mode='same',boundary='symm')
    image_filtered_y = scipy.signal.convolve2d(image_smoothed,prewitt_y,mode='same',boundary='symm')

    # Calculate the gradient magnitude
    grad_mag = (image_filtered_x**2+image_filtered_y**2)**(1/2)

    coloring_image=np.zeros(grad_mag.shape)
    cos_thresh=math.cos(22.5/180*math.pi)
    for i in range(1,image.shape[0]-1):
        for j in range(1,image.shape[1]-1):
            vector=np.array([image_filtered_x[i,j],image_filtered_y[i,j]])
            vector=vector/(grad_mag[i,j]+0.0000001)
            if(~(vector[0]>=cos_thresh or vector[0]<=-cos_thresh)):
                if(grad_mag[i,j]>grad_mag[i+1,j] and grad_mag[i,j]>grad_mag[i-1,j]):
                    coloring_image[i,j]=grad_mag[i,j]
            elif(~(vector[1]>=cos_thresh or vector[1]<=-cos_thresh)):
                if(grad_mag[i,j]>grad_mag[i,j+1] and grad_mag[i,j]>grad_mag[i,j-1]):
                    coloring_image[i,j]=grad_mag[i,j]
            elif(~((vector[0]<=cos_thresh and vector[1]<=cos_thresh)or(vector[0]>=-cos_thresh and vector[1]>=-cos_thresh))):
                if(grad_mag[i,j]>grad_mag[i+1,j+1] and grad_mag[i,j]>grad_mag[i-1,j-1]):
                    coloring_image[i,j]=grad_mag[i,j]
            else:
                if(grad_mag[i,j]>grad_mag[i+1,j-1] and grad_mag[i,j]>grad_mag[i-1,j+1]):
                    coloring_image[i,j]=grad_mag[i,j]
                
    #inverse image binaryzation with user specified threshold

    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            if(coloring_image[i,j]>threshold):
                coloring_image[i,j]=0
            else:
                coloring_image[i,j]=255
                
    # Display the gradient magnitude image
    # plt.imshow(coloring_image, cmap='gray')
    # plt.gcf().set_size_inches(10, 8)
    # plt.show()
    # return image
    # plt.savefig('logo2.png')
    imageio.imsave(output_directory, coloring_image)


##********************** Example Main *************************##
    
# if __name__ == "__main__":
#     # # Read the image
#     # image = imageio.imread('Logo.png')
#     # image = rgb2gray(image)
#     # # plt.imshow(image, cmap='gray')
#     # # plt.gcf().set_size_inches(10, 8)
#     # # plt.show()
#     # sigma = 5
#     # threshold = 5
#     Canny('Logo.png','Logo2.png',5)

