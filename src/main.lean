import data.complex.exponential
import data.real.sign

noncomputable theory

namespace model

variable k : ℝ

def f (trig : ℝ → ℝ)(hypr : ℝ → ℝ) :=
  if k ≥ 0 then
    λ θ: ℝ, trig (k * θ)
  else
    λ θ: ℝ, hypr (k * θ)

def fast (trig : ℝ → ℝ)(hypr : ℝ → ℝ) :=
  if k ≥ 0 then
    λ θ: ℝ, trig (k * θ)
  else
    λ θ: ℝ, hypr (-k * θ)

@[simp]
lemma f_abs (trig : ℝ → ℝ)(hypr : ℝ → ℝ)(θ: ℝ) : 
    |fast(k)(trig)(hypr)(θ)| = |f(k)(trig)(hypr)(θ)|
  :=
  sorry

def sin := f k real.sin real.sinh
def cos := f k real.cos real.cosh
def sinast := fast k real.sin real.sinh
def cosast := fast k real.cos real.cosh

@[simp]
lemma sinast_as_sin (x: ℝ):
    sinast k x = (real.sign k) * (sin k x)
  :=
  sorry

@[simp]
lemma cosast_as_cos (x: ℝ):
    cosast k x = cos k x
  :=
  sorry

lemma pytagorean_iden (θ: ℝ) : 
    (cos k θ)^2 + (real.sign k) * (sin k θ)^2 = 1
  :=
  sorry

lemma sin_sum (θ: ℝ)(φ: ℝ) : 
    sin k (θ+φ) = (sin k θ) * (cos k φ) + (cos k θ) * (sin k φ)
  :=
  sorry

lemma sinast_sum (θ: ℝ)(φ: ℝ) : 
    sinast k (θ+φ) = (sinast k θ) * (cos k φ) + (cos k θ) * (sinast k φ)
  :=
  begin
    simp,
    rw mul_comm (cos k θ) (k.sign * sin k φ),
    sorry
    -- if k = 0, 0 = 0 * 1 + 1 * 0
    -- else *1/k.sign
  end

lemma cos_sum (θ: ℝ)(φ: ℝ) : 
    cos k (θ+φ) = (cos k θ) * (cos k φ) + (real.sign k) * (sin k θ) * (sin k φ)
  :=
  sorry

end model
