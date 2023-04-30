generic
   
   type Tipoeelemento is private;
   
   package Listacircular is
      
      function Vacia(Lista: Tipolista) return Boolean;
      function Esta(Lista: Tipolista; Elemento: Tipoelemento) return Boolean;
      procedure Insertar(Lista: in out Tipolista; Elemento: in Tipoelemento);
      procedure Suprimir(Lista: in out Tipolista; Elemento: Tipoelemento);
      procedure Limpiar(Lista: in out Tipolista);
      function Info(Lista: Tipolista) return Tipoelemento;
      function Sig(Lista: Tipolista) return Tipolista;
      
      Listavacia: exception;
      
      private
         
      type Tiponodo;
      type Tipolista is access Tiponodo;
      type Tiponodo is record
         Info: Tipoelemento;
         Sig: Tipolista;
      end record;
      
   end Listacircular;
