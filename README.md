# Head Tracking In Godot HTML5
This repo is a demo of 3D headtracking in the Godot game engine, making easyier for people to try head-tracking out and build interesting game mechanics with it.

# View it online:
- demo: https://williamsokol.github.io/HeadTrackingInGodotHTML5/
- video: 
- 



# Future Optimizations
- Make it is the OpenCV is using the LBP method for face detection instead of HAAR as it is supposed to be around 3x faster
- Use wasm to do opencv as it have seen it go 2-3x as fast
- Make use of a profileface data set to also track when you are not facing the camera directly
- Try to keep onto the nearest similar pixels rather a doing a face detection every frame
- Make Godot Build with the OpenCV.js already inside of it


# Credits To:
- inspired by Johnny Lee https://www.youtube.com/watch?v=Jd3-eiid-Uw
- OpenCV.js demo: https://github.com/huningxin/opencv.js <br/>
- "room interior designs" by Ghozali.Ghozalu is licensed under Creative Commons Attribution (http://creativecommons.org/licenses/by/4.0/).
- Right now only William Sokol working on repo https://williamsokol.github.io/
