Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8186C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLDK1Zx6hXNHtfpuuAgYZp8FbDmuJcwZxgfe1I6GTQU=; b=qC2f84NjoTWEVa
	6fVTgsPf6RQbwh2UNaHXuMlnCk3LJA22vbmopxuHSQ7+rjsiCQ/yLmX05OhzJvRtYCDUmmOlNSO8S
	6kJq4nObn0OTp+vpHWDEGwhYuMVkiQbE1vGU5M0UpkbMpEEBdrBYBzGBdcimMG54kajtZojmocaeq
	/y4SumUjQBIslg2TJRETEjipKhublye/iEyHNrYSv4DUkz/txhi3df0AyUu4pkxgtmMJ2pa1Vhmkq
	1IWO3J6Xca7VPTz4gWmen7TVA9GDBNeMmsxah6J8ld5+exSWXsw0pojW5x9kBlSeE659ys433wrEE
	imqVpONAxRsko6pvaNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAky-007KTA-1d; Thu, 10 Nov 2022 16:50:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAko-007KIw-9p
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 16:50:17 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1otAkl-0001xU-Hk; Thu, 10 Nov 2022 17:50:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Thu, 10 Nov 2022 17:49:22 +0100
Message-Id: <20221110164924.529386-6-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110164924.529386-1-heiko@sntech.de>
References: <20221110164924.529386-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_085014_374632_8BE721CE 
X-CRM114-Status: GOOD (  17.08  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Alternatives live in a different section, so addresses used by call
functions will point to wrong locations after the patch got applied.

Similar to arm64, adjust the location to consider that offset.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/cpufeature.c | 79 +++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..026512ca9c4c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -298,6 +298,74 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
 	return cpu_req_feature;
 }
 
+#include <asm/parse_asm.h>
+
+DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
+DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
+
+static inline bool is_auipc_jalr_pair(long insn1, long insn2)
+{
+	return is_auipc_insn(insn1) && is_jalr_insn(insn2);
+}
+
+#define JALR_SIGN_MASK		BIT(I_IMM_SIGN_OPOFF - I_IMM_11_0_OPOFF)
+#define JALR_OFFSET_MASK	I_IMM_11_0_MASK
+#define AUIPC_OFFSET_MASK	U_IMM_31_12_MASK
+#define AUIPC_PAD		(0x00001000)
+#define JALR_SHIFT		I_IMM_11_0_OPOFF
+
+#define to_jalr_imm(offset)						\
+	((offset & I_IMM_11_0_MASK) << I_IMM_11_0_OPOFF)
+
+#define to_auipc_imm(offset)						\
+	((offset & JALR_SIGN_MASK) ?					\
+	((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) :	\
+	(offset & AUIPC_OFFSET_MASK))
+
+static void riscv_alternative_fix_auipc_jalr(unsigned int *alt_ptr,
+					     unsigned int len, int patch_offset)
+{
+	int num_instr = len / sizeof(u32);
+	unsigned int call[2];
+	int i;
+	int imm1;
+	u32 rd1;
+
+	for (i = 0; i < num_instr; i++) {
+		/* is there a further instruction? */
+		if (i + 1 >= num_instr)
+			continue;
+
+		if (!is_auipc_jalr_pair(*(alt_ptr + i), *(alt_ptr + i + 1)))
+			continue;
+
+		/* call will use ra register */
+		rd1 = EXTRACT_RD_REG(*(alt_ptr + i));
+		if (rd1 != 1)
+			continue;
+
+		/* get and adjust new target address */
+		imm1 = EXTRACT_UTYPE_IMM(*(alt_ptr + i));
+		imm1 += EXTRACT_ITYPE_IMM(*(alt_ptr + i + 1));
+		imm1 -= patch_offset;
+
+		/* pick the original auipc + jalr */
+		call[0] = *(alt_ptr + i);
+		call[1] = *(alt_ptr + i + 1);
+
+		/* drop the old IMMs */
+		call[0] &= ~(U_IMM_31_12_MASK);
+		call[1] &= ~(I_IMM_11_0_MASK << I_IMM_11_0_OPOFF);
+
+		/* add the adapted IMMs */
+		call[0] |= to_auipc_imm(imm1);
+		call[1] |= to_jalr_imm(imm1);
+
+		/* patch the call place again */
+		patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);
+	}
+}
+
 void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  struct alt_entry *end,
 						  unsigned int stage)
@@ -316,8 +384,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 		}
 
 		tmp = (1U << alt->errata_id);
-		if (cpu_req_feature & tmp)
-			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+		if (cpu_req_feature & tmp) {
+			/* do the basic patching */
+			patch_text_nosync(alt->old_ptr, alt->alt_ptr,
+					  alt->alt_len);
+
+			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
+							 alt->alt_len,
+							 alt->old_ptr - alt->alt_ptr);
+		}
 	}
 }
 #endif
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
