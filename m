Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6F3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 17:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpY5Fe6xshC+rUi+SkWPA429pEMn/+WXQT5DpBakbm0=; b=lpIvNPZfgWKA70
	sJSgsMjvk0PRbxS1k3exKrWYiQa9rjgJYFZWdTFZolsk2b4gfLe1rJM5RxjJD1btHTtuCX2CIbYFx
	k7hpFCzDIMtXb42SIwyLKANsdnURm8Jraanpgh7H/TMFNfdqbobicmscxW8QXOLYXUMgXHEfy3mcg
	zNsmg8CDAhCd8didslhtv59jFNV32UI4kwalV7GHCj2qf1dFEVejpf9ckjjq0Nhw28kvHJzyTOO5q
	5Xi9sziLlC51pGIky1UaPqhApTRauaX7gm1+WC2Rt61MJqnfyXgIIplmwsfiHQRvjZ8Y4t3TYNzQ0
	muDmP0ImLWpitM4o572w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrN4o-003ADU-1a; Wed, 18 May 2022 17:03:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrN4h-003A9Z-NJ
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 17:03:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nrN4d-0001Pv-Dd; Wed, 18 May 2022 19:02:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 3/4] riscv: make patch-function pointer more generic in
 cpu_manufacturer_info struct
Date: Wed, 18 May 2022 19:02:53 +0200
Message-Id: <20220518170254.3178923-4-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518170254.3178923-1-heiko@sntech.de>
References: <20220518170254.3178923-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_100303_834664_5B77193B 
X-CRM114-Status: GOOD (  12.32  )
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

During review the naming of the function-pointer was called
confusing as the vendor id is just one of three inputs for
the patching and indeed it serves no real purpose, as with
recent changes the function pointer is not a static
global element anymore, so drop the "vendor_" prefix.

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/alternative.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index c9d0d3c53223..a7d26a00beea 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -20,7 +20,7 @@ struct cpu_manufacturer_info_t {
 	unsigned long vendor_id;
 	unsigned long arch_id;
 	unsigned long imp_id;
-	void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
+	void (*patch_func)(struct alt_entry *begin, struct alt_entry *end,
 				  unsigned long archid, unsigned long impid,
 				  unsigned int stage);
 };
@@ -40,16 +40,16 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 	switch (cpu_mfr_info->vendor_id) {
 #ifdef CONFIG_ERRATA_SIFIVE
 	case SIFIVE_VENDOR_ID:
-		cpu_mfr_info->vendor_patch_func = sifive_errata_patch_func;
+		cpu_mfr_info->patch_func = sifive_errata_patch_func;
 		break;
 #endif
 #ifdef CONFIG_ERRATA_THEAD
 	case THEAD_VENDOR_ID:
-		cpu_mfr_info->vendor_patch_func = thead_errata_patch_func;
+		cpu_mfr_info->patch_func = thead_errata_patch_func;
 		break;
 #endif
 	default:
-		cpu_mfr_info->vendor_patch_func = NULL;
+		cpu_mfr_info->patch_func = NULL;
 	}
 }
 
@@ -68,13 +68,13 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
 
 	riscv_cpufeature_patch_func(begin, end, stage);
 
-	if (!cpu_mfr_info.vendor_patch_func)
+	if (!cpu_mfr_info.patch_func)
 		return;
 
-	cpu_mfr_info.vendor_patch_func(begin, end,
-				   cpu_mfr_info.arch_id,
-				   cpu_mfr_info.imp_id,
-				   stage);
+	cpu_mfr_info.patch_func(begin, end,
+				cpu_mfr_info.arch_id,
+				cpu_mfr_info.imp_id,
+				stage);
 }
 
 void __init apply_boot_alternatives(void)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
