Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB500C64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 09:01:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D41221FF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 09:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5o11jgT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="swFV7DDs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D41221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lwZH2KwrE1KFdtgkJeVsXGM1Uhez/JhnyqnlIw7MGTU=; b=i5o11jgTF6jVJIq5TZo+/hyc2v
	LKpVch95hYZJgd5HeDKcGPoXMDYcmKQ5yro/QJEJRbZzZoZV+yitmgnpUiJSATonlhLrwi/XxIvE5
	bBDN6ptq73+S5iRGBMrMkcgfcAcCunbzRXMSLjkkyoquEDXSZFxBgISFmKfrpkYyYYsbqDYxmMwxT
	ncAb3VG/dYEnanuLE8NGESxBQThH9SvijvoeKj/CRLCWwsnZ/845gF/1PHLzW7ApMhpD6pSiGiGMy
	OtEDD3fGl9uw8A+MJmlgqYjR0D0ZxffgzigMkJEdVEvDsfCWfQlcUxeZEM3t+3bDtHdjzZ1duFJYJ
	99CrCLSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk1Ww-0000QD-Ac; Tue, 01 Dec 2020 09:01:02 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk1Wu-0000Ow-4f
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 09:01:01 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so1645754wmc.2
 for <linux-riscv@lists.infradead.org>; Tue, 01 Dec 2020 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lg7/wzzyNccd4o9M3b2wuJGsFz5jftc3SFIFqCFutik=;
 b=swFV7DDsgM5W8tut0PcZ/Rh5qtlfX4uFO+3ZOYeNIL6SS3n2aJMYBC5MEo66p7jM5N
 pBK1sNp+96f41A9UrRZ15g6AP6YEegGsQVWsF01kmm7m51DgIEgybByC8ucqjhJtCTBD
 DsJr5bUmCS5dUH+S5qbIYoHcRiCNQmko+oidE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lg7/wzzyNccd4o9M3b2wuJGsFz5jftc3SFIFqCFutik=;
 b=PXNLHtpXEBKwNi+DVkq8VJNNdxAkNKC4Q4JT5jEuBIkx4GwENZhzw836qs/1/mRvuz
 XunRPsx2GU7J8P6g/lkN5pjnEqP+UzXigFT1eauLAqCALWWdlsqYH6ehwwY9lwamp/Vm
 0jspPiuF7R3DfYECGBHdPCDUPDmgwmaMWMh2x2vu8Ljhl8kWAX/7rqsi9EqLkVrhmpfy
 8rYTJxNwDaJzyNNXuHyHfT7YBpaAB4gLayqaZNYVWiAGnJR651tUwRTipB8THwamXbP1
 5tcmLHhQUzoVBt6KkMuX1WMcxok6oQL0hzxDWFk+iilLIQ0Y51KDdNcHd9CH56FEHOd2
 BifA==
X-Gm-Message-State: AOAM530giCZeYniOrtLsPUywD7C/RW71woeMWCfGwOTZuejqS1wNmQQ/
 X6xCdMHVlojql8Rt6r3uP5pHr4dU1TYGqb+3
X-Google-Smtp-Source: ABdhPJxyBTo+RPM7zhn4hUP/O5dZCH4wEp4+5eLlqexqIusPhFTF01xWbr6It3pIGZmVIUKQ+9O/7g==
X-Received: by 2002:a1c:b684:: with SMTP id g126mr1592306wmf.135.1606813257116; 
 Tue, 01 Dec 2020 01:00:57 -0800 (PST)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id l8sm1959654wro.46.2020.12.01.01.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 01:00:56 -0800 (PST)
From: vitaly.wool@konsulko.com
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: toggle mmu_enabled flag in a precise manner
Date: Tue,  1 Dec 2020 11:00:24 +0200
Message-Id: <20201201090023.2852-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_040100_371663_FD08B845 
X-CRM114-Status: GOOD (  13.16  )
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
Cc: Bin Meng <bin.meng@windriver.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vitaly Wool <vitaly.wool@konsulko.com>

Cuurently mmu_enabled flag is set to true way later than the actual
MMU enablement takes place. This leads to hard-to-track races in
e. g. SBI earlycon initialization taking wrong path configuring
fixmap.

To fix that, move mmu_enabled toggling to head.S and rename it to
_mmu_enabled to avoid possible name clashes since it's not a static
variable any more.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 arch/riscv/kernel/head.S |  9 +++++++++
 arch/riscv/mm/init.c     | 13 +++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 0a4e81b8dc79..33cd57285be3 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -248,6 +248,10 @@ clear_bss_done:
 	call relocate
 #endif /* CONFIG_MMU */
 
+	la a0, _mmu_enabled
+	li a1, 1
+	sw a1, (a0)
+
 	call setup_trap_vector
 	/* Restore C environment */
 	la tp, init_task
@@ -370,6 +374,11 @@ ENTRY(reset_regs)
 END(reset_regs)
 #endif /* CONFIG_RISCV_M_MODE */
 
+.section ".data"
+	.global _mmu_enabled
+_mmu_enabled:
+	.word 0
+
 __PAGE_ALIGNED_BSS
 	/* Empty zero page */
 	.balign PAGE_SIZE
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 787c75f751a5..4038be635e25 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -211,7 +211,7 @@ EXPORT_SYMBOL(pfn_base);
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
-static bool mmu_enabled;
+extern bool _mmu_enabled;
 
 #define MAX_EARLY_MAPPING_SIZE	SZ_128M
 
@@ -236,7 +236,7 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 
 static pte_t *__init get_pte_virt(phys_addr_t pa)
 {
-	if (mmu_enabled) {
+	if (_mmu_enabled) {
 		clear_fixmap(FIX_PTE);
 		return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
 	} else {
@@ -250,7 +250,7 @@ static phys_addr_t __init alloc_pte(uintptr_t va)
 	 * We only create PMD or PGD early mappings so we
 	 * should never reach here with MMU disabled.
 	 */
-	BUG_ON(!mmu_enabled);
+	BUG_ON(!_mmu_enabled);
 
 	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
 }
@@ -281,7 +281,7 @@ pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
 
 static pmd_t *__init get_pmd_virt(phys_addr_t pa)
 {
-	if (mmu_enabled) {
+	if (_mmu_enabled) {
 		clear_fixmap(FIX_PMD);
 		return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
 	} else {
@@ -293,7 +293,7 @@ static phys_addr_t __init alloc_pmd(uintptr_t va)
 {
 	uintptr_t pmd_num;
 
-	if (mmu_enabled)
+	if (_mmu_enabled)
 		return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
 
 	pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
@@ -467,9 +467,6 @@ static void __init setup_vm_final(void)
 	phys_addr_t pa, start, end;
 	struct memblock_region *reg;
 
-	/* Set mmu_enabled flag */
-	mmu_enabled = true;
-
 	/* Setup swapper PGD for fixmap */
 	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
 			   __pa_symbol(fixmap_pgd_next),
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
