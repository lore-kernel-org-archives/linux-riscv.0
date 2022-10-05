Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53278C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UklnQddks1j8CHbs1tnmjiRqW0FAKxkqNgQPnbZbvGo=; b=0JCivwNoKjTqyi
	Ub3wMAJEQqHBeiJFPOyL+3OWSrC3H2k8cz1aqkoC/2+NU3g/M4J3tqOv7NFLOsdAKcvn0kMqaS749
	U16CSllnPmdShwg7AsbA5QyJ8qNfiSncXcq3RqDjEHN626tvDq7gO99rMn+kdrOeNkeYobTM1oYGF
	EuBpG85DF7jObxVNiF9BmqMXSXQ1UpQHhVaJElz+LrpzYZSkkeihe1U0Sn1IaNfQNjdOV3yMCkMLv
	JrDCpO5xkElg6JIYah1cLza6OTkSfe0qH7VLLoMfF/WCdpQQoNJjuCw1tgJKRtkddNAo5gd6Lwflq
	eVewd07FvzSDngoSpieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2b2-00DnLt-Qa; Wed, 05 Oct 2022 11:29:52 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2ax-00DnK2-73
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 11:29:50 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-05 (Coremail) with SMTP id zQCowADn13Sgaj1jGzAeAw--.15274S4;
	Wed, 05 Oct 2022 19:29:40 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v6 2/4] riscv: mm: support Svnapot in physical page linear-mapping
Date: Wed,  5 Oct 2022 19:29:24 +0800
Message-Id: <20221005112926.3043280-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
References: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn13Sgaj1jGzAeAw--.15274S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy8KFyDZFWxtr18JF18Krg_yoW5Aw48pr
	WxCrW8WF4DJF1UuFWkAr1UAry3Zas3G347Gay8Kas5A3WfGr1F9w45Ca4YgFyxXrsFgayx
	Zr4kZ3y5ua43t37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
	C7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x0JUoWlkUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwAKDGM9Lg5W9AAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_042947_673570_75283335 
X-CRM114-Status: GOOD (  12.78  )
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
physical pages to kernel vm space. Modify the create_pte_mapping
function used in linear-mapping procedure, so the kernel can be able
to use Svnapot when both address and length of physical region are
64KB align. Code here will be executed only when other size huge page
is not suitable, so it can be an addition of PMD_SIZE and PUD_SIZE mapping.

Modify the best_map_size function to give map_size many times instead
of only once, so a memory region can be mapped by both PMD_SIZE and
64KB napot size.

It is tested by setting qemu's memory to a 262272k region, and the
kernel can boot successfully.

Currently, the modified create_pte_mapping will never take use of SVNAPOT,
because this extension is detected and enabled in
riscv_fill_hwcap(called from setup_arch) which is called
after setup_vm_final. We will need to support function like
riscv_fill_hwcap_early to fill hardware capabilities more earlier, and
try to enable SVNAPOT more earlier in it, so that we can determine
SVNAPOT's presence when doing linear-mapping.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b56a0a75533f..e6edc06b4543 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -373,9 +373,23 @@ static void __init create_pte_mapping(pte_t *ptep,
 				      phys_addr_t sz, pgprot_t prot)
 {
 	uintptr_t pte_idx = pte_index(va);
+	pte_t pte;
+
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVNAPOT))
+		goto normal_page;
+
+	if (has_svnapot() && sz == NAPOT_CONT64KB_SIZE) {
+		do {
+			pte = pfn_pte(PFN_DOWN(pa), prot);
+			ptep[pte_idx] = pte_mknapot(pte, NAPOT_CONT64KB_ORDER);
+			pte_idx++;
+			sz -= PAGE_SIZE;
+		} while (sz > 0);
+		return;
+	}
 
+normal_page:
 	BUG_ON(sz != PAGE_SIZE);
-
 	if (pte_none(ptep[pte_idx]))
 		ptep[pte_idx] = pfn_pte(PFN_DOWN(pa), prot);
 }
@@ -673,10 +687,18 @@ void __init create_pgd_mapping(pgd_t *pgdp,
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
@@ -1111,9 +1133,9 @@ static void __init setup_vm_final(void)
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
