require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    user = FactoryBot.build(:user)
  end
  describe '新規登録/ユーザー情報' do
    it 'ニックネームが空だと登録できない' do
    end
    it 'メールアドレスがなければ登録できない' do
    end
    it 'メールアドレスが重複していると登録できない' do
    end
    it 'メールアドレスに@が含まれていなければ登録できない' do
    end
    it 'パスワードが空だと登録できない' do
    end
    it 'パスワードが、6文字未満だと登録できない' do
    end
    it 'パスワードが半角英数字混合でなければ登録できない' do
    end
    it '確認用のパスワードがなければ登録できない' do
    end
    it 'パスワードとパスワード（確認用）の値が異なると登録できない' do
    end
  end
end
