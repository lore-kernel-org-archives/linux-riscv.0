Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14779C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRfsD0jcybiQGwL8IaVpwcPaBqiJ3w0Yt1ydMVvtPJA=; b=fNHLpW/PcnAWzD
	GtfbQkaSkpfnBIbhx3H+2SRMvlA6ywC4U+/UFDGmpRrD+Zd9iWtoStIRd7+LlgmkVCT/GfcllcqWR
	ZY2469lW+KEionkY7HM5YhwA6Gl6WwO8hNVxs1zQEGB4SspY00XajStvmCUKgsuRPCBBPWQlDqN9m
	MieE+lgx6nUYWZg7/3td6IdVGRd4BDvzc6xbyp2tWr7EHhRq8MCBySS6q5fpuo4Nmdb2aMp16zR2M
	tsy4Fk+27GvRF7C3a3LdY0698mRaK4BnzQxOWWCXu+ddxkEOznm3tuF1PtG35GmUdGDjqIL0JWKhy
	21MV7zGQjsoe0fUy5Jug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79VT-00000006TEe-2zZB;
	Tue, 22 Apr 2025 09:01:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78zM-00000006JGv-1plJ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:28:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso42535075e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745310499; x=1745915299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/CWCUS8RZp7wYAyaOgQhTSp6Kw3lGqKkpYYUX0Fosc=;
        b=WSCjnbe0hRgB+H7xGpwtOjoeXZulncTxGEP9kDHLfZhyMEtRVGow37LlyqSpulkzKx
         pLkX3aRJennLA8kuwvkQG5+AI0M3vY+l/kh3cOKOmfGn0BfL+H9W687XEZkTqAKTvTBk
         owZ7/EfCEPvehm76GjBgFmYuJpp8QbsOGrVtd/mZE0/KfqV/HmNxb5UMY3h1RRugBvQm
         2E1x01JgeGkF8Pp1tk1yj+b7yKzXcc4zK7JAuDQC2OYQ6vWkUHMkeQ81uxx0XHxAVpSu
         ECp2tKEM2jnrKVC9SJtmUlZUmIKFOv4RF0ljXT/s18UgrqfYEhhuIKh0baOhdC2+jSUs
         X60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310499; x=1745915299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/CWCUS8RZp7wYAyaOgQhTSp6Kw3lGqKkpYYUX0Fosc=;
        b=cXOVl6Rg3eTcI/bAJo5SNnEynGOc8IGuE3vCivGhVjJ955iO/W2uR6sOTwr05C2m3U
         nLcbhT+klD6a+0yD5TT6Igpbck0MMvIYrefistixIREIlcEAkarqJ+yj7ZjvjVKypmhq
         krcGKemdAX1X/MnK/3Pncfu5vgqmfiEYxmN0GkEY/4RBEbjypIJD/SqylsL8QeFVn96w
         krSRHlHDQ8q5oc9EhJTUnt/z+IFbOA+dWjC25JcjT/Q3w5nG9M4b8zLlKvcRA7wEyhcA
         3xA7iwW8K7yN2j5JY2xRSpf3kskFx00W5t5vvXnWvoGlImVfxySUQYQpeRz/HMzXJyhK
         yLww==
X-Forwarded-Encrypted: i=1; AJvYcCW6jQMTWkkOlSQQSfSWpYCVK5kAAWsnKgldZEj3n84OiCegN7fjENJOYBB6MZL9FTpBFmhkjTYWfCJmEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YztivsNq2M1lrbcntZVXBRAqEQsrsGgDeW46RXl3WXstZ3ukmHx
	jUtNXNNLtGj06OJNqWXf1frYfJzcnDqM0pobvGKDgc7jclzFGZesb5GYpAiUo7Q=
X-Gm-Gg: ASbGncvzCneykP7VtLghMNA2nuOw1ShxU1rzhlB75r1bG+weUcxLhgJ9lCHw8LuNy39
	D1HuQUJsPZwU8jFBuTWfUJrwbllHZf3Fn2Ux9xDAe3ubFMzZSIQPpTvW/ksm9jxFD6awgN0/DEa
	vYC++0RTScvV3i8lKUvEx0n7iIFziXfk6VFPAzG6hEUyiEp5oJU1GqmbgmQv/YqmhXnUE8BOIjX
	yfcn8KE1a8HicPxo8oMhr61jkpZSxIMPduhEeLyVao11I30wbLvf1eUD/jTOVsFY2vzMKESu6jk
	KrMqRWYy6VCMXTfVYXQF91qvYuluIlS0d0Kpv7iRMfVPqddg/Hq3JGYrRsP2
X-Google-Smtp-Source: AGHT+IFSWVo9NWDw8V+FnM5OEUrKvEr9dTbKJocHVSXXrmftZ+qP74WovMP3SHSeGzg2pLC8DuboWQ==
X-Received: by 2002:a05:6000:2907:b0:38d:e304:7470 with SMTP id ffacd0b85a97d-39efba5aa2cmr12153663f8f.25.1745310498759;
        Tue, 22 Apr 2025 01:28:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:9fbe:20e3:2fc3:8d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207afsm14573930f8f.12.2025.04.22.01.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:28:18 -0700 (PDT)
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
Subject: [PATCH 2/3] riscv: Strengthen duplicate and inconsistent definition of RV_X()
Date: Tue, 22 Apr 2025 10:25:44 +0200
Message-Id: <20250422082545.450453-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250422082545.450453-1-alexghiti@rivosinc.com>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_012820_557572_36009776 
X-CRM114-Status: GOOD (  10.73  )
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
index 2a589a58b291..4063ca35be9b 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -288,43 +288,44 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 
 #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
 #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
-#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
-#define RVC_X(X, s, mask) RV_X(X, s, mask)
+#define RV_X(X, s, n) (((X) >> (s)) & ((1 << (n)) - 1))
+#define RV_X_mask(X, s, mask)  (((X) >> (s)) & (mask))
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
