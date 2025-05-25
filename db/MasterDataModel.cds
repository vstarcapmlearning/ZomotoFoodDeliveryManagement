namespace com.zomoto.food.delivery.management.masterdata;

entity OrderStatus {
    code        : Integer;
    description : String(20);
}

entity Gender {
    code        : Integer;
    description : String(10);
}

entity FoodItemCatagory {
    catagoryID          : Integer;
    catagoryDescription : String(20);
}
