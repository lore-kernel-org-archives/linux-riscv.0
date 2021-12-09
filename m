Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3556FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Dec 2021 23:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h1gApugHFTqOFBI2ZfvLZtP9drQPzqrn28OirpNtFkQ=; b=2Jj6y8xR+V+Zkg
	CPCprOAJi08yO6kRpsH8bRHgn4w8tXYW9yOHfetDoYf76z97noipEFVt2zgvoQCVli+d3QxRtxYBO
	ONFzPiMzAaoyUqED6/xVbYNP98tDMNhwov1owcC0EtvZGDU8IZm+nJh9pFD5vcO/YPqU3A4MJizS9
	0+zc5gpl2VcA+bSjcq6V1WzGb/Eb24pAfdMVT1XNX5sVd67rXoxgP1Jz8psi2dg0f6gkCTfCYi1pJ
	+RUd/Iwu+SbWVM2Aot90CgrGS18zUoBCsP/G6+1bz90+XSpda8wTinYfiqBXbw9XPjeJx7gXLbuVy
	0LalQZoed9QLvZDI7/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvTJt-000SEx-FL; Thu, 09 Dec 2021 23:59:25 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvTJq-000SDc-BI
 for linux-riscv@lists.infradead.org; Thu, 09 Dec 2021 23:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639094362; x=1670630362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cnkxM+v3e7Rw5Wac6Yp3jXRam56qrhimBukSct1R/EI=;
 b=CKtz5Z44gRYRwshVGqvOEkCBMBhV5HxUgpsTP3Tg+mlfumiIIuWe7yza
 92ulNsIqvgHr0TkmxTH/KHziJPKK9W0rhR+TWJr2IYmec+hCsQQYxeHeY
 WoGvO99jq3px/N7CNkR87MEwjhfrkkK6fVnKZoPwJcID0xJgUt4fRs+7E
 s5Wq1FqhGhMaLFk1JPnQRx1A3r2ZX6FUvmFqX7Lr7Q5ko4+9iXy8gHxYL
 ATvG7rz0qh3QW1R+4VNuWCqEa0c6hbtvxHTdeWKfZZ74NJwwVPx5/t6hG
 iRB2fJBPmHnEUjMp9PLfFPfYGaZLoqyKn3TYuA2gojsfckV7s6hdR0qnZ w==;
X-IronPort-AV: E=Sophos;i="5.88,194,1635177600"; d="scan'208";a="299733817"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2021 07:59:21 +0800
IronPort-SDR: A/P608Rl5dH4uKqcqV6SX05pe4sRxuXbJ2FUJLwDjJ8dP/aChRgz8hbMQulrPnHXN8kV2MKs3a
 a5nRZhf4vG5LgmGYZjP7S3+9JxjT1JOC96tJC1T0tlKSCvWT5C+OjxhfzeT0HU/YLW3wb3ts/i
 csVYuDoyzCw5kYXYGIoLDtPfyF1PfR5P3LPOC3Vn6gCyj4KkKuqgPWVE45CSdlsRw2RF0zr7GE
 YKA0VPhNfFj827fwgulQZxhlDsBSZUKbJYJB37TK+HUZ43I1m4oETldhEAlxFDjh9GVylp/s87
 83VEdfb1TfAM5gXpLQEshwZR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:33:53 -0800
IronPort-SDR: B4DgkHJybyn1GxIfMUzdltpRYqpbg9L7YUTbBB0kD8wBIXwhud4IpQ56Y/+ZcoYg1w9KM8FXu7
 bDQIlhsdBCS5+zZCNyrflZiuGhZ18mRoRCHqaxkLbameiCIpcxh3Pd1O7AAhRn7gBrHeUWif/f
 hvt5YZgwMiyfPqcCPNGRR5uD1Dh/JOfUuiGRAY8+BMq19EGq3l86a4orGVkW763RtvyhmdwW/+
 SO7YNYjVQi48uUMiCJKJ4q2PfFYMpMZXP4O3J804ZrIJwANOe+Hdg+M9Mw/UFtsW3088arMxy2
 UHk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:59:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J99xN4QZpz1Rwvh
 for <linux-riscv@lists.infradead.org>; Thu,  9 Dec 2021 15:59:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1639094359;
 x=1641686360; bh=cnkxM+v3e7Rw5Wac6Yp3jXRam56qrhimBukSct1R/EI=; b=
 QQ2lIM0w8R5/FXjkEH0OugTtSDERPVkfLnsvK1UEfiTOtWgcTpfIjHLxj2tWf84/
 NwirDS1cU3ZjutIIkIafGap0mT4LMuZ9EBEaWidR5Nhww14V+8gSsnJjm7hcZ5tB
 CfJQGyo+NlKCCgM9unnCFZB2XByLQG+XuqM6vnx7oQ6xsgl0B0msEawD/TDjdSY/
 VBJ7zsXib3uiLqBuCqf9ODs4iSkKMFXfvPzbF0LrUPpqnk2FrbsNQoZV7u/S52xB
 6xKAGhJsGSjoC7MBKfULXVGUWoigq/qzga02Q8ReibV7N3TDRWLc8iw0gA2/NCUi
 fMsPG8TGV0RMASQDC59NxQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id rGXCJ4vw_lkA for <linux-riscv@lists.infradead.org>;
 Thu,  9 Dec 2021 15:59:19 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J99x959wWz1RtVG;
 Thu,  9 Dec 2021 15:59:09 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-kernel@vger.kernel.org
Cc: dave@stgolabs.net, dvhart@infradead.org, arnd@arndb.de,
 alistair23@gmail.com, namhyung@kernel.org, acme@kernel.org,
 jolsa@redhat.com, linux-perf-users@vger.kernel.org,
 alexander.shishkin@linux.intel.com, mark.rutland@arm.com, mingo@redhat.com,
 peterz@infradead.org, tglx@linutronix.de,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH v5 1/6] perf bench futex: Add support for 32-bit systems with
 64-bit time_t
Date: Fri, 10 Dec 2021 09:58:52 +1000
Message-Id: <20211209235857.423773-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_155922_445976_C3E98988 
X-CRM114-Status: GOOD (  21.71  )
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
