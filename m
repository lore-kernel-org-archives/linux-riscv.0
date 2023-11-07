Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D0C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N+d2nLVzkFkAUuw3/+Hzpy8cA2a81XjV/mKERRE8IUw=; b=VCH9Q0tfCSXC+P
	leqQseMdLDL8u9R+o5DXujcFsOgGAZ+vEWpad8bGJq186vYE20/V72OOXrlYk5xEKq+VLLgv/c1ib
	iFBMSpGIB0GJeSwvajm+UJXydIJivd3sHE5Ivf8TNDAjaKBW41ooAb+v6UZoECBZ0QPjzVR7sFOCB
	joRafCDeS8F4RwTKr0ObiOKeJ3J8wDh7+lLOXFNYjv2rVxHOjcNxp3VzfVCmC+B0ux3rMbmHDW/Jj
	b2gBTU86LO7Ty9f26HgEfh69cucHRjfB7rplF8r84hR3q9MuvTzok3AyLUzxVR0Ix4TKpStVxQyen
	fgmyK82oPScBaxTdBUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0OQZ-001vD1-35;
	Tue, 07 Nov 2023 15:55:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0OQW-001vB1-2r
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 15:55:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc938f9612so34676995ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 07:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699372539; x=1699977339; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=bNPXM5VMGAgaWyMlnLF4jgn/ECcP0QCbiQEn9FUC4OU=;
        b=ljSnRXGfIIRCIYrdEleThdkAjCd/mLYVdTR6z4p6auzQ8nrhGoFSUK2Ae1hrmjqWyk
         srIGDhWi358Ge4X3APnZbum3ZPQksJULoCEm4/CzRXNs/eT89xKxgsvAWOiwefRoqwwo
         79hwfFH8Bnkr4XK8eRon9xENTRzD633ZZNfrTem8rfpH/3nNW8zHwMngH/IzQiGGnYkj
         8KjsMzh7j8tPWW65V7B+mGyM50IwkWq7zMsp43tQ4KFGYR5fL92nmxyvYV/PqDzElzb+
         V1OK0V1SfybFG988NggQ8u07k08ZvNnLv4cRb9mXDWBmppGCZZHsHd+VD1GjuQbxOm4H
         ZxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699372539; x=1699977339;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNPXM5VMGAgaWyMlnLF4jgn/ECcP0QCbiQEn9FUC4OU=;
        b=psCmeaOqEAnvIOIylY2AIinL1xf6u/QTFhxRNBHG6nAisxEIThSAIU3kxap5kf+Wg0
         ooypO2Ag980r4bQO+afrNh804n7gP+9/PkuyjuNt5P+A1tgkADVfUBqjlR4uqBZSak0R
         eLZfJBdS2D/y6awy7KIEorVA+bj3k7mArstYZXUNrAOYkG5b+BXmwcLjITWQD6ZsZxma
         KF306tqIqF7ZLxmRgmzoL31bzQ49RPw6x4GcPaD+vcjp/JDLTlkTo0WlOuccuKTQF7fR
         wlXgj6KMdq8bUlIJZlm4kfnKFj0l5PZ6sZ+BnTeoUHJWLGnFpgqTm13uDUO/pbBTPYSy
         8Ezw==
X-Gm-Message-State: AOJu0YzQnztTcWo1vD4X6iU8/OKcraPn5mC+phvRT36ugzU2Ct0iz2b4
	IxSKuq9Obd9RwhTM6eaVL7yLz4Ts4HG90DJt5CI=
X-Google-Smtp-Source: AGHT+IGTQdxqkEuMz4o47OJk0lGthHFCbQuF9VPA7jFWGXX4vGVrVyLnK7bIrAxFWQkZpwrWxedG/A==
X-Received: by 2002:a17:902:c946:b0:1cc:5589:7dba with SMTP id i6-20020a170902c94600b001cc55897dbamr25062536pla.43.1699372538930;
        Tue, 07 Nov 2023 07:55:38 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903244c00b001b9be3b94d3sm4193pls.140.2023.11.07.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:55:38 -0800 (PST)
Subject: [PATCH] RISC-V: Don't rely on positional structure initialization
Date: Tue,  7 Nov 2023 07:55:29 -0800
Message-ID: <20231107155529.8368-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_075541_142734_8D3729B8 
X-CRM114-Status: GOOD (  10.63  )
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

Without this I get a bunch of warnings along the lines of

    arch/riscv/kernel/module.c:535:26: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      535 |         [R_RISCV_32] = { apply_r_riscv_32_rela },

This just mades the member initializers explicit instead of positional.
I also aligned some of the table, but mostly just to make the batch
editing go faster.

Fixes: 3bb2a41e5efd ("Merge patch series "riscv: Add remaining module relocations and tests"")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/module.c | 125 +++++++++++++++++++------------------
 1 file changed, 65 insertions(+), 60 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 4b339729d5ec..56a8c78e9e21 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -532,69 +532,74 @@ static int apply_uleb128_accumulation(struct module *me, void *location, long bu
  * This handles static linking only.
  */
 static const struct relocation_handlers reloc_handlers[] = {
-	[R_RISCV_32] = { apply_r_riscv_32_rela },
-	[R_RISCV_64] = { apply_r_riscv_64_rela },
-	[R_RISCV_RELATIVE] = { dynamic_linking_not_supported },
-	[R_RISCV_COPY] = { dynamic_linking_not_supported },
-	[R_RISCV_JUMP_SLOT] = { dynamic_linking_not_supported },
-	[R_RISCV_TLS_DTPMOD32] = { dynamic_linking_not_supported },
-	[R_RISCV_TLS_DTPMOD64] = { dynamic_linking_not_supported },
-	[R_RISCV_TLS_DTPREL32] = { dynamic_linking_not_supported },
-	[R_RISCV_TLS_DTPREL64] = { dynamic_linking_not_supported },
-	[R_RISCV_TLS_TPREL32] = { dynamic_linking_not_supported },
-	[R_RISCV_TLS_TPREL64] = { dynamic_linking_not_supported },
+	[R_RISCV_32]		= { .reloc_handler = apply_r_riscv_32_rela },
+	[R_RISCV_64]		= { .reloc_handler = apply_r_riscv_64_rela },
+	[R_RISCV_RELATIVE]	= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_COPY]		= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_JUMP_SLOT]	= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_TLS_DTPMOD32]	= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_TLS_DTPMOD64]	= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_TLS_DTPREL32]	= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_TLS_DTPREL64]	= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_TLS_TPREL32]	= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_TLS_TPREL64]	= { .reloc_handler = dynamic_linking_not_supported },
 	/* 12-15 undefined */
-	[R_RISCV_BRANCH] = { apply_r_riscv_branch_rela },
-	[R_RISCV_JAL] = { apply_r_riscv_jal_rela },
-	[R_RISCV_CALL] = { apply_r_riscv_call_rela },
-	[R_RISCV_CALL_PLT] = { apply_r_riscv_call_plt_rela },
-	[R_RISCV_GOT_HI20] = { apply_r_riscv_got_hi20_rela },
-	[R_RISCV_TLS_GOT_HI20] = { tls_not_supported },
-	[R_RISCV_TLS_GD_HI20] = { tls_not_supported },
-	[R_RISCV_PCREL_HI20] = { apply_r_riscv_pcrel_hi20_rela },
-	[R_RISCV_PCREL_LO12_I] = { apply_r_riscv_pcrel_lo12_i_rela },
-	[R_RISCV_PCREL_LO12_S] = { apply_r_riscv_pcrel_lo12_s_rela },
-	[R_RISCV_HI20] = { apply_r_riscv_hi20_rela },
-	[R_RISCV_LO12_I] = { apply_r_riscv_lo12_i_rela },
-	[R_RISCV_LO12_S] = { apply_r_riscv_lo12_s_rela },
-	[R_RISCV_TPREL_HI20] = { tls_not_supported },
-	[R_RISCV_TPREL_LO12_I] = { tls_not_supported },
-	[R_RISCV_TPREL_LO12_S] = { tls_not_supported },
-	[R_RISCV_TPREL_ADD] = { tls_not_supported },
-	[R_RISCV_ADD8] = { apply_r_riscv_add8_rela, apply_8_bit_accumulation },
-	[R_RISCV_ADD16] = { apply_r_riscv_add16_rela,
-			    apply_16_bit_accumulation },
-	[R_RISCV_ADD32] = { apply_r_riscv_add32_rela,
-			    apply_32_bit_accumulation },
-	[R_RISCV_ADD64] = { apply_r_riscv_add64_rela,
-			    apply_64_bit_accumulation },
-	[R_RISCV_SUB8] = { apply_r_riscv_sub8_rela, apply_8_bit_accumulation },
-	[R_RISCV_SUB16] = { apply_r_riscv_sub16_rela,
-			    apply_16_bit_accumulation },
-	[R_RISCV_SUB32] = { apply_r_riscv_sub32_rela,
-			    apply_32_bit_accumulation },
-	[R_RISCV_SUB64] = { apply_r_riscv_sub64_rela,
-			    apply_64_bit_accumulation },
+	[R_RISCV_BRANCH]	= { .reloc_handler = apply_r_riscv_branch_rela },
+	[R_RISCV_JAL]		= { .reloc_handler = apply_r_riscv_jal_rela },
+	[R_RISCV_CALL]		= { .reloc_handler = apply_r_riscv_call_rela },
+	[R_RISCV_CALL_PLT]	= { .reloc_handler = apply_r_riscv_call_plt_rela },
+	[R_RISCV_GOT_HI20]	= { .reloc_handler = apply_r_riscv_got_hi20_rela },
+	[R_RISCV_TLS_GOT_HI20]	= { .reloc_handler = tls_not_supported },
+	[R_RISCV_TLS_GD_HI20]	= { .reloc_handler = tls_not_supported },
+	[R_RISCV_PCREL_HI20]	= { .reloc_handler = apply_r_riscv_pcrel_hi20_rela },
+	[R_RISCV_PCREL_LO12_I]	= { .reloc_handler = apply_r_riscv_pcrel_lo12_i_rela },
+	[R_RISCV_PCREL_LO12_S]	= { .reloc_handler = apply_r_riscv_pcrel_lo12_s_rela },
+	[R_RISCV_HI20]		= { .reloc_handler = apply_r_riscv_hi20_rela },
+	[R_RISCV_LO12_I]	= { .reloc_handler = apply_r_riscv_lo12_i_rela },
+	[R_RISCV_LO12_S]	= { .reloc_handler = apply_r_riscv_lo12_s_rela },
+	[R_RISCV_TPREL_HI20]	= { .reloc_handler = tls_not_supported },
+	[R_RISCV_TPREL_LO12_I]	= { .reloc_handler = tls_not_supported },
+	[R_RISCV_TPREL_LO12_S]	= { .reloc_handler = tls_not_supported },
+	[R_RISCV_TPREL_ADD]	= { .reloc_handler = tls_not_supported },
+	[R_RISCV_ADD8]		= { .reloc_handler = apply_r_riscv_add8_rela,
+				    .accumulate_handler = apply_8_bit_accumulation },
+	[R_RISCV_ADD16]		= { .reloc_handler = apply_r_riscv_add16_rela,
+				    .accumulate_handler = apply_16_bit_accumulation },
+	[R_RISCV_ADD32]		= { .reloc_handler = apply_r_riscv_add32_rela,
+				    .accumulate_handler = apply_32_bit_accumulation },
+	[R_RISCV_ADD64]		= { .reloc_handler = apply_r_riscv_add64_rela,
+				    .accumulate_handler = apply_64_bit_accumulation },
+	[R_RISCV_SUB8]		= { .reloc_handler = apply_r_riscv_sub8_rela,
+				    .accumulate_handler = apply_8_bit_accumulation },
+	[R_RISCV_SUB16]		= { .reloc_handler = apply_r_riscv_sub16_rela,
+				    .accumulate_handler = apply_16_bit_accumulation },
+	[R_RISCV_SUB32]		= { .reloc_handler = apply_r_riscv_sub32_rela,
+				    .accumulate_handler = apply_32_bit_accumulation },
+	[R_RISCV_SUB64]		= { .reloc_handler = apply_r_riscv_sub64_rela,
+				    .accumulate_handler = apply_64_bit_accumulation },
 	/* 41-42 reserved for future standard use */
-	[R_RISCV_ALIGN] = { apply_r_riscv_align_rela },
-	[R_RISCV_RVC_BRANCH] = { apply_r_riscv_rvc_branch_rela },
-	[R_RISCV_RVC_JUMP] = { apply_r_riscv_rvc_jump_rela },
+	[R_RISCV_ALIGN]		= { .reloc_handler = apply_r_riscv_align_rela },
+	[R_RISCV_RVC_BRANCH]	= { .reloc_handler = apply_r_riscv_rvc_branch_rela },
+	[R_RISCV_RVC_JUMP]	= { .reloc_handler = apply_r_riscv_rvc_jump_rela },
 	/* 46-50 reserved for future standard use */
-	[R_RISCV_RELAX] = { apply_r_riscv_relax_rela },
-	[R_RISCV_SUB6] = { apply_r_riscv_sub6_rela, apply_6_bit_accumulation },
-	[R_RISCV_SET6] = { apply_r_riscv_set6_rela, apply_6_bit_accumulation },
-	[R_RISCV_SET8] = { apply_r_riscv_set8_rela, apply_8_bit_accumulation },
-	[R_RISCV_SET16] = { apply_r_riscv_set16_rela,
-			    apply_16_bit_accumulation },
-	[R_RISCV_SET32] = { apply_r_riscv_set32_rela,
-			    apply_32_bit_accumulation },
-	[R_RISCV_32_PCREL] = { apply_r_riscv_32_pcrel_rela },
-	[R_RISCV_IRELATIVE] = { dynamic_linking_not_supported },
-	[R_RISCV_PLT32] = { apply_r_riscv_plt32_rela },
-	[R_RISCV_SET_ULEB128] = { apply_r_riscv_set_uleb128,
-				  apply_uleb128_accumulation },
-	[R_RISCV_SUB_ULEB128] = { apply_r_riscv_sub_uleb128,
-				  apply_uleb128_accumulation },
+	[R_RISCV_RELAX]		= { .reloc_handler = apply_r_riscv_relax_rela },
+	[R_RISCV_SUB6]		= { .reloc_handler = apply_r_riscv_sub6_rela,
+				    .accumulate_handler = apply_6_bit_accumulation },
+	[R_RISCV_SET6]		= { .reloc_handler = apply_r_riscv_set6_rela,
+				    .accumulate_handler = apply_6_bit_accumulation },
+	[R_RISCV_SET8]		= { .reloc_handler = apply_r_riscv_set8_rela,
+				    .accumulate_handler = apply_8_bit_accumulation },
+	[R_RISCV_SET16]		= { .reloc_handler = apply_r_riscv_set16_rela,
+				    .accumulate_handler = apply_16_bit_accumulation },
+	[R_RISCV_SET32]		= { .reloc_handler = apply_r_riscv_set32_rela,
+				    .accumulate_handler = apply_32_bit_accumulation },
+	[R_RISCV_32_PCREL]	= { .reloc_handler = apply_r_riscv_32_pcrel_rela },
+	[R_RISCV_IRELATIVE]	= { .reloc_handler = dynamic_linking_not_supported },
+	[R_RISCV_PLT32]		= { .reloc_handler = apply_r_riscv_plt32_rela },
+	[R_RISCV_SET_ULEB128]	= { .reloc_handler = apply_r_riscv_set_uleb128,
+				    .accumulate_handler = apply_uleb128_accumulation },
+	[R_RISCV_SUB_ULEB128]	= { .reloc_handler = apply_r_riscv_sub_uleb128,
+				    .accumulate_handler = apply_uleb128_accumulation },
 	/* 62-191 reserved for future standard use */
 	/* 192-255 nonstandard ABI extensions  */
 };
-- 
2.42.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
