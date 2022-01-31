Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3433DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0mZzPT2BtbcgF5MqE61oZY4vS053qkI3lR8c4mW/mo=; b=HathgOqDta7IKN
	fOEITyDUGINnzoQFG7CqbNZgEmGLdr9mZQQF2svMUc5YlFMr/w4kMT4mSdO0o9kSYuSMyWnOn21Bs
	N9O2zK2x+ayXWD8B8Yaamuf7S6hDax1m3ATONrvcOEr4on/eTKlB35eOwfR0+z+BRrKnzIY2Yqyf0
	5+DcD1BYjoi62rBrhrcsGAbs0MGby6qKgjlf2x865JT99stjRIxBd2gUxnToVHUr0+e+ph1aVd5yV
	EIMFhNtpVuClruENXEXI0F31lLBXrsBsBpNI95pHxEgybu4VRnl+xQJ8WfRSwdA9p3wud24an2g5N
	Z8CLRgyPbSeh96/AA7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEWhd-009Tqs-BY; Mon, 31 Jan 2022 13:26:41 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEWhW-009TnP-QV
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 13:26:37 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:58b3:216b:d287:833])
 by michel.telenet-ops.be with bizsmtp
 id pRSU2600Y2lsq0X06RSUsD; Mon, 31 Jan 2022 14:26:29 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nEWhQ-00CaW8-Gp; Mon, 31 Jan 2022 14:26:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nEWhP-00H7GX-Vd; Mon, 31 Jan 2022 14:26:27 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/3] RISC-V: Fix hartid mask handling for hartid 31 and up
Date: Mon, 31 Jan 2022 14:26:20 +0100
Message-Id: <48231bc6ef385e0057f34cfb71854d8e8fd02f66.1643635156.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643635156.git.geert@linux-m68k.org>
References: <cover.1643635156.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_052635_037943_5FE76714 
X-CRM114-Status: GOOD (  10.63  )
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
