Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B46FC7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 20:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKkIKaB492d40NGjz9oFRGSb8RCguDJOqSMCGi37/x0=; b=CWuKMZEZjg3tEP
	BzFcfJLdLVqK8gWJ3DB/wyoSalmhfbwnlEGZi46gYyhqBJIl2VCqtBpqK0q8w1EawqWsnRWjg2omT
	/z3ujIe5XBwAPUn4f3YbU0vGFcXcCx0feEy11S4b4a/avyaVpjgGea7b5ZMMaDs1u61m/elhSWNPD
	Imv20TD52/tG/ShAhfM4fPyLlETj7qoXQusq5h10Dx3OYLrgDBamhYJUiOXKSrhRglJhPrFw67Oec
	lyNtSvNAjdM2yFwhgnYvAyioBim0VnnVbvysRPXnBqu8Fstds1tgO9coFzBSVodz/dNM1nONGtFPH
	lEQEFoo/oEELF4VPl11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiGj-0000000GWZ5-3WAb;
	Fri, 20 Jun 2025 20:23:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiFg-0000000GWIg-0sD4
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 20:22:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-236192f8770so16074905ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 13:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750450939; x=1751055739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkEX4rpjq7p6WD5IMKA2IyXzEVHdMDVkgNg15alekzg=;
        b=RozYlG5fwVLvPhN8wLxnHcKTDXqGedjPTZkWUco78V7demShd0M+vlJi36aaHrJP9m
         Jp2gMu2Mn9KUBxK7EzQqpoHI/hIX6X4unqG7F7GgQFAJOJ62fFrQWKpNKnfFNNJlv8ZG
         ZHAl8hWIUQizsfg0FXKCh4FpWSVZ//moIvn3Yad9/fTQAYoAo6svzpwrB3BEk1hzCv0v
         LREKELrFabcVx6v27jCYeSp7ROAab9xX9zhvGpDSDQqp+YzdmIXt/sZwHOgSFMcwwSqT
         /vonAkdj5cIy1EdBlPC2DUwXbQCa4NQApvzHoxNCV5JaUfXvtRxhyV+BVoJmp0fMqtBf
         ZO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750450939; x=1751055739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkEX4rpjq7p6WD5IMKA2IyXzEVHdMDVkgNg15alekzg=;
        b=sGAUMpLW6KJ7E8Vdb8EluyPERVcAEwy85zxbjd3Nx+oKNcC8xKN4p1y5vFSLZ18q2A
         5O1VPzvs2Vbx5M3CwNwZfZWjp5Qg9Wi7xjYD0Nq5hL1briHjFHYrHnnQp/Qyu4mwnoyX
         yb69BMzFWaQ8hoJeVhdEvklEqYNtGgcKGCM7x6ZUvGW88deBHgYur1G2W8z9m9OfKH19
         g0QlShH4u97Bjm0+JC2qTPvZpVn+BDlbU5bEyyQ8WtBrgrIptJsVQxugk8uf8/xJIe8l
         Wiy61vReM3M1JFJhQ4GHd/vMXl2FcYU6iTUPuxw//q0y4eLk8i/etZsKVEb8l4QkatE1
         4GOQ==
X-Gm-Message-State: AOJu0Yx19QVdtkU8b4n4fAlDpPZ8xrUfzrX1v40a1QOnaXddt5TNhagP
	cfgSnNjdl6Yu+z2+0TZIVe/3prDGR+id/J+mDXlo+su3VM6Yuj5ggOKFeEG2cFodsL8=
X-Gm-Gg: ASbGncuAHt3lfMtefGcwcAGi7Ereivu4ymTNydcjXVzQ+8boeKZSSV4b21kPKtd8jjz
	xiDB8D/7QwO/Q45GzNyfNqhW+kZDTw1QMaMpHQI6rgb3q/tigtMgFX5Np/p9CO0iKM5kStSo1Ld
	nYhf1Q9Q67dsA87a14ZAZ+D7ws9E9qVqw5le4c7JvV2w2/Ov2P2c97mvXQFtadwHfxRvrxU9vAD
	4w/Vxv2W6zQV15Ocqkhp9gDsH9ImB0VnHvy8Zc2ab375EsivekESbFFM24B6UMDtDh5+DuIzEoF
	4ScHS3di2UupQmSeDKtblAA1VknK9pOJUFU5Jx6cEphhRFsnK5GXKMR3ZJeuFrscPkMZYEyu0sq
	0yY7oMVVTTO3KBL8B2lpOYfzfQWy8KuhjllozChhEY3DL
X-Google-Smtp-Source: AGHT+IEGbDx2L0uhp1l68AXPB4oKTeswGNYaYazB8bKKifgSCD07xtvqs/Vw7e6uATFM9kf9PdX0sg==
X-Received: by 2002:a17:902:e54e:b0:215:6c5f:d142 with SMTP id d9443c01a7336-237db0d5a62mr50236945ad.20.1750450939429;
        Fri, 20 Jun 2025 13:22:19 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860fb58sm24239005ad.99.2025.06.20.13.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:22:18 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jun 2025 20:21:58 +0000
Subject: [PATCH v5 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
MIME-Version: 1.0
Message-Id: <20250620-dev-alex-insn_duplicate_v5_manual-v5-2-d865dc9ad180@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7020;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=Vq5Ge4Wa3TVBt85DoyylAxrZltpaFYZYUPYZeK66VFs=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJCD3246T+x3+vZmwqhZc9/i6mpTf184X6hSVFTvejU/
 6VqvAc9O0pZGMQ4GGTFFFkUzBO6WuzP1s/+c+k9zBxWJpAhDFycAjCRjwsZGWaqSO0X0PqsOFP0
 hoZf/+VFzk/+3VcUWdfZGjD3rN9Z592MDG171FcY9Rh5vlnMo3Yw8nP1Cb61L5awdLK6rtp2r/y
 mPAcA
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132220_261926_5B9B639C 
X-CRM114-Status: GOOD (  10.35  )
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
 arch/riscv/include/asm/insn.h          | 39 +++++++++++++++++-----------------
 arch/riscv/kernel/machine_kexec_file.c |  2 +-
 arch/riscv/kernel/traps_misaligned.c   |  2 +-
 arch/riscv/kvm/vcpu_insn.c             |  2 +-
 4 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 2a589a58b2917d67efcb18792b05f5e640bda37f..ac3e606feca2584494ce4c41afd64c5f22a65c44 100644
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
index e36104af2e247fc0acb88eb5558d07ac49c713e4..5c2ed4c396e9d242054fdb30510a36bb3901a27b 100644
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
index dd8e4af6583f47d2cce8cab61bcd92e7d642a11f..1b69b91d7739c8b8ccb7b1605b6b4b88197b30a5 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -18,6 +18,7 @@
 #include <asm/cpufeature.h>
 #include <asm/sbi.h>
 #include <asm/vector.h>
+#include <asm/insn.h>
 
 #define INSN_MATCH_LB			0x3
 #define INSN_MASK_LB			0x707f
@@ -113,7 +114,6 @@
 #define SH_RS2				20
 #define SH_RS2C				2
 
-#define RV_X(x, s, n)			(((x) >> (s)) & ((1 << (n)) - 1))
 #define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
 					 (RV_X(x, 10, 3) << 3) | \
 					 (RV_X(x, 5, 1) << 6))
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e69892a1f3dac5464f892a8bac25eefd5..62cb2ab4b63680d9d436c12bb2faae94e7988761 100644
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
