import Base: +, -

struct ComplexNumber{T<:Real} <: Number
    real::T
    imag::T
end

ComplexNumber(real::Real, imag::Real) = ComplexNumber(promote(real,imag)...)

+(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.real + c2.real, c1.imag + c2.imag)

-(c1::ComplexNumber, c2::ComplexNumber) = ComplexNumber(c1.real - c2.real, c1.imag - c2.imag)