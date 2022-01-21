Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB1AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2O45Rm4aKqGAfQd6/GthhwPKM7vljdd3eX1Enyqsdag=; b=qWd41jYqQsJc1u
	D42TpakkCeIl7AmQ5YeulzkmUGnVRTPn4H+sdmp5L0YXd9ZpT9xDN8n7ltlmyadr3yjW07XDEshpI
	Tsi+SQzFdcBAH0IVNcdCciObxnidISj5OnVX9iu/uy9Upzq3+BB7RKIRj9y3AuzD74C6vIcvMX9We
	GPSSHweBywtio/Ic1h8qmFIGLuKvd9+HzfDi8FN8fr/zcAztGheo/9hZOPVY+PlZrRINsbf+/yoPm
	EYlK7OgE7Hz1G0xcloacz5sxYi63hWJPqk8FpcMScegzSZaKjR5L9UL/8lqUFvELR8603FdN4UEOw
	qc5RZnrccm0jke0PpFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAwun-00FZfk-3v; Fri, 21 Jan 2022 16:37:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAwub-00FZYU-AD
 for linux-riscv@bombadil.infradead.org; Fri, 21 Jan 2022 16:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MbtVCQVgGWa2JoKlJ96LMQ2Tub8oCl14OG1vMhnAf+E=; b=AWxq1HIVt0geWY7OP+iK2yFUoX
 Gopo855lNKsPKzpmIj7krRVkcR9ncy7MBwj6qnM9do1bcnW+XvJar2ylUmJLQouWwFU6PF1tmAUJO
 lXRA7J2tY6RaKvAkwZoEAcTDFuKPpmfGC0hFzHYz/+ZjBI4TFwcmor0BGJpkZBp42Rw0/VcXSounl
 MPI38MdtzokKs/BioGUKSBhLLSXpVVmJC6mjapgOBZ2US93G3r1LJ0XF0SVz9ZLlxgWNQfbPJGAiW
 xQ0/R0Kjbcd2bRGjDNnSq1I9XTLFQ8zYtS/Zw0UXqxDPqGpYKbZpL2fdEjGLToC15S0T5nWHU6N+6
 SIbgQazQ==;
Received: from gloria.sntech.de ([185.11.138.130])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAwuW-002bxd-IV
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 16:37:15 +0000
Received: from p508fcef5.dip0.t-ipconnect.de ([80.143.206.245]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nAwuM-0008GA-Vw; Fri, 21 Jan 2022 17:37:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 08/14] riscv: move boot alternatives to a slightly earlier
 position
Date: Fri, 21 Jan 2022 17:36:12 +0100
Message-Id: <20220121163618.351934-9-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121163618.351934-1-heiko@sntech.de>
References: <20220121163618.351934-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_163712_685693_6B1E3BE3 
X-CRM114-Status: GOOD (  13.36  )
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

Move the application of boot alternatives to soc_early_init().
This allows to catch more generic cases of code needing patches
than doing it in smp_prepare_boot_cpu() and also makes it actually
work if CONFIG_SMP is disabled for whatever reason.

The position is chosen mainly as it is before the actual soc early
init runs but also already allows accessing the devicetree
via fdt_* functions.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/head.S    | 2 ++
 arch/riscv/kernel/smpboot.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index db062279d9ed..432fe7b3f897 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -10,6 +10,7 @@
 #include <asm/thread_info.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
+#include <asm/alternative.h>
 #include <asm/csr.h>
 #include <asm/cpu_ops_sbi.h>
 #include <asm/hwcap.h>
@@ -341,6 +342,7 @@ clear_bss_done:
 	call kasan_early_init
 #endif
 	/* Start the kernel */
+	call apply_boot_alternatives
 	call soc_early_init
 	tail start_kernel
 
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
