Extract file from multiple folders by extention or format

### usage:
      ./file_extracter [-m] [-n] [-o] target_folder [file_extention | file_format]  
      optional arguments:
            -h  Print this help message and exit
            -m  Move (instead of copy)
            -n  No prefix ahead filename (use only if no duplicated filenames)
            -o output_dir   Specify an output path, a new dir will be built in this directory.
      file_format: [p|pic|picture] - BMP JPG JPEG PNG GIF   
                   [v|vid|video] - 3GP ASF AVI FLV M4V MKV MOV MP4 MPEG MPG MPG2 MPG4 RMVB WMV MTS  
                   [a|aud|audio] - WAV MID CDA MP3 WMA AAC RA OGG APE FLAC M4A M4P AIF AIFF AVI  
      
If no specific output_dir, output_dir will be created in current path with a name same as file_extention or file_format.

If no file_extention or file format specify, extract all files into an "all" folder.
 
      
