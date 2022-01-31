Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7212C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/yfCq7V1/90muj+b1AfhBsd3VcnvZs3Xk20V1fPV+s=; b=UzyX0iqYooOZ14
	vzXWmnswiHP0XV84OaehG/uZDu/AHfry5zHoUgQv3cxCW5HZU9e/PGZdM28kX4OA9gqMPG/5klSn3
	B1ka3oublXJH6tQuA6IEl9vRZXKhqqyRRrMtBOsbHvLb7GNf749legi7ix7W+PdBmkuGfL38lNSOp
	wEI5CPjvvASTugonzmbNO2DjvHMKl6bzdDEFcWsG5G3Hq50bDPb63TH9Sf1H4cdEqQD2GAgBQcL1C
	nDso7YCgs7wOiF/xwNfVrfkUq24R2WsnkqFAAqbsfv7R+SWBF16/Xbwr7YnYl7cfbZNLBWyT4WXfS
	yiW1vK0/7pjFnc9iYnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbK8-00AJTu-Kc; Mon, 31 Jan 2022 18:22:44 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbK5-00AJQn-Fg
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:22:43 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 b17-20020a9d4791000000b005a17fc2dfc1so13845976otf.1
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCzMOkXflHmWMxX1XPAY7nKtPtpcp9g4eQAqLH2YIns=;
 b=cVK8q8IqPDBCtC4ivwSc3NI0vzhHzduPJmRPfeneeNFUbDsICRd+mkaStOSPBXhwS7
 Yx81OYIDDpFzjBTNOXUaGn/MCdv/wSm3v8jx2LYnh3iCrOLoYMgisLM9s0zDdt3XYU0v
 2+XHQyESKt6wXm0aFMHt1OxQBc5j1k0lnSxg2K2pmNugaNF/xBDjvMtxNwe8W25DoE5N
 HICPrAY5HXD+8fEfd3JVjEYXTgPSLkCAZWBw5gJQVhkwuRhuCECPzoVpuJWoJjbjFfGf
 bCWDU4WTLWSkNE1aquajGR2doEYuqN9JQ1XvjyD3VEgq6EyAfhfFbS2mcsffA4xD6Qu4
 SBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CCzMOkXflHmWMxX1XPAY7nKtPtpcp9g4eQAqLH2YIns=;
 b=Dy5oTmKyndXPo/7D6Y6aI1RWdq8putrEkbt9zE815Qtoi7lmPu4zErVQc3myTmVfIV
 /Uga1eZNSr4dzxlpyj7IgL7QYCyAT3I22EkIVt5TP0jFi+3buNbexw7E/0GEBDkgUBAJ
 IyllCM2LXJoMo756FuDGGw8kGVhOaECVKMdNVsY035M2Tx94YS1kmv7XXwc2qJ7pXSdj
 FLGdlzvcy9yZcz9SWT8uaGkNxeOMh/KNuqKOJaoPDJ1apjm7dX+dTXWPwsPN5XAehP4L
 j3E9Qr8vXsT+StpmCafxJT5GYTnJGVDtt/fzE2Ki1FCFimb0Y8pZl9HruulR/0vrtCMH
 84Lg==
X-Gm-Message-State: AOAM532knaQGl33c5hN/rmn3MnTEkJldTOTIGniuP0ikDXIzO6BF7RuS
 g5qAeMxY2YUU0TmdiqxC+g9fDR46Sv4=
X-Google-Smtp-Source: ABdhPJyINXPwfY18wwXLDqhZ/f1W5qGuM2/i1IID9PGprXPfceL3GeaWq/hfJyqgBqtWWKNNWrltLA==
X-Received: by 2002:a05:6830:30b6:: with SMTP id
 g22mr12237496ots.122.1643653360912; 
 Mon, 31 Jan 2022 10:22:40 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id t4sm12986340oie.14.2022.01.31.10.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:22:40 -0800 (PST)
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
Subject: [PATCH v1 7/7] riscv: kernel/modules.c simplification
Date: Mon, 31 Jan 2022 19:21:45 +0100
Message-Id: <20220131182145.236005-8-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131182145.236005-1-kernel@esmil.dk>
References: <20220131182145.236005-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102241_568757_06F5427A 
X-CRM114-Status: GOOD (  14.52  )
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

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/module.c | 93 ++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 54 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 2212d88776e0..e371977aecfd 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -298,24 +298,23 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		       unsigned int symindex, unsigned int relsec,
 		       struct module *me)
 {
-	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
-	int (*handler)(struct module *me, void *location, Elf_Addr v);
-	Elf_Sym *sym;
-	void *location;
-	unsigned int i, type;
-	Elf_Addr v;
-	int res;
+	Elf_Rela *rel = (void *)sechdrs[relsec].sh_addr;
+	unsigned int entries = sechdrs[relsec].sh_size / sizeof(*rel);
+	unsigned int i;
 
 	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 
-	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
-		/* This is where to make the change */
-		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
-			+ rel[i].r_offset;
-		/* This is the symbol it is referring to */
-		sym = (Elf_Sym *)sechdrs[symindex].sh_addr
+	for (i = 0; i < entries; i++) {
+		Elf_Sym *sym = (Elf_Sym *)sechdrs[symindex].sh_addr
 			+ ELF_RISCV_R_SYM(rel[i].r_info);
+		Elf_Addr loc = sechdrs[sechdrs[relsec].sh_info].sh_addr
+			+ rel[i].r_offset;
+		unsigned int type = ELF_RISCV_R_TYPE(rel[i].r_info);
+		int (*handler)(struct module *me, void *location, Elf_Addr v);
+		Elf_Addr v;
+		int res;
+
 		if (IS_ERR_VALUE(sym->st_value)) {
 			/* Ignore unresolved weak symbol */
 			if (ELF_ST_BIND(sym->st_info) == STB_WEAK)
@@ -325,8 +324,6 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			return -ENOENT;
 		}
 
-		type = ELF_RISCV_R_TYPE(rel[i].r_info);
-
 		if (type < ARRAY_SIZE(reloc_handlers_rela))
 			handler = reloc_handlers_rela[type];
 		else
@@ -343,48 +340,36 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
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
+		res = handler(me, (void *)loc, v);
 		if (res)
 			return res;
 	}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
