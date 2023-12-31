Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56C5C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ighH16/SzSfnqbTtbDse53tTvwHP4E1gPxQU6MLgMPU=; b=jsGAed17lMnwpT
	4MRj6zjAwy9PluFT8xoe6dVDr8U2VQY0e8Frb6NJFQLQjcbVn5Uq7dn4QXEdExu3dWObKbYLmaDPW
	2SfkbJwE+MWDkyJ1RKjitelcvoA8P16pUsTRIHH+3SCMSqAbolPsAxLTgPyU8LDcwMMjIVX5u3k1y
	u80yBTw/otAazN4qiXXK4yp4ffPElDMtfw30d7CyJFHZZX4RaWd632TFV2ZoTOHLVh1RPKVZb0o1r
	9uK41Dj3/ruDsBDnNO9M7HJZIWffeKAkZtrAQC/0dgpp3yoylijzFhOwJNPW9HSCdG2mRyx8FCmUh
	2eG/mmti9YZ8fTslzKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJrD9-004E3i-0p;
	Sun, 31 Dec 2023 08:30:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJrD5-004E1w-1h
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 08:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 17D58B807E7;
	Sun, 31 Dec 2023 08:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE04DC433C8;
	Sun, 31 Dec 2023 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704011412;
	bh=lqr8kVrKoF7VekfM2/bpKrD4rWRk1NZ9sSJM5YGYlHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AgacJY7UMsYUR5+lF8G56Nw0hW1kukPYIRTmm57xTr82tFnG+Q/7J6aMKzZO7FN/n
	 3GD4NM3cEEyAkmcdr5GQ6tx+DGenEEXRlptQmYVN3OB0TLtd6v+9T8Qih4UuQLIhHB
	 7rG2M0yRtvMsD3qnDQd5V6ZTE4/aZP8z0QL9SSyX/gHOQg2BkbkcQ+bcHI2ugQBfd4
	 03fyqm5bdN9TUJWcUlAnTupFArh0H8dKdfYo921qeadTiErrEgwRi1Ea0PvcV1B0qB
	 x5ttO069TYDVY+YchUOzKd0CbRqeOwkKscTnI0yvRHQGOdin/irNujeJCtF+3gkf5P
	 Q9zkeHLiX+wOg==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	panqinglin2020@iscas.ac.cn,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	leobras@redhat.com,
	peterz@infradead.org,
	keescook@chromium.org,
	wuwei2016@iscas.ac.cn,
	xiaoguang.xing@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	uwu@icenowy.me,
	jszhang@kernel.org,
	wefu@redhat.com,
	atishp@atishpatra.org,
	ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions & cpufeature
Date: Sun, 31 Dec 2023 03:29:51 -0500
Message-Id: <20231231082955.16516-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231231082955.16516-1-guoren@kernel.org>
References: <20231231082955.16516-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_003015_834733_658B0CF6 
X-CRM114-Status: GOOD (  13.06  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Cache-block prefetch instructions are HINTs to the hardware to
indicate that software intends to perform a particular type of
memory access in the near future. This patch adds prefetch.i,
prefetch.r and prefetch.w instruction definitions by
RISCV_ISA_EXT_ZICBOP cpufeature.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                | 15 ++++++++
 arch/riscv/include/asm/hwcap.h    |  1 +
 arch/riscv/include/asm/insn-def.h | 60 +++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c    |  1 +
 4 files changed, 77 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 24c1799e2ec4..fcbd417d65ea 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -579,6 +579,21 @@ config RISCV_ISA_ZICBOZ
 
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
+	  The Zicbop extension can be used to prefetch cache block for
+	  read/write fetch.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZIHINTPAUSE
 	bool
 	default y
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 06d30526ef3b..77d3b6ee25ab 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -57,6 +57,7 @@
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
 #define RISCV_ISA_EXT_ZICOND		44
+#define RISCV_ISA_EXT_ZICBOP		45
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index e27179b26086..bbda350a63bf 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -18,6 +18,13 @@
 #define INSN_I_RD_SHIFT			 7
 #define INSN_I_OPCODE_SHIFT		 0
 
+#define INSN_S_SIMM7_SHIFT		25
+#define INSN_S_RS2_SHIFT		20
+#define INSN_S_RS1_SHIFT		15
+#define INSN_S_FUNC3_SHIFT		12
+#define INSN_S_SIMM5_SHIFT		 7
+#define INSN_S_OPCODE_SHIFT		 0
+
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_AS_HAS_INSN
@@ -30,6 +37,10 @@
 	.insn	i \opcode, \func3, \rd, \rs1, \simm12
 	.endm
 
+	.macro insn_s, opcode, func3, rs2, simm12, rs1
+	.insn	s \opcode, \func3, \rs2, \simm12(\rs1)
+	.endm
+
 #else
 
 #include <asm/gpr-num.h>
@@ -51,10 +62,20 @@
 		 (\simm12 << INSN_I_SIMM12_SHIFT))
 	.endm
 
+	.macro insn_s, opcode, func3, rs2, simm12, rs1
+	.4byte	((\opcode << INSN_S_OPCODE_SHIFT) |		\
+		 (\func3 << INSN_S_FUNC3_SHIFT) |		\
+		 (.L__gpr_num_\rs2 << INSN_S_RS2_SHIFT) |	\
+		 (.L__gpr_num_\rs1 << INSN_S_RS1_SHIFT) |	\
+		 ((\simm12 & 0x1f) << INSN_S_SIMM5_SHIFT) |	\
+		 (((\simm12 >> 5) & 0x7f) << INSN_S_SIMM7_SHIFT))
+	.endm
+
 #endif
 
 #define __INSN_R(...)	insn_r __VA_ARGS__
 #define __INSN_I(...)	insn_i __VA_ARGS__
+#define __INSN_S(...)	insn_s __VA_ARGS__
 
 #else /* ! __ASSEMBLY__ */
 
@@ -66,6 +87,9 @@
 #define __INSN_I(opcode, func3, rd, rs1, simm12)	\
 	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
 
+#define __INSN_S(opcode, func3, rs2, simm12, rs1)	\
+	".insn	s " opcode ", " func3 ", " rs2 ", " simm12 "(" rs1 ")\n"
+
 #else
 
 #include <linux/stringify.h>
@@ -92,12 +116,26 @@
 "		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
 "	.endm\n"
 
+#define DEFINE_INSN_S							\
+	__DEFINE_ASM_GPR_NUMS						\
+"	.macro insn_s, opcode, func3, rs2, simm12, rs1\n"		\
+"	.4byte	((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"	\
+"		 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"	\
+"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
+"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
+"		 ((\\simm12 & 0x1f) << " __stringify(INSN_S_SIMM5_SHIFT) ") |" \
+"		 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
+"	.endm\n"
+
 #define UNDEFINE_INSN_R							\
 "	.purgem insn_r\n"
 
 #define UNDEFINE_INSN_I							\
 "	.purgem insn_i\n"
 
+#define UNDEFINE_INSN_S							\
+"	.purgem insn_s\n"
+
 #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
 	DEFINE_INSN_R							\
 	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
@@ -108,6 +146,11 @@
 	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
 	UNDEFINE_INSN_I
 
+#define __INSN_S(opcode, func3, rs2, simm12, rs1)			\
+	DEFINE_INSN_S							\
+	"insn_s " opcode ", " func3 ", " rs2 ", " simm12 ", " rs1 "\n"	\
+	UNDEFINE_INSN_S
+
 #endif
 
 #endif /* ! __ASSEMBLY__ */
@@ -120,6 +163,10 @@
 	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
 		 RV_##rs1, RV_##simm12)
 
+#define INSN_S(opcode, func3, rs2, simm12, rs1)			\
+	__INSN_S(RV_##opcode, RV_##func3, RV_##rs2,		\
+		 RV_##simm12, RV_##rs1)
+
 #define RV_OPCODE(v)		__ASM_STR(v)
 #define RV_FUNC3(v)		__ASM_STR(v)
 #define RV_FUNC7(v)		__ASM_STR(v)
@@ -133,6 +180,7 @@
 #define RV___RS2(v)		__RV_REG(v)
 
 #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
+#define RV_OPCODE_OP_IMM	RV_OPCODE(19)
 #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
 
 #define HFENCE_VVMA(vaddr, asid)				\
@@ -196,4 +244,16 @@
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(4))
 
+#define CBO_PREFETCH_I(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
+	       SIMM12(offset), RS1(base))
+
+#define CBO_PREFETCH_R(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
+	       SIMM12(offset), RS1(base))
+
+#define CBO_PREFETCH_W(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
+	       SIMM12(offset), RS1(base))
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3785ffc1570..bdb02b066041 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -168,6 +168,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
+	__RISCV_ISA_EXT_DATA(zicbop, RISCV_ISA_EXT_ZICBOP),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
