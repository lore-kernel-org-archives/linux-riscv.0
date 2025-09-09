Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C04CAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KnpgLnc+Oz7RAwj97CAIZDCPHjtUugEHKddoWWZb/FE=; b=QzfVW91gK9gxIs
	okcQDTAKjNCHCx94pWraMKVT8FAdMx0u/XeSACY/b9U6ZNAlD3kGvrCnImikbuKroN0yWNsneRrnR
	nJeLzLdpp9MP/+7H5WCabQk8H10/pJnCOZiqLrSuXDI0m/JC9fytlszOHR8jf0xAk8lUXTqulWbe0
	DFnswbYur3xBPlR1Ttpd5Gcra6U0WkKvFQSbLqP/ZlDSRllLqQuTrdAGKlouvESVlZSlUDobGO68P
	yKykgS84Bhf7I3xJlN84fQx2KOVe7z/jCzhbYGcIcKQ+gJ1hNSOIrSPXvBnW8OUdgWsMHO4ehBqCK
	OGO3OIpHPrj4lFo9OS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27E-000000096JV-00Ez;
	Tue, 09 Sep 2025 17:26:48 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1cc-00000008fvG-2geB
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 16:55:12 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-33ca74c62acso24191141fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 09:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757436908; x=1758041708; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MW2UyO8szgIwKPOV9iQ6lOYKMxiMFpTTkGCMRsYswlo=;
        b=l295mB+pMFqEWyW4rv20Q7MVB8ugSwQsLlUaqYl9G578uDO58epv+VgnjZusj5Mtkf
         vPfNRXiUd8fYm7Hi2WK06ADdMNuUw00u4ySBnJJI11ZlGzkvTEZcY4tKPoLx8WbFYUk1
         LyqGTbN3QV4zKkwY99RrTktvUaR5Sk5AqSVsnr79XZ/HLuIQFZlekkGu93hADDzSyaYY
         p5Vq2txpY+18Mf1QvFpY1b+wFd4yD35FGrfSbkuzFughYdmmoN1MxohASltH+n6tRiIy
         xw8cnfmV9z1rnYGOjjLOdR/gEApHxNa1Jo/aRA2U9dAfyBy3c3PehFJUMHnvSnv9xFmB
         hTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757436908; x=1758041708;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MW2UyO8szgIwKPOV9iQ6lOYKMxiMFpTTkGCMRsYswlo=;
        b=HGxbRwEIUfIft6N5bV3w6FzFLDuJuLht+whrsIUHoTMXUEujyJs9++Y0NDr26gMmnC
         1suJo/5OD9u/vEnrRYj7hDSVjEGZg/rKSnvBCu1T5vwjDO19t2UZ2AxwzgfmKPtgTKAu
         JZ6M2k5BNP5H1rbL8fC+HDj7zcP7f8ZNKflRHOYfwUe/UIUbTRaNDaZWcUZgDkX93ScN
         lQWD+jtxszaqaDm+1EFrb8LhbxmMklYXwPXVMczgOICm0Hicp+3mCDofsgwGnnarEjIp
         Ddq1T12y+bXeKHlvgEnX62w1LjfA/ldNasW2WEO4yoIm+J0CezxPw519UXe/mqLDw+zA
         fkiA==
X-Forwarded-Encrypted: i=1; AJvYcCU64ZualnathWg6l1PH3/QAq/1OsMoV7Lh/PYKkgnGLHRaDxGMCfLH0rmwFSqgAcB31k7ODEOsmLWRRIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YziUNUmBqBFek50zpHI+LV8AqKyLiFkVUBCN7f0u+Hi0z0FcXd6
	DosWFkCBK0naLwop13QQb5pmQ/kKz7w4CII6mUWshwAxI93kQJgRsi0y
X-Gm-Gg: ASbGncvhcXIKAg0w37W3zxb1SAyc/qUydRAHcvnFq70+of+v6E7sMhxAnKSaFVhs7s4
	kASFn8Y1nC0XoCKi5O2KbgQO2pqNU2dUCvL9E0mXhppN58wbyjQZ/KZZMtH5dPGB+M611Qizttz
	iZk/Y8V+T6b3ChUjX6imZfsnn4g6Yp4DnjMpFdCrApvW4aE0iMFXBN/9EwpcylqNZQ0SuRhBLxX
	N2ifqxIHoeoErvpgUsFUnoXqNsL/uGf2JSnPXLMMrfK/w8VJE6kyDzdfDWyA/MT+GWiX+YGHF5z
	AQMY0nEcnuieb0eSyMnNGY4DYdpNpA6m9geK4WuEfd5URh0w57j3StTbYQyIYLD+OanSuqOojDR
	XCiXX6hnLvsCsrkFsAGrgtZMoeA==
X-Google-Smtp-Source: AGHT+IESxbSTowEh/MuV1VONawSYgLYSwi5N1KMPdlHX0qge6NWZjwfM9S3IqiM6P3/sAtYhBb/H5w==
X-Received: by 2002:a05:651c:b0b:b0:337:f9dc:d81e with SMTP id 38308e7fff4ca-33b4d8cb121mr36405451fa.17.1757436907493;
        Tue, 09 Sep 2025 09:55:07 -0700 (PDT)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-337f4c5076esm41435621fa.7.2025.09.09.09.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 09:55:06 -0700 (PDT)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Tue, 09 Sep 2025 18:53:11 +0200
Subject: [PATCH v2] RISC-V: re-enable gcc + rust builds
MIME-Version: 1.0
Message-Id: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHZbwGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNL3fTkZN2i0uIS3TIjXXMDCxMDA+OkZDNDSyWgjoKi1LTMCrBp0bG
 1tQBdd7CTXQAAAA==
X-Change-ID: 20250909-gcc-rust-v2-7084003bc619
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_095510_778292_D5020D1F 
X-CRM114-Status: GOOD (  21.82  )
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

Add a Kconfig symbol to indicate the version of libclang used by Rust
bindgen and add conditions for the availability of libclang to the
RISC-V extension Kconfig symbols that depend on the cc-option function.

For Zicsr/Zifencei special handling, since LLVM/Clang always enables
these two extensions, either don't pass them to -march, or pass them
explicitly and Rust bindgen libclang must recognize them.

Clang does not support -mno-riscv-attribute flag, filter it out to
resolve error: unknown argument: '-mno-riscv-attribute'.

Define BINDGEN_TARGET_riscv to pass the target triplet to Rust bindgen
libclang for RISC-V to resolve error: unsupported argument 'medany' to
option '-mcmodel=' for target 'unknown'. Improve to output a clearer
error message if the target triplet is undefined for Rust bindgen
libclang.

Update the documentation, GCC + Rust builds are now supported.

---
Discussion:
https://lore.kernel.org/linux-riscv/68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com/
Patch v1:
https://lore.kernel.org/linux-riscv/20250903190806.2604757-1-SpriteOvO@gmail.com/

GCC + Rust builds for RISC-V are disabled about a year ago due to differences in
extension handling compared to LLVM, as discussed in
https://lore.kernel.org/all/20240917000848.720765-1-jmontleo@redhat.com/

This patch re-enables GCC + Rust builds. Compared to v1, v2 reverts the
separation of get-rust-bindgen-libclang script and improves Kconfig conditions
based on Conor's review.

The separation of get-rust-bindgen-libclang script is reverted based on the
concerns raised by Miguel. However, it's worth noting that we now have 3
different places rust/Makefile scripts/{Kconfig.include,rust_is_avilable.sh}
where manually calling bindgen rust_is_available_bindgen_libclang.h + sed to get
the version of libclang, and in particular, for our newly added Kconfig symbol,
we now use awk to canonicalize the version to an integer. I would still like to
do the script separation later for better maintainability and readability if
possible, which can be discussed further later when Miguel has time.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Documentation/rust/arch-support.rst |  2 +-
 arch/riscv/Kconfig                  | 30 +++++++++++++++++++++++++++++-
 init/Kconfig                        |  6 ++++++
 rust/Makefile                       |  7 ++++++-
 scripts/Kconfig.include             |  1 +
 5 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d08991a130a8e79dc4ad7ad09da244020..5282e0e174e8de66b4c6fec354cf329fd2aec873 100644
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
index 51dcd8eaa24356d947ebe0f1c4a701a3cfc6b757..3e892864f930778218073e8ee5980eb8f4e1594a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -191,7 +191,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
@@ -629,6 +629,8 @@ config TOOLCHAIN_HAS_V
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
 	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/e6de53b4de4aecca4ac892500a0907805896ed27
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 config RISCV_ISA_V
 	bool "Vector extension support"
@@ -693,6 +695,8 @@ config TOOLCHAIN_HAS_ZABHA
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/6b7444964a8d028989beee554a1f5c61d16a1cac
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 190100
 
 config RISCV_ISA_ZABHA
 	bool "Zabha extension support for atomic byte/halfword operations"
@@ -711,6 +715,8 @@ config TOOLCHAIN_HAS_ZACAS
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/614aeda93b2225c6eb42b00ba189ba7ca2585c60
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 200100
 
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
@@ -730,6 +736,8 @@ config TOOLCHAIN_HAS_ZBB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
 # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
@@ -745,6 +753,8 @@ config TOOLCHAIN_HAS_ZBA
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
@@ -780,6 +790,8 @@ config TOOLCHAIN_HAS_ZBC
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 config RISCV_ISA_ZBC
 	bool "Zbc extension support for carry-less multiplication instructions"
@@ -803,6 +815,8 @@ config TOOLCHAIN_HAS_ZBKB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/7ee1c162cc53d37f717f9a138276ad64fa6863bc
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 config RISCV_ISA_ZBKB
 	bool "Zbkb extension support for bit manipulation instructions"
@@ -890,6 +904,20 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
+	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_LIBCLANG_VERSION >= 170000
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
diff --git a/init/Kconfig b/init/Kconfig
index e3eb63eadc8757a10b091c74bbee8008278c0521..0859d308a48591df769c7dbaef6f035324892bd3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,6 +82,12 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config RUST_BINDGEN_LIBCLANG_VERSION
+	int
+	default $(rustc-bindgen-libclang-version)
+	help
+	  This is the version of `libclang` used by the Rust bindings generator.
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
diff --git a/rust/Makefile b/rust/Makefile
index bfa915b0e58854045b367557342727fee4fe2808..8c6f84487c41880816d1e55ba4c0df0e5af4e8fd 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -290,20 +290,25 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e8030e659d6b321acaea1acd42c387a4..00462b29030515fcaaa49613e87e2a33320468ae 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -67,6 +67,7 @@ m64-flag := $(cc-option-bit,-m64)
 
 rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
 rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
+rustc-bindgen-libclang-version := $(shell,$(BINDGEN) $(srctree)/scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -nE 's:.*clang version ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p' | awk -F'.' '{print $1 * 10000 + $2 * 100 + $3}')
 
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise

---
base-commit: f777d1112ee597d7f7dd3ca232220873a34ad0c8
change-id: 20250909-gcc-rust-v2-7084003bc619

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
