Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95B9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6zWzBSx9zdKlogOdPN7fs/CHgydA5Rg4YQpATOr08Q=; b=JVwlDoB2q4eGrp
	Y57LSz/eeHo2/To8S3hv/aPAx5YzLEw88q7fxEOKzO1yAxdY1H9wuw80JTP1OdHmfIgs9gV8WonfV
	bH5H1I8AJDSNbYCAzp2CU3xkyqZ81GmmFDf7jWas4KgNZRhVqjA4AwJuUcysIGapROGlauO5bURi1
	cltzWgGzfH6oh7QGiXQ2pWZiav8hp4PBuw//PXfPySqKraxvAFZJzL/mFUrTVQrfo82FqUR3704rd
	sWrcKjQAWxAHMu/tjnCH+uUyE/5zood6BwP7oLM4HwGJI7T5vbJOI5+BWK8s7ZAOD5o3NjBY+EPeK
	ntbxm7fHibFrmExH0KnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKic-00FyWl-R2; Thu, 26 May 2022 21:08:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKXP-00Fu2q-U4
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 20:57:00 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nuKXL-0006ZH-FQ; Thu, 26 May 2022 22:56:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	mick@ics.forth.gr,
	samuel@sholland.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 5/5] riscv: remove usage of function-pointers from cpufeatures and t-head errata
Date: Thu, 26 May 2022 22:56:46 +0200
Message-Id: <20220526205646.258337-6-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220526205646.258337-1-heiko@sntech.de>
References: <20220526205646.258337-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_135656_064355_5475DF60 
X-CRM114-Status: GOOD (  23.05  )
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

Having a list of alternatives to check with a per-entry function pointer
to a check function is nice style-wise. But in case of early-alternatives
it can clash with the non-relocated kernel and the function pointer in
the list pointing to a completely wrong location.

This isn't an issue with one or two list entries, as in that case the
compiler seems to unroll the loop and even usage of the list structure
and then only does relative jumps into the check functions based on this.

When adding a third entry to either list though, the issue that was
hiding there from the beginning is triggered resulting a jump to a
memory address that isn't part of the kernel at all.

The list of features/erratas only contained an unused name and the
pointer to the check function, so an easy solution for the problem
is to just unroll the loop in code, dismantle the whole list structure
and just call the relevant check functions one by one ourself.

For the T-Head errata this includes moving the stage-check inside
the check functions.

The issue is only relevant for things that might be called for early-
alternatives (T-Head and possible future main extensions), so the
SiFive erratas were not affected from the beginning, as they got
an early return for early-alternatives in the original patchset.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/errata/thead/errata.c | 38 ++++++++++----------------------
 arch/riscv/kernel/cpufeature.c   | 32 +++++++++------------------
 2 files changed, 22 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index e5d75270b99c..cc155228247d 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -14,40 +14,26 @@
 #include <asm/patch.h>
 #include <asm/vendorid_list.h>
 
-struct errata_info {
-	char name[ERRATA_STRING_LENGTH_MAX];
-	bool (*check_func)(unsigned long arch_id, unsigned long impid);
-	unsigned int stage;
-};
-
-static bool errata_mt_check_func(unsigned long  arch_id, unsigned long impid)
+static bool errata_probe_pbmt(unsigned int stage,
+			      unsigned long arch_id, unsigned long impid)
 {
 	if (arch_id != 0 || impid != 0)
 		return false;
-	return true;
-}
 
-static const struct errata_info errata_list[ERRATA_THEAD_NUMBER] = {
-	{
-		.name = "memory-types",
-		.stage = RISCV_ALTERNATIVES_EARLY_BOOT,
-		.check_func = errata_mt_check_func
-	},
-};
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT ||
+	    stage == RISCV_ALTERNATIVES_MODULE)
+		return true;
+
+	return false;
+}
 
-static u32 thead_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
+static u32 thead_errata_probe(unsigned int stage,
+			      unsigned long archid, unsigned long impid)
 {
-	const struct errata_info *info;
 	u32 cpu_req_errata = 0;
-	int idx;
-
-	for (idx = 0; idx < ERRATA_THEAD_NUMBER; idx++) {
-		info = &errata_list[idx];
 
-		if ((stage == RISCV_ALTERNATIVES_MODULE ||
-		     info->stage == stage) && info->check_func(archid, impid))
-			cpu_req_errata |= (1U << idx);
-	}
+	if (errata_probe_pbmt(stage, archid, impid))
+		cpu_req_errata |= (1U << ERRATA_THEAD_PBMT);
 
 	return cpu_req_errata;
 }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b33564df81e1..b63c25c55bf1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -246,12 +246,7 @@ void __init riscv_fill_hwcap(void)
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-struct cpufeature_info {
-	char name[ERRATA_STRING_LENGTH_MAX];
-	bool (*check_func)(unsigned int stage);
-};
-
-static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
+static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
 {
 #ifdef CONFIG_RISCV_ISA_SVPBMT
 	switch (stage) {
@@ -265,26 +260,19 @@ static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int stage)
 	return false;
 }
 
-static const struct cpufeature_info __initdata_or_module
-cpufeature_list[CPUFEATURE_NUMBER] = {
-	{
-		.name = "svpbmt",
-		.check_func = cpufeature_svpbmt_check_func
-	},
-};
-
+/*
+ * Probe presence of individual extensions.
+ *
+ * This code may also be executed before kernel relocation, so we cannot use
+ * addresses generated by the address-of operator as they won't be valid in
+ * this context.
+ */
 static u32 __init_or_module cpufeature_probe(unsigned int stage)
 {
-	const struct cpufeature_info *info;
 	u32 cpu_req_feature = 0;
-	int idx;
-
-	for (idx = 0; idx < CPUFEATURE_NUMBER; idx++) {
-		info = &cpufeature_list[idx];
 
-		if (info->check_func(stage))
-			cpu_req_feature |= (1U << idx);
-	}
+	if (cpufeature_probe_svpbmt(stage))
+		cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
 
 	return cpu_req_feature;
 }
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
