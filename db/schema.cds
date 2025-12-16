namespace my.po.management;

using {
    cuid,
    managed
} from '@sap/cds/common.cds';

type PurchaseOrderNum : String(10);

type ApprovalStatus   : Integer enum {
    created = 1;
    pending = 2;
    approved = 3;
    rejected = 4;
}

@assert.unique: {uniqueHeader: [PurchaseOrder]}
entity PurchaseOrder : cuid, managed {
    PurchaseOrder              : PurchaseOrderNum not null;
    PurchaseOrderType          : String(4) not null;
    PurchaseOrderDate          : Date;
    Supplier                   : String(10) not null;
    CompanyCode                : String(4);
    PurchasingOrganization     : String(4);
    PurchasingGroup            : String(3);
    PurchasingProcessingStatus : String(2);
    ReleaseCode                : String(1);
    DocumentCurrency           : String(3);
    ExchangeRate               : Decimal(9, 5);
    PaymentTerms               : String(4);
    IncotermsClassification    : String(3);
    IncotermsTransferLocation  : String(28);
    ApprovalStatus             : ApprovalStatus;
    TotalAmount                : Decimal(15, 2);
    DeliveryDate               : Date;
    SupplyingPlant             : String(4);
    HeaderNote                 : String(255);

    _PurchaseOrderItem         : Composition of many PurchaseOrderItem
                                     on _PurchaseOrderItem._PurchaseOrder = $self;
}

@assert.unique: {uniqueItem: [
    PurchaseOrder,
    PurchaseOrderItem
]}
entity PurchaseOrderItem : cuid, managed {
    PurchaseOrder             : PurchaseOrderNum not null;
    PurchaseOrderItem         : String(5) not null;
    Material                  : String(18);
    PurchaseOrderItemText     : String(40);
    MaterialGroup             : String(9);
    Plant                     : String(4) not null;
    CompanyCode               : String(4);
    OrderQuantity             : Decimal(13, 3);
    PurchaseOrderQuantityUnit : String(3);
    NetPriceAmount            : Decimal(11, 2);
    DocumentCurrency          : String(3);
    DeliveryDate              : Date;

    _PurchaseOrder            : Association to PurchaseOrder;
}
