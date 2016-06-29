defmodule Catuum.Downloader do
  import Mogrify

  @tmp_path "/tmp/"
  @save_path "/uploads/"
  @valid_sizes 400..900

  def random_cat do
    # Get a random cat from the API
    %HTTPotion.Response{body: body}           = HTTPotion.get("http://random.cat/meow")
    json                                      = Poison.Parser.parse!(body)
    # Download it
    %HTTPotion.Response{body: image_content}  = HTTPotion.get(json["file"])

    # Create uploads dir no matter what.
    File.mkdir("uploads")

    filename = json["file"] |> Path.basename
    validate_and_save(filename, image_content)
  end

  @doc """
  Validate the size of the file is between 400..900 and save it in uploads dir.
  """
  defp validate_and_save(filename, content) do
    tmp_image_path  = @tmp_path <> filename
    save_image_path = System.cwd() <> @save_path <> filename

    File.write!(tmp_image_path, content)
    
    %Mogrify.Image{width: width, height: height} = open(tmp_image_path) |> verbose

    width  = width |> String.to_integer
    height = height |> String.to_integer

    if Enum.member?(@valid_sizes, width) && Enum.member?(@valid_sizes, height) do
      File.rename(tmp_image_path, save_image_path)
    else 
      IO.puts "Not saved"
      IO.puts(width)
      IO.puts(height)
    end
  end
end