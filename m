Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31A3C25B10
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 01:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccMOj+RzHwAB4UpwUothJJvZ2ioWRFyD69IMK0xczLM=; b=eoa4E5mwp0+3Ws
	xjilUG+tZfvqaUnPLypTLHorDsO+EPFi6obCWJ2R4L7Y+vvLwIbOgLtCjkD4GuqlGLbnAvf84xRf7
	HCY5R40W5/E9N0AdYuNqUTnl/lIkLRcjHSw/4PyLY/jkjeCLBj5uskD7o72Q8zKye+OCcN63nZC92
	KZIvYadExrw8VLVQSejCbBSF/3XBDR+IeB0PN1bzNKkhkm9gkq3yB8sbXHv3dvH7wqUMdlmSz3xjD
	/0Uj2on89Jri8OP40QuOvDc1MkmoJSJVit4B/RbtQk2FpKnEzBqAwF2HWDvFF0LPzWXXuJX/CFIum
	lh0sKbynUiDkVl5xTqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49r2-00000009H44-3s4n;
	Tue, 07 May 2024 01:42:52 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49qz-00000009H0s-3DTI
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 01:42:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2b38f2e95aeso3374566a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 18:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715046164; x=1715650964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WABN/DyVMubZMdulfTheMLTH5TZr96UUGzB/KSHHr2M=;
        b=OWO207AwNpG9C0Lt/JtJVmxqa8yeLR5+we8MrZg+iVgpvDEyv6Mhem+25hm26vLhqK
         IvAz0KrqqoDHYxRbl24rzNiAA50+nVr+E8FM/pE6oEEtAS1AgRHNr5QkwIJ0W4RAB65/
         0at3r6c+8+tRNFtAjxybSo1bYDkV1wy8L6Nzo+ikiJGNXAy/2mYSNiEEQt0rhutnV+C2
         Q7VY1islM8Wp52X82q7tN4Un8omsin4ep2HFpFrQikJ7xnWuCR5ncWfm3xeGRoSpoUEY
         d0xuu2JfEDxvL2bLnt44FWltFeeikm+rLGTdaiKIF1gU6T2P8Of7dcavz9V4zONEEHjb
         1JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715046164; x=1715650964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WABN/DyVMubZMdulfTheMLTH5TZr96UUGzB/KSHHr2M=;
        b=M9UNZVo4+V4winDn6WpJXTGsefGMLRr41uFg6w1sPqtBNcUuesQ+JsXvCGnH84EiSW
         p6tJnKmy4o56ClcHcc+LPWPUGzDl1ZjmlZJt+v6cdCLPm7JdGvDEd5OdystSmiaPLVWd
         YfmAfq1N7DWyl3sgJQrLRKsHjusmbusXLYbUXcWb2d5vSoutq2UTku/kyEV8XRZR5v5D
         WvGrkbnpeUyLMjhxSmIWFYDDWYLfo0Suszlp350yffRAKebarpzKMRpVnpgMuHRF+w01
         KsVonRcV6wvcVsG/M5ePIAn5pVkZDXq4nlBL/qEtJ0BVZ8rlGadQjTUaq918cYwUQ3P/
         uE6A==
X-Gm-Message-State: AOJu0YzP0Lp1zyJzkwKbE2eiXK1hHhrUXWih3sghde1Hdm/3zlbFDk9O
	3GO632Z0JziDz45LkhB4YijfbbhlNeTi6g7fC1/UA7s6XMd2YLz7ichMtOtI1Ck=
X-Google-Smtp-Source: AGHT+IFZ1scUzbuEqN66Ol90xyUVgNHeMyyZi+HIv5KQYsgIR1rnTKs0egQjffSyS6hOuZPi2utSfQ==
X-Received: by 2002:a17:90b:94f:b0:2b0:9544:59e7 with SMTP id 98e67ed59e1d1-2b5bc2c9156mr1704507a91.23.1715046164132;
        Mon, 06 May 2024 18:42:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b001eb3f705ddasm8915311plx.255.2024.05.06.18.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:42:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 06 May 2024 18:40:44 -0700
Subject: [PATCH 3/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT Kconfig
 option
MIME-Version: 1.0
Message-Id: <20240506-compile_kernel_with_extensions-v1-3-5c25c134c097@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715046158; l=4952;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=qAYZSJKQfo6KGBAG143+WCG6TYn1nYEXzCXt3LEyG3U=;
 b=AvAZPB6bKKxnhol7r99rPIU1Pp2DEmoyg2c6T9E0ATto3yAcQP2LL90sm7dlTt4exCfuHixAo
 ntqpY+6BJPTD2LRKfeuz9WcTRYfwxclkgO17m1GznmGptTENuDnO/53
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_184250_271086_DF6246D5 
X-CRM114-Status: GOOD (  19.42  )
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

The previously supported config RISCV_ISA_SVNAPOT has been renamed to
PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT and the config
PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT has been introduced to compile a
kernel that will use svnapot by default. Both of these configs select a
hidden CONFIG_RISCV_ISA_SVNAPOT that can be used to determin if SVNAPOT
is allowed to be used.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig               | 21 +------------------
 arch/riscv/Kconfig.isa           | 44 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  3 ++-
 3 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c2e9eded0a7d..9c3a4347953b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -63,7 +63,7 @@ config RISCV
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if SMP && MMU
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
-	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
+	select ARCH_WANT_GENERAL_HUGETLB if !PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
@@ -484,25 +484,6 @@ config RISCV_ALTERNATIVE_EARLY
 	help
 	  Allows early patching of the kernel for special errata
 
-config RISCV_ISA_SVNAPOT
-	bool "Svnapot extension support for supervisor mode NAPOT pages"
-	depends on 64BIT && MMU
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	  Add support for the Svnapot ISA-extension in the kernel when it
-	  is detected at boot.
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
 config RISCV_ISA_SVPBMT
 	bool "Svpbmt extension support for supervisor mode page-based memory types"
 	depends on 64BIT && MMU
diff --git a/arch/riscv/Kconfig.isa b/arch/riscv/Kconfig.isa
index 0663c98b5b17..37585bcd763e 100644
--- a/arch/riscv/Kconfig.isa
+++ b/arch/riscv/Kconfig.isa
@@ -124,3 +124,47 @@ config RISCV_ISA_V_PREEMPTIVE
 	  This config allows kernel to run SIMD without explicitly disable
 	  preemption. Enabling this config will result in higher memory
 	  consumption due to the allocation of per-task's kernel Vector context.
+
+config RISCV_ISA_SVNAPOT
+	bool
+
+choice
+	prompt "Svnapot extension support for supervisor mode NAPOT pages"
+	default PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT
+	help
+	  This selects the level of support for Svnapot in the Linux Kernel.
+
+	  The Svnapot extension is used to mark contiguous PTEs as a range
+	  of contiguous virtual-to-physical translations for a naturally
+	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
+	  size. When HUGETLBFS is also selected this option unconditionally
+	  allocates some memory for each NAPOT page size supported by the kernel.
+	  When optimizing for low memory consumption and for platforms without
+	  the Svnapot extension, it may be better to prohibit Svnapot.
+
+config PROHIBIT_RISCV_ISA_SVNAPOT
+	bool "Prohibit Svnapot extension"
+	help
+	  Regardless of if the platform supports Svnapot, prohibit the kernel
+	  from using Svnapot.
+
+config PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT
+	bool "Allow Svnapot extension if supported"
+	depends on 64BIT && MMU
+	depends on RISCV_ALTERNATIVE
+	select RISCV_ISA_SVNAPOT
+	help
+	  Add support for the Svnapot ISA-extension in the kernel when it
+	  is detected at boot.
+
+config PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT
+	bool "Emit Svnapot mappings when building Linux"
+	depends on 64BIT && MMU
+	depends on NONPORTABLE
+	select RISCV_ISA_SVNAPOT
+	help
+	  Compile a kernel that assumes that the platform supports Svnapot.
+	  This option produces a kernel that will not run on systems that do
+	  not support Svnapot.
+
+endchoice
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 6afd6bb4882e..432be9691b78 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -289,7 +289,8 @@ static inline pte_t pud_pte(pud_t pud)
 
 static __always_inline bool has_svnapot(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
+	return IS_ENABLED(CONFIG_PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT) ||
+	       riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
 }
 
 static inline unsigned long pte_napot(pte_t pte)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
