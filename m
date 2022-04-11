Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BFAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsZZI3WFQQRXS7R+t3jdwyAC/M4oAHgOOEZjqICfBNM=; b=AAUgW+rKSoY3k8
	4UfrPelqGeOzSVB5kFQ5kQgf+EegjThBg7AKdej+A6JjChzXtq0nmY2LrlP+XqklG/0GLPwobeqFT
	EpM/GmrGeBF9zVn1cxdOVMPMi88UCe3T5xcKTHvqmoQHL2ZZPAIdbZzEt1r2bkH2PTqyTqzt/4A5D
	wZ6opwwKVVDgUkTAc97qRweYvXAdS6ir5afNltuQNynyw0lJOLvfw/IXpxIg3wkphD4gKxwDPgs2P
	PfSUXOqocjoQaN18LG0f78PvynWkiEelraQFuRPTrh6e/venbc9Ll8juRLFcjWcAi2Yj7SOA1pLXo
	aHNGZ4igdnb/QUvFdY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndupu-009L8g-5n; Mon, 11 Apr 2022 14:16:10 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndupk-009L4N-TI
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 14:16:04 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
 by APP-05 (Coremail) with SMTP id zQCowAAnxaUUOFRil9sMAQ--.30543S4;
 Mon, 11 Apr 2022 22:15:53 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v1 2/4] mm: support Svnapot in physical page linear-mapping
Date: Mon, 11 Apr 2022 22:15:34 +0800
Message-Id: <20220411141536.2461073-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
References: <20220411141536.2461073-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnxaUUOFRil9sMAQ--.30543S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy8KFyDZFWxtr18Cr45KFg_yoW5GFWfpr
 WfCr4ruF4UAF1UuFWkAr15J3sI93ZxGa4xGay0kas5Aw1fGw1093yY9a4YgrW8XrsFgayx
 Ars7ZFW5u3W3X3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
 z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
 kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
 6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
 0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
 c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
 v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
 0JUoWlkUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_071601_355560_C097534E 
X-CRM114-Status: GOOD (  11.27  )
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
index 9535bea8688c..c98a1714c9c8 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -303,7 +303,21 @@ static void __init create_pte_mapping(pte_t *ptep,
 {
 	uintptr_t pte_idx = pte_index(va);
 
+#ifndef CONFIG_SVNAPOT
 	BUG_ON(sz != PAGE_SIZE);
+#else /*CONFIG_SVNAPOT*/
+	pte_t pte;
+	WARN_ON(sz != NAPOT_CONT64KB_SIZE && sz != PAGE_SIZE);
+	if (sz == NAPOT_CONT64KB_SIZE) {
+		do {
+			pte = pfn_pte(PFN_DOWN(pa), prot);
+			ptep[pte_idx] = pte_mknapot(pte, NAPOT_CONT64KB_ORDER);
+			pte_idx++;
+			sz -= PAGE_SIZE;
+		} while (sz > 0);
+		return;
+	}
+#endif /*CONFIG_SVNAPOT*/
 
 	if (pte_none(ptep[pte_idx]))
 		ptep[pte_idx] = pfn_pte(PFN_DOWN(pa), prot);
@@ -602,10 +616,17 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
 	/* Upgrade to PMD_SIZE mappings whenever possible */
-	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
-		return PAGE_SIZE;
+	base &= PMD_SIZE - 1;
+	if (!base && size >= PMD_SIZE)
+		return PMD_SIZE;
+
+#ifdef CONFIG_SVNAPOT
+	base &= NAPOT_CONT64KB_SIZE - 1;
+	if (!base && size >= NAPOT_CONT64KB_SIZE)
+		return NAPOT_CONT64KB_SIZE;
+#endif /*CONFIG_SVNAPOT*/
 
-	return PMD_SIZE;
+	return PAGE_SIZE;
 }
 
 #ifdef CONFIG_XIP_KERNEL
@@ -1038,9 +1059,9 @@ static void __init setup_vm_final(void)
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
