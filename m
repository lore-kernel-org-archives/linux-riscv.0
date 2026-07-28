Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F578C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:To:Subject:From
	:References:In-Reply-To:Date:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6IpIJDzCOQbDBWCovKDS4ddFcl7QPq8LDO5WYkDAXY=; b=e7T5BmIypt8EBl
	jlnKAXqYQfUrLcg/BxWe7us77QotdUTn0jvgZhAMMPRUYj+RQ+Xzz5BkmJuaRmEYZHClKKPy8GpnN
	ln+XdwuTZfn5+VqgN9gNVWFOtq7gob3GIeJ73H+6ml4n+ycd+7H2J2ib4uRX3gL6/O5wF+EhVce3E
	WjvysEsM3wZ/X85rYOsCSwF46pkyW511PkNAAKi/MaDm98Tr5tJeRN0gtD1wQFqWiCm5LIWh2eh1S
	G3HgjaLU07GaeI748eIs0LuAq7M04tYJuodmk9RRDDoZAiynkCw90+LsD5DQ87N381J52nmnW+7Fj
	9ghNWDrMRvuXI9gBaEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOc-00000004s1l-40xT;
	Tue, 28 Jul 2026 09:46:46 +0000
Received: from va-2-29.ptr.blmpb.com ([209.127.231.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOY-00000004rzH-0QQ7
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 09:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785231997; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=6xHuBiaBLF+eWMEPqQ7wvCVxa8ms/TFqklek4RIALx4=;
 b=Nw4p7zZlGAjHdb/MJ85mJkxjEk1HJaIcrWGi2H0InSRuPxUM9a9soDuT6jYU8PLTD/wKoH
 EpLw/kfqPOa3Jxk424CB50RXiVKGaMCh5w1RgYoMLYVvTqLafK46k730jFT4dlC79j3LFl
 a7XdVcb0boL+uknMyXIJbB0J/N+y/BkQ7Wxv1QmMWzTvrLpqFwFjowlZNbBBCdLX3S1X67
 RcrmDwVbTGi6cjggoGlKBP1qWFfAZI0PV1dIMMz6eZGC9+UrCHWlymBquzFV0yOW+PQhVE
 EiZf6yxpAkTmDJYfdG8lUm39uHpRNmhReABsvC5LYtB90tCtNRA1ZH4poBtmxA==
Cc: <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
Date: Tue, 28 Jul 2026 17:46:23 +0800
In-Reply-To: <20260728094627.94975-1-yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Tue, 28 Jul 2026 17:46:34 +0800
References: <20260728094627.94975-1-yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH v2 2/6] riscv: insn: Set sstatus.MXR when reading userspace instruction
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Message-Id: <20260728094627.94975-3-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26a687a7b+9aa882+lists.infradead.org+yang.yicong@picoheart.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_024642_229697_731575B9 
X-CRM114-Status: GOOD (  13.77  )
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

The __read_insn() uses get_user() to read userspace instructions.
Bo Gan noticed that get_user() is insufficient in this case since
it's possible for the instruction segment mapped as execute-only
and get_user() doesn't have permissions to load it. The architecture
provides sstatus.MXR for handling this so set MXR when reading
userspace instruction.

Cc: Bo Gan <ganboing@gmail.com>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/include/asm/csr.h       |  1 +
 arch/riscv/include/asm/insn.h      |  2 ++
 arch/riscv/include/asm/processor.h |  2 +-
 arch/riscv/kernel/asm-offsets.c    |  6 +++---
 arch/riscv/kernel/entry.S          | 14 +++++++-------
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index d5d309b3b570..7bfbda958f0f 100644
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
index 5f60367c2abc..c36d1dfa16c6 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -606,7 +606,9 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
 	int __ret;							\
 									\
 	if (user_mode(regs)) {						\
+		csr_set(CSR_STATUS, SR_MXR);				\
 		__ret = get_user(insn, (type __user *) insn_addr);	\
+		csr_clear(CSR_STATUS, SR_MXR);				\
 	} else {							\
 		insn = *(type *)insn_addr;				\
 		__ret = 0;						\
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec1..1e1523952b45 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -111,7 +111,7 @@ struct thread_struct {
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
index d799c4e56f80..9ccc74aafece 100644
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
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
