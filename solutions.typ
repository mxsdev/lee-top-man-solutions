#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#set page(width: 16cm, height: auto, margin: 1.5cm)
#set heading(numbering: "1-1")
#set enum(numbering: "(a)")

= Introduction
= Topological Spaces

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let problem = thmbox("theorem", "Problem", fill: rgb("#ffeeee")).with(numbering: "1-1")

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#let interior = $op("Int")$

// #problem[ ]
// #problem[ ]
// #problem[ ]
// #problem[ ]

#problem(number: "2-5")[
  For each of the following properties, give an example consisting of two subsets $X, Y subset.eq RR^2$, both considered as topological spaces with their Euclidian topologies, together with a map $f : X -> Y$ that has the indicated property.

  + $f$ is open but neither closed nor continuous.
  + $f$ is closed but neither open nor continuous.
  + $f$ is continuous but neither open nor closed.
  + $f$ is continuous and open but not closed.
  + $f$ is continuous and closed but not open.
  + $f$ is open and closed but not continuous.
]
#proof[
  Define the following topological spaces:

  - $D$ is the discrete topology on ${x, y}$
  - $T$ is the trivial topology on ${x, y}$
  - $X$ is the one-point topology on the set ${x, y, z}$ on $x$

  Then we can proceed like so:

  + Consider the inclusion map $f : T -> X$. This map is not continuous because the preimage $f^(-1)({x}) = {x}$ of the open set in $X$ is not open in $T$. The map is also not closed because the image $f({x, y}) = {x, y}$ is not closed in $X$. The image of the lone non-null open set $f({x, y}) = {x, y}$ is open, however, implying that the map is open.
  + Consider the map $f : T -> X$ mapping $x |-> y$ and $y |-> z$. This map is not continuous because the preimage of the open set ${y}$ in $X$ is not open in $T$. The map is also not open because the image $f({x, y}) = {y, z}$ is not open in $X$. The image of the lone non-null closed set $f({x, y}) = {y, z}$ is closed, however, implying that the map is closed.
  + Consider the identity map $f : D -> T$. This map is continuous (since any map from a discrete space is continuous), but neither open nor closed, since the image of the clopen set ${x}$ in $D$ is neither closed nor open in $T$.
  + Consider the constant map $f : D -> X$ sending all elements of $T$ to $x$. This map is continuous since any map from a discrete space is continuous. The image of any set in $D$ is either $emptyset$ or ${x}$, both of which are open in $X$. In particular, the image of any open set is open. But the image of the closed set ${x}$ in $D$ is ${x}$, which is not closed in $X$.
  + Consider the constant map $f : D -> X$ sending all elements of $T$ to $y$. Similar to (d), this map is continuous, but the image of any set in $T$ is either $emptyset$ or ${y}$, both of which are closed. Similar to the reasoning in (d), this map is closed but not open.
  + Consider the identity map $f : T -> D$. This map is open and closed, since the image of the lone non-null clopen set ${x, y}$ is clopen in $D$, but it is also not continuous because the preimage $f^(-1)({x}) = {x}$ of the open set in $D$ is not open in $T$.
]

#problem(number: "2-6")[
  Suppose $X$ and $Y$ are topological spaces, and $f : X -> Y$ is a continuous map.

  + $f$ is continuous if and only if $f(overline(A)) subset.eq overline(f(A))$ for all $A subset.eq X$.
  + $f$ is closed if and only if $f(overline(A)) supset.eq overline(f(A))$ for all $A subset.eq X$.
  + $f$ is continuous if and only if $f^(-1)(interior B) subset.eq interior f^(-1)(B)$ for all $B subset.eq Y$.
  + $f$ is open if and only if $f^(-1)(interior B) supset.eq interior f^(-1)(B)$ for all $B subset.eq Y$.
]
#proof[
  We will use repeatedly the following set-theoretic identities that hold for any function $f : X -> Y$ and subsets $A subset.eq X$, $B subset.eq Y$:

  - $f(A) subset.eq B <==> A subset.eq f^(-1)(B)$ (adjunction identity)
  - $f^(-1)(f(A)) supset.eq A$ (unit identity)
  - $f(f^(-1)(B)) subset.eq B$ (co-unit identity)
  
  + ($==>$) By the "unit identity" above, we have,

    $
    A subset.eq f^(-1)(f(A)) subset.eq f^(-1)(overline(f(A)))
    $

    From which it follows that,

    $
    overline(A) subset.eq overline(f^(-1)(overline(f(A)))) = f^(-1)(overline(f(A)))
    $

    Where the last equality follows from the fact that $f$ is continuous, so that $f^(-1)(overline(f(A)))$ is closed. Then this is equivalent to,

    $
    f(overline(A)) subset.eq overline(f(A))
    $

    By the "adjunction identity" above.
  
    // Suppose $f$ is continuous and $x in overline(A)$. We wish to show that $f(x) in overline(f(A))$. Suppose $U$ is a neighborhood of $f(x)$, so that by continuity $V := f^(-1)(U)$ is a nhood of $x$. Since $x in overline(A)$, there is some $y in A sect f^(-1)(U)$. Then $f(y) in f(A)$ and $f(y) in U$ so that $U$ intersects $f(A)$.

    ($<==$) Suppose $f(overline(A)) subset.eq overline(f(A))$ for all $A subset.eq X$, and $U$ is a closed set in $Y$. We wish to show that $f^(-1)(U)$ is closed in $X$. First note that by the "co-unit identity" above:

      $
      f(f^(-1)(U)) subset.eq U
      $

      So,

      $
      overline(f(f^(-1)(U))) subset.eq overline(U) = U
      $

      Where the last equality follows from $U$ closed. Then by the assumption,

      $
      f(overline(f^(-1)(U))) subset.eq overline(f(f^(-1)(U))) subset.eq U
      $

      So that $overline(f^(-1)(U)) subset.eq f^(-1)(U)$, implying that $f^(-1)(U)$ is closed.

  + ($==>$) Suppose $f$ is closed. Then $f(overline(A))$ is closed since $overline(A)$ is closed so $overline(f(overline(A))) subset.eq f(overline(A))$. Then $A subset.eq overline(A) ==> f(A) subset.eq f(overline(A)) ==> overline(f(A)) subset.eq overline(f(overline(A)))$, and thus,

    $
    overline(f(A)) subset.eq overline(f(overline(A))) subset.eq f(overline(A))
    $

    ($<==$) Suppose $overline(f(A)) subset.eq f(overline(A))$ for all $A subset.eq X$ and $U$ is closed in X. Since $U$ is closed $overline(U) = U$, so $overline(f(U)) subset.eq f(overline(U)) = f(U)$. It follows that $f(U)$ is closed.

  + First note that,

    $
    &f^(-1)(interior B) subset.eq interior f^(-1)(B) quad forall B subset.eq Y \
    <==>& X - interior f^(-1)(B) subset.eq X - f^(-1)(interior B) = f^(-1)(X - interior B) quad forall B subset.eq Y \
    <==>& overline(X - f^(-1)(B)) subset.eq f^(-1)(overline(X - B)) quad forall B subset.eq Y \
    <==>& overline(f^(-1)(X - B)) subset.eq f^(-1)(overline(X - B)) quad forall B subset.eq Y \
    <==>& overline(f^(-1)(B)) subset.eq f^(-1)(overline(B)) quad forall B subset.eq Y
    $

    Next we can show that,

    $
    overline(f^(-1)(B)) subset.eq f^(-1)(overline(B)) quad forall B subset.eq Y <==> f(overline(A)) subset.eq overline(f(A)) quad forall A subset.eq X
    $

    Which is equivalent to,

    $
    f(overline(f^(-1)(B))) subset.eq overline(B) quad forall B subset.eq Y <==> overline(A) subset.eq f^(-1)(overline(f(A))) quad forall A subset.eq X
    $

    Since for any subsets $A subset.eq X$ and $B subset.eq Y$ we have $f(A) subset.eq B <==> A subset.eq f^(-1)(B)$. To show this we have:

    $
      (==>) quad &overline(f(A)) supset.eq f(overline(f^(-1)(f(A)))) supset.eq f(overline(A)) \
      (<==) quad &overline(f^(-1)(B)) subset.eq f^(-1)(overline(f(f^(-1)(B)))) subset.eq f^(-1)(overline(B))
    $

    Where in either case, the leftmost inclusion follows from substitution of either $overline(f(A))$ or $overline(f^(-1)(B))$ into the antecedent, and the rightmost inclusion follows from the "(co-)unit" identities.

    Therefore the subset condition in (c) is equivalent to the one in (a).
  
  + ($==>$) We have,

    $
    &interior f^(-1)(B) subset.eq f^(-1)(B)\
    ==> &f(interior f^(-1)(B)) subset.eq f(f^(-1)(B)) subset.eq B
    $

    But since $f$ is open by assumption, that makes $f(interior f^(-1)(B))$ a subset not just of $B$ but of $interior B$. So:

    $
    &f(interior f^(-1)(B)) subset.eq interior B \
    ==> &interior f^(-1)(B) subset.eq f^(-1)(interior B)
    $

    ($<==$) Let $U$ be an open set in $X$. Then,

    $
    interior f^(-1)(f(U)) subset.eq f^(-1)(f(U)) subset.eq U
    $

    So,

    $
    interior f(U) subset.eq f(interior f^(-1)(f(U))) subset.eq f(U)
    $

    Where the leftmost inclusion follows from the assumption applied to $f(U) subset.eq Y$. It follows that $f(U)$ is open.
]