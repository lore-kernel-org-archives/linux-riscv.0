Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81528C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 18:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeY7dsR0FzPqvgOKu5Y1TlA9Us421SONpJ4OqtPu7n4=; b=pAwqLAuLezTB+2
	WMf3PJ0NxYQGN5E9yALFASzWCZR5/VGtv9/odD/kbh935roZ7WPDjCyNjmL21l2gllibilFFRbyUS
	zPusYTr2amLQFuPW3GgCxyHwVBnIqmw8JHsm/ecxloQ+pUS1eKkM4p6WMLCzC/nGBRRg8b/0kcg2F
	m/JxvzWbvamV4nOVR7BQDYawsWsjhcAk5ejx+fYAOcRUOe5igG6I7lMPAM5pgc3lG10nXYD6SbjFg
	XxMIsQG1TZr/9iJv8TZJ9NW5I0JHJrggP+EoVxpCuNo1a46Zz0MYgZaCdeBp1HZJVz6MurHwwQejb
	VhJR8GHzZ8kP6F/WE0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yqu-0080xt-Mf; Wed, 07 Dec 2022 18:09:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yqp-0080nN-6i
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 18:09:00 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2yqK-0004lz-Gj; Wed, 07 Dec 2022 19:08:28 +0100
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
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Wed,  7 Dec 2022 19:08:21 +0100
Message-Id: <20221207180821.2479987-13-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207180821.2479987-1-heiko@sntech.de>
References: <20221207180821.2479987-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_100859_274102_8FD274EA 
X-CRM114-Status: GOOD (  20.58  )
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
 arch/riscv/kernel/alternative.c      | 56 ++++++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c       |  5 ++-
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 6511dd73e812..1bd4027d34ca 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -27,6 +27,9 @@ void __init apply_boot_alternatives(void);
 void __init apply_early_boot_alternatives(void);
 void apply_module_alternatives(void *start, size_t length);
 
+void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
+				   int patch_offset);
+
 struct alt_entry {
 	void *old_ptr;		 /* address of original instruciton or data  */
 	void *alt_ptr;		 /* address of replacement instruction or data */
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index a7d26a00beea..c29e198ed9df 100644
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
@@ -53,6 +55,60 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
 	}
 }
 
+static u32 riscv_instruction_at(void *p)
+{
+	u16 *parcel = p;
+
+	return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;
+}
+
+static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 insn1, u32 insn2, int patch_offset)
+{
+	/* pick the original auipc + jalr */
+	u32 call[2] = { insn1, insn2 };
+	s32 imm;
+
+	/* get and adjust new target address */
+	imm = riscv_insn_extract_utype_itype_imm(insn1, insn2);
+	imm -= patch_offset;
+
+	/* update instructions */
+	riscv_insn_insert_utype_itype_imm(call, imm);
+
+	/* patch the call place again */
+	patch_text_nosync(ptr, call, sizeof(u32) * 2);
+}
+
+void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
+				      int patch_offset)
+{
+	int num_instr = len / sizeof(u32);
+	int i;
+
+	/*
+	 * stop one instruction before the end, as we're checking
+	 * for auipc + jalr
+	 */
+	for (i = 0; i < num_instr; i++) {
+		u32 inst = riscv_instruction_at(alt_ptr + i * sizeof(u32));
+
+		/* may be the start of an auipc + jalr pair */
+		if (riscv_insn_is_auipc(inst) && i < num_instr - 1) {
+			u32 inst2 = riscv_instruction_at(alt_ptr + (i + 1) * sizeof(u32));
+
+			if (!riscv_insn_is_jalr(inst2))
+				continue;
+
+			/* call will use ra register */
+			if (RV_EXTRACT_RD_REG(inst) != 1)
+				continue;
+
+			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
+							 inst, inst2, patch_offset);
+		}
+	}
+}
+
 /*
  * This is called very early in the boot process (directly after we run
  * a feature detect on the boot CPU). No need to worry about other CPUs
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..e91ec3d8e240 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -316,8 +316,11 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 		}
 
 		tmp = (1U << alt->errata_id);
-		if (cpu_req_feature & tmp)
+		if (cpu_req_feature & tmp) {
 			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+			riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
+						      alt->old_ptr - alt->alt_ptr);
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
