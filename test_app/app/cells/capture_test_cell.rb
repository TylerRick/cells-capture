class CaptureTestCell < Cell::Rails
  helper Cells::Helpers::CaptureHelper

  def display
    render
  end

end
