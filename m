Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3FBEE020D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hS1IbWvoM/cLF8MwjVketm8kK58SIBvfJtAeuOkvS6Q=; b=CKvZzPzScz2nH0
	Pl4E8pSU1qH2IzoNUxa0PPVmOMb81ICp2QQkFRexO9jxLpboTVMOIQiQp6e3lB0TsDmfUNpJS42Oo
	3fqgkSnyvZhQZALVFpsoeW+koJngVbU2PMCVoVTckcne2xr2ga4RkdAApOzzHMrdNtFOiCzbmS1ze
	qn3olqFER0BUbKksB67FJepAcKTi0IwrAde1mnLUylbGmefDrO4N8D6lzcik73c3/cCLmKGvRf9u3
	2DPEU5F+T27fJt82o1GwXisOJ860/qDeHjz0J/1QEdTIEXNgJ95W5k3fYdBfPBboONZDqSVbvvJJc
	s16qyvMxOpTHUyhWJYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgX3S-006j7X-2Q;
	Wed, 13 Sep 2023 21:05:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgX3Q-006j5Z-1E
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 21:05:46 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-26f7f71b9a7so233015a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694639141; x=1695243941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv4HEesTHW83aQBsr6P2xoLUTJCnxlrDYoQTHgTGZUs=;
        b=1GeZNaQDgleMgjJCoVQ1MCTGnecBs41SVb4wiFugDu8O6o4QKO/r2quBTae5FHh4AU
         q9lG6jE7+5ta9WV6Nn67t0zdnjaBfV9mItc3nf5a1E0/HyoziP3pq/NSke8rIfsL/GgU
         7O9JTwyKxuEtbG7QzISm6DZX2Ou5RTtuPXDbtVuysmiRWssN+oYaxYD9l37uryZOkh+W
         wXebCzJLttmllHYZR8G/R+6P6pp0fisUrkSiMJ/8UlSJR1ynwrnYAVXxgx3RvNHFuObu
         LNxundVZ1x+jdqZydcIGhm5lwwgCms1C5P6lpPwTFe6fGNitm8gBiLbg0jGVtyKKA1HK
         XcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694639141; x=1695243941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tv4HEesTHW83aQBsr6P2xoLUTJCnxlrDYoQTHgTGZUs=;
        b=xQdkVJCIJccZQrgDng6cv4xlcmXUEqtiXxVWh8qDJNvR9O6sKfF4rkopfNctO9PJVk
         VPUTw8EVFKW3dm51xakBby/RbrcDUJ05kn6uN0uhLjbfaYRhPRopROfxr8yjGc0SK9qs
         T1425/LOEa6X0TTPjeXUTDBFv1pDbIzyDUl4wm865vY7kDWIC0UvTQXZLtqXyrJ0c0F6
         Y1Vx9XgXY6Jc0LJG9J42DgmFu73YX/eey9RbOQeL7lkW1d2L+O5aZcVVGvM/zulr17BK
         +iu3uRuUokxPDLbtUaVt32Jmr/8qfuJutMFAGn1oF+MbwAOWrHQi30j0oO4qI3/z0X/o
         9iUw==
X-Gm-Message-State: AOJu0YyZ5NovsVBC4k49gJ2ABd83EYu9Q4on7lazuZlzT0q8IBLhwR6e
	TlFSF7MOaUG/8zkfDjQiuwPEa5+Fq4xtQiDhIgg=
X-Google-Smtp-Source: AGHT+IH2HbmEtNOynkX0zr0oLruKiSRDM4H7cJW1h7yisDs6ojif78Cju0rEahVIqL0qD3qnbuibtg==
X-Received: by 2002:a17:90b:4ad0:b0:262:ee7d:2d20 with SMTP id mh16-20020a17090b4ad000b00262ee7d2d20mr3514022pjb.12.1694639141273;
        Wed, 13 Sep 2023 14:05:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id z16-20020a170903019000b001ab2b4105ddsm66323plg.60.2023.09.13.14.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 14:05:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Sep 2023 14:04:49 -0700
Subject: [PATCH 1/2] riscv: Add remaining module relocations
MIME-Version: 1.0
Message-Id: <20230913-module_relocations-v1-1-bb3d8467e793@rivosinc.com>
References: <20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com>
In-Reply-To: <20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_140544_423336_24A26EE4 
X-CRM114-Status: GOOD (  16.52  )
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
 arch/riscv/kernel/module.c        | 191 +++++++++++++++++++++++++++++++++-----
 2 files changed, 171 insertions(+), 26 deletions(-)

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
index 7c651d55fcbd..7c0cb03b9035 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -253,6 +253,30 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
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
@@ -268,6 +292,12 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
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
@@ -289,6 +319,12 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
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
@@ -310,31 +346,136 @@ static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
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
+static int uleb128_not_supported(struct module *me, u32 *location, Elf_Addr v)
+{
+	pr_err("%s: R_RISCV_SET_ULEB128 and R_RISCV_SUB_ULEB128 not supported PC = %p\n",
+	       me->name, location);
+	return -EINVAL;
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
+	[R_RISCV_SET_ULEB128] =		uleb128_not_supported,
+	[R_RISCV_SUB_ULEB128] =		uleb128_not_supported,
+	/* 62-191 reserved for future standard use */
+	/* 192-255 nonstandard ABI extensions  */
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
