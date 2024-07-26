Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32862C3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rj9PJXAzmeDeuqeG4m/g51bB1xLgwG66XP7s+3E8Cg4=; b=AGmzk2DOnVDsSX
	eA4X5suaC586w5D+C/Ce51Frf8rVUHut2QZmxGUzs/Oi2BoCvovRtKljxis/TtO6wQMx2sSq9M3h5
	jA3o16NsPIalFMobMwEkf+U6H8Mc/ch6moFGg1pBT/NWurJfsHj9yAfextp7JtwNjPHMZDyzsHueo
	p9+PQvxOmIJnL9TKZqw3CynJllZADt+kO4f1jaOuBoGNfYBdRgy5nL3rRKkaJRwAHpn/I4xVeQTAT
	JPFxWE6VxRnMIyyMZzMQ+jedgfvFwI4ASyim+Qu2z9pzfZBi9U0vYKH4bUSr8S+zj5Zis23ofd2QS
	UGQBn3esabMb77i4q8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGe6-00000003MzK-3VAa;
	Fri, 26 Jul 2024 08:49:50 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGe3-00000003MwV-0wyp
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 08:49:49 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-389ccd2f0abso6511075ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 01:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721983786; x=1722588586; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lHaLJR8yQLFRkt8rAB7DdlXcc+QGeMQ97xuqoUwdKRk=;
        b=CEOf2mTWx9xiWNYKERH9kW/jnUCB9QwXi/05TnVMHBVwUPYFNUh5l8ceNan5G/v7hU
         9If17w2GYex3rOWoOtMyn0Z4FSc2Qh4zgADQKPuTD/uJ2spTGyG7J1QHDvBArbgzyZ96
         XTgAazk70hKG3MvIoIPZIxsF2dBqRL5G5Rvu+cREiymA+OLOPLM1HhQ43TXQdPQm4/88
         JqGtRCX5oMeszFkbtv0oduVMc7rH4GUSyZm/Fz7fIKIxaUur02qDwLxB+Dhjpxh4mTiD
         jciNE1BPV55bvCh3z8xgoNsC6DMtPjWyudsI5B8ctcMm6pfkVkyJKeZ61+lX7SPrfnLA
         6Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983786; x=1722588586;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHaLJR8yQLFRkt8rAB7DdlXcc+QGeMQ97xuqoUwdKRk=;
        b=tQEUbDCmL7NbkX9J2kjKFpR+b8MaFbQ1mUIgLPwI6iRrIrmmxfIEUM//28/z/7AKyv
         UP95KaciLARqFoysgEPNPzTITtsX5IXR9pDnveVs1IhLu0Q8lgKQYYSafiiVAhLTEp9U
         E5xII6CASWAx8mMCOjgYAgXxLcWpkfdQ5ylzHqqTOO5GGv1hDd1h52TJIsFKWndJ/Hqx
         69s7172RwY8XE+cWzo+YNE+7OABtvJUJK2r0lHQBwotUbZZrgwgOL0R1zPQ7ovKn+yCL
         E6PL1akSrzpYDut3B0/4m5s9cMvmREp/Nspc5sJul6fd33l2+mnyWsB7zFJAzCDA+dVQ
         HA6w==
X-Forwarded-Encrypted: i=1; AJvYcCUdk2ngWB3ynJMpmpxBsPylVTwJc7//CwbvMVUxu5UR2DLEkUlMAUCNghkdQuBsxuMiy6rEvxrX1uh+m8O0WZx+pN1igkfGJTln+g7phO0L
X-Gm-Message-State: AOJu0YzO4O4j/DnaxSKZIMpdA1LOVdRQP26dcEDAC8ukBywMU2k7XphB
	W4bHQnpowiU3MNVYhePWfQJx3t9D4lnc+GbgwWhOdB75VAIaFH0sjLrdncX33hg=
X-Google-Smtp-Source: AGHT+IEpIF/ScJ6b02sius+AyE85eDMTtR0ejoZVPHfsbpYUV9YjFuBW2ZygOt0+5bnn6XeVCylZ0w==
X-Received: by 2002:a05:6e02:1b0e:b0:397:d9a9:8770 with SMTP id e9e14a558f8ab-39a2400a147mr59383125ab.23.1721983786004;
        Fri, 26 Jul 2024 01:49:46 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f816db18sm2049645a12.33.2024.07.26.01.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:49:45 -0700 (PDT)
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
	Andy Chiu <andy.chiu@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Peter Xu <peterx@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v8 1/5] RISC-V: Add Svade and Svadu Extensions Support
Date: Fri, 26 Jul 2024 16:49:26 +0800
Message-Id: <20240726084931.28924-2-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_014947_316480_352D3624 
X-CRM114-Status: GOOD (  16.70  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/csr.h     |  1 +
 arch/riscv/include/asm/hwcap.h   |  2 ++
 arch/riscv/include/asm/pgtable.h | 13 ++++++++++++-
 arch/riscv/kernel/cpufeature.c   | 12 ++++++++++++
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3ceec2ca84fa..014e512854a6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -29,6 +29,7 @@ config RISCV
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
+	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_KERNEL_FPU_SUPPORT if 64BIT && FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
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
index b18b202ca141..b0435fda09ae 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,8 @@
 #define RISCV_ISA_EXT_ZCF		84
 #define RISCV_ISA_EXT_ZCMOP		85
 #define RISCV_ISA_EXT_ZAWRS		86
+#define RISCV_ISA_EXT_SVADE		87
+#define RISCV_ISA_EXT_SVADU		88
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 089f3c9f56a3..6f1a0534f319 100644
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
@@ -649,6 +649,17 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
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
index 0366dc3baf33..2a9cdfae21c6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -156,6 +156,16 @@ static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
+				    const unsigned long *isa_bitmap)
+{
+	/* SVADE has already been detected, use SVADE only */
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const unsigned int riscv_zk_bundled_exts[] = {
 	RISCV_ISA_EXT_ZBKB,
 	RISCV_ISA_EXT_ZBKC,
@@ -402,6 +412,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
+	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
