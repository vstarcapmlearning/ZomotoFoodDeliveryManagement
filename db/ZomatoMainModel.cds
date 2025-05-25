namespace com.zomoto.food.delivery.management.mainmodel;

using {com.zomoto.food.delivery.management.masterdata as MasterDataModel} from './MasterDataModel';

using {
    cuid,
    Currency,
    managed,
    Country
} from '@sap/cds/common';

entity SuperUser {
    userID    : Integer;
    firstName : String(20);
    lastName  : String(20);
    email     : String(50);
}

entity Customer : cuid {
    customerID  : Integer;
    firstName   : String(20);
    lastName    : String(20);
    fullName    : String(50);
    email       : String(50);
    phoneNumber : Integer;
    dateOfBirth : Date;
    gender      : Association to MasterDataModel.Gender;
    address     : String(200);
    street      : String(50);
    landMark    : String(50);
    city        : String(20);
    postalCode  : String(6);
    country     : Country;
    // associations and compositions
    _order      : Composition of many Order
                      on _order._customer = $self;
}

entity Order : cuid, managed {
    orderID      : Integer;
    orderDate    : Date;
    discount     : Integer;
    subTotal     : Integer;
    total        : Integer;
    tax          : Integer;
    currency     : Currency;
    // associations and compositions
    _orderStatus : Association to MasterDataModel.OrderStatus;
    _customer    : Association to Customer;
    _foodItem    : Composition of many FoodItem
                       on _foodItem._order = $self;
}

entity FoodItem : cuid {
    foodItemID    : Integer;
    catagory      : String(20);
    quantity      : String(20);
    unitOfMeasure : String(20);
    unitPrice     : Integer;
    discount      : String(10);
    toalPrice     : Integer;
    currency      : Currency;
    // associations and compositions
    _order        : Association to Order;
    _foodCatagory : Association to FoodItemCatagory;
}

entity FoodItemCatagory : cuid {
    foodItemCatagoryID   : Integer;
    foodItemCatagoryName : String(20);
    hotel                : Composition of Hotel;
}

entity Hotel : cuid {
    hotelID       : Integer;
    hotelName     : String(25);
    email         : String(50);
    phoneNumber   : Integer;
    address       : String(100);
    city          : String(20);
    postalCode    : Integer;
    country       : Country;
    website       : String(100);
    starRating    : Integer;
    IsActive      : Boolean;
    // associations and compositions
    _foodCatagory : Composition of many FoodItemCatagory
                        on _foodCatagory.hotel = $self;
}

entity DeliveryBoy : cuid {
    deliveryBoyID : Integer;
    firstName     : String(20);
    lastName      : String(20);
    email         : String(50);
    phoneNumber   : Integer;
    isAvailable   : Boolean;
}
