Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53876C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 00:57:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1571B610EA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 00:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1571B610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZdgcs9YvYPK1lQu9LOuTjQqI2aXKUoZGiTS7CnQKVw=; b=BTaci7OvxOcuqd
	p6GidL91HhnU8NzLk10wOsk12zcgHmzf7A9cKlvEtC0Cdn0i8ZYRA78z4maWgUf1o6HjiO/jp1wlY
	FPZ7Ibc8O7wzA/Iaf9cOB/uTSukh1rSxAQTorS+QRfMDkbDZvFeXgBlpjI6OE8V+g0o+1mdIPhR+J
	Gy0Lr24I+Swsdxc6jDVFLLwEQV6NTUf7LcDlghLtFstawY8ui8dGM/twp6bhu6Ud7JBMqtNcpf9Ud
	gGl1XWjrucACK8fib9yGkuMOL8S+SMKCP9yeNEY84kIcmJ0urCLhoAfw1EcTGWVcLFZHAleNn+dkz
	U7fQDXRE/HymeBRJb+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbBXH-004qRy-GX; Fri, 15 Oct 2021 00:57:23 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbBX6-004qOG-4K
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 00:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634259432; x=1665795432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vox09O8iJZNJFD6HnQqSS+dhijYiK6HKhu64AHS7bHs=;
 b=gby51aW2D9KaKV7y9391z3AGEMPHOBItaVBEsYwBP2u/nlzMT3m6ZNCO
 YklwKDnot2u8s777OvpPjihrL2Bq8mJxfQPPhPy+eJS0eZSsMTY1bV7yt
 Yqcg8SHfQaYPFGdnMC0paNHk+M0722gnftiitDxev4lMI5m9bB0jq9Sgr
 yHTXLc/8YJCpVi5vzLp77khjHmx7wCiLYXKPU4gjnRrE9TNdaPO+VhsCW
 Lmd+T6KQa0yk1jCYMJkK+sXhwsDZ915Hh7EibzP4LASj9KtSWG9Cuqc2X
 JVUFHX9AUb1yHQ7FVY8RP0YRXJ/CS4b65eXsNPg8jQvX4qBUCGp5bQnLF g==;
X-IronPort-AV: E=Sophos;i="5.85,374,1624291200"; d="scan'208";a="183842806"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Oct 2021 08:57:11 +0800
IronPort-SDR: haaWeAXL21bEVMt7TTlQu7dalaUmWKf8yVK6b0G6JFtF1Q/ZogZ/Zfl/NmHHhXVkfte+5W0kAa
 YYovxqk5witnti7Mb5vp1D3f9eheGEpQq5Aj7Dc2OhPjCY0uGIKaYoEAUHzOEWDCvU09a+m3Qr
 h/06nWegN+3ZNwtCi6oCPq9WJaSst2KyKA2vrUXKRPYmOxcaTBdIZoLLs+QZmxL5Ol/DiAYCET
 xx5prPIn1lZ+R4fArdFBOn9okGigdg3oRMqszigdgUp3sfbBEfQ70u9ED3EWRbXK9we1lafz7M
 5JznSLqIWesMFmyf6Eg4beeV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 17:31:22 -0700
IronPort-SDR: pwOfKv1uRZ48O0dzGQ6Yvatvc7GR4Jf+l0zW7e54N1BO4Wiuzvzh3CZk33qlSql7PUeZS+E+/p
 Vdf55xp+CulMAn60+vBbAn/u4nLn41yMW4tJq3ZCPTO7cBfJQVXwfaAxprbihlnZnyAXBqWBQI
 tb0+gD8QUG90y6n/h2HWlW6uOQqgAOCmtt14cipsnx292Z+iEfStvL7vcRNZTUfh5CO4ZEE/KC
 V67NE9DZF53Ji2Pxb6YeachX1NznpGRTJn5i71OXDFia9PiGapBwS6kWQx9Wy2384LOSTqxwIU
 uUo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 17:57:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HVnsy23pmz1RvlM
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 17:57:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634259428; x=1636851429; bh=vox09O8iJZNJFD6HnQ
 qSS+dhijYiK6HKhu64AHS7bHs=; b=VmvreB8M797gFnF1vsWLSqll7HLmf9ylg/
 t/c5zxAas4brEoT1j3KqTfDAACztLUgQmCp05JUZFCuHFdfHmEukjpIRyctJGM4g
 cMQp9lAfzKYJryypmWQBwYVo7CL8Uxt20z5TrkBR7mjS5op+F3NYOlu6pvZq5Hb7
 EkC7ZuW8qrchojxCq6mOtwfj53i2+qf+BXVn30JuiSc7JuaOK/seXAqeZdlSJhKv
 vQIB2QyFJCoDNLqLUby4PQMDqk+0QoICiOWFIiOQoEx/5afiBEsGM/cYsuDtosid
 Xl7nLviwB3E8SqTtxXQ8gRecocdhDv71y2OqErY5fiNxfZfQ1mmA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id hnulFYjFbEZZ for <linux-riscv@lists.infradead.org>;
 Thu, 14 Oct 2021 17:57:08 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.37])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HVnsj1CGPz1Rvlg;
 Thu, 14 Oct 2021 17:56:56 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 2/2] selftests: futex: Use a 64-bit time_t
Date: Fri, 15 Oct 2021 10:56:34 +1000
Message-Id: <20211015005634.2658470-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
References: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_175712_332173_D432974A 
X-CRM114-Status: GOOD (  23.69  )
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
 .../futex/functional/futex_requeue_pi.c       | 10 ++---
 .../selftests/futex/functional/futex_wait.c   |  2 +-
 .../futex_wait_private_mapped_file.c          |  2 +-
 .../futex/functional/futex_wait_timeout.c     |  8 ++--
 .../futex/functional/futex_wait_wouldblock.c  |  2 +-
 .../selftests/futex/include/futextest.h       | 37 +++++++++++++++----
 7 files changed, 43 insertions(+), 20 deletions(-)

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
index 1ee5518ee6b7f..32d6ee554ec2e 100644
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
@@ -290,12 +290,12 @@ int unit_test(int broadcast, long lock, int third_party_owner, long timeout_ns)
 		time_t secs;
 
 		info("timeout_ns = %ld\n", timeout_ns);
-		ret = clock_gettime(CLOCK_MONOTONIC, &ts);
+		ret = gettime64(CLOCK_MONOTONIC, &ts);
 		secs = (ts.tv_nsec + timeout_ns) / 1000000000;
 		ts.tv_nsec = ((int64_t)ts.tv_nsec + timeout_ns) % 1000000000;
 		ts.tv_sec += secs;
-		info("ts.tv_sec  = %ld\n", ts.tv_sec);
-		info("ts.tv_nsec = %ld\n", ts.tv_nsec);
+		info("ts.tv_sec  = %lld\n", ts.tv_sec);
+		info("ts.tv_nsec = %lld\n", ts.tv_nsec);
 		tsp = &ts;
 	}
 
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
index ddbcfc9b7bac4..67ed97a455274 100644
--- a/tools/testing/selftests/futex/include/futextest.h
+++ b/tools/testing/selftests/futex/include/futextest.h
@@ -21,6 +21,7 @@
 #include <sys/syscall.h>
 #include <sys/types.h>
 #include <linux/futex.h>
+#include <linux/time_types.h>
 
 typedef volatile u_int32_t futex_t;
 #define FUTEX_INITIALIZER 0
@@ -47,12 +48,14 @@ typedef volatile u_int32_t futex_t;
 					 FUTEX_PRIVATE_FLAG)
 #endif
 
+#define timespec64 __kernel_timespec
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
@@ -67,15 +70,35 @@ typedef volatile u_int32_t futex_t;
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
+#if __BITS_PER_LONG == 64
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
@@ -95,7 +118,7 @@ futex_wake(futex_t *uaddr, int nr_wake, int opflags)
  * @bitset:	bitset to be used with futex_wake_bitset
  */
 static inline int
-futex_wait_bitset(futex_t *uaddr, futex_t val, struct timespec *timeout,
+futex_wait_bitset(futex_t *uaddr, futex_t val, struct timespec64 *timeout,
 		  u_int32_t bitset, int opflags)
 {
 	return futex(uaddr, FUTEX_WAIT_BITSET, val, timeout, NULL, bitset,
@@ -118,7 +141,7 @@ futex_wake_bitset(futex_t *uaddr, int nr_wake, u_int32_t bitset, int opflags)
  * @detect:	whether (1) or not (0) to perform deadlock detection
  */
 static inline int
-futex_lock_pi(futex_t *uaddr, struct timespec *timeout, int detect,
+futex_lock_pi(futex_t *uaddr, struct timespec64 *timeout, int detect,
 	      int opflags)
 {
 	return futex(uaddr, FUTEX_LOCK_PI, detect, timeout, NULL, 0, opflags);
@@ -183,7 +206,7 @@ futex_cmp_requeue(futex_t *uaddr, futex_t val, futex_t *uaddr2, int nr_wake,
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
