Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02009C47089
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IC0Rj8PUCbjsSP0r3dQd/73MR8yhfcoMT6J2huQuCE=; b=MW0bI4gkIJT+ky
	azUI3kFcBsF87Oo0s0RdQHLnqHV9mjVBTU1LY9Ze3+5ZI850shYpJR1SewQTRgzRZzAv+C83MZ4h0
	2Qm67I1lhvN8mVNbt8NDc5jvkgCoOPqjx95UeCgBG6SEkoKqHyj1YmXqLO4MBKTyeoS2kmVnvqYNa
	kGFDU5Z0dP8O7fnwxNfIMQg3+W7BS3zdqhd335P9n4GAJ74jjPj208jm0PWpsgrQ21yabdx2wjjm5
	+R8NeV4IPQk5UMhS0eNm3kN1VwHiHgVkTa+0HITx4oWBeOtoi1l2ohajB09epDmMDXIIxjIHunTRu
	AjRPvmebUEFdApYbXSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tHR-00A7Po-5X; Sun, 04 Dec 2022 17:59:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tE9-00A6ZD-Fn; Sun, 04 Dec 2022 17:56:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E612A60EE1;
	Sun,  4 Dec 2022 17:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5FAC433B5;
	Sun,  4 Dec 2022 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176591;
	bh=ARTuhir6BWBSEl/m8Qedtx8F7YcogAViI/5PbaogT2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m2m7mLIl9zDz4yS97Bx4+LiNE125jD/8nAhNnA79/8kLWV4e+09fZmc4kezNjbblX
	 KYX4fVdqDVSMIL2GodZR2WGaDxaNjRW75DSnBKVqbIBCFV26C/lUbPvW/DRjG3IOrW
	 e+w+a/c5BOyvOHSNA5q96o9dEJzV19Sq+7OZl8lTUu/lg6XiLQ6Ge0zwlRlYqN5dEe
	 DzoTurRKNzaV363DscDaDc+te4Cor1/POsc7P6fi0XDLJh7hi1DTiUxC36qOfdGEAF
	 lc6a1r4OMGIOYuoriEWSJ5nmIvXDFMrBOw+7nI5FPdyCts7RmBTYlE1IO3A9MSTu/P
	 eAEuxTAUqkRAg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Date: Mon,  5 Dec 2022 01:46:20 +0800
Message-Id: <20221204174632.3677-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095633_645613_CC0694DE 
X-CRM114-Status: GOOD (  17.01  )
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

Alternatives live in a different section, so offsets used by jal
instruction will point to wrong locations after the patch got applied.

Similar to arm64, adjust the location to consider that offset.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/alternative.h |  2 ++
 arch/riscv/kernel/alternative.c      | 38 ++++++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c       |  3 +++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index c58ec3cc4bc3..33eae9541684 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -29,6 +29,8 @@ void apply_module_alternatives(void *start, size_t length);
 
 void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
 				      int patch_offset);
+void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
+			       int patch_offset);
 
 struct alt_entry {
 	void *old_ptr;		 /* address of original instruciton or data  */
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 292cc42dc3be..9d88375624b5 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -125,6 +125,44 @@ void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
 	}
 }
 
+#define to_jal_imm(value)						\
+	(((value & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) | \
+	 ((value & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) | \
+	 ((value & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) | \
+	 ((value & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF))
+
+void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
+			       int patch_offset)
+{
+	int num_instr = len / sizeof(u32);
+	unsigned int call;
+	int i;
+	int imm;
+
+	for (i = 0; i < num_instr; i++) {
+		u32 inst = riscv_instruction_at(alt_ptr, i);
+
+		if (!riscv_insn_is_jal(inst))
+			continue;
+
+		/* get and adjust new target address */
+		imm = RV_EXTRACT_JTYPE_IMM(inst);
+		imm -= patch_offset;
+
+		/* pick the original jal */
+		call = inst;
+
+		/* drop the old IMMs, all jal imm bits sit at 31:12 */
+		call &= ~GENMASK(31, 12);
+
+		/* add the adapted IMMs */
+		call |= to_jal_imm(imm);
+
+		/* patch the call place again */
+		patch_text_nosync(alt_ptr + i * sizeof(u32), &call, 4);
+	}
+}
+
 /*
  * This is called very early in the boot process (directly after we run
  * a feature detect on the boot CPU). No need to worry about other CPUs
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ba62a4ff5ccd..c743f0adc794 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -324,6 +324,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
 							 alt->alt_len,
 							 alt->old_ptr - alt->alt_ptr);
+			riscv_alternative_fix_jal(alt->old_ptr,
+						  alt->alt_len,
+						  alt->old_ptr - alt->alt_ptr);
 		}
 	}
 }
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
