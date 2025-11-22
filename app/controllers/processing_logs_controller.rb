# frozen_string_literal: true

class ProcessingLogsController < ApplicationController
  def index
    @processing_logs = ProcessingLog.all
  end

  def show;end

  private

  def set_processing_log
    @processing_log = ProcessingLog.find(params[:id])
  end
end
