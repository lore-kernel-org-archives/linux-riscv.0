Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEE2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 05:56:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA9E610CB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 05:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FA9E610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFebYpxo51233gQeoaZb5ItrhgEdeLmplZAEWEnwjv8=; b=RSjmr6tGzyDZb+
	jAgOiV/z66KxA5gMpB332EMoS2SYkf9l+n36N/0xd13u7mwKLtd8GGCnZAadMZEFZzcjksxt/n40A
	JEHu9BKcGqjsrInmwRZVFXaIosno8KOlZDdlFeYYjFOjZddpj6iD8j0K6guRCVfop/D946OQVhy48
	vNmkgNEZb+dvf9jm7+kok0U5qe7t8owD2NF7CqEocpLoO/blft3HowQ9qo72kohNkBu3P/pU9+RLB
	Bi7ltrnS0t8Pnbu9/NCfHJuU+SPnyuAcBI1ECdmf+I/OT698u1GZvmt/FYhr67dU8FocUpjn/ySSt
	twSGa/uLgCxL8gfuqi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1matit-001eQB-9j; Thu, 14 Oct 2021 05:56:11 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1matiq-001ePE-Bz
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 05:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634190967; x=1665726967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sf+179vW/iQYlKmtz8f0y7xIP3dUveU16tfuDHqj1X0=;
 b=QTT7P1ekMqg82WISG+Ae6uL+sp3gcGWYDTX0S/eLP8f/vFmjpwJcudjH
 VAzbPK5PkNqc+nBYgn7MJh4XqIOUFRRdLdgj4iSrb5OB6YeNV1jpYavbS
 oq3LqfUXWM+lBQS/UqEgHW88hwOfYoe44SLD8K/tBNGbhJCaXuQA2zYp7
 pVz1GiRitSIt4InlXzey11cnSN9RCYItrO1QlEsHpTT8XDmWzNLdLLt1P
 oFTkTvJNGWUj1Nt3UUrsW15Plm4etqz1awaaLnvq0bxOAVqgoA4xUoa7u
 T+spB34sKxTVRAar1pGBOUZ3kXwpIcIRJDp+gK/dhB6q8TYf7rZKAONf/ Q==;
X-IronPort-AV: E=Sophos;i="5.85,371,1624291200"; d="scan'208";a="182812889"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2021 13:56:07 +0800
IronPort-SDR: U/Xu4u1Jd/b97tJsvrIy+q5ZqXqJMMA0f+VwxVv8+Hag4HUaeP77A1X7v2gfqd+vrE7WeS846e
 3dTvplLNrzIVKwc5EKKidy625AkwKFr4GpTJEcbWjpVAdeJc1NQVUwKf9Da/CNdcrTG0up6l19
 KzJDZAVZTaqaXxhZdCvrWkCwHisIaM7+WCgKOyFfxj3oW37bmvUXN7wZMgzSbRKGiOWcCDH83M
 mXvzDXnktycZZkW2mYUsm2Vjq7pOeSDx/hJC6Tf68RrkxfuYqi0Sb8DamldV3t7w+hILm61PjT
 CX2gyLmu3jgSsF1D8uVWfdUY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 22:30:20 -0700
IronPort-SDR: D+B+Tvd6dT0iy18OrqnqJMUabAUw2fckviX5TMBOd4/7gtEwcvl3t3V8iw3bc22GhHfNV/8jWo
 VNpGQi6QkSH4qI06D9zOQIbMTefwMWfwqs0JBpwUkUB4kg7KQXRzs9RXX5iSCxPHdkg5KIDqtM
 hkFrb8oXLYRwuDJsXGdoFweBMIddT4XUCISM9gxdI7Et+F4Jh6KxugVq8MGyIMIwJEeNXOMfEX
 0sfiZXCZnCW5XNNdTsOesNpCYtOaqSN0KfhYwyOoENoZmWjxhi1pmzookbZRcgJ/pvTLD/JeMp
 n4g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 22:56:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HVJYM18Zxz1RvlM
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 22:56:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634190965; x=1636782966; bh=Sf+179vW/iQYlKmtz8
 f0y7xIP3dUveU16tfuDHqj1X0=; b=hC46IN7cy5gRrX4LT14zPDnZWoNyg48Yal
 2OfYpq+jCdC0M1FUwYdvCamDDUARVTRbvzae9xDK0xF1mp7LR3eBeGdbhK7m7L7P
 EQ7vprUmO0CUhi5sOAR8k2bEfMCoWbOxg0vJqYkkWWPInFPrt4cjfZe/NK6k3H6H
 sEqOdz8yLwvULfkxGhGdIEoa0cLgEBV4KMav/t4gjdFZZBhy2NzrqdcsYOAip/Gy
 JNmavE6kkozByqzIoVNJU0M4XAlYq2dmTyht0FoPtH3D0xMoHZACwmOnQxQsnWdT
 8Ywzr39lIz/qG/H6uCEygHC7ez+mnvUCafFqhMOiKTh+6E7i/fTg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id F7-7UmHsNmWR for <linux-riscv@lists.infradead.org>;
 Wed, 13 Oct 2021 22:56:05 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.36])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HVJY54SCtz1Rvlw;
 Wed, 13 Oct 2021 22:55:52 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/2] selftests: futex: Use a 64-bit time_t
Date: Thu, 14 Oct 2021 15:55:27 +1000
Message-Id: <20211014055527.1238645-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014055527.1238645-1-alistair.francis@opensource.wdc.com>
References: <20211014055527.1238645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_225608_433160_9AF47098 
X-CRM114-Status: GOOD (  21.93  )
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

Convert the futex selftests to only use a 64-bit time_t. On 64-bit
architectures this isn't a functional change. On 32-bit architectures
we now only perform 64-bit time_t syscalls (__NR_futex_time64) and
use a struct timespec64.

This won't work on kernels before 5.1, but as perf is tied to the kernel
that's ok.

This allows the tests to run and pass on RISC-V 32-bit.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../futex/functional/futex_requeue.c          |  2 +-
 .../futex/functional/futex_requeue_pi.c       |  6 +--
 .../selftests/futex/functional/futex_wait.c   |  2 +-
 .../futex_wait_private_mapped_file.c          |  2 +-
 .../futex/functional/futex_wait_timeout.c     |  8 ++--
 .../futex/functional/futex_wait_wouldblock.c  |  2 +-
 .../selftests/futex/include/futextest.h       | 39 +++++++++++++++----
 7 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/tools/testing/selftests/futex/functional/futex_requeue.c
index 51485be6eb2f1..f51aedffcd161 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue.c
@@ -27,7 +27,7 @@ void usage(char *prog)
 
 void *waiterfn(void *arg)
 {
-	struct timespec to;
+	struct timespec64 to;
 
 	to.tv_sec = 0;
 	to.tv_nsec = timeout_ns;
diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 1ee5518ee6b7f..497c0dc80916f 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -48,7 +48,7 @@ static int locked;
 
 struct thread_arg {
 	long id;
-	struct timespec *timeout;
+	struct timespec64 *timeout;
 	int lock;
 	int ret;
 };
@@ -281,7 +281,7 @@ int unit_test(int broadcast, long lock, int third_party_owner, long timeout_ns)
 	struct thread_arg blocker_arg = THREAD_ARG_INITIALIZER;
 	struct thread_arg waker_arg = THREAD_ARG_INITIALIZER;
 	pthread_t waiter[THREAD_MAX], waker, blocker;
-	struct timespec ts, *tsp = NULL;
+	struct timespec64 ts, *tsp = NULL;
 	struct thread_arg args[THREAD_MAX];
 	int *waiter_ret;
 	int i, ret = RET_PASS;
@@ -290,7 +290,7 @@ int unit_test(int broadcast, long lock, int third_party_owner, long timeout_ns)
 		time_t secs;
 
 		info("timeout_ns = %ld\n", timeout_ns);
-		ret = clock_gettime(CLOCK_MONOTONIC, &ts);
+		ret = gettime64(CLOCK_MONOTONIC, &ts);
 		secs = (ts.tv_nsec + timeout_ns) / 1000000000;
 		ts.tv_nsec = ((int64_t)ts.tv_nsec + timeout_ns) % 1000000000;
 		ts.tv_sec += secs;
diff --git a/tools/testing/selftests/futex/functional/futex_wait.c b/tools/testing/selftests/futex/functional/futex_wait.c
index 685140d9b93d2..d1c8a4212c74c 100644
--- a/tools/testing/selftests/futex/functional/futex_wait.c
+++ b/tools/testing/selftests/futex/functional/futex_wait.c
@@ -30,7 +30,7 @@ void usage(char *prog)
 
 static void *waiterfn(void *arg)
 {
-	struct timespec to;
+	struct timespec64 to;
 	unsigned int flags = 0;
 
 	if (arg)
diff --git a/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c b/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
index fb4148f23fa37..5e84e136ad99e 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
@@ -38,7 +38,7 @@ futex_t val = 1;
 char pad2[PAGE_SZ] = {1};
 
 #define WAKE_WAIT_US 3000000
-struct timespec wait_timeout = { .tv_sec = 5, .tv_nsec = 0};
+struct timespec64 wait_timeout = { .tv_sec = 5, .tv_nsec = 0};
 
 void usage(char *prog)
 {
diff --git a/tools/testing/selftests/futex/functional/futex_wait_timeout.c b/tools/testing/selftests/futex/functional/futex_wait_timeout.c
index 1f8f6daaf1e70..86b1e847a0246 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_timeout.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_timeout.c
@@ -71,11 +71,11 @@ static void test_timeout(int res, int *ret, char *test_name, int err)
 /*
  * Calculate absolute timeout and correct overflow
  */
-static int futex_get_abs_timeout(clockid_t clockid, struct timespec *to,
+static int futex_get_abs_timeout(clockid_t clockid, struct timespec64 *to,
 				 long timeout_ns)
 {
-	if (clock_gettime(clockid, to)) {
-		error("clock_gettime failed\n", errno);
+	if (gettime64(clockid, to)) {
+		error("gettime64 failed\n", errno);
 		return errno;
 	}
 
@@ -93,7 +93,7 @@ int main(int argc, char *argv[])
 {
 	futex_t f1 = FUTEX_INITIALIZER;
 	int res, ret = RET_PASS;
-	struct timespec to;
+	struct timespec64 to;
 	pthread_t thread;
 	int c;
 
diff --git a/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c b/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
index 0ae390ff81644..76faa664544d6 100644
--- a/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
+++ b/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
@@ -38,7 +38,7 @@ void usage(char *prog)
 
 int main(int argc, char *argv[])
 {
-	struct timespec to = {.tv_sec = 0, .tv_nsec = timeout_ns};
+	struct timespec64 to = {.tv_sec = 0, .tv_nsec = timeout_ns};
 	futex_t f1 = FUTEX_INITIALIZER;
 	int res, ret = RET_PASS;
 	int c;
diff --git a/tools/testing/selftests/futex/include/futextest.h b/tools/testing/selftests/futex/include/futextest.h
index ddbcfc9b7bac4..72361b41cdbae 100644
--- a/tools/testing/selftests/futex/include/futextest.h
+++ b/tools/testing/selftests/futex/include/futextest.h
@@ -47,12 +47,17 @@ typedef volatile u_int32_t futex_t;
 					 FUTEX_PRIVATE_FLAG)
 #endif
 
+struct timespec64 {
+	long long tv_sec;       /* seconds */
+	long long tv_nsec;      /* nanoseconds */
+};
+
 /**
  * futex() - SYS_futex syscall wrapper
  * @uaddr:	address of first futex
  * @op:		futex op code
  * @val:	typically expected value of uaddr, but varies by op
- * @timeout:	typically an absolute struct timespec (except where noted
+ * @timeout:	typically an absolute struct timespec64 (except where noted
  *              otherwise). Overloaded by some ops
  * @uaddr2:	address of second futex for some ops\
  * @val3:	varies by op
@@ -67,15 +72,35 @@ typedef volatile u_int32_t futex_t;
  * These argument descriptions are the defaults for all
  * like-named arguments in the following wrappers except where noted below.
  */
-#define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
-	syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
+/**
+ * We only support 64-bit time_t for the timeout.
+ * On 64-bit architectures we can use __NR_futex
+ * On 32-bit architectures we use __NR_futex_time64. This only works on kernel
+ * versions 5.1+.
+ */
+#if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
+# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
+	syscall(__NR_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
+#else
+# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
+	syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout, uaddr2, val3)
+#endif
+
+static inline int gettime64(clock_t clockid, struct timespec64 *tv)
+{
+#if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
+	return syscall(__NR_clock_gettime, clockid, tv);
+#else
+	return syscall(__NR_clock_gettime64, clockid, tv);
+#endif
+}
 
 /**
  * futex_wait() - block on uaddr with optional timeout
  * @timeout:	relative timeout
  */
 static inline int
-futex_wait(futex_t *uaddr, futex_t val, struct timespec *timeout, int opflags)
+futex_wait(futex_t *uaddr, futex_t val, struct timespec64 *timeout, int opflags)
 {
 	return futex(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
 }
@@ -95,7 +120,7 @@ futex_wake(futex_t *uaddr, int nr_wake, int opflags)
  * @bitset:	bitset to be used with futex_wake_bitset
  */
 static inline int
-futex_wait_bitset(futex_t *uaddr, futex_t val, struct timespec *timeout,
+futex_wait_bitset(futex_t *uaddr, futex_t val, struct timespec64 *timeout,
 		  u_int32_t bitset, int opflags)
 {
 	return futex(uaddr, FUTEX_WAIT_BITSET, val, timeout, NULL, bitset,
@@ -118,7 +143,7 @@ futex_wake_bitset(futex_t *uaddr, int nr_wake, u_int32_t bitset, int opflags)
  * @detect:	whether (1) or not (0) to perform deadlock detection
  */
 static inline int
-futex_lock_pi(futex_t *uaddr, struct timespec *timeout, int detect,
+futex_lock_pi(futex_t *uaddr, struct timespec64 *timeout, int detect,
 	      int opflags)
 {
 	return futex(uaddr, FUTEX_LOCK_PI, detect, timeout, NULL, 0, opflags);
@@ -183,7 +208,7 @@ futex_cmp_requeue(futex_t *uaddr, futex_t val, futex_t *uaddr2, int nr_wake,
  */
 static inline int
 futex_wait_requeue_pi(futex_t *uaddr, futex_t val, futex_t *uaddr2,
-		      struct timespec *timeout, int opflags)
+		      struct timespec64 *timeout, int opflags)
 {
 	return futex(uaddr, FUTEX_WAIT_REQUEUE_PI, val, timeout, uaddr2, 0,
 		     opflags);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
