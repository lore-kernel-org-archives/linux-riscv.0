Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF51C10F09
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxhBHPfCbu8fce/uS8guZsWzkn1o96aHucIvPmtUkgw=; b=IzBpSVO2yqvBWe
	w0ZPi7fx0qAnnhXwtRiY89vQoY6yxaPK1dQthPcFsf5J+seaHqsTr+mdJq7UevoppL8yB1nfmqgTj
	YNqWjrXmrzU4GPfj2mWa97EmLzGQSuO1QpEs3zfC1D+leaBEB9Jx+Sz3U6cci1GS9ZpEC9NNOiVpZ
	AOaL+XiTG325HVy4aEXY+3TCXTa3/hW5JsreIxqsVmj4CofpVY6qUuGmm5i0rpBVxEIrzpSifrTSz
	yUTIcFzkTvcsN6qNl4+gyslkdr7/NX45SULUWubx5aQvDoIDz3w/RuV7xt+zxnhwOz2pKDrRQskj2
	CHt+xnHho2oddWd8ojMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcq4-004VHl-30;
	Mon, 11 Dec 2023 09:44:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcq0-004VGQ-1v
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 09:44:35 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-54bf9a54fe3so5938949a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 01:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702287870; x=1702892670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp+2/AFV5zmaxe9luf0MNfHGuX9N1n8phVhdPWTto6c=;
        b=HsLBthwN27viyu93b9+qXFfh4SWbMKhkCw2Vef7IQtcGA0FYnIXqNQ3XEaiF5hnyAV
         kMUmg4x2BKmS4abz1Il+8ujddoeR/Qv2vwgLVohJvvWoCagErGHjeVM4JjjyPlVGdYUW
         /E406ze8aGWXeJmFY8kXAYCi2Z92LIEQAfqucub7b9vyHySIEdvsxe+gdwIyN3z2Pnbb
         wCZ9fThBDD3LC42nqovYO4b27gQaZd6fq0dyjVytKnMwMTJgs4unOysDVneR+szuSooC
         JN56yPAL24/wy2QaI/EbacfbS9u6ui74YKTAmtOthZWllXCFm0oTEAlB+Obr6O01vj2k
         qDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287870; x=1702892670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp+2/AFV5zmaxe9luf0MNfHGuX9N1n8phVhdPWTto6c=;
        b=tc6SIi03cczr6WUaCSp/IisFbBQAVsyOtMh0u8Z6Ptkq2lEng5Q7f7cms8C62SJGmk
         Hxrmas3hbMoxVAd6lmQFxcnFhFBii4yGoPjkT94O/weCqeU0UXanbDlMeTCmxbYMXasR
         VT9BXNhjEaeQljwIijDY2+yPW9EcxdTPZkpVZfJd603bN8gAsAI1UZnp4uVSseUKPFlT
         vDNr65f1cp5kNKrDPv0QPPfEN6iFLtnnam8b3dI2W6eEU0icFuEKwCKgNM5FH3LiW1fP
         q4GqygX9ebkXM1Pm5h4y1wSCudQm/Bp4D0m8YquQWGXuvKHg3ubUNcvezynAlWZZnuQd
         f09A==
X-Gm-Message-State: AOJu0YwbM4vBAHgVjnVN9jF/mgrJklwE9BkAAvE8fqvgw2HSDsA8/b+5
	7CDGUgV+N2WU9yxrxRKNSPdIJZEb51IcJQmd
X-Google-Smtp-Source: AGHT+IEaDoQFpPnxjlxeSUTzsAQavayOPPXdg/d408f0Mv7GQd3onKpiAY7YqVStGjAikZKqi4sBkw==
X-Received: by 2002:a50:c908:0:b0:551:12f7:84e with SMTP id o8-20020a50c908000000b0055112f7084emr996214edh.28.1702287869354;
        Mon, 11 Dec 2023 01:44:29 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.124.152])
        by smtp.gmail.com with ESMTPSA id if3-20020a0564025d8300b0054afcab0af2sm3463505edb.59.2023.12.11.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:44:28 -0800 (PST)
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
Subject: [PATCH v2 1/4] membarrier: riscv: Add full memory barrier in switch_mm()
Date: Mon, 11 Dec 2023 10:44:11 +0100
Message-Id: <20231211094414.8078-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211094414.8078-1-parri.andrea@gmail.com>
References: <20231211094414.8078-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_014432_734781_8E283168 
X-CRM114-Status: GOOD (  22.97  )
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
---
 MAINTAINERS                         |  2 +-
 arch/riscv/Kconfig                  |  1 +
 arch/riscv/include/asm/membarrier.h | 29 +++++++++++++++++++++++++++++
 arch/riscv/mm/context.c             |  2 ++
 kernel/sched/core.c                 |  5 +++--
 5 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/include/asm/membarrier.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e2c6187a3ac80..a9166d82ffced 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13807,7 +13807,7 @@ M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	arch/powerpc/include/asm/membarrier.h
+F:	arch/*/include/asm/membarrier.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a6..f7db95097caf1 100644
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
index 0000000000000..4be218fa03b14
--- /dev/null
+++ b/arch/riscv/include/asm/membarrier.h
@@ -0,0 +1,29 @@
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
index a708d225c28e8..711dc753f7216 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6670,8 +6670,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
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
