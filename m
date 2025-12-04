Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0F9D1D885
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 07:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU21uuYOWCZkdq4p+DCUVVXFW4lzJTdxiDaRUV5MfK4=; b=MZkeOqKIewoMdA
	pJOAe+lb3hn6SdhB0JaaKDANJfLT5Q991enUkD0A4cQlnR0FhaZy1IugsL0sjUjE4DmVYpb2LwChM
	g9CuG6oxpR5W/JSJDtp+vkZl8/FiXVbJ9VPOCI0HzLFrI2VRQnUpofYcCue+O03sx0s0YvlQg03KT
	yjX0Fxst1fQVeOFaims4WWI8lmWXfMrLP2BLOgzUjoEICu3bvWlQoYS5FuVfGfmrCiuKpq204En5I
	F7iLRc+aRVYnNY6+gtSRX2DaWfcZrU/NltivPBrY+IoMiEeLjbDe+OSnOoZEf02LBP7NckihXHtTV
	fn+87nAHKKmGT4qmnlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BS-00000007dNe-22zW;
	Thu, 04 Dec 2025 07:55:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BQ-00000007dLe-0u0X
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 07:55:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59584301f0cso673061e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 23:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834922; x=1765439722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFpDiwl5QELAGSjHLYwP943u+3dPXQammgNgy7agEDk=;
        b=cvG84ygBRx0GnEN9+WCGiCJTwsLaoYPWT5RLCIhoLgF17bREZPOiWPMwgWHNRmDDoi
         UHBQFheBUT5W6Pqhl8LRyCL0XMGvvz0beGkXuLFHa6hhY6f1DAdkAAE+2JR46SNGk4KX
         Ym29YFGy8cF3gpXRVLbzbC671TJTMXvVnyau1jqaXyXW2lnKxDIDhiQsINLbHAAiofdy
         nVPhGbUL0M/7ylRiyH0BrNt2wvqVGf8ENXYhk6yiC2Rd+p4lTGDDzHNmmwcyQiZsb122
         TsUXrsGRgG48j/4Wj3R7ZLFbDt9Ua5vgZu4KyuQgXBiz3XG6osXUuPPA5h2hay/HEDBm
         Jaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834922; x=1765439722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFpDiwl5QELAGSjHLYwP943u+3dPXQammgNgy7agEDk=;
        b=asZ/PmNJQ2xBor45YccoA1TXsBg2w9R0eLd6oxt25CMwmsM/GS8K4AICxkGtamGymt
         eVgyAuWS95zLpB2SqPogGpSSh1mTqr2JxDJoN5uvErwEa/XWBLDwgiqlAEHJLrV7OzqH
         bU7zrPymUDRrdjobf/Q3NBNZMFLcBV5hTuej4uwSM6X8q0WVW8zlzau43yuWPYFcmrx2
         Csg+HibDoAzAyqM8bjN9Ano6pxZMiAfsXnFkuwgVpsHRF5qtDn2/BDC0COyLFl3bzzGB
         8OYoR5nm687b4/OpHotY7qQt+zmOEjUjn6CeTIcHBaNmqleiPvCTJOOY3TKb5OtEm2QX
         pLKA==
X-Forwarded-Encrypted: i=1; AJvYcCVTF7Kr1WUaMpuQ91sEBZ8CSnG9xanV2wx97ssvNN6quXP/Y1Cy9FFMMFBz2oPwwdbB2se4QxZFBFCcMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL+GcsgLKd2DWdWOKEHKUjOmA4rG3SnR1dVFbqDgqNI4AfiOre
	o3UmASH7BeqBQyqO3FZANf//yDAVqMrvxiJNlxFWFpsOqctOccJV61AG
X-Gm-Gg: ASbGncsT/Od2BbZ7dgme/JBHfGveKSiNxsaKsmEb6uj+Zf2EKdHM0nH3t7aKhIO8YTd
	fKkFT+Cbcv5luvfQmRKHYuPkwOb6ynDplIPsNOI5ibcfetdRlYZm+OOJIqDitgOyLQ4op7U/4hb
	DZDCZnXxR/WrowDqvBIIERDJVInrvP5PPGFBMQgRejUfTa/d5MA5+CSRSwEGYewhaGu6Kef+lfQ
	itct3tm7d0FUJAYn1DntA1ANBQAz5jRFEMsmUybPXklPcnqqrvueb8sbHSrTSLRP3HOyGJjubvV
	W8CrAxXtoACHiC8DGjFNWmA5tbAFuYDZN60hD3c2NByXbzroFew5RtTJIVG6xmUYtXV4xM847Pc
	RLTkbxPoZRA7o3kz9jyLxZSmU+9GUD5EIGnfEvdX8/A1QLdpU1DdgYi1qfcFwp4ME/BAgRw==
X-Google-Smtp-Source: AGHT+IEhDlWE8of6FKJZTBdolMkdIJwrQS5sBkMxqZRx1jm7mgw1ED3Gz3nsCefElmIVs2UoNwo5Dg==
X-Received: by 2002:a05:6512:3d87:b0:597:cf1d:bc77 with SMTP id 2adb3069b0e04-597d66c8085mr614377e87.29.1764834921676;
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:54 +0100
Subject: [PATCH v5 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
MIME-Version: 1.0
Message-Id: <20251204-gcc-rust-v5-v5-4-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_235524_318052_F13D474A 
X-CRM114-Status: GOOD (  15.85  )
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

From: Asuna Yang <spriteovo@gmail.com>

Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
+ Rust builds for RISC-V due to differences in extension handling
compared to LLVM. This commit enables GCC + Rust builds again.

Add `bindgen-option` conditions for the availability of libclang to the
RISC-V extension Kconfig symbols that depend on the `cc-option`
function.

For Zicsr/Zifencei special handling, since LLVM/Clang always enables
these two extensions, either don't pass them to `-march`, or pass them
explicitly and Rust bindgen libclang must recognize them.

Clang does not support `-mno-riscv-attribute` flag, filter it out to
resolve error: unknown argument: '-mno-riscv-attribute'.

Define `BINDGEN_TARGET_riscv` to pass the target triplet to Rust bindgen
libclang for RISC-V to resolve error: unsupported argument 'medany' to
option '-mcmodel=' for target 'unknown'.

Update the documentation, GCC + Rust builds for RISC-V are now
maintained.

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Documentation/rust/arch-support.rst |  2 +-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       |  3 ++-
 scripts/Makefile.rust               |  1 +
 4 files changed, 38 insertions(+), 3 deletions(-)

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
index fadec20b87a8..9a5606396646 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -193,7 +193,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
@@ -617,6 +617,8 @@ config TOOLCHAIN_HAS_V
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
 	depends on LD_IS_LLD || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64imv)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32imv)
 
 config RISCV_ISA_V
 	bool "Vector extension support"
@@ -681,6 +683,8 @@ config TOOLCHAIN_HAS_ZABHA
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zabha)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zabha)
 
 config RISCV_ISA_ZABHA
 	bool "Zabha extension support for atomic byte/halfword operations"
@@ -699,6 +703,8 @@ config TOOLCHAIN_HAS_ZACAS
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zacas)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zacas)
 
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
@@ -717,6 +723,8 @@ config TOOLCHAIN_HAS_ZBB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbb)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbb)
 
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
 # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
@@ -732,6 +740,8 @@ config TOOLCHAIN_HAS_ZBA
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zba)
 
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
@@ -767,6 +777,8 @@ config TOOLCHAIN_HAS_ZBC
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbc)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbc)
 
 config RISCV_ISA_ZBC
 	bool "Zbc extension support for carry-less multiplication instructions"
@@ -790,6 +802,8 @@ config TOOLCHAIN_HAS_ZBKB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zbkb)
+	depends on !RUST || !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zbkb)
 
 config RISCV_ISA_ZBKB
 	bool "Zbkb extension support for bit manipulation instructions"
@@ -877,6 +891,25 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+config RUST_BINDGEN_HAS_ZICSR_ZIFENCEI
+	def_bool y
+	depends on !64BIT || $(bindgen-backend-option,-mabi=lp64 -march=rv64ima_zicsr_zifencei)
+	depends on !32BIT || $(bindgen-backend-option,-mabi=ilp32 -march=rv32ima_zicsr_zifencei)
+
+config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
+	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_HAS_ZICSR_ZIFENCEI
+	help
+	  LLVM/Clang >= 17.0.0 starts recognizing Zicsr/Zifencei in -march, passing
+	  them to -march doesn't generate an error anymore, and passing them or not
+	  doesn't have any real difference, it still follows ISA before version
+	  20190608 - Zicsr/Zifencei are included in base ISA.
+
+	  The current latest version of LLVM/Clang still does not require explicit
+	  Zicsr/Zifencei to enable these two extensions, Clang just accepts them in
+	  -march and then silently ignores them.
+
 config FPU
 	bool "FPU support"
 	default y
diff --git a/rust/Makefile b/rust/Makefile
index 2603b34f9833..079af058ddde 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,7 +383,8 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-mno-riscv-attribute
 
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index b219244cd051..cee28a604830 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -3,6 +3,7 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
