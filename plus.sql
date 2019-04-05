drop function if exists plus(lvarchar, lvarchar);

create function plus(s1 lvarchar, s2 lvarchar)
	returning lvarchar;
    return s1 || s2;
end function;

-- select sum(name::lvarchar) from tab1 group by id


