Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576A2C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZajDdbX7kXqy2s4W/LIPperC3BE4s8HqjS+MhLS74SQ=; b=TIwsle66uCIds1
	+uxY4HqNuRgQKRI5NDeI/CLvoz/sqr8RuyyXPFx3xY7amGHVzGk23HSaTKIa/Mjozp371N7pBUvG9
	byzJJITvwRlKofelT7ChW1khofMKvQt7NukzT628v7JQBLa2yzEIVuVEbWe8mUk+Uz9dDULkbB8h3
	f6G/0PBSe88WtUG6lbSq0WCwFdDLTvO/1SiZVN5VVm3FV8SZtYH835ZEbpIodRhsNPtWh5ieJWx99
	hd6isRpqcAXeE7u2Bp9BuF82AoC6o+wVDiaabttp6RttQms4PyD+gMUaFXmpVYh+1Ha70mrMmCBH3
	PTx8aL0myC/6vXUYYgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2ZT-00000005Wn9-3OKd;
	Tue, 24 Jun 2025 12:16:15 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1rl-00000005RAL-2jI9
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 11:31:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bRN1m0MS3z10XPc;
	Tue, 24 Jun 2025 19:26:20 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E58281402EA;
	Tue, 24 Jun 2025 19:30:56 +0800 (CST)
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Jun 2025 19:30:54 +0800
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemq200002.china.huawei.com (7.202.195.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Jun 2025 19:30:54 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@huawei.com>
Subject: [PATCH] riscv: Prevent early kernel panic in instrumented apply_early_boot_alternatives
Date: Tue, 24 Jun 2025 19:30:42 +0800
Message-ID: <20250624113042.2123140-1-changbin.du@huawei.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200002.china.huawei.com (7.202.195.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_043105_845188_4D10931B 
X-CRM114-Status: GOOD (  10.26  )
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

Under FTRACE=y, DYNAMIC_FTRACE=n, and RISCV_ALTERNATIVE_EARLY=n, the kernel
panics upon returning from _mcount() in the early boot path. This occurs
during _start_kernel() -> setup_vm() -> apply_early_boot_alternatives().

The CC_FLAGS_FTRACE is only removed from alternative.c when
CONFIG_RISCV_ALTERNATIVE_EARLY=y. Therefore, no function calls should be
made to alternative.c during early boot in this configuration.

Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Signed-off-by: Changbin Du <changbin.du@huawei.com>
---
 arch/riscv/include/asm/alternative.h | 6 ++++++
 arch/riscv/kernel/alternative.c      | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 3c2b59b25017..c670b0cc55f4 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -31,7 +31,13 @@
 #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
 
 void __init apply_boot_alternatives(void);
+
+# ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
 void __init apply_early_boot_alternatives(void);
+# else
+static inline void apply_early_boot_alternatives(void) { }
+# endif
+
 void apply_module_alternatives(void *start, size_t length);
 
 void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 7eb3cb1215c6..5406c3301627 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -205,6 +205,7 @@ void __init apply_boot_alternatives(void)
 	apply_vdso_alternatives();
 }
 
+#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
 /*
  * apply_early_boot_alternatives() is called from setup_vm() with MMU-off.
  *
@@ -219,12 +220,11 @@ void __init apply_boot_alternatives(void)
  */
 void __init apply_early_boot_alternatives(void)
 {
-#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
 	_apply_alternatives((struct alt_entry *)__alt_start,
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_EARLY_BOOT);
-#endif
 }
+#endif
 
 #ifdef CONFIG_MODULES
 void apply_module_alternatives(void *start, size_t length)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
