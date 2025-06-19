namespace com.zomoto.food.delivery.management;

using {com.zomoto.food.delivery.management.masterdata} from './master-data';

using {
    cuid,
    Currency,
    managed,
    Country
} from '@sap/cds/common';

entity SuperUser : cuid {
    userID    : Integer;
    firstName : String(20);
    lastName  : String(20);
    email     : String(50);
}

entity Customer : cuid {
    customerID  : Integer @Core.Computed;
    firstName   : String(20);
    lastName    : String(20);
    fullName    : String(50);
    email       : String(50);
    phoneNumber : Integer;
    dateOfBirth : Date;
    gender      : masterdata.Gender;
    address     : String(200);
    street      : String(50);
    landMark    : String(50);
    city        : String(20);
    postalCode  : String(6);
    country     : Country;
    // associations and compositions
    orders      : Composition of many Order
                      on orders.to_Customer = $self;
}

entity Order : cuid, managed {
    orderID        : Integer @Core.Computed;
    orderDate      : Timestamp;
    tax            : Integer @readonly default 8;
    subTotal       : Integer @readonly;
    total          : Integer @readonly;
    currency       : Currency;
    // associations and compositions
    to_OrderStatus : Association to masterdata.OrderStatus;
    to_Customer    : Association to Customer;
    foodItems      : Composition of many FoodItem
                         on foodItems.to_Order = $self;
}

entity FoodItem : cuid {
    quantity        : Integer default 1;
    unitOfMeasure   : String(20);
    unitPrice       : Integer;
    totalPrice      : Decimal(10, 2);
    currency        : Currency;
    // associations and compositions
    to_Order        : Association to Order;
    to_FoodCatagory : masterdata.FoodCatagory;
    to_Hotel        : Association to Hotel;
}

entity Hotel : cuid {
    hotelID         : Integer;
    hotelName       : String(25);
    email           : String(50);
    phoneNumber     : Integer;
    address         : String(100);
    city            : String(20);
    postalCode      : Integer;
    country         : Country;
    website         : String(100);
    starRating      : Decimal(10, 2);
    IsActive        : Boolean default true;
    // associations and compositions
    to_FoodCatagory : masterdata.FoodCatagory;
    foodItems       : Composition of many FoodItem
                          on foodItems.to_Hotel = $self;
}

entity DeliveryBoy : cuid {
    deliveryBoyID : Integer;
    firstName     : String(20);
    lastName      : String(20);
    email         : String(50);
    phoneNumber   : Integer;
    IsAvailable   : Boolean;
}
