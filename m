Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A61C48BC4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFOaufIgd6uqQnQTNKVdAkvyNc9254UBqlsZp+hj/PA=; b=G9F7sxDLsDZtA8
	i55tU814l/AoQ3BPEqNLT+/n9o6r1lcGVmKmqTHD+s13AjUHCXVrJF4CaGG4rCNvYF4alea6IhNNO
	qLwboHrjZFh/pJ+LkrDQemMkM/Hhp5Qmotx44KbTHZ6OA9tSff6Zxsqpkc/BlODf9e+oQ+K0rVBDx
	Kix8zQmmh0P/8HrwoE7oIFAlPRemZ3Nitpu8Ym3/js/V0JF+hb7HwlShb5DgpJDFrRei8AL0r7YMS
	Stsl9vEDqh7yHIRf/BK1oFrvSSvo6vNDTWhkKd8XRJPZzoyQu51P/Mj+picexpJNlYjan7u2XDdWJ
	orycnP4W+s1uJFWsqkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqq-00000007Ib2-1Nk7;
	Mon, 12 Feb 2024 23:36:40 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfql-00000007IX4-0VCD
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 23:36:36 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso2292883a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 15:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707780994; x=1708385794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dASIWM+uTiyyOMlmBksRTVw3Jl25BD2O8RxyTvNPqk4=;
        b=r9CHeTvAcXin5TudaCCQxu9vlDrkjLdD79art6QJHJDiVT696bWV2HImZS/WtliXun
         72FDiwkwYv2t7C1KEl9SxQLjBTqLNNbtjOTHvKA61zXFx3c4U1BhlPFaSZlRblhe+9Gz
         0MkiW6DjO++c0F7KHOtrInViE+OcHmgqZRT+OPpxnud6BghSJ4rV/ehWBpbLKDaHesFy
         pQLr+mWdM0BDeEh5VWN2VOzOKG6Dm7nkl9s4F2/syKv2crpP7szw6Rn65YdIgoTIWFoK
         xz1TtxRdq2nAWtlNcHiZ83b1Vnxg25vbBLlvExt71wSkyoYhWJyz9mzQCKLU4nahE4AY
         jlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707780994; x=1708385794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dASIWM+uTiyyOMlmBksRTVw3Jl25BD2O8RxyTvNPqk4=;
        b=rXaXKzcv0VlVds6i6RciRH14Y9L+C0xTx9Aytae49pJRFdlTgYEtNcK4vNzN/0uiNl
         7mQvmSnhKVwgvtOhxnZB7Qb03/ZCctHHF2bj6d525V6ILJYzpLYhmD2DtyOZNmpX8w6p
         kjwNK8rs/rrYcyAvzscYFhga4NdlI2WfvKwUXwTdeEoan2FfKQm7yDooTtA75BISomc7
         fOUeQJgr7q6vquDtY7lQ5BUqlKUSQmpHFC1NKlzxVSzz92ZBcvzO/asVuhUEOJDZeWXk
         od929oWpZIMAwCBoPVevD+w+zEzD3Zvx+7+AP9ZMfLUxkVDhS2pOikPcsEmmctQxPVwv
         mFSQ==
X-Gm-Message-State: AOJu0YzSZHZBajW3VHHxS2zxyARu+2AXJn3xTq1sOk/UyZlSx/Moxcs8
	auZuuXQ0x9zMNGotGFHkWO8rTCc7SE8rVPNO8by/RLNLdj/IyL6qLIPYPvi3cYQ=
X-Google-Smtp-Source: AGHT+IGWoz642JfrMWAzBx9RQr9NFENL/+5QyCyIvCKo/k8pNFxdTik3rGrNsdh2pg+67CNIq6Gmeg==
X-Received: by 2002:a05:6a20:c90d:b0:1a0:566a:5974 with SMTP id gx13-20020a056a20c90d00b001a0566a5974mr3532721pzb.61.1707780994003;
        Mon, 12 Feb 2024 15:36:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJE5WRyf6IA0AR7of4b+3XD0bB7/QSUiLZkw0KbtMo1jNqX0pxK0HqTzs5wgC3fGGxC7Ktft53eGVFxbTtwfAT3RRhtNxCaRVMi3BTWsSNNBb4vNsalHcOJwgbWoGz3UPdeZrlQjcxewKCU0eHsxDJ5Sc5k5UA5OdGOONC61YQGdbTnZgg7i0sWizzSVrtLRvYRek/VwnlTVYpyZ1HHDTtcuuOdgo8jMBwDMLByAShZSQM+qzcGF7BjwhzOezlIVfEktA7dTyTzTZdynBUysDf5heHqfKFRjEhXN2aezMKX5i7avm5s3jW/Xzv20p5bT944Z6o2O7GgH7Nf+xmJ1xwzoo/Wh/hFFoMPfBbbSBQe7FbfyxrTLeH7L9fajeNbSFwLRPzt7dxwEm0QXU9HET9QUACTnR9bhVppo2GWQqjhNl7ARHMy1RFH5cVp8S8HyJXBtc=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b001da153682c5sm888693plk.261.2024.02.12.15.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 15:36:33 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 12 Feb 2024 15:36:27 -0800
Subject: [PATCH v11 2/4] riscv: Include riscv_set_icache_flush_ctx prctl
MIME-Version: 1.0
Message-Id: <20240212-fencei-v11-2-e1327f25fe10@rivosinc.com>
References: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
In-Reply-To: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707780989; l=11568;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=TKCt+8IZ9ruFBnTgfJxRkDydxZvQ/nlPrN0EVMID0+A=;
 b=mXok/mb98DSDzfQSJsMFWzjeOw67T47xCMxZXKsQOL+eBtqj6VQDjbSmupvqXHeKGrQt9DCXz
 RTyTXGZNotGBvzga7ax/Xk2AcIKACM5dP0xS8ZpYk4cSQsMp40CZquV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_153635_418184_86C2E44B 
X-CRM114-Status: GOOD (  26.11  )
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

Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
optimization of cross modifying code. This prctl enables userspace code
to use icache flushing instructions such as fence.i with the guarantee
that the icache will continue to be clean after thread migration.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/mmu.h       |   2 +
 arch/riscv/include/asm/processor.h |  12 +++++
 arch/riscv/include/asm/switch_to.h |  23 ++++++++
 arch/riscv/mm/cacheflush.c         | 105 +++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/context.c            |  18 +++++--
 include/uapi/linux/prctl.h         |   6 +++
 kernel/sys.c                       |   6 +++
 7 files changed, 167 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 355504b37f8e..60be458e94da 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -19,6 +19,8 @@ typedef struct {
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
 	cpumask_t icache_stale_mask;
+	/* Force local icache flush on all migrations. */
+	bool force_icache_flush;
 #endif
 #ifdef CONFIG_BINFMT_ELF_FDPIC
 	unsigned long exec_fdpic_loadmap;
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index a8509cc31ab2..46c5c3b91165 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -69,6 +69,7 @@
 #endif
 
 #ifndef __ASSEMBLY__
+#include <linux/cpumask.h>
 
 struct task_struct;
 struct pt_regs;
@@ -123,6 +124,14 @@ struct thread_struct {
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
 	struct __riscv_v_ext_state kernel_vstate;
+#ifdef CONFIG_SMP
+	/* A local icache flush is needed before user execution can resume on one of these cpus. */
+	cpumask_t icache_stale_mask;
+	/* Regardless of the icache_stale_mask, flush the icache on migration */
+	bool force_icache_flush;
+	/* A forced icache flush is not needed if migrating to the previous cpu. */
+	unsigned int prev_cpu;
+#endif
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
@@ -184,6 +193,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
 #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
 #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
 
+#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
+extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..7594df37cc9f 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -8,6 +8,7 @@
 
 #include <linux/jump_label.h>
 #include <linux/sched/task_stack.h>
+#include <linux/mm_types.h>
 #include <asm/vector.h>
 #include <asm/cpufeature.h>
 #include <asm/processor.h>
@@ -72,14 +73,36 @@ static __always_inline bool has_fpu(void) { return false; }
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
+static inline bool switch_to_should_flush_icache(struct task_struct *task)
+{
+#ifdef CONFIG_SMP
+	bool stale_mm = task->mm && task->mm->context.force_icache_flush;
+	bool stale_thread = task->thread.force_icache_flush;
+	bool thread_migrated = smp_processor_id() != task->thread.prev_cpu;
+
+	return thread_migrated && (stale_mm || stale_thread);
+#else
+	return false;
+#endif
+}
+
+#ifdef CONFIG_SMP
+#define __set_prev_cpu(thread) ((thread).prev_cpu = smp_processor_id())
+#else
+#define __set_prev_cpu(thread)
+#endif
+
 #define switch_to(prev, next, last)			\
 do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
+	__set_prev_cpu(__prev->thread);			\
 	if (has_fpu())					\
 		__switch_to_fpu(__prev, __next);	\
 	if (has_vector())					\
 		__switch_to_vector(__prev, __next);	\
+	if (switch_to_should_flush_icache(__next))	\
+		local_flush_icache_all();		\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 55a34f2020a8..6513a0ab8655 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -5,6 +5,7 @@
 
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/prctl.h>
 #include <asm/acpi.h>
 #include <asm/cacheflush.h>
 
@@ -152,3 +153,107 @@ void __init riscv_init_cbo_blocksizes(void)
 	if (cboz_block_size)
 		riscv_cboz_block_size = cboz_block_size;
 }
+
+/**
+ * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in
+ * userspace.
+ * @ctx: Set the type of icache flushing instructions permitted/prohibited in
+ *	 userspace. Supported values described below.
+ *
+ * Supported values for ctx:
+ *
+ * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in user space.
+ *
+ * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in user space. All threads in
+ *   a process will be affected when ``scope == PR_RISCV_SCOPE_PER_PROCESS``.
+ *   Therefore, caution must be taken; use this flag only when you can guarantee
+ *   that no thread in the process will emit fence.i from this point onward.
+ *
+ * @scope: Set scope of where icache flushing instructions are allowed to be
+ *	   emitted. Supported values described below.
+ *
+ * Supported values for scope:
+ *
+ * * %PR_RISCV_SCOPE_PER_PROCESS: Ensure the icache of any thread in this process
+ *                               is coherent with instruction storage upon
+ *                               migration.
+ *
+ * * %PR_RISCV_SCOPE_PER_THREAD: Ensure the icache of the current thread is
+ *                              coherent with instruction storage upon
+ *                              migration.
+ *
+ * When ``scope == PR_RISCV_SCOPE_PER_PROCESS``, all threads in the process are
+ * permitted to emit icache flushing instructions. Whenever any thread in the
+ * process is migrated, the corresponding hart's icache will be guaranteed to be
+ * consistent with instruction storage. This does not enforce any guarantees
+ * outside of migration. If a thread modifies an instruction that another thread
+ * may attempt to execute, the other thread must still emit an icache flushing
+ * instruction before attempting to execute the potentially modified
+ * instruction. This must be performed by the user-space program.
+ *
+ * In per-thread context (eg. ``scope == PR_RISCV_SCOPE_PER_THREAD``) only the
+ * thread calling this function is permitted to emit icache flushing
+ * instructions. When the thread is migrated, the corresponding hart's icache
+ * will be guaranteed to be consistent with instruction storage.
+ *
+ * On kernels configured without SMP, this function is a nop as migrations
+ * across harts will not occur.
+ */
+int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
+{
+#ifdef CONFIG_SMP
+	switch (ctx) {
+	case PR_RISCV_CTX_SW_FENCEI_ON:
+		switch (scope) {
+		case PR_RISCV_SCOPE_PER_PROCESS:
+			current->mm->context.force_icache_flush = true;
+			break;
+		case PR_RISCV_SCOPE_PER_THREAD:
+			current->thread.force_icache_flush = true;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case PR_RISCV_CTX_SW_FENCEI_OFF:
+		cpumask_t *mask;
+
+		switch (scope) {
+		case PR_RISCV_SCOPE_PER_PROCESS:
+			bool stale_cpu;
+
+			current->mm->context.force_icache_flush = false;
+
+			/*
+			 * Mark every other hart's icache as needing a flush for
+			 * this MM. Maintain the previous value of the current
+			 * cpu to handle the case when this function is called
+			 * concurrently on different harts.
+			 */
+			mask = &current->mm->context.icache_stale_mask;
+			stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
+
+			cpumask_setall(mask);
+			assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
+			break;
+		case PR_RISCV_SCOPE_PER_THREAD:
+			current->thread.force_icache_flush = false;
+
+			/*
+			 * Mark every other hart's icache as needing a flush for
+			 * this thread.
+			 */
+			mask = &current->thread.icache_stale_mask;
+			cpumask_setall(mask);
+			cpumask_clear_cpu(smp_processor_id(), mask);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+#endif
+	return 0;
+}
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de6134..2eb13b89cced 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -15,6 +15,7 @@
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/mmu_context.h>
+#include <asm/switch_to.h>
 
 #ifdef CONFIG_MMU
 
@@ -297,21 +298,28 @@ static inline void set_mm(struct mm_struct *prev,
  *
  * The "cpu" argument must be the current local CPU number.
  */
-static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
+static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
+					 struct task_struct *task)
 {
 #ifdef CONFIG_SMP
 	cpumask_t *mask = &mm->context.icache_stale_mask;
 
-	if (cpumask_test_cpu(cpu, mask)) {
+	if (cpumask_test_and_clear_cpu(cpu, mask) ||
+	    (task && cpumask_test_and_clear_cpu(cpu, &task->thread.icache_stale_mask))) {
 		cpumask_clear_cpu(cpu, mask);
+
 		/*
 		 * Ensure the remote hart's writes are visible to this hart.
 		 * This pairs with a barrier in flush_icache_mm.
 		 */
 		smp_mb();
-		local_flush_icache_all();
-	}
 
+		/*
+		 * If cache will be flushed in switch_to, no need to flush here.
+		 */
+		if (!(task && switch_to_should_flush_icache(task)))
+			local_flush_icache_all();
+	}
 #endif
 }
 
@@ -332,5 +340,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 
 	set_mm(prev, next, cpu);
 
-	flush_icache_deferred(next, cpu);
+	flush_icache_deferred(next, cpu, task);
 }
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..524d546d697b 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,10 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
+# define PR_RISCV_CTX_SW_FENCEI_ON	0
+# define PR_RISCV_CTX_SW_FENCEI_OFF	1
+# define PR_RISCV_SCOPE_PER_PROCESS	0
+# define PR_RISCV_SCOPE_PER_THREAD	1
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index e219fcfa112d..69afdd8b430f 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -146,6 +146,9 @@
 #ifndef RISCV_V_GET_CONTROL
 # define RISCV_V_GET_CONTROL()		(-EINVAL)
 #endif
+#ifndef RISCV_SET_ICACHE_FLUSH_CTX
+# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2743,6 +2746,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_V_GET_CONTROL:
 		error = RISCV_V_GET_CONTROL();
 		break;
+	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
+		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
+		break;
 	default:
 		error = -EINVAL;
 		break;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
