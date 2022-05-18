Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A42C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/O67/+MtJSU1d9kADNl28Xjg+l6T0z+ysP0oP1PWkI=; b=npXpZUEbaqJAYD
	mTo4tQCFnXyUei0rp/Gcqx0h8xDpOQnGZrtN+Zqn18jHllgg8yUp8IPHrmJBQLOg/zuAy1Yex/XFd
	A+CuCu/S/qTUbB2f+HJG1Kc1IcFtH1+/9qdeqwKcs1ptdwLh4T6pbu6iRx+jjLFtGuz9R/YuRoMPW
	aVIghXbjESaATVvY21wCno6kz5/W1e4FQcATh/iop7HI7uYnYwNeI6iUFbkNd0T3yH9mLkPEfxPIW
	23oDkyRe+s2OIjaC5qWenMgyqvGWtPULeXbT0JBi4a65KrimLFnOGdPvrXo23J5hMyrhOTvZBOt/F
	BuYLNSqKvxNhr2VzBxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrN4m-003AD0-LT; Wed, 18 May 2022 17:03:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrN4i-003AAc-Md
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 17:03:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nrN4c-0001Pv-M4; Wed, 18 May 2022 19:02:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de,
 Heiko Stuebner <heiko@sntech.de>, kernel test robot <lkp@intel.com>
Subject: [PATCH 1/4] riscv: drop cpufeature_apply_feature tracking variable
Date: Wed, 18 May 2022 19:02:51 +0200
Message-Id: <20220518170254.3178923-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518170254.3178923-1-heiko@sntech.de>
References: <20220518170254.3178923-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_100304_771588_996BD13B 
X-CRM114-Status: GOOD (  10.52  )
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

The variable was tracking which feature patches got applied
but that information was never actually used - and thus resulted
in a warning as well.

Drop the variable.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dea3ea19deee..b33564df81e1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -294,7 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  unsigned int stage)
 {
 	u32 cpu_req_feature = cpufeature_probe(stage);
-	u32 cpu_apply_feature = 0;
 	struct alt_entry *alt;
 	u32 tmp;
 
@@ -308,10 +307,8 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 		}
 
 		tmp = (1U << alt->errata_id);
-		if (cpu_req_feature & tmp) {
+		if (cpu_req_feature & tmp)
 			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
-			cpu_apply_feature |= tmp;
-		}
 	}
 }
 #endif
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
