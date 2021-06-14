Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F7AC2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 17:52:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4538F6100B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 17:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4538F6100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7mEbxaWDJL8wwFlRqoKHre+iuZwQQmvDEXuy4n75Gk=; b=zLDZsQ9Q0zXqoi
	sSRGVT0601Z/5eVAZn8DlH0uApqLRKoZyZx5uE6zPDmw1a6QqeGdtd+5+ePtKxkkGkSVBqMUi3mqC
	iKY0nEYh7+u/JzRQSft5BH1t0vXGTSak6jt3A7fLkfk27WbzrcIqbnSoGtw31/mA9n9ENs2dOfK+W
	s2PSHyeL3imAd0kr2AgaWLRjCa2CdXpaK4YD+ymmfhVGv4Bs4W3KL270m49Te6OMF/ekenGqHfcoo
	w9eUsFhOLyjmkKWmoeonTe1T1fYRLLcg23NNiNxul+1wE03nzhBsnNEG186VCWlE5T920ROnTEOFW
	1+3i3pE6kPtcADAaGMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsqkr-00FW8F-Ch; Mon, 14 Jun 2021 17:52:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsqkn-00FW0a-77
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 17:52:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6939461075;
 Mon, 14 Jun 2021 17:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623693124;
 bh=4O9PUywfi33smyotT21OjACaW8VxGxmLNJCzm8M7iIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DCyaDxskz3zdIRyjs57ZYA7oZIEVEatKSHHD8rkEcv2egflEcBux4GQ0KBQAgPTkH
 pCS8PN4BFie7cIhQH91vDYY6kSUPXTY7hR0WnPZs08tUcnEjW2C80sr2sR0jK81Paq
 RwQV4If7rEPQ5s4cdfTNICZaDuuGCwxJYoQrcho1u468w0soAgLpGZ1o3SKiL6Iv5Z
 MkUC5E9I4BhfyBn8vZZMoWEAe2Bms4TlY8jvhop7e3kDYHU/gJUWOS39AKeVxBOQyb
 GpwxHH0p8PvE8sEWs/29HDgfnPZVEh4J85d6XJOYEcvsjbNgLvKpBZK4F+3aLgMlXN
 H8KsrTwe5YN5Q==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 tech-virt-mem@lists.riscv.org, Guo Ren <guoren@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [RFC PATCH v3 1/2] riscv: pgtable: Add custom protection_map init
Date: Mon, 14 Jun 2021 17:51:06 +0000
Message-Id: <1623693067-53886-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623693067-53886-1-git-send-email-guoren@kernel.org>
References: <1623693067-53886-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_105205_323860_1B4FABE5 
X-CRM114-Status: GOOD (  11.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Some RISC-V CPU vendors have defined their own PTE attributes to
solve non-coherent DMA bus problems. That makes _P/SXXX definitions
contain global variables which could be initialized at the early
boot stage before setup_vm.

This patch is similar to 316d097c4cd4  (x86/pti: Filter at
vma->vm_page_prot population) which give a choice for arch custom
implementation.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/Kconfig   |  4 ++++
 arch/riscv/mm/init.c | 22 ++++++++++++++++++++++
 mm/mmap.c            |  4 ++++
 3 files changed, 30 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be3d7e2..5327f6f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -29,6 +29,7 @@ config RISCV
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
+	select ARCH_HAS_PROTECTION_MAP_INIT
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
@@ -207,6 +208,9 @@ config GENERIC_HWEIGHT
 config FIX_EARLYCON_MEM
 	def_bool MMU
 
+config ARCH_HAS_PROTECTION_MAP_INIT
+	def_bool y
+
 config PGTABLE_LEVELS
 	int
 	default 3 if 64BIT
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9c4eabb..4b55046 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -554,6 +554,26 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size, bo
 }
 #endif
 
+static void __init setup_protection_map(void)
+{
+	protection_map[0]  = __P000;
+	protection_map[1]  = __P001;
+	protection_map[2]  = __P010;
+	protection_map[3]  = __P011;
+	protection_map[4]  = __P100;
+	protection_map[5]  = __P101;
+	protection_map[6]  = __P110;
+	protection_map[7]  = __P111;
+	protection_map[8]  = __S000;
+	protection_map[9]  = __S001;
+	protection_map[10] = __S010;
+	protection_map[11] = __S011;
+	protection_map[12] = __S100;
+	protection_map[13] = __S101;
+	protection_map[14] = __S110;
+	protection_map[15] = __S111;
+}
+
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
 	uintptr_t __maybe_unused pa;
@@ -562,6 +582,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	pmd_t fix_bmap_spmd, fix_bmap_epmd;
 #endif
 
+	setup_protection_map();
+
 #ifdef CONFIG_XIP_KERNEL
 	xiprom = (uintptr_t)CONFIG_XIP_PHYS_ADDR;
 	xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
diff --git a/mm/mmap.c b/mm/mmap.c
index 0584e54..0a86059 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -100,10 +100,14 @@ static void unmap_region(struct mm_struct *mm,
  *								w: (no) no
  *								x: (yes) yes
  */
+#ifdef CONFIG_ARCH_HAS_PROTECTION_MAP_INIT
+pgprot_t protection_map[16] __ro_after_init;
+#else
 pgprot_t protection_map[16] __ro_after_init = {
 	__P000, __P001, __P010, __P011, __P100, __P101, __P110, __P111,
 	__S000, __S001, __S010, __S011, __S100, __S101, __S110, __S111
 };
+#endif
 
 #ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
 static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
