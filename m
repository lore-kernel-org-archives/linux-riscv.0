Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43E2C32774
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr6PgScgqgDu8t9PoURq5ARhdrXDI+pSrY9i+gkFnig=; b=BjGsIocaETaSCp
	qsDo80hX01DzknHJEYi2NE69Ui3F4ZYIjHSjWWRjpdgGApD7bUCpHo7001Il22+71s7uoATa0UeZO
	BoxJct/5txrix2UUYQugiQdyUifP3sy1bl6IXmLqbg14mihb4P/fUuXVKE6IBtXdi4MupRc9gMj2E
	qZTH1OCqMfXUpWd2yFxD1ONGVaYgIldvelEzbr0BCXIWFLtQmIZ7UlxA/4AWxt6SMOKlVhmmHMKde
	KHjxUWXH2BGUw/Ytr7Q5uot+piOkQ2Mr0LGTSkkNAldQToWR4ZnxS/rDVUeyCw9YkkW2DVDi3lLpG
	1beaeRtUqlSrws4ijMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aY-009Kh0-C8; Fri, 19 Aug 2022 14:03:06 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aR-009KXn-4U
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:03:01 +0000
Received: by mail-ej1-x62c.google.com with SMTP id dc19so8947650ejb.12
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CdNbn84TYwncfTBJxPnu/xlRdTtMM/NuV6HASL/Mh8E=;
        b=lCh+9pdG34gjrDI076GzFZVpx4/E/qseWgm+HgMbNq2MJQd10BIiZcZdGdBHg2oLKZ
         ISmjzidGOhYrdfOo6qHCZfYXuFcgY6XL2uMjXhIvjRYQY5iPjSyiQjXeGii7ikG5o7ht
         Z+tDTkMiBnbcfOGQ6iKUSxpBiEenHq0FTDRv3NZmCDv8q8vsrcM4JDnwTemeUHM3KcNi
         56JMnKkv5L8w+1zEEjRpK9FEwGf6FmiaNHSG0AWQvK/SVPoGwCRzSbNZoBwVE9ch40IE
         O9focsaqJKTW1OZ7+nztPgHJMcBAVe516VIg0e+d3kZDVylLrPMggLO0DHkaj7fcbJpk
         +heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CdNbn84TYwncfTBJxPnu/xlRdTtMM/NuV6HASL/Mh8E=;
        b=zFmpLkjxNrbZSqHKr/eRqUy9pNlsmg4YDiuvXpHPBWmcdXcERfyp5aRPxpyBqz2QGK
         i8Uzjp+ttmpWQz2mVgXfZAOVYj47zuMChVvyyc9L480MqF+4Rf2vfVWWqAuKgshqdnv7
         FTwTuv0emOHWEIDsP+0eGKQVBybT/SKiL+yu3sSdU8H2GhJcnJJqe15hwwo6GsKifk+A
         U7dddKTiW85YYXoEWfO7keholBwsangdY132mLfHhO+X7T9TZjdJP+y3uDsIISG9MnCZ
         fpRuNPMTBB5uYeP+EMsKI3j0hNrOqoMJRuPxdZdvWiN2/KG5wPl1XGRKHdFv31knj4tr
         uZtA==
X-Gm-Message-State: ACgBeo3sI0Ie7Ia/VdCcZnsk9Xp4XHNgJP7RNgGXROXkyeCK9Hx7N6HO
	Rg3DsrpRlcdyiXJOS71ap/2hmWU4T0oAvQ==
X-Google-Smtp-Source: AA6agR7kgjM4XbdNJobWB0KnpsIFG/X1o3vSDdu6NBsYc6JLV3lBrWSwPSJXqdHEA4IO0NWpQIhINQ==
X-Received: by 2002:a17:906:93e8:b0:730:9e5c:b45a with SMTP id yl8-20020a17090693e800b007309e5cb45amr4819450ejb.530.1660917775017;
        Fri, 19 Aug 2022 07:02:55 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id r17-20020aa7cfd1000000b0043ba7df7a42sm3147053edy.26.2022.08.19.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 07:02:54 -0700 (PDT)
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
Subject: [PATCH 2/4] riscv: Introduce support for defining instructions
Date: Fri, 19 Aug 2022 16:02:48 +0200
Message-Id: <20220819140250.3892995-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819140250.3892995-1-ajones@ventanamicro.com>
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_070259_219699_491128C2 
X-CRM114-Status: GOOD (  16.20  )
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
---
 arch/riscv/Kconfig                |  3 ++
 arch/riscv/include/asm/insn-def.h | 82 +++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)
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
index 000000000000..4cd0208068dd
--- /dev/null
+++ b/arch/riscv/include/asm/insn-def.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_INSN_DEF_H
+#define __ASM_INSN_DEF_H
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
+        .endm
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
+"	.4byte  ((\\opcode << " __stringify(INSN_R_OPCODE_SHIFT) ") |"	\
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
+#define __REG(v)	__ASM_STR(x ## v)
+#define RD(v)		__REG(v)
+#define RS1(v)		__REG(v)
+#define RS2(v)		__REG(v)
+
+#endif /* __ASM_INSN_DEF_H */
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
