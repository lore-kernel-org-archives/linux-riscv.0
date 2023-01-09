Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A3CC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlwYvyJHzAQZShwMWlgs7BmzDjIpEalDIHT/QC2Im+g=; b=sUMYHov7swB+pe
	wNmzS/jlv1cJOHiaSfhAiwz09OQL9J8R8t9JIPB5nG19dDh14ewSoleKDEW3c485gEIUvhFHpV6KF
	pDh4whRdVnUZwhajPcjv5CeXM1/cUnW3faRCKTdUr3K7ppnBSpwCV8uAhYjUk40Buxjnrv3W835Xt
	DTDxft8r7eXlUAwy7j+Vf4POKv6Iw6B2xiC9orFp5mzglZs3D5x+VDwVLS9bA1gKkpQGbsTNQcHli
	n97G7BZFZISETpmImNJ9Jnyvz3QDXcm1fq8+D6mEROnF+XV40tZucKwyKi8Px5E3diJlxvX37ejij
	b2S/cpJ3qQCgjQYwt0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwr1-003H3o-4U; Mon, 09 Jan 2023 18:26:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwig-003DQl-Ct
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 18:18:05 +0000
Received: from wf0783.dip.tu-dresden.de ([141.76.183.15] helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pEwib-0005hU-Nl; Mon, 09 Jan 2023 19:17:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 2/5] RISC-V: add helpers for J-type immediate handling
Date: Mon,  9 Jan 2023 19:17:52 +0100
Message-Id: <20230109181755.2383085-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109181755.2383085-1-heiko@sntech.de>
References: <20230109181755.2383085-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_101802_529996_2255D18D 
X-CRM114-Status: GOOD (  11.51  )
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

Similar to the helper for the u-type + i-type imm handling, add helper-
functions for j-type immediates.

While it also would be possible to open-code that bit of imm wiggling
using the macros already provided in insn.h, it's way better to have
consistency on how we handle this across all function encoding/decoding.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 0455b4dcb0a7..9eea61a3028f 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -301,6 +301,32 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
 	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
 
+/*
+ * Get the immediate from a J-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_jtype_imm(u32 insn)
+{
+	return RV_EXTRACT_JTYPE_IMM(insn);
+}
+
+/*
+ * Update a J-type instruction with an immediate value.
+ *
+ * @insn: pointer to the jtype instruction
+ * @imm: the immediate to insert into the instruction
+ */
+static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
+{
+	*insn &= ~GENMASK(31, 12);
+	*insn |= (((imm & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) |
+		  ((imm & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) |
+		  ((imm & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) |
+		  ((imm & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF));
+}
+
 /*
  * Put together one immediate from a U-type and I-type instruction pair.
  *
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
