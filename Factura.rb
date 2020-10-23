class Factura
    def initialize(cantidad, precioUnitario, estado)
        @impuesto = {"ut" => 6.85, "nv" => 8.0, "tx" => 6.25, "al" => 4.0, "ca" => 8.25}
        @descuento = {1000 => 3, 5000 => 5, 7000 => 7, 10000 => 10, 50000 => 15}
        @cantidad = cantidad
        @precioUnitario = precioUnitario
        @estado = estado
       
    end
    def imprimir
        "Datos para Facturar:\nCantidad = #{@cantidad}\nPrecio Unitario = #{@precioUnitario}\n 
        \nsubtotal= #{@subtotal}\nimpuesto(#{@estado}- #{@impuestoAplicable}%)=#{@montoImpuesto}\ndescuento(#{@descuentoAplicable}%)=#{@montoDescuento}\nTotalFactura=#{@montoFactura}"

    end
    def calcularSubtotal
        @subtotal = @cantidad.to_i*@precioUnitario.to_f
    end
    def buscarImpuestoAplicable
        @impuestoAplicable = @impuesto.fetch(@estado)
    end
    def calcularImpuestoAplicable
        @montoImpuesto = (@subtotal*@impuestoAplicable/100).round(2)
    end
    def buscarDescuentoAplicable

        case @subtotal 
        when 1000 .. 5000
            @descuentoAplicable=  @descuento.fetch(1000)
        when 5000 .. 7000
            @descuentoAplicable=  @descuento.fetch(5000)
        when 7000 .. 10000
            @descuentoAplicable=  @descuento.fetch(7000)
        when 10000 .. 50000
            @descuentoAplicable=  @descuento.fetch(10000)
        when 50000 .. 100000
            @descuentoAplicable=  @descuento.fetch(50000)
        else
            @descuentoAplicable=0.0
        end
    end
    def calcularDescuentoAplicable
        @montoDescuento = (@subtotal*@descuentoAplicable/100).round(2)
    end
    def calcularMontoFactura
        @montoFactura = (@subtotal + @montoImpuesto - @montoDescuento).round(2)
    end
    def imprimirSaludoBienvenida
       puts  "******************************************\nBienvenidos al Sistema de Facturacion \n******************************************"

    end

end
factura = Factura.new(ARGV[0], ARGV[1], ARGV[2]);
factura.imprimirSaludoBienvenida
factura.calcularSubtotal
factura.buscarImpuestoAplicable
factura.calcularImpuestoAplicable
factura.buscarDescuentoAplicable
factura.calcularDescuentoAplicable
factura.calcularMontoFactura
puts factura.imprimir
