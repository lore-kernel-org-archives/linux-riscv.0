Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FD1C433E7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 15:25:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B34C20658
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 15:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nTzynWvQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vLK9x+S1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B34C20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yOZkx5qewoSrnR/O0ONreUYlMR50AhKk+UpIIVCgekI=; b=nTzynWvQ1c4Gom4QHxEScGYJKq
	MNtm8BpxPoKRbeAUY5OHR1KMkGGAVkf+JKXIOlD4Y6SGMgwFk61SNanCqLGeXzYEQUsgtGWDn73D7
	kK9prceKJ6ySail1gwIZK/4//hc1SnghKHLpz4E/u9KhkyyfnCqYu8cwZb38201Ss0tsmomfr0LWB
	nvylEl75DqKQBb47KMmWOzoUndhW9vxOSQOmIgrpsy2cMd7Y3y6y1JeM9wRWaZSYwjmV3hloaCVPb
	YJ9i6Wm0C4zQszgJ0S4IwIR2u/9IL1ZAE97GSQSSzFhXXkC93p21EroqZoc/FQNjy8t7DyClpbe0i
	7Jq+9bpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGcM-0006Cy-23; Wed, 22 Jul 2020 15:25:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGcC-0006AJ-FX
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 15:25:07 +0000
Received: by mail-wr1-x443.google.com with SMTP id f18so2330087wrs.0
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2020 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xEIOMdwGFkXLsa3OG/EQPIdG5i9C3NmRKDXEkteaRLE=;
 b=vLK9x+S1ILBOzuMNSOn9QcOwrVgYzPbtmpoc+zjbMHh5p3IkWe1D/H6kKKMIYKwsc1
 FeL20gyL+HgGvjtrEjP8A7lroK3Xy0eW76N2vUt2ucZxY1ql6/CibQhy9fM++alRtL3v
 zVWsWrhAZrRlEUWGcAwaFBlB3OJ/oUWjs3ttcYDW4oy/SkPkPy6m2syIsc9QkZODCtCG
 OoKO11w0T85su8GXRlmLV0Ya9Lvao/0M+D5bKPF5N+Pe/HLcLKh5wCcYpzJfsH0QjU3F
 drlmdUmDxhhH3FIEBKgY2PUlJTOLWIaiih11l6PAbaIFnykDPjRHtYZf3uRpA8TRsPBd
 Jnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xEIOMdwGFkXLsa3OG/EQPIdG5i9C3NmRKDXEkteaRLE=;
 b=kGPASRj1SeajTQiWqa/VWAjvo+6irna7Ejd0GC27UPBwnFdCvfx6VGvny1k9ki1z8W
 NL7oOOqMVco9rEzy5zt+NYS/ykzLNyvPjHUV5PeYE4lp8cpHYjul3vVOTY8ReUMUgAq4
 C+WooakYlNwzr430OV5d8ZXzLW3M7JwuOuT1PkP3EymOvpqOQgS/XkcDWbta2iKBDa9m
 pQYY9NgxJb83hnC8h/G5BzYWcldDRgyso5GGzEPN6TdPD1O8ssxdhFD73pCeOsw+1OXo
 9By1MUs8qzONiDKC/VmKt89KjzlNgE4/OuTfC9wStSQJTGBm1c1NdILRvmW1Yf1wFcG5
 65fA==
X-Gm-Message-State: AOAM533MnMF3MDbV+yN2lvHC/iRTawPoVbnQzbOaUs6sbAKz7gqhsBqq
 LrNXYNWxL2OFEqshBfvQ5g3uojlTf1FnUQ==
X-Google-Smtp-Source: ABdhPJw1oVy0vxwkKGBO9LkWWnJ+hb/hDLJm0z/a3M8yvVFdQQXrmnp6f18ugL7KHbxD8dD9bAesaA==
X-Received: by 2002:a05:6000:4e:: with SMTP id k14mr64206wrx.303.1595431502688; 
 Wed, 22 Jul 2020 08:25:02 -0700 (PDT)
Received: from localhost.localdomain ([80.71.140.73])
 by smtp.gmail.com with ESMTPSA id 60sm298547wrs.20.2020.07.22.08.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 08:25:01 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/2] riscv: Avoid unaligned access when relocating modules
Date: Wed, 22 Jul 2020 17:24:21 +0200
Message-Id: <20200722152422.72532-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_112504_624380_5CA9ADD1 
X-CRM114-Status: GOOD (  14.22  )
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

With the C-extension regular 32bit instructions are not
necessarily aligned on 4-byte boundaries. RISC-V instructions
are in fact an ordered list of 16bit native-endian
"parcels", so access the instruction as such.

This should also make the code work in case someone builds
a big-endian RISC-V machine.

Fix rcv -> rvc typo while we're at it.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/module.c | 155 +++++++++++++++++++------------------
 1 file changed, 79 insertions(+), 76 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 104fba889cf7..05b2162d96be 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -13,68 +13,86 @@
 #include <linux/pgtable.h>
 #include <asm/sections.h>
 
-static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
+static int riscv_insn_rmw(u8 *location, u32 keep, u32 set)
+{
+	u16 *parcel = (u16 *)location;
+	u32 insn = (u32)parcel[0] | (u32)parcel[1] << 16;
+
+	insn &= keep;
+	insn |= set;
+
+	parcel[0] = insn;
+	parcel[1] = insn >> 16;
+	return 0;
+}
+
+static int riscv_insn_rvc_rmw(u8 *location, u16 keep, u16 set)
+{
+	u16 *parcel = (u16 *)location;
+
+	*parcel = (*parcel & keep) | set;
+	return 0;
+}
+
+static int apply_r_riscv_32_rela(struct module *me, u8 *location, Elf_Addr v)
 {
 	if (v != (u32)v) {
 		pr_err("%s: value %016llx out of range for 32-bit field\n",
 		       me->name, (long long)v);
 		return -EINVAL;
 	}
-	*location = v;
+	*(u32 *)location = v;
 	return 0;
 }
 
-static int apply_r_riscv_64_rela(struct module *me, u32 *location, Elf_Addr v)
+static int apply_r_riscv_64_rela(struct module *me, u8 *location, Elf_Addr v)
 {
 	*(u64 *)location = v;
 	return 0;
 }
 
-static int apply_r_riscv_branch_rela(struct module *me, u32 *location,
+static int apply_r_riscv_branch_rela(struct module *me, u8 *location,
 				     Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (u8 *)v - location;
 	u32 imm12 = (offset & 0x1000) << (31 - 12);
 	u32 imm11 = (offset & 0x800) >> (11 - 7);
 	u32 imm10_5 = (offset & 0x7e0) << (30 - 10);
 	u32 imm4_1 = (offset & 0x1e) << (11 - 4);
 
-	*location = (*location & 0x1fff07f) | imm12 | imm11 | imm10_5 | imm4_1;
-	return 0;
+	return riscv_insn_rmw(location, 0x1fff07f, imm12 | imm11 | imm10_5 | imm4_1);
 }
 
-static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
+static int apply_r_riscv_jal_rela(struct module *me, u8 *location,
 				  Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (u8 *)v - location;
 	u32 imm20 = (offset & 0x100000) << (31 - 20);
 	u32 imm19_12 = (offset & 0xff000);
 	u32 imm11 = (offset & 0x800) << (20 - 11);
 	u32 imm10_1 = (offset & 0x7fe) << (30 - 10);
 
-	*location = (*location & 0xfff) | imm20 | imm19_12 | imm11 | imm10_1;
-	return 0;
+	return riscv_insn_rmw(location, 0xfff, imm20 | imm19_12 | imm11 | imm10_1);
 }
 
-static int apply_r_riscv_rcv_branch_rela(struct module *me, u32 *location,
+static int apply_r_riscv_rvc_branch_rela(struct module *me, u8 *location,
 					 Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (u8 *)v - location;
 	u16 imm8 = (offset & 0x100) << (12 - 8);
 	u16 imm7_6 = (offset & 0xc0) >> (6 - 5);
 	u16 imm5 = (offset & 0x20) >> (5 - 2);
 	u16 imm4_3 = (offset & 0x18) << (12 - 5);
 	u16 imm2_1 = (offset & 0x6) << (12 - 10);
 
-	*(u16 *)location = (*(u16 *)location & 0xe383) |
-		    imm8 | imm7_6 | imm5 | imm4_3 | imm2_1;
-	return 0;
+	return riscv_insn_rvc_rmw(location, 0xe383,
+			imm8 | imm7_6 | imm5 | imm4_3 | imm2_1);
 }
 
-static int apply_r_riscv_rvc_jump_rela(struct module *me, u32 *location,
+static int apply_r_riscv_rvc_jump_rela(struct module *me, u8 *location,
 				       Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (u8 *)v - location;
 	u16 imm11 = (offset & 0x800) << (12 - 11);
 	u16 imm10 = (offset & 0x400) >> (10 - 8);
 	u16 imm9_8 = (offset & 0x300) << (12 - 11);
@@ -84,16 +102,14 @@ static int apply_r_riscv_rvc_jump_rela(struct module *me, u32 *location,
 	u16 imm4 = (offset & 0x10) << (12 - 5);
 	u16 imm3_1 = (offset & 0xe) << (12 - 10);
 
-	*(u16 *)location = (*(u16 *)location & 0xe003) |
-		    imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1;
-	return 0;
+	return riscv_insn_rvc_rmw(location, 0xe003,
+			imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1);
 }
 
-static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
+static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u8 *location,
 					 Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
-	s32 hi20;
+	ptrdiff_t offset = (u8 *)v - location;
 
 	if (offset != (s32)offset) {
 		pr_err(
@@ -102,23 +118,20 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
-	return 0;
+	return riscv_insn_rmw(location, 0xfff, (offset + 0x800) & 0xfffff000);
 }
 
-static int apply_r_riscv_pcrel_lo12_i_rela(struct module *me, u32 *location,
+static int apply_r_riscv_pcrel_lo12_i_rela(struct module *me, u8 *location,
 					   Elf_Addr v)
 {
 	/*
 	 * v is the lo12 value to fill. It is calculated before calling this
 	 * handler.
 	 */
-	*location = (*location & 0xfffff) | ((v & 0xfff) << 20);
-	return 0;
+	return riscv_insn_rmw(location, 0xfffff, (v & 0xfff) << 20);
 }
 
-static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u32 *location,
+static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u8 *location,
 					   Elf_Addr v)
 {
 	/*
@@ -128,15 +141,12 @@ static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u32 *location,
 	u32 imm11_5 = (v & 0xfe0) << (31 - 11);
 	u32 imm4_0 = (v & 0x1f) << (11 - 4);
 
-	*location = (*location & 0x1fff07f) | imm11_5 | imm4_0;
-	return 0;
+	return riscv_insn_rmw(location, 0x1fff07f, imm11_5 | imm4_0);
 }
 
-static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
+static int apply_r_riscv_hi20_rela(struct module *me, u8 *location,
 				   Elf_Addr v)
 {
-	s32 hi20;
-
 	if (IS_ENABLED(CONFIG_CMODEL_MEDLOW)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
@@ -144,22 +154,20 @@ static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = ((s32)v + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
-	return 0;
+	return riscv_insn_rmw(location, 0xfff, ((s32)v + 0x800) & 0xfffff000);
 }
 
-static int apply_r_riscv_lo12_i_rela(struct module *me, u32 *location,
+static int apply_r_riscv_lo12_i_rela(struct module *me, u8 *location,
 				     Elf_Addr v)
 {
 	/* Skip medlow checking because of filtering by HI20 already */
 	s32 hi20 = ((s32)v + 0x800) & 0xfffff000;
 	s32 lo12 = ((s32)v - hi20);
-	*location = (*location & 0xfffff) | ((lo12 & 0xfff) << 20);
-	return 0;
+
+	return riscv_insn_rmw(location, 0xfffff, (lo12 & 0xfff) << 20);
 }
 
-static int apply_r_riscv_lo12_s_rela(struct module *me, u32 *location,
+static int apply_r_riscv_lo12_s_rela(struct module *me, u8 *location,
 				     Elf_Addr v)
 {
 	/* Skip medlow checking because of filtering by HI20 already */
@@ -167,20 +175,19 @@ static int apply_r_riscv_lo12_s_rela(struct module *me, u32 *location,
 	s32 lo12 = ((s32)v - hi20);
 	u32 imm11_5 = (lo12 & 0xfe0) << (31 - 11);
 	u32 imm4_0 = (lo12 & 0x1f) << (11 - 4);
-	*location = (*location & 0x1fff07f) | imm11_5 | imm4_0;
-	return 0;
+
+	return riscv_insn_rmw(location, 0x1fff07f, imm11_5 | imm4_0);
 }
 
-static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
+static int apply_r_riscv_got_hi20_rela(struct module *me, u8 *location,
 				       Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
-	s32 hi20;
+	ptrdiff_t offset = (u8 *)v - location;
 
 	/* Always emit the got entry */
 	if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
-		offset = module_emit_got_entry(me, v);
-		offset = (void *)offset - (void *)location;
+		unsigned long entry = module_emit_got_entry(me, v);
+		offset = (u8 *)entry - location;
 	} else {
 		pr_err(
 		  "%s: can not generate the GOT entry for symbol = %016llx from PC = %p\n",
@@ -188,23 +195,21 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
-	return 0;
+	return riscv_insn_rmw(location, 0xfff, (offset + 0x800) & 0xfffff000);
 }
 
-static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
+static int apply_r_riscv_call_plt_rela(struct module *me, u8 *location,
 				       Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (u8 *)v - location;
 	s32 fill_v = offset;
 	u32 hi20, lo12;
 
 	if (offset != fill_v) {
 		/* Only emit the plt entry if offset over 32-bit range */
 		if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
-			offset = module_emit_plt_entry(me, v);
-			offset = (void *)offset - (void *)location;
+			unsigned long entry = module_emit_plt_entry(me, v);
+			offset = (u8 *)entry - location;
 		} else {
 			pr_err(
 			  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
@@ -215,15 +220,14 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 
 	hi20 = (offset + 0x800) & 0xfffff000;
 	lo12 = (offset - hi20) & 0xfff;
-	*location = (*location & 0xfff) | hi20;
-	*(location + 1) = (*(location + 1) & 0xfffff) | (lo12 << 20);
-	return 0;
+	riscv_insn_rmw(location, 0xfff, hi20);
+	return riscv_insn_rmw(location + 4, 0xfffff, lo12 << 20);
 }
 
-static int apply_r_riscv_call_rela(struct module *me, u32 *location,
+static int apply_r_riscv_call_rela(struct module *me, u8 *location,
 				   Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (u8 *)v - location;
 	s32 fill_v = offset;
 	u32 hi20, lo12;
 
@@ -236,18 +240,17 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 
 	hi20 = (offset + 0x800) & 0xfffff000;
 	lo12 = (offset - hi20) & 0xfff;
-	*location = (*location & 0xfff) | hi20;
-	*(location + 1) = (*(location + 1) & 0xfffff) | (lo12 << 20);
-	return 0;
+	riscv_insn_rmw(location, 0xfff, hi20);
+	return riscv_insn_rmw(location + 4, 0xfffff, lo12 << 20);
 }
 
-static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
+static int apply_r_riscv_relax_rela(struct module *me, u8 *location,
 				    Elf_Addr v)
 {
 	return 0;
 }
 
-static int apply_r_riscv_align_rela(struct module *me, u32 *location,
+static int apply_r_riscv_align_rela(struct module *me, u8 *location,
 				    Elf_Addr v)
 {
 	pr_err(
@@ -256,41 +259,41 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
 	return -EINVAL;
 }
 
-static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
+static int apply_r_riscv_add32_rela(struct module *me, u8 *location,
 				    Elf_Addr v)
 {
 	*(u32 *)location += (u32)v;
 	return 0;
 }
 
-static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
+static int apply_r_riscv_add64_rela(struct module *me, u8 *location,
 				    Elf_Addr v)
 {
 	*(u64 *)location += (u64)v;
 	return 0;
 }
 
-static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
+static int apply_r_riscv_sub32_rela(struct module *me, u8 *location,
 				    Elf_Addr v)
 {
 	*(u32 *)location -= (u32)v;
 	return 0;
 }
 
-static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
+static int apply_r_riscv_sub64_rela(struct module *me, u8 *location,
 				    Elf_Addr v)
 {
 	*(u64 *)location -= (u64)v;
 	return 0;
 }
 
-static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
+static int (*reloc_handlers_rela[]) (struct module *me, u8 *location,
 				Elf_Addr v) = {
 	[R_RISCV_32]			= apply_r_riscv_32_rela,
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
 	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
 	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
-	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rcv_branch_rela,
+	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
 	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
 	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
 	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
@@ -314,9 +317,9 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		       struct module *me)
 {
 	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
-	int (*handler)(struct module *me, u32 *location, Elf_Addr v);
+	int (*handler)(struct module *me, u8 *location, Elf_Addr v);
 	Elf_Sym *sym;
-	u32 *location;
+	u8 *location;
 	unsigned int i, type;
 	Elf_Addr v;
 	int res;
@@ -326,7 +329,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
-		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
+		location = (u8 *)sechdrs[sechdrs[relsec].sh_info].sh_addr
 			+ rel[i].r_offset;
 		/* This is the symbol it is referring to */
 		sym = (Elf_Sym *)sechdrs[symindex].sh_addr
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
