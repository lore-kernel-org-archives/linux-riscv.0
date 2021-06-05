Return-Path: <SRS0=INRY=K7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532ADC47082
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 05:19:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E468661028
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 05:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E468661028
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJdaKWrYlyARfldP7p+T6gKvrB+fUXl+QYgsOELxNHE=; b=KvraI1NzLfL/V6
	ldG4c1XaX6j4COPx3s0SoHygoODslub52RAcP7O13INJd7vNZl00sNn5salFZTh/QyTysyFgoZt+f
	NQftGGUK8mAwtnH5P50LwCW6ox48xLY8cNeipoGTkLCY2HJ5ebrQpZuFhiaJvSYWRzjR+sYNRaeXP
	z7VUbLjQlNT69gHATZTKeVrbrF/dVXs4pohlqjYZYOAcEoiRCa2p8ZLnFgY6VYYpGx9XudhLFwGiP
	Pnbs2gncnrNgMxTR2eC9X58KZe239tJPevIeFJ+tJALma9bdauyln5X+HmrbvlJ3z9S75R1zZEBLT
	Mg/rdbVueghBv6TZsNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpOfm-00G2zo-2a; Sat, 05 Jun 2021 05:16:38 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpOfi-00G2yg-PZ
 for linux-riscv@lists.infradead.org; Sat, 05 Jun 2021 05:16:36 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fxnps6XFszYqL6;
 Sat,  5 Jun 2021 13:13:41 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 13:16:28 +0800
Received: from huawei.com (10.175.113.32) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 5 Jun 2021
 13:16:28 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Liu
 Shixin" <liushixin2@huawei.com>
Subject: [PATCH RFC] riscv: Enable pud vmap support for Sv48
Date: Sat, 5 Jun 2021 13:48:38 +0800
Message-ID: <20210605054838.2017817-2-liushixin2@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20210605054838.2017817-1-liushixin2@huawei.com>
References: <20210605054838.2017817-1-liushixin2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_221635_287825_F32E5C9F 
X-CRM114-Status: GOOD (  12.18  )
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

Enable pud vmap support and define the required page table functions
for Sv48.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
As riscv doesn't have Sv48 support currently, I test pud vmap based on Alex's
patch "riscv: Implement sv48 support".

 arch/riscv/include/asm/pgtable-64.h | 10 ++++++++
 arch/riscv/include/asm/vmalloc.h    |  8 +++++-
 arch/riscv/mm/pgtable.c             | 39 +++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index e3b7c5dd6a80..8920321770c7 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -69,6 +69,16 @@ static inline struct page *pud_page(pud_t pud)
 	return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
 }
 
+static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
+{
+	return __pud((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
+}
+
+static inline unsigned long _pud_pfn(pud_t pud)
+{
+	return pud_val(pud) >> _PAGE_PFN_SHIFT;
+}
+
 static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
 {
 	return __pmd((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index 8f17f421f80c..83464895f902 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -3,7 +3,13 @@
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 
-#define IOREMAP_MAX_ORDER (PMD_SHIFT)
+#define IOREMAP_MAX_ORDER (PUD_SHIFT)
+
+#define arch_vmap_pud_supported arch_vmap_pud_supported
+static inline bool __init arch_vmap_pud_supported(pgprot_t prot)
+{
+	return true;
+}
 
 #define arch_vmap_pmd_supported	arch_vmap_pmd_supported
 static inline bool __init arch_vmap_pmd_supported(pgprot_t prot)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 738dc6f3530f..ed13b80424e6 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -7,6 +7,45 @@
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 
+#ifndef __PAGETABLE_PUD_FOLDED
+int pud_set_huge(pud_t *pud, phys_addr_t phys, pgprot_t prot)
+{
+	pud_t new_pud = pfn_pud(__phys_to_pfn(phys), prot);
+
+	set_pud(pud, new_pud);
+	return 1;
+}
+
+int pud_clear_huge(pud_t *pud)
+{
+	if (!pud_leaf(READ_ONCE(*pud)))
+		return 0;
+	pud_clear(pud);
+	return 1;
+}
+#endif
+
+int pud_free_pmd_page(pud_t *pud, unsigned long addr)
+{
+	pmd_t *pmd;
+	pte_t *pte;
+	int i;
+
+	pmd = (pmd_t *)pud_page_vaddr(*pud);
+	pud_clear(pud);
+
+	flush_tlb_kernel_range(addr, addr + PUD_SIZE);
+
+	for (i = 0; i < PTRS_PER_PMD; i++) {
+		if (!pmd_none(pmd[i])) {
+			pte = (pte_t *)pmd_page_vaddr(pmd[i]);
+			pte_free_kernel(NULL, pte);
+		}
+	}
+	pmd_free(NULL, pmd);
+	return 1;
+}
+
 #ifndef __PAGETABLE_PMD_FOLDED
 int pmd_set_huge(pmd_t *pmd, phys_addr_t phys, pgprot_t prot)
 {
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
