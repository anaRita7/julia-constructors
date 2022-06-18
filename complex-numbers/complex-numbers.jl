import Base: +, -, *, /, abs, conj, real, imag

struct ComplexNumber{T<:Real} <: Number
    real::T
    imag::T
end

ComplexNumber(real::Real, imag::Real) = ComplexNumber(promote(real,imag)...)

abs(c::ComplexNumber) = sqrt(c.real^2+c.imag^2)
conj(c::ComplexNumber) = ComplexNumber(c.real, - c.imag)
real(c::ComplexNumber) = c.real 
imag(c::ComplexNumber) = c.imag 

+(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.real + c2.real, c1.imag + c2.imag)
-(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.real - c2.real, c1.imag - c2.imag)
*(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.real*c2.real - c1.imag*c2.imag, c1.real*c2.imag + c1.imag*c2.real)
/(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(Float64(c1.real * c2.real + c1.imag * c2.imag)/abs(c2)^2 , Float64(c1.imag * c2.real - c1.real * c2.imag)/abs(c2)^2)
≈(c1::ComplexNumber, c2::ComplexNumber) = isapprox(c1.real, c2.real) && isapprox(c1.imag, c2.imag)


