Return-Path: <SRS0=INRY=K7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3886C47082
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 05:17:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2544861028
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 05:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2544861028
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MYOPWh4osy3H+4CqDoTSP9cUjHk69FLTGgYd5EM+NiI=; b=QFG87hFnkGlxfa
	7ruiayZ7Ifn24SVY/bYvgWY1AoaL+8aJAFSVUl1Hp0MVoNGu891yv4x2TtP8VnaWGxOUCPqun+Ffd
	Pr2bdSt/AwYKHMbJjpF3ImmBq9p/iRwoVG5mO17RnsoHB7/XNw71bHvA/dJtRUehdu9Y93Ry6+iQm
	W0AzKqTJKU0Auid+BHw4EPwLdplbID5jz3hKhQWCsukvTk6Cah4Rt3lNh6EctG8PbNXKRep2l4S3+
	ez1EopQOUCOK0xzZGxttDrQSu6CKFXlG6J0upW5PKaPoIYg3Ahbi9/05TEljB6FqXf14dZWwmOsco
	bt/nmE8DHWOjkF0Jo1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpOfn-00G30I-96; Sat, 05 Jun 2021 05:16:39 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpOfi-00G2y9-OE
 for linux-riscv@lists.infradead.org; Sat, 05 Jun 2021 05:16:36 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FxnmQ5Crtz1BGXl;
 Sat,  5 Jun 2021 13:11:34 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 13:16:21 +0800
Received: from huawei.com (10.175.113.32) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 5 Jun 2021
 13:16:20 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Liu
 Shixin" <liushixin2@huawei.com>
Subject: [PATCH -next] riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
Date: Sat, 5 Jun 2021 13:48:37 +0800
Message-ID: <20210605054838.2017817-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_221635_252254_32D45A67 
X-CRM114-Status: GOOD (  11.85  )
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

This sets the HAVE_ARCH_HUGE_VMAP option. Enable pmd vmap support and
define the required page table functions(Currently, riscv has only
three-level page tables support for 64BIT).

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/vmalloc.h | 12 ++++++++++
 arch/riscv/mm/Makefile           |  1 +
 arch/riscv/mm/pgtable.c          | 40 ++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 arch/riscv/mm/pgtable.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c0bfb2569e9..fb3c48fa96c1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -61,6 +61,7 @@ config RISCV
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
 	select HANDLE_DOMAIN_IRQ
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if MMU && 64BIT
diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index ff9abc00d139..8f17f421f80c 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -1,4 +1,16 @@
 #ifndef _ASM_RISCV_VMALLOC_H
 #define _ASM_RISCV_VMALLOC_H
 
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
+
+#define IOREMAP_MAX_ORDER (PMD_SHIFT)
+
+#define arch_vmap_pmd_supported	arch_vmap_pmd_supported
+static inline bool __init arch_vmap_pmd_supported(pgprot_t prot)
+{
+	return true;
+}
+
+#endif
+
 #endif /* _ASM_RISCV_VMALLOC_H */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef10ea1b..f932b4d69946 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,6 +13,7 @@ obj-y += extable.o
 obj-$(CONFIG_MMU) += fault.o pageattr.o
 obj-y += cacheflush.o
 obj-y += context.o
+obj-y += pgtable.o
 
 ifeq ($(CONFIG_MMU),y)
 obj-$(CONFIG_SMP) += tlbflush.o
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
new file mode 100644
index 000000000000..738dc6f3530f
--- /dev/null
+++ b/arch/riscv/mm/pgtable.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <asm/pgalloc.h>
+#include <linux/gfp.h>
+#include <linux/kernel.h>
+#include <linux/pgtable.h>
+
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
+
+#ifndef __PAGETABLE_PMD_FOLDED
+int pmd_set_huge(pmd_t *pmd, phys_addr_t phys, pgprot_t prot)
+{
+	pmd_t new_pmd = pfn_pmd(__phys_to_pfn(phys), prot);
+
+	set_pmd(pmd, new_pmd);
+	return 1;
+}
+
+int pmd_clear_huge(pmd_t *pmd)
+{
+	if (!pmd_leaf(READ_ONCE(*pmd)))
+		return 0;
+	pmd_clear(pmd);
+	return 1;
+}
+#endif
+
+int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
+{
+	pte_t *pte;
+
+	pte = (pte_t *)pmd_page_vaddr(*pmd);
+	pmd_clear(pmd);
+
+	flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+	pte_free_kernel(NULL, pte);
+	return 1;
+}
+
+#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
