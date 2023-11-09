Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15605C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 19:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdKtjgY0AKcxQotHdfIkegPg4MhoFpA+wNWMBpZov0U=; b=1D9odDvVIg8f+5
	I5ym6q6/qCSDUVgZAPCNNJ52ud+C5xY+cPZADxF6oD5IKDZ4v5qcI7xu6SL7hiVzt1NgW4QRwyXPG
	gt3CHqFrjduGryUkxdecE8t2mr2dqLm+kwzuBZiNE8gAYljLy1wOPJFVbfa4jgHm8PNhfM85uBj33
	2dvAXvm5onQdV1rnnZFbVQXY88N4IFL5nFkwND4OCxhw4rk/WNZtQshBT+e2GFDdcJs3zjyyX8FAy
	wPMsye7Oz0FkYI4QXd9HElq/kP7FA71MJaiMUsDbs+yObRnEdzTmLkPLUmgAEEmWDwf7AGDgCia9k
	rn31ICPEdUWR//nB0LQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Agl-0076Ui-0W;
	Thu, 09 Nov 2023 19:27:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Agh-0076TY-2H
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 19:27:37 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso2138383a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 11:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699558049; x=1700162849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IOhx7BF4P3FsiCSpDgVSb0NgNkHYU/PNnVgFVbJLldU=;
        b=CX9+2dAXwUOm4BJk4dFaR7Dk5DxBYnJq8BKeoDTKFmwDxKUJUXqJ5OZzCQ9EcF1Bbz
         aDhziwv2S6qnrpheuthretS37JPykgVoNCtWvXGMryh3ovV4cjEJ2Ue17LljubHEQwZt
         aIjbU7bw1u32r0yR/CHdcX+qnib8BYOosoPBSiGH9ixR8kvIEh65ON49dN6SsS2ADgXZ
         eA8PTQHqml03ADN7KKn8sZRnB5kVqF8CSKRfp2NTByWcu0ndHwNgPoqbfdWcGzYtTLsv
         F0lIMv0ERe9hn0GEqS7yIYyU9ncvkwY8w5a5By+nbnQcz9y1EdMFNDTGmSKO3u0nTxut
         AgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558049; x=1700162849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOhx7BF4P3FsiCSpDgVSb0NgNkHYU/PNnVgFVbJLldU=;
        b=Oa+ysJTNMOuY+fUxWcMr/aksYE7KRiRJKHpU+ARP7lrHs8JKO4zVvDppOpxTdVif8X
         XumlclfkN7JguBlj6VSvWbNx30BfANPeI7pqbY3bBVrUftVCg0McIJr70Vz9HgntqP7K
         Qkz3DZhOSP8JDDRZgUXT+mO4XjsDx0KejD55GvRI9wRkAJfhbB6tFm5DnZ6MAGY8fNCb
         aHQDG67XZubcSDa34jTA1KvewRE/06qaH1shKaplCZYTfDonWsDR0uT8OCsyiraSvytQ
         Pupi3pIfYgJdvtp95/4/J56rhka5RLBsBRVEzKAwAYCqRPP4bFrjWjf9UoPC/5eJp35e
         s42A==
X-Gm-Message-State: AOJu0YzT+jJHUUV+YVuLMLuudg/HxbC3n71+U9Jxtxbsg+iNJ6esFvPO
	SSLkIsc7UZX53i3gj8RzaP0=
X-Google-Smtp-Source: AGHT+IEY2B2Qz526qEf8xIfrcKl+6KLp0VLZ2cb/cJxQpqFnTc++b6V/dyJiKXZdH4QoXVzzStBQwg==
X-Received: by 2002:a50:9508:0:b0:543:e42e:128e with SMTP id u8-20020a509508000000b00543e42e128emr5247658eda.37.1699558048609;
        Thu, 09 Nov 2023 11:27:28 -0800 (PST)
Received: from andrea (dsl2E6BD318.fixip.t-online.hu. [46.107.211.24])
        by smtp.gmail.com with ESMTPSA id u17-20020a509511000000b005454b6d4e22sm176598eda.64.2023.11.09.11.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 11:27:28 -0800 (PST)
Date: Thu, 9 Nov 2023 20:24:58 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, charlie@rivosinc.com,
	rehn@rivosinc.com, paulmck@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	mmaas@google.com, hboehm@google.com, striker@us.ibm.com
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Message-ID: <ZU0sliwUQJyNAH1y@andrea>
References: <mhng-b720eb90-633f-498b-a487-0cfdc9f00ddd@palmer-ri-x1c9>
 <65e98129-0617-49ca-9802-8e3a46d58d29@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65e98129-0617-49ca-9802-8e3a46d58d29@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_112735_748259_29A7BD2D 
X-CRM114-Status: GOOD (  35.93  )
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

Mathieu, all,

Sorry for the delay,

> AFAIR this patch implements sync_core_before_usermode which gets used by
> membarrier_mm_sync_core_before_usermode() to handle the uthread->kthread->uthread
> case. It relies on switch_mm issuing a core serializing instruction as well.
> 
> Looking at RISC-V switch_mm(), I see that switch_mm() calls:
> 
>   flush_icache_deferred(next, cpu);
> 
> which only issues a fence.i if a deferred icache flush was required. We're
> missing the part that sets the icache_stale_mask cpumask bits when a
> MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE is invoked.

[...]

> The only part where I think you may want to keep some level of deferred
> icache flushing as you do now is as follows:
> 
> - when membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE is invoked,
>   call a new architecture hook which sets cpumask bits in the mm context
>   that tells the next switch_mm on each cpu to issue fence.i for that mm.
> - keep something like flush_icache_deferred as you have now.
> 
> Otherwise, I fear the overhead of a very expensive fence.i would be too
> much when processes registering with MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE
> and start doing fence.i on each and every switch_mm().
> 
> So you'd basically rely on membarrier to only issue IPIs to the CPUs which are
> currently running threads belonging to the mm, and handle the switch_mm with
> the sync_core_before_usermode() for uthread->kthread->uthread case, and implement
> a deferred icache flush for the typical switch_mm() case.

I've (tried to) put this together and obtained the two patches reported below.
Please let me know if this aligns with your intentions and/or there's interest
in a proper submission.

  Andrea


From e7d07a6c04b2565fceedcd71c2175e7df7e11d96 Mon Sep 17 00:00:00 2001
From: Andrea Parri <parri.andrea@gmail.com>
Date: Thu, 9 Nov 2023 11:03:00 +0100
Subject: [PATCH 1/2] locking: Introduce prepare_sync_core_cmd()

Introduce an architecture function that architectures can use to set
up ("prepare") SYNC_CORE commands.

The function will be used by RISC-V to update its "deferred icache-
flush" data structures (icache_stale_mask).

Architectures defining prepare_sync_core_cmd() static inline need to
select ARCH_HAS_PREPARE_SYNC_CORE_CMD.

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 include/linux/sync_core.h | 16 +++++++++++++++-
 init/Kconfig              |  3 +++
 kernel/sched/membarrier.c |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/sync_core.h b/include/linux/sync_core.h
index 013da4b8b3272..67bb9794b8758 100644
--- a/include/linux/sync_core.h
+++ b/include/linux/sync_core.h
@@ -17,5 +17,19 @@ static inline void sync_core_before_usermode(void)
 }
 #endif
 
-#endif /* _LINUX_SYNC_CORE_H */
+#ifdef CONFIG_ARCH_HAS_PREPARE_SYNC_CORE_CMD
+#include <asm/sync_core.h>
+#else
+/*
+ * This is a dummy prepare_sync_core_cmd() implementation that can be used on
+ * all architectures which provide unconditional core serializing instructions
+ * in switch_mm().
+ * If your architecture doesn't provide such core serializing instructions in
+ * switch_mm(), you may need to write your own functions.
+ */
+static inline void prepare_sync_core_cmd(struct mm_struct *mm)
+{
+}
+#endif
 
+#endif /* _LINUX_SYNC_CORE_H */
diff --git a/init/Kconfig b/init/Kconfig
index 6d35728b94b2b..61f5f982ca451 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1972,6 +1972,9 @@ source "kernel/Kconfig.locks"
 config ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	bool
 
+config ARCH_HAS_PREPARE_SYNC_CORE_CMD
+	bool
+
 config ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	bool
 
diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 2ad881d07752c..58f801e013988 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -320,6 +320,7 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 		      MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY))
 			return -EPERM;
 		ipi_func = ipi_sync_core;
+		prepare_sync_core_cmd(mm);
 	} else if (flags == MEMBARRIER_FLAG_RSEQ) {
 		if (!IS_ENABLED(CONFIG_RSEQ))
 			return -EINVAL;
-- 
2.34.1


From 617896a1d58a5f8b0e5895dbc928a54e0461d959 Mon Sep 17 00:00:00 2001
From: Andrea Parri <parri.andrea@gmail.com>
Date: Tue, 7 Nov 2023 21:08:06 +0100
Subject: [PATCH 2/2] membarrier: riscv: Provide core serializing command

RISC-V uses xRET instructions on return from interrupt and to go back
to user-space; the xRET instruction is not core serializing.

Use FENCE.I for providing core serialization as follows:

 - by calling sync_core_before_usermode() on return from interrupt (cf.
   ipi_sync_core()),

 - via switch_mm() and sync_core_before_usermode() (respectively, for
   uthread->uthread and kthread->uthread transitions) to go back to
   user-space.

On RISC-V, the serialization in switch_mm() is activated by resetting
the icache_stale_mask of the mm at prepare_sync_core_cmd().

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 .../membarrier-sync-core/arch-support.txt     |  2 +-
 arch/riscv/Kconfig                            |  3 +++
 arch/riscv/include/asm/sync_core.h            | 23 +++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/sync_core.h

diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
index 23260ca449468..a17117d76e6d8 100644
--- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
+++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
@@ -44,7 +44,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9c48fecc67191..b70a0b9ea3ee7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -27,14 +27,17 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
+	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SET_DIRECT_MAP if MMU
 	select ARCH_HAS_SET_MEMORY if MMU
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
+	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/riscv/include/asm/sync_core.h b/arch/riscv/include/asm/sync_core.h
new file mode 100644
index 0000000000000..8be5e07d641ab
--- /dev/null
+++ b/arch/riscv/include/asm/sync_core.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_SYNC_CORE_H
+#define _ASM_RISCV_SYNC_CORE_H
+
+/*
+ * RISC-V implements return to user-space through an xRET instruction,
+ * which is not core serializing.
+ */
+static inline void sync_core_before_usermode(void)
+{
+	asm volatile ("fence.i" ::: "memory");
+}
+
+/*
+ * Ensure the next switch_mm() on every CPU issues a core serializing
+ * instruction for the given @mm.
+ */
+static inline void prepare_sync_core_cmd(struct mm_struct *mm)
+{
+	cpumask_setall(&mm->context.icache_stale_mask);
+}
+
+#endif /* _ASM_RISCV_SYNC_CORE_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
