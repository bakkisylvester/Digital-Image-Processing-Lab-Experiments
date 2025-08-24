# Practical 4:  

This experiment demonstrates **lossy image compression** techniques using MATLAB. It includes:

- **Arithmetic Coding** for entropy-based compression of an image.  
- **JPEG Compression** using Discrete Cosine Transform (DCT) and Quantization.  

---

## 📁 Folder Structure

| File Name                                           | Description                                        |
|-----------------------------------------------------|----------------------------------------------------|
| `vin.png`                                           | Input grayscale image for both compressions        |
| `Arithmetic_coding.m`                               | MATLAB code for Arithmetic Coding                  |
| `Output_image.fig`                                  | Output of Arithmetic Coding                        |
| `jpeg_comp.m`                                       | MATLAB code for JPEG Compression (DCT + Quant.)    |
| `output.fig`                                        | Output of JPEG Compression                         |

---

## 🧾 Code Summary  

### Arithmetic Coding
- Reads the input grayscale image  
- Encodes pixel values into a compressed binary stream  
- Demonstrates how entropy coding reduces data size  

### JPEG Compression
- Divides the image into an 8×8 block  
- Applies **DCT** to convert spatial to frequency domain  
- Performs **Quantization** to reduce high-frequency components  
- Reconstructs the image via **Inverse DCT**  
- Displays original vs compressed image with compression ratio  

---

