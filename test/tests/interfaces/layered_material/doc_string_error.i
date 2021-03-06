[Mesh]
  type = GeneratedMesh
  dim = 1
[]

[Variables]
  [./u]
  [../]
[]

[Materials]
  [./layered]
    type = TestLayeredMaterialInterfaceDocString
    layer_ids = '2'
    layer_variable = u
  [../]
[]

[Problem]
  kernel_coverage_check = false
[]

[Executioner]
  type = Steady
[]

[Outputs]
[]
