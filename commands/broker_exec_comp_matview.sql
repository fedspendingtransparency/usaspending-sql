drop materialized view if exists exec_comp_lookup;

create materialized view exec_comp_lookup as (
	select distinct on (awardee_or_recipient_uniqu)
		awardee_or_recipient_uniqu,
		high_comp_officer1_full_na,
		high_comp_officer1_amount,
		high_comp_officer2_full_na,
		high_comp_officer2_amount,
		high_comp_officer3_full_na,
		high_comp_officer3_amount,
		high_comp_officer4_full_na,
		high_comp_officer4_amount,
		high_comp_officer5_full_na,
		high_comp_officer5_amount
	from executive_compensation
	where 
		coalesce(high_comp_officer1_full_na, '') != '' or
		coalesce(high_comp_officer1_amount, '') != '' or
		coalesce(high_comp_officer2_full_na, '') != '' or
		coalesce(high_comp_officer2_amount, '') != '' or
		coalesce(high_comp_officer3_full_na, '') != '' or
		coalesce(high_comp_officer3_amount, '') != '' or
		coalesce(high_comp_officer4_full_na, '') != '' or
		coalesce(high_comp_officer4_amount, '') != '' or
		coalesce(high_comp_officer5_full_na, '') != '' or
		coalesce(high_comp_officer5_amount, '') != ''
	order by awardee_or_recipient_uniqu, created_at desc
);