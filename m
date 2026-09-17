Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A881C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/c/0WbUx2sZZqC5xOf8s/VitAOVM+T26V7LZo7Y8Kk=; b=Hq7B4Fc8sfsM7f
	PDxRItx59e99hoNDeyKCo6YVToL5+BjXGl1f6j9l/+wXCfACNg5GIxIxfXM9T4jNWzIH+mUK1NCai
	qQkSnE32BQGLrhelEp26vTD/SYR9F8/n3xz/QTbAUzMIXH4Isi7E4Et9Ghb21dVBR0t+gOQ6jSLgR
	Fv0aofWBB5dYoCwcYJzEvEVy6FQpJBYvhwxIXya1eQWzKrIZKBbvBJ10RuCO0k+Q/H0wXtvyz6SaN
	mr2LnxmZHh5k9qaP1SUppXxxu2F+Aa8RABqTcix5+G44dft1NQc8M8o2OsjAB//DZH0QkcwTc+nIE
	mjkVRPTfJbQVp7XoFDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EeV-0000000BpGu-1VSy;
	Thu, 17 Sep 2026 16:07:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EeT-0000000BpGD-3LpY;
	Thu, 17 Sep 2026 16:07:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 894FD40772;
	Thu, 17 Sep 2026 16:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82281F00893;
	Thu, 17 Sep 2026 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789661277;
	bh=alFiX9vQD3OGxf/KUE61SipnNAytymprfqLOpM5SESg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GFGLpSvUG1kugl8CawtOTVzl5N7RLiiJf2Ea60/04hAOHU+SKaR8ViB5TniUOMl+Y
	 bmv4jvp/kzMGdMs6dWBm0PGgVFlWlDDpgfandNeeYvqyK/cyNL9UzVo1Qe5AKZ/OdK
	 lvwNKgSQbquVwzrAdyJMmwZpWDprCZ+tvBwYXIhYWzR7fEaHo90Wwk4EJ0ltqXp0+9
	 EWeLs2qatNJ2uuMzfNk6WNyt/K6t0CwyIRGoQLVpDevZMGBzS3Ca9uZYQyDBBkdAwa
	 2xdmdaZ5zjIUC8vM/0imoF/K71g/MS7KzwFbqWBQSB5BlnG9TU7vE+z2TRa45m7fTr
	 SAzWcWKeYCPyg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 17 Sep 2026 17:06:16 +0100
Subject: [PATCH v3 06/20] elf-parse: add section flags, symbol binding and
 a read-only mapping
MIME-Version: 1.0
Message-Id: <20260917-build-speedup-v3-6-9ecf4163ff36@kernel.org>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
In-Reply-To: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 linux-hardening@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6368; i=ljs@kernel.org;
 h=from:subject:message-id; bh=dlGzVBpxKD5xCc0X51dwODyd6BlE3RIkdez/IXW6KMA=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLW8P/9eqr1BF9n7bKj2zc7WxutWn9ZfcKcX4siLjosP
 yxdu+69WkcpC4MYF4OsmCLL8y/i+4NEwuZ1XvB3g5nDygQyhIGLUwAm0ljK8D+gVTlGJ/PRab1/
 8uvefxWI7XvMYndkpfHxjTxl87QufWpn+CuYmbj9hIcKi9SCG0q3bk6I9gr741T8svhj9c1Pa5q
 /MvEBAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Extend elf-parse to be able to read the symbol table of vmlinux in
kallsyms.

This requires the ability to open ELF files in read-only mode, so provide
elf_map_ro() to do so.

It also requires accessors for section flags and symbol bindings, so
provide these via shdr_flags() and sym_bind().

Also, check for the file being an ELF file first in elf_parse(). This is
the logical thing to check for first, but additionally prevents kallsyms
from having to check this it self.

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 scripts/elf-parse.c | 48 +++++++++++++++++++++++++++++++++++-------------
 scripts/elf-parse.h | 19 +++++++++++++++++++
 2 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index 99869ff91a8c..87aa95b1e5e1 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -17,15 +17,21 @@ struct elf_funcs elf_parser;
  * Get the whole file as a programming convenience in order to avoid
  * malloc+lseek+read+free of many pieces.  If successful, then mmap
  * avoids copying unused pieces; else just read the whole file.
- * Open for both read and write.
+ * Open for both read and write if writable is true, otherwise open
+ * read-only.
  */
-static void *map_file(char const *fname, size_t *size)
+static void *map_file(char const *fname, size_t *size, bool writable)
 {
-	int fd;
+	int fd, prot = PROT_READ, flags = MAP_PRIVATE;
 	struct stat sb;
 	void *addr = NULL;
 
-	fd = open(fname, O_RDWR);
+	if (writable) {
+		prot |= PROT_WRITE;
+		flags = MAP_SHARED;
+	}
+
+	fd = open(fname, writable ? O_RDWR : O_RDONLY);
 	if (fd < 0) {
 		perror(fname);
 		return NULL;
@@ -39,7 +45,7 @@ static void *map_file(char const *fname, size_t *size)
 		goto out;
 	}
 
-	addr = mmap(0, sb.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
+	addr = mmap(0, sb.st_size, prot, flags, fd, 0);
 	if (addr == MAP_FAILED) {
 		fprintf(stderr, "Could not mmap file: %s\n", fname);
 		goto out;
@@ -57,6 +63,12 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 	Elf_Ehdr *ehdr = addr;
 	uint16_t type;
 
+	if (memcmp(ELFMAG, ehdr->e32.e_ident, SELFMAG) != 0 ||
+	    ehdr->e32.e_ident[EI_VERSION] != EV_CURRENT) {
+		fprintf(stderr, "unrecognized ELF file %s\n", fname);
+		return -1;
+	}
+
 	switch (ehdr->e32.e_ident[EI_DATA]) {
 	case ELFDATA2LSB:
 		elf_parser.r	= rle;
@@ -78,12 +90,6 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 		return -1;
 	}
 
-	if (memcmp(ELFMAG, ehdr->e32.e_ident, SELFMAG) != 0 ||
-	    ehdr->e32.e_ident[EI_VERSION] != EV_CURRENT) {
-		fprintf(stderr, "unrecognized ELF file %s\n", fname);
-		return -1;
-	}
-
 	type = elf_parser.r2(&ehdr->e32.e_type);
 	if (!((1 << type) & types)) {
 		fprintf(stderr, "Invalid ELF type file %s\n", fname);
@@ -103,7 +109,9 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 		elf_parser.shdr_name		= shdr32_name;
 		elf_parser.shdr_type		= shdr32_type;
 		elf_parser.shdr_entsize		= shdr32_entsize;
+		elf_parser.shdr_flags		= shdr32_flags;
 		elf_parser.sym_type		= sym32_type;
+		elf_parser.sym_bind		= sym32_bind;
 		elf_parser.sym_name		= sym32_name;
 		elf_parser.sym_value		= sym32_value;
 		elf_parser.sym_shndx		= sym32_shndx;
@@ -133,7 +141,9 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 		elf_parser.shdr_name		= shdr64_name;
 		elf_parser.shdr_type		= shdr64_type;
 		elf_parser.shdr_entsize		= shdr64_entsize;
+		elf_parser.shdr_flags		= shdr64_flags;
 		elf_parser.sym_type		= sym64_type;
+		elf_parser.sym_bind		= sym64_bind;
 		elf_parser.sym_name		= sym64_name;
 		elf_parser.sym_value		= sym64_value;
 		elf_parser.sym_shndx		= sym64_shndx;
@@ -174,12 +184,13 @@ int elf_map_long_size(void *addr)
 	return ehdr->e32.e_ident[EI_CLASS] == ELFCLASS32 ? 4 : 8;
 }
 
-void *elf_map(char const *fname, size_t *size, uint32_t types)
+static void *__elf_map(char const *fname, size_t *size, uint32_t types,
+		       bool writable)
 {
 	void *addr;
 	int ret;
 
-	addr = map_file(fname, size);
+	addr = map_file(fname, size, writable);
 	if (!addr)
 		return NULL;
 
@@ -192,6 +203,17 @@ void *elf_map(char const *fname, size_t *size, uint32_t types)
 	return addr;
 }
 
+void *elf_map(char const *fname, size_t *size, uint32_t types)
+{
+	return __elf_map(fname, size, types, true);
+}
+
+/* For tools that only read the file. */
+void *elf_map_ro(char const *fname, size_t *size, uint32_t types)
+{
+	return __elf_map(fname, size, types, false);
+}
+
 void elf_unmap(void *addr, size_t size)
 {
 	munmap(addr, size);
diff --git a/scripts/elf-parse.h b/scripts/elf-parse.h
index f4411e03069d..453286e63032 100644
--- a/scripts/elf-parse.h
+++ b/scripts/elf-parse.h
@@ -37,10 +37,12 @@ struct elf_funcs {
 	uint64_t (*shdr_offset)(Elf_Shdr *shdr);
 	uint64_t (*shdr_size)(Elf_Shdr *shdr);
 	uint64_t (*shdr_entsize)(Elf_Shdr *shdr);
+	uint64_t (*shdr_flags)(Elf_Shdr *shdr);
 	uint32_t (*shdr_link)(Elf_Shdr *shdr);
 	uint32_t (*shdr_name)(Elf_Shdr *shdr);
 	uint32_t (*shdr_type)(Elf_Shdr *shdr);
 	uint8_t (*sym_type)(Elf_Sym *sym);
+	uint8_t (*sym_bind)(Elf_Sym *sym);
 	uint32_t (*sym_name)(Elf_Sym *sym);
 	uint64_t (*sym_value)(Elf_Sym *sym);
 	uint16_t (*sym_shndx)(Elf_Sym *sym);
@@ -143,6 +145,7 @@ SHDR_ADDR(addr)
 SHDR_ADDR(offset)
 SHDR_ADDR(size)
 SHDR_ADDR(entsize)
+SHDR_ADDR(flags)
 
 SHDR_WORD(link)
 SHDR_WORD(name)
@@ -211,6 +214,21 @@ static inline uint8_t sym_type(Elf_Sym *sym)
 	return elf_parser.sym_type(sym);
 }
 
+static inline uint8_t sym64_bind(Elf_Sym *sym)
+{
+	return ELF64_ST_BIND(sym->e64.st_info);
+}
+
+static inline uint8_t sym32_bind(Elf_Sym *sym)
+{
+	return ELF32_ST_BIND(sym->e32.st_info);
+}
+
+static inline uint8_t sym_bind(Elf_Sym *sym)
+{
+	return elf_parser.sym_bind(sym);
+}
+
 SYM_ADDR(value)
 SYM_WORD(name)
 SYM_HALF(shndx)
@@ -298,6 +316,7 @@ static inline void w8le(uint64_t val, uint64_t *x)
 }
 
 void *elf_map(char const *fname, size_t *size, uint32_t types);
+void *elf_map_ro(char const *fname, size_t *size, uint32_t types);
 void elf_unmap(void *addr, size_t size);
 int elf_map_machine(void *addr);
 int elf_map_long_size(void *addr);

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
