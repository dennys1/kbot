class Factura
    def initialize(cantidad, precioUnitario, estado)
        @impuesto = {"ut" => 6.85, "nv" => 8.0, "tx" => 6.25, "al" => 4.0, "ca" => 8.25}
        @descuento = {1000 => 0.03, 5000 => 0.05, 7000 => 0.07, 10000 => 0.10, 50000 => 0.15}
        @cantidad = cantidad
        @precioUnitario = precioUnitario
        @estado = estado
       
    end
    def imprimir
        "Datos para Facturar:\nCantidad = #{@cantidad}\nPrecio Unitario = #{@precioUnitario}\n 
        \nsubtotal= #{@subtotal}\nimpuesto(#{@estado}- #{@impuestoAplicable}%)"

    end
    def calcularSubtotal
        @subtotal = @cantidad.to_i*@precioUnitario.to_f
    end
    def buscarImpuestoAplicable
        @impuestoAplicable = @impuesto.fetch(@estado)
    end


end
factura = Factura.new(ARGV[0], ARGV[1], ARGV[2]);
factura.calcularSubtotal
factura.buscarImpuestoAplicable
puts factura.imprimir
