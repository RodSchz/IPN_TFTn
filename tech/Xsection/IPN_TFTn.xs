# ===== TFT bottom shared gate
#      Transistores de capa delgada
#      Todas las compuertas compartidas
# =================================================================================================

# --- Parámetros (puedes ajustarlos) ---
gate_t  = 0.50   # 50 nm gate oxide
semi_t  = 0.50    # IGZO espesor
hfo2_t = 0.50   # Espesor dielectrico
met_t = 0.50   # Espesor metal

delta(5 * dbu)

# ======== Máscaras desde layout ==================================================================
lsub = layer("1/0")     # Substrato
lgate = layer("2/0")    # Compuerta
lhfo2 = layer("3/0")    # Dieléctrico
lsemi = layer("4/0")    # Semiconductor
lmet = layer("5/0")     # Metal

# ======== Sustrato =======================================================================
pbulk  = bulk

# ======== Depósito de compuerta ===========================================================
gate = deposit(gate_t)

# ======== Depósito de compuerta ===========================================================
dielectrico = deposit(hfo2_t)

# ======== Depósito semiconductor ===========================================================
msemi = mask(lsemi)
semi = msemi.grow(semi_t,  semi_t,  :bias => 0.10, :mode => :round)

# ======== Depósito semiconductor ===========================================================
mmet = mask(lmet)
met = mmet.grow(met_t,  met_t,  :bias => 0.10, :mode => :round)

# ======== Salidas (puedes mapearlas a tus capas .lyp) ========
output("1/0", pbulk)        # Substrato
output("2/0", gate)         # Compuerta
output("3/0", dielectrico)  # Dielectrico
output("4/0", semi)         # Semiconductor
output("5/0", met)          # Metal