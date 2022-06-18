struct ComplexNumber{T<:Real} <: Number
    real::T
    imag::T
end

ComplexNumber(real::Real, imag::Real) = ComplexNumber(promote(real,imag)...)
