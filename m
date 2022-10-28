Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18FDECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=td9Dv24kTmtrf2CKDA064tnFVCtNPzAm2mt1Xj6icuA=; b=VopEaY9L6ZZBue
	8PvAv8bHUb5spZJti8zfNZ6yXVxBFFkxHKWl4kxpwB+ij8bFwB1itNSemYByjb3RrZPZAxlLgdi6x
	fgvWwmfdI0BwQ18V1da8ygRSRYpT+AlelNIauB5gTi0/iPZwwjMl+lgWEeqQk6VJyGQRH4Uwe9VBL
	SUM9QnqlD2CvYttBvgTkKYfrL+DFwN3l6VZNhCTnsefglvqunDM1NSKjsbqyZ5Sb891iXk5RgpgtW
	XF0KnVLgglL3Fca4SaUUdCGGPkxYdHq4Ocezj3KR+oMXXYHcBpMyKrvcAXndXo5S32JyiWPqmUhHw
	TLzJwXLRFgYmicL1XsWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMDb-00GW6O-GY; Fri, 28 Oct 2022 10:04:03 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooM6s-00GTTB-Jn
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 09:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666951026; x=1698487026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HDOW4KvVqZm7M+oRwyLLXnE8cnS2CkUYQNAOKUB1qEA=;
  b=jRqdHqcx/aR/bij84Bzd1HIN5kpKrBVS7bBSC2/+cto/QOMYEPxGiDwz
   yfusXjdNONcY1dNteLvSg1RNi3XPQg1aJSPq2JUQynfwyMsJDzBFtsfzJ
   Ws1Jy1muSwkseREWSFoGlkB/5ZLn30cRbRvoGffVn7dJlghIfIXMptYdF
   HO9VwhV5hvJfzDe8OxWpS28p8ya0vKmblZ2WwUKE9V2nDy9U4mKRVyUV5
   2tLFlLnHXIHsNQ1oxmBnbPsUdeeufSQflrmonIv3YdJJ9Yd3vwA4QUsYs
   HIztAgSpODBzH4aPknySfKAB7+LXt7qSjN+FWR7BC12qxBP4JkOJvZS2q
   g==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661788800"; 
   d="scan'208";a="214962178"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 17:57:05 +0800
IronPort-SDR: EpTaSDYiopKLHh6wawg6i/B6e7AzwdvUw68NG8JWCKSikQTe3eSkqfnOfqeTwcoXsFuliXsT4r
 /o00k0jLhblYZiGvz0uaioyVQVxQogrKy5rj2rBgc90p/SMQZwvZ3l19kos6iLTcVZAcCtQ1DA
 zznhRzBu80vVVHt4guLotQJ9NYn18NFQnmnMMGf1ElfNqv7fc+OeyiZKnkUlmsYyekJX7lmtGy
 M95hk++p7/onihKI7cjFP7O5IJb3MVs2fLqdo3rSy3wZHug4BneknkBnWrl3frcmSsv9rxRsH8
 qMsTFTdNlHqdRyL1hF0/TUen
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:16:25 -0700
IronPort-SDR: 0/w+qhZizad765dw5jx5c5mxhJVrY4OhmEOfhUvacgVwm2a5lbdNz3AdcXxBzYPGsMFnF82r7F
 bXFLtckayvvuAbInCTgnoA3Sph8SvPV+HlOFbYUmQiPU/8RaXmJzHu/CqMGKaike8S2fcqcYU4
 BfhrMNwmPnlv8w/wS4yoEAqPMPlIc0C3yOu+tDc+PuEfbPKhiMjn5HqyyWxpMvQlbS6Th1Wae3
 53yyCX2PD3dVTvYJ7KyYqI8dw5x4aD0NcUDWdWNWAbRHhRBxH/kGso6abz0UIiwrwEAxVs9N/p
 4nI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:57:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MzHyT1WkTz1Rwtm
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 02:57:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:references:in-reply-to:x-mailer:message-id:date:subject:to
	:from; s=dkim; t=1666951023; x=1669543024; bh=HDOW4KvVqZm7M+oRwy
	LLXnE8cnS2CkUYQNAOKUB1qEA=; b=sAi49Kz2aJYOKZLKyiB/WlLqbdA/IvI1xK
	OBN3BMUWU/e1IBbG+n6Ac+ZZqv+G5mMc1Js/804PxVD4y7APryBjKkSh849VHIcc
	nG0PZChp3RVA8YGzYh0X1Ha/1dDleUur6uepq87pxLK13mEGdf6JAZ9jaNdTnE0i
	NFUaD83Rux/jF5LDGkHT8Lc1SafrYsu3KuGFpuFooVooLgnLcxnK6S4j7V2l6FFX
	kAPK8IsQ/ENXLpif3vkLWEudo6NV1JaLzzENYnjyxnnxeQ3cni0F3GER8FPdqS41
	NT3LgJcWBh2BCp1vKPVeDaSZgJ+IK92VwpME44nP1sYKxpqe/+MA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oQZtcP_aH-WB for <linux-riscv@lists.infradead.org>;
	Fri, 28 Oct 2022 02:57:03 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.50])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MzHyH5rjnz1RvLy;
	Fri, 28 Oct 2022 02:56:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-kernel@vger.kernel.org
Cc: acme@kernel.org,
	dave@stgolabs.net,
	alexander.shishkin@linux.intel.com,
	tglx@linutronix.de,
	namhyung@kernel.org,
	jolsa@redhat.com,
	linux-perf-users@vger.kernel.org,
	acme@redhat.com,
	dvhart@infradead.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	arnd@arndb.de,
	alistair23@gmail.com,
	linux-riscv@lists.infradead.org,
	mingo@redhat.com,
	alistair.francis@wdc.com,
	atish.patra@wdc.com
Subject: [PATCH 2/6] selftests: futex: Call the futex syscall from a function
Date: Fri, 28 Oct 2022 19:56:28 +1000
Message-Id: <20221028095632.1081262-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
References: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_025706_708522_5F51C229 
X-CRM114-Status: GOOD (  16.59  )
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
Message-Id: <20211209235857.423773-2-alistair.francis@opensource.wdc.com>
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
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
