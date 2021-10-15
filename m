Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A83C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 00:57:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31EDD61040
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 00:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31EDD61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ca52GBXR0gfHvVENZL9LtFjnz5D1s0ErL9fHSGEDYIo=; b=pFWBcs0MTEs9SD
	corq8XavMZx+LPRasRhzLZ7U+2yVnP/w96h+/h07ng38l8GGXV5WIaNmm7aI1ZxuV/zUwyzNc8vCv
	LsY8dYGYXmrvhW515hIowpPoYhV8U+aexyeMn9BLelBvFEg+413BFgMHRAuIW1Ss6BZ0fyZWAJt1u
	NSdzyf9mVr5nelQeoHUSMOE+8mYOeroY59z4ED34WJuSyauVbpg98nprqul2EhaNe3V0VtTFqOTAJ
	69eJ5irrpcJ/UKmVPxcsFQ8DtC2MM8gLJuGevPQEn3DqrvSmSEpRC+SrBSwbq8M2+IP6jo+9MhqQY
	jkIcd7EKXCj5cxUJc5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbBWw-004qKo-EE; Fri, 15 Oct 2021 00:57:02 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbBWt-004qIW-9G
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 00:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634259419; x=1665795419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ajpxWkM2yIP2H9kH+vUXn+hMY436patQvCZapiF30NE=;
 b=klfBLA+azDK+BCwRJ40tbXzB1LgYhd+Q4kGqckpOYk20aIO9prMbU4IV
 OnuJyiEQEJkfkeyiU7pVdHmxe6e/v0ZL0Qd/FIXHiE9goEa4i18rmkrvh
 IpCLEZwcRylydxOVvd1+SX1oI78bqhJOfH71sGSZIcONuaYLe7zeZ7qEc
 jDTrBNADbj+IZCvVobGFQahtSsLc6L+1HH4UvjTgeSHHPMyyjjVX1PSVC
 LsAl7xeswJthHJeSjkQh8YVE2WltT88EmFS/DnT7BiETsvfxasbzF5a0x
 jSXpS1ppsI9zJ1xat9qM0eq0bK4yMMnhwpA4hwqrUvyJlbKMm+LGhk8dp w==;
X-IronPort-AV: E=Sophos;i="5.85,374,1624291200"; d="scan'208";a="181920847"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Oct 2021 08:56:57 +0800
IronPort-SDR: aIYMJSE8QtNZw4lrbrAk9s+/C7ZNPFAj/LDlq4mRXYB/IiSdNxj082u0ikOuPoHxaKFhizLJ9T
 Hv0/ABVcOAinqxmz3LAQ0+euIRT8AAHXv5JkVnZd3P+kPKf5pKGZg8S0Cp+0NCCYyL1TERDkTP
 usUaqgMWDAYPid212iJq8pqWhmBb5Sh2hjQehg1WNAnAniE77+/pP68CTxeXNaR5AhSsgRehJl
 AGZQk/T4toiJojTZsp7ur1JViHjOmO3/NtQUNTVw1Q2E8DaywJjFkoU8gXZsr6MsmFYZ+M1mv6
 BMDBxpEuuvq+5OK+6Bw6kl9c
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 17:32:42 -0700
IronPort-SDR: k4V4qu5l766tRXhYL18T85fmBf4noYTnHGPQJMAkEqezMsQc69kL/dsiaavIrGKf4SBfut4/pN
 9J9LjYT/3fJwDy8OuC0IowLnzUMbCPZX6zTx++sUT18EcLkc8MXVT0U1I5m3XOcqVlMYcSqA/L
 f+ZQ92TpZMFwMiDtF0DO4DurvJu8SF5cEpclLSimZDFiaJ4ooQaWEyl0Keb6PaCq4Ew1W50vGp
 w0BYVDw3oyWqprvK2TiNghrVuIPx3fmnamn3dt/97eDg8d6PAPSyLFIUPZlV3xB7pv4VM0SXE+
 o5c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 17:56:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HVnsj2BXYz1SHvt
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 17:56:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1634259416;
 x=1636851417; bh=ajpxWkM2yIP2H9kH+vUXn+hMY436patQvCZapiF30NE=; b=
 ZEH/bLcY/8miP7Yw2wNjprA79S3EHGCRVhsulSOfMaaqf4s3N8NE+brYEXo9QSTH
 wmdUVXSk0O0cMyHRKJ49B5Mt6YT7SCsPzHRklNckyi/clcEov+UsXbVLvP/K6waE
 r0a3PaOmYfxk5IqMVp8iVN0pPQpc3/zx8GosFFalEkNO75btX/iOuxubWSodkrRi
 HpfCcOCI0cS5YufAbHgs1JOqAC13FRjBYpTlqBc2THmjOLZ5zq3hEqFJtkesPGGY
 /MwR9Xp/nQ1oPGoLItv5eZvGCxXox76AST2jgVfB04QVCxQLlU/4fTvb8HU+p0mm
 41l+ZxOzhYVrOIT83y7Baw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id b-7RpSMh_pAf for <linux-riscv@lists.infradead.org>;
 Thu, 14 Oct 2021 17:56:56 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.37])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HVnsS4Xfgz1RvTg;
 Thu, 14 Oct 2021 17:56:43 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 1/2] perf bench futex: Use a 64-bit time_t
Date: Fri, 15 Oct 2021 10:56:33 +1000
Message-Id: <20211015005634.2658470-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_175659_450690_531BF73F 
X-CRM114-Status: GOOD (  16.09  )
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
 tools/perf/bench/futex.h | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index b3853aac3021c..b9665d43d2988 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -12,6 +12,7 @@
 #include <sys/syscall.h>
 #include <sys/types.h>
 #include <linux/futex.h>
+#include <linux/time_types.h>
 
 struct bench_futex_parameters {
 	bool silent;
@@ -27,12 +28,14 @@ struct bench_futex_parameters {
 	unsigned int nrequeue;
 };
 
+#define timespec64 __kernel_timespec
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
@@ -47,15 +50,26 @@ struct bench_futex_parameters {
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
@@ -74,7 +88,7 @@ futex_wake(u_int32_t *uaddr, int nr_wake, int opflags)
  * futex_lock_pi() - block on uaddr as a PI mutex
  */
 static inline int
-futex_lock_pi(u_int32_t *uaddr, struct timespec *timeout, int opflags)
+futex_lock_pi(u_int32_t *uaddr, struct timespec64 *timeout, int opflags)
 {
 	return futex(uaddr, FUTEX_LOCK_PI, 0, timeout, NULL, 0, opflags);
 }
@@ -111,7 +125,7 @@ futex_cmp_requeue(u_int32_t *uaddr, u_int32_t val, u_int32_t *uaddr2, int nr_wak
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
