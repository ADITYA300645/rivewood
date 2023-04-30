var Url = "http://192.168.56.1:3000";

String productImageUrl(String productId, int porsterIndex) =>
    "$Url/products/productImages/$productId/$porsterIndex";

String productObjModelUrl(String productId) =>
    "$Url/products/productModel/obj/$productId";

String productMtlModelUrl(String productId) =>
    "$Url/products/productModel/mlt/$productId";
