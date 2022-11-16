Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1093C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 02:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vGOgB0WmqTYov4TVN8NtqdkootYBaoUtEV9FB1JdSPo=; b=e2XkfnH3W87RMG
	7BpZJe/RemuIqmFxh9DFuB6ZD4iUZRmKEIn3lFrFpw71HlhP7LQH7m5d0S47mnaECnRJq+t4dy6jj
	SKAyHYDmAgtTvqIRFmDQhtlAJY6/sads3VS8ktDQe+/Fp0T9eMO/GXyHj20poYUgp89F+aHTM/Xty
	TDmWnAKI+gm8WBDJdyj5ca7psecX3m5v/9plRVZS2ejbM4ReB8l0VHeuVrdwmYpCdNZaYIT3hSrGR
	ASGbRhPFeYCZ1/CLHpCm6i6TTgji7PEgwx3usSo/2Lko/Z+CSehDQRodBz2QBVHMmrNwwphBMbKz9
	XnmyFJ1r35LVxmMTlXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8dH-00Gf3B-6E; Wed, 16 Nov 2022 02:58:35 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov8dA-00Gexn-RM
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 02:58:34 +0000
X-QQ-mid: bizesmtp71t1668567442t45i2o4u
Received: from utnb-jevon.. ( [101.6.93.65])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 16 Nov 2022 10:57:12 +0800 (CST)
X-QQ-SSF: 0140000000000040B000000A0000000
X-QQ-FEAT: du0rsRKm0AHCqbU+MdZ/TF1wNfklu76Gj6AnB5f+Jiq+wn0GMe7zFBachZjAh
	SSWtuSd6/xn7tPWqtiv6W+4CfLb6U80eA789/LDfv/cbEBwWxZcpELpWAi8jCvm0C5YT3V2
	Lz+YRBrpgUBBdqqo2npfPmuw6k9kVqu3Q6L1p96G95aBnK45UsiYpAbGVwBADs+8H2djbva
	IxA98Rz8ETnldnTX6BlLCUehegtnJ8ha7o6ufXLNnJnFgDqzN+bKn2y6twB95a5GqHk5lPc
	Sn287HmKMBUVp+/KPAjvsDIAMwBhZeRxFSCUdOub7Boaj9DIYx1LT7nB1sK7maPDFOdEbJH
	SMGk6H38/TISxWwqNHRrhLzGVybE7xs5NhUkUYzvHMeHQjCRII+WjgcfxP67w==
X-QQ-GoodBg: 1
From: Jianwen Jiang <jiangjianwen@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexandre.ghiti@canonical.comp,
	geert@linux-m68k.org,
	panqinglin2020@iscas.ac.cn,
	arnd@arndb.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jianwen Jiang <jiangjianwen@uniontech.com>
Subject: [PATCH] riscv: Implement ioremap_prot support
Date: Wed, 16 Nov 2022 10:57:09 +0800
Message-Id: <20221116025709.27368-1-jiangjianwen@uniontech.com>
X-Mailer: git-send-email 2.37.3.446.gd42b38dfb5
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_185829_392510_C6C9B69E 
X-CRM114-Status: UNSURE (   6.62  )
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
That macro is similar on platform loongarch, mips and sh.
We just need to replace _PFN_MASK with _PAGE_PFN_MASK, and select
HAVE_IOREMAP_PROT in arch/riscv/Kconfig.

Signed-off-by: Jianwen Jiang <jiangjianwen@uniontech.com>
---
 arch/riscv/Kconfig            | 1 +
 arch/riscv/include/asm/page.h | 2 ++
 2 files changed, 3 insertions(+)

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
index ac70b0fd9a9a..d379b4702849 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -84,6 +84,8 @@ typedef struct page *pgtable_t;
 #define __pgd(x)	((pgd_t) { (x) })
 #define __pgprot(x)	((pgprot_t) { (x) })
 
+#define pte_pgprot(x)	__pgprot(pte_val(x) & ~_PAGE_PFN_MASK)
+
 #ifdef CONFIG_64BIT
 #define PTE_FMT "%016lx"
 #else
-- 
2.37.3.446.gd42b38dfb5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
