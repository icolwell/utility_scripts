# Utility Scripts

This repo contains an assortment of various utility scripts.
I typically use them to automate semi-routine tasks.

**hevc_to_avc.bash [input_dir] [output_dir]**  
Converts mkv video files with HEVC encoding to mpg files with AVC encoding.
If files are sorted into subfolders (such as seasons of a TV show), provide the path to the root folder and the script will replicate the subfolder structure at the destination.
The file extensions (container) can likely be changed to convert other formats with some small modifications.

**convert_receipts.bash [dir_containing_photos]**
Takes high resolution `jpg` photos (photos taken from modern smartphones for example) and downscales them by 50% in addition to removing colour.
The motivation behind this script is to reduce the size of photos of receipts for work expenses.
