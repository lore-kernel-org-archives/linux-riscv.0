Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD27ECA1016
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 23:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vVCW0b749JqxG9O5FaqKGJzUM/BkjkCMJuvTL0PY1w=; b=rqilIVB52zhNLx
	YC3zQ8Z5rAw2KTOk/RPM2WTtFrhMtZASdnOTbpdafY0qI65q6f+GAoyURVdaCU63iXV/s4Ehhtdec
	jIYwXwaBE1tPM4TOm0TY32iPE2CqH9xZU2ZE3VJooyipIws9xnbIAX8karqUTTmJSs7EpJITcypYo
	74pVak9+SzJVBUpFOdKH/EBg/RdlL0NQp/BiOpVFq+cDov44t+Rkn1CXHRIPX4d5X+y5MXVfNXVw0
	1GyCbcLcp9gHXOhmaPsak7GcnoGL21z4bBK3L0NCMvcq69URgxivA+zz+Jm5FGuR7nUTTAvacGB+s
	FJcgX/Li3zFVweNf4xcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwe4-00000007sXB-13mR;
	Wed, 03 Sep 2025 23:12:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsqe-00000007PRd-46Kh
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 19:08:50 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55f6abcd26bso1640144e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756926527; x=1757531327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuqW8s/GrQuCxdo+FagO/ZJ3gDLQBEgzobOP4r3w3ko=;
        b=IRWhW7X+UgScVFyRqRiGSKJkMFO//DU3Td5ecmT2vgA3uh9YMn2LGECAGzqi0JDNfI
         wPrwrb+Ylk6InSmfyNvNChjeAmW16fQTs7L65L4X/KEeXyDtdCxwDd/i296XV+INxZ80
         XL/eQUfIRVTLnMEaoYSSvTn7KaMmIFWMNy5Ug7J3hAdwi0S8fwcpzN0CoIaN4HZaXo0i
         fw7JIEHqm+x0cpvOH/CRb30RZpLEkKj7Ru2as9W/rEfpu8vWoVWEPkIanFch7BB/Uf/t
         4sudhodeCGnS/2rJN7XMp3mAKzgSkV+E23n86x3nrGELeD92HRiH4wX/6IWF120ytYpp
         xzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756926527; x=1757531327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuqW8s/GrQuCxdo+FagO/ZJ3gDLQBEgzobOP4r3w3ko=;
        b=hAHs3c5B+TTambBKTHwYJQiOwDSrVPj1ps0dm8DKyp1kEkP42EeYb6TzQI3PdO53GA
         G4CNXYcYUJKuLKy4dFvkBJaElknyryhlaVtSycjuFZkoQ6nCOWq56kGu+IASvyEFQ62A
         4jRm4cfiv+6/hgbIhZCRPgRZEa079/De3ed31uoFKn1XFydGej3lSXXUiSw6H1Fxjb9q
         s6C07nNdEG/k36WKURLaRIj/Dh+ViYI3jBBCad941oseQsBPKsojh0zG/tmWFxnZkshH
         jbIKYg85UrVUI60l/mYqOd2yjNZ2F5yrMrqZRr7Bsk3GblNViJHdr3vX9xheDHNdp/yD
         FS1g==
X-Forwarded-Encrypted: i=1; AJvYcCXxLoWsFjgi1l5ItNVYXoKF61YRrTnpIvWAmXXGUZtMztp0qujS03koMmG2joAayP1X27cQ86P+Oa6ioA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiOAnVFgYgosb2XbmmAHvq5vBd2MPq+v6GLKd946hYXLFW/W/w
	DjYqoUI1fRTJKmH9wFT9hxPfVx4ggOR8VsmONSaOXOEeaeuz8TEyk9Ye
X-Gm-Gg: ASbGncvq2gmnxR2o4JxBhAql2tmk567rxYUSDegh94QMXQHbvR4Pq10TWpmBhiwanjJ
	JwBCzME7MGu0HVcB9QEnlgl7dHrsMkjnk04krPw72c4ZIffYGA7kpO9T6F0MMJ14yup8eMeFHhO
	hVqQzbZ0dR06/8MhdLLKP8qi9TEk+olQ4oBQA7uRfq30Qs4VcNweMaWpUFEXZ/4zvMoV2LDNdQk
	d9iFe4GgKqBURbpwbXopNJCeJtp3O2gkxtcE677vCjgLmG1FKOBKCpKdROE2XrUgJhFVkbYa71L
	GjGUZscqdYFPQW/6bEmS0aIkKWXvEtlmsSfr8VAnqxRHqzaiBIPmIbtn324TBmJyeCE0H5FUZ3a
	hrlj8PZ0t7oxyc2s=
X-Google-Smtp-Source: AGHT+IGeLOsgTzLKAVqJ8opF2BGock8RjsxhwYT3ip3FdcviWEaHSKrolQW6jrN3tbOJ9N1o46sMgQ==
X-Received: by 2002:ac2:5f72:0:b0:55f:552c:f731 with SMTP id 2adb3069b0e04-55f6f6b4c11mr3572097e87.7.1756926526560;
        Wed, 03 Sep 2025 12:08:46 -0700 (PDT)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5608abccc75sm704484e87.62.2025.09.03.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 12:08:46 -0700 (PDT)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jason Montleon <jmontleo@redhat.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tejun Heo <tj@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthew Maurer <mmaurer@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Brian Gerst <brgerst@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
Date: Wed,  3 Sep 2025 21:07:57 +0200
Message-ID: <20250903190806.2604757-2-SpriteOvO@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903190806.2604757-1-SpriteOvO@gmail.com>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_120849_023190_EA2DF29C 
X-CRM114-Status: GOOD (  16.76  )
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

Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
+ Rust builds for RISC-V due to differences in extension handling
compared to LLVM.

Add a Kconfig non-visible symbol to ensure that all important RISC-V
specific flags that will be used by GCC can be correctly recognized by
Rust bindgen's libclang, otherwise config HAVE_RUST will not be
selected.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Documentation/rust/arch-support.rst |  2 +-
 arch/riscv/Kconfig                  | 62 ++++++++++++++++++++++++++++-
 rust/Makefile                       |  7 +++-
 3 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d0899..5282e0e174e8 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
+``riscv``      Maintained        ``riscv64`` only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1c5544401530..d7f421e0f429 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -195,7 +195,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && RUST_BINDGEN_LIBCLANG_RECOGNIZES_FLAGS
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
@@ -236,6 +236,27 @@ config RUSTC_SUPPORTS_RISCV
 	# -Zsanitizer=shadow-call-stack flag.
 	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_FLAGS
+	def_bool y
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_V
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZABHA
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZACAS
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBA
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBB
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBC
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBKB
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI
+	help
+	  Rust bindgen currently relies on libclang as backend. When a mixed build is
+	  performed (building C code with GCC), GCC flags will be passed to libclang.
+	  However, not all GCC flags are recognized by Clang, so most of the
+	  incompatible flags have been filtered out in rust/Makefile.
+
+	  For RISC-V, GCC and Clang are not at the same pace of implementing extensions.
+	  This config ensures that all important RISC-V specific flags that will be
+	  used by GCC can be correctly recognized by Rust bindgen's libclang, otherwise
+	  config HAVE_RUST will not be selected.
+
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
 	# https://github.com/ClangBuiltLinux/linux/issues/1817
@@ -634,6 +655,11 @@ config TOOLCHAIN_HAS_V
 	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_V
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/e6de53b4de4aecca4ac892500a0907805896ed27
+	depends on !TOOLCHAIN_HAS_V || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 config RISCV_ISA_V
 	bool "Vector extension support"
 	depends on TOOLCHAIN_HAS_V
@@ -698,6 +724,11 @@ config TOOLCHAIN_HAS_ZABHA
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZABHA
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/6b7444964a8d028989beee554a1f5c61d16a1cac
+	depends on !TOOLCHAIN_HAS_ZABHA || RUST_BINDGEN_LIBCLANG_VERSION >= 190100
+
 config RISCV_ISA_ZABHA
 	bool "Zabha extension support for atomic byte/halfword operations"
 	depends on TOOLCHAIN_HAS_ZABHA
@@ -716,6 +747,11 @@ config TOOLCHAIN_HAS_ZACAS
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZACAS
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/614aeda93b2225c6eb42b00ba189ba7ca2585c60
+	depends on !TOOLCHAIN_HAS_ZACAS || RUST_BINDGEN_LIBCLANG_VERSION >= 200100
+
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
 	depends on TOOLCHAIN_HAS_ZACAS
@@ -735,6 +771,11 @@ config TOOLCHAIN_HAS_ZBB
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBB
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !TOOLCHAIN_HAS_ZBB || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
 # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
 # binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
@@ -750,6 +791,11 @@ config TOOLCHAIN_HAS_ZBA
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBA
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !TOOLCHAIN_HAS_ZBA || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
 	default y
@@ -785,6 +831,11 @@ config TOOLCHAIN_HAS_ZBC
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBC
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !TOOLCHAIN_HAS_ZBC || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 config RISCV_ISA_ZBC
 	bool "Zbc extension support for carry-less multiplication instructions"
 	depends on TOOLCHAIN_HAS_ZBC
@@ -808,6 +859,11 @@ config TOOLCHAIN_HAS_ZBKB
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBKB
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/7ee1c162cc53d37f717f9a138276ad64fa6863bc
+	depends on !TOOLCHAIN_HAS_ZBKB || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 config RISCV_ISA_ZBKB
 	bool "Zbkb extension support for bit manipulation instructions"
 	depends on TOOLCHAIN_HAS_ZBKB
@@ -894,6 +950,10 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI
+	def_bool y
+	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || (TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI && RUST_BINDGEN_LIBCLANG_VERSION >= 170000)
+
 config FPU
 	bool "FPU support"
 	default y
diff --git a/rust/Makefile b/rust/Makefile
index 34d0429d50fd..7b1055c98146 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -277,20 +277,25 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
-	--param=% --param asan-%
+	--param=% --param asan-% -mno-riscv-attribute
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to rust/Makefile)
+else
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
 bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
+endif
 
 # Auto variable zero-initialization requires an additional special option with
 # clang that is going to be removed sometime in the future (likely in
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
