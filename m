Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C258C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 08:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlJznBUNy5PRZ7EA80Dc2xXmihHZYUFDcKLe5uDkvV8=; b=frhcGHinFcEw6a
	bYAUUSuQ9nNxVRlsVGrsi2wk7qL1yHT/W0ViAgvxSIcKetxQ6eltIEVlZg2JfyVDyKr7pxt2aMxm0
	0LkzNQU9slIevWZhdBL4egGh/d60Bu8dIXGzBn5p5uwqUxQFHsBBPp6M6thtsYlEMRs4xQUYAaHii
	1FElDhL99zerCeZJZaRLs/cGulgsEsBt4hGlBjlGaJb69SQtwB/mz7TKMGf6n7i0crMBcHdRka1dh
	I3OxqAzs8srC2QxtnJg01uciGcMZhnaRdZ+cziaf0eKq104U5c/v8/Yhj+9k5WkKrhtKUjzKr/I4Y
	R8l97sZx2vxhZafqro7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBo9-0000000GvhO-3Ojp;
	Fri, 12 Jul 2024 08:39:13 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBo5-0000000GvdR-1zzE
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 08:39:10 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3d9e13ef8edso1041105b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1720773548; x=1721378348; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NoYP43ZgdyLcgRKntnfdP6muemOL2yUyMByTZlsLQGs=;
        b=hFWz8iYmNVqn3mMnQ4PsAdXC4TpZl4ev+0+METCI+v7Vg5cFlmu/q9vul5fgJ3u/7I
         yxwSqdynrOjExmhFdCgWpWAmHXznv6wn/ycFvMh6S3KctYJlLXgUiR8ojLNR7fpu7z8e
         nr8oMXZJJ6WrVYwh3aAqorck26M5xFFANzgA8zZVIs9eVgZ3jFF+4QvOeAK3xWa6Z26U
         u0fmVUrLkVK6cqFIffPKsc/1VvJcPXtH+n/8xneM7P7QdNhcMwbGtGCfGAkDEXVwTcCy
         V6+ccRTv+W9L/x7bgtP8jPMATdfh1yD34Wqg9YAxRERdX7tseabBMJ7CN2hSGom9VZMG
         77lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720773548; x=1721378348;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NoYP43ZgdyLcgRKntnfdP6muemOL2yUyMByTZlsLQGs=;
        b=CiEzGXaDar6gIr3clyuEHgU5vE75UuaNYj4cIDJ+oLA7ulzr6NlAmkKe2kv2kHwIIZ
         AvlKipswXyLBHiPtRVAcY8IMBXleDQOemWYuo8HIe/DFP8BU+bC8Cv0T07pyJ1q2uBlA
         lwwNobmw+opNeEtq1lLzIeLd85KfYXqvZVI4rnwBgwqn3M61XMFe+NuP1hh7fbd5c5iV
         7Gjhz3dqKa7DW80wecKdadIk3c4DjOZNzYoXdLdj7IMA5pbPbrSEdAle3OhVNxvugtr9
         oANIgULf0Abp9fwEf6jnkk/rCJm+d9eUaoa/AZacux4BIgmTxtGpOMymOX98e/C/xxA3
         J2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVbvtlb9u2LPhAFoIK46H7IvZrxlCT8U7A02eQ2Y3CXMBKK0nL1MeCOyTiiwljOMpIU3WT7ohEj76IqjIV5GV9IUTJK6Rt86snIQPlo4YKw
X-Gm-Message-State: AOJu0YxUUbxU3NcpT00diX97JJRxsqGsrUQeMxUBV0bVpX7K2hzzsBWO
	cN2CQ8nJtXA3W/kWm1MmIEYGzUKa6cKtS72t32douOp90dQNoaApaRkOZhQQRNc=
X-Google-Smtp-Source: AGHT+IFvHBbmqbAuR3HIaTkO4x6lvhZ0ISwrkTRlVQ6l2auVT/ORD0WyzAIWLSQFoMZSchMNJnl+UQ==
X-Received: by 2002:a05:6808:309b:b0:3da:ae17:50c0 with SMTP id 5614622812f47-3daae17540emr713772b6e.1.1720773548053;
        Fri, 12 Jul 2024 01:39:08 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c7099sm6894194b3a.84.2024.07.12.01.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:39:07 -0700 (PDT)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v7 1/4] RISC-V: Add Svade and Svadu Extensions Support
Date: Fri, 12 Jul 2024 16:38:45 +0800
Message-Id: <20240712083850.4242-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240712083850.4242-1-yongxuan.wang@sifive.com>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_013909_549139_04DCA324 
X-CRM114-Status: GOOD (  18.51  )
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
index 5ef48cb20ee1..b2c3fe945e89 100644
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
+			 test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
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
+			 test_bit(RISCV_ISA_EXT_SVADU, isainfo->isa))
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
