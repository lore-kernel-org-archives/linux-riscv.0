Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0EFC07D5A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 10:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOoWRxPrHND4X5eOt7o3Wrp+ituJ4xm+IHc67tWBBKE=; b=TgLNauH2zAcUrh
	7g4+8YDYQAregcnTyPMaN9eY/3zAbL/69SOsT2PSCcO5MEFvMgR6sZNd8yOXPwsmDBuCp53yrHnFS
	4IIST13ygywvzwXuPno8Yid2xvpEeQeJzaNoRnXSkM5OOml3BOlJsHPuLFYFWxw4xxbSogkTDIStt
	AHVYz0g4sdMUSrFr+5hkf4scDwJqDPg60NTNhkN8qOls1PT3nlDZszyzp7CeBCThlM+AatZPkPk7q
	BQ+sWOJrpOqvYKSrPqAytgG1KXa/Ni8QNIA0zmI4D/jbdqC6yFVBoE+6uq+cXlb1ebfCh5Dd3gMRs
	iHZQXiZ9uy8Xk3xDJYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YvA-00263z-0t;
	Mon, 27 Nov 2023 10:32:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Yv5-00261H-37
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 10:32:53 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50baa7cdf6dso2208039e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 02:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701081170; x=1701685970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlWvEkOns6bxM9iRll9a5EQf2qEz96P+1R1KRbDkkn8=;
        b=KV9fvAEPwrXfpMzL9ycxUAyY+PpINTX6kcZXrfYaq+hEh3eledRYNvhv7bHikLra7l
         M8jc3roAyL1ejEFlLWwhvr2c7CEjb3vA/Afcz8wdL04plWRGZ6lsC8luONEMPGYs64qU
         uKUZgjqlgz9sQ0awPRU9LKLf19bUm/r2RGUKnb+yy1A8cEV4oD3/GU7dqBvM7w5ybE12
         3QUmaFVRC+epNZ7CFEeC+kvDcvKHaCxfDDckTCx6/n9dvBBWNEq2dQc5aeoBC2Ya3Eb2
         R2Lklk6NBdLnmlhGGngqd5ee4IYPdQH1Njpr5n93wUwhy4BET1McDTCBEre8NObkzCrQ
         1F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701081170; x=1701685970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlWvEkOns6bxM9iRll9a5EQf2qEz96P+1R1KRbDkkn8=;
        b=XCTZQf6DGQ09d7VKYs+PjItMMvfamHseF+v6lfl6ysuMB8eE0PaDqNRkJ5gRaIgVrA
         tKlF13QcmycC7gH2U3q4BqBcbXDrCPMFQLZI4oNZxS9CrCMZ3YRWE89rxjHf0vkVnzJ5
         iLlmQ3sZ8FSjssQhbYai4s4Lg00DE0RAOIxnFSWKCAdzY2+El0EaUseyVv61ouHdd+Kx
         qkI+0hGvrPcGfS9b4lv5jFkyOxBy3M4Gx3PEyo7O3CE8x80QGcIQuks9msY149x9gpsC
         2Mmq680WE316m34JtwsxYEJv/eHKKUasEgOUUlu404h43Q6uxcGCXhiq0S8oMVlPgggz
         k68g==
X-Gm-Message-State: AOJu0Yy5/SmMQyFflRlj2EjLqMIlc6fQvHK/T+UJnJbryO7S1H22s0bC
	9Z1F9YtY29DnTtWQj9H+Qto=
X-Google-Smtp-Source: AGHT+IEmtc6uvQGHjQLB9+xWuIWqr4VYfYT2cWLzoUOI6Ju7O3zk6InUUChkFS9o9nkpyFuwYTm+lw==
X-Received: by 2002:a05:6512:3903:b0:500:9f7b:e6a4 with SMTP id a3-20020a056512390300b005009f7be6a4mr5841895lfu.32.1701081169590;
        Mon, 27 Nov 2023 02:32:49 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.63.178])
        by smtp.gmail.com with ESMTPSA id p5-20020a056402044500b00540ea3a25e6sm5142057edw.72.2023.11.27.02.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:32:49 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Date: Mon, 27 Nov 2023 11:32:35 +0100
Message-Id: <20231127103235.28442-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127103235.28442-1-parri.andrea@gmail.com>
References: <20231127103235.28442-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_023252_004988_01BDDD73 
X-CRM114-Status: GOOD (  15.10  )
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
 arch/riscv/Kconfig                            |  3 ++
 arch/riscv/include/asm/sync_core.h            | 29 +++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/sync_core.h

diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
index d96b778b87ed8..f6f0bd871a578 100644
--- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
+++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
@@ -43,7 +43,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a6..3e2734a3f2957 100644
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
index 0000000000000..9153016da8f14
--- /dev/null
+++ b/arch/riscv/include/asm/sync_core.h
@@ -0,0 +1,29 @@
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
+#ifdef CONFIG_SMP
+/*
+ * Ensure the next switch_mm() on every CPU issues a core serializing
+ * instruction for the given @mm.
+ */
+static inline void prepare_sync_core_cmd(struct mm_struct *mm)
+{
+	cpumask_setall(&mm->context.icache_stale_mask);
+}
+#else
+static inline void prepare_sync_core_cmd(struct mm_struct *mm)
+{
+}
+#endif /* CONFIG_SMP */
+
+#endif /* _ASM_RISCV_SYNC_CORE_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
