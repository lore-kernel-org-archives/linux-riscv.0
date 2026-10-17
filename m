Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9C3CCF2C8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:Message-Id:Date:
	References:From:In-Reply-To:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWBk9H/2ODyEOrCne0WO70mMwjOgVm0YYe+T0CkHlF0=; b=EzRaqv443nhO3l
	XU7TFgl2cEA8TIzUGRo/H2B5ohp05RFYtpXe2MomuM6jbZiPOOKUdsOqQQMejRV9tJXTDhJ+NIesD
	9+b2vExLUR3E6jEHKjIr1E3H3VibeJhB3/oBKutQdZLHkj2RbboB7xAIfP+2H3Bnq/Tl6EGHh2qu1
	Wmw5YM3yFvaQbm4WNwmZxgD0lsJ8GokOwxzmTJusfpVdWTWV4IQwuSjs8WbATSyKfJHxDyAVLzXpH
	BeHVfIdFU8AzSLKQDrYeMgBpwTH78Oon9Gf3MMGRKNZXo0NbColKgPU7vkV3tWHblgedRrFN7hNZB
	EtjDkGkETZPdUyHp6rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzp9-00000004ZgE-197S;
	Sat, 17 Oct 2026 08:31:27 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzox-00000004Zah-11wC
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 08:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792225867; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=2fo3EIPxVdy3e79Mp9BU1H7vsMz/3Y5WLoz9TPF+qYQ=;
 b=N467PG1BFeNJsFqI1KAzcg3VdFFDecKvEa3mjZcgYYtiwkJ8gTktA9P20JhNpaty8ovoqX
 zfGR1gTKF9yi/6a3Xj1mRFg7L0ZJaOH7IX1BNmqjj3LWWWMhVYou9wzugdf2nQtr3jen0H
 11nMjgr9sdVKFMM7cG4pGNgnhQ/i5Xd8ZBuCVOvNe/9seS+Cbkoak86U9oMtQzx1ZYH3DY
 cm/r20p2L2hxaAbt7xQDdXGF523rEzFbUzDLsLP/RwLIyHBhGs5OIYzDxacGM8KBjb3byx
 +3IvO+EWkK5kYDXz5gMDgHC/BFbh/H6miOy9adlc/D6YFL3T4WC3LsEg1CdxLg==
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017083100.40157-1-yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
References: <20261017083100.40157-1-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26ad3324a+164221+lists.infradead.org+yang.yicong@picoheart.com>
Date: Sat, 17 Oct 2026 16:30:56 +0800
Message-Id: <20261017083100.40157-2-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Sat, 17 Oct 2026 16:31:05 +0800
Subject: [PATCH v5 1/5] riscv: Make get_insn public for instruction fault handling
Mime-Version: 1.0
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_013115_497199_A84095FF 
X-CRM114-Status: GOOD (  20.09  )
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

Currently two places (vector and misaligned load/store) need
to get fault instructions for handling and they implement the
function separately. This is a common function so make
get_insn() public in asm/insn.h for doing this job to make it
less fragile and improve the maintainability.

Also fix a bug that Bo Gan noticed: get_user() is insufficient
in this case since it's possible for the instruction segment
mapped as execute-only and get_user() doesn't have permissions
to load it. The architecture provides sstatus.MXR for handling
this so set MXR when reading userspace instruction.

Cc: Bo Gan <ganboing@gmail.com>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/include/asm/csr.h         |  1 +
 arch/riscv/include/asm/insn.h        | 62 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/processor.h   |  2 +-
 arch/riscv/kernel/asm-offsets.c      |  6 +--
 arch/riscv/kernel/entry.S            | 14 +++----
 arch/riscv/kernel/traps_misaligned.c | 52 -----------------------
 arch/riscv/kernel/vector.c           |  6 +--
 7 files changed, 77 insertions(+), 66 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 621f84d1898f..e790cc2b8065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -17,6 +17,7 @@
 #define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
+#define SR_MXR		_AC(0x00080000, UL) /* Make eXecutable Readable */
 
 /* zicfilp landing pad status bit */
 #define SR_SPELP	_AC(0x00800000, UL)
diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..88cea321ec3d 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -600,4 +600,66 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
 	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
 	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
 }
+
+#define __read_insn(regs, insn, insn_addr, type)			\
+({									\
+	int __ret;							\
+									\
+	if (user_mode(regs)) {						\
+		const type __user *__p = (const type __user *)(insn_addr);\
+		might_fault();						\
+		if (access_ok(__p, sizeof(*__p))) {			\
+			csr_set(CSR_STATUS, SR_MXR);			\
+			__ret = __get_user((insn), __p);		\
+			csr_clear(CSR_STATUS, SR_MXR);			\
+		} else {						\
+			(insn) = 0;					\
+			__ret = -EFAULT;				\
+		}							\
+	} else {							\
+		(insn) = *(type *)(insn_addr);				\
+		__ret = 0;						\
+	}								\
+									\
+	__ret;								\
+})
+
+static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
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
+		insn &= GENMASK(15, 0);
+		if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
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
+		if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) {
+			*r_insn = insn;
+			return 0;
+		}
+		insn &= GENMASK(15, 0);
+		*r_insn = insn;
+
+		return 0;
+	}
+}
+
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 815715c67f94..29af76aa486e 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -119,7 +119,7 @@ struct thread_struct {
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
 	unsigned long envcfg;
-	unsigned long sum;
+	unsigned long sum_mxr;
 	u32 riscv_v_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a75f0cfea1e9..b6de2179570b 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -35,7 +35,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
-	OFFSET(TASK_THREAD_SUM, task_struct, thread.sum);
+	OFFSET(TASK_THREAD_SUM_MXR, task_struct, thread.sum_mxr);
 
 	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
@@ -352,8 +352,8 @@ void asm_offsets(void)
 		  offsetof(struct task_struct, thread.s[11])
 		- offsetof(struct task_struct, thread.ra)
 	);
-	DEFINE(TASK_THREAD_SUM_RA,
-		  offsetof(struct task_struct, thread.sum)
+	DEFINE(TASK_THREAD_SUM_MXR_RA,
+		  offsetof(struct task_struct, thread.sum_mxr)
 		- offsetof(struct task_struct, thread.ra)
 	);
 
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a7716697..bfd4bfa6e9fe 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -172,13 +172,13 @@ SYM_CODE_START(handle_exception)
 	save_from_x6_to_x31
 
 	/*
-	 * Disable user-mode memory access as it should only be set in the
-	 * actual user copy routines.
+	 * Disable user-mode memory access and MXR as it should only be set in
+	 * the actual user copy routines.
 	 *
 	 * Disable the FPU/Vector to detect illegal usage of floating point
 	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_MXR | SR_FS_VS
 #ifdef CONFIG_64BIT
 	li t1, SR_ELP
 	or t0, t0, t1
@@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
 
-	/* save the user space access flag */
+	/* save the user space access and MXR flag */
 	csrr  s0, CSR_STATUS
-	REG_S s0, TASK_THREAD_SUM_RA(a3)
+	REG_S s0, TASK_THREAD_SUM_MXR_RA(a3)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
-	REG_L s0,  TASK_THREAD_SUM_RA(a4)
-	li    s1,  SR_SUM
+	REG_L s0,  TASK_THREAD_SUM_MXR_RA(a4)
+	li    s1,  SR_SUM | SR_MXR
 	and   s0,  s0, s1
 	csrs  CSR_STATUS, s0
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 6e8ae6c66322..f10f14001480 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -129,58 +129,6 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
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
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index b112166d51e9..1e37810035a9 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -184,8 +184,8 @@ EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
 
 bool riscv_v_first_use_handler(struct pt_regs *regs)
 {
-	u32 __user *epc = (u32 __user *)regs->epc;
-	u32 insn = (u32)regs->badaddr;
+	unsigned long epc = regs->epc;
+	unsigned long insn = regs->badaddr;
 
 	if (!(has_vector() || has_xtheadvector()))
 		return false;
@@ -200,7 +200,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 
 	/* Get the instruction */
 	if (!insn) {
-		if (__get_user(insn, epc))
+		if (get_insn(regs, epc, &insn))
 			return false;
 	}
 
-- 
2.54.0 (Apple Git-157)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
