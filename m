Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A738C433F7
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:41:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A05206F4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ToAWcJde";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="bTpzvJsu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A05206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FuuFGtM3HPpiNz9IEluEOPgzcLElzdr9GdWMZ10tALU=; b=ToAWcJde6O7s7eQqCnJPBUsu4
	fEMEZeJ7hOU2ZvmQjRkKOZ5DwcNwDLdBOZajZF9JCb0wmgp7SYwuppkC08gxtbQq/qBmEVDKYPeYN
	daZ4KKJbXJxdb6/cqFnHzZjrFLhcDVnwEljwl2ZgXmgqPonC4ekgqwT1ybSsBTtMIVCcp8xYKmycN
	+dwivii+J16cti17g0a8ajv1EHPWxL5rqXlN9AQLrcNdeQfFqRcYlejBDgwgwpMrxTjuYebdPcfY0
	vXBiSwn5MLDDhCxZphhAoZdrwWIJ8t2s+iSoZZBT0vzZBeibxEnit8n/PvCAEsbYTXc0q/hDxtl30
	Cs6SYk9yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwDVK-0007k8-9C; Thu, 16 Jul 2020 23:41:30 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwDV8-0007dh-4I; Thu, 16 Jul 2020 23:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594942878; x=1626478878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/BM/mH4XsaV/6iCpj8IfqSeogZjHIyxg63ZlS/DCX0c=;
 b=bTpzvJsucoElvY64//PAyaHdpdXdm7sFUjxXZm65IAykdUL8Knr0Il6T
 NK73BLBqf7xji5FdQ3vDa/QPhhc0IDtlt2ELHfPPusozOmh6ONTWFDI6z
 qNj4dcAtSwGYcSCA3zHMvNpa297TRN9kiA0/WAufh1Q1vvKbctRvdh6v0
 Uh6X6kceCJcMJFPNJ7so2XbvcLRn4aU0iJWfUAnQ7cTWyQvpKF6CAJ0L+
 Lj/f1b0H+LZM6HE36zUK5y1gj9nch1mrzvVpbzuV/QyyOGVDpmZQQ/p7O
 BjNfaBb0lkyNpyM4qab6a7d1cFMfUO1zxmcVwXsRrPwURn/t2MwFDOfDA Q==;
IronPort-SDR: auCrvU5m9fAH9fJkya78hw7t4k4wBYiYwr2TdjmPgCBDQ8Iz7fCAGR1li/7PQ6CDasHumxfVlP
 YwQY27kLiJZY216iVnBmS8Anmum68pgt5VZpvd7LVx94eQzuz1yzK1L15hJ1IT3Qazstu9d8wF
 YR7ewZNQbFdn00bm3lTx/nK9DxmKy9vxCxn4S4OOR1kU2u65UBL80KmBnzAIxMgiPzYHJ8zJy3
 gaaMsF5ZmApEO0P/RKqQmAPIJMnz6mFSqHJBKXT32vqTNaUqKX9PUD05pS8Zv/Nbd0x0DbY5BL
 2Aw=
X-IronPort-AV: E=Sophos;i="5.75,360,1589212800"; d="scan'208";a="142782171"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2020 07:41:17 +0800
IronPort-SDR: NzaNYKNFds0Qt65xJMx2umuu6osBD99xMljLVTpNmB/b+sbhJPeevSJcl09bhvssQUWRpdJy4I
 x5yqbFdlKnc8YoOmRJk36JWDrk6R1OzXI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 16:29:40 -0700
IronPort-SDR: 1+ar9xAJ3WTp7oABqVmJQP3GTHTux1IitmQm3mpW+sB48jlZAs+hJYRHCo86g6rEcJCK8R9Kxq
 CuVbwebNiq1g==
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.54])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Jul 2020 16:41:16 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v3 3/9] RISC-V: Implement late mapping page table
 allocation functions
Date: Thu, 16 Jul 2020 16:40:58 -0700
Message-Id: <20200716234104.29049-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200716234104.29049-1-atish.patra@wdc.com>
References: <20200716234104.29049-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_194118_441570_0BEECC40 
X-CRM114-Status: GOOD (  14.77  )
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
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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
index 62c90161765f..9f3129c76985 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -209,6 +209,7 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 static bool mmu_enabled;
+static bool late_mapping;
 
 #define MAX_EARLY_MAPPING_SIZE	SZ_128M
 
@@ -233,7 +234,9 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 
 static pte_t *__init get_pte_virt(phys_addr_t pa)
 {
-	if (mmu_enabled) {
+	if (late_mapping)
+		return (pte_t *) __va(pa);
+	else if (mmu_enabled) {
 		clear_fixmap(FIX_PTE);
 		return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
 	} else {
@@ -243,13 +246,19 @@ static pte_t *__init get_pte_virt(phys_addr_t pa)
 
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
@@ -278,7 +287,9 @@ pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
 
 static pmd_t *__init get_pmd_virt(phys_addr_t pa)
 {
-	if (mmu_enabled) {
+	if (late_mapping)
+		return (pmd_t *) __va(pa);
+	else if (mmu_enabled) {
 		clear_fixmap(FIX_PMD);
 		return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
 	} else {
@@ -289,8 +300,13 @@ static pmd_t *__init get_pmd_virt(phys_addr_t pa)
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
@@ -528,6 +544,9 @@ static void __init setup_vm_final(void)
 	/* Move to swapper page table */
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
 	local_flush_tlb_all();
+
+	/* generic page allocation function must be used to setup page table */
+	late_mapping = true;
 }
 #else
 void *dtb_early_va __initdata;
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
