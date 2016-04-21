def ftoc(f)
	c = (((f - 32.0) * 5.0) /9.0)
	return c
end

def ctof(c)
	f= (((c*9.0) /5.0) +32.0)
	return f
end