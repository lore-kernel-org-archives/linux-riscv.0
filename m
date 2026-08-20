Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC9C5DF82
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 06:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gp+U5Qo7kGBo4EK8HfHFgZ2svYlTvdLRAF04w+dHZ2s=; b=xMtelDZgz7i1Mm
	Ce1bfA5rBke5ByYCzFqPxjUb+9e/H4iyDyvCJj/2ctWdBMT2CSSmmuhMn9k4jrQenGfLI/ziWyYr1
	DuMuo3cnme6Rno2ZKG6B5nnh1P8G3xlA5KlgqjfBkDoOxmOyfEUsDIa+h70bF8IWYgdoPpdZuVrVM
	Yz8/+Abh09GxQxr7h2LN8ICztPbQiraj1YwCtyQfrQYN7Pb3Mte63xV/irhZzqn11RqzYCfB7/3bK
	TFwe3ef9tNMeslFROlZOC6V1aqGEBNmuTRZXB6ykg5XmCsNWLMjtTWZhTVlXxAQY+dQ6MSFftJh1y
	mNkRMyWyPwY82t7Mq64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvz1-0000000Aum2-3KRd;
	Thu, 20 Aug 2026 06:10:35 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvyz-0000000AulY-3XEC
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 06:10:35 +0000
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 67K6AAI5097812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Aug 2026 14:10:10 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Thu, 20 Aug
 2026 14:10:10 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Aug
 2026 14:10:10 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <stable@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin
	<sashal@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti
	<alexghiti@rivosinc.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "Palmer
 Dabbelt" <palmer@rivosinc.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH 6.1.y 6.6.y] RISC-V: Provide pgtable_l5_enabled on rv32
Date: Thu, 20 Aug 2026 14:10:07 +0800
Message-ID: <20260820061007.1718706-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 67K6AAI5097812
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_231034_227702_DF8F294C 
X-CRM114-Status: GOOD (  12.98  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

commit 10128f8b1663a8bce27df051c750d116bb8cd737 upstream.

A few of the other page table level helpers are defined on rv32, but not
pgtable_l5_enabled.  This adds the definition as a constant and converts
pgtable_l4_enabled to a constant as well.

Link: https://lore.kernel.org/r/20230830044129.11481-2-palmer@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
[ Ben: Applies unchanged; needed by both 6.1.y and 6.6.y. Both trees took
  commit e59e5e2754bf ("riscv: correct pt_level name via
  pgtable_l5/4_enabled") -- 6.1.y as of v6.1.64 -- without this
  prerequisite from the same series, so arch/riscv/mm/ptdump.c fails to
  build on rv32 whenever CONFIG_PTDUMP_CORE is enabled:

    arch/riscv/mm/ptdump.c: In function 'ptdump_init':
    arch/riscv/mm/ptdump.c:387:28: error: 'pgtable_l5_enabled' undeclared
    (first use in this function); did you mean 'pgtable_l4_enabled'?

  Only pgtable_l5_enabled fails because pgtable_l4_enabled still has an
  unconditional extern in asm/pgtable.h; this patch removes that and
  provides both as constants for rv32. The only assignments to them, in
  disable_pgtable_l4/l5(), are already inside
  #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL), so making them
  const on rv32 is safe. v6.12 and later are unaffected. ]
Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 arch/riscv/include/asm/pgtable-32.h | 3 +++
 arch/riscv/include/asm/pgtable.h    | 1 -
 arch/riscv/mm/init.c                | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 59ba1fbaf784..00f3369570a8 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -33,4 +33,7 @@
 					  _PAGE_WRITE | _PAGE_EXEC |	\
 					  _PAGE_USER | _PAGE_GLOBAL))
 
+static const __maybe_unused int pgtable_l4_enabled;
+static const __maybe_unused int pgtable_l5_enabled;
+
 #endif /* _ASM_RISCV_PGTABLE_32_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1a94e633c144..d25871c60883 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -818,7 +818,6 @@ extern uintptr_t _dtb_early_pa;
 #define dtb_early_pa	_dtb_early_pa
 #endif /* CONFIG_XIP_KERNEL */
 extern u64 satp_mode;
-extern bool pgtable_l4_enabled;
 
 void paging_init(void);
 void misc_mem_init(void);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7e6ea7f0cb68..d6cfa7de010a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -45,10 +45,12 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
 #endif
 EXPORT_SYMBOL(satp_mode);
 
+#ifdef CONFIG_64BIT
 bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
 bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
+#endif
 
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
