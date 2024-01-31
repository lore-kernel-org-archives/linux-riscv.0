Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4C2C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPh/khhOKzbqmR5eEfZtJNkB1Vxke2aR7dIGGU1dXDk=; b=XbDDcem3gPOzya
	cLK79sIexCniL1rUktUCXryKnnsrUCiVOcKBnzw3iq/qGLl6l5V1Tj63iwZjrufFPAJEIRwiKu6a8
	sks2+nPqh9+qMewPCDiyvstj7VIAhwgWzePH+M2aOCeiY7/Y7QIS61tsH1NUKAv49bMIm1YmVJaGO
	x17zqadXcmqtLpLBa937XI4p2T+8xfsi6IUrl6tlggWzITgHdjTNphOfIrD+gRu7B/f3diSCGT3nP
	Ddfg2GAmKQS4iolM/98jKSUKwL75l/4gAvPIDTmy2RUKWyfkzdcSGorts55RKasNTL8csV4uiRi3Q
	Ee8vLqpjsnG06YEDJbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBut-000000040Be-3iQN;
	Wed, 31 Jan 2024 14:50:19 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBup-0000000406v-1G7M
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:50:16 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5102a877d50so5982577e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 06:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706712612; x=1707317412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IlmVFOYTS7aecT5TyzaoLng2Pb3mBf2n8I/n2NMhv8=;
        b=VxwgQ5ryS73hlpkodWlstIhkNcKDnHrP5JRt8kLMeXHr0nbTKHpjBrSsDTAy23Lg4U
         6oXoi0u9fXwq1nbkX2zGxct2pqFec+UmAlRcJTAFUWN+apoAKWCch1S5fTexKzJd+XLp
         hFfxmFJBlj+Y7ya1vUdG1A91axAPvjbkCZu7l8s9J/T7zrR8zN5y+A9AVpX5f/hLlB2E
         2fKb+jmuxNCtMt65Ew5z1iQQ052nnzQ3Wc7+TMsNsN+kmhCLn7A1JVajRueb5tJz8f3Y
         qmcVHWK7OK7hV4mjUNQIybYOlFP6l23pw83kKzPwvol2/KPwV+h/LipZM3298rESrdrq
         7Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706712612; x=1707317412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IlmVFOYTS7aecT5TyzaoLng2Pb3mBf2n8I/n2NMhv8=;
        b=sL7CKWczuwxuyyMCN/RWtwJ3+iiwtAxLimHQK2KXZRpZPdYO6i9lfR662DnjizYZGc
         iZeb/AQ+UFzCIvkrcjWuJBb1uRbYuGEYd0nkW8Y4bVWS7W7aZ0eZb3QnxAePJF8ZdBkL
         nl18JY5oIj/4Kx6tRyywFBYr8VPn2elRwgNSq/UIwXm0hfY8VX2yOxjSncbFq0jASKpF
         28BgXHmbSpyLc+u3FmsBh6qm+AxTWEvSnfESt6X9rsOr97UxFvlyYkB4fFYAVlB7XQNh
         pyA+xVJg1VKbr8+Bwt/ghHccQgahJqsdIgcHmw3DA9j7aA8Xif4EMJGJXUQMR38YTlsH
         eSAw==
X-Gm-Message-State: AOJu0YyaDsel7HPwHPURIrKZ1T+8FQXZoJ1HQMwRRmKkm6gXgs3DDvP8
	DuR8mfryPsOd+BShwIm77/KoLrtesC7NhSk+6jLq0xq1kCg+S4nT
X-Google-Smtp-Source: AGHT+IGrkog/qhZGfuQC5VscYem/7+Dnb/2LHjHr6AKiylercaEQE/FyzttVwRS81d3a/pjOtyBwJQ==
X-Received: by 2002:a05:6512:6ce:b0:510:f52:648c with SMTP id u14-20020a05651206ce00b005100f52648cmr1623894lff.51.1706712612052;
        Wed, 31 Jan 2024 06:50:12 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4046000000b0033b0d049c71sm419265wrp.54.2024.01.31.06.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 06:50:11 -0800 (PST)
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
Subject: [PATCH v4 2/4] membarrier: Create Documentation/scheduler/membarrier.rst
Date: Wed, 31 Jan 2024 15:49:34 +0100
Message-Id: <20240131144936.29190-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131144936.29190-1-parri.andrea@gmail.com>
References: <20240131144936.29190-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_065015_414378_D07EE550 
X-CRM114-Status: GOOD (  18.48  )
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

To gather the architecture requirements of the "private/global
expedited" membarrier commands.  The file will be expanded to
integrate further information about the membarrier syscall (as
needed/desired in the future).  While at it, amend some related
inline comments in the membarrier codebase.

Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 Documentation/scheduler/index.rst      |  1 +
 Documentation/scheduler/membarrier.rst | 39 ++++++++++++++++++++++++++
 MAINTAINERS                            |  1 +
 kernel/sched/core.c                    |  7 ++++-
 kernel/sched/membarrier.c              |  8 +++---
 5 files changed, 51 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/scheduler/membarrier.rst

diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 3170747226f6d..43bd8a145b7a9 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -7,6 +7,7 @@ Scheduler
 
 
     completion
+    membarrier
     sched-arch
     sched-bwc
     sched-deadline
diff --git a/Documentation/scheduler/membarrier.rst b/Documentation/scheduler/membarrier.rst
new file mode 100644
index 0000000000000..2387804b1c633
--- /dev/null
+++ b/Documentation/scheduler/membarrier.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+membarrier() System Call
+========================
+
+MEMBARRIER_CMD_{PRIVATE,GLOBAL}_EXPEDITED - Architecture requirements
+=====================================================================
+
+Memory barriers before updating rq->curr
+----------------------------------------
+
+The commands MEMBARRIER_CMD_PRIVATE_EXPEDITED and MEMBARRIER_CMD_GLOBAL_EXPEDITED
+require each architecture to have a full memory barrier after coming from
+user-space, before updating rq->curr.  This barrier is implied by the sequence
+rq_lock(); smp_mb__after_spinlock() in __schedule().  The barrier matches a full
+barrier in the proximity of the membarrier system call exit, cf.
+membarrier_{private,global}_expedited().
+
+Memory barriers after updating rq->curr
+---------------------------------------
+
+The commands MEMBARRIER_CMD_PRIVATE_EXPEDITED and MEMBARRIER_CMD_GLOBAL_EXPEDITED
+require each architecture to have a full memory barrier after updating rq->curr,
+before returning to user-space.  The schemes providing this barrier on the various
+architectures are as follows.
+
+ - alpha, arc, arm, hexagon, mips rely on the full barrier implied by
+   spin_unlock() in finish_lock_switch().
+
+ - arm64 relies on the full barrier implied by switch_to().
+
+ - powerpc, riscv, s390, sparc, x86 rely on the full barrier implied by
+   switch_mm(), if mm is not NULL; they rely on the full barrier implied
+   by mmdrop(), otherwise.  On powerpc and riscv, switch_mm() relies on
+   membarrier_arch_switch_mm().
+
+The barrier matches a full barrier in the proximity of the membarrier system call
+entry, cf. membarrier_{private,global}_expedited().
diff --git a/MAINTAINERS b/MAINTAINERS
index d7ed83b73cbe4..628f3762d97cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14040,6 +14040,7 @@ M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	Documentation/scheduler/membarrier.rst
 F:	arch/*/include/asm/membarrier.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c4ca8085885a3..a972628e77567 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6638,7 +6638,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 	 *     if (signal_pending_state())	    if (p->state & @state)
 	 *
 	 * Also, the membarrier system call requires a full memory barrier
-	 * after coming from user-space, before storing to rq->curr.
+	 * after coming from user-space, before storing to rq->curr; this
+	 * barrier matches a full barrier in the proximity of the membarrier
+	 * system call exit.
 	 */
 	rq_lock(rq, &rf);
 	smp_mb__after_spinlock();
@@ -6716,6 +6718,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 		 *   architectures where spin_unlock is a full barrier,
 		 * - switch_to() for arm64 (weakly-ordered, spin_unlock
 		 *   is a RELEASE barrier),
+		 *
+		 * The barrier matches a full barrier in the proximity of
+		 * the membarrier system call entry.
 		 */
 		++*switch_count;
 
diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 2ad881d07752c..f3d91628d6b8a 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -251,7 +251,7 @@ static int membarrier_global_expedited(void)
 		return 0;
 
 	/*
-	 * Matches memory barriers around rq->curr modification in
+	 * Matches memory barriers after rq->curr modification in
 	 * scheduler.
 	 */
 	smp_mb();	/* system call entry is not a mb. */
@@ -300,7 +300,7 @@ static int membarrier_global_expedited(void)
 
 	/*
 	 * Memory barrier on the caller thread _after_ we finished
-	 * waiting for the last IPI. Matches memory barriers around
+	 * waiting for the last IPI. Matches memory barriers before
 	 * rq->curr modification in scheduler.
 	 */
 	smp_mb();	/* exit from system call is not a mb */
@@ -339,7 +339,7 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 		return 0;
 
 	/*
-	 * Matches memory barriers around rq->curr modification in
+	 * Matches memory barriers after rq->curr modification in
 	 * scheduler.
 	 */
 	smp_mb();	/* system call entry is not a mb. */
@@ -415,7 +415,7 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 
 	/*
 	 * Memory barrier on the caller thread _after_ we finished
-	 * waiting for the last IPI. Matches memory barriers around
+	 * waiting for the last IPI. Matches memory barriers before
 	 * rq->curr modification in scheduler.
 	 */
 	smp_mb();	/* exit from system call is not a mb */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
