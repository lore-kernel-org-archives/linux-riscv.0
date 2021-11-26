Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D143C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 06:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q9SL552Dpr72+TdyZVr6Ybo4XHyxES6N1phx2UflQ0s=; b=h6g0MrcWgd8zMf
	4KyiC56/06ljbnQkWqgYfoJ4MHujV9M4i012Q1wPzUjFGCBN7AFN84cfae5OzrYCa6Mrnk+Ow3j6Z
	PHKTOl7hHlz6LWX44gx9nUcT7eQfuv2QdUCC0nRtKNK2riGbnnnXQ2VEsqs/oXi/25lOPiJZI+tXp
	BvnFnlHoCzRpSGjgXDS7LZZIjsA65xOuVKxMfgDc9b9NdCpCzaXC5o7iFi+TOyGwwutlUcnrdf914
	M7dZqC0eslIvp4xhzyc3OCR4HDUrqmVMAoFrFEtOueWR7MDkB0s0q+UUiVdY4bEqTk1EpMiPczfJN
	qXHtRM+1gZYLwr265zHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqUIC-009H2L-JY; Fri, 26 Nov 2021 06:01:04 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqUI7-009H0y-76
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 06:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637906459; x=1669442459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EbRQaPC5mcE8TRYTTGUiLeoUuaS4O51bfJDEd0m/Nic=;
 b=PKt2Qw3KoT22CRYufLVc9oArx2fvPpIUlh0X7oi1BEDOXX0ZszY/l6wm
 8B8l1F7HsPqQovxAbQww8nXos9h23AM2xrj37ZihfJGPQjQycP6pJCFQw
 4M+8V8DsNMmWf5CX7hNy1z++nFDkC51ED6PTyXMxCX6nu6kZMxy18uERd
 WCI6bEpumNGKtRQ8LkX57vtOCJ1+9DEVxCrEcMdhJ9I633bVUG1uL0D4Q
 qL5FOS3W4KJPLIu5VciSvvPRvZ6U926XdTIUOxQuJXFAZhF53YkKGORe4
 K5piV2ZrM3A41rkRjv75EnUtkHdDSC6Lk9PoAo+Ywp3T1jpq6DT2+HeX9 A==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631548800"; d="scan'208";a="185685998"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2021 14:00:42 +0800
IronPort-SDR: PVXyUmL/u14STlLt+vBljAgwJtFnFoQnPwjL4ze1NiKgDDTcHcGFXsB8DmBqWHqBlJ0WDN9xHb
 b/fC62o4FlnN3csSKe/FqLGH652uCnfkivtNE5qjlx+yeAy0gprQfnpaFz8BVSaQVuj2QnSzVK
 LmKm0w21oiexzF9F3vTKzjsELPM03hjnLJC25Ni0vUelX5xCJkRKVhmJYSVhg0/b0qzRC5UfmD
 bLyZb6FQJbwCUd2elTpo5KxiaSJJuZZLd/fm/l5ju/JqLRykvSXCzju5QuboNcmqxCe8rIad9l
 KrS2vDUGqwrfeFnKO62XWZIL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 21:34:01 -0800
IronPort-SDR: 98JpoDrlYoDaocuWIPLNNCZTyBy5GKFZPg7Vo4ss9xq7iYV43gPU6Bn4ZFWZgotGeg3dxpWDRu
 wfmzKLTDBvNYFwcsq/LwnlYL4XpsAsXhKYPeHtocEmDYYtBFoFvTfVHPhL1IVczrfaGFbWJZVS
 3w6wgIUgf59aHsVLFnGNE99xY3NxV7YDg6/lwUnAlwTqMlHxDfYKoTuL92VGVmeVJzEqq+3YJ+
 /NdradwRN98hAv8uU+vHUCVjlPBfEvimdj4moniuGCupss7TxKi3VvXOTqIky2G8fplK9qrukm
 vMw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 22:00:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J0kcp2jGHz1RtVm
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 22:00:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1637906441;
 x=1640498442; bh=EbRQaPC5mcE8TRYTTGUiLeoUuaS4O51bfJDEd0m/Nic=; b=
 fNz005kQFISzqSYZXNF868n282+1+jomk9Z5KjcCoexdWPKniu5tjRv0oXJASf9Q
 FsP929dUv5qazL3RSFp80EzlkDnj14CAQHhih7Tap+Ape5Xj47RJJCWNI3fZnaX7
 PGAXPaaaLCrBKYIzAz0jFLPu7TDlQr+n9LUcYc+5kQkisnfnP1opJ4lYpM8kjpb3
 T6vsc5YZ6apmdv2V9iLPfsGnsbLoW1Xws8LbH5ubJYjAv+ft33wBvP0MmVq7hcaU
 Y1Eb1UiBpxaX1BnoPVrKisaAUEuY0R0lck0sqTXqiQq42rdU8D1O7s7wQszmAFjp
 XWzG0Le4RbsJxdU/xyYVSw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id jqYYMDI0m9_I for <linux-riscv@lists.infradead.org>;
 Thu, 25 Nov 2021 22:00:41 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.62])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J0kcb0sp4z1RtVl;
 Thu, 25 Nov 2021 22:00:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, arnd@arndb.de, namhyung@kernel.org,
 peterz@infradead.org, alistair23@gmail.com, jolsa@redhat.com,
 dave@stgolabs.net, mingo@redhat.com, dvhart@infradead.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH v3 1/6] perf bench futex: Add support for 32-bit systems with
 64-bit time_t
Date: Fri, 26 Nov 2021 16:00:19 +1000
Message-Id: <20211126060024.3290177-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_220059_343738_6FA9F886 
X-CRM114-Status: GOOD (  22.19  )
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
