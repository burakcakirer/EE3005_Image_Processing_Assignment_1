# EE3005 Image Processing - Assignment 1

**Topic:** Fundamentals of Image Representation and Enhancement  
**Student:** Burak Bekir Çakırer  
**Student ID:** 2211011008

This repository contains the complete MATLAB implementation, supplied biomedical image samples, generated results, and the final Word report for Assignment 1.

## Repository structure

```text
EE3005_Image_Processing_Assignment_1/
├── README.md
├── .gitignore
├── GITHUB_DESKTOP_STEPS.md
├── data/                         # Provided JPEG/PNG/DICOM samples (plus a true-PNG copy of the supplied RGB sample for MATLAB compatibility)
├── docs/
│   └── Assignment_1_Instructions.pdf
├── src/                          # MATLAB source code
│   ├── main.m
│   ├── displayMatrixRepresentation.m
│   ├── separateRGBChannels.m
│   ├── displayDicomMetadata.m
│   ├── pointOperations.m
│   ├── plotRGBHistograms.m
│   └── clipUint8.m
├── outputs/                      # Figures and numerical outputs
└── report/
    ├── EE3005_Assignment1_Report.docx
    └── EE3005_Assignment1_Report.pdf
```

## MATLAB requirements

- MATLAB
- Image Processing Toolbox (required for `dicomread`, `dicominfo`, `imhist`, and `histeq`)

## How to run

1. Open MATLAB.
2. Set the Current Folder to this repository.
3. Open `src/main.m`.
4. Click **Run**.
5. The generated figures are saved in `outputs/`.

The script uses relative paths, so it does not depend on a specific Windows drive or username.

## Assignment coverage

- Task 1: Image reading and matrix representation
- Task 2: RGB channel separation
- Task 3: Summary and real-world applications
- Task 4: DICOM image reading and metadata extraction
- Task 5: Brightness, contrast and negative point operations
- Task 6: Grayscale and RGB histogram analysis
- Task 7: Global histogram equalization
- Task 8: Comparison of point enhancement and histogram equalization

The final report includes explanations, figures, observations, challenges, and MATLAB code excerpts for all tasks.
