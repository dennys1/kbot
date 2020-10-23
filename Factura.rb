class Factura
    def initialize(cantidad, precioUnitario, estado)
        @cantidad = cantidad
        @precioUnitario = precioUnitario
        @estado = estado
       
    end
    def imprimir
        "Datos para Facturar:\nCantidad = #{@cantidad}\nPrecio Unitario = #{@precioUnitario}\nEstado = #{@estado}"
    end

end
factura = Factura.new(ARGV[0], ARGV[1], ARGV[2]);
puts factura.imprimir
