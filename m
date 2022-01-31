Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974B0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxJ989v/GT/qqoN2Zfref2FBvgbsYB5S7PBlguMt99M=; b=pgQ0my+0DWLWZo
	e34qZdneXJRyL/d2zYzYOF3wZ4in5LZV/NRtEMhk6gdvnYyqvGDTYd27f9AL3xXxJL13iDcU7kXbU
	zdgdVYfPSEtVR7IvSScoBQU67Esz7Ss6AxrOWFffhoVIzX2oepe3tgr0nWCqQlq8P4bbz7cjazWIl
	iZvpDiuO2q18fET5Bl2zDudP00stsfBfgqEGwEKxYo4cTf58fLPnTN3C7ABqYjIek7u633W4wclkO
	K6n+okzkkkeibZXR7U/EuALjIz9oRZZkVnvYA6UDT+IiXgC4qyOHOUjb9PfSivGEQMT9PmT0bXQzN
	w3FwjQc43fS21VPIAkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbJx-00AJJn-G3; Mon, 31 Jan 2022 18:22:33 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbJu-00AJGp-FY
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:22:32 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 i16-20020a056830011000b005a3cc8d20fbso7464270otp.9
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VzUOBCF2GRIbP/r2774p/6cI7x5/0EzMdeh+yBNP7rI=;
 b=oub429PueJm31LgnMD3pH3b7Ytyx8emLL41Zq6zcUa4Ac9LecCoCIisTsrdihuy+aV
 hysBr2RdqFqrfnv43tQCXA6nK7yE2Infe0v73ByNGRtn3aKkIrzZfKf2f2yaSFpLfLdt
 5q+/rsjTVauq3CykRcCSImm/yiWRvQfczIX1QXwyLFXdPeSqAxgEq8W15840uVEEgxEK
 ZkSRx4RIZ+5WGqptxDB/8E/p0q7yE4qwJKiM+NpK7nDp3RPg6NkCngyDxXfyQyQmKslH
 gwA2zQujQX85L86XUKOSzkW5nepWOeduGU6KaafvlbD7anyWHXEREN03zQYsm5BQCGxe
 FrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VzUOBCF2GRIbP/r2774p/6cI7x5/0EzMdeh+yBNP7rI=;
 b=NsNz/dDHnbGFCohzMi0jdgnKTB7p5oTJ8SR68namrACqfeaGVy+K1IRQctPsvQvyD4
 +khbPzu2HOyIrt4WW4pQjrhRETOV2piihVGX6JkQcBdkhXZJm+/i9IvWVBoZXFFW7pi8
 s+kzrU7Qan9ngmigOglHNE4wIyhTh3c2sEXcz2Rp5p4EvOKyvWYmPCGNf3rScYLBnPWS
 ORzAo/4oFSsInhrobzy89QwvJbwU5T43hKECfwBdAY22uNJxURg94/nTXy4L5cWF5AWd
 fKTUtsDtrQYbPrlHxIplK6ZsbdMBx4DgupTYEOcd/yDrB99PTn9Ai/RL9SCJEeFWQIXk
 rkVQ==
X-Gm-Message-State: AOAM530IFg9n+mSJNMjYo22A72Wi5NkNPpkGFDfwIjhctgmTPThQYFsI
 6A1mThPkXpgbbZPWZb5aQF1q9AbhRsY=
X-Google-Smtp-Source: ABdhPJxSvR0FJpFkc9AXRd05GifffZyOy4S9TISnMz/YVOCd3iz66E6DSDRLK6qfJAyKlhlHkidyxw==
X-Received: by 2002:a05:6830:1e11:: with SMTP id
 s17mr12013879otr.347.1643653349881; 
 Mon, 31 Jan 2022 10:22:29 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id t4sm12986340oie.14.2022.01.31.10.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:22:29 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] riscv: Use asm/insn.h for module relocations
Date: Mon, 31 Jan 2022 19:21:42 +0100
Message-Id: <20220131182145.236005-5-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131182145.236005-1-kernel@esmil.dk>
References: <20220131182145.236005-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102230_576766_A219F7CC 
X-CRM114-Status: GOOD (  15.51  )
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

This converts the module relocations in kernel/module.c to use
asm/insn.h for instruction manipulation.

Also RISC-V has a number of instruction pairs to
generate 32bit immediates or jump/call offsets. Eg.:

	lui   rd, hi20
	addi  rd, rd, lo12

..where hi20 is the upper 20bits to load into register rd and lo12 is
the lower 12bits. However both immediates are interpreted as two's
complement signed values. Hence the old code calculates hi20 and lo12
for 32bit immediates imm like this:

	hi20 = (imm + 0x800) & 0xfffff000;
	lo12 = (imm - hi20) & 0xfff;

This patch simplifies it to:

	hi20 = (imm + 0x800) & 0xfffff000;
	lo12 = imm & 0xfff;

..which amounts to the same: imm - hi20 may be become
negative/underflow, but it doesn't change the lower 12 bits.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/module.c | 138 +++++++++++++++----------------------
 1 file changed, 56 insertions(+), 82 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index a75ccf3a6ce8..2212d88776e0 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -2,6 +2,7 @@
 /*
  *
  *  Copyright (C) 2017 Zihao Yu
+ *  Copyright (C) 2020 Emil Renner Berthing
  */
 
 #include <linux/elf.h>
@@ -11,38 +12,27 @@
 #include <linux/vmalloc.h>
 #include <linux/sizes.h>
 #include <linux/pgtable.h>
+#include <asm/insn.h>
 #include <asm/sections.h>
 
-static inline bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
-{
-	if (IS_ENABLED(CONFIG_32BIT))
-		return true;
-
-	/*
-	 * auipc+jalr can reach any PC-relative offset in the range
-	 * [-2^31 - 2^11, 2^31 - 2^11)
-	 */
-	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
-}
-
-static int riscv_insn_rmw(void *location, u32 keep, u32 set)
+static int riscv_insn_rmw(void *location, u32 mask, u32 value)
 {
 	u16 *parcel = location;
 	u32 insn = (u32)parcel[0] | (u32)parcel[1] << 16;
 
-	insn &= keep;
-	insn |= set;
+	insn &= ~mask;
+	insn |= value;
 
 	parcel[0] = insn;
 	parcel[1] = insn >> 16;
 	return 0;
 }
 
-static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
+static int riscv_insn_rvc_rmw(void *location, u16 mask, u16 value)
 {
 	u16 *parcel = location;
 
-	*parcel = (*parcel & keep) | set;
+	*parcel = (*parcel & ~mask) | value;
 	return 0;
 }
 
@@ -67,55 +57,40 @@ static int apply_r_riscv_branch_rela(struct module *me, void *location,
 				     Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - location;
-	u32 imm12 = (offset & 0x1000) << (31 - 12);
-	u32 imm11 = (offset & 0x800) >> (11 - 7);
-	u32 imm10_5 = (offset & 0x7e0) << (30 - 10);
-	u32 imm4_1 = (offset & 0x1e) << (11 - 4);
 
-	return riscv_insn_rmw(location, 0x1fff07f, imm12 | imm11 | imm10_5 | imm4_1);
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_B_IMM_MASK,
+			      riscv_insn_b_imm(offset));
 }
 
 static int apply_r_riscv_jal_rela(struct module *me, void *location,
 				  Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - location;
-	u32 imm20 = (offset & 0x100000) << (31 - 20);
-	u32 imm19_12 = (offset & 0xff000);
-	u32 imm11 = (offset & 0x800) << (20 - 11);
-	u32 imm10_1 = (offset & 0x7fe) << (30 - 10);
 
-	return riscv_insn_rmw(location, 0xfff, imm20 | imm19_12 | imm11 | imm10_1);
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_J_IMM_MASK,
+			      riscv_insn_j_imm(offset));
 }
 
 static int apply_r_riscv_rvc_branch_rela(struct module *me, void *location,
 					 Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - location;
-	u16 imm8 = (offset & 0x100) << (12 - 8);
-	u16 imm7_6 = (offset & 0xc0) >> (6 - 5);
-	u16 imm5 = (offset & 0x20) >> (5 - 2);
-	u16 imm4_3 = (offset & 0x18) << (12 - 5);
-	u16 imm2_1 = (offset & 0x6) << (12 - 10);
-
-	return riscv_insn_rvc_rmw(location, 0xe383,
-			imm8 | imm7_6 | imm5 | imm4_3 | imm2_1);
+
+	return riscv_insn_rvc_rmw(location,
+				  RISCV_INSN_CB_IMM_MASK,
+				  riscv_insn_rvc_branch_imm(offset));
 }
 
 static int apply_r_riscv_rvc_jump_rela(struct module *me, void *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - location;
-	u16 imm11 = (offset & 0x800) << (12 - 11);
-	u16 imm10 = (offset & 0x400) >> (10 - 8);
-	u16 imm9_8 = (offset & 0x300) << (12 - 11);
-	u16 imm7 = (offset & 0x80) >> (7 - 6);
-	u16 imm6 = (offset & 0x40) << (12 - 11);
-	u16 imm5 = (offset & 0x20) >> (5 - 2);
-	u16 imm4 = (offset & 0x10) << (12 - 5);
-	u16 imm3_1 = (offset & 0xe) << (12 - 10);
-
-	return riscv_insn_rvc_rmw(location, 0xe003,
-			imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1);
+
+	return riscv_insn_rvc_rmw(location,
+				  RISCV_INSN_CJ_IMM_MASK,
+				  riscv_insn_rvc_jump_imm(offset));
 }
 
 static int apply_r_riscv_pcrel_hi20_rela(struct module *me, void *location,
@@ -130,30 +105,27 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, void *location,
 		return -EINVAL;
 	}
 
-	return riscv_insn_rmw(location, 0xfff, (offset + 0x800) & 0xfffff000);
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_U_IMM_MASK,
+			      riscv_insn_u_imm(offset + 0x800));
 }
 
 static int apply_r_riscv_pcrel_lo12_i_rela(struct module *me, void *location,
 					   Elf_Addr v)
 {
-	/*
-	 * v is the lo12 value to fill. It is calculated before calling this
-	 * handler.
-	 */
-	return riscv_insn_rmw(location, 0xfffff, (v & 0xfff) << 20);
+	/* v is already the relative offset */
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_I_IMM_MASK,
+			      riscv_insn_i_imm(v));
 }
 
 static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, void *location,
 					   Elf_Addr v)
 {
-	/*
-	 * v is the lo12 value to fill. It is calculated before calling this
-	 * handler.
-	 */
-	u32 imm11_5 = (v & 0xfe0) << (31 - 11);
-	u32 imm4_0 = (v & 0x1f) << (11 - 4);
-
-	return riscv_insn_rmw(location, 0x1fff07f, imm11_5 | imm4_0);
+	/* v is already the relative offset */
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_S_IMM_MASK,
+			      riscv_insn_s_imm(v));
 }
 
 static int apply_r_riscv_hi20_rela(struct module *me, void *location,
@@ -166,29 +138,27 @@ static int apply_r_riscv_hi20_rela(struct module *me, void *location,
 		return -EINVAL;
 	}
 
-	return riscv_insn_rmw(location, 0xfff, ((s32)v + 0x800) & 0xfffff000);
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_U_IMM_MASK,
+			      riscv_insn_u_imm(v + 0x800));
 }
 
 static int apply_r_riscv_lo12_i_rela(struct module *me, void *location,
 				     Elf_Addr v)
 {
 	/* Skip medlow checking because of filtering by HI20 already */
-	s32 hi20 = ((s32)v + 0x800) & 0xfffff000;
-	s32 lo12 = ((s32)v - hi20);
-
-	return riscv_insn_rmw(location, 0xfffff, (lo12 & 0xfff) << 20);
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_I_IMM_MASK,
+			      riscv_insn_i_imm(v));
 }
 
 static int apply_r_riscv_lo12_s_rela(struct module *me, void *location,
 				     Elf_Addr v)
 {
 	/* Skip medlow checking because of filtering by HI20 already */
-	s32 hi20 = ((s32)v + 0x800) & 0xfffff000;
-	s32 lo12 = ((s32)v - hi20);
-	u32 imm11_5 = (lo12 & 0xfe0) << (31 - 11);
-	u32 imm4_0 = (lo12 & 0x1f) << (11 - 4);
-
-	return riscv_insn_rmw(location, 0x1fff07f, imm11_5 | imm4_0);
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_S_IMM_MASK,
+			      riscv_insn_s_imm(v));
 }
 
 static int apply_r_riscv_got_hi20_rela(struct module *me, void *location,
@@ -206,14 +176,15 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, void *location,
 		return -EINVAL;
 	}
 
-	return riscv_insn_rmw(location, 0xfff, (offset + 0x800) & 0xfffff000);
+	return riscv_insn_rmw(location,
+			      RISCV_INSN_U_IMM_MASK,
+			      riscv_insn_u_imm(offset + 0x800));
 }
 
 static int apply_r_riscv_call_plt_rela(struct module *me, void *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - location;
-	u32 hi20, lo12;
 
 	if (!riscv_insn_valid_32bit_offset(offset)) {
 		/* Only emit the plt entry if offset over 32-bit range */
@@ -227,17 +198,18 @@ static int apply_r_riscv_call_plt_rela(struct module *me, void *location,
 		}
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	lo12 = (offset - hi20) & 0xfff;
-	riscv_insn_rmw(location, 0xfff, hi20);
-	return riscv_insn_rmw(location + 4, 0xfffff, lo12 << 20);
+	riscv_insn_rmw(location,
+		       RISCV_INSN_U_IMM_MASK,
+		       riscv_insn_u_imm(offset + 0x800));
+	return riscv_insn_rmw(location + 4,
+			      RISCV_INSN_I_IMM_MASK,
+			      riscv_insn_i_imm(offset));
 }
 
 static int apply_r_riscv_call_rela(struct module *me, void *location,
 				   Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - location;
-	u32 hi20, lo12;
 
 	if (!riscv_insn_valid_32bit_offset(offset)) {
 		pr_err(
@@ -246,10 +218,12 @@ static int apply_r_riscv_call_rela(struct module *me, void *location,
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	lo12 = (offset - hi20) & 0xfff;
-	riscv_insn_rmw(location, 0xfff, hi20);
-	return riscv_insn_rmw(location + 4, 0xfffff, lo12 << 20);
+	riscv_insn_rmw(location,
+		       RISCV_INSN_U_IMM_MASK,
+		       riscv_insn_u_imm(offset + 0x800));
+	return riscv_insn_rmw(location + 4,
+			      RISCV_INSN_I_IMM_MASK,
+			      riscv_insn_i_imm(offset));
 }
 
 static int apply_r_riscv_relax_rela(struct module *me, void *location,
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
