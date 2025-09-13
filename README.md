# Desafio_Final_WKS_25.2
PROJETO VISANDO O DESAFIO FINAL  - FABRICA DE SOFTWARE 


# Meu Projeto de Análise de Dados

Este repositório contém meu projeto de análise de dados usando Python e pandas. Aqui, eu explorei, tratei e visualizei dados, criando insights importantes de forma prática.

---

## 🛠 Tecnologias e Bibliotecas Usadas

* **Python 3.x**
* **Pandas**: para manipulação e análise de dados.
* **Matplotlib / Seaborn**: para criação de gráficos.
* **Jupyter Notebook / Google Colab**: ambiente de execução.
* **CSV**: formato dos arquivos de dados utilizados.

---

## 📂 Estrutura do Projeto

```
📁 projeto-analise-dados
│
├─ data/
│   └─ churn_data.csv  # Arquivo de dados utilizado
│
├─ notebooks/
│   └─ analise.ipynb   # Notebook com análise completa
│
└─ README.md
```

---

## 🚀 Passo a Passo do que eu fiz

1. **Carregamento dos dados**

   * Usei `pandas` para carregar o arquivo CSV.
   * Caso o arquivo não estivesse no mesmo diretório, configurei para aceitar um caminho completo.
   * Tratei erros comuns, como `FileNotFoundError`, com mensagens amigáveis.

   ```python
   import pandas as pd

   try:
       df = pd.read_csv("data/churn_data.csv")
   except FileNotFoundError:
       print("Arquivo não encontrado. Verifique o caminho e tente novamente.")
   ```

2. **Inspeção inicial dos dados**

   * Visualizei as primeiras linhas com `df.head()`.
   * Conferi informações gerais com `df.info()` e `df.describe()`.

3. **Tratamento de dados**

   * Verifiquei valores faltantes e outliers.
   * Ajustei encoding e separadores (`sep=','` ou `sep=';'`) quando necessário.

4. **Análise exploratória**

   * Criei gráficos para entender a distribuição das variáveis.
   * Usei `Matplotlib` e `Seaborn` para visualizações.

   ```python
   import matplotlib.pyplot as plt
   import seaborn as sns

   sns.countplot(x='Churn', data=df)
   plt.show()
   ```

5. **Insights**

   * Identifiquei padrões importantes nos dados.
   * Anotei todas as conclusões para orientar possíveis decisões futuras.

---

## 📈 Gráficos

* Gráficos de barras para categorias.
* Histogramas para variáveis numéricas.
* Heatmaps para correlações.

---



## 📝 Conclusão

Este projeto me permitiu praticar análise de dados do início ao fim: carregamento, inspeção, tratamento, visualização e interpretação. Todo o processo foi pensado para que qualquer pessoa possa entender e reproduzir os resultados.

---

## 📫 Contato

* **Meu GitHub:** [SAMUELaalvess]([https://github.com/seu-usuario](https://github.com/SAMUELaalvess))
* **Email:** [samukabolado52@gmail.com](mailto:samukabolado52@gmail.com)
