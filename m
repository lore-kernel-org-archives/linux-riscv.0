Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15022D59D99
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFA6ranRK7jZkRFu/y7cTDsMJPTosHsMaeGcCihrJs4=; b=4YcCOirIuUo4yp
	Iz/jdxfZ08T/s1FT9QrwmXSTy6fdvJBKdS0LTE2Cd39PDa3gzswyBlhMx7RujXhdfhv1q2wWTB9by
	UkR7gmFw7Wi9ccHWjcfgilY827o+U0WjOOpe6SbVyBi1Kie/lUhSkcCcEBnSGvKCSja4sdbGehyYZ
	YS/oNlGx9mozQzxzdsJ7f9eZXvrlzfUGeTEaXnhRBEE/eThsHcGOO4jMKlm6Pcj0cH8GpgV9bX0Qv
	nUyLZC9ydR8/CufuNLRigKgRyqS8iX0OpiIrd14f282wYzfe7zvlSmqAiWK2SXaIPwjI+uss7U8Lv
	SLaVweUkshlcWa/Dy+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrTp-00000002fla-11o5;
	Sun, 14 Dec 2025 19:10:08 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrTk-00000002fk8-0QEU
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 19:10:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7b80fed1505so2663990b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765739399; x=1766344199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g+gpMOnc0vQHF+ukJzfO2USCcKfWV/qKZdEDby2+sQ=;
        b=VmLc1nRcjtKfTZdJ6xXXlYZrM7nU4LjZaNLAA+9V8AJAqZwn7Ey2rjmTtOlvrs0AeX
         Y5QzyO8rhrGFExpzglvre6dvsEXfkyiHzMxm1Vs2rkZDKVibrjmmnVJwBA7WzyNGVOm+
         vaUIbg/uVelKWRv7aIkG7HYv4Jl5VqGHMIj9QHFpCJyZcseMUHlFx91kVdS4KLy6+jmQ
         vBRGWPxIeecrFpNUOUExnpGbjT5DrhahWgW15mKnbRxYMT+Se2JfQ9V/iColbtzYrkXh
         47CdQIruPfI4Xucq/LfB7dW04fBEfIWM2s8KKL4I1Wdx6IZmRAlcM1W9EItqW0mWWezW
         2//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765739399; x=1766344199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6g+gpMOnc0vQHF+ukJzfO2USCcKfWV/qKZdEDby2+sQ=;
        b=v/SZcq/+J9YG+GOAYvKGjDi/Tijsy4/8zQY7v5T5hPXDprDZ18u8ci+jAqwHHbHAs6
         N41bHYNC2GyM/AqplJoBq6ZV3dvbHaqJEs+84ecGXDkQg0PNPOr+2iU4iM1ZRFPJ8C4k
         0QtZY6LeW2WZkbdKOc9kqhGh44JHhfu0VJYOHTCiLcfUdYjO1litdLNuY5nniGOqe+QS
         g8TLdM5D1Am47vrxoqJgC4JBdyVXLou+wGiT/vxTcZgUfjFZ6PPffsFkbZbe+GpXpR1T
         pmsgSsJJb0w8gGAj6Fj83PrWQXodPFNx2gko5tAk13cJqwfdMRT5hXWD8qOWmylRgoU7
         MikA==
X-Forwarded-Encrypted: i=1; AJvYcCUmsn6v+xpg9ufXqYARMvYt/cThT6ZmLbe2f7YJep22g4LskpNJpoaadp4oawROxJuO7wOlf0idpnHLwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh11ZhzEymOa0b+6uVAJwJpElRHgV582ENcai0XDnqct6Y/qbx
	oi+sXBZF6pvDpw2G7kD59lSdQ0m5+Bo99w2SLrUHBh3RMtwyXbBkEk3a
X-Gm-Gg: AY/fxX4Z1lFo4qepA56B72xwynT3h4KCDUXwbZNb+Vww2QbTJexWbAkXBBTRivcQE8F
	MRZnS3+wv50DauRZcgbQ6gM7dMX3v2JmtJSoxlPCrdJ+bsvBpyFvqGooIlBElFUx4BsXtwEM29q
	4kwDnB+rJM6mEB3kxOAzdhobCtv0C8oYiVXopTRodsKaaT3Cf/rBURMx4AtOls4aBquOwttN8MQ
	+nx2UfSKY/ziCQQibqOnl8BQuk8Hg4A1QSuhot53BM4j6EuaIIEIH+XyY7NZkM+dLpf8ILk7uHZ
	x8gZN47LyREdTKAyKuRGbvl7kmSN+3MB9HNDmmWX8c5Qhe148AwlGgElZB5j0tKAH57PWIqv26T
	FnGGOXZhFNVNQv2gOkAXNNLxJqZIgOtkSEsITlN/Rd6y64z15v9D0LqD8gdznDNre6qnRfgnzqX
	HvDEn+1jSHm1cuI/eXfzfdKzsryAsSY+s=
X-Google-Smtp-Source: AGHT+IFEjQ5W/F/1GV+Udmo7P6q8cvk4k0ZspkiPRW94iOHQJNGagX56DVsdqgrn7t+EEED1vTORKQ==
X-Received: by 2002:a05:6a20:72a8:b0:366:14af:9bbd with SMTP id adf61e73a8af0-369b07ae5b5mr8721021637.71.1765739399013;
        Sun, 14 Dec 2025 11:09:59 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe3a1c5esm6909062a91.3.2025.12.14.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 11:09:57 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anshuman.khandual@arm.com,
	aou@eecs.berkeley.edu,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	irogers@google.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 2/3] sched: Make raw_spin_rq_unlock() inline
Date: Mon, 15 Dec 2025 03:09:06 +0800
Message-ID: <20251214190907.184793-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251214190907.184793-1-qq570070308@gmail.com>
References: <20251214190907.184793-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_111002_186727_D0B3E2ED 
X-CRM114-Status: UNSURE (   8.82  )
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

raw_spin_rq_unlock() is short, and is called in some hot code paths
such as finish_lock_switch.

Make raw_spin_rq_unlock() inline to optimize performance.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Hildenbrand (Red Hat) <david@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 kernel/sched/core.c  | 5 -----
 kernel/sched/sched.h | 6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 41ba0be16911..20146da3f181 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -678,11 +678,6 @@ bool raw_spin_rq_trylock(struct rq *rq)
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
index d30cca6870f5..bef6cb13266d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1551,13 +1551,17 @@ static inline void lockdep_assert_rq_held(struct rq *rq)
 
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
