Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A11C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Qovk9wg5cNvrcVVcFSglDiRFBILjt2G2VSmMiSDLJs=; b=Z+jSisLQZu6BES
	krjMtJ1B44+GnkCnv1ElB+RS0Pab3sbMDnO5SvXLOSSoeyUjF5mpvozGT+PMEMpQ5Vdx4zwhXo+gj
	m1ofWibIyfocX48FXSdDQoCIcFM4NKEg5+cCtu2crNhhe2JjWhAscGr/qAmc6oemJksyHxsK6Ewu3
	qUicZvUb8ciWBI2h/uF0g4Y4xynBABsxNV6B2+me+s7O7FrPjWLkF50vPPFr21B0pb/GtMu0WfzoK
	bWf8Tb6LBqN6mgi0Z7u7hvXEgpyMnjGYOGtsXrs/sqYY7fA4PARYdJDE3lxU3NqUXd7V9YZVUIAAI
	Y38SiTBeZxfTQJrVBNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83T-0000000DHTv-1NMC;
	Fri, 28 Jun 2024 09:38:07 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83P-0000000DHQj-2TfV
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:38:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f9ffd24262so2239705ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719567482; x=1720172282; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NJSNW/3/ZU4aZIGnKXL/hakX6fiWOuxkIF7mSD4tC0M=;
        b=YY4nXlOcvQ5w+Q+qzf3al3sYeq/NrOIH6qxf5H538AFw2ElY175OZjT+ruK2fN6LOB
         PNvadXMnbYPLjev0x98KtrzumdmYjtQ7zNEdUE7SSYTnvKjDRd3eTatNd7Euagnyoxe0
         +ToqTyD+LRVG5HtaQg5vOgBzNbtKAxS/kbXxNUsrxDaT86N8w+NAUUuKBYRylXIeM+i/
         uS2n4HQPgeW5VMx+OOJBNmdHG6rmc4TlrQBwBH8GMppGln8XwXgCMiikka5vNoJ1h8wR
         RjpOCafcwJwIjZ1wznt9/8SKEZ/UyIL67NAcdkP5pORtC8r2T3XBdiTvJ18dVl9FrCqI
         6YOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719567482; x=1720172282;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJSNW/3/ZU4aZIGnKXL/hakX6fiWOuxkIF7mSD4tC0M=;
        b=IVMQfxErc8HzcZDDk+RUz/OtLejYuNzZabz2YKZ8J1f/LzRqAVBWxIbBfjYJonn7n8
         M+rQdH9cveouXAeD0+RnC2anuei4bUMRF1Bycoa1aqA9rSNnpTA0aLU+5v+ezPmT51gt
         OHym1M7mkcZq04xQuCD3/eJZ3HXTFteb/0IrftYD+xRY+ER05R2s0EePPdh4iNMsKEc5
         bMlFj1MVGRDWe6c2a9lZNwrT4KPyem+ta4bPdEmmXNyFnCECgGA7c3OTZd/DqjmUozjy
         UHFO0tBypuTPL2jzN1pyjOSpyftwqT/+iRnCp/r1sR1gyqiYamxNi3728VkvujnrJICb
         eG4w==
X-Forwarded-Encrypted: i=1; AJvYcCVv0MGYjTLDBbTvJOehkIku2YVkklv9UR8byYZxHABTG+jTRCUzfZrdse9FN7AkAlwppuDmZCJEebVwUVHjRoVjmm1SSxzJ8j5GgLa4DS5I
X-Gm-Message-State: AOJu0YxUZldJvwgKlAbVGkb5c2whA4BuUBbPn3cK1NHKbj42mOLXJ2ib
	UCVp6MIeqAc/IwIgJIpLJLVakGZE/YMAAAJZoVokmhODTsfKHsZhxHe9koy+78g=
X-Google-Smtp-Source: AGHT+IGAWW4LhafPCB24jR3qgs3piip9ebKtNw6QzOeSExEsUeoGzvS4p5SzrS10lenqlKRQUIiBEA==
X-Received: by 2002:a17:902:ec86:b0:1fa:aa62:8b5c with SMTP id d9443c01a7336-1faaa628da2mr41373805ad.29.1719567482385;
        Fri, 28 Jun 2024 02:38:02 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c6c8dsm11087155ad.26.2024.06.28.02.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:38:02 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Jinyu Tang <tjytimi@163.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Peter Xu <peterx@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v6 1/4] RISC-V: Add Svade and Svadu Extensions Support
Date: Fri, 28 Jun 2024 17:37:05 +0800
Message-Id: <20240628093711.11716-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240628093711.11716-1-yongxuan.wang@sifive.com>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023803_657281_3D01458E 
X-CRM114-Status: GOOD (  18.49  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Svade and Svadu extensions represent two schemes for managing the PTE A/D
bits. When the PTE A/D bits need to be set, Svade extension intdicates
that a related page fault will be raised. In contrast, the Svadu extension
supports hardware updating of PTE A/D bits. Since the Svade extension is
mandatory and the Svadu extension is optional in RVA23 profile, by default
the M-mode firmware will enable the Svadu extension in the menvcfg CSR
when only Svadu is present in DT.

This patch detects Svade and Svadu extensions from DT and adds
arch_has_hw_pte_young() to enable optimization in MGLRU and
__wp_page_copy_user() when we have the PTE A/D bits hardware updating
support.

Co-developed-by: Jinyu Tang <tjytimi@163.com>
Signed-off-by: Jinyu Tang <tjytimi@163.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/csr.h     |  1 +
 arch/riscv/include/asm/hwcap.h   |  2 ++
 arch/riscv/include/asm/pgtable.h | 13 ++++++++++++-
 arch/riscv/kernel/cpufeature.c   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0525ee2d63c7..3d705e28ff85 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -36,6 +36,7 @@ config RISCV
 	select ARCH_HAS_PMEM_API
 	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..524cd4131c71 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -195,6 +195,7 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..35d7aa49785d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,8 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_SVADE             75
+#define RISCV_ISA_EXT_SVADU		76
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index aad8b8ca51f1..ec0cdacd7da0 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -120,6 +120,7 @@
 #include <asm/tlbflush.h>
 #include <linux/mm_types.h>
 #include <asm/compat.h>
+#include <asm/cpufeature.h>
 
 #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
 
@@ -288,7 +289,6 @@ static inline pte_t pud_pte(pud_t pud)
 }
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#include <asm/cpufeature.h>
 
 static __always_inline bool has_svnapot(void)
 {
@@ -624,6 +624,17 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
+/*
+ * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
+ * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
+ * DT.
+ */
+#define arch_has_hw_pte_young arch_has_hw_pte_young
+static inline bool arch_has_hw_pte_young(void)
+{
+	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+}
+
 /*
  * THP functions
  */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5ef48cb20ee1..d31f79bc4daf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -301,6 +301,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
+	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
@@ -554,6 +556,21 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
 		}
 
+		/*
+		 * When neither Svade nor Svadu present in DT, it is technically
+		 * unknown whether the platform uses Svade or Svadu. Supervisor may
+		 * assume Svade to be present and enabled or it can discover based
+		 * on mvendorid, marchid, and mimpid. When both Svade and Svadu present
+		 * in DT, supervisor must assume Svadu turned-off at boot time. To use
+		 * Svadu, supervisor must explicitly enable it using the SBI FWFT extension.
+		 */
+		if (!test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
+		    !test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
+			set_bit(RISCV_ISA_EXT_SVADE, isainfo->isa);
+		else if (test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
+			   test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
+			clear_bit(RISCV_ISA_EXT_SVADU, isainfo->isa);
+
 		/*
 		 * All "okay" hart should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't
@@ -619,6 +636,21 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 		of_node_put(cpu_node);
 
+		/*
+		 * When neither Svade nor Svadu present in DT, it is technically
+		 * unknown whether the platform uses Svade or Svadu. Supervisor may
+		 * assume Svade to be present and enabled or it can discover based
+		 * on mvendorid, marchid, and mimpid. When both Svade and Svadu present
+		 * in DT, supervisor must assume Svadu turned-off at boot time. To use
+		 * Svadu, supervisor must explicitly enable it using the SBI FWFT extension.
+		 */
+		if (!test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
+		    !test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
+			set_bit(RISCV_ISA_EXT_SVADE, isainfo->isa);
+		else if (test_bit(RISCV_ISA_EXT_SVADE, isainfo->isa) &&
+			   test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
+			clear_bit(RISCV_ISA_EXT_SVADU, isainfo->isa);
+
 		/*
 		 * All "okay" harts should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
