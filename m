Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B445C25B5F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 01:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cL72r1COQoj+4YMilbgl+wWpxA2cgRJ6X10hvjezyaM=; b=KMu8Qm6sAJ1TeL
	aI8KJ6guw9JJf7KvSXpzGGv8qUxObD0okPAyhrUgUJfCJnMG9V0s2KTEr/+OqPJS/o/a4wiZR0UME
	Vsyf/ZObSYmIffu3jZKTeG8IudfRvvSojE5JVCqeuUcwLU6Sn8AQ4PxihD7V3NKFqZ2bB3SbmXzHJ
	YOYJsAdwnBuRzz9FCluvqS6pFAbdta/Ev/v22+fIdWi0ah8DyMdbY+rmLJLBWRXQ+uCAdzdSYwSA3
	OqHW7XtZpcQwqtwNM7pJfd7uOtF/fLqkLKZJsG1AOx03/7nXbxuJi6XEh1QWnXlg1sjbrW0/UNJmx
	tiREqhFCss7i8oVt7LWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49r7-00000009H6k-3oZA;
	Tue, 07 May 2024 01:42:57 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49qz-00000009H0h-3In7
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 01:42:53 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2b537cd50f9so1335331a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 18:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715046161; x=1715650961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gF8qGaJ1aJzNvgYvOCba3skq1TjRznxQuNnEFWLH5Zw=;
        b=NSRDT9uucBn3xDhOrNHID40yFgiGK4M5JQR069vf5bQUzIk7HjoL3u4PacdShtNBO/
         Apdh/FOg5yw/pO9IO5PFSoAx859ubcfnl6SPapEIC40GwODDonLpqS/RNzldlmmFDrl1
         ecYv3jM/6wDS4F3Ph7BmeMaWW1jpnHKpThkUAiqnLGiAnpBtHkvBsXFVqCN8eFRz89iS
         71T/hknoSfc7WqFl6TUOl02UVV3g25Kr0I5YPfVU7XN21jUJ0V1gqSu9/71Ri1SRUvad
         /MZB7u5Zu5QDqSlKqCIqw1E2UVNh251Sm7dV1k0Fn8e9eAd5P88yK+Clbup7zpM1Xt8d
         MRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715046161; x=1715650961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF8qGaJ1aJzNvgYvOCba3skq1TjRznxQuNnEFWLH5Zw=;
        b=r/H8xYdnEYiM7G4vvCP9I2mkM6mPCMLc9CL2eHo6RhZzTAq3QUCBF5N84xetVjfPuw
         er/KkUIl1j3EP5D8JcGw7MOsdlyYL1IcUXiKQPS1C+5EKoX/QV9lvSxIo8VLRzL1z9Ys
         UFtJJPaSACYEsB8/SohwHtqDy/KtREvjKfr7wu880tlHqvuuUCbLvU/CDQM3hV0Ji0UF
         2pP8iAZ/jCzrpF4tjYIhmH/PSUc46VbPfq7Hu+DULYfEJQmhCtSHbDkKXw5zx6C4GTd7
         +9IfTyr4A1DDvZ0gOYhkkj7Kh6EGs8NMVEdQ/N27Du6f2hToSKTd7/Ii4JQqt/QllyXB
         Pd1g==
X-Gm-Message-State: AOJu0Yx5pRrz0C2k5ZUSKDrQ8Epp/qCVBBvxUNVNV3hPd5SSB/n1GGDb
	ZUvS0/ph+KIAhMC4yAfw2M+x9ZPws+5nVrwQGPxJLKk9C07FusB8AKw+phie+nU=
X-Google-Smtp-Source: AGHT+IGpzHifmpGiAxjTcocbBFK+V7WiJThQ/SJeU/Miqz5kdTjCFTH4LwBRLMK2doOE8zu4aQNSJA==
X-Received: by 2002:a17:90b:350e:b0:2b2:7855:da05 with SMTP id ls14-20020a17090b350e00b002b27855da05mr10460825pjb.26.1715046161112;
        Mon, 06 May 2024 18:42:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b001eb3f705ddasm8915311plx.255.2024.05.06.18.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:42:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 06 May 2024 18:40:42 -0700
Subject: [PATCH 1/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_C Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240506-compile_kernel_with_extensions-v1-1-5c25c134c097@rivosinc.com>
References: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
In-Reply-To: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715046158; l=5775;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=9E+2LlRyJf3rtGlOBhbopLxrTNkU6Xw7Fp6ra7sa6aw=;
 b=k/qKiLIMvmJ90rd1YTXngnEJRwKO8kGBQZf+APAC5CZ1sloS8A25+YytARmKTTvmNP+IkLjri
 cazABYZHlYsDSt+hvd03k1xMjto5tOexlRaM5aKXwgjWVr3MEZAkbVA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_184250_285833_6A0612DD 
X-CRM114-Status: GOOD (  23.24  )
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

Introduce a "Kernel ISA" menu and migrate the compressed instruction
support options into a new file Kconfig.isa. Add a new option
"PLATFORM_MAY_SUPPORT_RISCV_ISA_C" that can be used to conditionally
emit C extensions if the hardware supports it.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig                 | 19 +++++++-----------
 arch/riscv/Kconfig.isa             | 41 ++++++++++++++++++++++++++++++++++++++
 arch/riscv/Makefile                |  4 ++--
 arch/riscv/kernel/probes/uprobes.c |  2 +-
 arch/riscv/net/bpf_jit.h           |  4 +++-
 5 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c8bdfd33abf4..c2a4f5364707 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -369,6 +369,12 @@ config ARCH_RV64I
 
 endchoice
 
+menu "Kernel ISA"
+
+source "arch/riscv/Kconfig.isa"
+
+endmenu
+
 # We must be able to map all physical memory into the kernel, but the compiler
 # is still a bit more efficient when generating code if it's setup in a manner
 # such that it can only map 2GiB of memory.
@@ -478,17 +484,6 @@ config RISCV_ALTERNATIVE_EARLY
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
 config RISCV_ISA_SVNAPOT
 	bool "Svnapot extension support for supervisor mode NAPOT pages"
 	depends on 64BIT && MMU
@@ -937,6 +932,7 @@ config EFI
 	bool "UEFI runtime support"
 	depends on OF && !XIP_KERNEL
 	depends on MMU
+	depends on PLATFORM_SUPPORTS_RISCV_ISA_C
 	default y
 	select ARCH_SUPPORTS_ACPI if 64BIT
 	select EFI_GENERIC_STUB
@@ -944,7 +940,6 @@ config EFI
 	select EFI_RUNTIME_WRAPPERS
 	select EFI_STUB
 	select LIBFDT
-	select RISCV_ISA_C
 	select UCS2_STRING
 	help
 	  This option provides support for runtime services provided
diff --git a/arch/riscv/Kconfig.isa b/arch/riscv/Kconfig.isa
new file mode 100644
index 000000000000..08b7af5aabb0
--- /dev/null
+++ b/arch/riscv/Kconfig.isa
@@ -0,0 +1,41 @@
+config RISCV_ISA_C
+	bool
+
+choice
+	prompt "Compressed instruction support"
+	default PLATFORM_SUPPORTS_RISCV_ISA_C
+	help
+	  This selects the level of support for compressed instructions to be
+	  built into the Linux Kernel. This does not impact whether compressed
+	  instructions are allowed to be emitted by user-space code.
+
+config PROHIBIT_RISCV_ISA_C
+	bool "Prohibit compressed instructions"
+	depends on NONPORTABLE
+	help
+	  Regardless of if the platform supports compressed instructions,
+	  prohibit the kernel from emitting compressed instructions.
+
+config PLATFORM_MAY_SUPPORT_RISCV_ISA_C
+	bool "Allow compressed instructions sequences if supported"
+	depends on FPU
+	depends on NONPORTABLE
+	select RISCV_ISA_C
+	help
+          Only allow compressed instructions to be emitted if "C" is present in
+          the device tree or ACPI table. No compressed instructions will be
+          emitted if the platform does not support them.
+
+config PLATFORM_SUPPORTS_RISCV_ISA_C
+	bool "Emit compressed instructions when building Linux"
+	depends on FPU
+	select RISCV_ISA_C
+	help
+	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in compressed instructions in the
+	  Linux binary. This option produces a kernel that will not run on
+	  systems that do not support compressed instructions.
+
+	  If you don't know what to do here, say Y.
+
+endchoice
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 5b3115a19852..e1be36004097 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -14,7 +14,7 @@ endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux += --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-ifeq ($(CONFIG_RISCV_ISA_C),y)
+ifeq ($(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C),y)
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=4
 else
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=2
@@ -65,7 +65,7 @@ endif
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
-riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index 4b3dc8beaf77..a468689a6f6d 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -11,7 +11,7 @@
 
 bool is_swbp_insn(uprobe_opcode_t *insn)
 {
-#ifdef CONFIG_RISCV_ISA_C
+#ifdef CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C
 	return (*insn & 0xffff) == UPROBE_SWBP_INSN;
 #else
 	return *insn == UPROBE_SWBP_INSN;
diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index f4b6b3b9edda..259294bdbc3a 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -15,7 +15,9 @@
 
 static inline bool rvc_enabled(void)
 {
-	return IS_ENABLED(CONFIG_RISCV_ISA_C);
+	return IS_ENABLED(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_C) ||
+		(IS_ENABLED(CONFIG_PLATFORM_MAY_SUPPORT_RISCV_ISA_C) &&
+			riscv_has_extension_likely(RISCV_ISA_EXT_c));
 }
 
 static inline bool rvzbb_enabled(void)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
