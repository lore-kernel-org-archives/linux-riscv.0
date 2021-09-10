Return-Path: <SRS0=Q8j1=OA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176AEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 04:32:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C2761059
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 04:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0C2761059
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fF0r7XcJeetQvhcWMz5bhaVEkXbaDTGbGNPVR5Fy82s=; b=3zY29cmQDeSwF2
	nxpFrBzgCbdCdsDyNajCzTsENHk7fn97yosl8ihsQVuEK+JrgzN9fHmB6ZwSvjrD8yrTZDy3LQxBu
	WyY6+bgi7LDW/5eDuoAGdN+fDf/HQQ3JAUrqC1jVx/h3E8/Oamix0VEd9NWSUgB/5BU1nBgbmILxC
	1pC/BMsAcZcfFgRHUcbzbAFQqjCLtaAQP2EVJUBjfqr+LYr7odH6bBecQU6JgdZFip01dDmJ/tSWe
	DFJELZAvw/EzInA1whzh4eMzw1jzQKxPA8NJliAhdi/MtSxNncgfp/NKZb9yULhMJrvkKg/w3u3p7
	eRaHb1xogSLTYy3HMjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOYCU-00Bli9-BR; Fri, 10 Sep 2021 04:31:42 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOYCC-00BlhI-98
 for linux-riscv@lists.infradead.org; Fri, 10 Sep 2021 04:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631248283; x=1662784283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9y8Ut/ugz/WF4xLl6QXyYdgaBuD43Adc9tbqyoQdLNk=;
 b=RfVxRMOSQzExu5eCjwnq8mZ/hJ+OjnytJncu3EbS0UfFxKtNxgkVRjkB
 xFl31K9IYKXnv3luilHq+Sa3Qkfq+SZMP42nAgLyLLZ8cUx5KxZAdskjY
 QRiXCzRqteHuoBKWg5vXI8noAsGAzpMYIbOTQ55W3MHEpkaNYu+xrOjVz
 A16rZu3qZv1Rnb4Z1aA05zMtE2868vIhpbn86Jkbc0XaQYzB1IObYNDF+
 IoPCgvTV87QZOGCJLWE5T9TIIBqDkVpB5IYrPvBOb86iQTgeCgP4IlOKw
 sYvJ+mBbCZQcyH494cSf47EZRAvIzQhH4bjysEZWpHfvaGHqKW6bdTRuQ A==;
X-IronPort-AV: E=Sophos;i="5.85,282,1624291200"; d="scan'208";a="184438637"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 12:31:20 +0800
IronPort-SDR: /WTFj/PGwYiNyfoJzp5K2BabtvaidaqjDmbFi2XVJsscjhzxBJ4h2bQbyIoUJftSDKXPNiS3Gp
 aZ+RPXXlDf6N3VJc+cff4L6esiETnl03a8GpX6PWK1jUVwTcfM+lIi207s5CKWrmRHw4u/yFyk
 kXqlb3C54rJSQlfkITdbiRXNeYrBlhgo+eJKeKWDOC674fZUhYvy6VW7CtommhMdJAnmvVebah
 J/Z1e0+PcpLA0DBFK7gvhTunNgpJx1l3XpMccDG5D72Bcv5mA1zsVcZvrYfYqtJc9HQOzYHpWQ
 qU8+1uxh67XacnfthgxqxPqq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 21:06:16 -0700
IronPort-SDR: Q5Gg1qxf1rgzMdGWdL7KC9XLVpIJJlinNKb/E9RnyquI4Wtenoayh2C5nnL6T+tf1YTy/Re48T
 1s/ppCGpry+063s1MBmTaGw2mWxXEMUEj1j3NjfrQelU2xYezN/5MT2A7od9U6T5abfl9E6+RN
 AKTJKoqLxdKywWO6+23IHlRQHrBPSnN4b8QmjVMbtR+nBMeQaVdZ2MnMpcDZHfpQcRTIRma3ht
 FRolMLnMnYhdkLUF4t08PYvT56T8fPGPSx8PAeLjPq/r/k92LlxF1U9TxBzCSLGac6jBA66I7N
 q5k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 21:31:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H5NHD73pPz1RvmD
 for <linux-riscv@lists.infradead.org>; Thu,  9 Sep 2021 21:31:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631248279;
 x=1633840280; bh=9y8Ut/ugz/WF4xLl6QXyYdgaBuD43Adc9tbqyoQdLNk=; b=
 bBMIbvz14DHa0x6eL9m6Tt+YE3RI/ROgO1axqtzuNrJoLOHQFV+TZ2ItXs8coZ1v
 Wm7UqWAGjN5DQA7i+kgjdVxJd9Ikt85+yVN5AcqnQ64Gx2O3mOxi58/U7NX6FgE9
 7iRB6YSz4fcxf2SC25fa3PeEPdDFJp86nI8MXnRVsz7ct3u/67pwprTokvfx1RBA
 qWHZJNipLpjGizzyqXgwMwZfLrIghCNfMaraspYrj0vIlRpyLb6AYaJjyxQOo8kV
 xbC6GwanZfpI4VtCQLA8VOHyefrkj3XuWtfsTv2pVH+1cw9pNls9CF34i0oOSH2Q
 a3634pb3wHR/Zoi6QuW14Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 44ZxYGZUK8PK for <linux-riscv@lists.infradead.org>;
 Thu,  9 Sep 2021 21:31:19 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H5NH20krvz1RvlR;
 Thu,  9 Sep 2021 21:31:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 1/2] perf benchmark: Call the futex syscall from a function
Date: Fri, 10 Sep 2021 14:31:01 +1000
Message-Id: <20210910043102.3616198-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_213124_436371_C3BD67E1 
X-CRM114-Status: GOOD (  17.53  )
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

From: Alistair Francis <alistair.francis@wdc.com>

In preparation for a more complex futex() function let's convert the
current macro into two functions. We need two functions to avoid
compiler failures as the macro is overloaded.

This will allow us to include pre-processor conditionals in the futex
syscall functions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tools/perf/bench/futex.h | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index b3853aac3021c..f80a4759ee79b 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -28,7 +28,7 @@ struct bench_futex_parameters {
 };
 
 /**
- * futex() - SYS_futex syscall wrapper
+ * futex_syscall() - SYS_futex syscall wrapper
  * @uaddr:	address of first futex
  * @op:		futex op code
  * @val:	typically expected value of uaddr, but varies by op
@@ -38,17 +38,26 @@ struct bench_futex_parameters {
  * @val3:	varies by op
  * @opflags:	flags to be bitwise OR'd with op, such as FUTEX_PRIVATE_FLAG
  *
- * futex() is used by all the following futex op wrappers. It can also be
+ * futex_syscall() is used by all the following futex op wrappers. It can also be
  * used for misuse and abuse testing. Generally, the specific op wrappers
- * should be used instead. It is a macro instead of an static inline function as
- * some of the types over overloaded (timeout is used for nr_requeue for
- * example).
+ * should be used instead.
  *
  * These argument descriptions are the defaults for all
  * like-named arguments in the following wrappers except where noted below.
  */
-#define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
-	syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
+static inline int
+futex_syscall(u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
+	u_int32_t *uaddr2, int val3, int opflags)
+{
+	return syscall(SYS_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
+}
+
+static inline int
+futex_syscall_nr_requeue(u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
+	u_int32_t *uaddr2, int val3, int opflags)
+{
+	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+}
 
 /**
  * futex_wait() - block on uaddr with optional timeout
@@ -57,7 +66,7 @@ struct bench_futex_parameters {
 static inline int
 futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
 }
 
 /**
@@ -67,7 +76,7 @@ futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec *timeout, int opflag
 static inline int
 futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
 {
-	return futex(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
 }
 
 /**
@@ -76,7 +85,7 @@ futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
 static inline int
 futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
 }
 
 /**
@@ -85,7 +94,7 @@ futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
 static inline int
 futex_unlock_pi(u_int32_t *uaddr, int opflags)
 {
-	return futex(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
 }
 
 /**
@@ -97,7 +106,7 @@ static inline int
 futex_cmp_requeue(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2, int nr_wake,
 		 int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
 		 val, opflags);
 }
 
@@ -113,7 +122,7 @@ static inline int
 futex_wait_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
 		      struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
+	return futex_syscall(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
 		     opflags);
 }
 
@@ -130,7 +139,7 @@ static inline int
 futex_cmp_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
 		     int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE_PI, 1, nr_requeue, uaddr2,
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE_PI, 1, nr_requeue, uaddr2,
 		     val, opflags);
 }
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
