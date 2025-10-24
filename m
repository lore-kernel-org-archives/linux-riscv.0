Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB561CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2F9EKUVFgUBtjDKQmMlixBMAvFicZ9BIBJBcB70qyg=; b=b8xCyZYuBoeQe8
	iUJ3ZfhWyWwlSzJNG4LBygtsHSLny4/tPovZ6phSMYRqljoD5LZoH7Nfh+z7F1+f8tY06a2d4YaDH
	N1ch8r6zFsnPupdRs8SZYSwztG22GQbT+icVok02vzpqgwEUZFE50KcPQYahj0zM7R3aGUTuP9j7z
	sfI3/7RhCD2n1kJlBEl/WWamp4vKBavXS9B+Mn3g6u14VAMTibhHx+o9LbphjWYqjgKVa+ydHqC89
	MT/Ijq+Yfp4peKFI3J7hNuTgcWA6C29LAyoHQrTdSf8sp2UzF2ixmV8aOY8O2fU/KfpdV3znk9dN8
	F9kiAQB8f/Py+2kZWmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMe1-0000000AHb1-3KLL;
	Fri, 24 Oct 2025 18:36:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMdu-0000000AHZJ-0l4J
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 18:36:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7a2738daea2so2121871b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761330961; x=1761935761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw14jVuf7BqeO+cDKjQTg5GGuEVAt7PwD+gUI7IAUIA=;
        b=SVF86RWStmkAnPFP+egVb0hMEFoScJAs2yUPLMSEbSuPmD7iBFNMNmtryvVbYDVBMT
         FK5E4mI/rVJGu/u04Vu4CTaQU/OjhvnYDklECpI/DY2s99KzfYfyi43ucb31BBWYigH1
         V7bxWBJkUZgJrDjAIduA3Pr5bDIQBHXtGHzWw/Xe/FrJmFu2rvOaagY2smnBOgmoCbqI
         dZ05Z0hxvr7kzB6i+37LIKHf8osjjWomWjnPX8ijLTB8ziLMRjgTPgaJRgRGO9FhRpUO
         CJqFSVkxQHI7/bCjJ3xEDP7e7a0JsVSMcrkDgnTP95N9ODFLdW+Cx0tfq0NJzILRXMV1
         LwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761330961; x=1761935761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw14jVuf7BqeO+cDKjQTg5GGuEVAt7PwD+gUI7IAUIA=;
        b=Grbhj6Gt+6JwtwTsLMfWy9OwpxEg14SkjashmF9rI3zz7ryMavy0y/4zZ5oVfCNSGw
         D18bKhr+pGZmpZuO5R0v+43zF+Lnuto6d5YMEFvx8B7/iruJnw+5OUIUib/GJnXr1QFe
         BqmCPKLajnQHv6nb8cxHcHSwhin8Lp0xWcPvtTxC4pRQR1Z3Q4t2sziS+9xk04owD0HR
         P848gJDBTxcSaZHcmEcddWVj3rVkTsF2+HNsQBxbB5XCUShhcXuNzCQusPzaxfW9asUm
         OXprivU4zeobLPv83H39Mvfcgika/VRCG1YBS6fOVVoi+qxUS3hrVterYmguNNnXakqT
         wmuA==
X-Forwarded-Encrypted: i=1; AJvYcCXJzC1yeqnoxe8wWCga5n5r+udBomLMqW10bTgn3S62sorydQeF0Uo/qKiACgUADQboiEXK+0SevaoUEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7QgCtpqixQD4C47lNSif9ke98ihcL3jvn2puZB993Zn8BQiE4
	SHfUbaxXLOOpKdsHWZ3SBZB/CV5xl0/vNVgVVBrScLvTG6WQvGIyt/xK
X-Gm-Gg: ASbGncs7zDCOi0FqhDm3dmolAElRRynw1mb+XzKHGYlUzQO0AcDHPf49e92IVJW10ua
	dNIOIgPdh9xUye49Vy7mb9fEG9vTx2D0YvfosgVM5bM3YKjJTuYm0r19/coMK2Zhev6YDJfdotK
	z+lmJNdc5RPDkVr/6/JZmS6rLdcoDqr1L7vvusxL/nZPui4dHQiLPlpn5ollKY0Pz986PHjcUNv
	YrY+VC16ZECswrsoGfItFBWe2trMJdb8CHRhqYKhL3dztn4lm9lfedelAmow71cTzMLfiJjsewo
	PLAIXMY3eGOxHlpouRSKj6ATCJuXtp+nbyLcNecY2UuEnYI2wW5hw9Cn6D4+M/s6Sk+tjAuojtW
	VsYK+RRvEvlCB4skZNakXpGxh6JusrsF3kYWtdDAMDz7RlQGMbpuxHwwhcyVOO04TvUPXmd1W3w
	i80a8o8PYASI8Mj2F0iFw5LXNttGWKSVc=
X-Google-Smtp-Source: AGHT+IHx41IImbCDHn2Jdh7zMNuF3nPpqYLXXAVHuVL/C8w986MehdGPWmZ5hrXWnJ9gl1uAvj5v1w==
X-Received: by 2002:a17:903:18c:b0:294:66ad:113e with SMTP id d9443c01a7336-29466ad11e3mr111410385ad.47.1761330960942;
        Fri, 24 Oct 2025 11:36:00 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e2579e2sm62725945ad.111.2025.10.24.11.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:36:00 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	riel@surriel.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	segher@kernel.crashing.org,
	ryan.roberts@arm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	nysal@linux.ibm.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	will@kernel.org
Subject: [PATCH 2/3] Provide and use an always inline version of finish_task_switch
Date: Sat, 25 Oct 2025 02:35:40 +0800
Message-ID: <20251024183541.68955-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024182628.68921-1-qq570070308@gmail.com>
References: <20251024182628.68921-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_113602_234894_57ECF17A 
X-CRM114-Status: GOOD (  14.30  )
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

finish_task_switch is called during context switching,
inlining it can bring some performance benefits.

Add an always inline version `finish_task_switch_ainline` to be called
during context switching, and keep the original version for being called
elsewhere, so as to take into account the size impact.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 kernel/sched/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1842285eac1e..6cb3f57c4d35 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5069,21 +5069,21 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
  * Note that we may have delayed dropping an mm in context_switch(). If
  * so, we finish that here outside of the runqueue lock. (Doing it
  * with the lock held can cause deadlocks; see schedule() for
  * details.)
  *
  * The context switch have flipped the stack from under us and restored the
  * local variables which were saved when this task called schedule() in the
  * past. 'prev == current' is still correct but we need to recalculate this_rq
  * because prev may have moved to another CPU.
  */
-static struct rq *finish_task_switch(struct task_struct *prev)
+static __always_inline struct rq *finish_task_switch_ainline(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	struct rq *rq = this_rq();
 	struct mm_struct *mm = rq->prev_mm;
 	unsigned int prev_state;
 
 	/*
 	 * The previous task will have left us with a preempt_count of 2
 	 * because it left us after:
 	 *
@@ -5153,20 +5153,25 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 
 		/* Task is done with its stack. */
 		put_task_stack(prev);
 
 		put_task_struct_rcu_user(prev);
 	}
 
 	return rq;
 }
 
+static struct rq *finish_task_switch(struct task_struct *prev)
+{
+	return finish_task_switch_ainline(prev);
+}
+
 /**
  * schedule_tail - first thing a freshly forked thread must call.
  * @prev: the thread we just switched away from.
  */
 asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	__releases(rq->lock)
 {
 	/*
 	 * New tasks start with FORK_PREEMPT_COUNT, see there and
 	 * finish_task_switch() for details.
@@ -5247,21 +5252,21 @@ context_switch(struct rq *rq, struct task_struct *prev,
 
 	/* switch_mm_cid() requires the memory barriers above. */
 	switch_mm_cid(rq, prev, next);
 
 	prepare_lock_switch(rq, next, rf);
 
 	/* Here we just switch the register state and the stack. */
 	switch_to(prev, next, prev);
 	barrier();
 
-	return finish_task_switch(prev);
+	return finish_task_switch_ainline(prev);
 }
 
 /*
  * nr_running and nr_context_switches:
  *
  * externally visible scheduler statistics: current number of runnable
  * threads, total number of context switches performed since bootup.
  */
 unsigned int nr_running(void)
 {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
