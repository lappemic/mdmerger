# mdmerger

`mdmerger` is a simple CLI tool designed to simplify the process of merging multiple markdown files into a single document, automatically generating a Table of Contents (ToC) for better navigation. This tool was born out of a personal need to create a PDF documentation from an existing GitLab wiki. Unfortunately, existing solutions were either too complex or did not meet the specific requirements.

## Installation

To use `mdmerger`, clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/mdmerger.git
cd mdmerger
chmod +x mdmerger.sh
```

## Usage

Run mdmerger by specifying the main title as the first argument, followed by the markdown files you want to merge:

```bash
./mdmerger.sh "My Merged Document" file1.md file2.md file3.md
```

This will create a new markdown file with your specified main title, a ToC, and the combined content of the provided files.

# Converting to PDF

After creating your merged markdown document, you may wish to convert it to PDF. I successfully used the following command for my project documentation, relying on Pandoc and wkhtmltopdf:

```bash
pandoc merged_file.md -o merged_file.pdf --pdf-engine=wkhtmltopdf
```

This command requires having both Pandoc and wkhtmltopdf installed on your machine. You can install Pandoc by following the instructions on the [official website](https://pandoc.org/installing.html). For wkhtmltopdf, you can download the latest release from the [official website](https://wkhtmltopdf.org/downloads.html).

# Contributing

I am grateful for any contributions and improvements you're willing to make, no matter how big or small. Whether it's filing an issue, proposing a feature, or submitting a pull request, all contributions are warmly welcomed.

# License

This project is licensed under the MIT License.
