Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C44C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP8iLEi/6SNL025fi1yATfWXZdh4Ltlb9tqWYKW+Eho=; b=g4FdQUfznQG//Z
	TR+DfIATQZHNx/qd4XrgEOh3EqnB9f1MsBWeygqfkvIStsUTWwl81yUvHO8BbyDms83MRo7hGd5hz
	zAcx6Q21vbJMdPVKNVCYjukfK/ekmQHeVHQ3W6YLyad1My5L4WGNOrwjtMgcML5t4kbB7Hm3W/4ob
	A1SKhnb3YMwKx4W6js/PC9ojLk3fV6NNB00r3R9ONKMw4AZk5qVbyY/Dq8shVv3oKOnI5oJo2ac71
	T4+04rA4libvxYF5ZBuO7rDYo3mDZDbGcG9G1rHaVIyeCOF4kVPCXGacINPE4LbNagMR8RVHy+UOy
	KH2gd8cnzimQF/nXhogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdbv-00Epk8-AY; Sat, 16 Jul 2022 08:57:15 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdbr-00Epgl-B6
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 08:57:14 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowAAXOX5afdJiXNlgDg--.22302S4;
	Sat, 16 Jul 2022 16:57:04 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 2/4] mm: support Svnapot in physical page linear-mapping
Date: Sat, 16 Jul 2022 16:56:46 +0800
Message-Id: <20220716085648.4156408-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
References: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXOX5afdJiXNlgDg--.22302S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy8KFyDZFWxtr18Cr45KFg_yoW5Jw4Dpr
	WxCr48uF4UAF1UuFWkAr1rXr9IkanrGa4xGay0kas8C3WfGr1F9w45Ca4Y9FW8Jrs2gayf
	Jr4kZrW5ua43t3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
	C7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x0JUTHqxUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_015711_770054_C296932F 
X-CRM114-Status: GOOD (  11.56  )
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

Svnapot is powerful when a physical region is going to mapped to a
virtual region. Kernel will do like this when mapping all allocable
physical pages to kernel vm space. This patch modify the
create_pte_mapping function used in linear-mapping procedure, so the
kernel can be able to use Svnapot when both address and length of
physical region are 64KB align. Code here will be executed only when
other size huge page is not suitable, so it can be an addition of
PMD_SIZE and PUD_SIZE mapping.

This patch also modifies the best_map_size function to give map_size
many times instead of only once, so a memory region can be mapped by
both PMD_SIZE and 64KB napot size.

It is tested by setting qemu's memory to a 262272k region, and the
kernel can boot successfully.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d466ec670e1f..3c766e7325aa 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -350,8 +350,20 @@ static void __init create_pte_mapping(pte_t *ptep,
 {
 	uintptr_t pte_idx = pte_index(va);
 
-	BUG_ON(sz != PAGE_SIZE);
+#ifdef CONFIG_SVNAPOT
+	pte_t pte;
+	if (has_svnapot() && sz == NAPOT_CONT64KB_SIZE) {
+		do {
+			pte = pfn_pte(PFN_DOWN(pa), prot);
+			ptep[pte_idx] = pte_mknapot(pte, NAPOT_CONT64KB_ORDER);
+			pte_idx++;
+			sz -= PAGE_SIZE;
+		} while (sz > 0);
+		return;
+	}
+#endif
 
+	BUG_ON(sz != PAGE_SIZE);
 	if (pte_none(ptep[pte_idx]))
 		ptep[pte_idx] = pfn_pte(PFN_DOWN(pa), prot);
 }
@@ -649,10 +661,18 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
 	/* Upgrade to PMD_SIZE mappings whenever possible */
-	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
+	base &= PMD_SIZE - 1;
+	if (!base && size >= PMD_SIZE)
+		return PMD_SIZE;
+
+	if (!has_svnapot())
 		return PAGE_SIZE;
 
-	return PMD_SIZE;
+	base &= NAPOT_CONT64KB_SIZE - 1;
+	if (!base && size >= NAPOT_CONT64KB_SIZE)
+		return NAPOT_CONT64KB_SIZE;
+
+	return PAGE_SIZE;
 }
 
 #ifdef CONFIG_XIP_KERNEL
@@ -1087,9 +1107,9 @@ static void __init setup_vm_final(void)
 		if (end >= __pa(PAGE_OFFSET) + memory_limit)
 			end = __pa(PAGE_OFFSET) + memory_limit;
 
-		map_size = best_map_size(start, end - start);
 		for (pa = start; pa < end; pa += map_size) {
 			va = (uintptr_t)__va(pa);
+			map_size = best_map_size(pa, end - pa);
 
 			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
 					   pgprot_from_va(va));
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
