
DECLARE @json NVARCHAR(4000)
SET @json = 
N'{
    "info":{  
      "type":1,
      "address":{  
        "town":"Bristol",
        "county":"Avon",
        "country":"England"
      },
      "tags":["Sport", "Water polo"]
   },
   "type":"Basic"
}'

select JSON_QUERY (@json,'$.info.tags') as tags
select JSON_VALUE (@json, '$.info.address.town') as town
select JSON_VALUE (@json, '$.type') as town


select
*
from OPENJSON (@json)
with
(
	typeinfo int '$.info.type' 
)
