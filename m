Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7768DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 05:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3136B610CB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 05:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3136B610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a/wmq+zTzcEsykqwT0x5bCBcQhMCWlAz/8tYe7kJOsU=; b=JO0ROg6EahmTKH
	HTPre3vb++1StrWx2EPuR/xq2IeX9WOM1A0H0n9KttWeYz/0pOvpGefUTrnPvS3bagmiXULekzuGX
	cNiR0HdAzrGr2jnhhoNT9XeGgCUyRNGBjqPJ0ez6IlemjXCE2wSL3J1Hjbu1yMCIUy2B8/+A9BFBR
	I3OVm8HyBYvPFLha7ZLp8RC5du3flRHIhco/ydre/VFsW3Rd1l+bFnqncjT492HlrYUeewDl49Qqm
	zRGlNvxPNFN/0qEt24jUXBp1kwwkSEVwa9MaLRNtK6qXtchN7VddMOYPBbOA/CI5Rxu4BJyJrcYk7
	eYPQp/M4zowj3N4wj36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1matii-001eNu-FN; Thu, 14 Oct 2021 05:56:00 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1matif-001eNL-Nc
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 05:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634190957; x=1665726957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+HCVwpWd7xwx2tp3UxxXqvcw+GKWRQ+CHp15VqQlxB0=;
 b=YgYEr5L5tCy0W3i1P4PpNBL7wOffuk5b+Mp3P9IOnG2Y6etfPrd21IlC
 MzL9YwtsNZHxR69CGdgpEWwGNZEi68eAhOEkPm+HWqe8s/uo8HMA9LFv0
 WioWbCtXYLbMTRpocIhWpkS7pvhSmX/2qgI0hprqnTYe9I9m0lTK0kZMs
 5aW7WL49PxS7BFb+ehDFNiyViGkOwY/ii5ky9JlPewJRl9aP/HsURjUHk
 9G0S06ywy2hnJIeNyM/rK3ramt5/688h8pck02zJTDVX/kstzR1AnwDVo
 ufMNwQ0AyQ6QdwQNVnzVv4vKvi6X/fVAv9XO9ZxFs4tFwMqBGOk+msrd3 g==;
X-IronPort-AV: E=Sophos;i="5.85,371,1624291200"; d="scan'208";a="182812870"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2021 13:55:53 +0800
IronPort-SDR: N1Xt4/oFrGkxkE5QLzjc5KQIP3DpcDCQcMRHWcKBIo4R2gMjoUDOu7x31+NmNqNf+WtMzZk1ff
 nJji4DfD8WndHvOt/DfmdVCQSScNaBCN151xtrPVG3JjixtGVsejYui5vJpqJVPFMkMB4MGjoP
 Z4PvUWc+M+K/HIvfbF1bTpmOcXa2qVFduimYpIr5RWsc22z8WFXsYZ54LOAbpozBv57P3dS/vO
 CeEmfaz7s530xUeifZ4NfaIcgExXuWy1auOPJzqmifDsWcs62YpYq2RWTIiRTNtDCIG8RBSnKJ
 awfsW9Dfj/bWQN22R+RiWrH1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 22:31:39 -0700
IronPort-SDR: Cdv67FgDPL3Kwu//yWrDw2gwQFIWp6boGBfCrXbtyVuUwnjw3PolBAew4gTlDrcRFBc6eXK6qh
 abR2ggCCrt8pNyRohPvX6JM1kHKFACVwkjoTN3NQ9p4SACsAR13q75jeg72+gW1THUCJsZIqMN
 9P9Vf+uNIxgWzF5zp7oGgPDUsbaP/bI8BPdfNO6ZWIjSE667MpY3ANxd1wXGCwBrgoynQ8TrgX
 7UBRB31xpDqxDYzyV8CEpkvNV106Raf0rzJNizqD/ckFAtCBGdseqes4VA/7/I6gkEGlqPOnrM
 PmY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 22:55:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HVJY55krXz1SHvt
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 22:55:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1634190952;
 x=1636782953; bh=+HCVwpWd7xwx2tp3UxxXqvcw+GKWRQ+CHp15VqQlxB0=; b=
 Oa6NANX0VpnF6AbmrgxFK0kHGtaTzTxcrWrKW24+VVua0fH4L3BZDdWiXlEuYqe/
 ns4hM03IV66LoYvee3A21+SmPpnEnuug0mhkrI7P52PX7pbgZDcT3IPCtOCGX4gk
 YhAAlfziW59SJ50+5RsJ4QLtTCCN6rhaef4RWuUVPv4+mFq928hwo1O0f++AeVIH
 05q5m7g6k4S7RW05jZcHvYnd7nN8ZHiVz3RFqOGNhq89j2LJXTe9I5go7o4JGvao
 lxZ+/9Tjjg+e+SptyYi4pyTMFBsqRM/i8sTGfq8rvkidA2J+kP0Pe3sQlB1qK803
 55C6MxoOmKRIyVPA7s8lOQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id a2meP11RN8Dx for <linux-riscv@lists.infradead.org>;
 Wed, 13 Oct 2021 22:55:52 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.36])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HVJXs25dqz1RvTg;
 Wed, 13 Oct 2021 22:55:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/2] perf bench futex: Use a 64-bit time_t
Date: Thu, 14 Oct 2021 15:55:26 +1000
Message-Id: <20211014055527.1238645-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_225557_910788_138F2BE8 
X-CRM114-Status: GOOD (  16.02  )
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

Convert tools/perf to only use a 64-bit time_t. On 64-bit architectures
this isn't a functional change. On 32-bit architectures we now only
perform 64-bit time_t syscalls (__NR_futex_time64) and use a struct
timespec64.

This won't work on kernels before 5.1, but as perf is tied to the kernel
that's ok.

This allows us to build perf for 32-bit architectures with 64-bit time_t
like RISC-V 32-bit.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tools/perf/bench/futex.h | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index b3853aac3021c..c1ca75657c32e 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -27,12 +27,17 @@ struct bench_futex_parameters {
 	unsigned int nrequeue;
 };
 
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
  *		otherwise). Overloaded by some ops
  * @uaddr2:	address of second futex for some ops
  * @val3:	varies by op
@@ -47,15 +52,26 @@ struct bench_futex_parameters {
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
+#if __BITS_PER_LONG == 64 || defined(__i386__)
+# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
+	syscall(__NR_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
+#else
+# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
+	syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout, uaddr2, val3)
+#endif
 
 /**
  * futex_wait() - block on uaddr with optional timeout
  * @timeout:	relative timeout
  */
 static inline int
-futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec *timeout, int opflags)
+futex_wait(u_int32_t *uaddr, u_int32_t val, struct timespec64 *timeout, int opflags)
 {
 	return futex(uaddr, FUTEX_WAIT, val, timeout, NULL, 0, opflags);
 }
@@ -74,7 +90,7 @@ futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
  * futex_lock_pi() - block on uaddr as a PI mutex
  */
 static inline int
-futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
+futex_lock_pi(u_int32_t *uaddr, struct timespec64 *timeout, int opflags)
 {
 	return futex(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
 }
@@ -111,7 +127,7 @@ futex_cmp_requeue(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2, int nr_wak
  */
 static inline int
 futex_wait_requeue_pi(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2,
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
