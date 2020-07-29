Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B25C433EA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 23:37:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 960292074B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 23:37:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vMtovmEs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="WGL340Vb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 960292074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RjTVQ9nkzPVS5d5pHty1tkydxmiofj73FzKFRpIZGtc=; b=vMtovmEshHoht8rXXjtV4HeSJ
	7myaXbkLoS1qB/61TLuDAlD3XTheRUoeUWB0cChCjuDkORU+C4mxTmaZfEsQT+JD70Ck+juyDgyjX
	dJkK/Dp+ARn13rLa+oUAZeDE7lLhaEHmUcElzDBVRtfGeSKL8GaaIm75zB3yTejo5qCLcplVLNPiD
	5WQc8jd7/olg5XzDnUJQiwdjbIcLFNlY5xnvDhB9Bawiv60rW1j+rWAOLmQvREpjXZkU1Dm8PlnZp
	aWyrMRuCWgXSe5vg4zVuUTvsHI7HZCR5xVUChjUp+04FO5g3yQXbA5/O/k+3wjIW16tpdsiq+xsmD
	34iNyYdWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0vdF-0004wX-88; Wed, 29 Jul 2020 23:37:09 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0vd6-0004qb-Tl
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 23:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596065820; x=1627601820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DyEurdMM7t8WzBtZdDLIioAaOEsgMahGYE+/JYR6gZQ=;
 b=WGL340VbbP+o/x0v6QJlU0sGxOi2tMwAJpuLJgCOG6TCzdJqdeajxTN4
 1ic0R8zRZVHYyU+A6dZ+2o4trhEtMpAElLp2y/7+6loMzv6pvJRglggB7
 Kc5LiNV3vXDj++TSd/bbT0E31IzCC4mAmmmTLGINx+/07/QI8BTHAMvIw
 x4+83RgXYA/7PX0uTooif13i1d69QVKufVXAODhsuoTpP8Xx13kpWi5ry
 DToeiwGKjSC2cmjj/JuZtSBCxFTwwDIIRqDKOpl4Sz+Zz23QSiVBk4541
 giUC9wJGYwUTU8qwDlzyuYphfsmBcigZK4aicpru4Ot2K9xuTOGdnpgT0 g==;
IronPort-SDR: aP+i5aU/YcFYeZVkWRa/Qp8JKeV6EIO0iZ5te2BInLtxUVuaLv7GAQvjOyWCHaoysp43WouZIw
 VG2TJr+2iydfH5uNBMscdQKwb9QRBCiCEtSbJzpKzL4vHj13YxNR3udmPSXVwcc+uKk5KAL/2o
 6sobb3Wg5bPiO4DIh6r/Xpu41F1nsKIQaJUuYR188S45o8nNDcVpIN9fGsp2an3+GSE8iVMq9L
 Ag+DgyQxDv6NiJCFTEY6yM5jfQFcEClRryUM/0q15EOvdquDdAKv9eZUVWwVpG5m5hix+7BYTa
 gIg=
X-IronPort-AV: E=Sophos;i="5.75,412,1589212800"; d="scan'208";a="253037254"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jul 2020 07:36:53 +0800
IronPort-SDR: 6eSJlw4T5ZkD8IgxIpvCshEjpI4YaeJlT6DQ8IchwLAAtQsL5C3juF5irocVNGDgL452FaXmZZ
 H5JE2VaWa/QqeY5aL0mOmUieZvYQHxu+I=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 16:24:24 -0700
IronPort-SDR: pZDzXPWULnCuyCiOuS3QpLbSXXunBDLbHFoUdamqzzwaKyWJ2yyNVRytnIpaFbvwyr1lpG/qvq
 LT0Yr1745Ljw==
WDCIronportException: Internal
Received: from jpf009043.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.210])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Jul 2020 16:36:54 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v4 3/9] RISC-V: Implement late mapping page table
 allocation functions
Date: Wed, 29 Jul 2020 16:36:29 -0700
Message-Id: <20200729233635.14406-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200729233635.14406-1-atish.patra@wdc.com>
References: <20200729233635.14406-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_193701_102347_2A70455A 
X-CRM114-Status: GOOD (  17.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
 Nick Hu <nickhu@andestech.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Yash Shah <yash.shah@sifive.com>, Ard Biesheuvel <ardb@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, page table setup is done during setup_va_final where fixmap can
be used to create the temporary mappings. The physical frame is allocated
from memblock_alloc_* functions. However, this won't work if page table
mapping needs to be created for a different mm context (i.e. efi mm) at
a later point of time.

Use generic kernel page allocation function & macros for any mapping
after setup_vm_final.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 68c608a0e91f..cba03fec08c1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -212,6 +212,7 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 static bool mmu_enabled;
+static bool late_mapping;
 
 #define MAX_EARLY_MAPPING_SIZE	SZ_128M
 
@@ -236,7 +237,9 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 
 static pte_t *__init get_pte_virt(phys_addr_t pa)
 {
-	if (mmu_enabled) {
+	if (late_mapping)
+		return (pte_t *) __va(pa);
+	else if (mmu_enabled) {
 		clear_fixmap(FIX_PTE);
 		return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
 	} else {
@@ -246,13 +249,19 @@ static pte_t *__init get_pte_virt(phys_addr_t pa)
 
 static phys_addr_t __init alloc_pte(uintptr_t va)
 {
+	unsigned long vaddr;
 	/*
 	 * We only create PMD or PGD early mappings so we
 	 * should never reach here with MMU disabled.
 	 */
 	BUG_ON(!mmu_enabled);
-
-	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+	if (late_mapping) {
+		vaddr = __get_free_page(GFP_KERNEL);
+		if (!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)))
+			BUG();
+		return __pa(vaddr);
+	} else
+		return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
 }
 
 static void __init create_pte_mapping(pte_t *ptep,
@@ -281,7 +290,9 @@ pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
 
 static pmd_t *__init get_pmd_virt(phys_addr_t pa)
 {
-	if (mmu_enabled) {
+	if (late_mapping)
+		return (pmd_t *) __va(pa);
+	else if (mmu_enabled) {
 		clear_fixmap(FIX_PMD);
 		return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
 	} else {
@@ -292,8 +303,13 @@ static pmd_t *__init get_pmd_virt(phys_addr_t pa)
 static phys_addr_t __init alloc_pmd(uintptr_t va)
 {
 	uintptr_t pmd_num;
+	unsigned long vaddr;
 
-	if (mmu_enabled)
+	if (late_mapping) {
+		vaddr = __get_free_page(GFP_KERNEL);
+		BUG_ON(!vaddr);
+		return __pa(vaddr);
+	} else if (mmu_enabled)
 		return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
 
 	pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
@@ -533,6 +549,9 @@ static void __init setup_vm_final(void)
 	/* Move to swapper page table */
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
 	local_flush_tlb_all();
+
+	/* generic page allocation function must be used to setup page table */
+	late_mapping = true;
 }
 #else
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
