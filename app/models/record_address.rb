class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :state_id, :city, :record, :address, :building_name, :tel

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :state_id, numericality: {other_than: 0}
    validates :city
    validates :address
    validates :tel, format: { with: /\A[0-9]{11}\z/}, numericality: {only_integer: true}

    def save
      record = Record.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, state_id: state_id, city: city, record: record, building_name: building_name, record_id: record.id)
    end
  end
end