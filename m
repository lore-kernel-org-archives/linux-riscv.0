Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76DCC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 07:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FF/6JNh3lpSX1WKnso7E7RgLELjZ+CsuEGCd47xucY8=; b=1N1u2Qkcov8Gez
	+W22gOlElaeq+O28nstZgP0+i3tSzh0CrUGaw7onMth4sq/l16ZJohV/QTibeVSGTBX41rP6KOcys
	fZ07LWl16bN0xRO9qPyQ4g8WFTsnmEAQR3M7SbMZh5cqXuShQiV/XVw/O/m+Q1ZfbHIjadssKJWsI
	41yStP4aWUgmARIknwVY89zjw6C5+IUdrRnwgWFHpQ+T5LmLpOX3BvOSfkgZNj3DUfNtcRH55RlCG
	xDMgzKeUIbFD1P1b1YSdq8jTO6lJ44fr/UUOH40pBgODGLPdbf+wAxESZmWyvj3dgp4EhRVsknDih
	f/xjsRImFUU1wbN6Hmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj7a-004gcH-1B;
	Tue, 31 Oct 2023 07:25:06 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj7U-004gZ1-39
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 07:25:03 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5b9377e71acso3623170a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698737099; x=1699341899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URk3OdUManeok/shpPwBhUNFZ0p313A2y5YhZgjx0S8=;
        b=lxc0zSOCzcO6G/0BzgHOe1O4t33kGAQds3Nw9iZLpm4N4puwbNZnMXDVScfkntY1gk
         o94niVwOagJRYJlT/13NbHKZej3F7SmD97lHjoAvN13nFrmQm4YQiAc4+NZqXwyK762D
         /NKcwwM0biRRtRnfX7/rYR+rf9j0P1RdO3B5E7GYGHvefL2+Sm28DuuOAwLR84iCmeYM
         Mk22LE96caQ7ZJeKcrpXuZXwUxyW0Zh8Zju6//9Lqt4vui5TkIshR3ZHgVYRL52SEmHb
         T3OXqmYIT1rhlBhAlrE1WOwB2+JFI9iYseLE4eilR+ZXTb5TLu9LIZSArgwaR3t6whMe
         BFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698737099; x=1699341899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URk3OdUManeok/shpPwBhUNFZ0p313A2y5YhZgjx0S8=;
        b=Xq6s5J5uQKZJ3H75Dbr/g/w9EA0eV25a+hhHYmrXywZBHQ7Y0xYMvQDsfpwmBskoi8
         5uwmYlB6xN+JrOzV7FNpRcm/ehqt5Rz8Ze8AF/PYMKPd0htATNbMjWT1fdclQzy+qo5W
         LsuYVVWhmvyKHd9ZvyHaRPBzcYv5Nd4KswFp3iBU8S8PZd0jLM2l2UOiy5gu71wOtcAV
         1WO2mjvHBL/Yc8A9ZwosebRnDQ6R9J8AACYz4mZ9kKYTmLA16t+80doc54AstREoK5Pv
         ORi6mafTjJCd/raK39XL8meoyCcVvdxofkndoEuw9nW6x+UfafPP/X/EoeSYFTRNmmpW
         Je8w==
X-Gm-Message-State: AOJu0Yx7+M/sXEH1v0Q+d7EEEZOT3zdHPP4aDZB32jyq0QilCw5PLka0
	fjczr+RGoIfEXMo2ugU28ofrAw==
X-Google-Smtp-Source: AGHT+IGMiYHXnhGdC7cRoaxFCEKMq3w/10RpLtJzNqO9zNSb0eOy2g2uER1RInnmVou5GpnGB/rkDw==
X-Received: by 2002:a05:6a20:748b:b0:17a:de5d:1d7e with SMTP id p11-20020a056a20748b00b0017ade5d1d7emr15340331pzd.55.1698737098947;
        Tue, 31 Oct 2023 00:24:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d90400b001c74876f018sm652575plz.18.2023.10.31.00.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 00:24:58 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 31 Oct 2023 00:24:50 -0700
Subject: [PATCH v7 1/3] riscv: Avoid unaligned access when relocating
 modules
MIME-Version: 1.0
Message-Id: <20231031-module_relocations-v7-1-6f4719b64bf7@rivosinc.com>
References: <20231031-module_relocations-v7-0-6f4719b64bf7@rivosinc.com>
In-Reply-To: <20231031-module_relocations-v7-0-6f4719b64bf7@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andreas Schwab <schwab@linux-m68k.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nelson Chu <nelson@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_002501_370898_C7603F3A 
X-CRM114-Status: GOOD (  14.82  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

With the C-extension regular 32bit instructions are not
necessarily aligned on 4-byte boundaries. RISC-V instructions
are in fact an ordered list of 16bit little-endian
"parcels", so access the instruction as such.

This should also make the code work in case someone builds
a big-endian RISC-V machine.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/module.c | 153 +++++++++++++++++++++++----------------------
 1 file changed, 77 insertions(+), 76 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d55fcbd..a9e94e939cb5 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -27,68 +27,86 @@ static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
 #endif
 }
 
-static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
+static int riscv_insn_rmw(void *location, u32 keep, u32 set)
+{
+	u16 *parcel = location;
+	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
+
+	insn &= keep;
+	insn |= set;
+
+	parcel[0] = cpu_to_le32(insn);
+	parcel[1] = cpu_to_le16(insn >> 16);
+	return 0;
+}
+
+static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
+{
+	u16 *parcel = location;
+
+	*parcel = cpu_to_le16((le16_to_cpu(*parcel) & keep) | set);
+	return 0;
+}
+
+static int apply_r_riscv_32_rela(struct module *me, void *location, Elf_Addr v)
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
+static int apply_r_riscv_64_rela(struct module *me, void *location, Elf_Addr v)
 {
 	*(u64 *)location = v;
 	return 0;
 }
 
-static int apply_r_riscv_branch_rela(struct module *me, u32 *location,
+static int apply_r_riscv_branch_rela(struct module *me, void *location,
 				     Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (void *)v - location;
 	u32 imm12 = (offset & 0x1000) << (31 - 12);
 	u32 imm11 = (offset & 0x800) >> (11 - 7);
 	u32 imm10_5 = (offset & 0x7e0) << (30 - 10);
 	u32 imm4_1 = (offset & 0x1e) << (11 - 4);
 
-	*location = (*location & 0x1fff07f) | imm12 | imm11 | imm10_5 | imm4_1;
-	return 0;
+	return riscv_insn_rmw(location, 0x1fff07f, imm12 | imm11 | imm10_5 | imm4_1);
 }
 
-static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
+static int apply_r_riscv_jal_rela(struct module *me, void *location,
 				  Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (void *)v - location;
 	u32 imm20 = (offset & 0x100000) << (31 - 20);
 	u32 imm19_12 = (offset & 0xff000);
 	u32 imm11 = (offset & 0x800) << (20 - 11);
 	u32 imm10_1 = (offset & 0x7fe) << (30 - 10);
 
-	*location = (*location & 0xfff) | imm20 | imm19_12 | imm11 | imm10_1;
-	return 0;
+	return riscv_insn_rmw(location, 0xfff, imm20 | imm19_12 | imm11 | imm10_1);
 }
 
-static int apply_r_riscv_rvc_branch_rela(struct module *me, u32 *location,
+static int apply_r_riscv_rvc_branch_rela(struct module *me, void *location,
 					 Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (void *)v - location;
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
+static int apply_r_riscv_rvc_jump_rela(struct module *me, void *location,
 				       Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (void *)v - location;
 	u16 imm11 = (offset & 0x800) << (12 - 11);
 	u16 imm10 = (offset & 0x400) >> (10 - 8);
 	u16 imm9_8 = (offset & 0x300) << (12 - 11);
@@ -98,16 +116,14 @@ static int apply_r_riscv_rvc_jump_rela(struct module *me, u32 *location,
 	u16 imm4 = (offset & 0x10) << (12 - 5);
 	u16 imm3_1 = (offset & 0xe) << (12 - 10);
 
-	*(u16 *)location = (*(u16 *)location & 0xe003) |
-		    imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1;
-	return 0;
+	return riscv_insn_rvc_rmw(location, 0xe003,
+			imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1);
 }
 
-static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
+static int apply_r_riscv_pcrel_hi20_rela(struct module *me, void *location,
 					 Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
-	s32 hi20;
+	ptrdiff_t offset = (void *)v - location;
 
 	if (!riscv_insn_valid_32bit_offset(offset)) {
 		pr_err(
@@ -116,23 +132,20 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
-	return 0;
+	return riscv_insn_rmw(location, 0xfff, (offset + 0x800) & 0xfffff000);
 }
 
-static int apply_r_riscv_pcrel_lo12_i_rela(struct module *me, u32 *location,
+static int apply_r_riscv_pcrel_lo12_i_rela(struct module *me, void *location,
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
+static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, void *location,
 					   Elf_Addr v)
 {
 	/*
@@ -142,15 +155,12 @@ static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u32 *location,
 	u32 imm11_5 = (v & 0xfe0) << (31 - 11);
 	u32 imm4_0 = (v & 0x1f) << (11 - 4);
 
-	*location = (*location & 0x1fff07f) | imm11_5 | imm4_0;
-	return 0;
+	return riscv_insn_rmw(location, 0x1fff07f, imm11_5 | imm4_0);
 }
 
-static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
+static int apply_r_riscv_hi20_rela(struct module *me, void *location,
 				   Elf_Addr v)
 {
-	s32 hi20;
-
 	if (IS_ENABLED(CONFIG_CMODEL_MEDLOW)) {
 		pr_err(
 		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
@@ -158,22 +168,20 @@ static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = ((s32)v + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
-	return 0;
+	return riscv_insn_rmw(location, 0xfff, ((s32)v + 0x800) & 0xfffff000);
 }
 
-static int apply_r_riscv_lo12_i_rela(struct module *me, u32 *location,
+static int apply_r_riscv_lo12_i_rela(struct module *me, void *location,
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
+static int apply_r_riscv_lo12_s_rela(struct module *me, void *location,
 				     Elf_Addr v)
 {
 	/* Skip medlow checking because of filtering by HI20 already */
@@ -181,20 +189,18 @@ static int apply_r_riscv_lo12_s_rela(struct module *me, u32 *location,
 	s32 lo12 = ((s32)v - hi20);
 	u32 imm11_5 = (lo12 & 0xfe0) << (31 - 11);
 	u32 imm4_0 = (lo12 & 0x1f) << (11 - 4);
-	*location = (*location & 0x1fff07f) | imm11_5 | imm4_0;
-	return 0;
+
+	return riscv_insn_rmw(location, 0x1fff07f, imm11_5 | imm4_0);
 }
 
-static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
+static int apply_r_riscv_got_hi20_rela(struct module *me, void *location,
 				       Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
-	s32 hi20;
+	ptrdiff_t offset = (void *)v - location;
 
 	/* Always emit the got entry */
 	if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
-		offset = module_emit_got_entry(me, v);
-		offset = (void *)offset - (void *)location;
+		offset = (void *)module_emit_got_entry(me, v) - location;
 	} else {
 		pr_err(
 		  "%s: can not generate the GOT entry for symbol = %016llx from PC = %p\n",
@@ -202,22 +208,19 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 		return -EINVAL;
 	}
 
-	hi20 = (offset + 0x800) & 0xfffff000;
-	*location = (*location & 0xfff) | hi20;
-	return 0;
+	return riscv_insn_rmw(location, 0xfff, (offset + 0x800) & 0xfffff000);
 }
 
-static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
+static int apply_r_riscv_call_plt_rela(struct module *me, void *location,
 				       Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (void *)v - location;
 	u32 hi20, lo12;
 
 	if (!riscv_insn_valid_32bit_offset(offset)) {
 		/* Only emit the plt entry if offset over 32-bit range */
 		if (IS_ENABLED(CONFIG_MODULE_SECTIONS)) {
-			offset = module_emit_plt_entry(me, v);
-			offset = (void *)offset - (void *)location;
+			offset = (void *)module_emit_plt_entry(me, v) - location;
 		} else {
 			pr_err(
 			  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
@@ -228,15 +231,14 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 
 	hi20 = (offset + 0x800) & 0xfffff000;
 	lo12 = (offset - hi20) & 0xfff;
-	*location = (*location & 0xfff) | hi20;
-	*(location + 1) = (*(location + 1) & 0xfffff) | (lo12 << 20);
-	return 0;
+	riscv_insn_rmw(location, 0xfff, hi20);
+	return riscv_insn_rmw(location + 4, 0xfffff, lo12 << 20);
 }
 
-static int apply_r_riscv_call_rela(struct module *me, u32 *location,
+static int apply_r_riscv_call_rela(struct module *me, void *location,
 				   Elf_Addr v)
 {
-	ptrdiff_t offset = (void *)v - (void *)location;
+	ptrdiff_t offset = (void *)v - location;
 	u32 hi20, lo12;
 
 	if (!riscv_insn_valid_32bit_offset(offset)) {
@@ -248,18 +250,17 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 
 	hi20 = (offset + 0x800) & 0xfffff000;
 	lo12 = (offset - hi20) & 0xfff;
-	*location = (*location & 0xfff) | hi20;
-	*(location + 1) = (*(location + 1) & 0xfffff) | (lo12 << 20);
-	return 0;
+	riscv_insn_rmw(location, 0xfff, hi20);
+	return riscv_insn_rmw(location + 4, 0xfffff, lo12 << 20);
 }
 
-static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
+static int apply_r_riscv_relax_rela(struct module *me, void *location,
 				    Elf_Addr v)
 {
 	return 0;
 }
 
-static int apply_r_riscv_align_rela(struct module *me, u32 *location,
+static int apply_r_riscv_align_rela(struct module *me, void *location,
 				    Elf_Addr v)
 {
 	pr_err(
@@ -268,49 +269,49 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
 	return -EINVAL;
 }
 
-static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
+static int apply_r_riscv_add16_rela(struct module *me, void *location,
 				    Elf_Addr v)
 {
 	*(u16 *)location += (u16)v;
 	return 0;
 }
 
-static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
+static int apply_r_riscv_add32_rela(struct module *me, void *location,
 				    Elf_Addr v)
 {
 	*(u32 *)location += (u32)v;
 	return 0;
 }
 
-static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
+static int apply_r_riscv_add64_rela(struct module *me, void *location,
 				    Elf_Addr v)
 {
 	*(u64 *)location += (u64)v;
 	return 0;
 }
 
-static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
+static int apply_r_riscv_sub16_rela(struct module *me, void *location,
 				    Elf_Addr v)
 {
 	*(u16 *)location -= (u16)v;
 	return 0;
 }
 
-static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
+static int apply_r_riscv_sub32_rela(struct module *me, void *location,
 				    Elf_Addr v)
 {
 	*(u32 *)location -= (u32)v;
 	return 0;
 }
 
-static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
+static int apply_r_riscv_sub64_rela(struct module *me, void *location,
 				    Elf_Addr v)
 {
 	*(u64 *)location -= (u64)v;
 	return 0;
 }
 
-static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
+static int (*reloc_handlers_rela[]) (struct module *me, void *location,
 				Elf_Addr v) = {
 	[R_RISCV_32]			= apply_r_riscv_32_rela,
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
@@ -342,9 +343,9 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		       struct module *me)
 {
 	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
-	int (*handler)(struct module *me, u32 *location, Elf_Addr v);
+	int (*handler)(struct module *me, void *location, Elf_Addr v);
 	Elf_Sym *sym;
-	u32 *location;
+	void *location;
 	unsigned int i, type;
 	Elf_Addr v;
 	int res;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
