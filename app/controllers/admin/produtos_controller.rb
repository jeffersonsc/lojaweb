class Admin::ProdutosController < Admin::BaseAdminController

	def index
		@produto = Produto.all
	end
	
	def new
		@produto = Produto.new
	end

	def create
		@produto = Produto.new
		@produto.nome = params[:produto][:nome] if params[:produto][:nome]
		@produto.preco = params[:produto][:preco] if params[:produto][:preco]
		@produto.quantidade = params[:produto][:quantidade] if params[:produto][:quantidade]
		@produto.descricao = params[:produto][:descricao] if params[:produto][:descricao]

		if @produto.save
			flash[:notice] = "Produto adicionado com sucesso!"
			redirect_to :action => :show
		else
			render :new
		end
	end	

	def edit
		@produto = Produto.find(params[:produto_id])
	end

	def update
		@produto = Produto.find(params[:id])
		@produto.nome = params[:produto][:nome] if params[:produto][:nome]
		@produto.preco = params[:produto][:preco] if params[:produto][:preco]
		@produto.quantidade = params[:produto][:quantidade] if params[:produto][:quantidade]
		@produto.descricao = params[:produto][:descricao] if params[:produto][:descricao]
		@produto.situacao = params[:produto][:situacao] if params[:produto][:situacao]
		if @produto.save
			flash[:notice] = "Produto alterado com sucesso!"
			redirect_to :action => :show
		else
			render :edit
		end
	end

	def destroy
		@produto = Produto.find_by_sql("UPDATE produtos SET situacao = true WHERE id = #{params[:produto_id]}")		
		flash[:notice] = "Produto removido com sucesso!"
		redirect_to :action => :show		
	end

end