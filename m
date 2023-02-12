Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B40C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NrBu4VmAireBuTjt+wsRCasJZ470mz/bkIPJ2g7VTxA=; b=ktvQQxKtjgzFCU
	1U4hmOHXlPO2UXJIjemsKv8IRef3LKDbOfzOajWAVwdwVXtVTyhR+mnWTMzDf+EfRpesl6x5MvLbZ
	PqvA7oO9PoToOsJxZsVHBFVxj+5zywrbZi9YsML0JRYb+roU981d+6i6UxFquaV2rvu6dxLGHhTLf
	ywVtJLVzZDrtyZmjpZfq+X842VeCC/ctWV4ju2k5mHQnrneG1UI8FmDjeq1HO0j0UEariZcrR3C1p
	XgbYmaVMpSqHj/VnadCEUtm7Vbsd8PCJ1//+UZYfs6B94I2zbY/mgjgpTP88i970Avbk5sxE4n6bS
	v7HhbqIAEkLtrjkNtSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRIM4-00CDcE-9t; Sun, 12 Feb 2023 19:49:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRIM0-00CDbc-SD
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 19:49:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F110060DC5;
	Sun, 12 Feb 2023 19:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD224C4339B;
	Sun, 12 Feb 2023 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676231379;
	bh=bJOEvyuymFhCOG6/ug2QH+yGahnP1BYTZIgTm6FgBS0=;
	h=From:To:Cc:Subject:Date:From;
	b=qPB0lUPB+1mFxWswFOwIB/5shsKbrrWn1dnMR9EJSwkE2wiwDqq7nXNbSwfHejyLd
	 vQ0TRDURlkb2GpNb2ff4DJuLa9hJTpX/TuhLtRMdeuK0myMJdx221xZ7a9EdRf4+X8
	 V2ai6iQn1QASf96z95HrK4T6Mp+r+dHcGPtbdP4ajZ5DtpVgPgOBRjo+FM+ZdJzEIU
	 IQiaY/sG91yaKmOx9NgL1m0/MhQ9bDxlxviTdIAuLi3qU7ApxEmMowLBboY8ASigJS
	 GzNoiC53wCgB3pGZgmMGMSfxBZw1G680D1Hnxt1C4k4is2sBUEskGMdqgvAyJTHUVA
	 VYm9VtiGYWbZg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	samuel@sholland.org,
	linux@roeck-us.net,
	linux-riscv@lists.infradead.org,
	ajones@ventanamicro.com
Subject: [PATCH v1] RISC-V: take text_mutex during alternative patching
Date: Sun, 12 Feb 2023 19:47:36 +0000
Message-Id: <20230212194735.491785-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4856; i=conor.dooley@microchip.com; h=from:subject; bh=3KA3WbOvjC1FOxYg0f9f+wrnFuVLzON/j82MfcJP3Mc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMkvnULZJgr7X94qusj7t/mM3T7u7cu4U5WW6OhZ96SyTshw dOboKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwES+WTP8T/NKORPWb6BddnHy9YRTrr 2aQW67Wh7N6co40F6To7OMk5FhjaSx7imXrDPT737YIFn0YfnVqe+tTLeejT1u3PO55aIHLwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_114941_098039_D96374F8 
X-CRM114-Status: GOOD (  13.77  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Guenter reported a splat during boot, that Samuel pointed out was the
lockdep assertion failing in patch_insn_write():

WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6
epc : patch_insn_write+0x222/0x2f6
 ra : patch_insn_write+0x21e/0x2f6
epc : ffffffff800068c6 ra : ffffffff800068c2 sp : ffffffff81803df0
 gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : ffffffffffffe000
 t1 : 0000000000000001 t2 : 4c45203a76637369 s0 : ffffffff81803e40
 s1 : 0000000000000004 a0 : 0000000000000000 a1 : ffffffffffffffff
 a2 : 0000000000000004 a3 : 0000000000000000 a4 : 0000000000000001
 a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000052464e43
 s2 : ffffffff80b4889c s3 : 000000000000082c s4 : ffffffff80b48828
 s5 : 0000000000000828 s6 : ffffffff8131a0a0 s7 : 0000000000000fff
 s8 : 0000000008000200 s9 : ffffffff8131a520 s10: 0000000000000018
 s11: 000000000000000b t3 : 0000000000000001 t4 : 000000000000000d
 t5 : ffffffffd8180000 t6 : ffffffff81803bc8
status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[<ffffffff800068c6>] patch_insn_write+0x222/0x2f6
[<ffffffff80006a36>] patch_text_nosync+0xc/0x2a
[<ffffffff80003b86>] riscv_cpufeature_patch_func+0x52/0x98
[<ffffffff80003348>] _apply_alternatives+0x46/0x86
[<ffffffff80c02d36>] apply_boot_alternatives+0x3c/0xfa
[<ffffffff80c03ad8>] setup_arch+0x584/0x5b8
[<ffffffff80c0075a>] start_kernel+0xa2/0x8f8

This issue was exposed by 702e64550b12 ("riscv: fpu: switch has_fpu() to
riscv_has_extension_likely()"), as it is the patching in has_fpu() that
triggers the splats in Guenter's report.

Take the text_mutex before doing any code patching to satisfy lockdep.

Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Fixes: 1a0e5dbd3723 ("riscv: sifive: Add SiFive alternative ports")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/20230212154333.GA3760469@roeck-us.net/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Applies on top of Samuel's critical fixes in his "Fix alternatives
issues on for-next":
https://lore.kernel.org/all/20230212021534.59121-1-samuel@sholland.org/
---
 arch/riscv/errata/sifive/errata.c | 3 +++
 arch/riscv/errata/thead/errata.c  | 8 ++++++--
 arch/riscv/kernel/cpufeature.c    | 4 ++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index ef9a4eec0dba..da55cb247e89 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/bug.h>
@@ -107,8 +108,10 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
 
 		tmp = (1U << alt->errata_id);
 		if (cpu_req_errata & tmp) {
+			mutex_lock(&text_mutex);
 			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
 					  alt->alt_len);
+			mutex_lock(&text_mutex);
 			cpu_apply_errata |= tmp;
 		}
 	}
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 1dd90a5f86f0..3b96a06d3c54 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -5,6 +5,7 @@
 
 #include <linux/bug.h>
 #include <linux/kernel.h>
+#include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/uaccess.h>
@@ -101,10 +102,13 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 			altptr = ALT_ALT_PTR(alt);
 
 			/* On vm-alternatives, the mmu isn't running yet */
-			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT) {
 				memcpy(oldptr, altptr, alt->alt_len);
-			else
+			} else {
+				mutex_lock(&text_mutex);
 				patch_text_nosync(oldptr, altptr, alt->alt_len);
+				mutex_unlock(&text_mutex);
+			}
 		}
 	}
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 21fb567e1b22..59d58ee0f68d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -10,6 +10,7 @@
 #include <linux/ctype.h>
 #include <linux/libfdt.h>
 #include <linux/log2.h>
+#include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <asm/alternative.h>
@@ -292,8 +293,11 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 
 		oldptr = ALT_OLD_PTR(alt);
 		altptr = ALT_ALT_PTR(alt);
+
+		mutex_lock(&text_mutex);
 		patch_text_nosync(oldptr, altptr, alt->alt_len);
 		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
+		mutex_unlock(&text_mutex);
 	}
 }
 #endif
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
