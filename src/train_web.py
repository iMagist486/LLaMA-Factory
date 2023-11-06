from llmtuner import create_ui


def main():
    demo = create_ui()
    demo.queue().launch(share=False, inbrowser=True, server_name="0.0.0.0", server_port=8000)


if __name__ == "__main__":
    main()
