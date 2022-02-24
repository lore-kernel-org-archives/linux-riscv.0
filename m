Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EE7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2znBG3SaSF4MFYV0hpG8ZLPxuGorpp8rRrkpLJACwP4=; b=F0H/8P/ylYs0M4
	0gHuEoKoS3MRnjYMZFQscM7Vm4ZB7v+YBBjb0UctUYu+nN/rv32prWyggQsyhCZ9PRaL0WfJUzyuE
	9JWU+Y3Vq0ulLADIz8wfD57ZA81qfPzdu2JTBognIqmhC7CmfXam4a719I27ow6wyNemdB/ggPf8W
	abh+RxWcSHnX7sGZQEPwIVvFCeDi2kD02BAraXCARzNOvswYnViKtlSsURiI5u9YWq0Tde4zTvigE
	c7TjrsDu0u5Rta+RfdsIlhtlVRt3o0PcLZLq07pr6CcZKLPm/rxQ9DM/nEj/29hwRtK7ncaktaqXd
	/95Hd4MRWKDFwPbCk7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNFzy-001I6M-5H; Thu, 24 Feb 2022 15:25:42 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFzb-001Ht0-5p
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 15:25:24 +0000
Received: by mail-ed1-x536.google.com with SMTP id m3so3330670eda.10
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qw2dAmFiLhG20Fq9WpBqzH0yihPpPi6A4uH3+mZ36Gg=;
 b=HGOi35okBIpzSVR+vaq3gGg5P8nC+upR2jiiU/1ySrRfO4jz6Bh0+5Nx0G/ULFwmuV
 76VUorkyuAotaE+Alg6BOsEm7/+KMF7BScHPGlyQUrEc+XtjV1o3YutiDIPHIO/dDWBr
 NS4spAnrFG4/IYnvfPUtaHzPwqhIjxw30SyGt9iYXPxZ8i2vZ2ETgjfKaCLMT9dYvdNI
 CQU8hbXg79vn/0TQSx+rxosiH00VSnteijBPxc7o5UR/kieWjxvaCZ3kuJWgWvDiPoWw
 HVDZKO1/88Dq/2Rfl2/uuHnVkrcg9PHn2TRX4wgrGjlNPkN3VRjj0jwnPjuESFuKXi3m
 WqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qw2dAmFiLhG20Fq9WpBqzH0yihPpPi6A4uH3+mZ36Gg=;
 b=SnEbnILA1eUO5S/cz0/A8R0q0tkfHcPFDqHZyG7AlL13N0vkUnw0AfqEkyKMtie39g
 UWIU8Vm8CIwFkABHNpF07CfIcdZVKLx+ufxNXMvlbJ6ooHdmX3M/GfXzMOvpIzXHjj/Z
 LuB9bKuJ6p6JGVYXJ/V/vNB92xWiL57A9CD68wcNAX05g+8lbZjr3VG539WxAzoFCJlf
 C7MPQwLlHesHFxuz2XcJ6SZz37mhd8WhMdK4cAAiDbJcwUeKOpGup0F/jATptQgIkxvk
 ofze4bGCj/SPZPU8k/f5ZblCR1Knu1K+KQeMiG+lF4uI7NtNLKipK8+50DgsXIJqN9Zr
 CNbQ==
X-Gm-Message-State: AOAM530NabqxOIUV3VxfrV8d0yOEY0cG8mLSMpyM2Xkmy1mrcNjhx0Kp
 mJ0SKqGTwO1snnNLowpOtNyFfdc9GJPQeW4S
X-Google-Smtp-Source: ABdhPJzKVa200BJ0XQQ/0XNEDYKEMcs/FfB6nZMmexxPzUsW61l9Mlx9uZnLQ1GhkOaeX7Pl5gktnA==
X-Received: by 2002:a05:6402:190a:b0:408:9d75:eab6 with SMTP id
 e10-20020a056402190a00b004089d75eab6mr2752553edz.286.1645716317441; 
 Thu, 24 Feb 2022 07:25:17 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s11sm1509693edt.10.2022.02.24.07.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:25:17 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] riscv: Avoid unaligned access when relocating modules
Date: Thu, 24 Feb 2022 16:24:49 +0100
Message-Id: <20220224152456.493365-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224152456.493365-1-kernel@esmil.dk>
References: <20220224152456.493365-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072519_287901_311496C1 
X-CRM114-Status: GOOD (  15.40  )
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

With the C-extension regular 32bit instructions are not
necessarily aligned on 4-byte boundaries. RISC-V instructions
are in fact an ordered list of 16bit native-endian
"parcels", so access the instruction as such.

This should also make the code work in case someone builds
a big-endian RISC-V machine.

Fix rcv -> rvc typo while we're at it.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/module.c | 151 +++++++++++++++++++------------------
 1 file changed, 76 insertions(+), 75 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 4a48287513c3..8d6a16d74b5b 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -26,68 +26,86 @@ static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
 #endif
 }
 
-static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
+static int riscv_insn_rmw(void *location, u32 keep, u32 set)
+{
+	u16 *parcel = location;
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
+static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
+{
+	u16 *parcel = location;
+
+	*parcel = (*parcel & keep) | set;
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
 
-static int apply_r_riscv_rcv_branch_rela(struct module *me, u32 *location,
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
@@ -97,16 +115,14 @@ static int apply_r_riscv_rvc_jump_rela(struct module *me, u32 *location,
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
@@ -115,23 +131,20 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
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
@@ -141,15 +154,12 @@ static int apply_r_riscv_pcrel_lo12_s_rela(struct module *me, u32 *location,
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
@@ -157,22 +167,20 @@ static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
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
@@ -180,20 +188,18 @@ static int apply_r_riscv_lo12_s_rela(struct module *me, u32 *location,
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
@@ -201,22 +207,19 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
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
@@ -227,15 +230,14 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 
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
@@ -247,18 +249,17 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 
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
@@ -267,41 +268,41 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
 	return -EINVAL;
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
 	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
 	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
-	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rcv_branch_rela,
+	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
 	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
 	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
 	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
@@ -325,9 +326,9 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
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
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
