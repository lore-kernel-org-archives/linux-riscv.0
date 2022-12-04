Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AA1C47089
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Dec 2022 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Obe/U0LpY8ruqP99YvjKxZlkpEqjN/Sqb9o3WAgg3lU=; b=otzTmxhSE9faSN
	/CAkPtpbT6lTajyk9IbzVsn87++yRJhYMDKghT/xBd7hbk4E9M1nWWe6Bg7mt2w0OpT4CfuYgX8eK
	uz0yT8+ZaCmQKXEwJKqyVgDtSOnvcJhQl2zarCQop4bkHP1wT38SW86RvtrjQ5/tGRwYM+QkyxvkY
	xl+knpVEJLmj3Pl1fKFvcZsprE1BAz1c7YuaNN/Th1p3xa+QoP4O5yWCEir2mIe4Sk47Y0kov19pU
	HjdBPz+VcY/eaF+haSFWxKYPL2xJkVJgKuKEwAnxYKnLLHGutqjbniz9mYoIr554ozksZRoXPZYvi
	CtO0O/EsVz0rrt4OfAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tHu-00A7l6-Kd; Sun, 04 Dec 2022 18:00:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tEW-00A6gs-Ft; Sun, 04 Dec 2022 17:56:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F21DCB80B89;
	Sun,  4 Dec 2022 17:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACFAC433D7;
	Sun,  4 Dec 2022 17:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670176613;
	bh=Jk4giilYCgEl05yNiJJydSOU/OvQdWbNth2qlSiEbPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lfZ0AoodqpOBr4UfFThRkbljp0ErAl7VNyVaoMVs+nmG9oQKFhdXp0UJZEKSUAtOp
	 BEbu/xA3E6cb1JR82tfNBA35B1ovQ4kBiGhaaMpxc5wD5mKiBEPtuIaq4nszh+j7wc
	 SHqUpVgrpumtJDrdrt4Y8O85z+arFix0SV0y0vDPPOeS4eu+QHaD94UCxkF61UaHjX
	 f5e48YyVzbU7qTfRGTiluAUSHlxVDtfbBPiySD6Yv7PyFLraV3g+fip5xOFCK9C4BI
	 OGZH+g+cWhNYx8sQhrGr9vQcK3DoS/XSY6dpLJwbttkHL5E5Bw/YVtQJkZRedTnA16
	 DEEjV6p82Cg9w==
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
Subject: [PATCH v2 09/13] riscv: switch to relative alternative entries
Date: Mon,  5 Dec 2022 01:46:28 +0800
Message-Id: <20221204174632.3677-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221204174632.3677-1-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_095656_839104_3361D1C4 
X-CRM114-Status: GOOD (  16.12  )
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

Instead of using absolute addresses for both the old instrucions and
the alternative instructions, use offsets relative to the alt_entry
values. So we can not only cut the size of the alternative entry, but
also meet the prerequisite for patching alternatives in the vDSO,
since absolute alternative entries are subject to dynamic relocation,
which is incompatible with the vDSO building.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/sifive/errata.c           |  4 +++-
 arch/riscv/errata/thead/errata.c            | 11 ++++++++---
 arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
 arch/riscv/include/asm/alternative.h        | 12 ++++++------
 arch/riscv/kernel/cpufeature.c              | 13 ++++++-------
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 1031038423e7..0e537cdfd324 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -107,7 +107,9 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
 
 		tmp = (1U << alt->errata_id);
 		if (cpu_req_errata & tmp) {
-			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+			patch_text_nosync((void *)&alt->old_offset + alt->old_offset,
+					  (void *)&alt->alt_offset + alt->alt_offset,
+					  alt->alt_len);
 			cpu_apply_errata |= tmp;
 		}
 	}
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 21546937db39..2a6e335b5a32 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -68,6 +68,7 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 	struct alt_entry *alt;
 	u32 cpu_req_errata = thead_errata_probe(stage, archid, impid);
 	u32 tmp;
+	void *oldptr, *updptr;
 
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != THEAD_VENDOR_ID)
@@ -77,12 +78,16 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
 
 		tmp = (1U << alt->errata_id);
 		if (cpu_req_errata & tmp) {
+			oldptr = (void *)&alt->old_offset + alt->old_offset;
+			updptr = (void *)&alt->alt_offset + alt->alt_offset;
+
 			/* On vm-alternatives, the mmu isn't running yet */
 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
-				memcpy((void *)__pa_symbol(alt->old_ptr),
-				       (void *)__pa_symbol(alt->alt_ptr), alt->alt_len);
+				memcpy((void *)__pa_symbol(oldptr),
+				       (void *)__pa_symbol(updptr),
+				       alt->alt_len);
 			else
-				patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+				patch_text_nosync(oldptr, updptr, alt->alt_len);
 		}
 	}
 
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index ec2f3f1b836f..dd40727bc859 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -7,11 +7,11 @@
 #ifdef __ASSEMBLY__
 
 .macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
-	RISCV_PTR \oldptr
-	RISCV_PTR \newptr
-	REG_ASM \vendor_id
-	REG_ASM \new_len
-	.word	\errata_id
+	.long \oldptr - .
+	.long \newptr - .
+	.short \vendor_id
+	.short \new_len
+	.long \errata_id
 .endm
 
 .macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
@@ -75,11 +75,11 @@
 #include <linux/stringify.h>
 
 #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
-	RISCV_PTR " " oldptr "\n"					\
-	RISCV_PTR " " newptr "\n"					\
-	REG_ASM " " vendor_id "\n"					\
-	REG_ASM " " newlen "\n"						\
-	".word " errata_id "\n"
+	".long	((" oldptr ") - .) \n"					\
+	".long	((" newptr ") - .) \n"					\
+	".short	" vendor_id "\n"					\
+	".short	" newlen "\n"						\
+	".long	" errata_id "\n"
 
 #define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)		\
 	".if " __stringify(enable) " == 1\n"				\
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 33eae9541684..3baf32e05b46 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -33,12 +33,12 @@ void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
 			       int patch_offset);
 
 struct alt_entry {
-	void *old_ptr;		 /* address of original instruciton or data  */
-	void *alt_ptr;		 /* address of replacement instruction or data */
-	unsigned long vendor_id; /* cpu vendor id */
-	unsigned long alt_len;   /* The replacement size */
-	unsigned int errata_id;  /* The errata id */
-} __packed;
+	s32 old_offset;		/* offset to original instruciton or data  */
+	s32 alt_offset;		/* offset to replacement instruction or data */
+	u16 vendor_id;		/* cpu vendor id */
+	u16 alt_len;		/* The replacement size */
+	u32 errata_id;		/* The errata id */
+};
 
 struct errata_checkfunc_id {
 	unsigned long vendor_id;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6244be5cd94a..adeac90b1d8e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -257,6 +257,7 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  unsigned int stage)
 {
 	struct alt_entry *alt;
+	void *oldptr, *updptr;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
@@ -270,17 +271,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 			continue;
 		}
 
+		oldptr = (void *)&alt->old_offset + alt->old_offset;
+		updptr = (void *)&alt->alt_offset + alt->alt_offset;
 		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
 			continue;
 
 		/* do the basic patching */
-		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
-		riscv_alternative_fix_auipc_jalr(alt->old_ptr,
-						 alt->alt_len,
-						 alt->old_ptr - alt->alt_ptr);
-		riscv_alternative_fix_jal(alt->old_ptr,
-					  alt->alt_len,
-					  alt->old_ptr - alt->alt_ptr);
+		patch_text_nosync(oldptr, updptr, alt->alt_len);
+		riscv_alternative_fix_auipc_jalr(oldptr, alt->alt_len, oldptr - updptr);
+		riscv_alternative_fix_jal(oldptr, alt->alt_len,	oldptr - updptr);
 	}
 }
 #endif
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
