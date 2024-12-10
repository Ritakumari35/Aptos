module MyModule::Messaging {

    use aptos_framework::signer;

    /// Struct representing a message between two wallets.
    struct Message has store, key {
        sender: address,      // Address of the sender
        recipient: address,   // Address of the recipient
        content: vector<u8>,  // Encrypted message content
    }

    /// Function to send an encrypted message from sender to recipient.
    public fun send_message(sender: &signer, recipient: address, encrypted_content: vector<u8>) {
        let message = Message {
            sender: signer::address_of(sender),
            recipient,
            content: encrypted_content,
        };
        move_to(sender, message);
    }
}
