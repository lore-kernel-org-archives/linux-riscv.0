Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFCDC61D99
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 01:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10FxXPZnlUnqz5U+WiRhAA398WIWLxD0BrExASSjhWk=; b=SA2B9JYRGSZ69H
	/dlNYyxTX+U+ory2FSutC+xuJmBs/S1OxAhk5vuq+Vm3pNJlVfdcT/7tWHhqJfF+eCBPGbiWkgAyg
	b+D68EbWd2L5jBjKFHcSg0Eet0D2o87nlx+GvjF3IwKp2nzOpgE9u4JTAvTaDXpEZldYU6+7zsjVn
	W6gn/jq04lw9fXx8FhH5bMj9nRqB93sOQCJeYoX3cvK6sUhc2VbT2d6yTPJI1u5TCMQb3XwKu5OA3
	9aMoIHbImD+OWaRwffMqqnRxd1sGMRNxAK0cgSFeHYSxDnMNQjCrLlhhx4u86bMcDwkdWMZeoc2c4
	rnC0CsjDltMctq8NW+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5y7t-003Sll-0K;
	Thu, 23 Nov 2023 01:03:29 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5y7p-003Skf-2P
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 01:03:27 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1efabc436e4so268694fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 17:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700701404; x=1701306204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVkyC6PZB7dezKGwlai9RtxoLm4mQaLK4fj0JbxGOM8=;
        b=yFftdS7s10Ven4vId6WGM0ASMujmm7r/j6BDygdINxKjD2/lp8kZlzpkylgf+bhE5W
         s3AxEVC1eUIuRyY4umKoe//ciJnBi9Ml/3iWOYGSVIdAWIT7drLnDPivGS4TILBrHJEO
         6smnQb32aqfvKRYTWjC+gzkAHVk1YaKSBnZLZxz6VWamHloqhmC55PL4dHGXtDIgGN1/
         rkPTZq05zM97qahL0uZr9/7uLvo/292UZGAoIgH069qPFWiLGq6I+OBoMwukY1scEJXw
         XbLHE4H0o2zO2+ZFmRtAHSqmlP3VEn2zsJ02kfpXJchlTYHxTPI2RYYE12atYI6ruhE7
         En0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700701404; x=1701306204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVkyC6PZB7dezKGwlai9RtxoLm4mQaLK4fj0JbxGOM8=;
        b=f6cPwb0W5ViLv3N1+ukWhRXEb9Lqm0wpTb9o43utFoIGlgERhYj4nqQkqG3YZ5l8Z3
         6DV+J9CY8Zh5AChdl8TPCZOOItuNys8AH2uUbEHkHKlsbL1dy3U4W7DPDj6aoXvhKiUR
         O6M7vqbFch3IwIoC9CQsLtZ84AcZ5h6mffehRGpaK+Dztqjy7RFHjrkYKwTjalXZ99uW
         5NlFNtMjx1HRNHIzeN632isiM3Crqn+FsnDdvkCyZHq7Kyc2YDD/KjQRW4QqOSkBWxqf
         Ai5xNZ+ksYE/BOArL9IEVhizghYJZC1gc2jJnWd31a8XDrs+RLvKR803sgyLbj9cCGHd
         xA9Q==
X-Gm-Message-State: AOJu0YzCQb6uQkGaxa/a9GcHw/DOEH6YDvqo/lWXMRHO7IB8SVxQM7SP
	MsGwqCnsP9kqngJlgr9wCoH04g==
X-Google-Smtp-Source: AGHT+IEodBf9g1G+tyRO8UTIlhuFj5nTh0XchENIQ6Z7EexAsdxCiJ1BQNqRTwDQmzUwO1iUtDys8g==
X-Received: by 2002:a05:6870:4507:b0:1ef:9f6c:3dea with SMTP id e7-20020a056870450700b001ef9f6c3deamr5104346oao.39.1700701404455;
        Wed, 22 Nov 2023 17:03:24 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id oq12-20020a0568707d8c00b001dcfaba6d22sm65834oab.46.2023.11.22.17.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 17:03:23 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Nov 2023 17:03:20 -0800
Subject: [PATCH 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
MIME-Version: 1.0
Message-Id: <20231122-fencei-v1-1-bec0811cb212@rivosinc.com>
References: <20231122-fencei-v1-0-bec0811cb212@rivosinc.com>
In-Reply-To: <20231122-fencei-v1-0-bec0811cb212@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700701402; l=6097;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=p1/wVG4oK4tPyVEB1cAzIfwRdweH+n5SlbZADGl3HN0=;
 b=pHKTD7SgU0wmTpzFJLgvdn97KMxLFMphUzl+8fEBoD15qhhADhhnZxPbG9z6yByxWqwDDvYtR
 lZoZJpQmJvLC/hLDA8UBCzU/UWEcG0NwYl5rQi08FMJS4xAZ4Z7rtbU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_170325_782975_9F85F8E6 
X-CRM114-Status: GOOD (  20.27  )
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
index 55a34f2020a8..36f69c71026a 100644
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
+ * Enable userspace to emit icache flushing instructions.
+ *
+ * When in per-process context, there may be multiple threads using the same mm.
+ * Therefore, the icache can never be assumed clean when. Multiple threads in
+ * the process may modify instructions in the mm concurrently.
+ *
+ * In per-thread context, it can be assumed that all modifications to
+ * instructions in memory will be performed by this thread. When the thread is
+ * migrated the icache will be flushed.
+ *
+ * @arg arg: Sets the type of context
+ *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fence.i will
+ *			      emitted on thread/process migration.
+ * @arg per_thread: When set to 0, will use the default behavior of setting the
+ *  icache flush context per process. When set to 1, will use a per thread
+ *  context.
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
index 217fd4de6134..a394b146e78a 100644
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
+	    mm->context.force_icache_flush) {
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
