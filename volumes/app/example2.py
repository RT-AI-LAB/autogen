import os
from autogen import ConversableAgent

agent = ConversableAgent(
    "my_assistant",
    system_message="You are a helpful AI assistant.",
    llm_config={
        "config_list": [
            {
                "model": "llama3:latest",
                "api_type": 'ollama',
                'stream': False,
                'client_host': 'http://ollama:11434'
            }
        ],
    },
);

reply = agent.initiate_chat(
    recipient=agent,
    message="tell me a joke",
    max_turns=1
)

print(reply)