Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6234EC54754
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHVX+iwJcsfWJxUwtRTe7p0iR43a501v3NEMdDyAy9k=; b=sHcvlwrv/TV9sI
	9Q1z1v8PqJWDt4udjJq36fXrx4ltdlmVH34Ebj72vWsahsi8oFcIuSZ38sZ1OTx5VFyr7OFK9iHwU
	ER24UdQSHNHlfX8TXmF5CiN2bvpSIos5pbpi1TLGB50ozBJcom108YxbdkVrddQPUBycaVveT7eaL
	nMX1n1OY5CrN93ySTAIiGObokn3uBLrx1OICbyDRKw0rHLUnk1arHsR8g443NOpSR0QaElbi8Bhey
	mDyFsz6ti/WuWS2Wak92foiVYHeZoLwsP1iHaliuXycvupgQY0EtrRF7B6uVbndi1qrFCsDYRzfRV
	9HeptLD/NqWA6QL6LeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwL6-00000003iFi-2CaG;
	Fri, 16 May 2025 14:47:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvlO-00000003cfE-03Kr
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 14:10:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a35b7e60cbso1119371f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747404612; x=1748009412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IFDT/Z0eU8ynKvSevEJyO30COLe0P/GAezwqL9/DGg=;
        b=XwZMKjyXdnDSU+5tJH8Z4OavPTFITClBTAHLQcoo6NBct4AE+tTu6sI7xCtyb/GufY
         kDzcQuNGMPanbvswMDaous4sbE3x0T3waPliCTRgpjgIyI9oC62HMdW//zuogIrACBGq
         W/veQATzZfx1n7NX58C6NyhGYrKT4kAuOK8rvRCS+ej1XGZtrJ9MyoMxj2eL0DwL3zmn
         12BzXn5uIewczNahIaVpUFkm8xLSjNPbIHhHDqmkDOwewoVbzJ6n3nWBE6feBupUnKq1
         I/NhK88yDWQ1wXWxYb8icHkAWYzZiyQ/wthFCzYT63jUpAIPl0hhKAcbaRFVOg8ofQjG
         IzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404612; x=1748009412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IFDT/Z0eU8ynKvSevEJyO30COLe0P/GAezwqL9/DGg=;
        b=mA9emRjxGFu4quqRMd0uI4mz1KeilN6DNIw5hoW3PwJmJHKmw1yL/uj7QsWYvNwZ1/
         LsYVuMhYp4fCGjIfmLoRbjaA8M3Z7NugU5nWAgPxQ2JYdF0XIt3FQTRJQ5QNaFXb/qbc
         sY7tAhFFpq71JorQjauUp8wPRjCHvppBA9VRczyLIKC753deEB8h0x+U15q+l4bZTKAA
         e0c/uhC0FI3TTyuc9zZ16CGK63qGUGV13ZRpxlU2qIMMYfIQ20nabPZBu6AT5oJ6gHOQ
         X50mRu5fgXljtM/KsVWFVAYSB9Jzv1HMQnbfHvP/aTYQ+2psWGgAz0YadIZIBo1HknyB
         UNWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtcMCXpmMhGyV9S9yZC5EvxYAio7K9P/1S525J86FbrkODa9HxeCjypuhrubwPJB2rFN2Z+TctRqECzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmjS292Gdgs/gXE8aWqM2ygeZLHRl104Ess0UoDR3F2DlHHdUv
	wWsVfArOGxJiLQ1nCVY2kYJRySB0GeEbymAcCImvVFKYMDkcnT1xFtnE5h6t/OYnWXo=
X-Gm-Gg: ASbGncuUjbL3ATiuPO7+ZdDUX4XP5IFCuA9leDC7gQCOGWNpT0qiNAMjpdRnujd0V5Q
	TzJTjPnCm8LSHVvwk4tPPnz6enFuGvNPHx1iR9nI47JUXYM6o18QJ6eR4hHrgjBqe3Boqp4GP2g
	EO0+HDqAwJQLqB1YwOOLSXijlHSu8eiRIftZebadNQOxU9ipW5i06X1tbC2xU1dEhgLl9L7D+hI
	3EjeNuSk/wQtvlvAhov0NXBgztw556B9rvUdRR1OumS4U4Mb5U1VYP6gbfHK9igCezNBF9fNLFx
	/qK24Re0PVfrrLNgfJLXp/1yff4t4NQwltE5xg3hGThCcb+5PDllPmgWb8A4Kw==
X-Google-Smtp-Source: AGHT+IE3DI05AXUI5qsb4s4PKO6MYBsqRRrry5Op3KCBIII8gOekr8aHR0w5shNYqLq6bylWnC4cOA==
X-Received: by 2002:a05:6000:2012:b0:3a0:b8ba:849f with SMTP id ffacd0b85a97d-3a35ca76681mr3216586f8f.4.1747404609957;
        Fri, 16 May 2025 07:10:09 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:b6d5:4f19:6a91:78f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88957sm2934229f8f.75.2025.05.16.07.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:10:09 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 2/3] riscv: Strengthen duplicate and inconsistent definition of RV_X()
Date: Fri, 16 May 2025 16:08:04 +0200
Message-Id: <20250516140805.282770-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250516140805.282770-1-alexghiti@rivosinc.com>
References: <20250516140805.282770-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_071014_044441_30C6489A 
X-CRM114-Status: GOOD (  11.11  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h          | 39 +++++++++++++-------------
 arch/riscv/kernel/machine_kexec_file.c |  2 +-
 arch/riscv/kernel/traps_misaligned.c   |  2 +-
 arch/riscv/kvm/vcpu_insn.c             |  2 +-
 4 files changed, 23 insertions(+), 22 deletions(-)

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
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index e36104af2e24..5c2ed4c396e9 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/vmalloc.h>
 #include <asm/setup.h>
+#include <asm/insn.h>
 
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&elf_kexec_ops,
@@ -109,7 +110,6 @@ static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 }
 #endif
 
-#define RV_X(x, s, n)  (((x) >> (s)) & ((1 << (n)) - 1))
 #define RISCV_IMM_BITS 12
 #define RISCV_IMM_REACH (1LL << RISCV_IMM_BITS)
 #define RISCV_CONST_HIGH_PART(x) \
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 77c788660223..ac8f479a3f9c 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -17,6 +17,7 @@
 #include <asm/hwprobe.h>
 #include <asm/cpufeature.h>
 #include <asm/vector.h>
+#include <asm/insn.h>
 
 #define INSN_MATCH_LB			0x3
 #define INSN_MASK_LB			0x707f
@@ -112,7 +113,6 @@
 #define SH_RS2				20
 #define SH_RS2C				2
 
-#define RV_X(x, s, n)			(((x) >> (s)) & ((1 << (n)) - 1))
 #define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
 					 (RV_X(x, 10, 3) << 3) | \
 					 (RV_X(x, 5, 1) << 6))
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e6989..62cb2ab4b636 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -8,6 +8,7 @@
 #include <linux/kvm_host.h>
 
 #include <asm/cpufeature.h>
+#include <asm/insn.h>
 
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
@@ -91,7 +92,6 @@
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
