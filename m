Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08178C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVLhTWG4VeiCzl1uh3XYZXmDmmwUfko3kluPFHYxoX4=; b=37kpp9TS6JVJva
	/mRjoFqzrrIBmWm6gayREwjtjLNyNApyNanc7++6SpI/sgmQV5rRLd+5NERjo0Nq1d2MdpwtrOb2x
	1lLN6XTCD20eLT6odnb9t+dJr+YgUPv6uayLU5fEyrtU1Cq4QESURarOrSomV/5JY8htcxaZ1cou+
	gUDPvts8rzpeYrA0WZccDaCwzS09YsfM04T6Yw/zHNHkvu0TgS/wIZgmVp1cLDF6BC7HlPdq9kR/Z
	Ce3UjFRTTq/dLi3HyY78oFeLBwNMsUpm0QuNBWzydLr0Et7MOhvjOZb8DrHq4wy6powNd2tbKDBJ/
	Qeq/3aHtBVS4V5kkcAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBus-000000040AL-1cPm;
	Wed, 31 Jan 2024 14:50:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBum-0000000405U-2Zf6
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:50:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3394b892691so569133f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 06:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706712610; x=1707317410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVYIfgnNZXAnAGrFV+qVvJtPQ32MBOSOxj+SNVTy3v0=;
        b=dnR5hAptOxkB7f+PWnnYidHgVVTRtKNDsVzase4VT86Y+fG/WjfkqMQ6KFDyh9UvAH
         N7PlmeAp2rQbQNdPd9m/j9jj+UXFTu5VI7HniAWeG5ScC1nQSUTIVAcRyZK1VOhKuLp4
         +M0rOiyhyuRqJVP1Hr7vfQErzGhFpddNWkG99EBtRf9VSxUGlUS6ZTVQ5596WcSWi1xb
         AEKMi/BqJghEBwfqmr+8s8bHXhU/MfH5FNntZdR+zeV0HI+Z9COX20wFvDD8ooxNncRK
         8CLazuvcBzMytjVHStu2KLA+GYrPWb8SVMtDjLzL06NgtC6730KHcJdTRwMhY5Th0QOp
         OBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706712610; x=1707317410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVYIfgnNZXAnAGrFV+qVvJtPQ32MBOSOxj+SNVTy3v0=;
        b=StS03//QiAHiKombCEBUDn6kGZCwRTsa/fM60Qw9mkqdYNHvED2PUDiWg9OooeVRwn
         oHqXmWTAlXX1+KEvD1NHGnBKc2z+ibGxUqUkfa2eQBO0BYOsmRecSPWmO1AGeMTEmjr+
         wVt1D9fGJ2eVw0WazrRf4mdIpqulg5zB2X43xxGJx5FwkTPWqntGJLjGLcoIML4fiwlj
         8zXT7K7/EdoUH70VigehsGHzO/3z+iKuD0/wMt5OOz6wJ/kBRbqOLKrzRMSSpm7iqbZs
         zGyYsp4zzooTdR0HnNgXzlmyqVE58KUDcgGLxyoL3GqdJS6nGBCeRGvjxqAVuBfVgDwy
         1qdw==
X-Gm-Message-State: AOJu0YxUpt2KUY9SI50scwwFio7ck8QYP5AkQZPTPzfw8TjS66APVySJ
	ZGJHTr4QywyVH3qxyIhptrJ9kDEjj0UjgtzwKZHf+jQpWpp8/Sidyz7yRhFgx0X2LA==
X-Google-Smtp-Source: AGHT+IGtN/fFFgD5kWlZM7o9A5tbWzODTz9z9HcCpoaArlTRJ10128W2icRy33OzgUwIaucVecHQQQ==
X-Received: by 2002:a5d:68cd:0:b0:33a:fe3b:a048 with SMTP id p13-20020a5d68cd000000b0033afe3ba048mr1822841wrw.34.1706712609631;
        Wed, 31 Jan 2024 06:50:09 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4046000000b0033b0d049c71sm419265wrp.54.2024.01.31.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 06:50:09 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	corbet@lwn.net
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	rdunlap@infradead.org,
	sorear@fastmail.com,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v4 1/4] membarrier: riscv: Add full memory barrier in switch_mm()
Date: Wed, 31 Jan 2024 15:49:33 +0100
Message-Id: <20240131144936.29190-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131144936.29190-1-parri.andrea@gmail.com>
References: <20240131144936.29190-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_065012_735764_A9321F93 
X-CRM114-Status: GOOD (  23.35  )
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

The membarrier system call requires a full memory barrier after storing
to rq->curr, before going back to user-space.  The barrier is only
needed when switching between processes: the barrier is implied by
mmdrop() when switching from kernel to userspace, and it's not needed
when switching from userspace to kernel.

Rely on the feature/mechanism ARCH_HAS_MEMBARRIER_CALLBACKS and on the
primitive membarrier_arch_switch_mm(), already adopted by the PowerPC
architecture, to insert the required barrier.

Fixes: fab957c11efe2f ("RISC-V: Atomic and Locking Code")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 MAINTAINERS                         |  2 +-
 arch/riscv/Kconfig                  |  1 +
 arch/riscv/include/asm/membarrier.h | 31 +++++++++++++++++++++++++++++
 arch/riscv/mm/context.c             |  2 ++
 kernel/sched/core.c                 |  5 +++--
 5 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/include/asm/membarrier.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8999497011a26..d7ed83b73cbe4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14040,7 +14040,7 @@ M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	arch/powerpc/include/asm/membarrier.h
+F:	arch/*/include/asm/membarrier.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a0682..087abf9e51c69 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -27,6 +27,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
diff --git a/arch/riscv/include/asm/membarrier.h b/arch/riscv/include/asm/membarrier.h
new file mode 100644
index 0000000000000..6c016ebb5020a
--- /dev/null
+++ b/arch/riscv/include/asm/membarrier.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_MEMBARRIER_H
+#define _ASM_RISCV_MEMBARRIER_H
+
+static inline void membarrier_arch_switch_mm(struct mm_struct *prev,
+					     struct mm_struct *next,
+					     struct task_struct *tsk)
+{
+	/*
+	 * Only need the full barrier when switching between processes.
+	 * Barrier when switching from kernel to userspace is not
+	 * required here, given that it is implied by mmdrop(). Barrier
+	 * when switching from userspace to kernel is not needed after
+	 * store to rq->curr.
+	 */
+	if (IS_ENABLED(CONFIG_SMP) &&
+	    likely(!(atomic_read(&next->membarrier_state) &
+		     (MEMBARRIER_STATE_PRIVATE_EXPEDITED |
+		      MEMBARRIER_STATE_GLOBAL_EXPEDITED)) || !prev))
+		return;
+
+	/*
+	 * The membarrier system call requires a full memory barrier
+	 * after storing to rq->curr, before going back to user-space.
+	 * Matches a full barrier in the proximity of the membarrier
+	 * system call entry.
+	 */
+	smp_mb();
+}
+
+#endif /* _ASM_RISCV_MEMBARRIER_H */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de61342..ba8eb3944687c 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -323,6 +323,8 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	if (unlikely(prev == next))
 		return;
 
+	membarrier_arch_switch_mm(prev, next, task);
+
 	/*
 	 * Mark the current MM context as inactive, and the next as
 	 * active.  This is at least used by the icache flushing
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9116bcc903467..c4ca8085885a3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6709,8 +6709,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 		 *
 		 * Here are the schemes providing that barrier on the
 		 * various architectures:
-		 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC.
-		 *   switch_mm() rely on membarrier_arch_switch_mm() on PowerPC.
+		 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
+		 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
+		 *   on PowerPC and on RISC-V.
 		 * - finish_lock_switch() for weakly-ordered
 		 *   architectures where spin_unlock is a full barrier,
 		 * - switch_to() for arm64 (weakly-ordered, spin_unlock
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
