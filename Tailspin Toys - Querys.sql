-- Consultas para obtener la data de los Datawarehouse
-- A continuacion se muestran todos los campos de las dimensiones:

-- DimProduct
select 
	ProductID,
	ProductSKU,
	ProductName, 
	ProductCategory, 
	ItemGroup, 
	Demographic, 
	case KitType 
		when 'RTF' then 'Ready to Fly'
		when 'KIT' then 'Kit para ensamblar'
		else 'Otro'
	end as KitType
from Product;

-- DimState
select
	s.StateID,
	s.StateCode,
	s.StateName,
	r.RegionName,
	CASE s.TimeZone
		WHEN 'AKST' THEN 'Alaska Standard Time'
		WHEN 'CST' THEN 'Central Standard Time'
		WHEN 'EST' THEN 'Eastern Standard Time'
		WHEN 'MST' THEN 'Mountain Standard Time'
		WHEN 'PST' THEN 'Pacific Standard Time'
		WHEN 'HST' THEN 'Hawaii-Aleutian Standard Time'
		ELSE 'Otra'
	END as TimeZone
from 
	State s join region r on s.RegionID = r.RegionID;

-- FactSales
select
	OrderNumber,
	OrderDate,
	ShipDate,
	Quantity,
	UnitPrice,
	Quantity*UnitPrice as SubTotal,
	DiscountAmount,
	(Quantity*UnitPrice)-DiscountAmount as Total
from
	Sales;