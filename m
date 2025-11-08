Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B61ACCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qg29H9V7/lPK+enzEEKVeT/0a0UByXqsdZ6jEldI2Ao=; b=v2HBMHFViK79X0
	B4yvKCddEQqnvn+xWr4ioVUofv3U9oFRBBpM13Qn/166bMK3q7yiWGNmptMISNRsWE0O7bxvlrRMQ
	ZXKUZMG4F9tLnJdtRIX7VVbJCCi93rbmDs/U34HTlBqcfrFJQ5yiB0KMleU1iVKvaTv3rdBJBwMNd
	M7KUwyhr9ZsDTghQCyCzT6uJNd3ecgaJAc8yNN1X/T8yzWWxJCpXQbMlQIqup2tSLoeHZVDjvCX3u
	F2miDUintR7K0wYUwVynV09QGJPJb+qCAvYLLRlR1/oxbJ2rfG2W5JlUD9q/ORkGCjZPrTVKMd4Tf
	uEeohCgh1fS5GOSlCx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmhM-00000003K0L-0tJ8;
	Sat, 08 Nov 2025 17:26:00 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmhJ-00000003JzX-0dqt
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 17:25:59 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3438231df5fso140903a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762622756; x=1763227556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5bwZ5Z+zIq2ecop9oyYTCXszFNgUcbYI97Mt5lZei4=;
        b=GcdaK6dNvoH9dxPwtzUQdSXGEeutRiGDNFsk4hqphkO3JsLkbaWQ91P7DXW/k6hNUA
         KIcoDWcquRvM32/7h28YcaCpgVSMt8yFgj2OlMLt29cIFmXbbnCW/LSy3xwrKZf+n5R2
         ZmkfPkjjw/538xnUoK+osfGuLGd9bAoiiQesteqWha1ToYe1mBps4ED0NtjXIpFNiOA5
         XfIsIc6iofc6kAe2k/M5/87wJCp7nHntaf03ErmdrUabiyCdkeTwxy8PS1g0jnnDX3VS
         mKrFiLT8WnnE/ymFcxoMPnOxHofveyXMOJ3yi7/jFIeti/vkK7VJfJzEemKiIJZbvaA+
         IjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762622756; x=1763227556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q5bwZ5Z+zIq2ecop9oyYTCXszFNgUcbYI97Mt5lZei4=;
        b=NB8y+xPc04h85vXQgjaDgLThIW0t6TY9hTS3TVCjqgHQehvOBHvNiGfbZPg6UyqJjZ
         n/H8vCWPrLX+kBi8E4qUfyFZvETmVtbBx/0J3ex+PbwUcbbTiDqTfi20AHqYAXIQYe0W
         OfIZh0CkC2h9u6bLzTULe0lnSLIZSYMla23smhV4L7R8BzzU349aOpsg3+MrMhQtWUkD
         Dchs5hmSFRFYY4Tp0FWaPi0l0Dn2kzMYnlqu/zUeTB/THJpDFVv5WVzvYyak3WBIb3oQ
         IjfodjW+UR7/2BGwhtvyYI1VoSMOeuKQC31hORQ+I9fkhiLQKasoLw+kf/6hrFnGouJq
         XQJA==
X-Forwarded-Encrypted: i=1; AJvYcCUSzK44M1SOQ4zMfqUNOB+7TAWqsV9uNZSj0RZIO8Ykcw5AbkEvZ9JaOcQTLizXG4NzYFqQa3W/hsRzqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YywPpm9ifHrPqRg0NLfwdw4NepJJ+19/eMIFk/Y2w/9hzJlvCav
	HKgGVnxBjkTIqQVkYs0rVobw5z72qPTK0hJL6RlnsIS0hY100yBXim/V
X-Gm-Gg: ASbGncvzMIwTLlvRKKAHCcOcZRDZTswlmDtQHO9EjGR/rWLzL3wO0VVjiBMbd3H6W7U
	5/JkD7R2BBPh2g/phW+YsbOHmLJOk9V2lXbu7k4wT6KpP32vsgCkOhkAUoDDOELZCE5H5NTWP2s
	hyPCSJaHjgs+og0/IxLLVG1wgysIfApaHmC0XBT4KA5V46T/3yVXcMN0EEmguidYFiZzwv5Bk9S
	dbmDifHARdNMFSyXssMT2IrCYk6VsBLLAa1aOsHOc06D44VSpHmu3UJn649NY08He6+eJAN1Zxs
	h0Q78Z3wPiJB+kPdIFHrfh8HPOYPRbBxuvH1AXWlqRIuq7knRDsID9WIqUZXyI7ZIbtubJWCLdE
	FYNrW4lvnj34EvX5EqKtNH9HpvJLwqGw8gprdBCQV7TqIwm7WghMQIe4k7G/XEHEZfSt/wgDRT3
	w5AFXb6j4R/r5WTjKsCU9Us+1OfqOU6ut+TuM=
X-Google-Smtp-Source: AGHT+IFzryf94me9ukx/zbL0xbjMPFhvtV+1CTMJbLmCIUchy3O1OLGY4lLG83s/d5GEdAHNinNGqw==
X-Received: by 2002:a17:90b:4b04:b0:340:d81d:7874 with SMTP id 98e67ed59e1d1-3436cbc9436mr4012371a91.26.1762622756323;
        Sat, 08 Nov 2025 09:25:56 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm2769122a91.7.2025.11.08.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:25:55 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
	peterz@infradead.org,
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
	hpa@zytor.com,
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
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
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
Subject: [PATCH v2 2/4] Make raw_spin_rq_unlock inline
Date: Sun,  9 Nov 2025 01:23:44 +0800
Message-ID: <20251108172346.263590-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251108172346.263590-1-qq570070308@gmail.com>
References: <20251108172346.263590-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_092557_192579_BDF48F84 
X-CRM114-Status: UNSURE (   9.60  )
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
