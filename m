Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BEEE9413C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 00:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jtoe8N4q//9ABQnFvP22KC5pdUK2ZkAwmsiYtK771pE=; b=3amedClU+7LqGF
	T4ypCcSAnf42SqtP+/p0plNtMiqker2lspItUuAP/QFB8rx7LE8RIYuP56RRLPvp+/V4FEnbDMGv1
	4KR1eWsdzWfduiGfQAUcXeptiV5lVSIecrKZuhIjumRf3zm2To96lXnSp9gws25A8v14lnlC3hUGp
	VdyN0XwM5qy4b6MR4GVN0iE3ASXCFtzkbyEKg9cI8fXZk+QLqN5a+5L1vuDhWj34oTJDhToiugcbr
	z9oX4YCp3hU+rKTVKxaXgXETz69452hExQdeiRAheClhTdW1ZmING8qwUNbaZR6n9tOxmmrZrhHn7
	VY3IPRTZG9qW+chF3sKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qovNm-006iLu-0o;
	Sat, 07 Oct 2023 00:41:26 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qovNh-006iJy-1n
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 00:41:23 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-565e54cb93aso1622031a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 17:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696639279; x=1697244079; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5ObyqDOjztoDhC5t8E2lz3oLVXfFznkcrpNtj4QO6o=;
        b=tX3kF1EovB4J5zKALRh+sx+37xwLJC5ozZ/r1sFk5q3/h0TpNoSgk2jhRNC23OmtSH
         VrUmUMYBDHFDoomLwq3ucYYV5OC5QZF4NTTVxSlv5fQ7f8iopkegn/inJ7Koe6yeVaZK
         PfXNFKid0jtJpsJ0mwYO/SbWDpQKM8Y3s8l0oD14y1KfZFApOrmfxfAumCzOKGjxC1CW
         ujSKgaPLZlaz3t5yNaBnyMXpob6Bw0XXjimRpl0aXJGWnimMBI/oxW1JrrHqMpOaIoSJ
         GMu6x6mw6WJcLncdZtO8jTz890MoeHtxVIp92vlXRSd0jjFdIrvpir7LBY1/YxXF2mIK
         R4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696639279; x=1697244079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5ObyqDOjztoDhC5t8E2lz3oLVXfFznkcrpNtj4QO6o=;
        b=EhTXfLbeBXUf53roOAIVS2Oa0tZmGf0lDOQtP9pOuYN/CZzb4I1fy/gmkBILjOt46u
         ouHs/5wjmdgPFFevIjj/HkBIIldDT8ePq2a97MQaiRWRzOPY9uBAj2ZYUZBTodSO1JDO
         3s7h6KmdksiKYua2o1bGcNOhNsGhJ5q5OTO7pU3Gh2iBBO6mEvG87aLwQPevQHeRIUiP
         735RZ0UNUFYAex7lfOizCVUWS7rO2uDOCCOsbc7cwDZnpIAVDv8TEAzL1gz0Bmwd6sRm
         A6iUDxedYzZvZMkJffsq9f/RAAQRwwp5qnY14Xssnl+kY2gHKEDVkW2kKYTRY6L7eyib
         Lx7Q==
X-Gm-Message-State: AOJu0YzWpanXD0B7O3CWGZxWOXc3oGVIjoBTZ1EIL89k+cENpVMPTN+k
	gF8gTD2oD/3n6Gw41vP/JGGBQegXGWu2wKwY7do=
X-Google-Smtp-Source: AGHT+IHky70QBVvPzgEDItk7mYVORVvgukP/9hhiMTEl2hvCRW/wMJj0Xsi46NbUX0pwqScluqGBnA==
X-Received: by 2002:a05:6a20:144c:b0:14e:a1f0:a8ea with SMTP id a12-20020a056a20144c00b0014ea1f0a8eamr9888603pzi.3.1696639279458;
        Fri, 06 Oct 2023 17:41:19 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x16-20020a170902ec9000b001c582de968dsm4534540plg.72.2023.10.06.17.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 17:41:19 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 06 Oct 2023 17:41:06 -0700
Subject: [PATCH v2 1/2] riscv: Add remaining module relocations
MIME-Version: 1.0
Message-Id: <20231006-module_relocations-v2-1-47566453fedc@rivosinc.com>
References: <20231006-module_relocations-v2-0-47566453fedc@rivosinc.com>
In-Reply-To: <20231006-module_relocations-v2-0-47566453fedc@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_174121_817653_363FA71A 
X-CRM114-Status: GOOD (  20.96  )
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

Add all final module relocations and add error logs explaining the ones
that are not supported.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/uapi/asm/elf.h |   6 +-
 arch/riscv/kernel/module.c        | 247 ++++++++++++++++++++++++++++++++++----
 2 files changed, 227 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index d696d6610231..a9307a1c9ceb 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -49,6 +49,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
 #define R_RISCV_TLS_DTPREL64	9
 #define R_RISCV_TLS_TPREL32	10
 #define R_RISCV_TLS_TPREL64	11
+#define R_RISCV_IRELATIVE	58
 
 /* Relocation types not used by the dynamic linker */
 #define R_RISCV_BRANCH		16
@@ -81,7 +82,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
 #define R_RISCV_ALIGN		43
 #define R_RISCV_RVC_BRANCH	44
 #define R_RISCV_RVC_JUMP	45
-#define R_RISCV_LUI		46
+#define R_RISCV_RVC_LUI		46
 #define R_RISCV_GPREL_I		47
 #define R_RISCV_GPREL_S		48
 #define R_RISCV_TPREL_I		49
@@ -93,6 +94,9 @@ typedef union __riscv_fp_state elf_fpregset_t;
 #define R_RISCV_SET16		55
 #define R_RISCV_SET32		56
 #define R_RISCV_32_PCREL	57
+#define R_RISCV_PLT32		59
+#define R_RISCV_SET_ULEB128	60
+#define R_RISCV_SUB_ULEB128	61
 
 
 #endif /* _UAPI_ASM_RISCV_ELF_H */
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d55fcbd..61d5cdbe609d 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -7,6 +7,7 @@
 #include <linux/elf.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/kernel.h>
 #include <linux/moduleloader.h>
 #include <linux/vmalloc.h>
 #include <linux/sizes.h>
@@ -253,6 +254,30 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_rvc_lui_rela(struct module *me, u32 *location,
+				      Elf_Addr v)
+{
+	// Get high 6 bits of 18 bit absolute address
+	s32 imm = ((s32)v + 0x800) >> 12;
+
+	if (v != sign_extend32(v, 6)) {
+		pr_err("%s: target %016llx can not be addressed by the 6-bit offset from PC = %p\n",
+		       me->name, (long long)v, location);
+		return -EINVAL;
+	}
+
+	if (imm == 0) {
+		// imm = 0 is invalid for c.lui, convert to c.li
+		*location = (*location & 0x0F83) | 0x4000;
+	} else {
+		u16 imm17 = ((((s32)v + 0x800) & 0x20000) >> (17 - 12));
+		u16 imm16_12 = ((((s32)v + 0x800) & 0x1f000) >> (12 - 2));
+		*location = (*location & 0xef83) | imm17 | imm16_12;
+	}
+
+	return 0;
+}
+
 static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
@@ -268,6 +293,12 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
 	return -EINVAL;
 }
 
+static int apply_r_riscv_add8_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	*(u8 *)location += (u8)v;
+	return 0;
+}
+
 static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
@@ -289,6 +320,12 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_sub8_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	*(u8 *)location -= (u8)v;
+	return 0;
+}
+
 static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
@@ -310,31 +347,150 @@ static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
 	return 0;
 }
 
-static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
-				Elf_Addr v) = {
-	[R_RISCV_32]			= apply_r_riscv_32_rela,
-	[R_RISCV_64]			= apply_r_riscv_64_rela,
-	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
-	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
-	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
-	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
-	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
-	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
-	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
-	[R_RISCV_HI20]			= apply_r_riscv_hi20_rela,
-	[R_RISCV_LO12_I]		= apply_r_riscv_lo12_i_rela,
-	[R_RISCV_LO12_S]		= apply_r_riscv_lo12_s_rela,
-	[R_RISCV_GOT_HI20]		= apply_r_riscv_got_hi20_rela,
-	[R_RISCV_CALL_PLT]		= apply_r_riscv_call_plt_rela,
-	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
-	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
-	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
-	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
-	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
-	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
-	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
-	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
-	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
+static int dynamic_linking_not_supported(struct module *me, u32 *location,
+					 Elf_Addr v)
+{
+	pr_err("%s: Dynamic linking not supported in kernel modules PC = %p\n",
+	       me->name, location);
+	return -EINVAL;
+}
+
+static int tls_not_supported(struct module *me, u32 *location, Elf_Addr v)
+{
+	pr_err("%s: Thread local storage not supported in kernel modules PC = %p\n",
+	       me->name, location);
+	return -EINVAL;
+}
+
+static int apply_r_riscv_sub6_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	*(u8 *)location -= (u8)v & 0x3F;
+	return 0;
+}
+
+static int apply_r_riscv_set6_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	*(u8 *)location = (*(u8 *)location & 0xc0) | ((u8)v & 0x3F);
+	return 0;
+}
+
+static int apply_r_riscv_set8_rela(struct module *me, u32 *location, Elf_Addr v)
+{
+	*(u8 *)location = (u8)v;
+	return 0;
+}
+
+static int apply_r_riscv_set16_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u16 *)location = (u16)v;
+	return 0;
+}
+
+static int apply_r_riscv_set32_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u32 *)location = (u32)v;
+	return 0;
+}
+
+static int apply_r_riscv_32_pcrel_rela(struct module *me, u32 *location,
+				       Elf_Addr v)
+{
+	*(u32 *)location = (u32)v;
+	return 0;
+}
+
+static int apply_r_riscv_plt32_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u32 *)location = (u32)v;
+	return 0;
+}
+
+static int apply_r_riscv_set_uleb128(struct module *me, u32 *location, Elf_Addr v)
+{
+	/*
+	 * Relocation is only performed if R_RISCV_SET_ULEB128 is followed by
+	 * R_RISCV_SUB_ULEB128 so do computation there
+	 */
+	return 0;
+}
+
+static int apply_r_riscv_sub_uleb128(struct module *me, u32 *location, Elf_Addr v)
+{
+	if (v >= 128) {
+		pr_err("%s: uleb128 must be in [0, 127] (not %ld) at PC = %p\n",
+		       me->name, (unsigned long)v, location);
+		return -EINVAL;
+	}
+
+	*location = v;
+	return 0;
+}
+
+/*
+ * Relocations defined in the riscv-elf-psabi-doc.
+ * This handles static linking only.
+ */
+static int (*reloc_handlers_rela[])(struct module *me, u32 *location,
+				    Elf_Addr v) = {
+	[R_RISCV_32] =			apply_r_riscv_32_rela,
+	[R_RISCV_64] =			apply_r_riscv_64_rela,
+	[R_RISCV_RELATIVE] =		dynamic_linking_not_supported,
+	[R_RISCV_COPY] =		dynamic_linking_not_supported,
+	[R_RISCV_JUMP_SLOT] =		dynamic_linking_not_supported,
+	[R_RISCV_TLS_DTPMOD32] =	dynamic_linking_not_supported,
+	[R_RISCV_TLS_DTPMOD64] =	dynamic_linking_not_supported,
+	[R_RISCV_TLS_DTPREL32] =	dynamic_linking_not_supported,
+	[R_RISCV_TLS_DTPREL64] =	dynamic_linking_not_supported,
+	[R_RISCV_TLS_TPREL32] =		dynamic_linking_not_supported,
+	[R_RISCV_TLS_TPREL64] =		dynamic_linking_not_supported,
+	/* 12-15 undefined */
+	[R_RISCV_BRANCH] =		apply_r_riscv_branch_rela,
+	[R_RISCV_JAL] =			apply_r_riscv_jal_rela,
+	[R_RISCV_CALL] =		apply_r_riscv_call_rela,
+	[R_RISCV_CALL_PLT] =		apply_r_riscv_call_plt_rela,
+	[R_RISCV_GOT_HI20] =		apply_r_riscv_got_hi20_rela,
+	[R_RISCV_TLS_GOT_HI20] =	tls_not_supported,
+	[R_RISCV_TLS_GD_HI20] =		tls_not_supported,
+	[R_RISCV_PCREL_HI20] =		apply_r_riscv_pcrel_hi20_rela,
+	[R_RISCV_PCREL_LO12_I] =	apply_r_riscv_pcrel_lo12_i_rela,
+	[R_RISCV_PCREL_LO12_S] =	apply_r_riscv_pcrel_lo12_s_rela,
+	[R_RISCV_HI20] =		apply_r_riscv_hi20_rela,
+	[R_RISCV_LO12_I] =		apply_r_riscv_lo12_i_rela,
+	[R_RISCV_LO12_S] =		apply_r_riscv_lo12_s_rela,
+	[R_RISCV_TPREL_HI20] =		tls_not_supported,
+	[R_RISCV_TPREL_LO12_I] =	tls_not_supported,
+	[R_RISCV_TPREL_LO12_S] =	tls_not_supported,
+	[R_RISCV_TPREL_ADD] =		tls_not_supported,
+	[R_RISCV_ADD8] =		apply_r_riscv_add8_rela,
+	[R_RISCV_ADD16] =		apply_r_riscv_add16_rela,
+	[R_RISCV_ADD32] =		apply_r_riscv_add32_rela,
+	[R_RISCV_ADD64] =		apply_r_riscv_add64_rela,
+	[R_RISCV_SUB8] =		apply_r_riscv_sub8_rela,
+	[R_RISCV_SUB16] =		apply_r_riscv_sub16_rela,
+	[R_RISCV_SUB32] =		apply_r_riscv_sub32_rela,
+	[R_RISCV_SUB64] =		apply_r_riscv_sub64_rela,
+	/* 41-42 reserved for future standard use */
+	[R_RISCV_ALIGN] =		apply_r_riscv_align_rela,
+	[R_RISCV_RVC_BRANCH] =		apply_r_riscv_rvc_branch_rela,
+	[R_RISCV_RVC_JUMP] =		apply_r_riscv_rvc_jump_rela,
+	[R_RISCV_RVC_LUI] =		apply_r_riscv_rvc_lui_rela,
+	/* 47-50 reserved for future standard use */
+	[R_RISCV_RELAX] =		apply_r_riscv_relax_rela,
+	[R_RISCV_SUB6] =		apply_r_riscv_sub6_rela,
+	[R_RISCV_SET6] =		apply_r_riscv_set6_rela,
+	[R_RISCV_SET8] =		apply_r_riscv_set8_rela,
+	[R_RISCV_SET16] =		apply_r_riscv_set16_rela,
+	[R_RISCV_SET32] =		apply_r_riscv_set32_rela,
+	[R_RISCV_32_PCREL] =		apply_r_riscv_32_pcrel_rela,
+	[R_RISCV_IRELATIVE] =		dynamic_linking_not_supported,
+	[R_RISCV_PLT32] =		apply_r_riscv_plt32_rela,
+	[R_RISCV_SET_ULEB128] =		apply_r_riscv_set_uleb128,
+	[R_RISCV_SUB_ULEB128] =		apply_r_riscv_sub_uleb128,
+	/* 62-191 reserved for future standard use */
+	/* 192-255 nonstandard ABI extensions  */
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
@@ -425,6 +581,47 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 				  me->name);
 				return -EINVAL;
 			}
+		} else if (type == R_RISCV_SUB_ULEB128) {
+			unsigned long set_loc;
+			u32 set_type;
+			unsigned long set_sym_val;
+
+			bool has_corresponding_relocation = false;
+
+			/* R_RISCV_SET_ULEB128 must appear before the SUB  */
+			for (unsigned int j = i; j >= 0; j--) {
+				set_loc = sechdrs[sechdrs[relsec].sh_info]
+						  .sh_addr +
+					  rel[j].r_offset;
+				set_type = ELF_RISCV_R_TYPE(rel[j].r_info);
+
+				/*
+				 * Find the SET relocation that is targeting the
+				 * same position as the SUB
+				 */
+				if (set_type == R_RISCV_SET_ULEB128 &&
+				    set_loc == (unsigned long)location) {
+					Elf_Sym *corresponding_sym =
+						(Elf_Sym *)sechdrs[symindex]
+							.sh_addr +
+						ELF_RISCV_R_SYM(rel[j].r_info);
+
+					set_sym_val =
+						corresponding_sym->st_value +
+						rel[j].r_addend;
+					has_corresponding_relocation = true;
+					break;
+				}
+			}
+
+			if (has_corresponding_relocation) {
+				/* Calculate set and subtraction */
+				v = set_sym_val - v;
+			} else {
+				pr_err("%s: R_RISCV_SUB_ULEB128 must always be paired with a R_RISCV_SET_ULEB128 that comes before it. PC = %p\n",
+				       me->name, location);
+				return -EINVAL;
+			}
 		}
 
 		res = handler(me, location, v);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
