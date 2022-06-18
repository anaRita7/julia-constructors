import Base: +, -, *, /

struct ComplexNumber{T<:Real} <: Number
    real::T
    imag::T
end

ComplexNumber(real::Real, imag::Real) = ComplexNumber(promote(real,imag)...)

+(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.real + c2.real, c1.imag + c2.imag)

-(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.real - c2.real, c1.imag - c2.imag)

*(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.real*c2.real - c1.imag*c2.imag, c1.real*c2.imag + c1.imag*c2.real)

/(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(Float64(c1.real * c2.real + c1.imag * c2.imag)/(c2.real^2 + c2.imag^2) , Float64(c1.imag * c2.real - c1.real * c2.imag)/(c2.real^2 + c2.imag^2))

≈(c1::ComplexNumber, c2::ComplexNumber) = isapprox(c1.real, c2.real) && isapprox(c1.imag, c2.imag)

function abs(c::ComplexNumber) return sqrt(c.real^2+c.imag^2) end