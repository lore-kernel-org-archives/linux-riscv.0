Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745DFC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFETdvjHq0AZeBMRimay1yvPCORvi1Euh/r4SrsN6fQ=; b=el/p/mMYMD6nF9
	vzGIh7Ooin7UlN5IB4oo7tuniSAfXnkxPgvrrTg+1GQ3UgD3AblIopEqHfBlFxEs8Ee/sVu9TiWxk
	NKgAn9j+9ZUeNd7icyrVKEMbrG250VQtRefyowD96SzwnCbp9clil1gxTKGLZ//aufbbk+Ri+lskJ
	jEahNBaL+LodhirgBuaRH7Wlndrb+Te0+e5A0sQa1Ht+2K/z4tlhRF737L2uI5+LT072tneQ8pjU+
	weSDkjG1JV1O1rK6irq3w86C75VqKNYvYelc59qIm5F9J+lLeDs08tQX162iPxUCgSsYMrMfq7/dm
	yxKXJiFxmf949V0nnl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRKME-001XAq-2j; Mon, 07 Mar 2022 20:53:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRKM6-001X5x-SC
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 20:53:25 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nRKM4-0002DJ-LE; Mon, 07 Mar 2022 21:53:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v7 08/13] riscv: move boot alternatives to after fill_hwcap
Date: Mon,  7 Mar 2022 21:53:05 +0100
Message-Id: <20220307205310.1905628-9-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307205310.1905628-1-heiko@sntech.de>
References: <20220307205310.1905628-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_125323_028527_CC8EACD8 
X-CRM114-Status: GOOD (  13.13  )
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

Move the application of boot alternatives to after the hw-capabilities
are populated. This allows to check for available extensions when
determining which alternatives to apply and also makes it actually
work if CONFIG_SMP is disabled for whatever reason.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/setup.c   | 2 ++
 arch/riscv/kernel/smpboot.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 339ceb595b38..b4879c942b42 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -21,6 +21,7 @@
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
 
+#include <asm/alternative.h>
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
 #include <asm/pgtable.h>
@@ -295,6 +296,7 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	riscv_fill_hwcap();
+	apply_boot_alternatives();
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index a6d13dca1403..f1e4948a4b52 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -32,7 +32,6 @@
 #include <asm/sections.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
-#include <asm/alternative.h>
 
 #include "head.h"
 
@@ -41,7 +40,6 @@ static DECLARE_COMPLETION(cpu_running);
 void __init smp_prepare_boot_cpu(void)
 {
 	init_cpu_topology();
-	apply_boot_alternatives();
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
