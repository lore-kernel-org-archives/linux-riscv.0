Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5209BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:00:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B2C361250
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B2C361250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVst4+sa0Z1+gXTn9G0c1jNOBy0A6kVhZOPuDuoEEtQ=; b=Adr/t2L9JhgTsF
	w+3NwFlTyXnE6TKkLutI2hNlh5eFSOALDB2moeIq63wZZv5Bs2JJDwSCOKGpDc3Uf5tYYRoXQQfz3
	7iGO+7SpNPqhvJVvuEEXv8SIW5T4pDNxkWcKOsUxgOplppbyL39XOQtbEah6046G34BDrUer0tpQp
	BxQ/wZN1TjZpefVA+MEsjynVqKo6sWPcewST/v49DOnwsno17AArPad4M6L2mfxeJ0m4erMZcPAbz
	AI30h1Z1ob24x+RfOyn5ftuLh73M5TFZcacHWtVFuVWgr9No59FvUC1BC8teWNnLzVwsUyPLQsM35
	O82/6Hd/GIfv1JpF5FCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcHwv-00DmuF-38; Mon, 18 Oct 2021 02:00:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcHwr-00DmtJ-Rm
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 02:00:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id g5so10169862plg.1
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 19:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4bw/oHpLpCvL7ZLvo5Y2CIUzRMBpMTubDt9OnDYu2BI=;
 b=eRHI8Ja9om3HAAis0T1hCnuwIiZc3VeYxdxgW6FeOvwk5gqPup6PG51jaUX8xKbne0
 xf/30qwu4vA5fHS1R3cMTtKh6yWuDAfup3B5OWN08jt0g7wXLglqiyJQeWmJ/jTRcH+f
 8qhyG2JC6/zZQ/c5gKgaeX6v1OIlyyXFn/eIqm7YkuneYg3zBKAIofvxj1aM5ZToRDik
 LKP74jL5+s7h9+BfECadxBtchPvGFxnrggC5ujJgetPSoXUSapl9kFnZdvSWBCkilzQJ
 vFeaOBluB0EtM0u5nQNgxVuhweDnXlriYGGuKH+gBkGj4vHDiU3A/C+7GnAkhHMk5FXZ
 rT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4bw/oHpLpCvL7ZLvo5Y2CIUzRMBpMTubDt9OnDYu2BI=;
 b=r7QogSuDtJn4zGgtJ2Tn6U2Snzo5Fseb5NZ38RV+FokzR88048Wqsk3dds6i88Jlfi
 hyrQYxRNh5HlevA5bp0U1zeI2TgBzL3qYViBOvnukwoQDoDrwZlUs7/8TfTtETwTmzRh
 JHkvI/atTjunfQO0qdtRfoWoY52wX6mp2l4ttLfMSiJxck3L1Y3m6wmJchKNG7RekTLi
 CV8rmtC+Q5W2yosHKMx1i62vlzc8QGdMi8/rwl9pt5ZQzkvzWVm7C0lc7lMYUqDY5FoK
 S9smO1wU302QKVi2Jfttq27CpDW/73IyAJku5B4gChA1ICZxwti5FerkAiZG8OeRKC03
 M4/A==
X-Gm-Message-State: AOAM53189qxTE59lVuoVETbIxolQvQw75+Se3lC9Ul4St/JOYx5WKYL0
 qJr4NDcf2vHkJNA68snzvVqch3XT2DPuM93pBiasdA==
X-Google-Smtp-Source: ABdhPJxd/5jn3103Z+Cf6vw4TOj1R8Om7LDI5b/e53K6/UIhgLmXb7QPhjqMExYI23V0S2+F1MprsA==
X-Received: by 2002:a17:90a:f292:: with SMTP id
 fs18mr29276517pjb.229.1634522420830; 
 Sun, 17 Oct 2021 19:00:20 -0700 (PDT)
Received: from localhost.localdomain ([103.135.248.171])
 by smtp.gmail.com with ESMTPSA id v22sm11381975pff.93.2021.10.17.19.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 19:00:20 -0700 (PDT)
From: Qinglin Pan <panqinglin00@gmail.com>
X-Google-Original-From: Qinglin Pan <panqinglin00@163.com>
To: linux-riscv@lists.infradead.org
Cc: xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [RFC PATCH 4/4] mm: support Svnapot in huge vmap
Date: Mon, 18 Oct 2021 09:59:44 +0800
Message-Id: <20211018015944.1313008-4-panqinglin00@163.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018015944.1313008-1-panqinglin00@163.com>
References: <20211018015944.1313008-1-panqinglin00@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_190021_924130_B12A5E91 
X-CRM114-Status: GOOD (  12.98  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

The HAVE_ARCH_HUGE_VMAP option can be used to help implement arch
special huge vmap size. This patch selects this option by default and
re-writes the arch_vmap_pte_range_map_size for Svnapot 64KB size.

It can be tested when booting kernel in qemu with pci device, which
will make the kernel to call pci driver using ioremap, and the
re-written function will be called.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/pgtable.h | 35 ++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/vmalloc.h | 18 ++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0ae025686faf..4a57fd56daf8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ARCH_CLOCKSOURCE_INIT
+  select HAVE_ARCH_HUGE_VMAP
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_DEBUG_VM_PGTABLE
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index adacb877433d..218d95d30bfa 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -642,6 +642,41 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
+{
+	return 0;
+}
+
+static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
+{
+	return 0;
+}
+
+static inline int pud_clear_huge(pud_t *pud)
+{
+	return 0;
+}
+
+static inline int pmd_clear_huge(pmd_t *pmd)
+{
+	return 0;
+}
+
+static inline int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
+{
+	return 0;
+}
+
+static inline int pud_free_pmd_page(pud_t *pud, unsigned long addr)
+{
+	return 0;
+}
+
+static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
+{
+	return 0;
+}
+
 /*
  * Encode and decode a swap entry
  *
diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index ff9abc00d139..fecfa24d6a13 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -1,4 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _ASM_RISCV_VMALLOC_H
 #define _ASM_RISCV_VMALLOC_H
 
+#include <asm/pgtable-bits.h>
+
+#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
+static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
+		u64 pfn, unsigned int max_page_shift)
+{
+	bool is_napot_addr = !(addr & NAPOT_CONT64KB_MASK);
+	bool pfn_align_napot = !(pfn & (NAPOT_64KB_PTE_NUM - 1UL));
+	bool space_enough = ((end - addr) >= NAPOT_CONT64KB_SIZE);
+
+	if (is_napot_addr && pfn_align_napot && space_enough
+			&& max_page_shift >= NAPOT_CONT64KB_SHIFT)
+		return NAPOT_CONT64KB_SIZE;
+
+	return PAGE_SIZE;
+}
+
 #endif /* _ASM_RISCV_VMALLOC_H */
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
