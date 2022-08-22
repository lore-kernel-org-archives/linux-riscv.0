Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CDDC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOV31rzt7eDFvYzgftHFiyZy0g9ZmBsEcnC2+fILLOE=; b=ddQ+aer+83Y9QD
	EGqBaCCiSqGWWdyOf2BSryqGA2GlDkhzaLQ4/FUIgnbUhbBRp1VPoh/gGm7LhL1iiAqV3cUQl35+I
	i3Q4VE15a76gxx1umDTd7SjHuAv2G09Uigp5Vu4NjcRJ5QQOfPEzlvja28bywuUnA2Y/hfvU+E+3F
	y/kCl735/CCb8QeaGk3P7DoUGvNBM2vUctzHtgN/mGO3iNQE5tOEplNQKE7w4jm+Y+Ve+2vVJ6Ajg
	pkQSZdJjFV2G/eQXdshb000se+5VbX7hROETBG2cyCHA3oJ49H48mEt4z93+GFMGSZ3bOobwBBwBc
	6nZmN/LeEd4QJnvp9m/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ71p-009UoT-RN; Mon, 22 Aug 2022 12:59:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ71j-009Udk-3V
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 12:59:37 +0000
Received: from localhost.localdomain (unknown [124.16.141.248])
	by APP-01 (Coremail) with SMTP id qwCowAB3vJyofQNjZxe3Cw--.3936S4;
	Mon, 22 Aug 2022 20:59:32 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v3 2/4] mm: support Svnapot in physical page linear-mapping
Date: Mon, 22 Aug 2022 20:59:02 +0800
Message-Id: <20220822125904.3972860-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220822125904.3972860-1-panqinglin2020@iscas.ac.cn>
References: <20220822125904.3972860-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB3vJyofQNjZxe3Cw--.3936S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy8KFyDZFWxtr18Cr45KFg_yoWruw1xpr
	WxCr4kCF45Gr1DWFWvy34UZr15Aas7ua4ay3yUCas8Ar47Gr109wsYka4Y9r1UXF4vqayf
	Aw4kZ3y5u3WUt3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPq14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
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
	0JUTHqxUUUUU=
X-Originating-IP: [124.16.141.248]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQsGDGKY1tvg1QAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_055935_574155_D100F8C3 
X-CRM114-Status: GOOD (  15.29  )
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

Since pging_init is called before riscv_fill_hwcap, this commit does
linear mapping again after dynamic detection if has_svnapot.

It is tested by setting qemu's memory to a 262272k region, and the
kernel can boot successfully.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index cedcf8ea3c76..395fdc922e9e 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -25,6 +25,7 @@ typedef struct {
 
 void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa,
 			       phys_addr_t sz, pgprot_t prot);
+void __init create_linear_mapping(void);
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_MMU_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 95ef6e2bf45c..37e6f7044ef1 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -292,13 +292,16 @@ void __init setup_arch(char **cmdline_p)
 	kasan_init();
 #endif
 
-#ifdef CONFIG_SMP
-	setup_smp();
-#endif
-
 	riscv_fill_hwcap();
 	riscv_init_cbom_blocksize();
 	apply_boot_alternatives();
+
+	if (has_svnapot())
+		create_linear_mapping();
+
+#ifdef CONFIG_SMP
+	setup_smp();
+#endif
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b56a0a75533f..db215fcf4744 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -374,8 +374,20 @@ static void __init create_pte_mapping(pte_t *ptep,
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
@@ -1090,18 +1110,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	pt_ops_set_fixmap();
 }
 
-static void __init setup_vm_final(void)
+void __init create_linear_mapping(void)
 {
 	uintptr_t va, map_size;
 	phys_addr_t pa, start, end;
 	u64 i;
 
-	/* Setup swapper PGD for fixmap */
-	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
-			   __pa_symbol(fixmap_pgd_next),
-			   PGDIR_SIZE, PAGE_TABLE);
-
-	/* Map all memory banks in the linear mapping */
 	for_each_mem_range(i, &start, &end) {
 		if (start >= end)
 			break;
@@ -1111,14 +1125,25 @@ static void __init setup_vm_final(void)
 		if (end >= __pa(PAGE_OFFSET) + memory_limit)
 			end = __pa(PAGE_OFFSET) + memory_limit;
 
-		map_size = best_map_size(start, end - start);
 		for (pa = start; pa < end; pa += map_size) {
 			va = (uintptr_t)__va(pa);
+			map_size = best_map_size(pa, end - pa);
 
 			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
 					   pgprot_from_va(va));
 		}
 	}
+}
+
+static void __init setup_vm_final(void)
+{
+	/* Setup swapper PGD for fixmap */
+	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
+			   __pa_symbol(fixmap_pgd_next),
+			   PGDIR_SIZE, PAGE_TABLE);
+
+	/* Map all memory banks in the linear mapping */
+	create_linear_mapping();
 
 	/* Map the kernel */
 	if (IS_ENABLED(CONFIG_64BIT))
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
