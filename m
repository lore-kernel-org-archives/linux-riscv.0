Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B9EC10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0abM4E+HsaHHeHf0ysk5eJiN2iu+gzf1YSYgpUzsyFg=; b=RgJNPIc2T4t2Ft
	ujHvSyXkxUCu1EQhgmKj8fOjsYrDL3Hxj/nXjpbFS0SIn3wvFxaUV6c85LGqZqFWIWSSg9UBy6BfO
	kOPg3mkYKJStdsLKWAKy/Gv2zRbu3GqSQHCK49bYE0KGh/eBz7nKqJWYbMH5jbyQIt33zav0gK8tr
	VTS7oVjQniDus9aiX//SMKqoBQJgwA4/g+VKp7kLy4QNpZVh97Bw9wXQn4RCSA7tqlnjvB8LTPDP0
	tRCbd1SSZ5Gww4oLm2twOxFO710hqG0mF+3EUwfEqdzPe85sbrBzivlYqUaz0wu1CE1HjqORfjFbg
	YWncDZhZrLj3DUm2jmDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEl-0000000Dezy-0MF0;
	Wed, 08 May 2024 01:36:51 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEh-0000000Dexo-21KO
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:36:49 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2b38f2e95aeso263506a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715132205; x=1715737005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyAjbp499S4E60gPGPnq8+Il/FcfjFcaiJmSSEoBy08=;
        b=L2JIIij2IPwgM8+kg9llGTnalPMVVrDP01ngt+CYkuUSa/8sWbPazxLgG3tlnX+el0
         K9u0jLQ5FikHUWIMOVy4wcTV9oHROdHGIIALvoKg/X5JvTOAMOZP3xqApaecBU1fkBs4
         EzSpqcSCS5jMloonmtcucHkp8wbcQ1RiFIt9Zba6KAGufwbsMNWcHdLMeT0eZC5Xe5qq
         vZXo2ac4kxXmm+SAkGZZsHFCqpZlyKxutodb8lJq0jxe8nE/FpnUSsVEsRwwXt0YFpHv
         YavRHoOU0L+p846QsVVZMwF0ZGz/k7uCiCEtUCgaddcmG5jDic4i84XXdX/TZlzsUd9Y
         0Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715132205; x=1715737005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyAjbp499S4E60gPGPnq8+Il/FcfjFcaiJmSSEoBy08=;
        b=RxiHgWwlXwyJf2gKqHwjaodEtPLAXYBclwd299am1MFoazRgrF98LGbb9r+S6ZJt89
         lGivNYS2FA5OboInAiQomHSvVK+iKvREpEu2OhHwa/gZFbenXyp9pERg8zeoRQSSZg9v
         q5/vlX7LpLnrRuVXwLswNGsC6YFD9ZwgU5N5jnC7cnj7BZZiY+waF7yyrrUTcJA88tS2
         R+i6GH5/BkAD2gEK+Heql9gL9fK91SDumEp0wTkR4C8ZXGUUJyBGoIlY9SwDV2xJeUEN
         DLlpZoVKK0LKioo8hTzaO5tw+IJaRDHa+nG4vmHeXPLeYD0q4wczmk42s2IOScoioPLR
         6x3g==
X-Gm-Message-State: AOJu0YxCoXdA7P8JOipV2RKEND8+P6T937LbOYIEijXqZyR34IVOlNjf
	QqimHXeChF3MoVfmPUcJJf+gOor+EXiziwux2CrLzXiZMD6/0UY3xh1Pxzt5sdk=
X-Google-Smtp-Source: AGHT+IHwXlXHG/dkLoF/6u+zxBIvilwus9SDgdbrJPGXciSar+3njjYMfgBvflCo8Xus0Cl4AWNAgQ==
X-Received: by 2002:a17:90a:1001:b0:2ad:f3c3:540d with SMTP id 98e67ed59e1d1-2b611aecf9amr1982459a91.21.1715132205449;
        Tue, 07 May 2024 18:36:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm171994a91.10.2024.05.07.18.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:36:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 May 2024 18:36:29 -0700
Subject: [PATCH v2 3/8] riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT
 Kconfig option
MIME-Version: 1.0
Message-Id: <20240507-compile_kernel_with_extensions-v2-3-722c21c328c6@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715132198; l=4526;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=gHdAyzxOSw9+j0qkNaNh5cV4dO8gj7MOepOEM8Ai+S4=;
 b=n798W2bBPAkZ1DxRbCdpbApDgPYqiZBBEqfBDG7kgws2qQjYG55u+NOtwPJkJ2zwoa3y5JfGj
 1/3Q87QUPqFCAhtwHtP01IYlaKmSvNxxzdLntEkAIGs00uPQ9WLzkTG
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_183647_575767_ED969A29 
X-CRM114-Status: GOOD (  19.22  )
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

The existing "RISCV_ISA_SVNAPOT" option is repurposed to be used to by
kernel code to determine if either
PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT or
PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT has been set.

PLATFORM_MAY_SUPPORT_RISCV_ISA_SVNAPOT will check if the hardware
supports Svnapot before using it, while
PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT will assume that the hardware
supports Svnapot.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig               | 19 -----------------
 arch/riscv/Kconfig.isa           | 44 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  3 ++-
 3 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c2e9eded0a7d..3c1960e8cd7c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
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
