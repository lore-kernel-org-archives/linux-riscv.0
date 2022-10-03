Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85193C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsY27mwS17J3wRFrvuFdogToPcA2eBGGjSZ2WWCZgZQ=; b=vMX4co4x7YXXOs
	QELP2/rcYj/2mPHGt/XLNsof4TXJZma29n6ejw69TXRHwxB2iYXGCsJ4wnjiCXcMbG/hEsE7PdpBe
	BVl+LDLtqQoXuarBO0IEBBwFtO90AeyKXFQ+dkUahN5g4md8mJb33dwe6JnFCpxaomjMP/uTYa7M5
	LdzB7aSoHmgt0iZipyOZmmbmA7kRInuyXCw73zaRX/YUPWlUTDVDGTqQtdApGPnJfoiVLS13N5W5m
	FM+ocnGFDlbUVJGhuEgkEDIyKhkQRVKtiG6i6jMSRkiM9rzm7cTBirdkbMxEsKZELokPGNnVM00Bs
	aUB0ri71rZYW4LTihofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnU-006599-7Q; Mon, 03 Oct 2022 13:47:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofLnQ-006562-7i
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 13:47:51 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowACHzoj05zpjo2sYAw--.64668S4;
	Mon, 03 Oct 2022 21:47:36 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v5 2/4] mm: support Svnapot in physical page linear-mapping
Date: Mon,  3 Oct 2022 21:47:19 +0800
Message-Id: <20221003134721.1772455-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHzoj05zpjo2sYAw--.64668S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy8KFyDZFWxtr18Cr45KFg_yoW5CrWrpr
	WfCr42gF4UJF1UuFWkAr1UXry3CF9xJa47Gay8Kas5A3W8Gr1F9w4Yka4YgFy8Xrs2g3yf
	Zr4kZ3y5ua43JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	nxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
	1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7VUjLL07UUUUU==
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiAwkIDGM6ocpgkgAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_064748_694320_77D7801F 
X-CRM114-Status: GOOD (  12.77  )
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
physical pages to kernel vm space. This commit modifies the
create_pte_mapping function used in linear-mapping procedure, so the
kernel can be able to use Svnapot when both address and length of
physical region are 64KB align. Code here will be executed only when
other size huge page is not suitable, so it can be an addition of
PMD_SIZE and PUD_SIZE mapping.

This commit also modifies the best_map_size function to give map_size
many times instead of only once, so a memory region can be mapped by
both PMD_SIZE and 64KB napot size.

It is tested by setting qemu's memory to a 262272k region, and the
kernel can boot successfully.

Currently, the modified create_pte_mapping will never take use of SVNAPOT,
because this extension is detected in riscv_fill_hwcap and enabled in
apply_boot_alternatives(called from setup_arch) which is called
after setup_vm_final. We will need to support function like
riscv_fill_hwcap_early to fill hardware capabilities more earlier, and
try to enable SVNAPOT more earlier in apply_early_boot_alternatives,
so that we can determine SVNAPOT's presence during setup_vm_final.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b56a0a75533f..76317bb28f29 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -373,9 +373,21 @@ static void __init create_pte_mapping(pte_t *ptep,
 				      phys_addr_t sz, pgprot_t prot)
 {
 	uintptr_t pte_idx = pte_index(va);
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+	pte_t pte;
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
+#endif
 
 	BUG_ON(sz != PAGE_SIZE);
-
 	if (pte_none(ptep[pte_idx]))
 		ptep[pte_idx] = pfn_pte(PFN_DOWN(pa), prot);
 }
@@ -673,10 +685,18 @@ void __init create_pgd_mapping(pgd_t *pgdp,
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
@@ -1111,9 +1131,9 @@ static void __init setup_vm_final(void)
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
