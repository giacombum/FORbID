!< FORbID integrator: provide the Newton-Cotes formulas.
module FORbID_integrator_newton_cotes
!-----------------------------------------------------------------------------------------------------------------------------------
!< FORbID integrator: provide the Newton-Cotes formulas.
!<
!< Considering the following problem:
!<
!< $$ \int_a^b f(x) = ? $$
!<
!< where \(f(x)\), a generic integrand function, the problem is to perform its definite integral.
!< The Newton-Cotes formulas can be generically expressed by the
!<
!< $$ \int_a^b f(x) = \frac{(b-a)}{k} \sum_{i=1}^n w_i f\left( a + i \frac{(b-a)}{n} \right) $$
!< where $k$ is a parameter depending on the particular Newton-Cotes formula, $w_i$ are the weights also depending on the
!< Newton-Cotes formula and $n$ is the degree of the Newton-Cotes formula.
!<
!<##### Trapezoidal Rule, 1st order
!< The formula can be written as:
!< $$ \frac{h}{2} \left( f_0 + f_1 \right)$$
!< with
!< $$n = 1$$
!< $$k = 2$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 1 \\ 1 \end{array}} \right]$$
!<
!<##### Cavalieri-Simpson's Rule, 2nd order
!< The formula can be written as:
!< $$ \frac{h}{3} \left( f_0 + 4 f_1 + f_2 \right)$$
!< with
!< $$n = 2$$
!< $$k = 3$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 1 \\ 4 \\ 1 \end{array}} \right]$$
!<
!<##### Cavalieri-Simpson's Rule with 3/8 factor, 3rd order
!< The formula can be written as:
!< $$ \frac{3h}{8} \left( f_0 + 3 f_1 + 3 f_2 + f_3 \right)$$
!< with
!< $$n = 3$$
!< $$k = \frac{3}{8}$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 1 \\ 3 \\ 3 \\ 1 \end{array}} \right]$$
!<
!<##### Boole's Rule, 4th order
!< The formula can be written as:
!< $$ \frac{2h}{45} \left( 7 f_0 + 32 f_1 + 12 f_2 + 32 f_3 + 7 f_4 \right)$$
!< with
!< $$n = 4$$
!< $$k = \frac{2}{45}$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 7 \\ 32 \\ 12 \\ 32 \\ 7 \end{array}} \right]$$
!<
!<##### Newton-Cotes 6 points Rule, 5th order
!< The formula can be written as:
!< $$ \frac{5h}{288} \left( 19 f_0 + 75 f_1 + 50 f_2 + 50 f_3 + 75 f_4 + 19 f_5 \right)$$
!< with
!< $$n = 5$$
!< $$k = \frac{5}{288}$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 19 \\ 75 \\ 50 \\ 50 \\ 75 \\ 19 \end{array}} \right]$$
!<
!<##### Newton-Cotes 7 points Rule, 6th order
!< The formula can be written as:
!< $$ \frac{h}{140} \left( 41 f_0 + 216 f_1 + 27 f_2 + 272 f_3 + 27 f_4 + 216 f_5 + 41 f_6 \right)$$
!< with
!< $$n = 6$$
!< $$k = \frac{1}{140}$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 41 \\ 216 \\ 27 \\ 272 \\ 27 \\ 216 \\ 41 \end{array}} \right]$$
!<
!<##### Newton-Cotes 8 points Rule, 7th order
!< The formula can be written as:
!< $$ \frac{7h}{17280} \left( 751 f_0 + 3577 f_1 + 1323 f_2 + 2989 f_3 + 2989 f_4 + 1323 f_5 + 3577 f_6 + 751 f_7 \right)$$
!< with
!< $$n = 7$$
!< $$k = \frac{1}{140}$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 751 \\ 3577 \\ 1323 \\ 2989 \\ 2989 \\ 1323 \\ 3577 \\ 751 \end{array}} \right]$$
!<
!<##### Newton-Cotes 9 points Rule, 8th order
!< The formula can be written as:
!< $$ \frac{4h}{14175} \left( 989 f_0 + 5888 f_1 - 928 f_2 + 10496 f_3 - 4540 f_4 + 10496 f_5 - 928 f_6 + 5888 f_7 + 989 f_8
!< \right)$$
!< with
!< $$n = 8$$
!< $$k = \frac{4}{14175}$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 989 \\ 5888 \\ -928 \\ 10496 \\ -4540 \\ 10496 \\ -928 \\ 5888 \\ 989\end{array}}\right]$$
!<
!<##### Newton-Cotes 10 points Rule, 9th order
!< The formula can be written as:
!< $$ \frac{9h}{89600} \left( 2857 (f_0 + f_9) + 15741 (f_1 + f_8) + 1080 (f_2 + f_7) + 19344 (f_3 + f_6)+5778(f_4 + f_5)\right)$$
!< with
!< $$n = 9$$
!< $$k = \frac{4}{14175}$$
!< $$W = \left[{\begin{array}{*{20}{c}}2857 \\ 15741 \\ 1080 \\ 19344 \\ 5778 \\ 5778 \\ 19344 \\ 1080 \\ 15741 \\ 2857
!< \end{array}}\right]$$
!<
!<##### Newton-Cotes 11 points Rule, 10th order
!< The formula can be written as:
!< $$ \frac{5h}{299376} \left( 16067 (f_0 + f_10) + 106300 (f_1 + f_9) - 48525 (f_2 + f_8) + 272400 (f_3 + f_7) - 260550 (f_4 + f_6)
!< + 427368 f_5 \right)$$
!< with
!< $$n = 10$$
!< $$k = \frac{5}{299376}$$
!< $$W = \left[ {\begin{array}{*{20}{c}} 16067 \\ 106300 \\ -48525 \\ 272400 \\ -260550 \\ 427368 \\ -260550 \\ 272400 \\ -48525 \\
!< 106300 \\ 16067 \end{array}} \right]$$

!-----------------------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------------------
use FORbID_kinds, only : R_P, I_P
use FORbID_adt_integrand, only : integrand
use FORbID_adt_integrator, only : adaptive_integrator
!-----------------------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------------------
implicit none
private
public :: newton_cotes_integrator
!-----------------------------------------------------------------------------------------------------------------------------------

!-----------------------------------------------------------------------------------------------------------------------------------
type, extends(adaptive_integrator) :: newton_cotes_integrator
  !< FORbID integrator: provide the Newton-Cotes rule.
  !<
  !< @note The integrator must be initialized (initialize the coefficient and the weights) before used.
  real(R_P)              :: k        !< Coefficient for integration.
  real(R_P), allocatable :: w(:)     !< Integration weights.
  contains
    procedure, pass(self), public :: init         !< Initialize the integrator.
    procedure, pass(self), public :: integrate_1D !< Integrate integrand function.
    procedure, pass(self), public :: integrate_2D !< Integrate integrand function.
    procedure, pass(self), public :: integrate_3D !< Integrate integrand function.
endtype newton_cotes_integrator
!-----------------------------------------------------------------------------------------------------------------------------------
contains
  elemental subroutine init(self, n)
  !---------------------------------------------------------------------------------------------------------------------------------
  !< Create the Newton-Cotes integration formula: initialize the weights and the coefficient k.
  !---------------------------------------------------------------------------------------------------------------------------------
  class(newton_cotes_integrator), intent(INOUT) :: self         !< Newton-Cotes integrator.
  integer(I_P),                   intent(IN)    :: n            !< Degree of integration formula.
  self%n = n
  self%k = 0._I_P
  if (allocated(self%w)) deallocate(self%w); allocate(self%w(1:n+1)); self%w = 0._R_P
  select case(n)
  case(1)
    self%k     =  0.5_R_P
    self%w(1)  =  1._R_P
    self%w(2)  =  1._R_P
  case(2)
    self%k     =  1._R_P / 3._R_P
    self%w(1)  =  1._R_P
    self%w(2)  =  4._R_P
    self%w(3)  =  1._R_P
  case(3)
    self%k     =  3._R_P / 8._R_P
    self%w(1)  =  1._R_P
    self%w(2)  =  3._R_P
    self%w(3)  =  3._R_P
    self%w(4)  =  1._R_P
  case(4)
    self%k     =  2._R_P / 45._R_P
    self%w(1)  =  7._R_P
    self%w(2)  =  32._R_P
    self%w(3)  =  12._R_P
    self%w(4)  =  32._R_P
    self%w(5)  =  7._R_P
  case(5)
    self%k     =  5._R_P / 288._R_P
    self%w(1)  =  19._R_P;    self%w(6)  =  19._R_P
    self%w(2)  =  75._R_P
    self%w(3)  =  50._R_P
    self%w(4)  =  50._R_P
    self%w(5)  =  75._R_P
  case(6)
    self%k     =  1._R_P / 140._R_P
    self%w(1)  =  41._R_P;    self%w(6)  =  216._R_P
    self%w(2)  =  216._R_P;   self%w(7)  =  41._R_P
    self%w(3)  =  27._R_P
    self%w(4)  =  272._R_P
    self%w(5)  =  27._R_P
  case(7)
    self%k     =  7._R_P / 17280._R_P
    self%w(1)  =  751._R_P;   self%w(6)  =  1323._R_P
    self%w(2)  =  3577._R_P;  self%w(7)  =  3577._R_P
    self%w(3)  =  1323._R_P;  self%w(8)  =  751._R_P
    self%w(4)  =  2989._R_P
    self%w(5)  =  2989._R_P
  case(8)
    self%k     =  4._R_P / 14175._R_P
    self%w(1)  =  989._R_P;   self%w(6)  =  10496._R_P
    self%w(2)  =  5888._R_P;  self%w(7)  = -928._R_P
    self%w(3)  = -928._R_P;   self%w(8)  =  5888._R_P
    self%w(4)  =  10496._R_P; self%w(9)  =  989._R_P
    self%w(5)  = -4540._R_P
  case(9)
    self%k     =  9._R_P / 89600._R_P
    self%w(1)  =  2857._R_P;  self%w(6)  =  5778._R_P
    self%w(2)  =  15741._R_P; self%w(7)  =  19344._R_P
    self%w(3)  =  1080._R_P;  self%w(8)  =  1080._R_P
    self%w(4)  =  19344._R_P; self%w(9)  =  15741._R_P
    self%w(5)  =  5778._R_P;  self%w(10) =  2857._R_P
  case(10)
    self%k     =  5._R_P / 299376._R_P
    self%w(1)  =  16067._R_P; self%w(7)  = -260550._R_P
    self%w(2)  =  106300._R_P;self%w(8)  =  272400._R_P
    self%w(3)  = -48525._R_P; self%w(9)  = -48525._R_P
    self%w(4)  =  272400._R_P;self%w(10) =  106300._R_P
    self%w(5)  = -260550._R_P;self%w(11) =  16067._R_P
    self%w(6)  =  427368._R_P
  endselect
  endsubroutine init

  function integrate_1D(self, f, a, b) result(integral)
  !---------------------------------------------------------------------------------------------------------------------------------
  !< Integrate function *f* with one of the Newton-Cotes' formula chosed.
  !---------------------------------------------------------------------------------------------------------------------------------
  class(newton_cotes_integrator), intent(IN) :: self     !< Actual Newton-Cotes integrator.
  class(integrand),               intent(IN) :: f        !< Function to be integrated.
  real(R_P),                      intent(IN) :: a        !< Lower bound.
  real(R_P),                      intent(IN) :: b        !< Upper bound.
  real(R_P)                                  :: integral !< Definite integral value.
  integer(I_P)                               :: i        !< Integration index.
  !---------------------------------------------------------------------------------------------------------------------------------

  !---------------------------------------------------------------------------------------------------------------------------------
  integral = 0._R_P
  do i=0,self%n
    integral = integral + self%w(i+1_I_P) * f%f(a + i*(b-a)/self%n)
  enddo
  integral = integral * (b - a) * self%k
  return
  !---------------------------------------------------------------------------------------------------------------------------------
  endfunction integrate_1D

  function integrate_2D(self, f, a, b, c, d) result(integral)
  !---------------------------------------------------------------------------------------------------------------------------------
  !< Integrate function *f* with one of the Newton-Cotes' formula chosed.
  !---------------------------------------------------------------------------------------------------------------------------------
  class(newton_cotes_integrator), intent(IN) :: self     !< Actual Newton-Cotes integrator.
  class(integrand),               intent(IN) :: f        !< Function to be integrated.
  real(R_P),                      intent(IN) :: a        !< Lower bound.
  real(R_P),                      intent(IN) :: b        !< Upper bound.
  real(R_P),                      intent(IN) :: c        !< Lower bound.
  real(R_P),                      intent(IN) :: d        !< Upper bound.
  real(R_P)                                  :: integral !< Definite integral value.
  !---------------------------------------------------------------------------------------------------------------------------------
  endfunction integrate_2D

  function integrate_3D(self, f, a, b, c, d, g, h) result(integral)
  !---------------------------------------------------------------------------------------------------------------------------------
  !< Integrate function *f* with one of the Newton-Cotes' formula chosed.
  !---------------------------------------------------------------------------------------------------------------------------------
  class(newton_cotes_integrator), intent(IN) :: self     !< Actual Newton-Cotes integrator.
  class(integrand),               intent(IN) :: f        !< Function to be integrated.
  real(R_P),                      intent(IN) :: a        !< Lower bound.
  real(R_P),                      intent(IN) :: b        !< Upper bound.
  real(R_P),                      intent(IN) :: c        !< Lower bound.
  real(R_P),                      intent(IN) :: d        !< Upper bound.
  real(R_P),                      intent(IN) :: g        !< Lower bound.
  real(R_P),                      intent(IN) :: h        !< Upper bound.
  real(R_P)                                  :: integral !< Definite integral value.
  !---------------------------------------------------------------------------------------------------------------------------------
  endfunction integrate_3D

!  recursive subroutine adaptive_integrate(self, f, a, b, b_orig, tol, ad_integral)
!  !---------------------------------------------------------------------------------------------------------------------------------
!  !< Integrate adaptively function *f* with one of the Newton-Cotes' formula chosed.
!  !---------------------------------------------------------------------------------------------------------------------------------
!  class(newton_cotes_integrator), intent(IN)  :: self                  !< Actual Newton-Cotes integrator.
!  class(integrand),               intent(IN)  :: f                     !< Function to be integrated.
!  real(R_P),                      intent(IN)  :: a, b                  !< Lower and Upper bounds.
!  real(R_P),                      intent(IN)  :: b_orig                !< Original upper bound.
!  real(R_P),                      intent(IN)  :: tol                   !< Tolerance error.
!  real(R_P),                      intent(OUT) :: ad_integral           !< Definite integral value.
!  real(R_P)                                   :: h                     !< Integration step.
!  real(R_P)                                   :: first_int, second_int !< Temporary integration results.
!  !---------------------------------------------------------------------------------------------------------------------------------
!
!  !---------------------------------------------------------------------------------------------------------------------------------
!  h = (b - a) / 2._R_P
!  first_int  = self%integrate(self, f=f, a=a, b=b)
!  second_int = self%integrate(self, f=f, a=a, b=a+h) + self%integrate(self, f=f, a=a+h, b=b)
!  if ((abs(second_int - first_int))<tol) then
!    ad_integral = second_int + ad_integral
!    if ((b_orig - b)>tol) call adaptive_integrate(self, f=f, a=b, b=a+2._R_P*h, tol=tol, b_orig=b_orig, ad_integral=ad_integral)
!  else
!    call adaptive_integrate(self, f=f, a=a, b=a+h, tol=tol/2._R_P, b_orig=b_orig, ad_integral=ad_integral)
!  endif
!  end subroutine adaptive_integrate
endmodule FORbID_integrator_newton_cotes
