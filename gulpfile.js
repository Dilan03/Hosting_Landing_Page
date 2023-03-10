const {src, dest, watch, series} = require('gulp');
const compileSass = require('gulp-sass')(require('node-sass'));
const prefix = require('gulp-autoprefixer');

function compileeCSS() {
    return src('src/scss/style.scss')
        .pipe(compileSass())
        .pipe(prefix())
        .pipe(dest('public/css'))
}

function watchTask() {
    watch('src/scss/**/*.scss', compileeCSS)
}

exports.default = series(
    compileeCSS,
    watchTask
)