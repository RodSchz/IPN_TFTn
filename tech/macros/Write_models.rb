# $description: Generar modelos de simulación
# $version: 0.1
module WriteModels
 
  include RBA

  def self.create_models(output_dir)
    lib_path = File.join(output_dir,"ipn_tftn_models.lib")
    puts "Archivo a crear: #{lib_path}"
    
    File.open(lib_path, "w") do |f|
      f.puts "* Modelos para proceso IPN_TFTn"      
      f.puts "* Autor script: Rodolfo Sanchez Fraga"
      f.puts "* Autor modelo: Norberto Hernandez Como"
      f.puts "* Laboratorio Nacional de Micro y Nano Tecnologías (LNunT)"
      f.puts ".model TFTn_IPN nmos (level=15 vto=0.426 muband=.174 m=2.277 alphasat=0.367 gamma=0.777 lambda=-0.042 def0=0.4 vmin=0.06 TOX=20e-9 TM=10e-9 cgdo=1.1e-8 cgso=1.1e-8 RD=1300 RS=1300 )"
    end
    
    puts "Archivo .lib generado en: #{lib_path}"
    lib_path
  rescue => e
    puts "Error al crear .lib: #{e.message}"
    nil
  end
  
end