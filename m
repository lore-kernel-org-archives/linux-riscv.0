Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA4C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aaPVaEGx8/sEHO3Z6EKdVARDuXoO5LT/uM8sy4glRs8=; b=4Jvz4ZoSr+hsqm
	CHPiVIoCOEWFjnrTAS/+wWlBRL9C6LgAixDsgMGFjjAI1V9drAzXCJXpHyDxYOMOENALBXbF4QoDm
	9exz0CZdvIGMnF1zJMvRmmnF6+k9OzMKr+5xaTyqoDlba2IE8xJRL89FVdmJ8N5S0CUv6Vs6ad7Sf
	aQybB47OA5MCYkmVmz9d37TH/GG+7BLEV8kNGG5Oc8+Ro5NJZFwsmtmwRkguGArDm2c5zovHfyMAm
	Y15LDVTWVCWRv8sUalyk8haJXH/Ez9kRsxKpEp3hHIrj+Y1adI1NsZwME5PB1qmeLEI/Vb10+GKNp
	IV9xZ8ajXwxTfSfcT5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpIk0-000RNh-U0; Mon, 22 Nov 2021 23:28:52 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpIeK-000OlZ-H9
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 23:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637623380; x=1669159380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YQ/XAKWYAeapcTzZkPgcULpc8rtRC5bV6gTHpBAfk4o=;
 b=SMjIVtZPHWumz8bsBxPvBR41t7pVI3hUqXT5VnZskzSg0f+LlHc8t3jJ
 XGwGL+Ebmszy+iwtyCkQxeRTQKYfcfrH5L3HhX3/hKOLtlfymEKpKfp29
 fJ9kG+y/svtQ1rghzJM6/uLt0e4ZASROl89YJz6AUj5JpNm9fETdYTItr
 GVx1U64Nk2AIau/pnltdVOitkLbECtzgL3TxLQth4aCgJ+iNzHVIA4gtt
 Jmdrwahu6wH5kRaGr+L2TU+b8vKSq4bHz5L2x9S+4Xa6McOKh5J1DjC2q
 Mq1fefTAKcFb74kbGbdoUAc/gBOgVp+Nl6xpwctXWi472tgCzFv7kChfL A==;
X-IronPort-AV: E=Sophos;i="5.87,255,1631548800"; d="scan'208";a="186361689"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Nov 2021 07:22:58 +0800
IronPort-SDR: IugWb8KxKwo/tBYnEOluIVFd5x2Ty8D2Oxg0MMUug7StsoyXrUU5yXhq7iTQX+1P/QUxNjOWsL
 0uxUxWt1BddAn/0peEy6ZwJmJCtKY07xSQZ6YzZUhQvh22+WGsj0XZxH2da6evHS5cKmCw0JP9
 pEx9bMDu91WjRjp32d8oyxkJJElVAwH6MRDn+/oQy628VgH0mGg/lKTpOJu3j3KXJOmKymaDW7
 seUW/pe7OBFPEH+ar4ajw3yfg5h9BmpzUwU6r4rOnSNxj60KlUuIJlgRtlyF0qORB5/O+65mB4
 wZDmSpjNHkfusX97SrQeG8ov
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 14:57:53 -0800
IronPort-SDR: NbmLZR0Ywzl2C9oNK+eoFI0nrOstZsJDiyeKf4HCnzWwbv4i8eYlVyaBntVsEymeYlUWTn6/JZ
 vnG2CTa4nKU3gN4KLsLHeFWdUiumr82W2TDgsF1mQeAtlxDBUxDbEedmaFVyeEbCgU/u/Tu36o
 vCsbWUgqfOnulJlj8HF8XlVAXuG28IUWN4Bs+xE2UtxQbYHecV4PAfIMWktNFKWVx8eTNJ8uDQ
 J0gzPC8FMbW3jMxCRa9PJPIyMyHQWnloizZoUTW6t3GS5LW6p2HKB9mMwPQ1VaLEmfDysQh20q
 WLM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 15:22:59 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HyjxF2k7Tz1RtW1
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 15:22:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1637623376;
 x=1640215377; bh=YQ/XAKWYAeapcTzZkPgcULpc8rtRC5bV6gTHpBAfk4o=; b=
 uXuB4eILMIMxwqKN5uy0RnqMStAIUYqYfAhMgkwBD9YGxxZ41LQRHYE/MKtMi3uL
 a3m1GSKUR8wRfYAWzJ18ZiuEMysESzsZr0kvc/BPrUfQgmKs6/UI7asqjytSLPfm
 W1YLwL1qOwxKS57KooHddtSC0+d7+4KI6rsxFCwqBGLbUm/Nu0dB9uRZDI054q6f
 2zq99/11ZNtQD+uLgT8TdRfxHZeim7kyhqDPVWIkvuoB1/RtFmW1t4y2qBz2zXXc
 MXHVL3wH2P17Pgw9F3CBLLQNS7cqIOK7oJZjAiduPrmj1HEwg2LPgqwBRT+sxIiG
 5hGpZGBvxikJjTYwNUyijQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id vhZAH_EIVjBw for <linux-riscv@lists.infradead.org>;
 Mon, 22 Nov 2021 15:22:56 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.60])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Hyjwz2rT7z1RtVl;
 Mon, 22 Nov 2021 15:22:42 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: mark.rutland@arm.com, atish.patra@wdc.com,
 alexander.shishkin@linux.intel.com, peterz@infradead.org,
 tglx@linutronix.de, namhyung@kernel.org, dave@stgolabs.net, arnd@arndb.de,
 linux-kernel@vger.kernel.org, jolsa@redhat.com, acme@kernel.org,
 alistair23@gmail.com, dvhart@infradead.org, mingo@redhat.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 1/2] selftests: futex: Call the futex syscall from a
 function
Date: Tue, 23 Nov 2021 09:22:35 +1000
Message-Id: <20211122232236.119533-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_152300_731628_8F820B51 
X-CRM114-Status: GOOD (  16.44  )
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

Call the futex syscall from a function

In preparation for a more complex futex() function let's convert the
current macro into two functions. We need two functions to avoid
compiler failures as the macro is overloaded.

This will allow us to include pre-processor conditionals in the futex
syscall functions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../selftests/futex/include/futextest.h       | 59 +++++++++++--------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/futex/include/futextest.h b/tools/testing/selftests/futex/include/futextest.h
index ddbcfc9b7bac..c786fffecb8a 100644
--- a/tools/testing/selftests/futex/include/futextest.h
+++ b/tools/testing/selftests/futex/include/futextest.h
@@ -48,7 +48,7 @@ typedef volatile u_int32_t futex_t;
 #endif
 
 /**
- * futex() - SYS_futex syscall wrapper
+ * futex_syscall() - SYS_futex syscall wrapper
  * @uaddr:	address of first futex
  * @op:		futex op code
  * @val:	typically expected value of uaddr, but varies by op
@@ -58,17 +58,26 @@ typedef volatile u_int32_t futex_t;
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
+futex_syscall(volatile u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
+	      volatile u_int32_t *uaddr2, int val3, int opflags)
+{
+	return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
+}
+
+static inline int
+futex_syscall_nr_requeue(volatile u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
+			 volatile u_int32_t *uaddr2, int val3, int opflags)
+{
+	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+}
 
 /**
  * futex_wait() - block on uaddr with optional timeout
@@ -77,7 +86,7 @@ typedef volatile u_int32_t futex_t;
 static inline int
 futex_wait(futex_t *uaddr, futex_t val, struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
 }
 
 /**
@@ -87,7 +96,7 @@ futex_wait(futex_t *uaddr, futex_t val, struct timespec *timeout, int opflags)
 static inline int
 futex_wake(futex_t *uaddr, int nr_wake, int opflags)
 {
-	return futex(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_WAKE, nr_wake, NULL, NULL, 0, opflags);
 }
 
 /**
@@ -98,8 +107,8 @@ static inline int
 futex_wait_bitset(futex_t *uaddr, futex_t val, struct timespec *timeout,
 		  u_int32_t bitset, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT_BITSET, val, timeout, NULL, bitset,
-		     opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT_BITSET, val, timeout, NULL, bitset,
+			     opflags);
 }
 
 /**
@@ -109,8 +118,8 @@ futex_wait_bitset(futex_t *uaddr, futex_t val, struct timespec *timeout,
 static inline int
 futex_wake_bitset(futex_t *uaddr, int nr_wake, u_int32_t bitset, int opflags)
 {
-	return futex(uaddr, FUTEX_WAKE_BITSET, nr_wake, NULL, NULL, bitset,
-		     opflags);
+	return futex_syscall(uaddr, FUTEX_WAKE_BITSET, nr_wake, NULL, NULL, bitset,
+			     opflags);
 }
 
 /**
@@ -121,7 +130,7 @@ static inline int
 futex_lock_pi(futex_t *uaddr, struct timespec *timeout, int detect,
 	      int opflags)
 {
-	return futex(uaddr, FUTEX_LOCK_PI, detect, timeout, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_LOCK_PI, detect, timeout, NULL, 0, opflags);
 }
 
 /**
@@ -130,7 +139,7 @@ futex_lock_pi(futex_t *uaddr, struct timespec *timeout, int detect,
 static inline int
 futex_unlock_pi(futex_t *uaddr, int opflags)
 {
-	return futex(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
+	return futex_syscall(uaddr, FUTEX_UNLOCK_PI, 0, NULL, NULL, 0, opflags);
 }
 
 /**
@@ -140,8 +149,8 @@ static inline int
 futex_wake_op(futex_t *uaddr, futex_t *uaddr2, int nr_wake, int nr_wake2,
 	      int wake_op, int opflags)
 {
-	return futex(uaddr, FUTEX_WAKE_OP, nr_wake, nr_wake2, uaddr2, wake_op,
-		     opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_WAKE_OP, nr_wake, nr_wake2, uaddr2, wake_op,
+					opflags);
 }
 
 /**
@@ -156,8 +165,8 @@ static inline int
 futex_requeue(futex_t *uaddr, futex_t *uaddr2, int nr_wake, int nr_requeue,
 	      int opflags)
 {
-	return futex(uaddr, FUTEX_REQUEUE, nr_wake, nr_requeue, uaddr2, 0,
-		     opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_REQUEUE, nr_wake, nr_requeue, uaddr2, 0,
+					opflags);
 }
 
 /**
@@ -169,8 +178,8 @@ static inline int
 futex_cmp_requeue(futex_t *uaddr, futex_t val, futex_t *uaddr2, int nr_wake,
 		  int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
-		     val, opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE, nr_wake, nr_requeue, uaddr2,
+					val, opflags);
 }
 
 /**
@@ -185,8 +194,8 @@ static inline int
 futex_wait_requeue_pi(futex_t *uaddr, futex_t val, futex_t *uaddr2,
 		      struct timespec *timeout, int opflags)
 {
-	return futex(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
-		     opflags);
+	return futex_syscall(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
+			     opflags);
 }
 
 /**
@@ -200,8 +209,8 @@ static inline int
 futex_cmp_requeue_pi(futex_t *uaddr, futex_t val, futex_t *uaddr2, int nr_wake,
 		     int nr_requeue, int opflags)
 {
-	return futex(uaddr, FUTEX_CMP_REQUEUE_PI, nr_wake, nr_requeue, uaddr2,
-		     val, opflags);
+	return futex_syscall_nr_requeue(uaddr, FUTEX_CMP_REQUEUE_PI, nr_wake, nr_requeue, uaddr2,
+					val, opflags);
 }
 
 /**
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
