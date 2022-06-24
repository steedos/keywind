rm -rf build
mkdir build

cp -r META-INF build
cp -r theme build

cd build

jar cvf ../steedos-theme.jar *