class MedicationsController < ApplicationController
  before_action :set_medication, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[index show edit update destroy]

  # GET /medications or /medications.json
  def index
    @medications = current_user.prescriptions.includes(:medication).map(&:medication)
  end

  # GET /medications/1 or /medications/1.json
  def show
    # This logic can probably be put inside a method and called wherever needed so you dont repeat yourself
    unless @medication.prescriptions.where(user_id: current_user.id).exists?
      redirect_to medications_path, alert: "You are not authorized to view this medication."
    end
  end

  # GET /medications/new
  def new
    @medication = Medication.new
  end

  # GET /medications/1/edit
  def edit
    unless @medication.prescriptions.where(user_id: current_user.id).exists?
      redirect_to medications_path, alert: "You are not authorized to edit this medication."
    end
  end

  # POST /medications or /medications.json
  def create
    @medication = Medication.new(medication_params)

    respond_to do |format|
      if @medication.save
        Prescription.create(
          description: "Initial Prescription for #{@medication.name}",
          dosage: params[:medication][:dosage],
          expiration_date: params[:medication][:expiration_date],
          user_id: current_user.id,
          medication_id: @medication.id
        )
        format.html { redirect_to medication_url(@medication), notice: "Medication was successfully created." }
        format.json { render :show, status: :created, location: @medication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medications/1 or /medications/1.json
  def update
    respond_to do |format|
      if @medication.update(medication_params)
        format.html { redirect_to medication_url(@medication), notice: "Medication was successfully updated." }
        format.json { render :show, status: :ok, location: @medication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medications/1 or /medications/1.json
  def destroy
    @medication.destroy!

    respond_to do |format|
      format.html { redirect_to medications_url, notice: "Medication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_medication
    @medication = Medication.find(params[:id])

    unless @medication.prescriptions.where(user_id: current_user.id).exists?
      redirect_to medications_path, alert: "You are not authorized to perform this action."
    end
  end

  # Only allow a list of trusted parameters through.
  def medication_params
    params.require(:medication).permit(:name, :description)
  end
end
