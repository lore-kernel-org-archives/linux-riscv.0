Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DDFC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YAnjQS7tNb8Dbb+IX5EnhgYYZxrdeLeKV5gzSpLU94=; b=JUcPugWRF1Gt7J
	L/4PxpDD29j1kLMnaedIJx7l1nw1X2DHzZXrL8ebqZhKWUS6xcWy4pei4Oqkr49m33m2rI91hA3+O
	Drfr8Hrt312yp0rl0aoLqHtP15K7tCnQou15IB/Wu0W2SA/AronWM0BubRQMeNI8aXUzpdEKwIs4m
	Gmg1Rq3p6ZzHGlIOT3KmPZ8ERas8b7j6kj5N5Jq5PI2NPsdSyT9Ol7GyAQ+6flkwlYrhUDsk0mNTX
	pDUjuGSjLa6jPdAMe6ptJPxJigOJGhxIGpe7oMoB/eSIZL0O8dXmirsRs+C8FtLf/2JedQc2lzeKG
	Oc3a6tlqPrUORQEYDs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owLwf-00DEtC-J6; Sat, 19 Nov 2022 11:23:37 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owLwY-00DEr8-DS
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 11:23:33 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowAC3Oe2jvHhjlVkXAA--.8243S5;
	Sat, 19 Nov 2022 19:23:20 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v7 3/3] riscv: mm: support Svnapot in huge vmap
Date: Sat, 19 Nov 2022 19:22:42 +0800
Message-Id: <20221119112242.3593646-4-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221119112242.3593646-1-panqinglin2020@iscas.ac.cn>
References: <20221119112242.3593646-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3Oe2jvHhjlVkXAA--.8243S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1DZryrWw17KF1xXw4fKrg_yoW8tryDpF
	4UCrn7G39YqryS9rWjyr1Fq3Z8Jr15uay5Ja4fJrZ5Aw47JF13ur95Aas0vryUXrZ5JFy7
	ArZxXrZ7uwn8AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
	z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
	0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	0JU9Z23UUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwIPDGN4L+zteAAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_032330_866389_D01C3710 
X-CRM114-Status: UNSURE (   8.42  )
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

As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
for Svnapot to support huge vmap about napot size.

It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
can be tested by changing test_vmalloc module to use vmalloc_huge in it,
and probe this module to run tests.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index 48da5371f1e9..99b89ab445e2 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -17,6 +17,65 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 	return true;
 }
 
-#endif
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#include <linux/pgtable.h>
 
+#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
+static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
+							 u64 pfn, unsigned int max_page_shift)
+{
+	unsigned long size, order;
+	unsigned long map_size = PAGE_SIZE;
+
+	if (!has_svnapot())
+		return map_size;
+
+	for_each_napot_order_rev(order) {
+		if (napot_cont_shift(order) > max_page_shift)
+			continue;
+
+		size = napot_cont_size(order);
+		if (end - addr < size)
+			continue;
+
+		if (!IS_ALIGNED(addr, size))
+			continue;
+
+		if (!IS_ALIGNED(PFN_PHYS(pfn), size))
+			continue;
+
+		map_size = size;
+		break;
+	}
+
+	return map_size;
+}
+
+#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
+static inline int arch_vmap_pte_supported_shift(unsigned long size)
+{
+	int shift = PAGE_SHIFT;
+	unsigned long order;
+
+	if (!has_svnapot())
+		return shift;
+
+	WARN_ON_ONCE(size >= PMD_SIZE);
+
+	for_each_napot_order_rev(order) {
+		if (napot_cont_size(order) > size)
+			continue;
+
+		if (size & napot_cont_mask(order))
+			continue;
+
+		shift = napot_cont_shift(order);
+		break;
+	}
+
+	return shift;
+}
+
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
+#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
 #endif /* _ASM_RISCV_VMALLOC_H */
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
