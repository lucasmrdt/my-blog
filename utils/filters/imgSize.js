const path = require("path");

module.exports = function imgSize(src, size = "960", format = "jpeg") {
  const extension = path.extname(src);
  const name = path.basename(src, extension);
  const dirname = "/assets/images/";
  if (extension === ".gif") {
    return `${dirname}${name}${extension}`;
  }
  /**
   * A path directory for the <img src> attribute
   * e.g. /img/ for <img src="/img/MY_IMAGE.jpeg">
   */
  return `${dirname}${name}-${size}.${format}`;
};
