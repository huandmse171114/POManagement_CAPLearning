using my.po.management as db from '../db/schema';

service PurchaseOrderService @(path: '/purchase-order') {

    entity PurchaseOrder     as
        projection on db.PurchaseOrder {
            *
        }
        excluding {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy
        };

    entity PurchaseOrderItem as
        projection on db.PurchaseOrderItem {
            PurchaseOrder,
            PurchaseOrderItem,
            Material,
            PurchaseOrderItemText,
            MaterialGroup,
            Plant,
            CompanyCode,
            OrderQuantity,
            PurchaseOrderQuantityUnit,
            NetPriceAmount,
            DocumentCurrency,
            DeliveryDate,
            _PurchaseOrder
        };

}

service AdminService @(path: '/admin') {

    entity PurchaseOrder     as projection on db.PurchaseOrder;
    entity PurchaseOrderItem as projection on db.PurchaseOrderItem;

}
