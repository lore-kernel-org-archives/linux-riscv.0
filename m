Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B64CD5BC2
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkunOLaHUIrZliMx8/hluoAN5m7241e/4/6HKS41t8A=; b=DLT0ejZ8td5FS6
	3BVp1x8ekhYKTE9QmQYAn7maKPO9dj3HYocD7sLG+Yi8N+G9WNd3wVnI38Y6r6gsAaLYVHQmvbcBP
	SUeBcdq/M1kBmHzbnezvz2VOAsEUUPk8x3LLHpWOhRr2ibufXmVOE7tzTCZtILIPRuS2ULqxTIdm8
	rdyvf1g+GsAFB6cZvfaVIp+y75e4zG9bUKDEi++9visj94F7pBygellodVy0mgrKnDK02ZACuswJ+
	n6oad56LupzUdkkFKsnyc2TN1gsBrDr15lMw3q3+Gbi/eklSC7Wv9BkTkMu25hdajk6w9suATGq5E
	EbjkL+OS7VXvevu4nnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUxa-0000000AKic-1BLF;
	Thu, 13 Nov 2025 10:53:50 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUxY-0000000AKhJ-0Nj3
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 10:53:49 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3437ea05540so668282a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 02:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763031227; x=1763636027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79H4PCNvjunVFwIbn/0+pzKB83dy0Gioq68+Eu7c2ig=;
        b=GU/T6e5NU4+dO+LrMG4SSxWkLaHl9m5peCJ2vp5QjBd0aJxA4vxHO1z9ngPtz+fuej
         w6PJMWJEb4FuqJIvmOh8uqP6/vzqRh2bFOlq6CBuDLM17nAQxF/4CNDIuKuZDgojmrzu
         bcjEzlY78dQYEXV8GMLtW3O4v7R7eJiOmu0UZHwvrd38a7Iv7FPXbA11gIxhnbiC+gbN
         auXB1VdDNfRg1qIxa+KlwlCXl/IbusSWEbjsU6ZTOlhMENLLYryMz6eyOPGeZ6Q3CsRZ
         z3XpoKhkuEXH1ZQ5P3hx6bHEzjoLAPEDT7zwgVFbiaZcSE+c7Gzph5d70NbxT/NTkhiP
         lKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031227; x=1763636027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79H4PCNvjunVFwIbn/0+pzKB83dy0Gioq68+Eu7c2ig=;
        b=WPMh+Krqp0VghvWxbjee+zPkWx3BfEpgbml4q6jmWMC+GFzRpkKySz7P5YyqvZ3Rzo
         T7b3iFyBiHyX1c7DBvYEu2LHS38gV3haR8M0616CioWHiLj12wM7N7PBtSAv6Cozq6k8
         jYT1uQjRLGuf5wD/RvNOayKHAm2QFyrEHwJ8Dld+imIEKxyYuN2q+Edo1UWPzPYLaPUU
         uf3qmdULVBED5/NYUEuaYWn8L343fXtNIGDkdwkPg6mRdnhZ+1Bh664IEKhsABsQ8q1i
         o6spr0VQBbAYrqZbgxTTK0bOcEXTIyRyEgjSmRYe5L1W1TDZjwQfPgYtXUruW2v9WAcM
         HV3A==
X-Forwarded-Encrypted: i=1; AJvYcCWqHCWVf9JeKWW1pAbG8OSlSE3vvHQP+ABEfXBlkbLcBgWUqIl5veZpQo0rmRZ8kt4jdOndScUS4+JeHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMNG5d0AjBa9LfPQ2QpskQQnnkC5zSdss/zR40X4CHKMeTTDqw
	oLaW5NMUpj+52V8AAGklmD8ofeF6fNxFSC/PBD3VChS6yE55pEEaDmLk
X-Gm-Gg: ASbGncuXL8u+W0yrgXV70wHZyTOaiP+jahCSTBzr59fMcHdQtRjW9J7wWeYot6CXck7
	c5HhbnXVkX38IRiKoKXt76lLtW0ljonPT3x5Wri1HB7P4SPa5aEqILdyh31nYwfJ16Qt9lN4Gn5
	u2TVKj8618jJJM9Y9pUpk6DE7uuqrjgtS1j5W88FUI/uFtO8KJdrpN6GL/W9eTdE8DNa+TLYPq5
	nTclV/sjIHvZtYsHQrkOS+5OZ3wzhK17taq75syRVw6b0Kj7USDJAoPekz4uphv7ykjLFR+sb94
	Q9sISxudPirwAPoBW1UpgCPEMKPMus0hcn7Ksh/JGO+yZYh/J73iAXIgbu+r50/T916Vla4YToW
	6Qd0jDJEZjCUxVbYg5qugMbKjPZouxx+6jCmkyC9artf5RW4aXvjbTD6kWC515ZZiUwmYtSE65I
	DJIgsip8cd5/GZcH7w88BNAdpU
X-Google-Smtp-Source: AGHT+IG67cbPiY5vzZGzQUE0bLFNEQd0Hs0NoyrOMcnJ2e809/8Qsgd+TCKfqsTG/VC1QF5SpkYEpw==
X-Received: by 2002:a17:90b:51ca:b0:343:653d:31c with SMTP id 98e67ed59e1d1-343dddd4253mr7480650a91.5.1763031227339;
        Thu, 13 Nov 2025 02:53:47 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ed4c939dsm2139616a91.6.2025.11.13.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:53:46 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@redhat.com,
	peterz@infradead.org,
	hpa@zytor.com,
	osalvador@suse.de,
	linux@armlinux.org.uk,
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
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de,
	sforshee@kernel.org,
	mhiramat@kernel.org,
	andrii@kernel.org,
	oleg@redhat.com,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	baolin.wang@linux.alibaba.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: [PATCH v3 2/3] Make raw_spin_rq_unlock inline
Date: Thu, 13 Nov 2025 18:52:26 +0800
Message-ID: <20251113105227.57650-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113105227.57650-1-qq570070308@gmail.com>
References: <20251113105227.57650-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_025348_131037_96CD1754 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

This function is short, and is called in some critical hot code paths,
such as finish_lock_switch.

Make it inline to optimize performance.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 kernel/sched/core.c  | 5 -----
 kernel/sched/sched.h | 6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 81cf8452449a..0e50ef3d819a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -677,11 +677,6 @@ bool raw_spin_rq_trylock(struct rq *rq)
 	}
 }
 
-void raw_spin_rq_unlock(struct rq *rq)
-{
-	raw_spin_unlock(rq_lockp(rq));
-}
-
 /*
  * double_rq_lock - safely lock two runqueues
  */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index f702fb452eb6..7d305ec10374 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1541,13 +1541,17 @@ static inline void lockdep_assert_rq_held(struct rq *rq)
 
 extern void raw_spin_rq_lock_nested(struct rq *rq, int subclass);
 extern bool raw_spin_rq_trylock(struct rq *rq);
-extern void raw_spin_rq_unlock(struct rq *rq);
 
 static inline void raw_spin_rq_lock(struct rq *rq)
 {
 	raw_spin_rq_lock_nested(rq, 0);
 }
 
+static inline void raw_spin_rq_unlock(struct rq *rq)
+{
+	raw_spin_unlock(rq_lockp(rq));
+}
+
 static inline void raw_spin_rq_lock_irq(struct rq *rq)
 {
 	local_irq_disable();
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
