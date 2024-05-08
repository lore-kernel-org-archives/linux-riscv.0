Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB7AC25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MC/KzMTqPPaOIwRkXemyzdqefLvtJGrr6zMXqZapRB8=; b=RZwpTRLpxNseEa
	o2kov3t77mJ+ARw1R+VbSFeHpjCzceqFCyz1e3IclPqDosUiz37s+hRf9oT48qzxcHg4zmFumbXxC
	fMIT8RgVAJUchB68vOuy4MXQVkH5gZbNu9Aolmu6xXG5lYvzw2I88fO6d1cfdsyxNtOBQL3krM2n9
	0CxCTPAak5sg79pRr2pD8COfG4/dciV8YSfTUjn1yfmImiECNDEOzo0fhRrcZXBWBhm6KPF2uzP+z
	nzob5GybzYy5/5YELUm4DrnvWeCzt1/cIFbLeTBr2MrKWegs3XxaWH2b+KqGezYE8J8WB319K3QvZ
	stSIEH2WchAUSxtyW+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEk-0000000DezN-1S3V;
	Wed, 08 May 2024 01:36:50 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEg-0000000DexL-3S83
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:36:48 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2b346712919so2883965a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715132202; x=1715737002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9yTxfWOtF5boAkE9/9YrcfOh3vEqeNnQBOu8ePUP3A=;
        b=BSmAPgLz8JztHzspuxtwRWhKJRsXF0UL3jmRPbu/tR+Kz8zjcWt7NUQzc2vb/7cUti
         XHtgZ23QHfvT7DAp5K3gKGChQhsXWS/xmqKWGAkE9MnDhySpkTmXmZ0Fpg7/iUg2ZR4R
         Ru4FpBrsNdCtABpjyNK99wt3xPsOFcOXjQxka0bX3E/C5BddBaGsqQHWxGQlUPtAzfry
         ndISu3ouPDhk7aFbEKJ3Xmyjod+vpuCx9d3im+skHu3/GTFjk1Ds+DUlCPjDBfJQQlci
         hlSVS2+WXtrcDIDZumfLa5mMssuPBPKY0Aqhj55R3sj21CKlclCNocbNC64OonTeSjiW
         j8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715132202; x=1715737002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9yTxfWOtF5boAkE9/9YrcfOh3vEqeNnQBOu8ePUP3A=;
        b=MvUQ8PeW3GryeDQUh+n8EuLhFIWegO7LVhlC7XC1druFiUKH+Tdz5fxFavZZCj+OYv
         dVSJlZ/bfEhsgTesQHXT/cP3QPDyVOYb9/Uw/nCzBIiy8YxYlLmmz4cWBgdfvxLm+xI3
         n3Xqq/m5ue2xXio3g6CKtD6alhdCCDutmFmfdavguKxi1k7vjSELfbklUcPtMl5B7vtl
         2UP/gzyCZsqih7d004fqH1vicn4bcysUprdlQlfKhAF6Ky3rffDSBLPhPldqJq1H8nPA
         Pt8XTgs5UMzQev8iMtTX3CG+lysPFsGC7010slfJ7tqDeD8RDQ6ZPZORnr1yhfZU8bEZ
         yPiA==
X-Gm-Message-State: AOJu0Yw3GnkPxOdif2PDvxuqORXym/8DyQgt3JfabuUd/ZEMPpHOFzwN
	LQRv+/UaomjxrCIIBio2l9/hxx4XZn5i+uw/p/Mh4naGQTPjEf8bKmNE9AKYmwA=
X-Google-Smtp-Source: AGHT+IG1y+2SksOJ5/iFT/Z5fKQTo1Zf9NVG2qfabMXNk0GuZoWNzylHq8ETlUv78rTnGDNbEMlqHg==
X-Received: by 2002:a17:90a:fd0c:b0:2ac:23ec:6a57 with SMTP id 98e67ed59e1d1-2b6169db571mr1212359a91.39.1715132201989;
        Tue, 07 May 2024 18:36:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm171994a91.10.2024.05.07.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:36:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 May 2024 18:36:27 -0700
Subject: [PATCH v2 1/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_C Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240507-compile_kernel_with_extensions-v2-1-722c21c328c6@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715132198; l=5960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=j9swSxT8d2fDA4kDGEnqoj8fqzKxNkC+d4MpaFY3y4k=;
 b=7HgrUjF7yNqvZHKoMqkfNlOf3VFDhBOLsI3MIl5rTg6+kqCvct+IvjzRfsRPpeygmRzDbM6zH
 UvjMdMc28OiCM/Bc16GtdVCvODCU5QyePqQ0aq1o9XFlS1lGoN15AbV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_183646_950250_87B39AA9 
X-CRM114-Status: GOOD (  24.27  )
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

The existing "RISCV_ISA_C" option is repurposed to be used to by kernel
code to determine if either PLATFORM_MAY_SUPPORT_RISCV_ISA_C or
PLATFORM_SUPPORTS_RISCV_ISA_C has been set.

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
