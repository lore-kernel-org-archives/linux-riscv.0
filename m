Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEEBC7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9d+9PeOpEg6dB4xUGZCM6UsCNdGzZSA7PgUspDgfKNM=; b=aMN3avAG2m2+5s
	Vp8z7E3TeRwysc5AQA+YKW9TONm8FbBIHFQrNY70o76g/6ashYGgvPNNsRLzk7Mo0esIW5+eqYsMF
	n4ERZeMJPQk/wE1585HNBTdcpMMunRctoEv8N28cd9jPWV0dWmAJr8RouPWPVXEnbG23GpaZzKuAo
	z3BmP67r/YNPkFf6K1DXQoIs5GO5FuHbHRDZsJBhStBubp5bRJ3WgnJViAM1aQjGcPeaCQurpocEo
	S+CfLn4ztI9UzdCB5p6RYg3BCR3jss2196or19tgbB221bjlCMU4k+xDF2GLCy4fZpaTw/m9Ps7ZI
	7jzbr7+lX+iw3FsQEU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiGl-0000000GWbC-1ydB;
	Fri, 20 Jun 2025 20:23:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiFj-0000000GWK1-2v4A
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 20:22:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-235d6de331fso32027585ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750450943; x=1751055743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3u5ONOsTo4xiMjAYOX1coDWwMwQnRIPf+PtEAf0Ubgs=;
        b=GsfcqKaLXENtOa1YAOoMmhiPkJ4HKc7XIb9WNL3xfY5pZzYft5EY4uTbW6aVdoRW/G
         UVMuJnBqpzm76hH1JZ86TawjTw8J+NEmWBfn99Tmlg6l9rGcJweTQVh6YUaKJi+oPbLS
         L0RWZxvq/OfrASQznpJsS/rrpgLHEfWWGtEhCuMCCEZT69PKwkqGILVSibDIjFHK8mVk
         en+rXMY9HkZCiZ7qm3fWJZoYeccFoSvBaDsfh3pYFghsIJYTGNCeKSv+eFWg+tjPITeM
         qGpWCdYYOupZwag5rpebOLtjxrOITtrsgtBOEU3Wb21eRu2XBRbpVUOW92an6Rjc2tiZ
         PrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750450943; x=1751055743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u5ONOsTo4xiMjAYOX1coDWwMwQnRIPf+PtEAf0Ubgs=;
        b=Deo7qAPFE2GSUyfwpF7Zt4uSoJI1ABSKQ1HsFHyPnHv14lklempVwYChuBs0IA+s+2
         cUfB4O8AmjfOTvOioAcLvUX03F7N4mQhnFo/LIy+ghk/UZK1SWNDP+AzGLyfvKsTMC1s
         /VwIs/SUTovdUvNXzs1BQ5O1dh2Opx8tToTG/BLajK9m6uVX27AGR5PbiRuHcfy8P7BZ
         lt3f/qtiR4yRt40Z65xizGJQNlZ38fIVN/rDp2ESAmXfFOejGsF3H5+QNHYkuzMgdUzw
         k+rg1M2VBg9i2IwFZPjW2R7Kj6s28D4pZ+YFxjXRxUeIJvsNqv34cVkVE8Sq+vD2rm+d
         6WqQ==
X-Gm-Message-State: AOJu0YyIWtrD+KPgnB9vwScb64+AKbjV4SYkr1Dbq6SnytPnwS7MFjPI
	T6UdfHH93pDq6T5JhnEHuxeJ2qtvqu1OUj881DHnLihb7ujpNt0xIcYk9+e+QaUI9LA=
X-Gm-Gg: ASbGncsyA5xgdO0zjNHOq8PjxOWv1t2urmWvZPaSSGfsD8vqVajDMNvUKu4s2qRWFZq
	hv7r1bPbnizR9WLn/zG5FclxMVBZyDHIPZ8jQR5TbCZZs+qqdWDllkKqr/a7LsYSJUvN+QItGlc
	PF7B58EujnvykLmyyZmMKJ5lv+vkElh9ifi0wJu57x9MyefaMCD1Z0s5FGVjPt8JyaYgQGY4zP+
	56zLI2tK24JtN8U0j8RFIIrgy/l4CG2k48KBVMXxKEQ1jclsRVzAzS20BrgRbX8udrqYCwU7yLe
	Znauue0KSanMYzY03r2ZxAaloW8WH7qaUd3sc1xJCylOb6JC+Evuueb2pC84LEymlgBxQyGb0GH
	GFZ/pulBj2CUpUeN1p1ZRsBWJEhVoIa4F6W4Cw02YGNJA
X-Google-Smtp-Source: AGHT+IF1AidpWULRPKu5iTE+TsMmiHHuryUXvQyrh8oicTTK5UkvbYPx+yhbOI4Jr5aRWM1z7sA7MQ==
X-Received: by 2002:a17:903:18e:b0:237:7802:da30 with SMTP id d9443c01a7336-237d9a74d4amr67094355ad.31.1750450943166;
        Fri, 20 Jun 2025 13:22:23 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860fb58sm24239005ad.99.2025.06.20.13.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:22:22 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jun 2025 20:21:59 +0000
Subject: [PATCH v5 3/3] riscv: Move all duplicate insn parsing macros into
 asm/insn.h
MIME-Version: 1.0
Message-Id: <20250620-dev-alex-insn_duplicate_v5_manual-v5-3-d865dc9ad180@rivosinc.com>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16348;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=0L/wjxkXqWWOrTF6mI/XPv0iLH/1kpBrrfC6HZculbM=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJCD30Q3lOU5PjMOcz+oanJZ+s2McsUve//nCfyXnl9M
 0HzzP7ejlIWBjEOBlkxRRYF84SuFvuz9bP/XHoPM4eVCWQIAxenAEyk7Dsjw6IUfo1b0+aaWFzq
 urZV+eb0coXCtko9n93ydjHtD3/s9mFkmM9e5K/DdonFbt8U/u6cSTGWJ5ffYPvx68fPf1f4vi1
 wZAAA
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132223_748546_6BD81215 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

kernel/traps_misaligned.c and kvm/vcpu_insn.c define the same macros to
extract information from the instructions.

Let's move the definitions into asm/insn.h to avoid this duplication.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h        | 171 ++++++++++++++++++++++++++++++++++-
 arch/riscv/kernel/traps_misaligned.c | 142 -----------------------------
 arch/riscv/kvm/vcpu_insn.c           | 126 --------------------------
 3 files changed, 166 insertions(+), 273 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index ac3e606feca2584494ce4c41afd64c5f22a65c44..ad26f859cfe5182288aeb57547369bfd1b05735d 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -286,11 +286,172 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	       (code & RVC_INSN_J_RS1_MASK) != 0;
 }
 
-#define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
-#define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
-#define RV_X_mask(X, s, mask)  (((X) >> (s)) & (mask))
-#define RV_X(X, s, n) RV_X_mask(X, s, ((1 << (n)) - 1))
-#define RVC_X(X, s, mask) RV_X_mask(X, s, mask)
+#define INSN_MATCH_LB		0x3
+#define INSN_MASK_LB		0x707f
+#define INSN_MATCH_LH		0x1003
+#define INSN_MASK_LH		0x707f
+#define INSN_MATCH_LW		0x2003
+#define INSN_MASK_LW		0x707f
+#define INSN_MATCH_LD		0x3003
+#define INSN_MASK_LD		0x707f
+#define INSN_MATCH_LBU		0x4003
+#define INSN_MASK_LBU		0x707f
+#define INSN_MATCH_LHU		0x5003
+#define INSN_MASK_LHU		0x707f
+#define INSN_MATCH_LWU		0x6003
+#define INSN_MASK_LWU		0x707f
+#define INSN_MATCH_SB		0x23
+#define INSN_MASK_SB		0x707f
+#define INSN_MATCH_SH		0x1023
+#define INSN_MASK_SH		0x707f
+#define INSN_MATCH_SW		0x2023
+#define INSN_MASK_SW		0x707f
+#define INSN_MATCH_SD		0x3023
+#define INSN_MASK_SD		0x707f
+
+#define INSN_MATCH_C_LD		0x6000
+#define INSN_MASK_C_LD		0xe003
+#define INSN_MATCH_C_SD		0xe000
+#define INSN_MASK_C_SD		0xe003
+#define INSN_MATCH_C_LW		0x4000
+#define INSN_MASK_C_LW		0xe003
+#define INSN_MATCH_C_SW		0xc000
+#define INSN_MASK_C_SW		0xe003
+#define INSN_MATCH_C_LDSP	0x6002
+#define INSN_MASK_C_LDSP	0xe003
+#define INSN_MATCH_C_SDSP	0xe002
+#define INSN_MASK_C_SDSP	0xe003
+#define INSN_MATCH_C_LWSP	0x4002
+#define INSN_MASK_C_LWSP	0xe003
+#define INSN_MATCH_C_SWSP	0xc002
+#define INSN_MASK_C_SWSP	0xe003
+
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_WFI		0xffffffff
+#define INSN_MATCH_WFI		0x10500073
+
+#define INSN_MASK_WRS		0xffffffff
+#define INSN_MATCH_WRS		0x00d00073
+
+#define INSN_MATCH_CSRRW	0x1073
+#define INSN_MASK_CSRRW		0x707f
+#define INSN_MATCH_CSRRS	0x2073
+#define INSN_MASK_CSRRS		0x707f
+#define INSN_MATCH_CSRRC	0x3073
+#define INSN_MASK_CSRRC		0x707f
+#define INSN_MATCH_CSRRWI	0x5073
+#define INSN_MASK_CSRRWI	0x707f
+#define INSN_MATCH_CSRRSI	0x6073
+#define INSN_MASK_CSRRSI	0x707f
+#define INSN_MATCH_CSRRCI	0x7073
+#define INSN_MASK_CSRRCI	0x707f
+
+#define INSN_MATCH_FLW		0x2007
+#define INSN_MASK_FLW		0x707f
+#define INSN_MATCH_FLD		0x3007
+#define INSN_MASK_FLD		0x707f
+#define INSN_MATCH_FLQ		0x4007
+#define INSN_MASK_FLQ		0x707f
+#define INSN_MATCH_FSW		0x2027
+#define INSN_MASK_FSW		0x707f
+#define INSN_MATCH_FSD		0x3027
+#define INSN_MASK_FSD		0x707f
+#define INSN_MATCH_FSQ		0x4027
+#define INSN_MASK_FSQ		0x707f
+
+#define INSN_MATCH_C_FLD	0x2000
+#define INSN_MASK_C_FLD		0xe003
+#define INSN_MATCH_C_FLW	0x6000
+#define INSN_MASK_C_FLW		0xe003
+#define INSN_MATCH_C_FSD	0xa000
+#define INSN_MASK_C_FSD		0xe003
+#define INSN_MATCH_C_FSW	0xe000
+#define INSN_MASK_C_FSW		0xe003
+#define INSN_MATCH_C_FLDSP	0x2002
+#define INSN_MASK_C_FLDSP	0xe003
+#define INSN_MATCH_C_FSDSP	0xa002
+#define INSN_MASK_C_FSDSP	0xe003
+#define INSN_MATCH_C_FLWSP	0x6002
+#define INSN_MASK_C_FLWSP	0xe003
+#define INSN_MATCH_C_FSWSP	0xe002
+#define INSN_MASK_C_FSWSP	0xe003
+
+#define INSN_MATCH_C_LHU		0x8400
+#define INSN_MASK_C_LHU			0xfc43
+#define INSN_MATCH_C_LH			0x8440
+#define INSN_MASK_C_LH			0xfc43
+#define INSN_MATCH_C_SH			0x8c00
+#define INSN_MASK_C_SH			0xfc43
+
+#define INSN_16BIT_MASK		0x3
+#define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
+#define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
+
+#define SHIFT_RIGHT(x, y)		\
+	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
+
+#define REG_MASK			\
+	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
+
+#define REG_OFFSET(insn, pos)		\
+	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
+
+#define REG_PTR(insn, pos, regs)	\
+	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
+
+#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
+#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
+#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
+#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
+#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
+#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
+#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
+#define IMM_I(insn)		((s32)(insn) >> 20)
+#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
+				 (s32)(((insn) >> 7) & 0x1f))
+
+#define SH_RD			7
+#define SH_RS1			15
+#define SH_RS2			20
+#define SH_RS2C			2
+#define MASK_RX			0x1f
+
+#if defined(CONFIG_64BIT)
+#define LOG_REGBYTES		3
+#else
+#define LOG_REGBYTES		2
+#endif
+
+#define MASK_FUNCT3		0x7000
+
+#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
+
+#define RV_IMM_SIGN(x)		(-(((x) >> 31) & 1))
+#define RVC_IMM_SIGN(x)		(-(((x) >> 12) & 1))
+#define RV_X_mask(X, s, mask)	(((X) >> (s)) & (mask))
+#define RV_X(X, s, n)		RV_X_mask(X, s, ((1 << (n)) - 1))
+#define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
+				 (RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 5, 1) << 6))
+#define RVC_LD_IMM(x)		((RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 5, 2) << 6))
+#define RVC_LWSP_IMM(x)		((RV_X(x, 4, 3) << 2) | \
+				 (RV_X(x, 12, 1) << 5) | \
+				 (RV_X(x, 2, 2) << 6))
+#define RVC_LDSP_IMM(x)		((RV_X(x, 5, 2) << 3) | \
+				 (RV_X(x, 12, 1) << 5) | \
+				 (RV_X(x, 2, 3) << 6))
+#define RVC_SWSP_IMM(x)		((RV_X(x, 9, 4) << 2) | \
+				 (RV_X(x, 7, 2) << 6))
+#define RVC_SDSP_IMM(x)		((RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 7, 3) << 6))
+#define RVC_RS1S(insn)		(8 + RV_X(insn, SH_RD, 3))
+#define RVC_RS2S(insn)		(8 + RV_X(insn, SH_RS2C, 3))
+#define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
+#define RVC_X(X, s, mask)	RV_X_mask(X, s, mask)
 
 #define RV_EXTRACT_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 1b69b91d7739c8b8ccb7b1605b6b4b88197b30a5..3d4106a6be2f9d593c0b05559436ae4df35e3463 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -20,148 +20,6 @@
 #include <asm/vector.h>
 #include <asm/insn.h>
 
-#define INSN_MATCH_LB			0x3
-#define INSN_MASK_LB			0x707f
-#define INSN_MATCH_LH			0x1003
-#define INSN_MASK_LH			0x707f
-#define INSN_MATCH_LW			0x2003
-#define INSN_MASK_LW			0x707f
-#define INSN_MATCH_LD			0x3003
-#define INSN_MASK_LD			0x707f
-#define INSN_MATCH_LBU			0x4003
-#define INSN_MASK_LBU			0x707f
-#define INSN_MATCH_LHU			0x5003
-#define INSN_MASK_LHU			0x707f
-#define INSN_MATCH_LWU			0x6003
-#define INSN_MASK_LWU			0x707f
-#define INSN_MATCH_SB			0x23
-#define INSN_MASK_SB			0x707f
-#define INSN_MATCH_SH			0x1023
-#define INSN_MASK_SH			0x707f
-#define INSN_MATCH_SW			0x2023
-#define INSN_MASK_SW			0x707f
-#define INSN_MATCH_SD			0x3023
-#define INSN_MASK_SD			0x707f
-
-#define INSN_MATCH_FLW			0x2007
-#define INSN_MASK_FLW			0x707f
-#define INSN_MATCH_FLD			0x3007
-#define INSN_MASK_FLD			0x707f
-#define INSN_MATCH_FLQ			0x4007
-#define INSN_MASK_FLQ			0x707f
-#define INSN_MATCH_FSW			0x2027
-#define INSN_MASK_FSW			0x707f
-#define INSN_MATCH_FSD			0x3027
-#define INSN_MASK_FSD			0x707f
-#define INSN_MATCH_FSQ			0x4027
-#define INSN_MASK_FSQ			0x707f
-
-#define INSN_MATCH_C_LD			0x6000
-#define INSN_MASK_C_LD			0xe003
-#define INSN_MATCH_C_SD			0xe000
-#define INSN_MASK_C_SD			0xe003
-#define INSN_MATCH_C_LW			0x4000
-#define INSN_MASK_C_LW			0xe003
-#define INSN_MATCH_C_SW			0xc000
-#define INSN_MASK_C_SW			0xe003
-#define INSN_MATCH_C_LDSP		0x6002
-#define INSN_MASK_C_LDSP		0xe003
-#define INSN_MATCH_C_SDSP		0xe002
-#define INSN_MASK_C_SDSP		0xe003
-#define INSN_MATCH_C_LWSP		0x4002
-#define INSN_MASK_C_LWSP		0xe003
-#define INSN_MATCH_C_SWSP		0xc002
-#define INSN_MASK_C_SWSP		0xe003
-
-#define INSN_MATCH_C_FLD		0x2000
-#define INSN_MASK_C_FLD			0xe003
-#define INSN_MATCH_C_FLW		0x6000
-#define INSN_MASK_C_FLW			0xe003
-#define INSN_MATCH_C_FSD		0xa000
-#define INSN_MASK_C_FSD			0xe003
-#define INSN_MATCH_C_FSW		0xe000
-#define INSN_MASK_C_FSW			0xe003
-#define INSN_MATCH_C_FLDSP		0x2002
-#define INSN_MASK_C_FLDSP		0xe003
-#define INSN_MATCH_C_FSDSP		0xa002
-#define INSN_MASK_C_FSDSP		0xe003
-#define INSN_MATCH_C_FLWSP		0x6002
-#define INSN_MASK_C_FLWSP		0xe003
-#define INSN_MATCH_C_FSWSP		0xe002
-#define INSN_MASK_C_FSWSP		0xe003
-
-#define INSN_MATCH_C_LHU		0x8400
-#define INSN_MASK_C_LHU			0xfc43
-#define INSN_MATCH_C_LH			0x8440
-#define INSN_MASK_C_LH			0xfc43
-#define INSN_MATCH_C_SH			0x8c00
-#define INSN_MASK_C_SH			0xfc43
-
-#define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
-
-#if defined(CONFIG_64BIT)
-#define LOG_REGBYTES			3
-#define XLEN				64
-#else
-#define LOG_REGBYTES			2
-#define XLEN				32
-#endif
-#define REGBYTES			(1 << LOG_REGBYTES)
-#define XLEN_MINUS_16			((XLEN) - 16)
-
-#define SH_RD				7
-#define SH_RS1				15
-#define SH_RS2				20
-#define SH_RS2C				2
-
-#define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
-					 (RV_X(x, 10, 3) << 3) | \
-					 (RV_X(x, 5, 1) << 6))
-#define RVC_LD_IMM(x)			((RV_X(x, 10, 3) << 3) | \
-					 (RV_X(x, 5, 2) << 6))
-#define RVC_LWSP_IMM(x)			((RV_X(x, 4, 3) << 2) | \
-					 (RV_X(x, 12, 1) << 5) | \
-					 (RV_X(x, 2, 2) << 6))
-#define RVC_LDSP_IMM(x)			((RV_X(x, 5, 2) << 3) | \
-					 (RV_X(x, 12, 1) << 5) | \
-					 (RV_X(x, 2, 3) << 6))
-#define RVC_SWSP_IMM(x)			((RV_X(x, 9, 4) << 2) | \
-					 (RV_X(x, 7, 2) << 6))
-#define RVC_SDSP_IMM(x)			((RV_X(x, 10, 3) << 3) | \
-					 (RV_X(x, 7, 3) << 6))
-#define RVC_RS1S(insn)			(8 + RV_X(insn, SH_RD, 3))
-#define RVC_RS2S(insn)			(8 + RV_X(insn, SH_RS2C, 3))
-#define RVC_RS2(insn)			RV_X(insn, SH_RS2C, 5)
-
-#define SHIFT_RIGHT(x, y)		\
-	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
-
-#define REG_MASK			\
-	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
-
-#define REG_OFFSET(insn, pos)		\
-	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
-
-#define REG_PTR(insn, pos, regs)	\
-	(ulong *)((ulong)(regs) + REG_OFFSET(insn, pos))
-
-#define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
-#define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
-#define GET_RS1S(insn, regs)		(*REG_PTR(RVC_RS1S(insn), 0, regs))
-#define GET_RS2S(insn, regs)		(*REG_PTR(RVC_RS2S(insn), 0, regs))
-#define GET_RS2C(insn, regs)		(*REG_PTR(insn, SH_RS2C, regs))
-#define GET_SP(regs)			(*REG_PTR(2, 0, regs))
-#define SET_RD(insn, regs, val)		(*REG_PTR(insn, SH_RD, regs) = (val))
-#define IMM_I(insn)			((s32)(insn) >> 20)
-#define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
-					 (s32)(((insn) >> 7) & 0x1f))
-#define MASK_FUNCT3			0x7000
-
-#define GET_PRECISION(insn) (((insn) >> 25) & 3)
-#define GET_RM(insn) (((insn) >> 12) & 7)
-#define PRECISION_S 0
-#define PRECISION_D 1
-
 #ifdef CONFIG_FPU
 
 #define FP_GET_RD(insn)		(insn >> 7 & 0x1F)
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 62cb2ab4b63680d9d436c12bb2faae94e7988761..de1f96ea62251ff8ab45eddcf2e976f0e0d1da29 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -10,132 +10,6 @@
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 
-#define INSN_OPCODE_MASK	0x007c
-#define INSN_OPCODE_SHIFT	2
-#define INSN_OPCODE_SYSTEM	28
-
-#define INSN_MASK_WFI		0xffffffff
-#define INSN_MATCH_WFI		0x10500073
-
-#define INSN_MASK_WRS		0xffffffff
-#define INSN_MATCH_WRS		0x00d00073
-
-#define INSN_MATCH_CSRRW	0x1073
-#define INSN_MASK_CSRRW		0x707f
-#define INSN_MATCH_CSRRS	0x2073
-#define INSN_MASK_CSRRS		0x707f
-#define INSN_MATCH_CSRRC	0x3073
-#define INSN_MASK_CSRRC		0x707f
-#define INSN_MATCH_CSRRWI	0x5073
-#define INSN_MASK_CSRRWI	0x707f
-#define INSN_MATCH_CSRRSI	0x6073
-#define INSN_MASK_CSRRSI	0x707f
-#define INSN_MATCH_CSRRCI	0x7073
-#define INSN_MASK_CSRRCI	0x707f
-
-#define INSN_MATCH_LB		0x3
-#define INSN_MASK_LB		0x707f
-#define INSN_MATCH_LH		0x1003
-#define INSN_MASK_LH		0x707f
-#define INSN_MATCH_LW		0x2003
-#define INSN_MASK_LW		0x707f
-#define INSN_MATCH_LD		0x3003
-#define INSN_MASK_LD		0x707f
-#define INSN_MATCH_LBU		0x4003
-#define INSN_MASK_LBU		0x707f
-#define INSN_MATCH_LHU		0x5003
-#define INSN_MASK_LHU		0x707f
-#define INSN_MATCH_LWU		0x6003
-#define INSN_MASK_LWU		0x707f
-#define INSN_MATCH_SB		0x23
-#define INSN_MASK_SB		0x707f
-#define INSN_MATCH_SH		0x1023
-#define INSN_MASK_SH		0x707f
-#define INSN_MATCH_SW		0x2023
-#define INSN_MASK_SW		0x707f
-#define INSN_MATCH_SD		0x3023
-#define INSN_MASK_SD		0x707f
-
-#define INSN_MATCH_C_LD		0x6000
-#define INSN_MASK_C_LD		0xe003
-#define INSN_MATCH_C_SD		0xe000
-#define INSN_MASK_C_SD		0xe003
-#define INSN_MATCH_C_LW		0x4000
-#define INSN_MASK_C_LW		0xe003
-#define INSN_MATCH_C_SW		0xc000
-#define INSN_MASK_C_SW		0xe003
-#define INSN_MATCH_C_LDSP	0x6002
-#define INSN_MASK_C_LDSP	0xe003
-#define INSN_MATCH_C_SDSP	0xe002
-#define INSN_MASK_C_SDSP	0xe003
-#define INSN_MATCH_C_LWSP	0x4002
-#define INSN_MASK_C_LWSP	0xe003
-#define INSN_MATCH_C_SWSP	0xc002
-#define INSN_MASK_C_SWSP	0xe003
-
-#define INSN_16BIT_MASK		0x3
-
-#define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
-
-#define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
-
-#ifdef CONFIG_64BIT
-#define LOG_REGBYTES		3
-#else
-#define LOG_REGBYTES		2
-#endif
-#define REGBYTES		(1 << LOG_REGBYTES)
-
-#define SH_RD			7
-#define SH_RS1			15
-#define SH_RS2			20
-#define SH_RS2C			2
-#define MASK_RX			0x1f
-
-#define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
-				 (RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 5, 1) << 6))
-#define RVC_LD_IMM(x)		((RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 5, 2) << 6))
-#define RVC_LWSP_IMM(x)		((RV_X(x, 4, 3) << 2) | \
-				 (RV_X(x, 12, 1) << 5) | \
-				 (RV_X(x, 2, 2) << 6))
-#define RVC_LDSP_IMM(x)		((RV_X(x, 5, 2) << 3) | \
-				 (RV_X(x, 12, 1) << 5) | \
-				 (RV_X(x, 2, 3) << 6))
-#define RVC_SWSP_IMM(x)		((RV_X(x, 9, 4) << 2) | \
-				 (RV_X(x, 7, 2) << 6))
-#define RVC_SDSP_IMM(x)		((RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 7, 3) << 6))
-#define RVC_RS1S(insn)		(8 + RV_X(insn, SH_RD, 3))
-#define RVC_RS2S(insn)		(8 + RV_X(insn, SH_RS2C, 3))
-#define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
-
-#define SHIFT_RIGHT(x, y)		\
-	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
-
-#define REG_MASK			\
-	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
-
-#define REG_OFFSET(insn, pos)		\
-	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
-
-#define REG_PTR(insn, pos, regs)	\
-	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
-
-#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
-
-#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
-#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
-#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
-#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
-#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
-#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
-#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
-#define IMM_I(insn)		((s32)(insn) >> 20)
-#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
-				 (s32)(((insn) >> 7) & 0x1f))
-
 struct insn_func {
 	unsigned long mask;
 	unsigned long match;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
