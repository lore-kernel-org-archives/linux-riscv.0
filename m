Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2870ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=176lBQvaKwhHAYOznZhYsdZlKjdKSoySo3etAK1A3bU=; b=ss2NJuav1LCDuC
	OaeR6wi1MKH2Cs67XxtBLNEOO8Mr9qp6JOvnTEtqat8+803m5Yx5JjevUwcz29T+sEnNk/peRUHRu
	qopEeRBRHx3HTZwUARPOx51FvoQjv5qhC8ekH+losVdSG5vnQVnM0qwNkrznACrCCMZebnfSg9DUv
	Kc8l1LmjvHNGgqRahU9kpvIU82HlewZ6ItbGLPtTKyaznR+NINxDBmi0CdghIXqOOHTQcjdUXZ/lb
	VuaqME8bNZMDynJSrlSwufNk2xuRqHJBXr6PqrqXRY1rnvfC6zSbwYMVejvBjdBjrf9l5dz1YgB94
	vFWglcf7pO4ZP24AdcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMDM-00GVz0-3P; Fri, 28 Oct 2022 10:03:48 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooM6j-00GTLq-K1
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 09:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666951016; x=1698487016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cCBe/q5YolyqbHnPs4c9IauGtcofM9sooHtix6H+SW0=;
  b=ZUv9O+2F1wtTskodRw/MT1nTGV+knOZ3MNGHePrWsz3HN2PFt9jNbk8r
   k73/8Kn+aTvclGuNZnxdsgrp6FQqSxxhjQaNFPLdul7Sh1pFqKQ6Zp0ij
   m4oTX/oWcnm6kJF+REJEe8tAoBe10h8s7SkaSKRNek3T53bxrD3x+numJ
   kOMDgZG5fS90o9DqTQAy4aKqwj1qxwJB4PiRanAcXdgjmAumYpL8JbdcF
   7Xvpj3M13K3/Hb14xTQKzV7HusEI+wWwOQlcAKSfbVvrd+gJUomSlxBxN
   hdny+IYb11cH+fXyuGpdex68kW11aX/ifLZbFC2q3oOiGiT3zl4FnByrd
   g==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661788800"; 
   d="scan'208";a="213258370"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 17:56:56 +0800
IronPort-SDR: LRUBrgrpw0WObl21KYL+UXKm1KMSdbkG05Df95k6A6d6JZwRycAoaTlzlkB1ymsQxj+JF2hY9D
 8r6Usl2wNa7+JjmaZ1zQe5RhnE6JT583+6jiNQeeNrzRgapGzHMwDXYCWmfgshG6cG/TK54FEV
 IjOajNI2E+S2tcvxdWkYFDM+r0QAIiVkv7jt3ac8ECuZHTKqypxyaAjwXONtCausGSW52gse9F
 sh/Bm0kleaNifA6Pa0mrnaOKoYc/ETRcMPHC9pI8k4h4MFmutKDeJ6/GzWukUrLsDLdnZ6DwK/
 edUBT0rY7KysEaz301/u0Hqu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:16:17 -0700
IronPort-SDR: BDz36yemM8SaLmQtxYOL9OXnsZ1hWvLPuqpOBaC+f+u5uuYNCZj31A1TD4/wYhf8RjMNXAvNBk
 +mJA1rEWjYNZrN8NGxyPnwjoVfLczvPcDtMT2h6xGzrfM3o+z+3kRE8+aGeYUfqKPxpFI7nS4T
 3NO68VilYhW8yxLXZdXBtJHQAyPamXWtWpIaONyu7masampM/m10OaDJebsudum/RzzHgdjAZN
 nTCfXgfsJqHXhKlEIVD9gDQbDdCr1U5NQVRdvCIF5xyhW933w2NfBLw9tzyJqgfaK1vFzI5ZIR
 OOY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:56:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MzHyJ4ZR7z1SHkR
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 02:56:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:references:in-reply-to:x-mailer:message-id:date:subject:to
	:from; s=dkim; t=1666951014; x=1669543015; bh=cCBe/q5YolyqbHnPs4
	c9IauGtcofM9sooHtix6H+SW0=; b=OAa1FYOtOr8Yv6LLPxBxxoNFUhQW1PLMnJ
	KFEd1oT/7vn16T4Ox7LgvGBdS+hqd6gPwOQD+nIAb+mY8pOgCRmEUosR2o/YvVo7
	wpOApZYhSgJk5YFexLdrCigBcPzlYSH1qa+qFwQ6OpEDnM78Seta0h3nrh40sQme
	m6PJx/hKkzXwqplYVSPZZP6jZpEbq6RStVjLuI+4SJNkY8C/uphHH0wg2GWucedb
	K7fTkvTVRg6JfbnLrdL1GltYKVNnAI5+AYitDl/Pdw2Vvy69WKH6rB4ynzmNbF3H
	kXvPWTYZsbt5AnqAlvR2HFSepDgUBQm5t2SDARtsEN5IOPa9eCSw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UMW_v1A6fuLi for <linux-riscv@lists.infradead.org>;
	Fri, 28 Oct 2022 02:56:54 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.50])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MzHy76NpKz1Rwt8;
	Fri, 28 Oct 2022 02:56:47 -0700 (PDT)
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
Subject: [PATCH 1/6] perf bench futex: Add support for 32-bit systems with 64-bit time_t
Date: Fri, 28 Oct 2022 19:56:27 +1000
Message-Id: <20221028095632.1081262-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
References: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_025657_788142_ED3845BE 
X-CRM114-Status: GOOD (  22.01  )
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
Message-Id: <20211209235857.423773-1-alistair.francis@opensource.wdc.com>
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
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
