Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1EDC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h1gApugHFTqOFBI2ZfvLZtP9drQPzqrn28OirpNtFkQ=; b=uV+ZXnq6XOTHqz
	nl9tRakhWpAL4THernSMoYCIypIKtLrftXDAzz9+XUNT+vOAjGZIa3cJyDy/clBZ4zJwRVP+jICkx
	3hCsRubDrhO6AqrKFHqNynFNIonZ7ZcmIX9vRKLh0M2MDbnnbrKaiVCubhNBv7MmiOmv182tg4gdX
	03GFfy1/Pk25e+Y3/6wSUcQ2ggz+PFW65W82I0tqiYxNa3PTEuwYfYDur6/cKgiFWUzH/mvQjesuy
	L9PekUp8yuitZbA3qwAkuLG1bDbhQLUU2Zj0bBO5PqTDYABbZDN4jd7MmgcTBSaoU2GeX/2eaE2Wk
	OILkE0eNpym0Zxd85eIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msk5b-00ByAa-8l; Thu, 02 Dec 2021 11:17:23 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msk5Z-00By9u-0t
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 11:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638443840; x=1669979840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cnkxM+v3e7Rw5Wac6Yp3jXRam56qrhimBukSct1R/EI=;
 b=my+htRQEW6iIVN31fGy5tmer9/uBMs0FDJH59hLD8SBrrP85WfNbl0YA
 SKxNWj1+MWpzzyNwj9kUc0Mz8aKBuTwBogyN9suJxpP9L6D8ODmCIrJ9o
 CbykwxkdtPMkc3kzxzOEs5xDkrG0Aj4M5HcP+Muiyg+5bhT9mEs1CDI04
 9n/51vPIc8QvnPcTWC5ZvV2+jDhQWvjedeugk5obHkYK0rP8tEFPqtFSB
 K10GNDCmoKyA/LpfCc4eOT3CRyzvk/L1FKIO9+BbwBEOy/2s335qhjsL4
 NscDxlgQ5IOyGsOFbYE4BJ8ZOG7UWXf+Wg8Nrbt5jIqjROs/kSyqLoDWG g==;
X-IronPort-AV: E=Sophos;i="5.87,281,1631548800"; d="scan'208";a="291238379"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2021 19:17:18 +0800
IronPort-SDR: aUEuzoyxwKWwmFkS3tdxpFFj8AfUmpRco20fMlHg7Hf6R8VxMuJ8SheHTFwsrxzWkr/sBO8d6r
 eM5A6mj7SDvo3Q7bNHQe97kuhfOhoxsL2Un8kewkLUZX1EREGXpT1Yh3bqZPzNjRRLMh/jHdAD
 Nepy+hBCdZLjdz/XUnh+Sb/vWNckPEUW+UB+f9mjuOQ2THi44FOPmMOVskyihsAxaIMxkkb2//
 rY26aNS1OLG1IFkKBYxrVg9XkBqoyvKT4RZZJej6SxHonst2Q3qaZDxxN1FMAzuTR8jkcKgLBy
 PGsMqanfq2AnybjGHsjTm36Z
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 02:50:29 -0800
IronPort-SDR: R0ud1FUqovaKGN0aetvUltDdatBPmyo1BChtkYF4+B7jm/V/jLpfG5WcyYEVyLAJMv0bt/sDOY
 fpypGRolK4QmII0wjybUDc8N45h1xlM+dbUQ19+qY3JMERi2oDO1+Gn/4mrnBhOA6gsXX3VJlk
 ga9C6BJ2M61/xilg9aajQC29+yB8OxwJb9aWEW7+P6nImh4DO7lF0IO+ewngFFH4cFfDj9NBjF
 9L2b2YVrn9WcgfV14ORi3dZSui+EJ990EnyngTZ1y64h0BBAupGQlUf7TEZ7W06hVlRZLJPuy0
 otI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 03:17:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J4YML4dXyz1Rx10
 for <linux-riscv@lists.infradead.org>; Thu,  2 Dec 2021 03:17:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1638443836;
 x=1641035837; bh=cnkxM+v3e7Rw5Wac6Yp3jXRam56qrhimBukSct1R/EI=; b=
 NvOX2HEUID+K9U/so1rCf3rt2od4i2D5D8/9KReU2Gzgn+rYbD1QBg12XrmxeN+5
 UajHyKG/Lg/9QyhVEAlDkyNy86gyogoJxBh/gvKWiEEX/XKEdfJRe4DMACztqDzy
 6Jx/frBFwSNaokMKMe2EzULbRiRoTaGp3T54dTOfhqvIK0DnKiuGn5uuxmdOETVw
 1TRdcCr6aNL4vkoMePsDpStDYGurY3GCbLkjS8AZ5sO86ukxYsHLj2iHYeipJIgw
 EqVcCUX5TTEE4ms3zDEWJxgdESrjz9y0AGgV4jdw7rFzuN9blRh45pdLKARuxpXy
 /25lvYU7EF4mLMAK2/4nNQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 4ywy-P5A2S58 for <linux-riscv@lists.infradead.org>;
 Thu,  2 Dec 2021 03:17:16 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.64])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J4YM56Fjkz1RtVG;
 Thu,  2 Dec 2021 03:17:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-kernel@vger.kernel.org
Cc: jolsa@redhat.com, mingo@redhat.com, dave@stgolabs.net,
 linux-perf-users@vger.kernel.org, arnd@arndb.de, namhyung@kernel.org,
 alistair23@gmail.com, mark.rutland@arm.com, tglx@linutronix.de,
 acme@kernel.org, alexander.shishkin@linux.intel.com, peterz@infradead.org,
 dvhart@infradead.org, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH v4 1/6] perf bench futex: Add support for 32-bit systems with
 64-bit time_t
Date: Thu,  2 Dec 2021 21:16:54 +1000
Message-Id: <20211202111659.2077911-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_031721_214874_4518A277 
X-CRM114-Status: GOOD (  21.97  )
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

Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
time_t and as such don't have the SYS_futex syscall. This patch will
allow us to use the SYS_futex_time64 syscall on those platforms.

This also converts the futex calls to be y2038 safe (when built for a
5.1+ kernel).

This is a revert of commit ba4026b09d83acf56c040b6933eac7916c27e728
"Revert "perf bench futex: Add support for 32-bit systems with 64-bit time_t"".

The original commit was reverted as including linux/time_types.h would
fail to compile on older kernels. This commit doesn't include
linux/time_types.h to avoid this issue.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Alistair Francis <alistair23@gmail.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 tools/perf/bench/futex.h | 52 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index ebdc2b032afc..385d2bdfaa9f 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -8,6 +8,7 @@
 #ifndef _FUTEX_H
 #define _FUTEX_H
 
+#include <errno.h>
 #include <unistd.h>
 #include <sys/syscall.h>
 #include <sys/types.h>
@@ -28,7 +29,17 @@ struct bench_futex_parameters {
 };
 
 /**
- * futex_syscall() - SYS_futex syscall wrapper
+ * This is copied from linux/time_types.h.
+ * We copy this here to avoid compilation failures when running
+ * on systems that don't ship with linux/time_types.h.
+ */
+struct __kernel_old_timespec {
+	__kernel_old_time_t	tv_sec;		/* seconds */
+	long			tv_nsec;	/* nanoseconds */
+};
+
+/**
+ * futex_syscall() - __NR_futex syscall wrapper
  * @uaddr:	address of first futex
  * @op:		futex op code
  * @val:	typically expected value of uaddr, but varies by op
@@ -49,14 +60,49 @@ static inline int
 futex_syscall(volatile u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
 	      volatile u_int32_t *uaddr2, int val3, int opflags)
 {
-	return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
+#if defined(__NR_futex_time64)
+	if (sizeof(*timeout) != sizeof(struct __kernel_old_timespec)) {
+		int ret = syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout,
+				  uaddr2, val3);
+	if (ret == 0 || errno != ENOSYS)
+		return ret;
+	}
+#endif
+
+#if defined(__NR_futex)
+	if (sizeof(*timeout) == sizeof(struct __kernel_old_timespec))
+		return syscall(__NR_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
+
+	if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
+		struct __kernel_old_timespec ts32;
+
+		ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
+		ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
+
+		return syscall(__NR_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
+	} else if (!timeout) {
+		return syscall(__NR_futex, uaddr, op | opflags, val, NULL, uaddr2, val3);
+	}
+#endif
+
+	errno = ENOSYS;
+	return -1;
 }
 
 static inline int
 futex_syscall_nr_requeue(volatile u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
 			 volatile u_int32_t *uaddr2, int val3, int opflags)
 {
-	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+#if defined(__NR_futex_time64)
+	int ret =  syscall(__NR_futex_time64, uaddr, op | opflags, val, nr_requeue,
+			   uaddr2, val3);
+	if (ret == 0 || errno != ENOSYS)
+		return ret;
+#endif
+
+#if defined(__NR_futex)
+	return syscall(__NR_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+#endif
 }
 
 /**
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
