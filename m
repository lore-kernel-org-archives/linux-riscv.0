Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C17EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMTrJFC+PfmpMfWn9gkmsfxnyKmDpZ2SpvBZ8sBhUCk=; b=rNOxghGDmN63RX
	GMhWcPlKIZ4Ha0VelEI8uGEWZG2UAT4KOsVunyZpy8NYoirhvPqVB8OadAXWRz7v+J6z2frweve/+
	1NWOpxngJouui1ncLwk6UmHmYPIrQM0tEBuQ57+FWXNOcjyauUtdeOSD0zkevORPPl40GkNg1t1G0
	d6KI+H03z/3rvOCDgoAAmF01jWpXTSoj3R8ragHOCcE6dQRlPEsaqVFAO8qerdggFZxETuHpaNejL
	rU5DOIJ8pkI5yVgBKqRX5h4Vp433KjTcHBRdPLT1YmnMBLzPZdNx+iBzlzyiDFTzs+u8ZR4XJI9IY
	dVZhCtA2TjmoCCFlJ04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbNB-0012RZ-9z; Mon, 28 Nov 2022 10:28:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbN8-0012Pq-Np
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 10:28:24 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozbLV-0004Xi-JY; Mon, 28 Nov 2022 11:26:41 +0100
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
Subject: [PATCH v2 10/13] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Mon, 28 Nov 2022 11:26:29 +0100
Message-Id: <20221128102632.435174-11-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128102632.435174-1-heiko@sntech.de>
References: <20221128102632.435174-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_022822_842199_F3D57161 
X-CRM114-Status: GOOD (  20.82  )
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
 arch/riscv/include/asm/alternative.h |  3 ++
 arch/riscv/kernel/alternative.c      | 72 ++++++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c       | 11 ++++-
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 6511dd73e812..c58ec3cc4bc3 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -27,6 +27,9 @@ void __init apply_boot_alternatives(void);
 void __init apply_early_boot_alternatives(void);
 void apply_module_alternatives(void *start, size_t length);
 
+void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
+				      int patch_offset);
+
 struct alt_entry {
 	void *old_ptr;		 /* address of original instruciton or data  */
 	void *alt_ptr;		 /* address of replacement instruction or data */
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index a7d26a00beea..292cc42dc3be 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -15,6 +15,8 @@
 #include <asm/vendorid_list.h>
 #include <asm/sbi.h>
 #include <asm/csr.h>
+#include <asm/insn.h>
+#include <asm/patch.h>
 
 struct cpu_manufacturer_info_t {
 	unsigned long vendor_id;
@@ -53,6 +55,76 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 	}
 }
 
+static unsigned int riscv_instruction_at(void *p, unsigned int offset)
+{
+	u16 *parcel = p + (offset * sizeof(u32));
+
+	return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;
+}
+
+static inline bool riscv_insn_is_auipc_jalr(u32 insn1, u32 insn2)
+{
+	return riscv_insn_is_auipc(insn1) && riscv_insn_is_jalr(insn2);
+}
+
+#define JALR_SIGN_MASK		BIT(RV_I_IMM_SIGN_OPOFF - RV_I_IMM_11_0_OPOFF)
+#define AUIPC_PAD		(0x00001000)
+
+#define to_jalr_imm(value)						\
+	((value & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF)
+
+#define to_auipc_imm(value)						\
+	((value & JALR_SIGN_MASK) ?					\
+	((value & RV_U_IMM_31_12_MASK) + AUIPC_PAD) :	\
+	(value & RV_U_IMM_31_12_MASK))
+
+void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
+				      int patch_offset)
+{
+	int num_instr = len / sizeof(u32);
+	unsigned int call[2];
+	int i;
+	int imm;
+	u32 rd1;
+
+	/*
+	 * stop one instruction before the end, as we're checking
+	 * for auipc + jalr
+	 */
+	for (i = 0; i < num_instr - 1; i++) {
+		u32 inst1 = riscv_instruction_at(alt_ptr, i);
+		u32 inst2 = riscv_instruction_at(alt_ptr, i + 1);
+
+		if (!riscv_insn_is_auipc_jalr(inst1, inst2))
+			continue;
+
+		/* call will use ra register */
+		rd1 = RV_EXTRACT_RD_REG(inst1);
+		if (rd1 != 1)
+			continue;
+
+		/* get and adjust new target address */
+		imm = RV_EXTRACT_UTYPE_IMM(inst1);
+		imm += RV_EXTRACT_ITYPE_IMM(inst2);
+		imm -= patch_offset;
+
+		/* pick the original auipc + jalr */
+		call[0] = inst1;
+		call[1] = inst2;
+
+		/* drop the old IMMs */
+		call[0] &= ~(RV_U_IMM_31_12_MASK);
+		call[1] &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
+
+		/* add the adapted IMMs */
+		call[0] |= to_auipc_imm(imm);
+		call[1] |= to_jalr_imm(imm);
+
+		/* patch the call place again */
+		patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);
+	}
+}
+
 /*
  * This is called very early in the boot process (directly after we run
  * a feature detect on the boot CPU). No need to worry about other CPUs
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..ba62a4ff5ccd 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -316,8 +316,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
