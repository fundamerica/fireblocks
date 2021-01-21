# frozen_string_literal: true

module Fireblocks
  # Namespace to access Fireblocks api methods
  class API
    class << self
      def get_vault_accounts
        Request.get(path: '/v1/vault/accounts')
      end

      def create_vault_account(name:, hidden_on_ui: false, auto_fuel: false)
        body = { name: name, hiddenOnUI: hidden_on_ui, autoFuel: auto_fuel }
        Request.post(body: body, path: '/v1/vault/accounts')
      end

      def get_vault_account(id)
        Request.get(path: "/v1/vault/accounts/#{id}")
      end

      def update_vault_account(vault_account_id, name:)
        Request.put(
          body: { name: name },
          path: "/v1/vault/accounts/#{vault_account_id}"
        )
      end

      def hide_vault_account(id)
        Request.post(path: "/v1/vault/accounts/#{id}/hide", body: {})
      end

      def unhide_vault_account(id)
        Request.post(path: "/v1/vault/accounts/#{id}/unhide", body: {})
      end

      def get_vault_account_asset(vault_account_id, asset_id)
        Request.get(path: "/v1/vault/accounts/#{vault_account_id}/#{asset_id}")
      end

      def create_vault_account_asset(vault_account_id, asset_id)
        Request.post(path: "/v1/vault/accounts/#{vault_account_id}/#{asset_id}")
      end

      def create_deposit_address(vault_account_id, asset_id, description: nil)
        Request.post(
          body: { description: description },
          path: "/v1/vault/accounts/#{vault_account_id}/#{asset_id}/addresses"
        )
      end

      def get_deposit_addresses(vault_account_id, asset_id)
        Request.get(
          path: "/v1/vault/accounts/#{vault_account_id}/#{asset_id}/addresses"
        )
      end

      def get_internal_wallet(wallet_id)
        Request.get(path: "/v1/internal_wallets/#{wallet_id}")
      end

      def get_internal_wallets
        Request.get(path: '/v1/internal_wallets')
      end

      def create_internal_wallet(name:)
        Request.post(body: { name: name }, path: '/v1/internal_wallets')
      end

      def get_supported_assets
        Request.get(path: '/v1/supported_assets')
      end
    end
  end
end
