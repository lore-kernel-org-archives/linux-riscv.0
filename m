Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3BCC10F05
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnTh+/ConZkXiuKnx61NLDB3B3WHtgWqaQ7Cf4SMFhc=; b=3Sn0NPgMijnalx
	R9uQFuBDNQS2vlHmcRpvY5qCAGoCq2EvRI5uMynN6biHumYhOQyRHnIrr/lfsjT+2JCTToPOZHMyl
	Err/bNWQ3tDnFpNFJeAlhEwQBv6xGJOg98dnTujytP8in2cW4T3qb4g+5Kdab0GxMRO8vpMxu7b64
	n4Eg+05gPN3mcGEtaQ8EdfoBhd5GSE6iSxAHS6P+5SppqB9uKFbBTkVFFq6I/+6l+Rta5QG3q8g3n
	r3S9xU7BM2iQmysiiyAdbk5RhfYDme17Gp/21zeuq5GkpWbvkZ3gIJx52JenZqB4Cr+khJxPH5Qto
	zQBnOD28horBu67xQe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xqN-00CsOk-2c;
	Fri, 01 Dec 2023 07:21:47 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xqJ-00CsNI-18
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 07:21:45 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6ce322b62aeso124028a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 23:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701415303; x=1702020103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01vsWcEoRsZ8jN9se+rvMnn0SZYxGQ5PaoOtj11FSJg=;
        b=O5xRH4NtHYkjnGkCfocWiFQX1wK5HH+ufYcbHOIiNzg6XwZyXPlDohvrTZwJroIsB3
         qnzTRO0heuoqJ2WRuDuRzpIfZtIhWAn31GXvsthhroO5Wp81EJKHWfvqLK+20iwLyGyJ
         xIWt1kgdeNmtZ6hv27ZR+43OHvTVoGMaGKBjilroTN2fUyAcSDPBojYfa/DcyPydyrXE
         cgmxFvO4xyGtCpdjDbXUlpohPo2CvzUhGqmOF7ha0OLg05udoGGaS4OJPaav3EjVo0Xp
         Zou9R1BsG2ae2nORTssTBmEAUcO5w28aD6Ovgvs5rWo4dbirqt/nmqjEz1+OGpJAObeD
         7h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415303; x=1702020103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01vsWcEoRsZ8jN9se+rvMnn0SZYxGQ5PaoOtj11FSJg=;
        b=kpRB7DZjN/LqgDgZuRZv7JCni1ZPOAF8V9OkvNo5C7V5xa+HMxbUACtKEp1QRHGq+E
         lvwjlYstWftMvnnJKSnDU9i8E87ZPKNA/dgT3n3DPlzk7rzfEN7Y3syJiwvwXwyQt04/
         VnSCcUVGvBtWIelp2DuXIZF7tg+uGa2wO/cgTSM0XPbasghlchH+RwWde8zm1hVnMWOe
         womCg/BK+ac7ipJj0rdTWfWAgkxYBdV7PO+AhWe/yqMLOWKxhplCvhS41wrR3ARbIPT/
         VmxyvFrRb9wGwPXa7nEBmQqxfHx6Q34lk5wMX6nbSNM5bX+XPdRNTmYpZww4UeUE7hx9
         ABGg==
X-Gm-Message-State: AOJu0YzcTKU1N1fgn6Ewebp+ojb6mDK9yVSzdiuOsKxqTu65AMuxeY0Y
	b1mldZADJLMkjVXAHi6rsDKvNg==
X-Google-Smtp-Source: AGHT+IGUs1cTF7roNXGwjwzuly5vlfIbdkJ4dyIqUSgULu3Qv7Z7T2nJDVo86ydDa+O1oGRb9p16+w==
X-Received: by 2002:a05:6870:9f08:b0:1fa:1738:85dd with SMTP id xl8-20020a0568709f0800b001fa173885ddmr25882226oab.57.1701415302677;
        Thu, 30 Nov 2023 23:21:42 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id v23-20020a0568301bd700b006d7f8da1b57sm412662ota.62.2023.11.30.23.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:21:42 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 30 Nov 2023 23:21:35 -0800
Subject: [PATCH v2 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
MIME-Version: 1.0
Message-Id: <20231130-fencei-v2-1-2cb623ab1b1f@rivosinc.com>
References: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
In-Reply-To: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701415300; l=6120;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=29lD1s3MiibMkD22p96wvCky0NuEdcDTMl8SkeAuDnk=;
 b=4T9JKi8+qGT7WUOONWkYSL4OzrVZoOIhdWH1IQ3P02CHNb0LQmt2gEDZonkOIYom89ag3dtkd
 y1gOCeN6FDyDbPCi2zVzdPSpLCzzxLnTfxNPZczdYRZ1r3/eEyQJBnV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_232143_682650_D1875B45 
X-CRM114-Status: GOOD (  20.76  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
