Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443A1CAC58F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Evz4LvbXnWY3TluSKNlTflGcne7PopTPkJRl3xwW6OQ=; b=wfaipZXN/9ibw/
	W8HpTep5JOn/MHSZ6AiIkDprfom2x+6AZgpYtbgt6IZtCr5y6B0n1wRfSm3r+Uf4dbMyq41Ymc2jM
	j7JJ148++hyqDRMFprnjXgDuilTfWJgcVG9RtSosGBIW2Snf5OK0PyT+KWHODgGCsfrrKUkDlCUoj
	MjNGs3bF6lRYOfio5VH9/IQ97CsbF2KT7wUbFhJDrcLomjAKK9znM+kFXyvPOFBLkGRiX5NoYIkGz
	Dk8GzealXHHrdNP0tea9gYfSw47mUG7jN+MPd0jFZdfsLjO/T0lHL+U/huR1zz/AbkEAt1XNVGbqk
	DNzya4CkoGPcQ/A5K8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgzE-00000000LPd-3aEp;
	Sun, 14 Sep 2025 07:17:24 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgzC-00000000LOe-1nuP
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 07:17:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-560888dc903so3836583e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Sep 2025 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757834240; x=1758439040; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bG3IzL2LjXVOtESbexoXtNfTjZZg9on0erahEnGwuyw=;
        b=Oa1IcZOe5OVRyuoW9AEkHVoLZTy3oXDirHUgjO0l3HoAXtXCxyysyplu7m+0NZKrYC
         I1dIC/ZkFChoibhcrp7gcLZ9ZRPIF2g0qT1m56uS9Lo9h9OfoMGgA/5mQGaI5IMUbZEp
         A6RCWhiupVxcyYenUugYwzjoZzWBSTPJD6k6PdnylXxfRDu/i5G558U7CeigCyba16t6
         pNu3J9JSBVrLeJZMkjfq8GQt6yf51hXpFd5AqReyW3Jp63yM1WRMxa9dpPCuQCU+7PiP
         n/S2+wJEvp/lwH+ySd2Wn2ohLJQdiEbTrWQkdJ7cOb7UTORr13Q9YkSPyGO/q0w9+f64
         V92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757834240; x=1758439040;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bG3IzL2LjXVOtESbexoXtNfTjZZg9on0erahEnGwuyw=;
        b=KWjqxrNMFy7Y9oqL/6m4kVYFCpv/UsnCIDj7BbvVDl7tzu3hWMOPUK2YZqH/v8tyoz
         F6auK1ZU6Ymqk564YLFyNBI5dOzvzxu1RIDP2n0tQ5hVbNbsL9gVeB7xrGDTdl2CHnvJ
         uwTlEIi+S1tEwUIIaxqEsTit8K74Z5kHOl8zYvu8hb5SjRkWnFPzhxL+k5Bgp8A9+Byq
         yPi29+zwonOBuPJWCR9lvets3IMiZwjZbDm1Zb55Ii5dk2pABevAnR9tHXwVK50ePkv2
         MDg9ULGComxDM8hqjTuT+/sJf4rbpMZyCUmO0wkfHEOSS30ZVWbJFMD9XmLvrwfzrz0n
         4sRg==
X-Forwarded-Encrypted: i=1; AJvYcCVj+Wg0frq9iLpIEGPmpM8AlJZ1W7nUBnqLHPFuRbHmtVvtptIJtpYrS8Pjn/4+9CaH3Bcw80dpkeh+AQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/SZTxFmBPvOGyw0Z2KaMCjypJ2I5Ba83/bEoJLcn9rZPGIZ9E
	UPSvfsw5KUuaC9dEyQ6WxvVLZXAft0CakPYQHKc0NovnGDCEsv9yp5+c
X-Gm-Gg: ASbGncvuVyP9redaoubg8hF6/KO+i9N2ZAGNNFM4BdJZPiiuawM/0xxES9cnKfmOALu
	n+8jRCkzCE01ULh5jdKMk1XCfnVNNZhlCwcIz0rDdDA9Mh00WkrZ8CErA2vr0zyCPaj/MI3wMZB
	daEDqVtqMWT1LKQFTsRoGf9onDO3DsWFwIMCW3Qa83brya3Dz/oeR9YyJv3cPR0eaURuQx39oZD
	EdaJIyrQG6nHnDdJR8J0WB0Sj6iM+Mzo8TU4dVjSWXQB2wnQF0dpc4dpsEwoVWltFQ1dJgRuZXV
	jE2o1Qdm0o0gXZI2638yp/WJqkdPZt0TcI7xM4bVNYerwLjiTh0in/UH4PzVVaTVG8NAi1wEKN9
	ZihZX
X-Google-Smtp-Source: AGHT+IGuqlVGw+pNXypOYIGLs5ZdoCHzOKrf3n1RDu4cLKNgN6KSPHqq382i7oXWa1WvUEscJbrQ1g==
X-Received: by 2002:a05:6512:3043:b0:560:956e:4392 with SMTP id 2adb3069b0e04-570489fca64mr2505069e87.9.1757834239309;
        Sun, 14 Sep 2025 00:17:19 -0700 (PDT)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-56e5c3b62c9sm2572478e87.27.2025.09.14.00.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 00:17:18 -0700 (PDT)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Sun, 14 Sep 2025 15:16:40 +0800
Subject: [PATCH v3] RISC-V: re-enable gcc + rust builds
MIME-Version: 1.0
Message-Id: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
X-B4-Tracking: v=1; b=H4sIANdrxmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0MT3fTkZN2i0uIS3TJj3UQTQ1OTRAsjMwMTUyWgjoKi1LTMCrBp0bG
 1tQBGHRiyXQAAAA==
X-Change-ID: 20250914-gcc-rust-v3-a4154a826045
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
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_001722_535247_D819E0B2 
X-CRM114-Status: GOOD (  18.13  )
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
index 33193ca6e8030e659d6b321acaea1acd42c387a4..b893bbc130f774bdca831893fed9b76d42bf540a 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -67,6 +67,7 @@ m64-flag := $(cc-option-bit,-m64)
 
 rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
 rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
+rustc-bindgen-libclang-version := $(shell,trap 'echo 0' EXIT; $(BINDGEN) $(srctree)/scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -nE 's:.*clang version ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p' | awk -F'.' '{print $1 * 10000 + $2 * 100 + $3}')
 
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise

---
base-commit: f777d1112ee597d7f7dd3ca232220873a34ad0c8
change-id: 20250914-gcc-rust-v3-a4154a826045

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
