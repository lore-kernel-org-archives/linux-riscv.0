Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D053ECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7p3of/McULJ3HiaPBUq10292cAJc9T88MXnW4TntPFM=; b=tEJ5TJ0H4euThw
	5t95YJ/0Tkye4Ocu0rQPTHhNJ92TDg3FHXCVcSU3HoZj6kOgK+aZKzK0gH0MqIiHkfkfoDQkKCrjk
	k8HG/H4d96Ara39+K3v/yTzXlH2/UNUNljmJuZNF7G0h+BM9NqMd2XjccnVDg89C6tEddyOruOu7y
	ysOP+bTXlR39ajdklxziyOKx4ohcE9juBLBo2rNVgqtxEmYMCqYKMAI8F5QhhN9JAVkdAfUNB4aDU
	06tdQsil89uvcdSU0O4lZTq8zmSocJfpuYSx+LyhGHEjXzIhHn+cLvry9sfmyo5rN6jhEbDCaByz3
	GUYea71sqcKWnrSNNj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSl-007Omm-4O; Wed, 31 Aug 2022 17:25:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSe-007OhS-4M
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 17:25:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso8407951wmb.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 10:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5h3L3YOiG9CNXYHQtw/et5Sc+1r6Zl/xaASBla9taYA=;
        b=G5vxTVeX8UktfzniDjTnkLblMXMKWgBYh+R/zA8MObo5kCtHE/4HRGHqvkVm3dHKIn
         Su2cvs50mNGPLJI790jlw1So7LyZSsduFO1NSGToSMmBvB5ocNz2Ox5thy9u2n1xK65e
         DMewhEiPnTmFiGgwHol01Lc/Pi/tFjdFNeximileSt63NdPSFbfx3L218VWWD6NkQkXg
         cmMZ66qsLRAc6JeYpVXYLdeg8a4BjRWRYCyRLxKEIUwjNZjmKEM+ZAOVL0GHRLJrA8vK
         D5LM1fvMywqOpH19URp0URi/B9NDOa2UzrJyHUyu98dzsr7lbej+ThgqjmEQCuDFKa0q
         1tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5h3L3YOiG9CNXYHQtw/et5Sc+1r6Zl/xaASBla9taYA=;
        b=U/o+038g1W7hCqBSMVmfBmcKg7hU/in8LwplNs/07lq5za/V+78eu+w9G3N+Jo34G0
         mYMGrf0jHi4BsJvMDo9QxSMsHKUMyKHh+0G9lohx2KxHszukCeiu66MPxjCFBToAngaX
         Kt3yoyV193p4zGZ4PJYSB+nau8d6zXWYFWSysWbCaol73FEwDr2OonSwxywGtqwm+El6
         f266QIPHK2G9nJ4WSK2bjc/ulZ1i2az/sCjDhrZ81uD4aTva3CbVV1SEQr2HLBhgU/+e
         a0ItfFV7SuYYZnbqBiSZT8jQG8M8zwwxTbvaJrqfhVR7m+V4aEzGIKbatF/gwsng0BF4
         RsWw==
X-Gm-Message-State: ACgBeo3k1r0z2nOokofyQhlHrdH7ttSe8/j574x425Df8bd4i9IXMovJ
	MTxU186x03nsmkqS/7NAWBewrZIk/6cTSQ==
X-Google-Smtp-Source: AA6agR7lpMuqSCKxNT4vSMdBVaSEyRIEQ+Pl2du5hdijO1YQun6REosptUuvlx9D3nXsoLSdQpx6uQ==
X-Received: by 2002:a1c:4b01:0:b0:3a5:94e8:948e with SMTP id y1-20020a1c4b01000000b003a594e8948emr2653368wma.197.1661966705440;
        Wed, 31 Aug 2022 10:25:05 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id k34-20020a05600c1ca200b003a62400724bsm3419320wms.0.2022.08.31.10.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 10:25:04 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	heiko@sntech.de
Subject: [PATCH v2 2/4] riscv: Introduce support for defining instructions
Date: Wed, 31 Aug 2022 19:24:58 +0200
Message-Id: <20220831172500.752195-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831172500.752195-1-ajones@ventanamicro.com>
References: <20220831172500.752195-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_102508_204433_6B9CB030 
X-CRM114-Status: GOOD (  16.23  )
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

When compiling with toolchains that haven't yet been taught about
new instructions we need to encode them ourselves. Create a new file
where support for instruction definitions will evolve. We initiate
the file with a macro called INSN_R(), which implements the R-type
instruction encoding. INSN_R() will use the assembler's .insn
directive when available, which should give the assembler a chance
to do some validation. When .insn is not available we fall back to
manual encoding.

Not only should using instruction encoding macros improve readability
and maintainability of code over the alternative of inserting
instructions directly (e.g. '.word 0xc0de'), but we should also gain
potential for more optimized code after compilation because the
compiler will have control over the input and output registers used.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig                |  3 ++
 arch/riscv/include/asm/insn-def.h | 86 +++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 arch/riscv/include/asm/insn-def.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..f8f3b316b838 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -227,6 +227,9 @@ config RISCV_DMA_NONCOHERENT
 	select ARCH_HAS_SETUP_DMA_OPS
 	select DMA_DIRECT_REMAP
 
+config AS_HAS_INSN
+	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
+
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.erratas"
 
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
new file mode 100644
index 000000000000..2dcd1d4781bf
--- /dev/null
+++ b/arch/riscv/include/asm/insn-def.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_INSN_DEF_H
+#define __ASM_INSN_DEF_H
+
+#include <asm/asm.h>
+
+#define INSN_R_FUNC7_SHIFT		25
+#define INSN_R_RS2_SHIFT		20
+#define INSN_R_RS1_SHIFT		15
+#define INSN_R_FUNC3_SHIFT		12
+#define INSN_R_RD_SHIFT			 7
+#define INSN_R_OPCODE_SHIFT		 0
+
+#ifdef __ASSEMBLY__
+
+#ifdef CONFIG_AS_HAS_INSN
+
+	.macro insn_r, opcode, func3, func7, rd, rs1, rs2
+	.insn	r \opcode, \func3, \func7, \rd, \rs1, \rs2
+	.endm
+
+#else
+
+#include <asm/gpr-num.h>
+
+	.macro insn_r, opcode, func3, func7, rd, rs1, rs2
+	.4byte	((\opcode << INSN_R_OPCODE_SHIFT) |		\
+		 (\func3 << INSN_R_FUNC3_SHIFT) |		\
+		 (\func7 << INSN_R_FUNC7_SHIFT) |		\
+		 (.L__gpr_num_\rd << INSN_R_RD_SHIFT) |		\
+		 (.L__gpr_num_\rs1 << INSN_R_RS1_SHIFT) |	\
+		 (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
+	.endm
+
+#endif
+
+#define INSN_R(...)	insn_r __VA_ARGS__
+
+#else /* ! __ASSEMBLY__ */
+
+#ifdef CONFIG_AS_HAS_INSN
+
+#define INSN_R(opcode, func3, func7, rd, rs1, rs2)	\
+	".insn	r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
+
+#else
+
+#include <linux/stringify.h>
+#include <asm/gpr-num.h>
+
+#define DEFINE_INSN_R							\
+	__DEFINE_ASM_GPR_NUMS						\
+"	.macro insn_r, opcode, func3, func7, rd, rs1, rs2\n"		\
+"	.4byte	((\\opcode << " __stringify(INSN_R_OPCODE_SHIFT) ") |"	\
+"		 (\\func3 << " __stringify(INSN_R_FUNC3_SHIFT) ") |"	\
+"		 (\\func7 << " __stringify(INSN_R_FUNC7_SHIFT) ") |"	\
+"		 (.L__gpr_num_\\rd << " __stringify(INSN_R_RD_SHIFT) ") |"    \
+"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_R_RS1_SHIFT) ") |"  \
+"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
+"	.endm\n"
+
+#define UNDEFINE_INSN_R							\
+"	.purgem insn_r\n"
+
+#define INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
+	DEFINE_INSN_R							\
+	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
+	UNDEFINE_INSN_R
+
+#endif
+
+#endif /* ! __ASSEMBLY__ */
+
+#define OPCODE(v)	__ASM_STR(v)
+#define FUNC3(v)	__ASM_STR(v)
+#define FUNC7(v)	__ASM_STR(v)
+#define RD(v)		__ASM_STR(v)
+#define RS1(v)		__ASM_STR(v)
+#define RS2(v)		__ASM_STR(v)
+#define __REG(v)	__ASM_STR(x ## v)
+#define __RD(v)		__REG(v)
+#define __RS1(v)	__REG(v)
+#define __RS2(v)	__REG(v)
+
+#endif /* __ASM_INSN_DEF_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
