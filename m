Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C76C79FAA
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LR/q8XBg9E6ejSvgiJatPXtlaa+9SGRat9lK49Ek9Xk=; b=2qdjG1TBCduAvu
	kg1TarSSx6k8voGURYJ3IigUPiHbj+3JCePKbCl86OoO1/hT0JlUh6qpWSKA0KgqFNXBWr4s3HcDY
	0/YUEMsmPchvVRSRQ/IfmFgdUMXaMgO8J1p9tBIC+HclZGoKN/Kn+DCKNGPQaevK577yxT18IkoRP
	u6UHGPOuTmckeKaN90ESTfgYR2No/rG3sbljI72MUxetfMQL4/8msq5zC43AP2/tcAiTBs/DaZj0X
	ZG7uBWq+pcMcgbhUzvoy5Bg0NtIUxyEpir50mK3+/L5Euo6mQpT4fpUQCa9A2By3uzC2FhQ+VemU7
	ncB9HwQqahnjzX4NLBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42uX-0000000AGdd-0WzH;
	Tue, 08 Sep 2026 20:59:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42uU-0000000AGcR-1Z6N;
	Tue, 08 Sep 2026 20:59:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9194601F6;
	Tue,  8 Sep 2026 20:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D881F00A3D;
	Tue,  8 Sep 2026 20:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788901157;
	bh=KP4DPjtGqjYlZDY/C6oiw5PNNFH4xgYFq5gb3vP/9DM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=l2H8oEfyiisTrkmWPXFPkrb9zX+PnNqQLPTWl+vHf3NsuP+fCsXMWBsX7BjXJYlWZ
	 nqqgTPf7uY55PDIAWtwo6hXNTbMnaLlGNx4ryMRpe/nOzVqpEzc5iWLw2JLhb8Co05
	 9s1SasDqfvP91H8sdwcoy4A7YTh8DB0wv+Bi/OoXlL2MblT9cgvSRSaEexFHujfFy6
	 8P4N8pmqaNnNKGCxCVliu0/Kec45kp7oMDRUSzS6XwAjYJU0gH5oVqdZOxDseQyQO1
	 Jh1owZbgK0zD6cmR+j9o1TGHMmkFGwpKic4yhyualkluEnQUYWO/YKOT5YBaGeN1wf
	 Oue7w0xvvFlNw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 08 Sep 2026 21:55:20 +0100
Subject: [PATCH 20/23] kbuild: rust: parallelise rustc front end
MIME-Version: 1.0
Message-Id: <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
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
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115; i=ljs@kernel.org;
 h=from:subject:message-id; bh=LB9T7y9hXziw5kYzoWlATIyn+dzyDLeA+KV1Dtb+tR0=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLIWlFnEMd3Ve9ZQVLbpj4/Z9s0fLu8KN58+tafn1S/fR
 l1FmWdTO0pZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCR0CuMDFOjrd+XSqqK1Lpq
 xpUur5gszfvmzYl5k5X2XJzc+WaJ1SNGhteOwtIX8jW6gl0FqjNPhzDoas99cHsCh5ZbR+ar/1f
 9uAA=
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

Rust crates are compiled in a serial chain on the critical path - core,
bindings, kernel crates and then the drivers - each a rustc invocation.

With CONFIG_RUST set and every rust driver enabled, the entire chain takes
around 25 seconds on a 128-thread machine, with the associated C code
taking 24 seconds.

Each time a change is made to any of the bindings, it triggers a rebuild.

Use the -Zthreads option to have rustc perform builds in parallel. This has
been available since rust 1.84 (rust-lang/rust#132282), and the kernel
requires rust 1.85 or above.

A future -j/--jobs option is planned for
rustc:(rust-lang/compiler-team#1005), so check to see if this available and
if so use it.

If the user's rustc supports neither, then it falls back gracefully and
neither are used.

The threads are taken from make's jobserver, so a parallel build is not
oversubscribed. It was found that benefits level off at 8 threads (16 was
found to be around the same, and 32 slower).

Generated output was confirmed byte-for-byte identical.

Observed build time changes (using rustc 1.98, clang):

                                        before    after
  core.o                                   7.7s	    4.9s
  bindings.o                               4.3s     3.1s
  kernel.o                                 2.0s     1.4s
  clean build                             39.3s    34.6s
  touch rust/kernel/lib.rs                12.9s    12.1s
  touch rust/bindings/bindings_helper.h   19.5s    17.5s

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 defconfig+RUST, clean               41.0s    36.4s     -4.6s (-11%)
  x86 defconfig+RUST, touch lib.rs         8.3s     7.7s    -0.56s (-7%)

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 Makefile     | 4 ++++
 init/Kconfig | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/Makefile b/Makefile
index 997fc7ebe096..7d23d7b64be3 100644
--- a/Makefile
+++ b/Makefile
@@ -1204,6 +1204,10 @@ KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/= --remap-path-scope=macro
 endif
 endif
 
+ifdef CONFIG_RUST
+KBUILD_RUSTFLAGS += $(if $(CONFIG_RUSTC_HAS_JOBS),-j8,$(if $(CONFIG_RUSTC_HAS_ZTHREADS),-Zthreads=8))
+endif
+
 # include additional Makefiles when needed
 include-y			:= scripts/Makefile.warn
 include-$(CONFIG_DEBUG_INFO)	+= scripts/Makefile.debug
diff --git a/init/Kconfig b/init/Kconfig
index 3c92c87254a3..4096a306e2ab 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -231,6 +231,13 @@ config RUSTC_HAS_FILE_AS_C_STR
 config RUSTC_HAS_SUSPICIOUS_RUNTIME_SYMBOL_DEFINITIONS
 	def_bool RUSTC_VERSION >= 109800
 
+# rustc's parallel front end: -j is the coming spelling, -Zthreads the current one
+config RUSTC_HAS_JOBS
+	def_bool $(rustc-option,-j8)
+
+config RUSTC_HAS_ZTHREADS
+	def_bool $(rustc-option,-Zthreads=8)
+
 config PAHOLE_VERSION
 	int
 	default "$(PAHOLE_VERSION)"

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
