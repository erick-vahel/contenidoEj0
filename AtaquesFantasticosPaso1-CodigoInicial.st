!classDefinition: #CombatientesTest category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AtaquesFantasticosPaso1'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'para completar' stamp: 'SF 8/27/2022 06:09:54'!
combatienteHumanoArthas
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'SF 8/27/2022 06:09:57'!
combatienteOrcoMankrik
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'SF 8/27/2022 06:10:01'!
combatienteOrcoOlgra
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'SF 8/27/2022 06:10:14'!
comenzarUnNuevoCombate
	"Implementar cuando sea necesario"! !


!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 05:58:49'!
test01UnCombatientePuedeAtacarAOtro
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:50'!
test02MultiplesAtaquesVanBajandoMasVida

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:42'!
test03UnHachaHace10DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:55'!
test04UnEspadaHace8DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:03'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:10'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:18'!
test07UnaArmaduraReduceElDañoInfligidoACero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.! !


!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:54:53'!
test08CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 20.
	
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 8/27/2022 06:07:34'!
test09CuandoUnCombatienteTieneEnemigosAtacaAUno
	| enemigo1Herido enemigo2Herido |
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	enemigo1Herido := self combatienteOrcoOlgra puntosDeVida < 20 and: [self combatienteOrcoMankrik puntosDeVida = 20].
	enemigo2Herido := self combatienteOrcoMankrik puntosDeVida < 20 and: [self combatienteOrcoOlgra puntosDeVida = 20].
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:55:22'!
test10UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:56:08'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas usarEspada .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !
