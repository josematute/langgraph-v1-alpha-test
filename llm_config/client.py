from dotenv import load_dotenv
from langchain_anthropic import ChatAnthropic


load_dotenv()


llm = ChatAnthropic(model="claude-3-5-sonnet-latest")
