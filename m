Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB0ACCA479
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 08:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDirc5J4bGuNGsvyTFJVL5Qz1LCc7MqATwyxF0qusbs=; b=N5ihdsiaqhIzXT
	6oHxkyMlOpXZ6nQ2nDXI52cCOkbWekccQWwwuDz81bLmDjr1z5WQoeV9JpxQdCZTm5u+2BCoiXUEf
	0X+tuTQcb/Pa4O1hS+c+wAhV+6m6sOGs8R4tIx8MXLBsp/z1BEv9F27ENnoBT8QY60mRSd2EFOMw8
	9BfBMU72zNo6nWc5WPHdyOImBP8RdrqjppsDQru9Of9ITRkE9DNd1VOQiYMS2dboyaTzGuP8+fJ8N
	Z4KizSw0x8dxHUGLul0aUuTBFfeJK3nehSTugzJEd99t1O/yzCDOkOeFwnkMnDTctqc37KBtcED5N
	XoN3glz45uYY0CG9/pYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdby-00EplF-9W; Sat, 16 Jul 2022 08:57:18 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdbr-00Ephv-Hs
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 08:57:15 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowAAXOX5afdJiXNlgDg--.22302S6;
	Sat, 16 Jul 2022 16:57:09 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 4/4] mm: support Svnapot in huge vmap
Date: Sat, 16 Jul 2022 16:56:48 +0800
Message-Id: <20220716085648.4156408-5-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
References: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXOX5afdJiXNlgDg--.22302S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXF45KF4DXrWUCFyDWrWUXFb_yoW5Cw1kpr
	Z3Cr1kJFZ0gFyfCFWIyr10grW5Xan8W3yfK3s5GrykZF47ArWUXr9Yy34jqry8JFWv9FWx
	CFZ7WFy5C3yUJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4
	xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20V
	AGYxC7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x0JUrl1PUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_015711_978165_6F8C94CD 
X-CRM114-Status: UNSURE (   9.02  )
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
index a1fcdd04b12c..35731d627762 100644
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
index 34c4be9de79e..75c2cf1f11bd 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -767,6 +767,43 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
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
index ff9abc00d139..776a88bd4fcf 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -1,4 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _ASM_RISCV_VMALLOC_H
 #define _ASM_RISCV_VMALLOC_H
 
+#include <asm/pgtable.h>
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
+	if (has_svnapot() && is_napot_addr && pfn_align_napot && space_enough
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
