Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2090C88E6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXhu+9CI5wIgwVqdislMtyf0l800vJqgTD4U8RfsTPI=; b=daWm5Nhg/E8FDU
	Ey4DX81r+2UUpZRcx//c09kCv5ScEXtyjM5ybm81CDKc4Tfv0KDzNB3cFfurZthcPtBBjMWVqr0EN
	Hf3DQ/WTmx9K8+rpePbOfAIzY5GdRCh1PNDJn5uy2e5e04vqtpF+lpUXfr0beifEBjGjGPqAbQZCo
	T9hlKV+Zokg/hT5gwDnqJCflQiSIZta2t6hVykK66Gh+es68CP7gAQueSbqeie9nfVDRc/3HC0S+j
	PKCGOOi4C0CWDTjCaEdB6w8csX8bkcfAFYvJ9gPiZ5KDGKIYhb9HFqUplxtsA0JVcVmTdMfRwqmGh
	efhqRYo3Po5LdlMe75sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62wC-00000002wGq-1rUh;
	Mon, 14 Sep 2026 09:25:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62wA-00000002wF6-2CCo;
	Mon, 14 Sep 2026 09:25:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1438601DB;
	Mon, 14 Sep 2026 09:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9291F1F00893;
	Mon, 14 Sep 2026 09:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377917;
	bh=MlHxyJY4HAa/6VNWaILQ/yCa4l1lTL7VmN2BOtdjyCg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NactYzSqVtEBr8OHpwOtVkFw5kxseKF3YcaZG8wVn1eLJj62D5ttndc5JuTVpSZb7
	 QDbb3RreMSkIfnOTzv6pQqNvIVUkZVlXHSvJ312gkgM5sehMVfK90hRuLW6qcv4eta
	 OV2nqkzEWV526oBEvYWw9vgUIJOjryqeXVk0ZF27iHcosnu9O6k/QdKx/lPl/2x97D
	 kncuHUTQBgnqlDV5ZYDTJwF41btSavfUYgxwP8Bwvn89dagzdZG+yi78TWX6pYW+QP
	 DllhYEpcTK+de9iM2AT209f/K8c+bPM8ehIImodv0mOA5YR4jq3f0ZuROr6dm+GpbI
	 oFZSxnflXLVcw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 10:22:20 +0100
Subject: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
MIME-Version: 1.0
Message-Id: <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
In-Reply-To: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5694; i=ljs@kernel.org;
 h=from:subject:message-id; bh=i4Q5FyYbPndNo8fJS+kn8FrZCIOZYFQdzUc223QKkJ8=;
 b=kA0DAAoWz53NioHifxQByyZiAGqnvMKhMxKk7nhnTotN8bFtS5mi2KGLdyf4BR2mUrrr2HgKo
 oh1BAAWCgAdFiEE5/QXv1IUVp6J0E9Gz53NioHifxQFAmqnvMIACgkQz53NioHifxTdcAEAgxQT
 3P1Mksw674GaGcJ3ObMt8+QNeMwgQ/URc1cuwUAA/2r9twxzcl7zW9cuqgQgIpT5Cxv77pTPS/E
 IZxIBN/EB
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

The gzip step of a kernel build is very lengthily, especially for larger
builds such as allmodconfig.

gzip itself cannot be run in parallel, however an alternative tool exists
that can, providing the same feature set as gzip itself - pigz - which
works as a drop-in replacement.

On a 128-core Threadripper, gzip -9 of a 36 MiB x86-64 vmlinux.bin takes
1.6s, and with pigz it takes 0.09s, so the performance increase is
significant.

It is already possible to specify KGZIP on the make command line to make
use of pigz, however it seems sensible to make use of pigz if it is
available.

Therefore default to using pigz if it is available on the system upon which
the kernel is being built, otherwise fall back to gzip.

Modules are compressed one per make job at install time, so a parallel
compressor gains nothing there and with -jN would run N times the core
count in threads. Limit pigz to a single thread for module compression.

The output is byte-for-byte identical between pigz/gzip invocations, but
gzip and pigz do not produce the same stream as one another.

Therefore, for reproducible builds, the same set of tools should be used.

This seems to already be an implicit requirement in any case, but update
the reproducible build documentation to make this clear.

Also update the kbuild documentation to reflect the change.

Every x86 build ends with the compression of vmlinux.bin, 36MB for
defconfig and over 200MB for allmodconfig, no-op builds are unchanged.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 defconfig, touch mm/vma.c, gcc        7.7s     6.0s     -1.7s (-22%)
  x86 defconfig, touch mm/vma.c, clang      6.9s     5.4s     -1.5s (-21%)
  x86 defconfig, clean, gcc                28.2s    26.3s     -1.8s (-6%)
  x86 defconfig, clean, clang              28.7s    27.2s     -1.5s (-5%)
  x86 allmodconfig, touch mm/vma.c, gcc    23.7s    15.4s     -8.3s (-35%)
  x86 allmodconfig, touch mm/vma.c, clang  22.5s    15.6s     -7.0s (-31%)
  x86 allmodconfig, clean, gcc            294.1s   278.6s     -15.5s (-5%)
  x86 allmodconfig, clean, clang          283.9s   266.8s     -17.1s (-6%)

Link: https://zlib.net/pigz/
Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 Documentation/kbuild/kbuild.rst              | 15 +++++++++++++++
 Documentation/kbuild/reproducible-builds.rst | 16 ++++++++++++++++
 Makefile                                     |  2 +-
 scripts/Makefile.modinst                     |  4 +++-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 9b2b127676c3..ebfc2945ac03 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -110,6 +110,21 @@ HOSTLDLIBS
 ----------
 Additional libraries to link against when building host programs.
 
+KGZIP
+-----
+The gzip compressor used for the compressed kernel image, compressed
+modules and packaging.
+
+Defaults to pigz (a parallel implementation of gzip) if it is available,
+otherwise gzip. Set ``KGZIP=`` on the make command line to use another
+program. Modules are compressed one per make job, so pigz is limited to a
+single thread there.
+
+KBZIP2, KLZOP, LZMA, LZ4, XZ, ZSTD
+----------------------------------
+The compressor programs for the other formats. Each defaults to the program
+of the same name.
+
 .. _userkbuildflags:
 
 USERCFLAGS
diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index bc1eb82211df..ec0135da4464 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -76,6 +76,22 @@ include generated files.  You should ensure the source tree is
 pristine by running ``make mrproper`` or ``git clean -d -f -x`` before
 building a source package.
 
+Compression tools
+-----------------
+
+The compressed kernel image, compressed modules and packages are produced
+using the program named by the make variable ``KGZIP`` (described in
+Documentation/kbuild/kbuild.rst).
+
+It defaults to ``pigz`` if installed (a parallel implementation of gzip),
+or ``gzip`` otherwise.
+
+The generated output between two invocations of identical builds with
+either of the default tools will be byte-for-byte equivalent.
+
+However, for reproducible builds, ensure the same tool is used on all build
+hosts, as different tools may generate different output from one another.
+
 Module signing
 --------------
 
diff --git a/Makefile b/Makefile
index 790ef23c5e8a..38c0cdc9f591 100644
--- a/Makefile
+++ b/Makefile
@@ -561,7 +561,7 @@ PERL		= perl
 PYTHON3		= python3
 CHECK		= sparse
 BASH		= bash
-KGZIP		= gzip
+KGZIP		:= $(if $(shell command -v pigz 2>/dev/null),pigz,gzip)
 KBZIP2		= bzip2
 KLZOP		= lzop
 LZMA		= lzma
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 9ba45e5b32b1..58dafec8f910 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -145,8 +145,10 @@ endif
 #
 # Compression
 #
+# Modules are compressed in parallel by make itself, so keep the compressor
+# single-threaded when it is pigz.
 quiet_cmd_gzip = GZIP    $@
-      cmd_gzip = $(KGZIP) -n -f $<
+      cmd_gzip = $(KGZIP) $(if $(filter pigz,$(notdir $(firstword $(KGZIP)))),-p 1) -n -f $<
 quiet_cmd_xz = XZ      $@
       cmd_xz = $(XZ) --check=crc32 --lzma2=dict=1MiB -f $<
 quiet_cmd_zstd = ZSTD    $@

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
