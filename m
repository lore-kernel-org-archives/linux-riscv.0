Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0176BC369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0QhhGEqh+Vp6IKufM59OS52FKK6LyQYa1NxMh/OMpU=; b=HdN0JazWf8NW06
	o2hlDLjwX14+YjDzWSN1yrruY/ig42bCnGwFxCcUfhjsH0qgd4GRFooCMNXI9D5XD+zQzVJRL5GVr
	+qtp+179H1S24otwHVf/iamjXWxDXSghEpYqMCF038W+8Xqcr+Kjt4w5otH0fmvYQ5bK2wA3coSyA
	o79G4CSwyBKgf5VPrXHcCUS2fBUV0ssxqjw8I+ePTq6U2qh8ko/O0AT8hPuXC6CA8LYo9XFzovpDw
	wrftSNJTXPR/eys6dmVLeOT+y4ElGnyuc7n36pCmUVi17xCw79KMDNQTw5fd3g1tKcHlcz8l8SR24
	wXZsUBarEMZIAU6iF9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s7Q-00000004SFt-2UH0;
	Mon, 21 Apr 2025 14:27:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s7N-00000004SEk-0hkq
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 14:27:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2477212f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245647; x=1745850447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zM2xTA3Ijm3UBkqygOS2aJTpcgU5eK9eWAc69Lekkw4=;
        b=K698AnrVrEJl5x2Ukk6jTRewaeVU8lVJtC49g9tCuMdYjOXHF7A76DgNjNsSmpst0+
         CoS7PjkJbY2DWDwSuS/+TOEgCh0sDfmnxN9E5ldnY600yW4SPAJ4SrO3eVGcwsHqco/x
         BM1YOCXDzmyrCqaluR6TCRfjPhMXxpBBZEW6z3+NWyE2wJfDOE01CImcNz/ZMh6Ci/gb
         gAnBmJR6ZB/AmqyAaR1s0tZkuteRQfNM3guEKdpECkDX9MW+OYFYo3IA8IgiW9XmWFUr
         dw7fcjHKkcDsWdVMfIQevku8dOW0Rz45nxshS+l2qY21OqaxM0nf6rIa3JAmqjTNTzyc
         4Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245647; x=1745850447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zM2xTA3Ijm3UBkqygOS2aJTpcgU5eK9eWAc69Lekkw4=;
        b=qDp3qRWBwKd8LHmqvQrOhirYesv3ql2XlqJvhFPpPwXnzjcQQuFR+to/PUBLLE6994
         vsnVce+8uSpvGP2IJuBpA782K2Zd9ZWvQlWUepk5aBIRRxakxav6CXaXkAWHEFDdQ1fL
         GQo/kkK91K6II6snxBN8M8MxgofFEkC+pmzwlcOjB2uGaEwu9akZAVUY0fo3H4zAvZ/5
         HDt2bOXuS9B5HnYr135VD0v0NRed0z0uMShEARiX2gRl6VUR9x8ZqpPfc+V1NR2cBGpn
         3GPh2Q5mf5udkRhsVjwQcyI8ZNyfReXdIlHj1p8nToqIeU/2w5PfKAC1Q0iUiD1yzpTL
         +vKw==
X-Forwarded-Encrypted: i=1; AJvYcCWpMYpqJ7uhnq8qfHmAeOjABLFEG5oC3tiGEJXu+5miBsawzKNUjDqPDclcuC+/lmvBrExXXbjzh/HN0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0IrXsQ5lAS350bvJ54SwznkjwTBWgGaiX0Yh8MNN8ItCfq60f
	JPy550ptshLRyqAq16g4iw6BRCWNqajRV8w8Ffq1vvnHQ0WBojDl/bh67rmRLSo=
X-Gm-Gg: ASbGncv3gD1JqGKZ/DpGdUpHKbiPbspj81yNmBeSESONr60J+6Y5gGvrjIR6ErLdjg8
	Un5U5+wxsj75hGCRLTslb6OKTOVZOL55QEAe2Uz+/+hIKN13Cd6pc+7ScBkOwnxQ8eajWo02qmZ
	j0rY0j8rNg5RLMPLZ5Yyz29BG+0w1XCdLWVxX0G4Yf4YRYSDHnqgiPmy+Ii/R7GK+7qnSDHaOXs
	xmFgkzCfyiu7F5R+V4N+H4aabCsyuWk5SR7vIm+A/3yEoQf2pt4UR77rIVx5ZAYroUHyklgLe8l
	0YmKFmsDoYyNAnJQqd7NYD3k0aWccgUdR8zLm6i9LqYTXsvDgGp5Kr/FNRo=
X-Google-Smtp-Source: AGHT+IFtp6uDvT40Wf+eeybtMtOJKhVDujKLqASqoA/CInEEp1l3aj2FR72x/bhE1vGyIsJOBUURFA==
X-Received: by 2002:a05:6000:706:b0:39c:1257:dbab with SMTP id ffacd0b85a97d-39efbaf26f0mr7662645f8f.59.1745245647104;
        Mon, 21 Apr 2025 07:27:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa5a2300sm11840020f8f.101.2025.04.21.07.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:27:26 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 2/4] riscv: Add support for Zicbop
Date: Mon, 21 Apr 2025 16:24:39 +0200
Message-Id: <20250421142441.395849-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_072729_209044_B5CFA6AB 
X-CRM114-Status: GOOD (  21.88  )
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

Zicbop introduces cache blocks prefetching instructions, add the
necessary support for the kernel to use it in the coming commits.

Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig                  | 15 +++++++++++++++
 arch/riscv/include/asm/barrier.h    |  5 -----
 arch/riscv/include/asm/cacheflush.h |  1 +
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/insn-def.h   |  6 ++++++
 arch/riscv/include/asm/processor.h  |  1 -
 arch/riscv/kernel/cpufeature.c      | 21 +++++++++++++++++++++
 arch/riscv/mm/cacheflush.c          | 14 +++++++++++---
 8 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..28765ce563de 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -842,6 +842,21 @@ config RISCV_ISA_ZICBOZ
 
 	   If you don't know what to do here, say Y.
 
+config RISCV_ISA_ZICBOP
+	bool "Zicbop extension support for cache block prefetch"
+	depends on MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	  Adds support to dynamically detect the presence of the ZICBOP
+	  extension (Cache Block Prefetch Operations) and enable its
+	  usage.
+
+	  The Zicbop extension can be used to prefetch cache blocks for
+	  read/write fetch.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	def_bool y
 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index e1d9bf1deca6..b8c5726d86ac 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -14,11 +14,6 @@
 #include <asm/cmpxchg.h>
 #include <asm/fence.h>
 
-#define nop()		__asm__ __volatile__ ("nop")
-#define __nops(n)	".rept	" #n "\nnop\n.endr\n"
-#define nops(n)		__asm__ __volatile__ (__nops(n))
-
-
 /* These barriers need to enforce ordering on both devices or memory. */
 #define __mb()		RISCV_FENCE(iorw, iorw)
 #define __rmb()		RISCV_FENCE(ir, ir)
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8de73f91bfa3..effa02c2e682 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -80,6 +80,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 
 extern unsigned int riscv_cbom_block_size;
 extern unsigned int riscv_cboz_block_size;
+extern unsigned int riscv_cbop_block_size;
 void riscv_init_cbo_blocksizes(void);
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e3cbf203cdde..affd63e11b0a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -105,6 +105,7 @@
 #define RISCV_ISA_EXT_ZVFBFWMA		96
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
+#define RISCV_ISA_EXT_ZICBOP		99
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 02c92c1657d2..d5adbaec1d01 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -263,4 +263,10 @@
 
 #define RISCV_INSN_NOP4	_AC(0x00000013, U)
 
+#ifndef __ASSEMBLY__
+#define nop()           __asm__ __volatile__ ("nop")
+#define __nops(n)       ".rept  " #n "\nnop\n.endr\n"
+#define nops(n)         __asm__ __volatile__ (__nops(n))
+#endif
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..09d4c963399a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -52,7 +52,6 @@
 #endif
 
 #ifndef __ASSEMBLY__
-#include <linux/cpumask.h>
 
 struct task_struct;
 struct pt_regs;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2054f6c4b0ae..743d53415572 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -32,6 +32,7 @@
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
 static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicbop;
 static bool any_cpu_has_zicbom;
 
 unsigned long elf_hwcap __read_mostly;
@@ -119,6 +120,21 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	if (!riscv_cbop_block_size) {
+		pr_err("Zicbop detected in ISA string, disabling as no cbop-block-size found\n");
+		return -EINVAL;
+	}
+	if (!is_power_of_2(riscv_cbop_block_size)) {
+		pr_err("Zicbop disabled as cbop-block-size present, but is not a power-of-2\n");
+		return -EINVAL;
+	}
+	any_cpu_has_zicbop = true;
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -442,6 +458,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
@@ -1112,6 +1129,10 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBCFE;
 	else if (any_cpu_has_zicbom)
 		pr_warn("Zicbom disabled as it is unavailable on some harts\n");
+
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOP) &&
+	    any_cpu_has_zicbop)
+		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index b81672729887..6265052ef8b6 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -101,6 +101,9 @@ EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 unsigned int riscv_cboz_block_size;
 EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
 
+unsigned int riscv_cbop_block_size;
+EXPORT_SYMBOL_GPL(riscv_cbop_block_size);
+
 static void __init cbo_get_block_size(struct device_node *node,
 				      const char *name, u32 *block_size,
 				      unsigned long *first_hartid)
@@ -125,8 +128,8 @@ static void __init cbo_get_block_size(struct device_node *node,
 
 void __init riscv_init_cbo_blocksizes(void)
 {
-	unsigned long cbom_hartid, cboz_hartid;
-	u32 cbom_block_size = 0, cboz_block_size = 0;
+	unsigned long cbom_hartid, cboz_hartid, cbop_hartid;
+	u32 cbom_block_size = 0, cboz_block_size = 0, cbop_block_size = 0;
 	struct device_node *node;
 	struct acpi_table_header *rhct;
 	acpi_status status;
@@ -138,13 +141,15 @@ void __init riscv_init_cbo_blocksizes(void)
 					   &cbom_block_size, &cbom_hartid);
 			cbo_get_block_size(node, "riscv,cboz-block-size",
 					   &cboz_block_size, &cboz_hartid);
+			cbo_get_block_size(node, "riscv,cbop-block-size",
+					   &cbop_block_size, &cbop_hartid);
 		}
 	} else {
 		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
 		if (ACPI_FAILURE(status))
 			return;
 
-		acpi_get_cbo_block_size(rhct, &cbom_block_size, &cboz_block_size, NULL);
+		acpi_get_cbo_block_size(rhct, &cbom_block_size, &cboz_block_size, &cbop_block_size);
 		acpi_put_table((struct acpi_table_header *)rhct);
 	}
 
@@ -153,6 +158,9 @@ void __init riscv_init_cbo_blocksizes(void)
 
 	if (cboz_block_size)
 		riscv_cboz_block_size = cboz_block_size;
+
+	if (cbop_block_size)
+		riscv_cbop_block_size = cbop_block_size;
 }
 
 #ifdef CONFIG_SMP
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
