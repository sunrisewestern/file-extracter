# File Extractor Script - Extract Files by Extension or Format
This script allows you to extract files from multiple nested directories based on file extension or predetermined file formats.
## Usage:
To use the script, run the following command:
```
./file_extractor [-m] [-n] [-o OUTPUT_DIR] TARGET_FOLDER [FILE_EXTENSION | FILE_FORMAT]
```
### Optional Arguments:
- `-h`: Display this help message and exit.
- `-m`: Move files to the destination instead of copying them (default is to copy).
- `-n`: Do not add a prefix to the name of the extracted files. Use this option only if there are no duplicate filenames.
- `-o OUTPUT_DIR`: Specify an output directory. A new folder will be created inside this directory to store the extracted files.
### File Formats:
You can specify a file extension (e.g., `.jpg`, `.mp4`) or use one of the following predefined file format identifiers:
- `[p|pic|picture]`: Image formats including BMP, JPG, JPEG, PNG, GIF.
- `[v|vid|video]`: Video formats including 3GP, ASF, AVI, FLV, M4V, MKV, MOV, MP4, MPEG, MPG, MPG2, MPG4, RMVB, WMV, MTS.
- `[a|aud|audio]`: Audio formats including WAV, MID, CDA, MP3, WMA, AAC, RA, OGG, APE, FLAC, M4A, M4P, AIF, AIFF.
If no `FILE_EXTENSION` or `FILE_FORMAT` is specified, the script will extract all files into a folder named "all".
### Output Directory:
If no `OUTPUT_DIR` is specified, the script will create a directory in the current working path with the same name as the specified file extension or format.
## Example:
To copy all JPG images from a folder called "Photos" into a new folder within "Photos" called "jpg":
```
./file_extractor Photos jpg
```
To move all video files from a folder "Videos" to a specified output directory "MyVideos":
```
./file_extractor -m -o MyVideos Videos v
```
This script simplifies the process of organizing your files by type, making it easy to locate and manage your digital content.
