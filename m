Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F628C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7IZZq1iNmFChoDNVfO1JUEG/zzbAShQte8MWCU7DnTg=; b=kwmki6Tp1FE6Sz
	GBeWv7Oc7VODVB5Wd61d8erA6VlFBY0IFCDzDTOGqq1dlgUrFiiUnv/+WKGpOt043oBcyKjIBvDh4
	fj0WocQfiLjGpntrsHInhcBu6d5o63PDG+4rS6ElgWaU89HOlwFk5wrvAD8g33mvQvZIdwM57dKBX
	IJPFUlZahOg/RxXfF2h3UVgiIMgPjcAkFqz2M2CT7UJoCOTINeAV60bXuN27OEiC3yhnY2JE8Ekd5
	6a7qG48B4reiqPab4G/Uz5UsJLq2Xv5RTiOtdXp5OEVrQXId53lPL2mgXheIOYrVQzitJH9ZbUmhS
	AmuvhCRVS116LyDOIx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11Wl-00EaIr-7f; Fri, 02 Dec 2022 08:36:11 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11Wc-00Ea1h-Fd
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 08:36:09 +0000
X-QQ-mid: bizesmtp79t1669970067t2y9zci3
Received: from utnb-jevon.lan ( [111.197.251.121])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 02 Dec 2022 16:34:12 +0800 (CST)
X-QQ-SSF: 0140000000000050B000000A0000000
X-QQ-FEAT: bwGCdh8HjQCqJQfi+gC/rhbC+wkOzyzykwBjb5QmtilG0Y0+31ivTyDyV7/hx
	jVnqh3on3UMNhrpDbxN7IM/bbEXlPlz4zjyEaRYEN7fqFYH+rzzeyBXtKxHekHxGOU2nLUS
	q9dgGHI8JC2HVTUSO2+SP5tn29eDFBoxwSkqowBrieaUYKeXZT5wIVHd42nX0A22fVrxCf3
	Z/o6I/5Ed70SG7fsjwzZ3RM9F3Z+3QQL3fBcvkXUMNv/rpRFWmIr016saGYq+o32TVVUpXQ
	UUtq4Zb8k2VvR7OnugaWyINSqM7Me7p2aIpDZGr1P2ZAev+wgyD10sAw2FLmjnzYU2gLhpK
	4P25svnqcsHNZqJ2Z8GVmcpW6RsrVH02sHmgM8MrW9morAV/l6uSQi3RwjfsQ==
X-QQ-GoodBg: 1
From: Jianwen Jiang <jiangjianwen@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexandre.ghiti@canonical.com,
	geert@linux-m68k.org,
	panqinglin2020@iscas.ac.cn,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jianwen Jiang <jiangjianwen@uniontech.com>
Subject: [PATCH]     Implement ioremap_prot support (v2)
Date: Fri,  2 Dec 2022 16:33:56 +0800
Message-Id: <20221202083356.169176-1-jiangjianwen@uniontech.com>
X-Mailer: git-send-email 2.37.3.446.gd42b38dfb5
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_003603_072237_53B7AFD3 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

    Feature ioremap_prot only needs an implementation of pte_pgprot on riscv.
    That macro is similar to the same one on platform loongarch, mips and sh.
    We just need:
    1. replace _PFN_MASK with _PAGE_PFN_MASK in pte_gpprot;
    2. add "select HAVE_IOREMAP_PROT" into arch/riscv/Kconfig;
    3. add "depends on MMU" into drivers/fpga/Kconfig to fix the building error "undefined reference to generic_access_phys".

    Signed-off-by: Jianwen Jiang <jiangjianwen@uniontech.com>
---
 arch/riscv/Kconfig            | 1 +
 arch/riscv/include/asm/page.h | 2 ++
 drivers/fpga/Kconfig          | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fa78595a6089..5ed2c7361040 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -95,6 +95,7 @@ config RISCV
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
+	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ac70b0fd9a9a..cb08a4911d60 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -84,6 +84,8 @@ typedef struct page *pgtable_t;
 #define __pgd(x)	((pgd_t) { (x) })
 #define __pgprot(x)	((pgprot_t) { (x) })
 
+#define pte_pgprot(x)  __pgprot(pte_val(x) & ~_PAGE_PFN_MASK)
+
 #ifdef CONFIG_64BIT
 #define PTE_FMT "%016lx"
 #else
diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index bbe0a7cabb75..0493272b8bff 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -5,6 +5,7 @@
 
 menuconfig FPGA
 	tristate "FPGA Configuration Framework"
+	depends on MMU
 	help
 	  Say Y here if you want support for configuring FPGAs from the
 	  kernel.  The FPGA framework adds an FPGA manager class and FPGA
-- 
2.37.3.446.gd42b38dfb5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
