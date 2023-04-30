with Ada.Unchecked_Deallocation;

package body Listacircular is
   
   function Vacia(Lista:in Tipolista) return Boolean is
   begin
      return lista=null;
   end Vacia;
   
      function Esta(Lista:Tipolista; elemento:tipoelemento) return Boolean is
         Ptr:Tipolista:=Lista.sig;
      begin
         if Vacia(Lista)then return False;
         else loop
               if Ptr.Info=Elemento then return True;
               end if;  
               exit when Ptr=Lista;
               Ptr:=Lista.Sig;
            end loop;
            if Ptr=Lista and Ptr.Info=Elemento then return True;
            end if;
         end if;
            return False;
      end Esta;
      

   procedure Insertar(Lista:in out Tipolista; Elemento:in Tipoelemento) is
      Nuevonodo:Tipolista:=new Tiponodo'(Elemento,null);
   begin
      if Vacia(Lista) then 
         Lista:=Nuevonodo;
         Lista.Sig:=Lista;
      else
         Nuevonodo.Sig:=Lista.Sig;
         Lista.Sig:=Nuevonodo;
      end if;
   end Insertar;
   
   procedure Suprimir(Lista:in out Tipolista; Elemento: in Tipoelemento) is
      Actual:Tipolista:=Lista;
      Ant:Tipolista:=null;
   begin
      while Actual.Info/=Elemento loop
         Ant:=Actual;
         Actual:=Actual.Sig;         
      end loop;
      if Ant=null then
         if Actual=Actual.Sig then
            Lista:=null;
         else loop
               Actual.Sig:=Lista.Sig;
               Actual:=Lista;
               Lista:=Ant.Sig;
               end loop;
            end if;
               else Ant.Sig:=Actual.Sig;
      end if;
      Free(Actual);
   end Suprimir;
     
   procedure Limpiar(Lista:in out Tipolista) is
   temp:tipolista:=lista;
   begin
      while Lista/=null loop
         Temp:=Lista;
         Lista:=Lista.Sig;
         Free(Temp);
      end loop;  
   end Limpiar;
   
end Listacircular;