Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA93BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahQ8KDItZm4DEDDjG20r39+rFn7rxteCYgtCQULcPzU=; b=ImCWCTM9NtTh9e
	tT34lLTf6xvs1DfnRCpkJK+hVDIiLFcc9Zp5QaPTYPhcK1wPKHi12qJHn4jzvP8DvoIRFh6LyVlhp
	5dgXsI/1pHT0IX1zopGPRxOULtu/Ozm3f6Bv0q94xAaggmRc2Q/xVpDtWY1sDiam5+Q1LBEIJhsHm
	4D2lFYOJLp6wRDZq+rJT9V2bPImqVY5SVu/roC6w3n5MsutE0Jgssq722vvceBgBng1yiJ/N1eQGN
	WFTxfzu/HN7rwYtMOtIUMxTpYuKE8fN9oELS1mM3Y9SRIdAFW9w3eXXASkwxEf/LCjfGA5WA8DYTz
	hUGYB8VUOf9wLB1Rky6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuaL-005wEk-1W;
	Mon, 08 Jan 2024 18:42:53 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuaF-005w9x-0R
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 18:42:50 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-204235d0913so1604179fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 10:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704739360; x=1705344160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6V5mUDz/ArwMQCWHpehsnGmBF913UphNBnehcxty1g=;
        b=ir51feVFDGimolqm5WTr4UU9Ndv3qOMFY/KBWSYwBXnCRkrPljs9M3ySC71vSJXOTX
         vjfsnIj9IZiJmjv/Kwa+HGSXccsjZyMSShZh1/5rL7p/qc/4/2TYVVhGFM/a11daCji8
         vHrEGjPQSub6rJ19CznX+QkMlZ+nndsORtm6auBt0i0L7jT/QtqRg45T6Y++0TfUtm27
         ePuK1vU4/D2PNgc5ARn5v4SmjlBooIOicS2mOcFgoCFV6AkaHo3SuQzZq8YgXhspJZXf
         O9S460/IrYbUZuu+3+UpHHSITttzneP20/x4sDRM1KS/guI9URU2hNtC2bluUwDT6Te9
         B6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704739360; x=1705344160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6V5mUDz/ArwMQCWHpehsnGmBF913UphNBnehcxty1g=;
        b=X4ZXMkA6m1fnt5wqxhUbct8wEkDtVwulARZTyG1DGDl6c33hWYyU6WWY96nPim90Qm
         /4kDK4gfv3IgmvuiA421DqSlRVaj0j6tv0RoPpYBZlyWp5NHC0Vr66IP7g+ypYMv3zSf
         PHSXe62T3wEa8y7kM0Tx8LAE81LqnVqaR3lOCyBURSfVW6J2DQETbaQWwX7yX1UCn4bo
         rC8b3vi8NLvVDy/ccRk7GI9+xbbwjMI8MMx8Et5EA/3N7Lw7SXgPnlJqPYwdfXxcE62m
         qPRSCnucBU443hn8gmX5+FLpdEypF964FfDr9sFKbsxjIMo6mT6Y5xkrTdeeag7AHKf4
         mWjw==
X-Gm-Message-State: AOJu0YwEgvgXd8jZZsa7+ONbWnsQ2kktKIRkvdYY0E2nRz7FrdUdRYi1
	5Km0wCx+AMXAi8qVfGXnfGmnlrHGHNZLRg==
X-Google-Smtp-Source: AGHT+IEFvadrZzOWSqQPBZQGfiG8LafYKw8OApL2jimhZSwKvSPUg8DPD4zF/Fq7TUyYsKnfUHxyQw==
X-Received: by 2002:a05:6870:280b:b0:206:16d9:e0f4 with SMTP id gz11-20020a056870280b00b0020616d9e0f4mr3702444oab.83.1704739360461;
        Mon, 08 Jan 2024 10:42:40 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id pp24-20020a0568709d1800b002044a0677adsm97860oab.8.2024.01.08.10.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:42:40 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 08 Jan 2024 10:42:29 -0800
Subject: [PATCH v5 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
MIME-Version: 1.0
Message-Id: <20240108-fencei-v5-1-aa1e51d7222f@rivosinc.com>
References: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
In-Reply-To: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704739355; l=7202;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Jzlf965RqW01Ti4D8HEqjrOfLlTHg/6RiAi+H3J00Cc=;
 b=ZaUc08rRD9dRcmfhB9brz8NAWSmy/Vh1ORdCW2niSGY9YhoDXv0fT6L7GvrHT2XiYGDSMCF/w
 6YBsAPd32ziC/ssb+4+IdqyTw7Q3a0QCbOdrqmOgQSxvLq5iCieIG4i
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_104247_184487_D41101D4 
X-CRM114-Status: GOOD (  20.65  )
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
---
 arch/riscv/include/asm/mmu.h       |  2 ++
 arch/riscv/include/asm/processor.h |  6 ++++
 arch/riscv/mm/cacheflush.c         | 56 ++++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/context.c            |  8 ++++--
 include/uapi/linux/prctl.h         |  4 +++
 kernel/sys.c                       |  6 ++++
 6 files changed, 79 insertions(+), 3 deletions(-)

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
index f19f861cda54..7eda6c75e0f2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -84,6 +84,9 @@ struct thread_struct {
 	unsigned long vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
+#ifdef CONFIG_SMP
+	bool force_icache_flush;
+#endif
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
@@ -145,6 +148,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
 #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
 #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
 
+#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
+extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 55a34f2020a8..a647b8abbe37 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -5,6 +5,7 @@
 
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/prctl.h>
 #include <asm/acpi.h>
 #include <asm/cacheflush.h>
 
@@ -152,3 +153,58 @@ void __init riscv_init_cbo_blocksizes(void)
 	if (cboz_block_size)
 		riscv_cboz_block_size = cboz_block_size;
 }
+
+/**
+ * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instructions in userspace.
+ * @ctx: Set the type of icache flushing instructions permitted/prohibited.
+ *
+ * * %PR_RISCV_CTX_SW_FENCEI_ON: Allow fence.i in userspace.
+ *
+ * * %PR_RISCV_CTX_SW_FENCEI_OFF: Disallow fence.i in userspace. When
+ *   ``per_thread == 0``, this will effect all threads in a process. Therefore,
+ *   caution must be taken -- only use this flag when you can guarantee that no
+ *   thread in the process will emit fence.i from this point onward.
+ *
+ * @per_thread: When set to 0, will perform operation on process migration. When
+ *  set to 1, will perform operation on thread migration.
+ *
+ * When ``per_thread == 0``, all threads in the process are permitted to emit
+ * icache flushing instructions. Whenever any thread in the process is migrated,
+ * the corresponding hart's icache will be guaranteed to be consistent with
+ * instruction storage. Note this does not enforce any guarantees outside of
+ * migration. If a thread modifies an instruction that another thread may
+ * attempt to execute, the other thread must still emit an icache flushing
+ * instruction before attempting to execute the potentially modified
+ * instruction. This must be performed by the userspace program.
+ *
+ * In per-thread context (eg. ``per_thread == 1``), only the thread calling this
+ * function is permitted to emit icache flushing instructions. When the thread
+ * is migrated, the corresponding hart's icache will be guaranteed to be
+ * consistent with instruction storage.
+ *
+ * On kernels configured without SMP, this function is a nop as migrations
+ * across harts will not occur.
+ */
+int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread)
+{
+#ifdef CONFIG_SMP
+	switch (ctx) {
+	case PR_RISCV_CTX_SW_FENCEI_ON:
+		if (per_thread)
+			current->thread.force_icache_flush = true;
+		else
+			current->mm->context.force_icache_flush = true;
+		break;
+	case PR_RISCV_CTX_SW_FENCEI_OFF:
+		if (per_thread)
+			current->thread.force_icache_flush = false;
+		else
+			current->mm->context.force_icache_flush = false;
+		break;
+
+	default:
+		break;
+	}
+#endif
+	return 0;
+}
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de6134..0146c61be0ab 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -297,12 +297,14 @@ static inline void set_mm(struct mm_struct *prev,
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
+	if (cpumask_test_cpu(cpu, mask) || mm->context.force_icache_flush ||
+	    (task && task->thread.force_icache_flush)) {
 		cpumask_clear_cpu(cpu, mask);
 		/*
 		 * Ensure the remote hart's writes are visible to this hart.
@@ -332,5 +334,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 
 	set_mm(prev, next, cpu);
 
-	flush_icache_deferred(next, cpu);
+	flush_icache_deferred(next, cpu, task);
 }
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..ec731dda5b8e 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,8 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
+# define PR_RISCV_CTX_SW_FENCEI_ON	0
+# define PR_RISCV_CTX_SW_FENCEI_OFF	1
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 420d9cb9cc8e..e806a8a67c36 100644
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
@@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
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
