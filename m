Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF8FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34B9A61242
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34B9A61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8f+fMLnHoZGrWLl5fFiSwy/VkgsUBIZyC7hDO85DCd8=; b=GOgsOg6WeTv6t0
	mt2ZQjurXCRWpwHirRSoncKQGZ6xmIrnTZtSOUFyd4Q/XijBI9RND1QNH+aS2kY7Z7HOUpQD/yNDd
	Sg+rnaug7ZdPH/Dek8hmoQLW4QtNk3XKAdo6f8Heyog/ozp7yBHQ1lT9juYEInrhHwmEKCK6wKcPN
	EDI6K5HnKMXtbbg/Hd20m6CBg0xOCy6MbVkr0W2S7pKrW5DFej3txmaxzN/5B010qbtZizalIUy4X
	E7OwU8GdR2WGVroIseATD/GzLirlgxTbXH1Tt444AUAxzN0nlETz7dkCvHuYNTr+VCmD61+AqPEQQ
	Z2enUHxeTKv3CGN61FAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOzD3-00Eaz4-Sd; Sat, 11 Sep 2021 09:22:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOzD1-00Eayc-Dh
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 09:22:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40ECD611BF;
 Sat, 11 Sep 2021 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631352123;
 bh=7Ax4o1vKbEZYAeFnU/yXR6vjKKbs51X8vdBOX4udaks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H1eYjwPrJAAdJcoV7ELOLZ717MkzYZfSxmKlyfxlo5DCmlm5+g8pdvw87vPgV0VHo
 8z/7Nr7nj/SzGfWnFgJLxxvGtCjLbRjcX0opd/ciclDR8gcBXQXHwqVRGA6CyCV/u1
 nTd2m5Tgvs1pVVVAovDgu0EZHPdbsLT28HtFjfAH+1FLbeDxGRgjq5Qpww3IfPGyto
 N/XRt7cESC5JynTyrMjNdtQdTSSPJI5C0lIWkV/1J8AMbzLwV69TRENXLIPtPvooUf
 3uYBlxIrKN6dMZK91c0d0ViLz8boE6Ml/jUP35v1NnNxq1DvUhBfyf/bvO9xHdH2jk
 SvUk6QNUVpCyA==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [RFC PATCH V4 1/6] riscv: pgtable: Add custom protection_map init
Date: Sat, 11 Sep 2021 17:21:34 +0800
Message-Id: <20210911092139.79607-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911092139.79607-1-guoren@kernel.org>
References: <20210911092139.79607-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_022203_541832_867B4B47 
X-CRM114-Status: GOOD (  11.30  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Some RISC-V CPU vendors have defined their own PTE attributes to
solve non-coherent DMA bus problems. That makes _P/SXXX definitions
contain global variables which could be initialized at the early
boot stage before setup_vm. The patch prevents compile errors.

This patch is similar to 316d097c4cd4  (x86/pti: Filter at
vma->vm_page_prot population) which give a choice for arch custom
implementation.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/Kconfig   |  4 ++++
 arch/riscv/mm/init.c | 22 ++++++++++++++++++++++
 mm/mmap.c            |  4 ++++
 3 files changed, 30 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4f7b70ae7c31..3ab3730bee92 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,6 +25,7 @@ config RISCV
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MMIOWB
+	select ARCH_HAS_PROTECTION_MAP_INIT
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
@@ -201,6 +202,9 @@ config GENERIC_HWEIGHT
 config FIX_EARLYCON_MEM
 	def_bool MMU
 
+config ARCH_HAS_PROTECTION_MAP_INIT
+	def_bool y
+
 config PGTABLE_LEVELS
 	int
 	default 3 if 64BIT
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7cb4f391d106..975c7322d6c4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -550,6 +550,26 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
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
@@ -558,6 +578,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	pmd_t fix_bmap_spmd, fix_bmap_epmd;
 #endif
 
+	setup_protection_map();
+
 	kernel_map.virt_addr = KERNEL_LINK_ADDR;
 
 #ifdef CONFIG_XIP_KERNEL
diff --git a/mm/mmap.c b/mm/mmap.c
index 181a113b545d..6d74537122ad 100644
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
