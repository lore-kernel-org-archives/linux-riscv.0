Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E10C001B2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 06:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqYrhUSjhiVZT9jc7UexhxyuLzNsfje4UWXdL0ZLdyE=; b=yuBYPhAqCsoYKX
	xAYnQ4C69lE9YTryDd/bUYkxjEy/8BPybZ8RuC7gAaGXakjSyl0WSHpOAkA8LzwQ/2nGe/Xk33yBI
	JUjffkywHA2UzH1w0yLmUDpRtWnT+ZkNrL8B4uVrpbcCUDYBnPD7Y7+i5/YcwcPvov+CSCu2HsvHk
	XUc7dYG0TStbx0UI9dwkPztJtIBMjQCvWzwRnHeu3gwDo/6nKPJ2N7+fvnWrJX+cjSh8AuSnlAGwH
	iRV9c4t36KL6ROEOJHtuUmDsSnDmDIowzZ/DnZxTtC4NiV6tIMNynqIcpggvl+P7A4nzJymrY+ZDD
	/NZXImEHBZGUWT8z02SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p646C-00D8HD-OI; Fri, 16 Dec 2022 06:21:36 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6467-00D8FH-OD
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 06:21:34 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowADn7_dfDpxjjnN3Bw--.24737S5;
	Fri, 16 Dec 2022 14:21:24 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v11 3/3] riscv: mm: support Svnapot in huge vmap
Date: Fri, 16 Dec 2022 14:21:09 +0800
Message-Id: <20221216062109.865573-4-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
References: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn7_dfDpxjjnN3Bw--.24737S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1DZryrWw17KF1xXw4fKrg_yoW5JryDpF
	45Crn7G3yFqryS9rWqyF10van8Xr15uayUJas3JrZ5AwsrJFnxur95Aas0vryUXr95JFy7
	ArZrXFZ3Wwn8AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
	C7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x0JU9Z23UUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAxECDGObzeScXwAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_222132_176037_4AAAA3D9 
X-CRM114-Status: UNSURE (   7.17  )
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
can be tested by test_vmalloc with [1] applied, and probe this
module to run fix_size_alloc_test with use_huge true.

[1]https://lore.kernel.org/all/20221212055657.698420-1-panqinglin2020@iscas.ac.cn/

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index 48da5371f1e9..58d3e447f191 100644
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
+	unsigned long map_size = PAGE_SIZE;
+	unsigned long size, order;
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
+		if (!IS_ALIGNED(size, napot_cont_size(order)))
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
