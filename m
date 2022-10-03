Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688C1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Id7AkB7jqMPbo6eImR9X1H84TgHnjKcW6LVDY4yztII=; b=2CH2HOBDnhJtjM
	U/crdVADLjkwMeeHxemrWTQWuWrXvrFESAsckvByMoyiXPbsEnOXeEcWo503cGVx42QzPOfOIvrMn
	JJBe2oU5TJjwRciDwzoFlQWIoRvzWhRqbau70xwB3ZYzOAjL9KrC0336JG6x8KpvYO01kGvWqOTvt
	1GuR3Qad9AreRvD3T3xv1b4XGNKjLWY8PQ2l/d1heTurkADp+7XZKr8u7elX6cRsJPixbz9Rye67Y
	te8k1Ut2C9FJsHUMEi13pbzSIg1Oy+u1AXDIdCZxPRrdluMRiiqe1Vnzx1iPD+HkAyJAE3A9718th
	Nm133YPzeRMbtm7+gSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnV-00659I-Db; Mon, 03 Oct 2022 13:47:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnQ-006560-7d
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 13:47:51 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowACHzoj05zpjo2sYAw--.64668S6;
	Mon, 03 Oct 2022 21:47:38 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v5 4/4] mm: support Svnapot in huge vmap
Date: Mon,  3 Oct 2022 21:47:21 +0800
Message-Id: <20221003134721.1772455-5-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHzoj05zpjo2sYAw--.64668S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGr13uFW5Gw4fXF1kur4UJwb_yoW5CFWxpr
	Z5CrnYkFWDKa4rCFWFyr1FgrW5Zan8W3yfK3s5GrWkZF47JrWkWr95t34Yqr18JFWv9FWx
	CFZ3WFW5C3yDJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
	Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I64
	8v4I1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUUXAwDUUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQEIDGM6o59cKAAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_064748_681444_735D21DE 
X-CRM114-Status: UNSURE (   9.29  )
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
special huge vmap size. This commit selects this option by default and
re-writes the arch_vmap_pte_range_map_size for Svnapot 64KB size.

It can be tested when booting kernel in qemu with pci device, which
will make the kernel to call pci driver using ioremap, and the
re-written function will be called.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3d5ec1391046..571f77b16ee8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -70,6 +70,7 @@ config RISCV
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
 	select HAVE_ARCH_KASAN if MMU && 64BIT
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c3fc3c661699..1740d859331a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -748,6 +748,43 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
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
+static inline void p4d_clear_huge(p4d_t *p4d) { }
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
index ff9abc00d139..ecd1f784299b 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -1,4 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _ASM_RISCV_VMALLOC_H
 #define _ASM_RISCV_VMALLOC_H
 
+#include <linux/pgtable.h>
+
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#define arch_vmap_pte_range_map_size vmap_pte_range_map_size
+static inline unsigned long
+vmap_pte_range_map_size(unsigned long addr, unsigned long end, u64 pfn,
+			unsigned int max_page_shift)
+{
+	if (!has_svnapot())
+		return PAGE_SIZE;
+
+	if (addr & NAPOT_CONT64KB_MASK)
+		return PAGE_SIZE;
+
+	if (pfn & (NAPOT_64KB_PTE_NUM - 1UL))
+		return PAGE_SIZE;
+
+	if ((end - addr) < NAPOT_CONT64KB_SIZE)
+		return PAGE_SIZE;
+
+	if (max_page_shift < NAPOT_CONT64KB_SHIFT)
+		return PAGE_SIZE;
+
+	return NAPOT_CONT64KB_SIZE;
+}
+#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
+
 #endif /* _ASM_RISCV_VMALLOC_H */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
