# $description: Importar archivos de simulación
# $version: 0.1
# $show-in-menu
# Rodolfo Sanchez Fraga
# Marzo 2026

require 'fileutils'

# Obtener ruta del layout actual
view = RBA::Application.instance.main_window.current_view
if view && view.active_cellview
  layout_path = view.active_cellview.filename
  output_dir = File.dirname(layout_path)
else
  output_dir = Dir.pwd
end

puts "Ruta del layout actual: #{output_dir}"

# ----------------------------------------------------------------------
# Copiar archivo de modelo desde el paquete Salt hacia el directorio
# del layout actual
# ----------------------------------------------------------------------

# Ruta del script actual
script_dir = File.dirname(__FILE__)

# Ruta relativa según dónde esté este script dentro del paquete
source_dir = File.expand_path("../models", script_dir)

# Nombre del archivo a copiar
model_filename1 = "ipn_tftn.asy"
model_filename2 = "ipn_tftn.asc"

source_file1 = File.join(source_dir, model_filename1)
source_file2 = File.join(source_dir, model_filename2)
dest_file1   = File.join(output_dir, model_filename1)
dest_file2   = File.join(output_dir, model_filename2)

puts "Archivo origen: #{source_file1}"
puts "Archivo destino: #{dest_file1}"

puts "Archivo origen: #{source_file2}"
puts "Archivo destino: #{dest_file2}"

if File.exist?(source_file1)
  FileUtils.cp(source_file1, dest_file1)
  puts "Archivo copiado correctamente."
else
  puts "ERROR: No se encontró el archivo origen."
end

if File.exist?(source_file2)
  FileUtils.cp(source_file2, dest_file2)
  puts "Archivo copiado correctamente."
else
  puts "ERROR: No se encontró el archivo origen."
end

# Para generar el archivo de modelos (sin copiar):
lib_path = WriteModels.create_models(output_dir)