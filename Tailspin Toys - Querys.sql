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
	s.OrderNumber as SalesID,
	s.ProductID,
	st.StateID,
	CONVERT(DATETIME, s.OrderDate) as OrderDate,
	s.Quantity,
	s.UnitPrice,
	s.Quantity*s.UnitPrice as SubTotal,
	s.DiscountAmount,
	(s.Quantity*s.UnitPrice)-s.DiscountAmount as Total,
	ISNULL(s.PromotionCode, '') as PromotionCode
from
	Sales s
	inner join Product p on s.ProductID = p.ProductID
	inner join State st on s.CustomerStateID = st.StateID;