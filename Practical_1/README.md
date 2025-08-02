# Practical 1: 

This experiment demonstrates the processing of an RGB image using MATLAB. It includes:
- Separating Red, Green, and Blue planes
- Converting the RGB image to Grayscale 
- Converting the RGB image to a Black & White image

---

## 📁 Folder Structure


| File Name                                           | Description                                 |
|-----------------------------------------------------|---------------------------------------------|
| `vin.png`                                           | Input RGB image                             |
| `sylvester_RGB_Planes_RGB_To_Gray_RGB_To_BW.m`      | MATLAB code                                 |
| `Output/B&W.png`                                    | Output (black & white) image                |
| `Red_Plane_Image.png`                               | Red color plane image                       |
| `Green_Plane_Image.png`                             | Green color plane image                     |
| `Blue_Plane_Image.png`                              | Blue color plane image                      |
| `GreyScale_Image.png`                               | Grayscale image                             |


---

## 🧾 Code Summary

- MATLAB script reads the input RGB image
- Extracts the individual Red, Green, and Blue channels
- Calculates the average of RGB to convert the image to grayscale
- Applies a threshold (0.5) to convert grayscale to black and white

---

