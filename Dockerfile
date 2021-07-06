FROM osgeo/gdal:ubuntu-small-3.3.1

# System packages 
RUN apt-get update && apt-get install -y curl python3-pip git-all
# Python packages from conda
RUN pip3 install cython opencv-python tqdm scikit-image torch torchvision segmentation-models-pytorch
RUN pip3 install --upgrade timm

RUN git clone https://github.com/pubgeo/monocular-geocentric-pose
RUN cd monocular-geocentric-pose/utilities && python3 cythonize_invert_flow.py build_ext --inplace
