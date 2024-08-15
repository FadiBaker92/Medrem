class RemindersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reminder, only: %i[show edit update destroy]

  # GET /reminders or /reminders.json
  def index
    @reminders = Reminder.joins(:prescription).where(prescriptions: { user_id: current_user.id })
  end

  # GET /reminders/1 or /reminders/1.json
  def show
    @prescription = @reminder.prescription
    @medication = @prescription.medication

    unless @prescription.user_id == current_user.id
      redirect_to reminders_path, alert: "You are not authorized to view this reminder."
    end
  end

  # GET /reminders/new
  def new
    @medication = Medication.find_by(id: params[:medication_id])
    @prescription = @medication.prescriptions.find_by(user_id: current_user.id)
    @reminder = Reminder.new
  end

  # GET /reminders/1/edit
  def edit
    @prescription = @reminder.prescription
    @medication = @prescription.medication
  end

  # POST /reminders or /reminders.json
  def create
    @prescription = current_user.prescriptions.find(params[:reminder][:prescription_id])
    @reminder = @prescription.reminders.build(reminder_params)

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to @reminder, notice: "Reminder was successfully created." }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1 or /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to reminder_url(@reminder), notice: "Reminder was successfully updated." }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1 or /reminders/1.json
  def destroy
    @reminder.destroy!

    respond_to do |format|
      format.html { redirect_to reminders_url, notice: "Reminder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_reminder
      @reminder = Reminder.find(params[:id])
      @prescription = @reminder.prescription

      unless @prescription.user_id == current_user.id
        redirect_to reminders_path, alert: "You are not authorized to perform this action."
      end
    end

    def reminder_params
      params.require(:reminder).permit(:sent_at, :message, :prescription_id)
    end
end
