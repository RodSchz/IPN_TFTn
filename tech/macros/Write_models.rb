# $description: Generar modelos de simulación
# $version: 0.1
# $autorun
# Rodolfo Sanchez Fraga
# Marzo 2026

module WriteModels
 
  include RBA

  def self.create_models(output_dir)
    lib_path = File.join(output_dir,"ipn_tftn_models.lib")
    puts "Archivo a crear: #{lib_path}"
    
    File.open(lib_path, "w") do |f|
      f.puts "* Modelos para proceso IPN_TFTn"      
      f.puts "* Autor script: Rodolfo Sanchez Fraga"
      f.puts "* Laboratorio Nacional de Micro y Nano Tecnologías (LNunT)"
      f.puts ""
      f.puts ".model IPN_TFTN NMOS ("
      f.puts "+ LEVEL=1"
      f.puts "+ VTO=1.08518"
      f.puts "+ KP=7.58022e-08"
      f.puts "+ LAMBDA=0.121604"
      f.puts "+ GAMMA=0"
      f.puts "+ PHI=0.7"
      f.puts "+ RD=0"
      f.puts "+ RS=0"
      f.puts "+ CGSO=0"
      f.puts "+ CGDO=0)"
    end
    
    puts "Archivo .lib generado en: #{lib_path}"
    lib_path
  rescue => e
    puts "Error al crear .lib: #{e.message}"
    nil
  end
  
end