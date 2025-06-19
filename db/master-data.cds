namespace com.zomoto.food.delivery.management.masterdata;

@cds.autoexpose  @readonly
entity OrderStatus {
    key code        : Integer;
        description : String(20);
}

type Gender       : String enum {
    Male = 'M';
    Female = 'F';
    Other = 'O';
}

type FoodCatagory : String enum {
    Veg = 'V';
    NonVeg = 'N';
    Both = 'B';
}
