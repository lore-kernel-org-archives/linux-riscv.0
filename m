Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35455C43217
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuE5beQkyHhBXMOxOz/Stqh0RrgQ/+Be5w9L+t5czWs=; b=NYJMgCZH20sqt7
	XmjPzAZcsx6SpHs9zXgLPtmm58ZP/vLcc305lO9UqHOvz9SeRNUHcPvvE2q2NIvYehGJYt73qJJYb
	8NpBIPxgXo39AiTdaUszRsg4VzTuXFgPdrHtP5NrjQvvrVL/orSGq+sHTb5P3U9MzSe6NPjGEPDNx
	9JtoKgzwnDRUKXK1AHI917+jzOzpbaGNbN8kUuve+eiZm4fQ9jo9PuCco5q86kjQ3vkmRbBkCL+W0
	74ET/Neio56KWdBLWwLTm8+TmHXfQzqqfCpG0PLryx30NWJ2OA3ugwzI+CX7fGdXaqW6iyBhlizCG
	gDR3LCNioTUAk2himIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nos1w-008JcF-2F; Wed, 11 May 2022 19:29:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nos1l-008JTJ-DR
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 19:29:45 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nos1j-0004fe-As; Wed, 11 May 2022 21:29:39 +0200
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
Subject: [PATCH 07/12] riscv: move boot alternatives to after fill_hwcap
Date: Wed, 11 May 2022 21:29:16 +0200
Message-Id: <20220511192921.2223629-8-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511192921.2223629-1-heiko@sntech.de>
References: <20220511192921.2223629-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_122941_591276_DD749939 
X-CRM114-Status: GOOD (  12.91  )
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/setup.c   | 2 ++
 arch/riscv/kernel/smpboot.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f4f4a64bc3a0..9162e9a824d2 100644
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
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
