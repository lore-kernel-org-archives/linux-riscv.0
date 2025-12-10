Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3473FD3C922
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTwA/QzNWe4E4w7A/BctoHZRw02G1HZFX8CoOTP0f/k=; b=cnzTbWO3Qhwt0F
	ODY6VbYMGpHEGeddi3lT82Zl8A9j0qdYO+LPeTrxR3h+ecYHUjGImZh92rtLlbb5gJPI9rHzsCl5x
	i8kH74RqYKmHn6PAtu4GW1m6TczunY8uLVuN18DKQCLGeQpr+rwh2iZQicm5g0GMAXaYp8TS3Cihl
	icucha56G2jZt/ZmBPWD3X+Dnzaz0GJJQZbTZNbW5IeqrR4Pb5B/xtbqiXqQSjg33YLoL3wpCL6No
	YT0D1wd1XwSA+5ZG+n79B4leu1hNrxnl7Dvrumt1Y5GaZkBFwCLaZJ5DySgA3CVWEGbq/B98K9a+U
	t6hjM7szjnqSmA0JV0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpC-0000000Fc01-34bM;
	Wed, 10 Dec 2025 16:13:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMp9-0000000FbyU-1fTv
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:13:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-295548467c7so311225ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383234; x=1765988034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51DFgo/Sn6cCMQY3vQktWeBBmrHLY8knbR7GvYVwiu4=;
        b=NrORIO3FsUh3vqaK6rGoDkodUI8oKDvoj2iv0K2X/EDNJNoRcbS2bY87WgccApzCBT
         QkQPIunyA5rCWYmIGovZRsmDKRJLWs4BdSzUMOteb3l430BasNzbfs8cJxnk6AzOWJtw
         HuJX7EhGhXEi2+kMJ9eDx/rc1LCR5UfSi9Mz7QIzKBDgK8qpkTk1Ky4IwDt3PJEsOMIe
         +1elt8LHkWt+60QILaL4BNHTadJJ+UF/Cls5T5qrIPhTxZm9ATcRwVyqRw1jq0bkFO5N
         H6gsGsOvWk+SrKo6viUzvWSz7JDLfWsfdUScymRytA/hF7Fu/bWcd5vYaCjzBpLhX+n2
         xosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383234; x=1765988034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51DFgo/Sn6cCMQY3vQktWeBBmrHLY8knbR7GvYVwiu4=;
        b=FysmAbOgbmUH8Q7iL3EWQ8jNX5SJUmWOnvoyZFXG7Bg4ajAh6ayliP7idaKHTuvSzr
         nSYmm+J/tE0bzrf5Q5PDUsBd1XZ8NyZbfTe9LxNsHUcZ4VKjg7OGYwNjF5IY87oW3IaO
         ef2+8Skejy6OZjU9g4PaYUl5ESfTpomvywH/n/YJV4mzCsEaYSmrgukM/DS3LIVwcUKj
         fNAYWeIWwHXw4BjnCqPJm7j3UCMJY23UvAbunZEGpsSYDINVintnI8tglnr+6Ci8Wg1L
         E7q6+AEs1dKsTgfU3YahR3ALEzuda4zk8ifsmqv70h/Aij+hyf8SaczPk53lg9bInPZj
         4Vmw==
X-Gm-Message-State: AOJu0YyENKye8OO+Gt0yU8m4H9NgP5HJKPP1sSqvildY7j8LvgrN/wrO
	JD1FOOODJGHaHDCtVuvcx/wFBi04/XWX30E25+iIkNuVw3WgUuXLR7o5NzA0ii4clMg=
X-Gm-Gg: ASbGnctWRTZ96aAi6MzMLLIAvEVpgZbVsClu05yJzikfmc4KJsEJm7KQTSRarJNBsE6
	Rhbe+9/oyqs8BefU/E7RBLC4dqCFrvg3+y+S+3K+vKERUIMmPkZz4rRjKPeSGKE/JS9vkic7p9Z
	Ybg9jEiekoQzX2y9+AypmfZxh7d5pOD6myFDS0LMTcCw7g9KtjLupxAIIwl+Ust3LP6a+voPucf
	rMixziJW2EvDHxzgIfDQp4Lk5h3+4bmyASaux2y/CSWQbOX2V3x7OVzoXoziKymIvI7NPH3IqgG
	rhREKBeDHa5uQ5P88+7AJ2i8gLDoPL9ffOIgHzPOUlkxbAoU68ruXFnWphUNts3eK22zLBZOe7v
	nH+JG+wQHbp9Nec83DSF4JFIQl1udZ5refi+XKiAeqZT+HDLPNf+iDJDIsHml/OnMk9HigNpSYl
	zoQ7/KD8VFO23JJeLiDJ8BEfuNbITCuS7no019UH4CpaDmxdfSwpSRPLAMi9E2Q/1n9502PsgWq
	E8a9wmVx64U
X-Google-Smtp-Source: AGHT+IFGIzE7mgSIBnTTbapzoVh71RwjeX+cgDo+5S3/TrMmMj0xPyy5KA1hHEQZTLUad3OGeIz2gA==
X-Received: by 2002:a05:7022:40c:b0:119:e569:fbb3 with SMTP id a92af1059eb24-11f296c4fabmr2687918c88.34.1765383234095;
        Wed, 10 Dec 2025 08:13:54 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:13:53 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:39 -0800
Subject: [PATCH RFC 02/10] riscv: kconfig: Reorganize extensions
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-2-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=25843;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=6kdwEBivu3J/tQ+c4q+1xArl8gxFukdS+lE2W9b0Sa8=;
 b=70fU2e5YGdMgLe7488IT4Exyl8vGb5qHBzDtAPU0zUI2ZFzkboYP47dj8/Mij4dBYUH25bp23
 LK46KddT9B0DXIq2+youyrywKKO1iIVM5Auq2HgXzgZ9kAPC/xlgQq2
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081355_514048_EAACEDFF 
X-CRM114-Status: GOOD (  25.57  )
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

Move extension management out of the main riscv kconfig and into an
extension specific one. Since there are so many extensions in riscv,
listed them in a separate file can help to keep the kconfig files
organized.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig            | 335 +---------------------------------------
 arch/riscv/Kconfig.extensions | 345 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 346 insertions(+), 334 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fadec20b87a8..22a6fed0b216 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -552,340 +552,7 @@ config RISCV_ALTERNATIVE_EARLY
 	help
 	  Allows early patching of the kernel for special errata
 
-config RISCV_ISA_C
-	bool "Emit compressed instructions when building Linux"
-	default y
-	help
-	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
-	  when building Linux, which results in compressed instructions in the
-	  Linux binary. This option produces a kernel that will not run on
-	  systems that do not support compressed instructions.
-
-	  If you don't know what to do here, say Y.
-
-config RISCV_ISA_SUPM
-	bool "Supm extension for userspace pointer masking"
-	depends on 64BIT
-	default y
-	help
-	  Add support for pointer masking in userspace (Supm) when the
-	  underlying hardware extension (Smnpm or Ssnpm) is detected at boot.
-
-	  If this option is disabled, userspace will be unable to use
-	  the prctl(PR_{SET,GET}_TAGGED_ADDR_CTRL) API.
-
-config RISCV_ISA_SVNAPOT
-	bool "Svnapot extension support for supervisor mode NAPOT pages"
-	depends on 64BIT && MMU
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	  Enable support for the Svnapot ISA-extension when it is detected
-	  at boot.
-
-	  The Svnapot extension is used to mark contiguous PTEs as a range
-	  of contiguous virtual-to-physical translations for a naturally
-	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
-	  size. When HUGETLBFS is also selected this option unconditionally
-	  allocates some memory for each NAPOT page size supported by the kernel.
-	  When optimizing for low memory consumption and for platforms without
-	  the Svnapot extension, it may be better to say N here.
-
-	  If you don't know what to do here, say Y.
-
-config RISCV_ISA_SVPBMT
-	bool "Svpbmt extension support for supervisor mode page-based memory types"
-	depends on 64BIT && MMU
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
-	   page-based memory types) in the kernel when it is detected at boot.
-
-	   The memory type for a page contains a combination of attributes
-	   that indicate the cacheability, idempotency, and ordering
-	   properties for access to that page.
-
-	   The Svpbmt extension is only available on 64-bit cpus.
-
-	   If you don't know what to do here, say Y.
-
-config TOOLCHAIN_HAS_V
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
-	depends on LD_IS_LLD || LD_VERSION >= 23800
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
-	  Functions which invoke long running SIMD thus must yield the core's
-	  vector unit to prevent blocking other tasks for too long.
-
-	  This config allows the kernel to run SIMD without explicitly disabling
-	  preemption. Enabling this config will result in higher memory consumption
-	  due to the allocation of per-task's kernel Vector context.
-
-config RISCV_ISA_ZAWRS
-	bool "Zawrs extension support for more efficient busy waiting"
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	  The Zawrs extension defines instructions to be used in polling loops
-	  which allow a hart to enter a low-power state or to trap to the
-	  hypervisor while waiting on a store to a memory location. Enable the
-	  use of these instructions in the kernel when the Zawrs extension is
-	  detected at boot.
-
-config TOOLCHAIN_HAS_ZABHA
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
-	depends on AS_HAS_OPTION_ARCH
-
-config RISCV_ISA_ZABHA
-	bool "Zabha extension support for atomic byte/halfword operations"
-	depends on TOOLCHAIN_HAS_ZABHA
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	  Enable the use of the Zabha ISA-extension to implement kernel
-	  byte/halfword atomic memory operations when it is detected at boot.
-
-	  If you don't know what to do here, say Y.
-
-config TOOLCHAIN_HAS_ZACAS
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
-	depends on AS_HAS_OPTION_ARCH
-
-config RISCV_ISA_ZACAS
-	bool "Zacas extension support for atomic CAS"
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	  Enable the use of the Zacas ISA-extension to implement kernel atomic
-	  cmpxchg operations when it is detected at boot.
-
-	  If you don't know what to do here, say Y.
-
-config TOOLCHAIN_HAS_ZBB
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
-	depends on LD_IS_LLD || LD_VERSION >= 23900
-	depends on AS_HAS_OPTION_ARCH
-
-# This symbol indicates that the toolchain supports all v1.0 vector crypto
-# extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
-# binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
-config TOOLCHAIN_HAS_VECTOR_CRYPTO
-	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
-	depends on AS_HAS_OPTION_ARCH
-
-config TOOLCHAIN_HAS_ZBA
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
-	depends on LD_IS_LLD || LD_VERSION >= 23900
-	depends on AS_HAS_OPTION_ARCH
-
-config RISCV_ISA_ZBA
-	bool "Zba extension support for bit manipulation instructions"
-	default y
-	help
-	   Add support for enabling optimisations in the kernel when the Zba
-	   extension is detected at boot.
-
-	   The Zba extension provides instructions to accelerate the generation
-	   of addresses that index into arrays of basic data types.
-
-	   If you don't know what to do here, say Y.
-
-config RISCV_ISA_ZBB
-	bool "Zbb extension support for bit manipulation instructions"
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	   Add support for enabling optimisations in the kernel when the
-	   Zbb extension is detected at boot. Some optimisations may
-	   additionally depend on toolchain support for Zbb.
-
-	   The Zbb extension provides instructions to accelerate a number
-	   of bit-specific operations (count bit population, sign extending,
-	   bitrotation, etc).
-
-	   If you don't know what to do here, say Y.
-
-config TOOLCHAIN_HAS_ZBC
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
-	depends on LD_IS_LLD || LD_VERSION >= 23900
-	depends on AS_HAS_OPTION_ARCH
-
-config RISCV_ISA_ZBC
-	bool "Zbc extension support for carry-less multiplication instructions"
-	depends on TOOLCHAIN_HAS_ZBC
-	depends on MMU
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	   Adds support to dynamically detect the presence of the Zbc
-	   extension (carry-less multiplication) and enable its usage.
-
-	   The Zbc extension could accelerate CRC (cyclic redundancy check)
-	   calculations.
-
-	   If you don't know what to do here, say Y.
-
-config TOOLCHAIN_HAS_ZBKB
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbkb)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
-	depends on LD_IS_LLD || LD_VERSION >= 23900
-	depends on AS_HAS_OPTION_ARCH
-
-config RISCV_ISA_ZBKB
-	bool "Zbkb extension support for bit manipulation instructions"
-	depends on TOOLCHAIN_HAS_ZBKB
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	   Adds support to dynamically detect the presence of the ZBKB
-	   extension (bit manipulation for cryptography) and enable its usage.
-
-	   The Zbkb extension provides instructions to accelerate a number
-	   of common cryptography operations (pack, zip, etc).
-
-	   If you don't know what to do here, say Y.
-
-config RISCV_ISA_ZICBOM
-	bool "Zicbom extension support for non-coherent DMA operation"
-	depends on MMU
-	depends on RISCV_ALTERNATIVE
-	default y
-	select RISCV_DMA_NONCOHERENT
-	select DMA_DIRECT_REMAP
-	help
-	   Add support for the Zicbom extension (Cache Block Management
-	   Operations) and enable its use in the kernel when it is detected
-	   at boot.
-
-	   The Zicbom extension can be used to handle for example
-	   non-coherent DMA support on devices that need it.
-
-	   If you don't know what to do here, say Y.
-
-config RISCV_ISA_ZICBOZ
-	bool "Zicboz extension support for faster zeroing of memory"
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	   Enable the use of the Zicboz extension (cbo.zero instruction)
-	   in the kernel when it is detected at boot.
-
-	   The Zicboz extension is used for faster zeroing of memory.
-
-	   If you don't know what to do here, say Y.
-
-config RISCV_ISA_ZICBOP
-	bool "Zicbop extension support for cache block prefetch"
-	depends on MMU
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	  Adds support to dynamically detect the presence of the ZICBOP
-	  extension (Cache Block Prefetch Operations) and enable its
-	  usage.
-
-	  The Zicbop extension can be used to prefetch cache blocks for
-	  read/write fetch.
-
-	  If you don't know what to do here, say Y.
-
-config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
-	def_bool y
-	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
-	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd
-	depends on AS_IS_GNU && AS_VERSION >= 23600
-	help
-	  Binutils-2.38 and GCC-12.1.0 bumped the default ISA spec to the newer
-	  20191213 version, which moves some instructions from the I extension to
-	  the Zicsr and Zifencei extensions. This requires explicitly specifying
-	  Zicsr and Zifencei when binutils >= 2.38 or GCC >= 12.1.0. Zicsr
-	  and Zifencei are supported in binutils from version 2.36 onwards.
-	  To make life easier, and avoid forcing toolchains that default to a
-	  newer ISA spec to version 2.2, relax the check to binutils >= 2.36.
-	  For clang < 17 or GCC < 11.3.0, for which this is not possible or need
-	  special treatment, this is dealt with in TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
-
-config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
-	def_bool y
-	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
-	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
-	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d29f5d6ab513c52fd872f532c492e35ae9fd6671
-	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC && GCC_VERSION < 110300)
-	help
-	  Certain versions of clang and GCC do not support zicsr and zifencei via
-	  -march. This option causes an older ISA spec compatible with these older
-	  versions of clang and GCC to be passed to GAS, which has the same result
-	  as passing zicsr and zifencei to -march.
-
-config FPU
-	bool "FPU support"
-	default y
-	help
-	  Add support for floating point operations when an FPU is detected at
-	  boot. When this option is disabled, neither the kernel nor userspace
-	  may use the floating point unit.
-
-	  If you don't know what to do here, say Y.
+source "arch/riscv/Kconfig.extensions"
 
 config IRQ_STACKS
 	bool "Independent irq & softirq stacks" if EXPERT
diff --git a/arch/riscv/Kconfig.extensions b/arch/riscv/Kconfig.extensions
new file mode 100644
index 000000000000..c9433209117d
--- /dev/null
+++ b/arch/riscv/Kconfig.extensions
@@ -0,0 +1,345 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# For a description of the syntax of this configuration file,
+# see Documentation/kbuild/kconfig-language.rst.
+#
+
+
+# Base extensions
+
+config RISCV_ISA_C
+	bool "Emit compressed instructions when building Linux"
+	default y
+	help
+	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in compressed instructions in the
+	  Linux binary.
+
+	  If you don't know what to do here, say Y.
+
+config FPU
+	bool "FPU support"
+	default y
+	help
+	  Say N here if you want to disable all floating-point related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
+# Standard extensions
+
+config RISCV_ISA_SUPM
+	bool "Supm extension for userspace pointer masking"
+	depends on 64BIT
+	default y
+	help
+	  Add support for pointer masking in userspace (Supm) when the
+	  underlying hardware extension (Smnpm or Ssnpm) is detected at boot.
+
+	  If this option is disabled, userspace will be unable to use
+	  the prctl(PR_{SET,GET}_TAGGED_ADDR_CTRL) API.
+
+config RISCV_ISA_SVNAPOT
+	bool "Svnapot extension support for supervisor mode NAPOT pages"
+	depends on 64BIT && MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
+	  time and enable its usage.
+
+	  The Svnapot extension is used to mark contiguous PTEs as a range
+	  of contiguous virtual-to-physical translations for a naturally
+	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
+	  size. When HUGETLBFS is also selected this option unconditionally
+	  allocates some memory for each NAPOT page size supported by the kernel.
+	  When optimizing for low memory consumption and for platforms without
+	  the Svnapot extension, it may be better to say N here.
+
+	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_SVPBMT
+	bool "Svpbmt extension support for supervisor mode page-based memory types"
+	depends on 64BIT && MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the Svpbmt
+	   ISA-extension (Supervisor-mode: page-based memory types) and
+	   enable its usage.
+
+	   The memory type for a page contains a combination of attributes
+	   that indicate the cacheability, idempotency, and ordering
+	   properties for access to that page.
+
+	   The Svpbmt extension is only available on 64-bit cpus.
+
+	   If you don't know what to do here, say Y.
+
+config RISCV_ISA_ZAWRS
+	bool "Zawrs extension support for more efficient busy waiting"
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  The Zawrs extension defines instructions to be used in polling loops
+	  which allow a hart to enter a low-power state or to trap to the
+	  hypervisor while waiting on a store to a memory location. Enable the
+	  use of these instructions in the kernel when the Zawrs extension is
+	  detected at boot.
+
+config TOOLCHAIN_HAS_ZABHA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZABHA
+	bool "Zabha extension support for atomic byte/halfword operations"
+	depends on TOOLCHAIN_HAS_ZABHA
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Enable the use of the Zabha ISA-extension to implement kernel
+	  byte/halfword atomic memory operations when it is detected at boot.
+
+	  If you don't know what to do here, say Y.
+
+config TOOLCHAIN_HAS_ZACAS
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZACAS
+	bool "Zacas extension support for atomic CAS"
+	depends on TOOLCHAIN_HAS_ZACAS
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Enable the use of the Zacas ISA-extension to implement kernel atomic
+	  cmpxchg operations when it is detected at boot.
+
+	  If you don't know what to do here, say Y.
+
+config TOOLCHAIN_HAS_ZBA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
+	depends on LD_IS_LLD || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBA
+	bool "Zba extension support for bit manipulation instructions"
+	default y
+	help
+	   Add support for enabling optimisations in the kernel when the Zba
+	   extension is detected at boot.
+
+	   The Zba extension provides instructions to accelerate the generation
+	   of addresses that index into arrays of basic data types.
+
+	   If you don't know what to do here, say Y.
+
+config TOOLCHAIN_HAS_ZBB
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBB
+	bool "Zbb extension support for bit manipulation instructions"
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBB
+	   extension (basic bit manipulation) and enable its usage.
+
+	   The Zbb extension provides instructions to accelerate a number
+	   of bit-specific operations (count bit population, sign extending,
+	   bitrotation, etc).
+
+	   If you don't know what to do here, say Y.
+
+config TOOLCHAIN_HAS_ZBC
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBC
+	bool "Zbc extension support for carry-less multiplication instructions"
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the Zbc
+	   extension (carry-less multiplication) and enable its usage.
+
+	   The Zbc extension could accelerate CRC (cyclic redundancy check)
+	   calculations.
+
+	   If you don't know what to do here, say Y.
+
+config TOOLCHAIN_HAS_ZBKB
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbkb)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
+	depends on LD_IS_LLD || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_ZBKB
+	tristate "Zbkb extension support for bit manipulation instructions"
+	depends on RISCV_ALTERNATIVE
+	depends on NONPORTABLE || m
+	default m
+	help
+	   Adds support to dynamically detect the presence of the ZBKB
+	   extension (bit manipulation for cryptography) and enable its usage.
+
+	   The Zbkb extension provides instructions to accelerate a number
+	   of common cryptography operations (pack, zip, etc).
+
+	   If you don't know what to do here, say Y.
+
+config RISCV_ISA_ZICBOM
+	bool "Zicbom extension support for non-coherent DMA operation"
+	depends on MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	select RISCV_DMA_NONCOHERENT
+	select DMA_DIRECT_REMAP
+	help
+	   Adds support to dynamically detect the presence of the ZICBOM
+	   extension (Cache Block Management Operations) and enable its
+	   usage.
+
+	   The Zicbom extension can be used to handle for example
+	   non-coherent DMA support on devices that need it.
+
+	   If you don't know what to do here, say Y.
+
+config RISCV_ISA_ZICBOZ
+	bool "Zicboz extension support for faster zeroing of memory"
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Enable the use of the Zicboz extension (cbo.zero instruction)
+	   when available.
+
+	   The Zicboz extension is used for faster zeroing of memory.
+
+	   If you don't know what to do here, say Y.
+
+config RISCV_ISA_ZICBOP
+	bool "Zicbop extension support for cache block prefetch"
+	depends on MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Adds support to dynamically detect the presence of the ZICBOP
+	  extension (Cache Block Prefetch Operations) and enable its
+	  usage.
+
+	  The Zicbop extension can be used to prefetch cache blocks for
+	  read/write fetch.
+
+	  If you don't know what to do here, say Y.
+
+## Vector options
+
+config TOOLCHAIN_HAS_V
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
+	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_V
+	bool "VECTOR extension support"
+	depends on TOOLCHAIN_HAS_V
+	depends on FPU
+	select DYNAMIC_SIGFRAME
+	default y
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
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
+
+# This symbol indicates that the toolchain supports all v1.0 vector crypto
+# extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
+# binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
+config TOOLCHAIN_HAS_VECTOR_CRYPTO
+	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
+	depends on AS_HAS_OPTION_ARCH
+
+# Legacy options
+
+config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
+	def_bool y
+	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd
+	depends on AS_IS_GNU && AS_VERSION >= 23600
+	help
+	  Binutils-2.38 and GCC-12.1.0 bumped the default ISA spec to the newer
+	  20191213 version, which moves some instructions from the I extension to
+	  the Zicsr and Zifencei extensions. This requires explicitly specifying
+	  Zicsr and Zifencei when binutils >= 2.38 or GCC >= 12.1.0. Zicsr
+	  and Zifencei are supported in binutils from version 2.36 onwards.
+	  To make life easier, and avoid forcing toolchains that default to a
+	  newer ISA spec to version 2.2, relax the check to binutils >= 2.36.
+	  For clang < 17 or GCC < 11.3.0, for which this is not possible or need
+	  special treatment, this is dealt with in TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
+
+config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
+	def_bool y
+	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
+	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d29f5d6ab513c52fd872f532c492e35ae9fd6671
+	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC && GCC_VERSION < 110300)
+	help
+	  Certain versions of clang and GCC do not support zicsr and zifencei via
+	  -march. This option causes an older ISA spec compatible with these older
+	  versions of clang and GCC to be passed to GAS, which has the same result
+	  as passing zicsr and zifencei to -march.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
