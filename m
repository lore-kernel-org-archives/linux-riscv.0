Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140EEC433EA
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 15:25:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFC7420658
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 15:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXtUVBxN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASuVmEsM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFC7420658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0d3lIUp1Mx33eKrhnWn/SLjEljUO/pmJ6cKBdtdtjHs=; b=TXtUVBxNJoVdR86C2Ek6LaLAv
	NYuNIY5PPYH44HvFkc4yDJB+c4viLhIFNOcCNNMznGQInJd06koCJH4Tm9DU+l36wuUBqAFHgRoIQ
	2Evtx75V8hhLclsFtcb3vZUkpFM/hfYKHEDjhf/dwx8D5gMqX8hnhp8PeOkePIgKfPhCfs2ErYTND
	dL7Dr2A88cTLncUaDL9/5B73CXL+IHeY36uNHHSP5K27m+otcqjrTujwUfdJVctzdrFnCoRb3AO9c
	oJJHlbIUUpCcKbMfQvt8m8DB3ft0ABhPQyMWil5ysEwxwHsna5txXUn53qsNZfb0oJSTBFoZcEdER
	QaRVP8pjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGcO-0006EV-RM; Wed, 22 Jul 2020 15:25:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGcI-0006C7-1T
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 15:25:12 +0000
Received: by mail-wr1-x443.google.com with SMTP id f7so2326962wrw.1
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2020 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OwvBdzIoU9cc/pobR9mxvBnL6043dbqvY4avJ3y2AY=;
 b=ASuVmEsMGK2RT7ozX81teicrktOQ8fqt0vFs9VFlIhnVVSKQ4P7AxfEK47NAbEnuvc
 aqeyu2xBF9IGKE7uLCI2XjFKVOJWhbmKOmrFke6R6vxVJbYkBYQ/oU4A23sWKCxtpv7y
 ZVj8f1jM+SNBSqg2uZ4cR/7wUoXwc4UlTMVOZXnXgaYZ6zgayLZQDp8mY/AtIE/Qt1PA
 bBqc0ePyVEtY+GM664XMQcQlWdCNhVCVRtbhnjEqDuJn5d+FjUUWWVNKnUUgOv8DfL7q
 ppegf2eE7+Rgak1CO8S5EeIpZsx5nLaR1VIpJmmGAdLZmaIFZgTGmTSv+OmWb72+FjZy
 b57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4OwvBdzIoU9cc/pobR9mxvBnL6043dbqvY4avJ3y2AY=;
 b=K1MSh/cZXY39Z2gR+bp8JLMUkSjK/9xoNiENE7vrOdUm29B+zecFvDs+BXMypXrazA
 uSNzWSESZtmU5p//nfsMUTFtWyMdTAGisWMIpiOA5t7XY7oHSkS7nLum8li6EnpVIRGm
 cXQjZA3DM/TgX0No7nPWma5cK2rABR2L+bGUmrcZdpOh26xFPH6CgUvZBkIgexKj2iC5
 1ZzZYZkOz8N3ETgGeNrO9CEv0L2EXTrV1E2aT3cMBLGvzVz1tkjJziNR1SzAjJvoQqGl
 u6HMiIKORfXbgT5v7ThfLYWX9PTgDtA7jJF5BqKb6KWFtRUP96TAQIVtgyBkH2kdeWUz
 reZQ==
X-Gm-Message-State: AOAM5319v2DJ/uHF2tljkLmmDWQGfrclUErQX+MphxcRIy2kkIT+3Ch/
 KzR+/I9mSIS73oXX3bpDEWnPqjeggMRHrg==
X-Google-Smtp-Source: ABdhPJwYyEBjin5uDO/UwUSwNNUC5RWgWEIJghMtZPpLgyiDjsKXbk6nMnXNdR6hcxPuJRrtCeW1gQ==
X-Received: by 2002:adf:de91:: with SMTP id w17mr124434wrl.108.1595431508462; 
 Wed, 22 Jul 2020 08:25:08 -0700 (PDT)
Received: from localhost.localdomain ([80.71.140.73])
 by smtp.gmail.com with ESMTPSA id 60sm298547wrs.20.2020.07.22.08.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 08:25:07 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/2] riscv: Clean up module relocations
Date: Wed, 22 Jul 2020 17:24:22 +0200
Message-Id: <20200722152422.72532-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722152422.72532-1-kernel@esmil.dk>
References: <20200722152422.72532-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_112510_250658_59A8CE91 
X-CRM114-Status: GOOD (  19.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-kernel@vger.kernel.org, Zong Li <zong@andestech.com>,
 Luke Nelson <lukenels@cs.washington.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Factor out generation of different types of immediates.

Also RISC-V has a number of instruction pairs to
generate 32bit immediates or jump/call offsets. Eg.:

lui   rd, hi20
addi  rd, rd, lo12

..where hi20 is the upper 20bits to load into register rd
and lo12 is the lower 12bits. However lo12 is interpreted
as a signed 12bit value. Hence the old code calculates
hi20 and lo12 for 32bit immediates imm like this:

hi20 = (imm + 0x800) & 0xfffff000;
lo12 = (imm - hi20) & 0xfff;

This patch simplifies it to:

hi20 = (imm + 0x800) & 0xfffff000;
lo12 = imm & 0xfff;

..which amounts to the same: imm - hi20 may be become
negative/underflow, but it doesn't change the lower 12 bits.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---

My hope is that we can eventually factor out the code to generate
immediates and instructions so it can be reused both here, in the
jump-label code and in the bpf-jit code, but let's take it
one step at a time.

/Emil

 arch/riscv/kernel/module.c | 290 +++++++++++++++++++++----------------
 1 file changed, 163 insertions(+), 127 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 05b2162d96be..7a80aaaa56a1 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -2,8 +2,10 @@
 /*
  *
  *  Copyright (C) 2017 Zihao Yu
+ *  Copyright (C) 2020 Emil Renner Berthing
  */
 
+#include <linux/bits.h>
 #include <linux/elf.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -13,24 +15,91 @@
 #include <linux/pgtable.h>
 #include <asm/sections.h>
 
-static int riscv_insn_rmw(u8 *location, u32 keep, u32 set)
+#define RISCV_INSN_I_IMM_MASK 0xfff00000U
+#define RISCV_INSN_S_IMM_MASK 0xfe000f80U
+#define RISCV_INSN_B_IMM_MASK 0xfe000f80U
+#define RISCV_INSN_U_IMM_MASK 0xfffff000U
+#define RISCV_INSN_J_IMM_MASK 0xfffff000U
+
+#define RISCV_INSN_CI_IMM_MASK  0x107cU
+#define RISCV_INSN_CSS_IMM_MASK 0x1f80U
+#define RISCV_INSN_CIW_IMM_MASK 0x1fe0U
+#define RISCV_INSN_CL_IMM_MASK  0x1c60U
+#define RISCV_INSN_CS_IMM_MASK  0x1c60U
+#define RISCV_INSN_CB_IMM_MASK  0x1c7cU
+#define RISCV_INSN_CJ_IMM_MASK  0x1ffcU
+
+static u32 riscv_insn_i_imm(u32 imm)
+{
+	return (imm & GENMASK(11, 0)) << 20;
+}
+
+static u32 riscv_insn_s_imm(u32 imm)
+{
+	return (imm & GENMASK( 4, 0)) << ( 7 - 0) |
+	       (imm & GENMASK(11, 5)) << (25 - 5);
+}
+
+static u32 riscv_insn_b_imm(u32 imm)
+{
+	return (imm & GENMASK(11, 11)) >> (11 -  7) |
+	       (imm & GENMASK( 4,  1)) << ( 8 -  1) |
+	       (imm & GENMASK(10,  5)) << (25 -  5) |
+	       (imm & GENMASK(12, 12)) << (31 - 12);
+}
+
+static u32 riscv_insn_u_imm(u32 imm)
+{
+	return imm & GENMASK(31, 12);
+}
+
+static u32 riscv_insn_j_imm(u32 imm)
+{
+	return (imm & GENMASK(19, 12)) << (12 - 12) |
+	       (imm & GENMASK(11, 11)) << (20 - 11) |
+	       (imm & GENMASK(10,  1)) << (21 -  1) |
+	       (imm & GENMASK(20, 20)) << (31 - 20);
+}
+
+static u16 riscv_insn_rvc_branch_imm(u16 imm)
+{
+	return (imm & GENMASK(5, 5)) >> ( 5 - 2) |
+	       (imm & GENMASK(2, 1)) << ( 3 - 1) |
+	       (imm & GENMASK(7, 6)) >> ( 6 - 5) |
+	       (imm & GENMASK(4, 3)) << (10 - 3) |
+	       (imm & GENMASK(8, 8)) << (12 - 8);
+}
+
+static u16 riscv_insn_rvc_jump_imm(u16 imm)
+{
+	return (imm & GENMASK( 5,  5)) >> ( 5 -  2) |
+	       (imm & GENMASK( 3,  1)) << ( 3 -  1) |
+	       (imm & GENMASK( 7,  7)) >> ( 7 -  6) |
+	       (imm & GENMASK( 6,  6)) << ( 7 -  6) |
+	       (imm & GENMASK(10, 10)) >> (10 -  8) |
+	       (imm & GENMASK( 9,  8)) << ( 9 -  8) |
+	       (imm & GENMASK( 4,  4)) << (11 -  4) |
+	       (imm & GENMASK(11, 11)) << (12 - 11);
+}
+
+static int riscv_insn_rmw(u8 *location, u32 mask, u32 value)
 {
 	u16 *parcel = (u16 *)location;
 	u32 insn = (u32)parcel[0] | (u32)parcel[1] << 16;
 
-	insn &= keep;
-	insn |= set;
+	insn &= ~mask;
+	insn |= value;
 
 	parcel[0] = insn;
 	parcel[1] = insn >> 16;
 	return 0;
 }
 
-static int riscv_insn_rvc_rmw(u8 *location, u16 keep, u16 set)
+static int riscv_insn_rvc_rmw(u8 *location, u16 mask, u16 value)
 {
 	u16 *parcel = (u16 *)location;
 
-	*parcel = (*parcel & keep) | set;
+	*parcel = (*parcel & ~mask) | value;
 	return 0;
 }
 
@@ -55,55 +124,40 @@ static int apply_r_riscv_branch_rela(struct module *me, u8 *location,
 				     Elf_Addr v)
 {
 	ptrdiff_t offset = (u8 *)v - location;
-	u32 imm12 = (offset & 0x1000) << (31 - 12);
-	u32 imm11 = (offset & 0x800) >> (11 - 7);
-	u32 imm10_5 = (offset & 0x7e0) << (30 - 10);
-	u32 imm4_1 = (offset & 0x1e) << (11 - 4);
 
-	return riscv_insn_rmw(location, 0x1fff07f, imm12 | imm11 | imm10_5 | imm4_1);
+	return riscv_insn_rmw(location,
+			RISCV_INSN_B_IMM_MASK,
+			riscv_insn_b_imm(offset));
 }
 
 static int apply_r_riscv_jal_rela(struct module *me, u8 *location,
 				  Elf_Addr v)
 {
 	ptrdiff_t offset = (u8 *)v - location;
-	u32 imm20 = (offset & 0x100000) << (31 - 20);
-	u32 imm19_12 = (offset & 0xff000);
-	u32 imm11 = (offset & 0x800) << (20 - 11);
-	u32 imm10_1 = (offset & 0x7fe) << (30 - 10);
 
-	return riscv_insn_rmw(location, 0xfff, imm20 | imm19_12 | imm11 | imm10_1);
+	return riscv_insn_rmw(location,
+			RISCV_INSN_J_IMM_MASK,
+			riscv_insn_j_imm(offset));
 }
 
 static int apply_r_riscv_rvc_branch_rela(struct module *me, u8 *location,
 					 Elf_Addr v)
 {
 	ptrdiff_t offset = (u8 *)v - location;
-	u16 imm8 = (offset & 0x100) << (12 - 8);
-	u16 imm7_6 = (offset & 0xc0) >> (6 - 5);
-	u16 imm5 = (offset & 0x20) >> (5 - 2);
-	u16 imm4_3 = (offset & 0x18) << (12 - 5);
-	u16 imm2_1 = (offset & 0x6) << (12 - 10);
 
-	return riscv_insn_rvc_rmw(location, 0xe383,
-			imm8 | imm7_6 | imm5 | imm4_3 | imm2_1);
+	return riscv_insn_rvc_rmw(location,
+			RISCV_INSN_CB_IMM_MASK,
+			riscv_insn_rvc_branch_imm(offset));
 }
 
 static int apply_r_riscv_rvc_jump_rela(struct module *me, u8 *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (u8 *)v - location;
-	u16 imm11 = (offset & 0x800) << (12 - 11);
-	u16 imm10 = (offset & 0x400) >> (10 - 8);
-	u16 imm9_8 = (offset & 0x300) << (12 - 11);
-	u16 imm7 = (offset & 0x80) >> (7 - 6);
-	u16 imm6 = (offset & 0x40) << (12 - 11);
-	u16 imm5 = (offset & 0x20) >> (5 - 2);
-	u16 imm4 = (offset & 0x10) << (12 - 5);
-	u16 imm3_1 = (offset & 0xe) << (12 - 10);
 
-	return riscv_insn_rvc_rmw(location, 0xe003,
-			imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1);
+	return riscv_insn_rvc_rmw(location,
+			RISCV_INSN_CJ_IMM_MASK,
+			riscv_insn_rvc_jump_imm(offset));
 }
 
 static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u8 *location,
@@ -118,30 +172,27 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u8 *location,
 		return -EINVAL;
 	}
 
-	return riscv_insn_rmw(location, 0xfff, (offset + 0x800) & 0xfffff000);
+	return riscv_insn_rmw(location,
+			RISCV_INSN_U_IMM_MASK,
+			riscv_insn_u_imm(offset + 0x800));
 }
 
 static int apply_r_riscv_pcrel_lo12_i_rela(struct module *me, u8 *location,
 					   Elf_Addr v)
 {
-	/*
-	 * v is the lo12 value to fill. It is calculated before calling this
-	 * handler.
-	 */
-	return riscv_insn_rmw(location, 0xfffff, (v & 0xfff) << 20);
+	/* v is already the relative offset */
+	return riscv_insn_rmw(location,
+			RISCV_INSN_I_IMM_MASK,
+			riscv_insn_i_imm(v));
 }
 
 static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u8 *location,
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
+			RISCV_INSN_S_IMM_MASK,
+			riscv_insn_s_imm(v));
 }
 
 static int apply_r_riscv_hi20_rela(struct module *me, u8 *location,
@@ -154,29 +205,27 @@ static int apply_r_riscv_hi20_rela(struct module *me, u8 *location,
 		return -EINVAL;
 	}
 
-	return riscv_insn_rmw(location, 0xfff, ((s32)v + 0x800) & 0xfffff000);
+	return riscv_insn_rmw(location,
+			RISCV_INSN_U_IMM_MASK,
+			riscv_insn_u_imm(v + 0x800));
 }
 
 static int apply_r_riscv_lo12_i_rela(struct module *me, u8 *location,
 				     Elf_Addr v)
 {
 	/* Skip medlow checking because of filtering by HI20 already */
-	s32 hi20 = ((s32)v + 0x800) & 0xfffff000;
-	s32 lo12 = ((s32)v - hi20);
-
-	return riscv_insn_rmw(location, 0xfffff, (lo12 & 0xfff) << 20);
+	return riscv_insn_rmw(location,
+			RISCV_INSN_I_IMM_MASK,
+			riscv_insn_i_imm(v));
 }
 
 static int apply_r_riscv_lo12_s_rela(struct module *me, u8 *location,
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
+			RISCV_INSN_S_IMM_MASK,
+			riscv_insn_s_imm(v));
 }
 
 static int apply_r_riscv_got_hi20_rela(struct module *me, u8 *location,
@@ -195,17 +244,17 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u8 *location,
 		return -EINVAL;
 	}
 
-	return riscv_insn_rmw(location, 0xfff, (offset + 0x800) & 0xfffff000);
+	return riscv_insn_rmw(location,
+			RISCV_INSN_U_IMM_MASK,
+			riscv_insn_u_imm(offset + 0x800));
 }
 
 static int apply_r_riscv_call_plt_rela(struct module *me, u8 *location,
 				       Elf_Addr v)
 {
 	ptrdiff_t offset = (u8 *)v - location;
-	s32 fill_v = offset;
-	u32 hi20, lo12;
 
-	if (offset != fill_v) {
+	if (offset != (s32)offset) {
 		/* Only emit the plt entry if offset over 32-bit range */
 		if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
 			unsigned long entry = module_emit_plt_entry(me, v);
@@ -218,30 +267,32 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u8 *location,
 		}
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	lo12 = (offset - hi20) & 0xfff;
-	riscv_insn_rmw(location, 0xfff, hi20);
-	return riscv_insn_rmw(location + 4, 0xfffff, lo12 << 20);
+	riscv_insn_rmw(location,
+			RISCV_INSN_U_IMM_MASK,
+			riscv_insn_u_imm(offset + 0x800));
+	return riscv_insn_rmw(location + 4,
+			RISCV_INSN_I_IMM_MASK,
+			riscv_insn_i_imm(offset));
 }
 
 static int apply_r_riscv_call_rela(struct module *me, u8 *location,
 				   Elf_Addr v)
 {
 	ptrdiff_t offset = (u8 *)v - location;
-	s32 fill_v = offset;
-	u32 hi20, lo12;
 
-	if (offset != fill_v) {
+	if (offset != (s32)offset) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
 		  me->name, (long long)v, location);
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	lo12 = (offset - hi20) & 0xfff;
-	riscv_insn_rmw(location, 0xfff, hi20);
-	return riscv_insn_rmw(location + 4, 0xfffff, lo12 << 20);
+	riscv_insn_rmw(location,
+			RISCV_INSN_U_IMM_MASK,
+			riscv_insn_u_imm(offset + 0x800));
+	return riscv_insn_rmw(location + 4,
+			RISCV_INSN_I_IMM_MASK,
+			riscv_insn_i_imm(offset));
 }
 
 static int apply_r_riscv_relax_rela(struct module *me, u8 *location,
@@ -287,7 +338,7 @@ static int apply_r_riscv_sub64_rela(struct module *me, u8 *location,
 	return 0;
 }
 
-static int (*reloc_handlers_rela[]) (struct module *me, u8 *location,
+static int (*reloc_handlers_rela[])(struct module *me, u8 *location,
 				Elf_Addr v) = {
 	[R_RISCV_32]			= apply_r_riscv_32_rela,
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
@@ -316,24 +367,23 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		       unsigned int symindex, unsigned int relsec,
 		       struct module *me)
 {
-	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
-	int (*handler)(struct module *me, u8 *location, Elf_Addr v);
-	Elf_Sym *sym;
-	u8 *location;
-	unsigned int i, type;
-	Elf_Addr v;
-	int res;
+	Elf_Rela *rel = (Elf_Rela *)sechdrs[relsec].sh_addr;
+	unsigned int entries = sechdrs[relsec].sh_size / sizeof(*rel);
+	unsigned int i;
 
 	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 
-	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
-		/* This is where to make the change */
-		location = (u8 *)sechdrs[sechdrs[relsec].sh_info].sh_addr
-			+ rel[i].r_offset;
-		/* This is the symbol it is referring to */
-		sym = (Elf_Sym *)sechdrs[symindex].sh_addr
+	for (i = 0; i < entries; i++) {
+		Elf_Sym *sym = (Elf_Sym *)sechdrs[symindex].sh_addr
 			+ ELF_RISCV_R_SYM(rel[i].r_info);
+		Elf_Addr loc = sechdrs[sechdrs[relsec].sh_info].sh_addr
+			+ rel[i].r_offset;
+		unsigned int type = ELF_RISCV_R_TYPE(rel[i].r_info);
+		int (*handler)(struct module *me, u8 *location, Elf_Addr v);
+		Elf_Addr v;
+		int res;
+
 		if (IS_ERR_VALUE(sym->st_value)) {
 			/* Ignore unresolved weak symbol */
 			if (ELF_ST_BIND(sym->st_info) == STB_WEAK)
@@ -343,8 +393,6 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			return -ENOENT;
 		}
 
-		type = ELF_RISCV_R_TYPE(rel[i].r_info);
-
 		if (type < ARRAY_SIZE(reloc_handlers_rela))
 			handler = reloc_handlers_rela[type];
 		else
@@ -361,48 +409,36 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
 			unsigned int j;
 
-			for (j = 0; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
-				unsigned long hi20_loc =
-					sechdrs[sechdrs[relsec].sh_info].sh_addr
+			/* find the corresponding HI20 entry */
+			for (j = 0; j < entries; j++) {
+				Elf_Sym *hi20_sym = (Elf_Sym *)sechdrs[symindex].sh_addr
+					+ ELF_RISCV_R_SYM(rel[j].r_info);
+				Elf_Addr hi20_loc = sechdrs[sechdrs[relsec].sh_info].sh_addr
 					+ rel[j].r_offset;
-				u32 hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
-
-				/* Find the corresponding HI20 relocation entry */
-				if (hi20_loc == sym->st_value
-				    && (hi20_type == R_RISCV_PCREL_HI20
-					|| hi20_type == R_RISCV_GOT_HI20)) {
-					s32 hi20, lo12;
-					Elf_Sym *hi20_sym =
-						(Elf_Sym *)sechdrs[symindex].sh_addr
-						+ ELF_RISCV_R_SYM(rel[j].r_info);
-					unsigned long hi20_sym_val =
-						hi20_sym->st_value
-						+ rel[j].r_addend;
-
-					/* Calculate lo12 */
-					size_t offset = hi20_sym_val - hi20_loc;
-					if (IS_ENABLED(CONFIG_MODULE_SECTIONS)
-					    && hi20_type == R_RISCV_GOT_HI20) {
-						offset = module_emit_got_entry(
-							 me, hi20_sym_val);
-						offset = offset - hi20_loc;
-					}
-					hi20 = (offset + 0x800) & 0xfffff000;
-					lo12 = offset - hi20;
-					v = lo12;
-
-					break;
-				}
-			}
-			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
-				pr_err(
-				  "%s: Can not find HI20 relocation information\n",
-				  me->name);
-				return -EINVAL;
+				unsigned int hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
+
+				if (hi20_loc != sym->st_value ||
+						(hi20_type != R_RISCV_PCREL_HI20 &&
+						 hi20_type != R_RISCV_GOT_HI20))
+					continue;
+
+				/* calculate relative offset */
+				v = hi20_sym->st_value + rel[j].r_addend;
+
+				if (IS_ENABLED(CONFIG_MODULE_SECTIONS) &&
+						hi20_type == R_RISCV_GOT_HI20)
+					v = module_emit_got_entry(me, v);
+
+				v -= hi20_loc;
+				goto handle_reloc;
 			}
-		}
 
-		res = handler(me, location, v);
+			pr_err("%s: Cannot find HI20 relocation information\n",
+					me->name);
+			return -EINVAL;
+		}
+handle_reloc:
+		res = handler(me, (u8 *)loc, v);
 		if (res)
 			return res;
 	}
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
