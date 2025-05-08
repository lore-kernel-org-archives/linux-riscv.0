Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150A4C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRrFLITuPoNSjp8wo391xX4bSNQ65xjB4K74bY9CMuA=; b=z8yjgxMql3vmy9
	UG+PL/kiFoSSmOQjQe/uMaEbfZHMiUvcBbqaiK+6ptgPvCEGwb1qjBRvhaTGcYjEvykfdBSqYDzqY
	g4rjZ96G4poHbAg2/Qx9Uwt7aKPyuqtJDjaz9vTkptQGv7OQ+ct4JyDIwTMTtia42YcP9eYV2Um1J
	OAv9XIVRMa3i9kPKeaPtCzDRwxO7fZMwJbp+WN7GCv4DPNemSO7YCS5Z3y0EcvP9j1rV8FYtDz2ar
	U9H8yEYltFF8eoae8okT5wAqDVAXP/6pWTiDjpGO2dipII0u8zlYIi09fLilLJp2WTUWnHKlFy1Ez
	j6zuSvTjBXc2ae8OKRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwlN-000000008Zh-2B2n;
	Thu, 08 May 2025 08:37:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwYJ-000000006Mi-1fce
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 08:24:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so4555345e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 01:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746692662; x=1747297462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuPapDRP/OJYb/JxVpYS+I7DwtI999Hhv/OzI9C3VrY=;
        b=CuFo8AxVBIF76/+vi5i2Gv2NpD2FMwLZllZbZ/o2ofmftHs8Uv65LTvMOoo57QDNEf
         Xd1HMByORq0wz+Z1cXc+3XjZoiRti2cI/iWAfN+y7aSj4WVx6LMMmsWGK2JkDrdqLWOj
         2ZLTh13bJUui4qcpAlFHK7Thnld+BgsMrOAtlMXjbvpp2vZ6N2JERz5sOK/gH8D6Mwl/
         DD6UMTGE1PlO/cqIKi9we9MPQPPv/Tm6qNgymRtqm5lnIElK7QHqkN1iGCyJHW1ACOUJ
         giZaaDbrqeSPXjlN3uoYg+A9GKLtaVjqpRib93376yU2A8MSi60gOenIM8jMJCI17F90
         nXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692662; x=1747297462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuPapDRP/OJYb/JxVpYS+I7DwtI999Hhv/OzI9C3VrY=;
        b=ZJGkQtRQ6E9FX7yJSsBDRg8WAPBVBzUpPl8ohkbOtP9GhGXwGxb1cvFaG1aHPgt6gf
         cRa53qJnitcbyaVy23lBTwnPImn0xP0s4XOd5KyxrvwLgrHR4Ee8usEqOCWZcd5W9QQ2
         SZlCY+6lwjrAAbrnfpmlouMXi8l6OMy53WgSjNf1g+qLEK5ynXh/2t9VPLGQyDHlsDmr
         CIJC9olQW6/v+OQN70yRN8rE8n6EOkn50iKhBKbORYcQq6E4pkmtONW6tv1ZJiEOVt6H
         2MDP6+gsN+m9ZFpLWLPUgzBaQrfD9blvnj85IQcj1/CXUu4gdVj20bvmbg+FSS1I3UHr
         TCBw==
X-Forwarded-Encrypted: i=1; AJvYcCU3r0uolyfsYMnFAiY7KxI8sAzWhjYlOa7jkbjBo9VFB2PKMh4rC7nEBRaz5/OyQ9cW4Nl8JPmy5XNHAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx94LXzZQNgVZHA+zNq5OUYkr+Z4KzZXc2PI2UaWx4GGCNIXdw6
	wGoaTg1PdpHfxndL8DamLUYtbyH5WnxAxQZsZ/7B4D7UEkiU5459q9WXOltz3Ac=
X-Gm-Gg: ASbGncvxMBMJyxYzMmaJF7BfNyNuZpfmzG206ehQ9Bn1YbpBGX/oSa1IX3Xzbf6yYP1
	/cBZ2eWPMd4Uu2UoJx9Ctb/JnuU+uz1Pvniy/1xFubv2kzne5gEGSGmHbOtQna/2LCQnVSVRS+s
	fPACw2gb077opFSc5rrWyV/7pmsgQrrL37DopPPk5s5vT3LkZsCrXzNkSFWk/gJ3sA8iO/s4JMB
	A3n505sW3PLynePlP3CiU1cpTjXR89Z5sZcWIy+3/VB27/N3ZVKk9I0YocUld45u17sBRKlb8Og
	3EoKCXJ+eVyHgAp4/UNPDbLOaQwcWvxkMPvgYrY0yMqe1S+4bJk=
X-Google-Smtp-Source: AGHT+IEnEvDZVvyjWPKnOAG4dlx+tDzdySwIdn8aIF4iBX0NclzVjAzc6QAKF5pKumGu5cZ4Nhx5mw==
X-Received: by 2002:a05:600c:1c93:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-442d02f82d6mr24406445e9.16.1746692661936;
        Thu, 08 May 2025 01:24:21 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd351327sm28113895e9.24.2025.05.08.01.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:24:21 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 2/3] riscv: Strengthen duplicate and inconsistent definition of RV_X()
Date: Thu,  8 May 2025 10:22:14 +0200
Message-Id: <20250508082215.88658-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250508082215.88658-1-alexghiti@rivosinc.com>
References: <20250508082215.88658-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_012423_436945_F669D3A3 
X-CRM114-Status: GOOD (  10.39  )
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

RV_X() macro is defined in two different ways which is error prone.

So harmonize its first definition and add another macro RV_X_mask() for
the second one.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
 arch/riscv/kernel/elf_kexec.c        |  1 -
 arch/riscv/kernel/traps_misaligned.c |  1 -
 arch/riscv/kvm/vcpu_insn.c           |  1 -
 4 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 2a589a58b291..ac3e606feca2 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -288,43 +288,44 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 
 #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
 #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
-#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
-#define RVC_X(X, s, mask) RV_X(X, s, mask)
+#define RV_X_mask(X, s, mask)  (((X) >> (s)) & (mask))
+#define RV_X(X, s, n) RV_X_mask(X, s, ((1 << (n)) - 1))
+#define RVC_X(X, s, mask) RV_X_mask(X, s, mask)
 
 #define RV_EXTRACT_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
+	(RV_X_mask(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
 
 #define RV_EXTRACT_RD_REG(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
+	(RV_X_mask(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
 
 #define RV_EXTRACT_UTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
+	(RV_X_mask(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
 
 #define RV_EXTRACT_JTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
-	(RV_X(x_, RV_J_IMM_11_OPOFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OFF) | \
-	(RV_X(x_, RV_J_IMM_19_12_OPOFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OFF) | \
+	(RV_X_mask(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
+	(RV_X_mask(x_, RV_J_IMM_11_OPOFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OFF) | \
+	(RV_X_mask(x_, RV_J_IMM_19_12_OPOFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OFF) | \
 	(RV_IMM_SIGN(x_) << RV_J_IMM_SIGN_OFF); })
 
 #define RV_EXTRACT_ITYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RV_I_IMM_11_0_OPOFF, RV_I_IMM_11_0_MASK)) | \
+	(RV_X_mask(x_, RV_I_IMM_11_0_OPOFF, RV_I_IMM_11_0_MASK)) | \
 	(RV_IMM_SIGN(x_) << RV_I_IMM_SIGN_OFF); })
 
 #define RV_EXTRACT_BTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RV_B_IMM_4_1_OPOFF, RV_B_IMM_4_1_MASK) << RV_B_IMM_4_1_OFF) | \
-	(RV_X(x_, RV_B_IMM_10_5_OPOFF, RV_B_IMM_10_5_MASK) << RV_B_IMM_10_5_OFF) | \
-	(RV_X(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
+	(RV_X_mask(x_, RV_B_IMM_4_1_OPOFF, RV_B_IMM_4_1_MASK) << RV_B_IMM_4_1_OFF) | \
+	(RV_X_mask(x_, RV_B_IMM_10_5_OPOFF, RV_B_IMM_10_5_MASK) << RV_B_IMM_10_5_OFF) | \
+	(RV_X_mask(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
 	(RV_IMM_SIGN(x_) << RV_B_IMM_SIGN_OFF); })
 
 #define RVC_EXTRACT_C2_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
+	(RV_X_mask(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
 
 #define RVC_EXTRACT_JTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
@@ -346,10 +347,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
 
 #define RVG_EXTRACT_SYSTEM_CSR(x) \
-	({typeof(x) x_ = (x); RV_X(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
+	({typeof(x) x_ = (x); RV_X_mask(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
 
 #define RVFDQ_EXTRACT_FL_FS_WIDTH(x) \
-	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
+	({typeof(x) x_ = (x); RV_X_mask(x_, RVFDQ_FL_FS_WIDTH_OFF, \
 				   RVFDQ_FL_FS_WIDTH_MASK); })
 
 #define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
@@ -375,10 +376,10 @@ static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
 {
 	/* drop the old IMMs, all jal IMM bits sit at 31:12 */
 	*insn &= ~GENMASK(31, 12);
-	*insn |= (RV_X(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
-		 (RV_X(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
-		 (RV_X(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
-		 (RV_X(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
+	*insn |= (RV_X_mask(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
+		 (RV_X_mask(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
+		 (RV_X_mask(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
+		 (RV_X_mask(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
 }
 
 /*
diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index e783a72d051f..15e6a8f3d50b 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -336,7 +336,6 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	return ret ? ERR_PTR(ret) : NULL;
 }
 
-#define RV_X(x, s, n)  (((x) >> (s)) & ((1 << (n)) - 1))
 #define RISCV_IMM_BITS 12
 #define RISCV_IMM_REACH (1LL << RISCV_IMM_BITS)
 #define RISCV_CONST_HIGH_PART(x) \
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 4354c87c0376..fb2599d62752 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -105,7 +105,6 @@
 #define SH_RS2				20
 #define SH_RS2C				2
 
-#define RV_X(x, s, n)			(((x) >> (s)) & ((1 << (n)) - 1))
 #define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
 					 (RV_X(x, 10, 3) << 3) | \
 					 (RV_X(x, 5, 1) << 6))
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e6989..ba4813673f95 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -91,7 +91,6 @@
 #define SH_RS2C			2
 #define MASK_RX			0x1f
 
-#define RV_X(x, s, n)		(((x) >> (s)) & ((1 << (n)) - 1))
 #define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
 				 (RV_X(x, 10, 3) << 3) | \
 				 (RV_X(x, 5, 1) << 6))
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
