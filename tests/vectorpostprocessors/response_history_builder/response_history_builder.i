[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 3
  ny = 3
[]

[Variables]
  [./u]
  [../]
[]

[Kernels]
  [./diff]
    type = Diffusion
    variable = u
  [../]
  [./time]
    type = TimeDerivative
    variable = u
  [../]
[]

[BCs]
  [./left]
    type = DirichletBC
    variable = u
    boundary = left
    value = 0
  [../]
  [./right]
    type = DirichletBC
    variable = u
    boundary = right
    value = 1
  [../]
[]

[AuxVariables]
  [./accel_x]
  [../]
  [./proc_id]
    family = MONOMIAL
    order = CONSTANT
  [../]
[]

[AuxKernels]
  [./accel_x]
    type = FunctionAux
    function = t*t
    variable = accel_x
    execute_on = 'initial timestep_end'
  [../]
  [./proc]
    type = ProcessorIDAux
    variable = proc_id
  [../]
[]

[Executioner]
  type = Transient
  num_steps = 5
  dt = 1
[]

[Outputs]
  exodus = true
  [./out]
    type = CSV
    execute_on = final
  [../]
[]

[VectorPostprocessors]
  [./accel]
    type = ResponseHistoryBuilder
    variables = 'u accel_x'
    node = 2
    execute_on = 'initial timestep_end'
  [../]
[]
