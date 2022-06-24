yarn build 

rm -rf build
mkdir build

cp -r META-INF build

mkdir build/theme
mkdir build/theme/steedos
cp -r theme/keywind/* build/theme/steedos

cd build

jar cvf ../steedos-theme.jar *