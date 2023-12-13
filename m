Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BF6C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CknPHStkZG5+nlJV3X4IgCGqQt6WRlJ0wK8L9KYMyrA=; b=f6p7UF3a9zMKpO
	pDiiJm9RjOG+x4WAV+47vsLLJTRls4tKd3jRaq1hZ/Hf7oWq6sw4vT9jrxzb7P6fDSW8LJnuTvAr2
	PD5cF5HZ7qxCQ+m0NPJnBi/e2CYUdni7EKNy+vBaD5KYZlL5GpO7Ak7UHiQX+V3vVTxdNRbV8Z5V4
	BKSK3OvYZVKJrfPzzTqSiE1oRarWT9qDSvhkSgW6tOOReTUslHf5JCO+cplTXWu/5KgbZUIJrmDNr
	3lxhVlDBqHuTkVurf/PwDXKZNW10Ffxa1D7UZWwC6ftMmwp0X9/2WptH3t071CnQS3vQeVGl1Yjxk
	Jbc6nHYryGkYV598r72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDY1I-00GB5L-2C;
	Wed, 13 Dec 2023 22:48:00 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDY1D-00GB3T-25
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 22:47:57 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6da2db096bcso19532a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 14:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702507674; x=1703112474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkqjL8gpQ8sLlCN1GXOrltvBjG/ddi2Ymbga0d7cLo0=;
        b=v6tJVgslNvvKipUCgksNNTopWE31C+P3x83EpNznPx7PlVF/Jl5r0hzGEzaZLWziEu
         GaRkC3Ap1Gi0ehsP49V0qnzMR+hA6nIrtKUcStiEgYbmYTqVggSL8JYY0CDWcFRLOabI
         noPJCRvMBHUKGT4JTXnnZ2iAm6t7E092xw0sp2XOGuxWsMj4kRWAg/rBSg2yvCVMHQaz
         CIykT+2pjkhwq8qtghfwdsKlhFOMsVpLjHb6k/dm5gspJWua2fQgBaMnfZv7UqPy8S2s
         /z8xpGp1pvS04KsjH337UIqNoetTKlIr/nGjvTvzkCbPWyrDi/UhIrmHLxfXYFKRhdr7
         UeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507674; x=1703112474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkqjL8gpQ8sLlCN1GXOrltvBjG/ddi2Ymbga0d7cLo0=;
        b=aPnaOrSdzJ1043WRs8pLJ6NGoV2nhIW57NkxZbXgbFGiquCURdmws76JJYxHV2yF/J
         fNBrkKL+tDJI8axjFN1NqksJQrzxTtm0oLKVkCQPhsIXZMh8fJyX6G7B/MSa5isworuD
         ZwusyqGNB6cmjUGw/r6arV1XSh0SXMz/UHLNxIL7WsaBRxbOdiD694siPaXglVy+6CjG
         pZ7V5goCLHmTkQy+7mRjU7J776doy4xdmiCaji63ttbRAc/wp9nsgG7MrZhA2Q6QsjaM
         3Ggh2VDIfEpLImG/VlQy97waBWitDXc2OBwMQOXuiOKhyAzjesSMoRUaw9oHA2WC/MSJ
         /xvw==
X-Gm-Message-State: AOJu0Yzq1iHUKXUmEOqCkhTbSg/E9F5YytyVjYQv8Hf+KqUtkMASjNbQ
	77c9biailoxYv3qVePcUMsTMhA==
X-Google-Smtp-Source: AGHT+IFS1dCeyzbePTtf03iMwFTzrcxSuGKaXk9blFVfCfy6vB9c1qH69Mo+m244rXn8GdgeEBhwUw==
X-Received: by 2002:a05:6870:70a0:b0:1fa:ed5d:5b60 with SMTP id v32-20020a05687070a000b001faed5d5b60mr4052430oae.7.1702507673573;
        Wed, 13 Dec 2023 14:47:53 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id bk21-20020a056830369500b006d855e2c56csm2375157otb.31.2023.12.13.14.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:47:53 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Dec 2023 14:47:47 -0800
Subject: [PATCH v3 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
MIME-Version: 1.0
Message-Id: <20231213-fencei-v3-1-b75158238eb7@rivosinc.com>
References: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com>
In-Reply-To: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702507670; l=6131;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ZybT6osscsbJNHD3FXkr0XheDxo9P/aKXBzramQFt5M=;
 b=vT9DEQt8t4gBJEHrLW8uYG6Rg8GxYnxBgsn2bssPDyU8xoqAGX5wkHKXCJPul/XI9snTFo12G
 59UhcgTkcUbBYMZCQ9z8deGm5qkruYbTrjwUeY2kHWPBoPXnIy/5I/3
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_144755_689178_CDEFEF80 
X-CRM114-Status: GOOD (  20.45  )
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
 arch/riscv/include/asm/processor.h |  6 ++++++
 arch/riscv/mm/cacheflush.c         | 37 +++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/context.c            |  8 +++++---
 include/uapi/linux/prctl.h         |  3 +++
 kernel/sys.c                       |  6 ++++++
 6 files changed, 59 insertions(+), 3 deletions(-)

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
index 55a34f2020a8..3b2bf8256a10 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -5,6 +5,7 @@
 
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/prctl.h>
 #include <asm/acpi.h>
 #include <asm/cacheflush.h>
 
@@ -152,3 +153,39 @@ void __init riscv_init_cbo_blocksizes(void)
 	if (cboz_block_size)
 		riscv_cboz_block_size = cboz_block_size;
 }
+
+/**
+ * riscv_set_icache_flush_ctx() - Enable userspace to emit icache flushing instructions.
+ * @ctx: Sets the type of context
+ *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fence.i will
+ *			      emitted on thread/process migration.
+ * @per_thread: When set to 0, will use the default behavior of setting the
+ *  icache flush context per process. When set to 1, will use a per thread
+ *  context.
+ *
+ * When in per-process context, there may be multiple threads using the same mm.
+ * Therefore, the icache can never be assumed clean when. Multiple threads in
+ * the process may modify instructions in the mm concurrently.
+ *
+ * In per-thread context, it can be assumed that all modifications to
+ * instructions in memory will be performed by this thread. When the thread is
+ * migrated the icache will be flushed.
+ *
+ */
+int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread)
+{
+#ifdef CONFIG_SMP
+	switch (ctx) {
+	case PR_RISCV_CTX_SW_FENCEI:
+		if (per_thread)
+			current->thread.force_icache_flush = true;
+		else
+			current->mm->context.force_icache_flush = true;
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
index 370ed14b1ae0..472801ea78cc 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,7 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
+# define PR_RISCV_CTX_SW_FENCEI		0
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
