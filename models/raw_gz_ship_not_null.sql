# schema.yml
version: 2
sources:
	- name: raw
	  schema: gz_raw_data
	  tables:
		- name: sales
		  identifier: raw_gz_sales
		  description: Table description
	  # Freshness testing - make sure to fill in the ...
	  loaded_at_field: &quot;CAST(... AS TIMESTAMP)&quot;
	  freshness:
		warn_after: { ... }
	  columns:
		- name: date_date
		  description: date of purchase</code></pre>
