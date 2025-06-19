using {com.zomoto.food.delivery.management as ZomatoModel} from '../db/schema';
// using {com.zomoto.food.delivery.management.masterdata as masterdata} from '../db/master-data';

service MyService {
    entity Orders    as projection on ZomatoModel.Order;
    entity Customers as projection on ZomatoModel.Customer;
    entity Hotels    as projection on ZomatoModel.Hotel;
    entity FoodItems as projection on ZomatoModel.FoodItem;
// entity orderStatus as projection on masterdata.OrderStatus;
// entity foodItem    as projection on ZomatoModel.FoodItem;
}
