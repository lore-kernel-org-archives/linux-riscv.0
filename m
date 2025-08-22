Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249DBCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSI4pZdBphTpPNHqOk1zXebgd8fx55ynHsU3dNDXIHw=; b=OhbsuzrxzPI84l
	FAJ6aCU2m4xTZ+mIOu16+QHDQkOS24I2HdATLVlMTwnKbKwfxaDjGjw8cOEVuZTlASb/wTEX4tD0E
	MCigOgpg7mDfRQf4oQQvKwkwghGOE4BoUH18TEPcB2HQIBe2c2VLJtHQc7w4y6vFXPwiDZlBnzNf2
	E0NS/LEkxEfS1C+TEkKSkULiiFxQhZjjdkgzzzPDdNWDo5TJxG+Yd4ByPGEvleg+G1FbgsiOxlxL2
	s3y0nN2AheC5nsIRd+OPiMfjkAGO1smhDjmcJ+SNkyyoEqDit/a7OcUxeuZ0mVElwMvyCh2YXLxUr
	PdnZrI7txfbBgYUCjW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwD-00000004D1v-31iZ;
	Sat, 23 Aug 2025 06:41:17 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVrG-00000003G9h-00m0
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:47:23 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b297962b20so21365441cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755884841; x=1756489641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDpjZc97n4U0egjgFALLU1N3dP/taaCunEfrlMVFon0=;
        b=dVcKkjoctnNFCybFXhnt+7XKCAUynoPiLVKEGbmj4r0km9ZKe0/P7T+54jnVfBdiDE
         H+Q6ABK2yHS0tsRPUxuwhZxBRTaRJoHTrQ4TuflHIX9Z82bn/t444l8yBH3yiZx2wmgG
         6oq24dBPD5NLa3pBItUhrIeDwUutMWgNBb4Tas7b8XIQ0a5XYh6GKXjaUBJZ5f10SbSf
         iKpc3pRLe5Vfh0xx6rdL3oFBOrLzin1Yf/Gx8YSD2sUoA7rheZpPjnfavHm36u6zd28n
         WYW/BClSb0guAkY7Jid2Ck70xL/qLrBUlGLG+ory/gT6+lf8p00ZwZbFTcbrlwu4a3ha
         XRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755884841; x=1756489641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDpjZc97n4U0egjgFALLU1N3dP/taaCunEfrlMVFon0=;
        b=ldMXxyP4SG9kpuQoNJx8mMmDMsatw+f4bZDhhpKQuHFcmeaNXxLsaHx96zUF6RWtiU
         bl2yzvjSBQIJqe0KKgEvrv+uhM+zxfTx916qlE56dhNBjAjXAbUNVsBb54DAedyKJoOa
         AmY5hN5ndAIT6qKrDyz1bolm9S91swu8gVYyrmryxK6xyuBrYjdAFOJWuDRDv0GlzMvg
         cZGWOKixsdMTSR0OBvrfpsBQcL9mgQI5pA/CaVJvTxwvZJMzlZexcnqZWLWXE5lKuQoa
         n8Z5/7oWdd1gTsGjymYBCI6sXLwfJ2cT+1HuoNuqKuwy/qzcZykMCeM1gHg6znoP1y7Q
         M0VA==
X-Gm-Message-State: AOJu0Yxx9Og00sb19YPc4garapg3HZCT7+nZnzrnMHtOBiZowBacgSy0
	TxBfrOJM61pIuoOcrG0faI6Nuhmqpf0ej2N9CiDpD8K/B0BYxPZ3+cq0cN0mdw7MVIPmqdW3gWy
	wc4LQ
X-Gm-Gg: ASbGncubv/H7x3s0KIBvqyApgYat5x/+hBPXxg2xTuiHIALBjSzzFrLL4M9VY/7VHrm
	8YLv3+uwEJ7zsmITsKhUPoGkJWs2efFL0MU8o4wKE98OZgpq+StfAupupV+DSOmIZyKJMSuNmYZ
	NrIj05skBV3rvFigQIDuHbf2fUKBAztcIBg7krMb9u8jBfznhIcfRt7diB2DNAiHSbhc/i2lthb
	ubPU2FqeLdl2asKHDTijLsfyizwYiwQvH0XBZRJvPZNonM3oEfgAJzS/jVCXyuEo7KtuDYhE+VR
	u1RlPvEMcfrJy/HgPUq86er/953F6cXPxnNG+fNZBURQKuQKodObTbfC9/PHPt79wQlnJP73cAK
	5hkAP1fsxtPVEB8eqC/l4U7lyLjRLsL7BoXNqjh5cSdBHcwANoI0YNT3c8EHX8mpas/ubJ9UyaT
	b2850QR4c093qIT4d7
X-Google-Smtp-Source: AGHT+IHNrCDOw6FL6pCo4DbPw+v/tihYCiWlLKD99o6wPnSaszr779gTketdS2R8nKaudoSSWZudpQ==
X-Received: by 2002:a05:622a:4007:b0:4b0:89c2:68e0 with SMTP id d75a77b69052e-4b2aab5d1f6mr45761641cf.60.1755884840514;
        Fri, 22 Aug 2025 10:47:20 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e6023asm3121361cf.53.2025.08.22.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:47:19 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/8] riscv: Add insn.c, consolidate instruction decoding
Date: Fri, 22 Aug 2025 10:47:08 -0700
Message-ID: <20250822174715.1269138-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822174715.1269138-1-jesse@rivosinc.com>
References: <20250822174715.1269138-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_104722_061466_CD565B7E 
X-CRM114-Status: GOOD (  25.89  )
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

Various parts of the kernel decode and read instruction from memory.
Functions like get_insn, GET_INSN_LENGTH and riscv_insn_is_c are defined
in multiple places. Consolidate these functions into the insn.h and the
newly added insn.c.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
RFC -> V1:
 - No change
V2 -> V1:
 - No change
---
 arch/riscv/include/asm/bug.h         |  12 ---
 arch/riscv/include/asm/insn.h        | 131 ++++++++++++++++++++++-
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/insn.c             | 151 +++++++++++++++++++++++++++
 arch/riscv/kernel/kgdb.c             | 102 +-----------------
 arch/riscv/kernel/probes/kprobes.c   |   1 +
 arch/riscv/kernel/traps.c            |   5 +-
 arch/riscv/kernel/traps_misaligned.c |  93 ++++-------------
 8 files changed, 309 insertions(+), 187 deletions(-)
 create mode 100644 arch/riscv/kernel/insn.c

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..a2777eb67ad1 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -12,21 +12,9 @@
 
 #include <asm/asm.h>
 
-#define __INSN_LENGTH_MASK  _UL(0x3)
-#define __INSN_LENGTH_32    _UL(0x3)
-#define __COMPRESSED_INSN_MASK	_UL(0xffff)
-
 #define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
 #define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */
 
-#define GET_INSN_LENGTH(insn)						\
-({									\
-	unsigned long __len;						\
-	__len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) ?	\
-		4UL : 2UL;						\
-	__len;								\
-})
-
 typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f..ba74e5b8262c 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -64,6 +64,7 @@
 #define RVG_RS2_OPOFF		20
 #define RVG_RD_OPOFF		7
 #define RVG_RS1_MASK		GENMASK(4, 0)
+#define RVG_RS2_MASK		GENMASK(4, 0)
 #define RVG_RD_MASK		GENMASK(4, 0)
 
 /* The bit field of immediate value in RVC J instruction */
@@ -121,17 +122,27 @@
 #define RVC_C0_RS1_OPOFF	7
 #define RVC_C0_RS2_OPOFF	2
 #define RVC_C0_RD_OPOFF		2
+#define RVC_C0_RS1_MASK		GENMASK(2, 0)
+#define RVC_C0_RS2_MASK		GENMASK(2, 0)
+#define RVC_C0_RD_MASK		GENMASK(2, 0)
+#define RVC_C0_REG_OFFSET	8
 
 /* The register offset in RVC op=C1 instruction */
 #define RVC_C1_RS1_OPOFF	7
 #define RVC_C1_RS2_OPOFF	2
 #define RVC_C1_RD_OPOFF		7
+#define RVC_C1_RS1_MASK		GENMASK(2, 0)
+#define RVC_C1_RS2_MASK		GENMASK(2, 0)
+#define RVC_C1_RD_MASK		GENMASK(2, 0)
+#define RVC_C1_REG_OFFSET	8
 
 /* The register offset in RVC op=C2 instruction */
 #define RVC_C2_RS1_OPOFF	7
 #define RVC_C2_RS2_OPOFF	2
 #define RVC_C2_RD_OPOFF		7
 #define RVC_C2_RS1_MASK		GENMASK(4, 0)
+#define RVC_C2_RS2_MASK		GENMASK(4, 0)
+#define RVC_C2_RD_MASK		GENMASK(4, 0)
 
 /* parts of opcode for RVG*/
 #define RVG_OPCODE_FENCE	0x0f
@@ -226,12 +237,26 @@
 #define RVC_MASK_C_EBREAK	0xffff
 #define RVG_MASK_EBREAK		0xffffffff
 #define RVG_MASK_SRET		0xffffffff
+#define RVC_MASK_C		GENMASK(15, 0)
 
 #define __INSN_LENGTH_MASK	_UL(0x3)
 #define __INSN_LENGTH_GE_32	_UL(0x3)
 #define __INSN_OPCODE_MASK	_UL(0x7F)
 #define __INSN_BRANCH_OPCODE	_UL(RVG_OPCODE_BRANCH)
 
+#define GET_INSN_LENGTH(insn)						\
+({									\
+	unsigned long __len;						\
+	__len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_GE_32) ?	\
+		4UL : 2UL;						\
+	__len;								\
+})
+
+static __always_inline bool riscv_insn_is_c(u32 code)
+{
+	return (code & (__INSN_LENGTH_MASK)) != (__INSN_LENGTH_GE_32);
+}
+
 #define __RISCV_INSN_FUNCS(name, mask, val)				\
 static __always_inline bool riscv_insn_is_##name(u32 code)		\
 {									\
@@ -260,7 +285,7 @@ __RISCV_INSN_FUNCS(c_bnez, RVC_MASK_C_BNEZ, RVC_MATCH_C_BNEZ)
 __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
 __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
-__RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+__RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE)
 
 /* special case to catch _any_ system instruction */
 static __always_inline bool riscv_insn_is_system(u32 code)
@@ -295,6 +320,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
 
+#define RV_EXTRACT_RS2_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
+
 #define RV_EXTRACT_RD_REG(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
@@ -322,9 +351,41 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	(RV_X(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
 	(RV_IMM_SIGN(x_) << RV_B_IMM_SIGN_OFF); })
 
+#define RVC_EXTRACT_C0_RS1_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_C0_RS1_OPOFF, RVC_C0_RS1_MASK)); })
+
+#define RVC_EXTRACT_C0_RS2_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_C0_RS2_OPOFF, RVC_C0_RS2_MASK)); })
+
+#define RVC_EXTRACT_C0_RD_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_C0_RD_OPOFF, RVC_C0_RD_MASK)); })
+
+#define RVC_EXTRACT_C1_RS1_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_C1_RS1_OPOFF, RVC_C1_RS1_MASK)); })
+
+#define RVC_EXTRACT_C1_RS2_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_C1_RS2_OPOFF, RVC_C1_RS2_MASK)); })
+
+#define RVC_EXTRACT_C1_RD_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_C1_RD_OPOFF, RVC_C1_RD_MASK)); })
+
 #define RVC_EXTRACT_C2_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
+	(RVC_X(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
+
+#define RVC_EXTRACT_C2_RS2_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_C2_RS2_OPOFF, RVC_C2_RS2_MASK)); })
+
+#define RVC_EXTRACT_C2_RD_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_C2_RD_OPOFF, RVC_C2_RD_MASK)); })
 
 #define RVC_EXTRACT_JTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
@@ -354,6 +415,66 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 
 #define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
 
+/*
+ * Get the rs1 register number from RV or RVC instruction.
+ *
+ * @insn: instruction to process
+ * Return: rs1 register
+ */
+static inline unsigned int riscv_insn_extract_rs1_reg(u32 insn)
+{
+	switch (RVC_INSN_OPCODE_MASK & insn) {
+	case RVC_OPCODE_C0:
+		return RVC_EXTRACT_C0_RS1_REG(insn) + RVC_C0_REG_OFFSET;
+	case RVC_OPCODE_C1:
+		return RVC_EXTRACT_C1_RS1_REG(insn) + RVC_C1_REG_OFFSET;
+	case RVC_OPCODE_C2:
+		return RVC_EXTRACT_C2_RS1_REG(insn);
+	default:
+		return RV_EXTRACT_RS1_REG(insn);
+	}
+}
+
+/*
+ * Get the rs2 register number from RV or RVC instruction.
+ *
+ * @insn: instruction to process
+ * Return: rs2 register
+ */
+static inline unsigned int riscv_insn_extract_rs2_reg(u32 insn)
+{
+	switch (RVC_INSN_OPCODE_MASK & insn) {
+	case RVC_OPCODE_C0:
+		return RVC_EXTRACT_C0_RS2_REG(insn) + RVC_C0_REG_OFFSET;
+	case RVC_OPCODE_C1:
+		return RVC_EXTRACT_C1_RS2_REG(insn) + RVC_C1_REG_OFFSET;
+	case RVC_OPCODE_C2:
+		return RVC_EXTRACT_C2_RS2_REG(insn);
+	default:
+		return RV_EXTRACT_RS2_REG(insn);
+	}
+}
+
+/*
+ * Get the rd register number from RV or RVC instruction.
+ *
+ * @insn: instruction to process
+ * Return: rd register
+ */
+static inline unsigned int riscv_insn_extract_rd_reg(u32 insn)
+{
+	switch (RVC_INSN_OPCODE_MASK & insn) {
+	case RVC_OPCODE_C0:
+		return RVC_EXTRACT_C0_RD_REG(insn) + RVC_C0_REG_OFFSET;
+	case RVC_OPCODE_C1:
+		return RVC_EXTRACT_C1_RD_REG(insn) + RVC_C1_REG_OFFSET;
+	case RVC_OPCODE_C2:
+		return RVC_EXTRACT_C2_RD_REG(insn);
+	default:
+		return RV_EXTRACT_RD_REG(insn);
+	}
+}
+
 /*
  * Get the immediate from a J-type instruction.
  *
@@ -428,4 +549,10 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
 	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
 	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
 }
+
+#include <asm/ptrace.h>
+
+int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn);
+unsigned long get_step_address(struct pt_regs *regs, u32 code);
+
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f7480c9c6f8d..4f719b09e5ad 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_RISCV_ALTERNATIVE) += alternative.o
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
+obj-y	+= insn.o
 obj-y	+= irq.o
 obj-y	+= process.o
 obj-y	+= ptrace.o
diff --git a/arch/riscv/kernel/insn.c b/arch/riscv/kernel/insn.c
new file mode 100644
index 000000000000..dd2a6ef9fd25
--- /dev/null
+++ b/arch/riscv/kernel/insn.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Rivos, Inc
+ */
+#include <asm/insn.h>
+#include <asm/ptrace.h>
+#include <asm/uaccess.h>
+
+#define __read_insn(regs, insn, insn_addr, type)	\
+({							\
+	int __ret;					\
+							\
+	if (user_mode(regs)) {				\
+		__ret = get_user(insn, (type __user *) insn_addr); \
+	} else {					\
+		insn = *(type *)insn_addr;		\
+		__ret = 0;				\
+	}						\
+							\
+	__ret;						\
+})
+
+/*
+ * Update a set of two instructions (U-type + I-type) with an immediate value.
+ *
+ * Used for example in auipc+jalrs pairs the U-type instructions contains
+ * a 20bit upper immediate representing bits[31:12], while the I-type
+ * instruction contains a 12bit immediate representing bits[11:0].
+ *
+ * This also takes into account that both separate immediates are
+ * considered as signed values, so if the I-type immediate becomes
+ * negative (BIT(11) set) the U-type part gets adjusted.
+ *
+ * @regs: pointer to the utype instruction of the pair
+ * @epc: pointer to the itype instruction of the pair
+ * @r_insn: the immediate to insert into the two instructions
+ * Return: combined immediate
+ */
+int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
+{
+	ulong insn = 0;
+
+	if (epc & 0x2) {
+		ulong tmp = 0;
+
+		if (__read_insn(regs, insn, epc, u16))
+			return -EFAULT;
+		/* __get_user() uses regular "lw" which sign extend the loaded
+		 * value make sure to clear higher order bits in case we "or" it
+		 * below with the upper 16 bits half.
+		 */
+		insn &= RVC_MASK_C;
+		if (riscv_insn_is_c(insn)) {
+			*r_insn = insn;
+			return 0;
+		}
+		epc += sizeof(u16);
+		if (__read_insn(regs, tmp, epc, u16))
+			return -EFAULT;
+		*r_insn = (tmp << 16) | insn;
+
+		return 0;
+	} else {
+		if (__read_insn(regs, insn, epc, u32))
+			return -EFAULT;
+		if (!riscv_insn_is_c(insn)) {
+			*r_insn = insn;
+			return 0;
+		}
+		insn &= RVC_MASK_C;
+		*r_insn = insn;
+
+		return 0;
+	}
+}
+
+/* Calculate the new address for after a step */
+unsigned long get_step_address(struct pt_regs *regs, u32 code)
+{
+	unsigned long pc = regs->epc;
+	unsigned int rs1_num, rs2_num;
+
+	if ((code & __INSN_LENGTH_MASK) != __INSN_LENGTH_GE_32) {
+		if (riscv_insn_is_c_jalr(code) ||
+		    riscv_insn_is_c_jr(code)) {
+			rs1_num = riscv_insn_extract_rs1_reg(code);
+			return regs_get_register(regs, rs1_num);
+		} else if (riscv_insn_is_c_j(code) ||
+			   riscv_insn_is_c_jal(code)) {
+			return RVC_EXTRACT_JTYPE_IMM(code) + pc;
+		} else if (riscv_insn_is_c_beqz(code)) {
+			rs1_num = riscv_insn_extract_rs1_reg(code);
+			if (!rs1_num || regs_get_register(regs, rs1_num) == 0)
+				return RVC_EXTRACT_BTYPE_IMM(code) + pc;
+			else
+				return pc + 2;
+		} else if (riscv_insn_is_c_bnez(code)) {
+			rs1_num = riscv_insn_extract_rs1_reg(RVC_C1_RS1_OPOFF);
+			if (rs1_num && regs_get_register(regs, rs1_num) != 0)
+				return RVC_EXTRACT_BTYPE_IMM(code) + pc;
+			else
+				return pc + 2;
+		} else {
+			return pc + 2;
+		}
+	} else {
+		if ((code & __INSN_OPCODE_MASK) == __INSN_BRANCH_OPCODE) {
+			bool result = false;
+			long imm = RV_EXTRACT_BTYPE_IMM(code);
+			unsigned long rs1_val = 0, rs2_val = 0;
+
+			rs1_num = riscv_insn_extract_rs1_reg(code);
+			rs2_num = riscv_insn_extract_rs2_reg(code);
+			if (rs1_num)
+				rs1_val = regs_get_register(regs, rs1_num);
+			if (rs2_num)
+				rs2_val = regs_get_register(regs, rs2_num);
+
+			if (riscv_insn_is_beq(code))
+				result = (rs1_val == rs2_val) ? true : false;
+			else if (riscv_insn_is_bne(code))
+				result = (rs1_val != rs2_val) ? true : false;
+			else if (riscv_insn_is_blt(code))
+				result =
+				    ((long)rs1_val <
+				     (long)rs2_val) ? true : false;
+			else if (riscv_insn_is_bge(code))
+				result =
+				    ((long)rs1_val >=
+				     (long)rs2_val) ? true : false;
+			else if (riscv_insn_is_bltu(code))
+				result = (rs1_val < rs2_val) ? true : false;
+			else if (riscv_insn_is_bgeu(code))
+				result = (rs1_val >= rs2_val) ? true : false;
+			if (result)
+				return imm + pc;
+			else
+				return pc + 4;
+		} else if (riscv_insn_is_jal(code)) {
+			return RV_EXTRACT_JTYPE_IMM(code) + pc;
+		} else if (riscv_insn_is_jalr(code)) {
+			rs1_num = riscv_insn_extract_rs1_reg(code);
+			return RV_EXTRACT_ITYPE_IMM(code) +
+			       (rs1_num ? regs_get_register(regs, rs1_num) : 0);
+		} else if (riscv_insn_is_sret(code)) {
+			return pc;
+		} else {
+			return pc + 4;
+		}
+	}
+}
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 9f3db3503dab..aafc1424fc81 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -23,111 +23,19 @@ enum {
 static unsigned long stepped_address;
 static unsigned int stepped_opcode;
 
-static int decode_register_index(unsigned long opcode, int offset)
-{
-	return (opcode >> offset) & 0x1F;
-}
-
-static int decode_register_index_short(unsigned long opcode, int offset)
-{
-	return ((opcode >> offset) & 0x7) + 8;
-}
-
-/* Calculate the new address for after a step */
-static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
-{
-	unsigned long pc = regs->epc;
-	unsigned long *regs_ptr = (unsigned long *)regs;
-	unsigned int rs1_num, rs2_num;
-	int op_code;
-
-	if (get_kernel_nofault(op_code, (void *)pc))
-		return -EINVAL;
-	if ((op_code & __INSN_LENGTH_MASK) != __INSN_LENGTH_GE_32) {
-		if (riscv_insn_is_c_jalr(op_code) ||
-		    riscv_insn_is_c_jr(op_code)) {
-			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
-			*next_addr = regs_ptr[rs1_num];
-		} else if (riscv_insn_is_c_j(op_code) ||
-			   riscv_insn_is_c_jal(op_code)) {
-			*next_addr = RVC_EXTRACT_JTYPE_IMM(op_code) + pc;
-		} else if (riscv_insn_is_c_beqz(op_code)) {
-			rs1_num = decode_register_index_short(op_code,
-							      RVC_C1_RS1_OPOFF);
-			if (!rs1_num || regs_ptr[rs1_num] == 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
-			else
-				*next_addr = pc + 2;
-		} else if (riscv_insn_is_c_bnez(op_code)) {
-			rs1_num =
-			    decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
-			if (rs1_num && regs_ptr[rs1_num] != 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
-			else
-				*next_addr = pc + 2;
-		} else {
-			*next_addr = pc + 2;
-		}
-	} else {
-		if ((op_code & __INSN_OPCODE_MASK) == __INSN_BRANCH_OPCODE) {
-			bool result = false;
-			long imm = RV_EXTRACT_BTYPE_IMM(op_code);
-			unsigned long rs1_val = 0, rs2_val = 0;
-
-			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
-			rs2_num = decode_register_index(op_code, RVG_RS2_OPOFF);
-			if (rs1_num)
-				rs1_val = regs_ptr[rs1_num];
-			if (rs2_num)
-				rs2_val = regs_ptr[rs2_num];
-
-			if (riscv_insn_is_beq(op_code))
-				result = (rs1_val == rs2_val) ? true : false;
-			else if (riscv_insn_is_bne(op_code))
-				result = (rs1_val != rs2_val) ? true : false;
-			else if (riscv_insn_is_blt(op_code))
-				result =
-				    ((long)rs1_val <
-				     (long)rs2_val) ? true : false;
-			else if (riscv_insn_is_bge(op_code))
-				result =
-				    ((long)rs1_val >=
-				     (long)rs2_val) ? true : false;
-			else if (riscv_insn_is_bltu(op_code))
-				result = (rs1_val < rs2_val) ? true : false;
-			else if (riscv_insn_is_bgeu(op_code))
-				result = (rs1_val >= rs2_val) ? true : false;
-			if (result)
-				*next_addr = imm + pc;
-			else
-				*next_addr = pc + 4;
-		} else if (riscv_insn_is_jal(op_code)) {
-			*next_addr = RV_EXTRACT_JTYPE_IMM(op_code) + pc;
-		} else if (riscv_insn_is_jalr(op_code)) {
-			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
-			if (rs1_num)
-				*next_addr = ((unsigned long *)regs)[rs1_num];
-			*next_addr += RV_EXTRACT_ITYPE_IMM(op_code);
-		} else if (riscv_insn_is_sret(op_code)) {
-			*next_addr = pc;
-		} else {
-			*next_addr = pc + 4;
-		}
-	}
-	return 0;
-}
-
 static int do_single_step(struct pt_regs *regs)
 {
 	/* Determine where the target instruction will send us to */
-	unsigned long addr = 0;
-	int error = get_step_address(regs, &addr);
+	unsigned long addr, insn;
+	int error = get_insn(regs, regs->epc, &insn);
 
 	if (error)
 		return error;
 
+	addr = get_step_address(regs, insn);
+
 	/* Store the op code in the stepped address */
-	error = get_kernel_nofault(stepped_opcode, (void *)addr);
+	error = get_insn(regs, addr, stepped_opcode);
 	if (error)
 		return error;
 
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index c0738d6c6498..6a9cfb0b664a 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -12,6 +12,7 @@
 #include <asm/sections.h>
 #include <asm/cacheflush.h>
 #include <asm/bug.h>
+#include <asm/insn.h>
 #include <asm/text-patching.h>
 
 #include "decode-insn.h"
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 9c83848797a7..938a8b841f94 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -26,6 +26,7 @@
 #include <asm/bug.h>
 #include <asm/cfi.h>
 #include <asm/csr.h>
+#include <asm/insn.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
@@ -409,10 +410,10 @@ int is_valid_bugaddr(unsigned long pc)
 		return 0;
 	if (get_kernel_nofault(insn, (bug_insn_t *)pc))
 		return 0;
-	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
+	if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_GE_32)
 		return (insn == __BUG_INSN_32);
 	else
-		return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
+		return ((insn & RVC_MASK_C) == __BUG_INSN_16);
 }
 #endif /* CONFIG_GENERIC_BUG */
 
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 77c788660223..42a50e21b1d2 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -10,12 +10,13 @@
 #include <linux/irq.h>
 #include <linux/stringify.h>
 
-#include <asm/processor.h>
-#include <asm/ptrace.h>
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/entry-common.h>
 #include <asm/hwprobe.h>
-#include <asm/cpufeature.h>
+#include <asm/insn.h>
+#include <asm/processor.h>
+#include <asm/ptrace.h>
 #include <asm/vector.h>
 
 #define INSN_MATCH_LB			0x3
@@ -112,25 +113,22 @@
 #define SH_RS2				20
 #define SH_RS2C				2
 
-#define RV_X(x, s, n)			(((x) >> (s)) & ((1 << (n)) - 1))
-#define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
-					 (RV_X(x, 10, 3) << 3) | \
-					 (RV_X(x, 5, 1) << 6))
-#define RVC_LD_IMM(x)			((RV_X(x, 10, 3) << 3) | \
-					 (RV_X(x, 5, 2) << 6))
-#define RVC_LWSP_IMM(x)			((RV_X(x, 4, 3) << 2) | \
+#define RVC_LW_IMM(x)			((RV_X(x, 6, 0x1) << 2) | \
+					 (RV_X(x, 10, 0x7) << 3) | \
+					 (RV_X(x, 5, 0x1) << 6))
+#define RVC_LD_IMM(x)			((RV_X(x, 10, 0x7) << 3) | \
+					 (RV_X(x, 5, 0x3) << 6))
+#define RVC_LWSP_IMM(x)			((RV_X(x, 4, 0x7) << 2) | \
+					 (RV_X(x, 12, 0x1) << 5) | \
+					 (RV_X(x, 2, 0x3) << 6))
+#define RVC_LDSP_IMM(x)			((RV_X(x, 5, 0x3) << 3) | \
 					 (RV_X(x, 12, 1) << 5) | \
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
+					 (RV_X(x, 2, 0x7) << 6))
+#define RVC_SWSP_IMM(x)			((RV_X(x, 9, 0xf) << 2) | \
+					 (RV_X(x, 7, 0x3) << 6))
+#define RVC_SDSP_IMM(x)			((RV_X(x, 10, 0x7) << 3) | \
+					 (RV_X(x, 7, 0x7) << 6))
+#define RVC_RS2S(insn)			(8 + RV_X(insn, SH_RS2C, 0x7))
 
 #define SHIFT_RIGHT(x, y)		\
 	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
@@ -146,7 +144,6 @@
 
 #define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
 #define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
-#define GET_RS1S(insn, regs)		(*REG_PTR(RVC_RS1S(insn), 0, regs))
 #define GET_RS2S(insn, regs)		(*REG_PTR(RVC_RS2S(insn), 0, regs))
 #define GET_RS2C(insn, regs)		(*REG_PTR(insn, SH_RS2C, regs))
 #define GET_SP(regs)			(*REG_PTR(2, 0, regs))
@@ -270,58 +267,6 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 #define GET_F32_RS2C(insn, regs) (get_f32_rs(insn, 2, regs))
 #define GET_F32_RS2S(insn, regs) (get_f32_rs(RVC_RS2S(insn), 0, regs))
 
-#define __read_insn(regs, insn, insn_addr, type)	\
-({							\
-	int __ret;					\
-							\
-	if (user_mode(regs)) {				\
-		__ret = get_user(insn, (type __user *) insn_addr); \
-	} else {					\
-		insn = *(type *)insn_addr;		\
-		__ret = 0;				\
-	}						\
-							\
-	__ret;						\
-})
-
-static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
-{
-	ulong insn = 0;
-
-	if (epc & 0x2) {
-		ulong tmp = 0;
-
-		if (__read_insn(regs, insn, epc, u16))
-			return -EFAULT;
-		/* __get_user() uses regular "lw" which sign extend the loaded
-		 * value make sure to clear higher order bits in case we "or" it
-		 * below with the upper 16 bits half.
-		 */
-		insn &= GENMASK(15, 0);
-		if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
-			*r_insn = insn;
-			return 0;
-		}
-		epc += sizeof(u16);
-		if (__read_insn(regs, tmp, epc, u16))
-			return -EFAULT;
-		*r_insn = (tmp << 16) | insn;
-
-		return 0;
-	} else {
-		if (__read_insn(regs, insn, epc, u32))
-			return -EFAULT;
-		if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) {
-			*r_insn = insn;
-			return 0;
-		}
-		insn &= GENMASK(15, 0);
-		*r_insn = insn;
-
-		return 0;
-	}
-}
-
 union reg_data {
 	u8 data_bytes[8];
 	ulong data_ulong;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
