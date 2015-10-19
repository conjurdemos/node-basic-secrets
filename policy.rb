policy "node-basic-secrets" do
  key = variable "secret_key"
  
  layer "app" do |layer|
    %w(read execute).each do |privilege|
      can privilege, key
    end
  end
end