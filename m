Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59420CCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 13:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hSy89PY0ku3GrNUFpCg8Wyf2r+rO8zAjpgk7TZtBLCU=; b=0n8sNaGAd3URNk
	tFVsDpACGtckNr1/4wUtk02xgPBcDdGAYTLVYb+0Jw+EERUYjHG36bNsAZJ+vG56kIYsjJUMjEg5G
	2bhwjJiCEhG4fvaUNPOhWvlCcRceqMxpV0xXCOeNOqwjwKw4q+tT18fgWKGKI+N8xQPTGMRzHp76w
	RkHhmciwC5NljE4vmeoyi80ypOndBwxSN3/k9BtS3YuQUxb1/33ark+Mv4Yn7LeS8GnBBGAkAgokx
	SyJ3txPNSsze3UUxEfLh3/c0Ym1w0zKBVrB1GGQzPEx4TKTup2ughONE6Y0ICQ7lhtmDXtlIrmuJg
	poEl6CqTNQx7HJ5wtV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qxi-00000006G7n-3XMQ;
	Thu, 09 Oct 2025 13:45:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qxh-00000006G7D-467e
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Oct 2025 13:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/Avy7qeTTmfq4DZivkTM47xk9+61lo2fuJS8O1YcKX0=; b=jG34dxQm9P5/BZzNTmMSoxmghc
	YFFt9sFTyGasyj8WwdzZSbBiREN7NYSJ3PHnsaZbBNueC/HgTu8ELIwn/blnlV8fkpJzLCh41ECV0
	mjEC+zt+oZlfdHwcBGoFJDHPRWPw57VRfUMhXcGsONwBtJd3gPKFAxtWFnMywj5wV5PMC9Rpf7YR3
	YU17jkEtWR6Ns/5uX2tBr7dWLv6xFegrrxGM+l5Yc+DEJYeGiZmp5xnR1tZHcHEqcZvn1SNC1DDyw
	BSMYqn20KpjF61pY8P0OtJuLp535PaZDwqAbnIta2OQWR5zfgmn+j8AP+Wo9rZuqTkxtVGyRP2kSs
	m19XNiNQ==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qxe-00000001TmL-1g0j
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 13:45:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-26e68904f0eso9853655ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760017535; x=1760622335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Avy7qeTTmfq4DZivkTM47xk9+61lo2fuJS8O1YcKX0=;
        b=gSnJKw/Du0dDQwKY3F49jTiHQHVfk+lU0z7fz++ADZpww9uzF5MpEtw3bD+qjsHPAD
         NlJXg/fHjhDdLN4cFsjd1+Ye4560HMJ7J2yh7tMvwE8QRYZeMk7wo7l3wLnAt8kcABIH
         w9BnSfiuo0DFm2Oy4xfHH3JUMxWgsF1ZtphoV8H7KDl2YhBX4YbGrGUOEp5tAxa+6aXS
         YVRa+xSmqgF+07bsyldGEkwwNoXYWNzYTWB84/hN9SlO74SOsKc90n9zAQbrUVioVvcG
         49UwLbS19Kb04rrxRIlfpPGLDGaUgq+LYewGonE7hMEMSUth6/3Um+ZJwly1KOPCtziP
         l0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760017535; x=1760622335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Avy7qeTTmfq4DZivkTM47xk9+61lo2fuJS8O1YcKX0=;
        b=XTjd8uLQM3hPpDnRVtcmA8A908r7q/GOnHoAhZPhZ5wd1PB6u6azWzp/87kox/QtEm
         R0tYNcwzXRwOUx7t+9OVLEmEij6SLGglnTHvI5ouxgautyuI9MF6oH43U2CdtQ3mv47o
         yEv8/hylHzgnzN5cPqszf9KNEfbXKdD/3/As617EY6YJtHMmmgn7EfqC3eaemXr5BK9H
         IVXI7tmw6ITIJgKj9O1iDJDvPrR/Jfgt6eESk7yUgpROTtAAZc+lgYw8MyDXkQnYH5Ht
         f3Ti9p8nq/V0437JK8QCATLi0wiQmYRH9P/XlT6P9Cv3GNUFywTHOJwPSDDblPzoia9Y
         gHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXirnbHuFZTK+Udc8IVJUUyE++3qseIivfH2IEN9qBjT0u5v81MT+QrsaLZaMOwfpygZ4a6yV41Zg/+0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4GwcMpxUBWPKArDQOUFh4dXk24qT0Y0td4gk4Cc4Qp5HAAaAx
	WTxMfP6ZMywbtAlT3TvpcepYsY6MBquFA84FynBEAA9hKtfqF0ntBTdxqUoTTaEoAu4=
X-Gm-Gg: ASbGncv6MVN1JxqWIdh+SQTy/7duSg9F/0tAzJM2q6k6qyOwPh/RTroy0bzDR1fkiuF
	SI1WaItIhlGHSJm0m+J7IfMKmppTto24laZHUXdZ6Av32w4CHjmk985DgwIltrJUU6NTI11+hfr
	9R0zzbTlYc/bNZrfO8wasq7FGnMNW0NkHSCF8Px+naxvU0dREVBJPfvwcYhRIzSRj1gKyhLo0Bx
	6YWfS43FSp5+vDfnLISNr9mVG1uaPQAO2WTxYrC+gMEzTZiFQF7IubzN3wtiHalGoD3lfmzSYjJ
	52EnHMjTUNvTVJJGO/wO7Q7nU7r47MI4Ur+WIkAIYABhWfHE2Di1mmdTF+05AyqyAonaoazNH4e
	9Yyp8i9N9ak51hLKXSUJrePx7Q+9aD4nJNn4FHq2rdLLIV+zlHWNbSK6Pmwed7/d8Cy+XIuLvaW
	fKHMrSdQq1V8oFNMzcfADVMg==
X-Google-Smtp-Source: AGHT+IFuQphml+3tSf/kNUKzOSrQUbkNN4IQAlQeDGBfiV9Ri5g+RslgrcOdjzz4EiXYtcwTC8PEKw==
X-Received: by 2002:a17:903:244b:b0:272:c95c:866 with SMTP id d9443c01a7336-2902723c20cmr98032745ad.20.1760017535202;
        Thu, 09 Oct 2025 06:45:35 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f95ecbsm28718335ad.130.2025.10.09.06.45.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Oct 2025 06:45:34 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	ardb@kernel.org,
	willy@infradead.org,
	guoren@kernel.org,
	ziy@nvidia.com,
	akpm@linux-foundation.org,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	ajones@ventanamicro.com,
	parri.andrea@gmail.com,
	cleger@rivosinc.com,
	yongxuan.wang@sifive.com,
	inochiama@gmail.com,
	samuel.holland@sifive.com,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	yikming2222@gmail.com,
	andybnac@gmail.com,
	yury.norov@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH RFC] riscv: add support for Ziccid
Date: Thu,  9 Oct 2025 21:45:14 +0800
Message-Id: <20251009134514.8549-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_144539_035744_8F4D36ED 
X-CRM114-Status: GOOD (  16.27  )
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

The Ziccid extension provides hardware synchronization between
Dcache and Icache. With this hardware support, there's no longer
a need to trigger remote hart execution of fence.i via IPI.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/cacheflush.h |  4 ++--
 arch/riscv/include/asm/hwcap.h      |  1 +
 arch/riscv/include/asm/switch_to.h  | 10 ++++++++++
 arch/riscv/kernel/cpufeature.c      |  1 +
 arch/riscv/kernel/ftrace.c          |  2 +-
 arch/riscv/kernel/hibernate.c       |  2 +-
 arch/riscv/kernel/jump_label.c      |  2 +-
 arch/riscv/mm/cacheflush.c          | 16 ++++++++++++++--
 8 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 0092513c3376c..3a8cdf30bb4b1 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -68,7 +68,7 @@ static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 
 #else /* CONFIG_SMP */
 
-void flush_icache_all(void);
+void flush_icache_all(bool force);
 void flush_icache_mm(struct mm_struct *mm, bool local);
 
 #endif /* CONFIG_SMP */
@@ -80,7 +80,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 #define flush_icache_range flush_icache_range
 static inline void flush_icache_range(unsigned long start, unsigned long end)
 {
-	flush_icache_all();
+	flush_icache_all(false);
 }
 
 extern unsigned int riscv_cbom_block_size;
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a3..ad97d8955b501 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,7 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZICCID		100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920c..b8a9e455efe9e 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -98,7 +98,17 @@ static inline bool switch_to_should_flush_icache(struct task_struct *task)
 	bool stale_thread = task->thread.force_icache_flush;
 	bool thread_migrated = smp_processor_id() != task->thread.prev_cpu;
 
+	asm goto(ALTERNATIVE("nop", "j %l[ziccid]", 0, RISCV_ISA_EXT_ZICCID, 1)
+		 : : : : ziccid);
+
 	return thread_migrated && (stale_mm || stale_thread);
+
+ziccid:
+	/*
+	 * Process switching writes to SATP, which flushes the pipeline,
+	 * so only the thread scenario is considered.
+	 */
+	return thread_migrated && stale_thread;
 #else
 	return false;
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67b59699357da..2da82aa2dbf0a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -540,6 +540,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
+	__RISCV_ISA_EXT_DATA(ziccid, RISCV_ISA_EXT_ZICCID),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 8d18d6727f0fc..431448e818363 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -43,7 +43,7 @@ void arch_ftrace_update_code(int command)
 {
 	command |= FTRACE_MAY_SLEEP;
 	ftrace_modify_all_code(command);
-	flush_icache_all();
+	flush_icache_all(false);
 }
 
 static int __ftrace_modify_call(unsigned long source, unsigned long target, bool validate)
diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 671b686c01587..388f10e187bae 100644
--- a/arch/riscv/kernel/hibernate.c
+++ b/arch/riscv/kernel/hibernate.c
@@ -153,7 +153,7 @@ int swsusp_arch_suspend(void)
 	} else {
 		suspend_restore_csrs(hibernate_cpu_context);
 		flush_tlb_all();
-		flush_icache_all();
+		flush_icache_all(true);
 
 		/*
 		 * Tell the hibernation core that we've just restored the memory.
diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index b4c1a6a3fbd28..680b29f4c09c4 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -51,5 +51,5 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
 
 void arch_jump_label_transform_apply(void)
 {
-	flush_icache_all();
+	flush_icache_all(false);
 }
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index d83a612464f6c..01f9f7a45e8d2 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -12,19 +12,24 @@
 #ifdef CONFIG_SMP
 
 #include <asm/sbi.h>
+#include <asm/alternative-macros.h>
 
 static void ipi_remote_fence_i(void *info)
 {
 	return local_flush_icache_all();
 }
 
-void flush_icache_all(void)
+void flush_icache_all(bool force)
 {
 	local_flush_icache_all();
 
 	if (num_online_cpus() < 2)
 		return;
 
+	if (!force)
+		asm goto(ALTERNATIVE("nop", "j %l[ziccid]", 0,
+			RISCV_ISA_EXT_ZICCID, 1)
+			: : : : ziccid);
 	/*
 	 * Make sure all previous writes to the D$ are ordered before making
 	 * the IPI. The RISC-V spec states that a hart must execute a data fence
@@ -41,6 +46,7 @@ void flush_icache_all(void)
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
+ziccid:;
 }
 EXPORT_SYMBOL(flush_icache_all);
 
@@ -61,13 +67,17 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 
 	preempt_disable();
 
+	local_flush_icache_all();
+
+	asm goto(ALTERNATIVE("nop", "j %l[ziccid]", 0, RISCV_ISA_EXT_ZICCID, 1)
+		 : : : : ziccid);
+
 	/* Mark every hart's icache as needing a flush for this MM. */
 	mask = &mm->context.icache_stale_mask;
 	cpumask_setall(mask);
 	/* Flush this hart's I$ now, and mark it as flushed. */
 	cpu = smp_processor_id();
 	cpumask_clear_cpu(cpu, mask);
-	local_flush_icache_all();
 
 	/*
 	 * Flush the I$ of other harts concurrently executing, and mark them as
@@ -91,6 +101,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
 	}
 
+ziccid:;
+
 	preempt_enable();
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
