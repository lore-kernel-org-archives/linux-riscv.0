Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C3EC3DA78
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CNYUNaxA3pllzQZEwaJSggwPW7sLZrR/QZA+lDSpkds=; b=bGa/4UfNkosiiv
	Tj5PiKBaNYdkaRNk2sMTDFEyIqEuinNysMKpG9uDCTCJf9J3KlwlJGWL3r6E1o36VOVxVqEB/yxdx
	lkwnKayGgV9Pshe7TE9aurF1feNWSNPwMD2Kk6P3p8y2RHOUKN3K85pTc63c0mi/SmtTVT4zk6euP
	SSOvt1SFkHdCHrgp2IwEW2WIcLDBaUre+KPwl+O8fu+Z8MQBedy2O0ixIgV97lePeqMXNgE+rGJ8d
	9oeazv8s+pkA2xl//Wq6PqDqe+PBeeEcQCKnn5KyaVxmxjHkMNA4td5htRPJWM1MduuG7rrNR432F
	ZJP/Fd9OwfNVsOku5wlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRVC-004aAh-C8; Fri, 13 Jan 2023 21:22:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRV5-004a7y-Kp
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:22:14 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRV4-0003Ul-1w; Fri, 13 Jan 2023 22:22:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] riscv: fix jal offsets in patched alternatives
Date: Fri, 13 Jan 2023 22:22:05 +0100
Message-Id: <20230113212205.3534622-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132211_723997_D9367142 
X-CRM114-Status: GOOD (  14.87  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Alternatives live in a different section, so offsets used by jal
instruction will point to wrong locations after the patch got applied.

Similar to arm64, adjust the location to consider that offset.

Co-developed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
This is exactly the same patch, that Jisheng sent as part of his
isa-extension series [0], just split out into a separate patch,
as at least two series depend on it.

[0] https://lore.kernel.org/r/20230111171027.2392-2-jszhang@kernel.org

 arch/riscv/include/asm/insn.h   | 27 +++++++++++++++++++++++++++
 arch/riscv/kernel/alternative.c | 27 +++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 98453535324a..1d2df245d0bd 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -291,6 +291,33 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
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
+	/* drop the old IMMs, all jal IMM bits sit at 31:12 */
+	*insn &= ~GENMASK(31, 12);
+	*insn |= (RV_X(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
+		 (RV_X(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
+		 (RV_X(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
+		 (RV_X(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
+}
+
 /*
  * Put together one immediate from a U-type and I-type instruction pair.
  *
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 6212ea0eed72..3d4f1f32c7f6 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -79,6 +79,21 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
 	patch_text_nosync(ptr, call, sizeof(u32) * 2);
 }
 
+static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
+{
+	s32 imm;
+
+	/* get and adjust new target address */
+	imm = riscv_insn_extract_jtype_imm(jal_insn);
+	imm -= patch_offset;
+
+	/* update instruction */
+	riscv_insn_insert_jtype_imm(&jal_insn, imm);
+
+	/* patch the call place again */
+	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
+}
+
 void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 				      int patch_offset)
 {
@@ -106,6 +121,18 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
 							 insn, insn2, patch_offset);
 		}
+
+		if (riscv_insn_is_jal(insn)) {
+			s32 imm = riscv_insn_extract_jtype_imm(insn);
+
+			/* Don't modify jumps inside the alternative block */
+			if ((alt_ptr + i * sizeof(u32) + imm) >= alt_ptr &&
+			    (alt_ptr + i * sizeof(u32) + imm) < (alt_ptr + len))
+				continue;
+
+			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
+						  insn, patch_offset);
+		}
 	}
 }
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
