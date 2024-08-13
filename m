Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E367C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 00:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzc3Imo3stgoJATNmkjIVfmhbq+xOKfefVX3Uof/FMM=; b=OnZgY2F/PdQ1JO
	gEAGwXJ77JgTXBaZHFeKCJTquAG0dGOoa4QnIeiQAeTAOAPGaUzeszuxtXLVXri08/iqO0XVDzfCL
	/G62LfZU3DgMIjLlDDHi88zPpu9Ots2t2sSTFxWgjgMV7P/dBiCerX5zrzqeubqIfkJ/R4yO0oG67
	24pMng0OaAPOcLtdAorUSKNJiaPKN1+cWMhhC4HQ1QMm6yTc7yBoJG+65HJBw9CDApmxjZyrOj5nS
	RGVhtn1G3re/KtbtESslHDawDCVNEwoBvJKuzH9Q3Kz6DTr8roRn0eWHEvivtL1ma7Q/hNcYXngSx
	ehaxXxoSdBk+kl4zcKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se1ft-00000005G05-182H;
	Wed, 14 Aug 2024 00:15:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se0Xh-000000058e5-2uvZ
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 23:03:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fc6ee64512so45080415ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 16:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723590145; x=1724194945; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AViw6Mlpa/wmCybJUCU1zq+Oh5ilHhYoIARjXI3mUsI=;
        b=cHmJ9I9Yq6UsGOZG2WMBGvvgJVGpbS0LIXVg2Skx0t/YwSUCVfArgDk2E2MAEYe2fd
         6JZlix4zWVV6/s4pGdBq7wTq1AZ3OVHJX7mFQnt5b95XduosjZuFsZLs+AjU9cPyuB1Q
         J9KIdP0VWx4ayo6F1Hz+1uRuY01AHE4Dbxfkxh3q6PmFugV49a+ZnlG0FZwGUQ5QZbQN
         O/8Sj79bXvTYxDIuaDx9/Bc0Gg3xymR91oRwSrworieiGPl4WsO9GQzQZKkG4n0o+b/O
         XtB2sq00p/Hh+L6MlWyfAQpGRLHnd2VTPxljfigod6CAluhkTkyUs2W8mV8/6iEOkg5m
         w9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723590145; x=1724194945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AViw6Mlpa/wmCybJUCU1zq+Oh5ilHhYoIARjXI3mUsI=;
        b=kMT3xsQMwIS4ZALkCQPpAncPM0yRNMZauXxUF2TaAc1RXuQvcF9FdFzXKR8hx3kia0
         OgqBvaiVfgkcgxWdXxaA3w16xVM75frOzm/6o1HuH0RsuLBlbohm2QRXqyXJC6urXIgb
         XTPknvvSXkN/8Ls5DwPQg6Fz0B72uQ+vCVURkwu+e4GD4rjUjLCAdczFrzg8LYNqtv6B
         FEkTCVF0H3URMmaI+J3nBfzesnkd3xP0K5aYfPtqqfG1hORYCqpru6fw6i+lVug/id2+
         DPI7930KvsWeZbLcarYcWj/U3DdJLqvDtd//lLPA3lsmqLysooowulYiIkKzTOtdzL/e
         C75A==
X-Forwarded-Encrypted: i=1; AJvYcCWUZkJr02ATGm7klgQVZ4UqlpF45cqM1cj8EwISrSmLG/F//02Cwywks1/JPoxCGpFXck4bPpL8kui294BO4VFMB/grutmhYXk5UeUlQUew
X-Gm-Message-State: AOJu0YwG/0ilxi9O1ayY6xlJPSxrKz27REAE3QuyvDIoxFlDUC+LZZIl
	1pJYJaVsU882fx5E2AVyVSS2Ew0m+ITdz8nDMeNrv1ttXfG0pvtqbR0Qe0KTdVU=
X-Google-Smtp-Source: AGHT+IEwvc7Gpc9IsNOtbrNuKaRab7TpEdkKQp+aCEGHRy7CHsV633qr8p8XEBZIqfbNmrwv3LoIbQ==
X-Received: by 2002:a17:902:d50b:b0:1fc:692a:ba46 with SMTP id d9443c01a7336-201d65589c1mr11551675ad.65.1723590144862;
        Tue, 13 Aug 2024 16:02:24 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1e0659sm18522475ad.297.2024.08.13.16.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:02:24 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 13 Aug 2024 16:02:18 -0700
Subject: [PATCH 2/2] riscv: Eagerly flush in flush_icache_deferred()
MIME-Version: 1.0
Message-Id: <20240813-fix_fencei_optimization-v1-2-2aadc2cdde95@rivosinc.com>
References: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
In-Reply-To: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4833; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=iv4UBEdbbtayWIGJ+KvTcVQaR/bcv8PC3YtHCe72xsM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9rup791Agy4TQM7zv87HMWkcubQjQDXtw9ml7m/Mvp2R
 GQy+57IjlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACaiMo3hr6hzvvqen3NWppxa
 WSPcr+91yjXDZ8v2u+vfHvIQ8Cu+f5fhf1zKnamvbJ+mys7o0HO+nMAmlxNqNTF4vfGU/3vslDU
 j2AE=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_160305_743307_ED4E1B48 
X-CRM114-Status: GOOD (  18.53  )
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

It is possible for mm->context.icache_stale_mask to be set between
switch_mm() and switch_to() when there are two threads on different CPUs
executing in the same mm:

<---- Thread 1 starts running here on CPU1

<---- Thread 2 starts running here with same mm

T2: prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_ON, PR_RISCV_SCOPE_PER_PROCESS);
T2: <-- kernel sets current->mm->context.force_icache_flush to true
T2: <modification of instructions>
T2: fence.i

T1: fence.i (to synchronize with other thread, has some logic to
             determine when to do this)
T1: <-- thread 1 is preempted
T1: <-- thread 1 is placed onto CPU3 and starts context switch sequence
T1 (kernel): flush_icache_deferred() -> skips flush because switch_to_should_flush_icache() returns true
				     -> thread has migrated and task->mm->context.force_icache_flush is true

T2: prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_OFF, PR_RISCV_SCOPE_PER_PROCESS);
T2 (kernel): kernel sets current->mm->context.force_icache_flush = false

T1 (kernel): switch_to() calls switch_to_should_flush_icache() which now
	     returns false because task->mm->context.force_icache_flush
	     is false due to the other thread emitting
	     PR_RISCV_CTX_SW_FENCEI_OFF.
T1 (back in userspace): Instruction cache was never flushed on context
			switch to CPU3, and thus may execute incorrect
			instructions.

This commit fixes this issue by also flushing in switch_to() when
task->mm->context.icache_stale_mask is set, and always flushing in
flush_icache_deferred().

It is possible for switch_mm() to be called without being followed by
switch_to() such as with the riscv efi driver in efi_virtmap_load(), so
we cannot do all of the flushing in switch_to().

To avoid flushing multiple times in a single context switch, clear
mm->context.icache_stale_mask in switch_mm() and only flush in
switch_to() if it was set again in the meantime. Set icache_stale_mask
when handling prctl and in switch_to() if
task->mm->context.force_icache_flush is set to prepare for next context
switch.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 6b9391b581fd ("riscv: Include riscv_set_icache_flush_ctx prctl")
---
 arch/riscv/include/asm/switch_to.h | 19 ++++++++++++++++---
 arch/riscv/mm/cacheflush.c         |  1 +
 arch/riscv/mm/context.c            |  6 +-----
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7594df37cc9f..5701cfcf2b68 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -76,11 +76,24 @@ extern struct task_struct *__switch_to(struct task_struct *,
 static inline bool switch_to_should_flush_icache(struct task_struct *task)
 {
 #ifdef CONFIG_SMP
-	bool stale_mm = task->mm && task->mm->context.force_icache_flush;
-	bool stale_thread = task->thread.force_icache_flush;
+	bool stale_mm = false;
 	bool thread_migrated = smp_processor_id() != task->thread.prev_cpu;
+	bool stale_thread = thread_migrated && task->thread.force_icache_flush;
+
+	if (task->mm) {
+		/*
+		 * The mm is only stale if the respective CPU bit in
+		 * icache_stale_mask is set. force_icache_flush indicates that
+		 * icache_stale_mask should be set again before returning to userspace.
+		 */
+		stale_mm = cpumask_test_cpu(smp_processor_id(),
+					    &task->mm->context.icache_stale_mask);
+		cpumask_assign_cpu(smp_processor_id(),
+				   &task->mm->context.icache_stale_mask,
+				   task->mm->context.force_icache_flush);
+	}
 
-	return thread_migrated && (stale_mm || stale_thread);
+	return stale_mm || stale_thread;
 #else
 	return false;
 #endif
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index b81672729887..c4a9ac2ad7ab 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -230,6 +230,7 @@ int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
 		switch (scope) {
 		case PR_RISCV_SCOPE_PER_PROCESS:
 			current->mm->context.force_icache_flush = true;
+			cpumask_setall(&current->mm->context.icache_stale_mask);
 			break;
 		case PR_RISCV_SCOPE_PER_THREAD:
 			current->thread.force_icache_flush = true;
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 4abe3de23225..9e82e2a99441 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -306,11 +306,7 @@ static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
 		 */
 		smp_mb();
 
-		/*
-		 * If cache will be flushed in switch_to, no need to flush here.
-		 */
-		if (!(task && switch_to_should_flush_icache(task)))
-			local_flush_icache_all();
+		local_flush_icache_all();
 	}
 #endif
 }

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
