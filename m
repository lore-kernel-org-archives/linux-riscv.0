Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F91C43219
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 14:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+KJnB23ObboVSsf+Al2zjSZ7jvrG8iFi4lbkNykhmE=; b=oW/ll2nDkmZhJZ
	kuOWmPymo6d2hn8Sk6WyFAXWDRYtV/DJe9KURmYlHlibAbovZFcTOnKfZus7WiiQE9cStR9H7HnXc
	aU8TKg5ZJbrmwG3abSlPnDv5SlzjHwAc/3duXm09cztQ9/LBjntYqxz+QSF29+fIwYvYYv6oTsTbK
	ysSPGWFi1qA0nrwcvQEyGFZL8BD5WWP21W7YLgffrPZv5TcTMhC3L/dy83GZFkIM7ZoTetSM+tbig
	IH9IKjNT65Ezi2c/0fcDGPNWRqcCK7GVawd1snISPq7Y1go6zE24MWc/KCcuc2plQ4rRlibF+p2xm
	ssR970QSOGeJrgbgWegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndups-009L87-Gy; Mon, 11 Apr 2022 14:16:08 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndupk-009L53-Fr
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 14:16:04 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
 by APP-05 (Coremail) with SMTP id zQCowAAnxaUUOFRil9sMAQ--.30543S6;
 Mon, 11 Apr 2022 22:15:59 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v1 4/4] mm: support Svnapot in huge vmap
Date: Mon, 11 Apr 2022 22:15:36 +0800
Message-Id: <20220411141536.2461073-5-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
References: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnxaUUOFRil9sMAQ--.30543S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXF45KF4DXrWUCFyDWrWUXFb_yoW5Cw1kpr
 Z3CF1kJa90gFyrCFWIyr10grW5Xan8W3yfKrykKryDZF17ArW8Cr9Yy34jqr18JFWv9FWx
 CFZ7WFy5u3yUJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErc
 IFxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
 x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
 v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
 x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
 Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
 yTuYvjfUY4EEUUUUU
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_071600_944144_4E599240 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 490d52228997..c38b5920a0a8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -68,6 +68,7 @@ config RISCV
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
 	select HAVE_ARCH_KASAN if MMU && 64BIT
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f72cdb64f427..510cce799a8a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -680,6 +680,46 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
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
+static inline int p4d_clear_huge(p4d_t *p4d)
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
index ff9abc00d139..2c1a41c5ca8d 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -1,4 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _ASM_RISCV_VMALLOC_H
 #define _ASM_RISCV_VMALLOC_H
 
+#include <asm/pgtable-bits.h>
+
+#ifdef CONFIG_SVNAPOT
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
+#endif /*CONFIG_SVNAPOT*/
+
 #endif /* _ASM_RISCV_VMALLOC_H */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
