Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19050C4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mtWSAUW/k63Van4rQSv6M2TKHiEmqfrRRN6IaNpLGw=; b=JwbgqbAn0IJgi9
	K1xSi6RiuvzstyTA62RrB+ZaJmapfvCHAQpt2cXVAEaijSbU+fBHU8kBySBQFb+h8dhyw4wzTvgNu
	ehSqCancrIyCrOLC1/yEZilAEOD0KnUIO14J7nzKdkQoAyzxlgd0r4YC7W6Z01XjYkAjm7tjucNdu
	l6O6cEyH7j+mnl+gpb+b0naT4tkz8p8LdVCaP9T2Ax0G8ruBJNQ0QVhHAHWuOLXiP3bRs/7xGk8+k
	/LylS6RVXIiR0QQ8TSkxbrpHzZ3GTexzVwYo2RxR4vcF3HfIVoLYIzBJovXQuOM7jTQJq+k5RH3aL
	rEtkNhYTxWuk66shNTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa06-00CRD2-2d;
	Wed, 10 Jan 2024 14:56:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa02-00CR7p-34
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 14:56:12 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a28ee72913aso904919566b.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 06:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704898567; x=1705503367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzozb8iCEmtU9e7gf57P/YG6f1xRM2em8wJK2yy1xcA=;
        b=g8kthq3IxhBfXejkfqtWucA60Cv6KZiLaK0szDirzIn12oIAa+w6GOiRuSwceQ1Jwa
         J8P18luuvWJa/EgRT1qSCoCBgxI11wvCAKZxZQ6Yq/gYHWh40Hn+0nIsQI2qo9WwxZQq
         fiD1p1asZ4EeWNbBdUJUP2YWczwG4iFH2RXskZPgSnHAbSFga3NTGisxQvImiGNHvNBX
         109J8dIzxBov6rKSrJYHXSenG4Gr47f7dwEmilqW0DAhCCpzMQ/xMrdMyDyQHRDYw9BA
         K6UCG7BhAQHUV7aYL6ARgqEfTPiPof02vO+iMm0ohWwSsHeCcmHWcHbqW7RiXttZVOWK
         ZSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898567; x=1705503367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lzozb8iCEmtU9e7gf57P/YG6f1xRM2em8wJK2yy1xcA=;
        b=Yh/eTxDXQDfor/vr1l++5MddHXe6/3Euv1Bu4tEoeW+M0SR7pJkTTkPYMGW56nWjKV
         nJAvHEHyEOdofDdDZdEPFtS6fpySHXQbrOvujePK0NOLuyLDiPn7t+7S7LdzR1pCURSa
         ZqjxmrHHZLecoqH7hLMN6iF87JiBmfMrZMqWD761LhdkDZ/OqxwRPm8Rq25GH69XQuuh
         uK8t1CvywMRwd/brL570WEfkH3Qq6iOHPeIxc3M6i03BPWkNLkNmfkN7Ok4lPY9PXAov
         Gt0WwRC+8YsMsZ6VWS2J5uCbZbrlo3jsk0vrrCdldif+Hl+7Ateol4Q0ZUT3c4TfWtJd
         5gog==
X-Gm-Message-State: AOJu0YxL5zMZKZ3AOi0KG5Cp2M3F/87K6TrzH+O3x8wq1dxYW/v83qtH
	Yl9KgRvzh85ad5iBNrwkauI=
X-Google-Smtp-Source: AGHT+IFbro0aX4JfenVN0CWXaIJSjNmp4LSiESS/hHcnDW060bKtIxX1WxZLBedPK80cIKSo6lwVAA==
X-Received: by 2002:a17:906:4e97:b0:a28:b7c1:7210 with SMTP id v23-20020a1709064e9700b00a28b7c17210mr217767eju.7.1704898566889;
        Wed, 10 Jan 2024 06:56:06 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.29.12])
        by smtp.gmail.com with ESMTPSA id bm3-20020a170906c04300b00a2a4efe7d3dsm2161032ejb.79.2024.01.10.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:56:06 -0800 (PST)
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
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 2/4] membarrier: Create Documentation/scheduler/membarrier.rst
Date: Wed, 10 Jan 2024 15:55:31 +0100
Message-Id: <20240110145533.60234-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110145533.60234-1-parri.andrea@gmail.com>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_065610_993219_4AFCAC41 
X-CRM114-Status: GOOD (  18.80  )
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
---
 Documentation/scheduler/index.rst      |  1 +
 Documentation/scheduler/membarrier.rst | 37 ++++++++++++++++++++++++++
 MAINTAINERS                            |  1 +
 kernel/sched/core.c                    |  7 ++++-
 kernel/sched/membarrier.c              |  8 +++---
 5 files changed, 49 insertions(+), 5 deletions(-)
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
index 0000000000000..ab7ee3824b407
--- /dev/null
+++ b/Documentation/scheduler/membarrier.rst
@@ -0,0 +1,37 @@
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
+The command requires each architecture to have a full memory barrier after
+coming from user-space, before updating rq->curr.  This barrier is implied
+by the sequence rq_lock(); smp_mb__after_spinlock() in __schedule().  The
+barrier matches a full barrier in the proximity of the membarrier system
+call exit, cf. membarrier_{private,global}_expedited().
+
+Memory barriers after updating rq->curr
+---------------------------------------
+
+The command requires each architecture to have a full memory barrier after
+updating rq->curr, before returning to user-space.  The schemes providing
+this barrier on the various architectures are as follows.
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
+The barrier matches a full barrier in the proximity of the membarrier system
+call entry, cf. membarrier_{private,global}_expedited().
diff --git a/MAINTAINERS b/MAINTAINERS
index 0f8cec504b2ba..6bce0aeecb4f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13815,6 +13815,7 @@ M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+F:	Documentation/scheduler/membarrier.rst
 F:	arch/*/include/asm/membarrier.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 711dc753f7216..b51bc86f8340c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6599,7 +6599,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
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
@@ -6677,6 +6679,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
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
