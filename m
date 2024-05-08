Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA55C19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bkKBcJW6GVHgq6IS8omc1qqDWD/XsAJm7ioa/rt3bs=; b=SNhSvKBPRVaQUP
	lBsBF1yNVVI5KCPW9Hzo/hm191J17DFUS6tOVwJ3j8Aw+N0i5Rfh5shWvpVbHbLUQGmPA/6scgN1e
	8yUCiBOIo1hOpM6Wa+WEecwDL0AusjhoAyYaUDpExBJLjsctDKitGZh/CMdEJaoi2P5UKALmA1aoJ
	ptP0wwPNdsG8DnfsoL8X9NkZHQWcoOSfol6wO8/64/e+BZOy83xtwkFXvu/1TCjzw7jGHv9UljcOj
	t4vWDHLa0+/Nr3PO3WBO8ju3bWLDJmxPk0YGIDlnVyOd0N9kiqzivq6E/CC/1oBfpCva9fAUPJUNo
	yGJ6Q3iAJyPsPhYDr3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEn-0000000Df15-11Ba;
	Wed, 08 May 2024 01:36:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEh-0000000Dexh-20nc
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:36:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6f44ed6e82fso3511993b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715132204; x=1715737004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsWvdiflsnWwGCusk/V+w219I8PirWa/ozpvjoDvtCY=;
        b=BzeB6K/f0LLcTqxLtVJ0nRopylDz2EbBXfzqYeczWrQvxRmcwMY76KlfRxCwT+tivG
         TyCqXq9EDRqnFZxuwfeWVwzC0gUVMbfba7xZxbFc0SS5g2WalqWaGC4qL2kLoNQ8wO05
         4mQvZVzF53PFlXmG87WvbikgjP9t5XBDUud4T0mkzmHdz3aHNDd5gd6H6EJWz7M7HdDQ
         G/3O1Fg4migAUtGqEaPhgdt6j/4LTG8Hdou7kMKpU4EWInkxzQ2bF0bwQJHy3LbvdDzo
         lfI72zzW+YmuklBcddTAqP25sFx1VSX8U2Z74YABALfXyYFrh/iGzOs3SsLKgWjC7Ydy
         ag1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715132204; x=1715737004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsWvdiflsnWwGCusk/V+w219I8PirWa/ozpvjoDvtCY=;
        b=uKGJSmMpzTvIqAI9BxEn6Rn/wnEnwWrKkf6rTXgxCTTTD29uGx1BS5zkhaCTE1ipbo
         XQPTvqhGHIKPlpkaFGSqgvPO7OAi6WxlYGFUUmNajOVbA+5Tm3TDHtS4xXDtHZ749IIA
         6EsDNwefOJqtJL/TtS6DPDWDAZhxRvUGO39TuMjxieLV1EOk7G3zh45kT8rTc3rU4a8y
         0vmveN4UKtYtsrrnNUfT/oERxsw5kjPFxHxSvl4svqRPjLGuEMcNNnUX21GZPOejkPs5
         73uvpJXPV656/YpQKsSL/Ff2NUNG6V8yQcHQYOZ9Rz3Z0zeL9GS5cDkoZlpHdpjcjqGs
         ZG4A==
X-Gm-Message-State: AOJu0Ywtx8K/fyHim8uTtrhxF8h6uvGrwoEviuSl3UoSAV62oDJ7+qvM
	6Dcu6haoWq0djTUyJobQ7joFzrxXRg16VN42zzlz0wuHsgQvHrI2DFex6dKctq4=
X-Google-Smtp-Source: AGHT+IHnbYWaPgyfBvsooFp5nm4cy6R66eKw9IW9Ae2xxUroArGaGCo9hfmYeJJ/Lsc9/W9mM29X7Q==
X-Received: by 2002:a05:6a21:2782:b0:1ac:c455:c126 with SMTP id adf61e73a8af0-1afc8d266famr1254554637.19.1715132203783;
        Tue, 07 May 2024 18:36:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm171994a91.10.2024.05.07.18.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:36:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 May 2024 18:36:28 -0700
Subject: [PATCH v2 2/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240507-compile_kernel_with_extensions-v2-2-722c21c328c6@rivosinc.com>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
In-Reply-To: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715132198; l=16103;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=W4jHdZN/kCsCwkDu00hJrCLOm+euMvrei2YBsQUCfLQ=;
 b=Po3uOpS8qy3hDavCm7BAc4KyH9f/ISmzzk0Eli8vAsMDCAJhx2yoQJ5x2SaBTpoHvNd2vCNya
 c6Uj3tJG8RvCO5SM1Et9LXsKrr4DWMGYfT32EXVMKKrZVzPdBeblh6P
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_183647_588171_F4385683 
X-CRM114-Status: GOOD (  29.53  )
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

Current versions of the kernel add "v" to the march and then immeidately
filter it out such that "v" is not passed to CFLAGS.  Instead of doing
this filtering, code blocks in the kernel that want to use vector
assembly have been changed to locally enable vector (using ".option
arch, +v").

To support kernels that can run on hardware that may support vector, the
config option PLATFORM_MAY_SUPPORT_RISCV_ISA_V is added, and the
previous behavior of RISCV_ISA_V is retained with the option
CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_V. When the hardware is assumed to
support vector, has_vector() unconditionally returns true. "v" is
not added to the toolchain march even when the hardware is assumed to
support vector because kernel vector code must be guarded by
kernel_vector_begin/end.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig               | 54 -------------------------
 arch/riscv/Kconfig.isa           | 85 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile              |  6 +--
 arch/riscv/crypto/Kconfig        | 14 +++----
 arch/riscv/include/asm/simd.h    |  3 ++
 arch/riscv/include/asm/vector.h  |  3 +-
 arch/riscv/kernel/cpufeature.c   |  3 +-
 arch/riscv/kernel/head.S         |  8 +++-
 arch/riscv/kernel/process.c      | 12 +++---
 arch/riscv/kernel/ptrace.c       |  6 +++
 arch/riscv/lib/riscv_v_helpers.c |  1 -
 arch/riscv/lib/uaccess_vector.S  |  2 +
 arch/riscv/lib/xor.S             |  2 +
 13 files changed, 123 insertions(+), 76 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c2a4f5364707..c2e9eded0a7d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -520,60 +520,6 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
-config TOOLCHAIN_HAS_V
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
-	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
-	depends on AS_HAS_OPTION_ARCH
-
-config RISCV_ISA_V
-	bool "Vector extension support"
-	depends on TOOLCHAIN_HAS_V
-	depends on FPU
-	select DYNAMIC_SIGFRAME
-	default y
-	help
-	  Add support for the Vector extension when it is detected at boot.
-	  When this option is disabled, neither the kernel nor userspace may
-	  use vector procedures.
-
-	  If you don't know what to do here, say Y.
-
-config RISCV_ISA_V_DEFAULT_ENABLE
-	bool "Enable userspace Vector by default"
-	depends on RISCV_ISA_V
-	default y
-	help
-	  Say Y here if you want to enable Vector in userspace by default.
-	  Otherwise, userspace has to make explicit prctl() call to enable
-	  Vector, or enable it via the sysctl interface.
-
-	  If you don't know what to do here, say Y.
-
-config RISCV_ISA_V_UCOPY_THRESHOLD
-	int "Threshold size for vectorized user copies"
-	depends on RISCV_ISA_V
-	default 768
-	help
-	  Prefer using vectorized copy_to_user()/copy_from_user() when the
-	  workload size exceeds this value.
-
-config RISCV_ISA_V_PREEMPTIVE
-	bool "Run kernel-mode Vector with kernel preemption"
-	depends on PREEMPTION
-	depends on RISCV_ISA_V
-	default y
-	help
-	  Usually, in-kernel SIMD routines are run with preemption disabled.
-	  Functions which envoke long running SIMD thus must yield core's
-	  vector unit to prevent blocking other tasks for too long.
-
-	  This config allows kernel to run SIMD without explicitly disable
-	  preemption. Enabling this config will result in higher memory
-	  consumption due to the allocation of per-task's kernel Vector context.
-
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Kconfig.isa b/arch/riscv/Kconfig.isa
index 08b7af5aabb0..0663c98b5b17 100644
--- a/arch/riscv/Kconfig.isa
+++ b/arch/riscv/Kconfig.isa
@@ -39,3 +39,88 @@ config PLATFORM_SUPPORTS_RISCV_ISA_C
 	  If you don't know what to do here, say Y.
 
 endchoice
+
+config TOOLCHAIN_HAS_V
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
+	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_V
+	bool
+
+choice
+	prompt "Vector extension support"
+	default PLATFORM_MAY_SUPPORT_RISCV_ISA_V
+	help
+	  This selects the level of support for vector instructions to be
+	  built into the Linux Kernel. This does not impact whether vector
+	  instructions are allowed to be emitted by user-space code.
+
+config PROHIBIT_RISCV_ISA_V
+	bool "Prohibit vector instructions"
+	depends on NONPORTABLE
+	help
+	  Regardless of if the platform supports vector instructions,
+	  prohibit the kernel from emitting vector instructions.
+
+config PLATFORM_MAY_SUPPORT_RISCV_ISA_V
+	bool "Allow vector instruction sequences if supported"
+	depends on TOOLCHAIN_HAS_V
+	depends on FPU
+	select DYNAMIC_SIGFRAME
+	select RISCV_ISA_V
+	help
+	  Only allow vector instructions to be emitted if "V" is present in
+	  the device tree or ACPI table. No vector instructions will be
+	  emitted if the platform does not support them.
+
+config PLATFORM_SUPPORTS_RISCV_ISA_V
+	bool "Emit vector instructions when building Linux"
+	depends on TOOLCHAIN_HAS_V
+	depends on FPU
+	depends on NONPORTABLE
+	select DYNAMIC_SIGFRAME
+	select RISCV_ISA_V
+	help
+	  Adds "V" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in vector instructions in the
+	  Linux binary. This option produces a kernel that will not run on
+	  systems that do not support vector instructions.
+
+endchoice
+
+config RISCV_ISA_V_DEFAULT_ENABLE
+	bool "Enable userspace Vector by default"
+	depends on RISCV_ISA_V
+	default y
+	help
+	  Say Y here if you want to enable Vector in userspace by default.
+	  Otherwise, userspace has to make explicit prctl() call to enable
+	  Vector, or enable it via the sysctl interface.
+
+	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_V_UCOPY_THRESHOLD
+	int "Threshold size for vectorized user copies"
+	depends on RISCV_ISA_V
+	default 768
+	help
+	  Prefer using vectorized copy_to_user()/copy_from_user() when the
+	  workload size exceeds this value.
+
+config RISCV_ISA_V_PREEMPTIVE
+	bool "Run kernel-mode Vector with kernel preemption"
+	depends on PREEMPTION
+	depends on RISCV_ISA_V
+	default y
+	help
+	  Usually, in-kernel SIMD routines are run with preemption disabled.
+	  Functions which envoke long running SIMD thus must yield core's
+	  vector unit to prevent blocking other tasks for too long.
+
+	  This config allows kernel to run SIMD without explicitly disable
+	  preemption. Enabling this config will result in higher memory
+	  consumption due to the allocation of per-task's kernel Vector context.
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index e1be36004097..e1111e62ca20 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -66,7 +66,6 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C)	:= $(riscv-march-y)c
-riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2
@@ -78,10 +77,7 @@ endif
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
-# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
-# matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
-KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
-
+KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
 KBUILD_CFLAGS += -mno-save-restore
diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index ad58dad9a580..5f7ea675a8cf 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -4,7 +4,7 @@ menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
 
 config CRYPTO_AES_RISCV64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XTS"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && PLATFORM_SUPPORTS_RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
@@ -20,7 +20,7 @@ config CRYPTO_AES_RISCV64
 
 config CRYPTO_CHACHA_RISCV64
 	tristate "Ciphers: ChaCha"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && PLATFORM_SUPPORTS_RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
 	help
@@ -31,7 +31,7 @@ config CRYPTO_CHACHA_RISCV64
 
 config CRYPTO_GHASH_RISCV64
 	tristate "Hash functions: GHASH"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && PLATFORM_SUPPORTS_RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_GCM
 	help
 	  GCM GHASH function (NIST SP 800-38D)
@@ -41,7 +41,7 @@ config CRYPTO_GHASH_RISCV64
 
 config CRYPTO_SHA256_RISCV64
 	tristate "Hash functions: SHA-224 and SHA-256"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && PLATFORM_SUPPORTS_RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_SHA256
 	help
 	  SHA-224 and SHA-256 secure hash algorithm (FIPS 180)
@@ -52,7 +52,7 @@ config CRYPTO_SHA256_RISCV64
 
 config CRYPTO_SHA512_RISCV64
 	tristate "Hash functions: SHA-384 and SHA-512"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && PLATFORM_SUPPORTS_RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_SHA512
 	help
 	  SHA-384 and SHA-512 secure hash algorithm (FIPS 180)
@@ -63,7 +63,7 @@ config CRYPTO_SHA512_RISCV64
 
 config CRYPTO_SM3_RISCV64
 	tristate "Hash functions: SM3 (ShangMi 3)"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && PLATFORM_SUPPORTS_RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_HASH
 	select CRYPTO_SM3
 	help
@@ -75,7 +75,7 @@ config CRYPTO_SM3_RISCV64
 
 config CRYPTO_SM4_RISCV64
 	tristate "Ciphers: SM4 (ShangMi 4)"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && PLATFORM_SUPPORTS_RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_SM4
 	help
diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index adb50f3ec205..81508325fd51 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -26,6 +26,9 @@
  */
 static __must_check inline bool may_use_simd(void)
 {
+	if (!has_vector())
+		return false;
+
 	/*
 	 * RISCV_KERNEL_MODE_V is only set while preemption is disabled,
 	 * and is clear whenever preemption is enabled.
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 731dcd0ed4de..a08c4bf92ecd 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -37,7 +37,8 @@ static inline u32 riscv_v_flags(void)
 
 static __always_inline bool has_vector(void)
 {
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
+	return IS_ENABLED(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_V) ||
+	       riscv_has_extension_likely(RISCV_ISA_EXT_v);
 }
 
 static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..7cb365714855 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -683,7 +683,6 @@ void __init riscv_fill_hwcap(void)
 	}
 
 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
-		riscv_v_setup_vsize();
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
@@ -691,6 +690,8 @@ void __init riscv_fill_hwcap(void)
 		 */
 		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+		else
+			riscv_v_setup_vsize();
 	}
 
 	memset(print_str, 0, sizeof(print_str));
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..b027be82bbb3 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -428,17 +428,20 @@ SYM_CODE_START_LOCAL(reset_regs)
 .Lreset_regs_done_fpu:
 #endif /* CONFIG_FPU */
 
-#ifdef CONFIG_RISCV_ISA_V
+#if defined(CONFIG_PLATFORM_MAY_SUPPORT_RISCV_ISA_V)
 	csrr	t0, CSR_MISA
 	li	t1, COMPAT_HWCAP_ISA_V
 	and	t0, t0, t1
 	beqz	t0, .Lreset_regs_done_vector
-
+#endif
+#ifdef CONFIG_RISCV_ISA_V
 	/*
 	 * Clear vector registers and reset vcsr
 	 * VLMAX has a defined value, VLEN is a constant,
 	 * and this form of vsetvli is defined to set vl to VLMAX.
 	 */
+	.option push
+	.option arch, +v
 	li	t1, SR_VS
 	csrs	CSR_STATUS, t1
 	csrs	CSR_VCSR, x0
@@ -447,6 +450,7 @@ SYM_CODE_START_LOCAL(reset_regs)
 	vmv.v.i v8, 0
 	vmv.v.i v16, 0
 	vmv.v.i v24, 0
+	.option pop
 	/* note that the caller must clear SR_VS */
 .Lreset_regs_done_vector:
 #endif /* CONFIG_RISCV_ISA_V */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e4bc61c4e58a..3ba7bf63ccb2 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -165,11 +165,13 @@ void flush_thread(void)
 #endif
 #ifdef CONFIG_RISCV_ISA_V
 	/* Reset vector state */
-	riscv_v_vstate_ctrl_init(current);
-	riscv_v_vstate_off(task_pt_regs(current));
-	kfree(current->thread.vstate.datap);
-	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
-	clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
+	if (has_vector()) {
+		riscv_v_vstate_ctrl_init(current);
+		riscv_v_vstate_off(task_pt_regs(current));
+		kfree(current->thread.vstate.datap);
+		memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
+		clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
+	}
 #endif
 }
 
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 92731ff8c79a..bdfaed2a4023 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -92,6 +92,9 @@ static int riscv_vr_get(struct task_struct *target,
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
+	if (!has_vector())
+		return 0;
+
 	if (!riscv_v_vstate_query(task_pt_regs(target)))
 		return -EINVAL;
 
@@ -127,6 +130,9 @@ static int riscv_vr_set(struct task_struct *target,
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
+	if (!has_vector())
+		return 0;
+
 	if (!riscv_v_vstate_query(task_pt_regs(target)))
 		return -EINVAL;
 
diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
index be38a93cedae..661c77fdd7f7 100644
--- a/arch/riscv/lib/riscv_v_helpers.c
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -21,7 +21,6 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
 {
 	size_t remain, copied;
 
-	/* skip has_vector() check because it has been done by the asm  */
 	if (!may_use_simd())
 		goto fallback;
 
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
index 7c45f26de4f7..4de37a3a2163 100644
--- a/arch/riscv/lib/uaccess_vector.S
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -5,6 +5,8 @@
 #include <asm/asm-extable.h>
 #include <asm/csr.h>
 
+.option arch, +v
+
 #define pDst a0
 #define pSrc a1
 #define iNum a2
diff --git a/arch/riscv/lib/xor.S b/arch/riscv/lib/xor.S
index b28f2430e52f..9a3e2c19efc9 100644
--- a/arch/riscv/lib/xor.S
+++ b/arch/riscv/lib/xor.S
@@ -6,6 +6,8 @@
 #include <linux/export.h>
 #include <asm/asm.h>
 
+.option arch, +v
+
 SYM_FUNC_START(xor_regs_2_)
 	vsetvli a3, a0, e8, m8, ta, ma
 	vle8.v v0, (a1)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
