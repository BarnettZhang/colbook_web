#!/bin/bash

rm -rf .coverage coverage.info

time ./build/cld --src ./data/eagle2.jpg -o output.jpg --ETF_iter 1 --CLD_iter 3 --sigma_m 3 --rho 0.99 --tau 0.9 --debug_img


if ! which lcov; then
    exit 0
fi

lcov \
    --capture \
    --directory build/CMakeFiles/cld.dir/src \
    --output-file coverage.info \
    --test-name coverageHtml

lcov --remove coverage.info '/usr/*' -o coverage.info > /dev/null

genhtml -o .coverage coverage.info

# clean up
rm *.jpg