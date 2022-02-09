Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39339C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lW0e2nMvMY8Fb62UjXrehtuZ8ckOxk0pE+LUf5NogyI=; b=Hr5qXypkK0mTy2
	cJ6H5uO8B/vyxoELCqo2OjQtZ+C5Vpef/ADv8DA7190VvD6bp6kvFOkP4w3wZhIt7echAofbPbJ/s
	o5T1jH92X4AkPD9xsRW7A25e3CQQK/1abyo/0oWaNu6kyLqpC4ZGtckysDtoT0pKgcQoRlUE2Kav4
	zrMc9/sJR2cY3ZSpx8fdsOD9XNhxj49oA0S+BBx5/SOf9/9ZqqY1Gea30kGIYgZsOcnODo4eBLc6h
	J57xO7K0+T9I1WOfiOCk6mCSQeoKz68OBhBTLXFoyOopyEL+P5UG3DY4StozOF3mp2ks/Tc5H1FyT
	Nd5QPwmdKLqXaYmxYORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHilL-00Gkpi-5j; Wed, 09 Feb 2022 08:55:43 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHiju-00Gk7i-T2
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 08:54:16 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:54c7:c522:3859:290])
 by baptiste.telenet-ops.be with bizsmtp
 id swu32600f4VQqf501wu3Jx; Wed, 09 Feb 2022 09:54:05 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nHijj-000DIh-7n; Wed, 09 Feb 2022 09:54:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nHiji-00DkLm-Mk; Wed, 09 Feb 2022 09:54:02 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atishp@rivosinc.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 1/3] RISC-V: Fix hartid mask handling for hartid 31 and up
Date: Wed,  9 Feb 2022 09:53:59 +0100
Message-Id: <305d51e730eacfe724f1d942832545c5abe7f2a0.1644396407.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644396407.git.geert@linux-m68k.org>
References: <cover.1644396407.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_005415_155763_5E453A4C 
X-CRM114-Status: GOOD (  10.64  )
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

Jessica reports that using "1 << hartid" causes undefined behavior for
hartid 31 and up.

Fix this by using the BIT() helper instead of an explicit shift.

Reported-by: Jessica Clarke <jrtc27@jrtc27.com>
Fixes: 26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for hartid bitmap")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Emil Renner Berthing <kernel@esmil.dk>
---
v2:
  - Add Reviewed-by, Tested-by.
---
 arch/riscv/kernel/sbi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f72527fcb34709a6..f93bc75f2bc43c8e 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2020 Western Digital Corporation or its affiliates.
  */
 
+#include <linux/bits.h>
 #include <linux/init.h>
 #include <linux/pm.h>
 #include <linux/reboot.h>
@@ -85,7 +86,7 @@ static unsigned long __sbi_v01_cpumask_to_hartmask(const struct cpumask *cpu_mas
 			pr_warn("Unable to send any request to hartid > BITS_PER_LONG for SBI v0.1\n");
 			break;
 		}
-		hmask |= 1 << hartid;
+		hmask |= BIT(hartid);
 	}
 
 	return hmask;
@@ -268,7 +269,7 @@ static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
 		}
 		if (!hmask)
 			hbase = hartid;
-		hmask |= 1UL << (hartid - hbase);
+		hmask |= BIT(hartid - hbase);
 	}
 
 	if (hmask) {
@@ -362,7 +363,7 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
 		}
 		if (!hmask)
 			hbase = hartid;
-		hmask |= 1UL << (hartid - hbase);
+		hmask |= BIT(hartid - hbase);
 	}
 
 	if (hmask) {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
