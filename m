Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67115C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 01:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1FA6112D
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 01:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C1FA6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sGGWgZdMhSp3uJrjKupEV0ntSGDLoesQ95k2OBvv7A=; b=qJ02NpxYaZ0FQo
	FL1zh8qNmZBGo59ONlfEd7zgaszenrUQiOWTgXyBXDhmoy89iYC4twHw138jw5hq6Eu04lG3RQ+Fd
	oUEgcneYBbzjI7DLHkAWhfkxfyDRsngQv8P9uD9BsRlWYwuju06ZV6dJSS/od6I2ia1eIwPryVmjv
	eEu/NMy4DOXCh+Blq6YKXp7GlWqqvASeAluahp6GF/KJ0Yx1sOxgIbR40eOH+UWawgwwfe17EWAWD
	CftTTFrGD5zpoINveZlydRGzfHVQSwnt0zYfA3kwQNHiE5390tTk5vtKNXXK932o3S0TRko4KG3U7
	LHPO1YcZqXKeYuAPtJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdjSM-009QdP-Qu; Fri, 22 Oct 2021 01:34:50 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdjSH-009QaJ-PL
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 01:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634866485; x=1666402485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uekV2slH9LXIzmi+5+Ec6CuXKwui2fjecjIGu1he6h0=;
 b=pjnSWPuPL4y7EGDBagDkUYOAwMP7OMN75QTsWnkWmokoimjbLrO5x+Vk
 rfHgxbhrvt9Hlfd3DMDlURdSQQQVGUKUBvjtQO9R4F2SR4KOO9M4iJwHj
 j1du//imB+ImWSgwEtXnxUJt5ei/D8TsBg1nigl7wBB+etJUSvpQghwXl
 MDeSlrk8MJts/SPMN1vRbWCYFLqUpCfA0tmSZwKRkKT6VDBYyBBuckVAf
 Pz0dor1HmUFo0i8j5ipB7QUAaTvKrZR2n9mYZbTMnMXZmo7DvXsHTFpzI
 4Tz+SRoiVkWm/OuY+C0wV25EneWUDj2NJC6pi0HMYRwcWd7OvayBS1NPT A==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="287445424"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 09:34:45 +0800
IronPort-SDR: LJKwe6FlO09kKX6TK/2MWa9AT3/T6UO1TWsveh/aZ1ecEJAoQK3jAQYjmO2dLAKpIL9bt/iSXB
 hhquVFn7LguHBXiUEREjJOkk+kd9i0HBh2IRAK6hjpqn30HN6kgjnssJU/qVu7And/aSoOSLu3
 GpmCmRXuawrfynQ9zp+RVqICHy0ZHnDtPUlYxbBWwc2KmrRqBQPA0ef732cOn/9KiZhFZgW2Ce
 V2FStwzuaCzJs/swG8uz0L1LSPKcs0MDOSrUq8oFUd/2p6nPXmo3BVaLwLavKRLn4dcwOhmQ4c
 r1A8M0bqhtcjICu5+Dl6WiIZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:08:47 -0700
IronPort-SDR: 1Dar43Wvi/YY2DxhoF8sqfB3z0FnJjTVidoMSsd2ha9IqkcWcYyHLu3SosyU7vmPnA/etflwLf
 qG7ZzX4+Omi00Sfah0qQ/oxJznhUAG6Pb3SRDnfIUeJyAp/OSy2IR8Uvs2G6vWDY0zuF9922GN
 uKZi/Ns0m9Tkig1noTeFeum+92oudiBLRZ6MTRm/Lc31On6ygSkk7cuP7VwQ3rNLZMibudia6s
 oU/DIDUmVtXLTG468xrTi2b1y31Blwf2abwkgwZzdRn5jeGd1DlOuNCuTCDMYDnnM9wrL6UUjY
 XK8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:34:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Hb6N43tV8z1RwtP
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 18:34:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634866483; x=1637458484; bh=uekV2slH9LXIzmi+5+
 Ec6CuXKwui2fjecjIGu1he6h0=; b=cciO0ud2x6Nw+4POPJ1cL9lSzePeHfI63x
 1Isa+oyimEZxe2hhBJcL0j6HM2pK1kT5xt/Mg4srhw51EZE4hzILtNPKqynDyzuP
 P5wlnS/FujMyJYNhGXxdPO8vLj+HcAF//IwK1aqtxbjRF6aQBg6bXxopWQsPrkpI
 yuNmpMSqlxXyfV6kdqC0Y75ni63ipH/ENlAByL3QTkRacEHzISTOA0UMjRBFB1pF
 1t1++muaDbwYjcOIh9v8E+18MnmsiPPefn2ShYi9mHcp+8j574z12ud1p1Mz67Go
 tu+uDYaPLpMSW4wMs6z3em7APPr2hfk+L7N7btOy4XkoDXAsTlPQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id IvStxVnPcuvP for <linux-riscv@lists.infradead.org>;
 Thu, 21 Oct 2021 18:34:43 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Hb6Mq37m6z1RvlC;
 Thu, 21 Oct 2021 18:34:30 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: dvhart@infradead.org, tglx@linutronix.de,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org,
 mingo@redhat.com, atish.patra@wdc.com, linux-kernel@vger.kernel.org,
 arnd@arndb.de, alistair23@gmail.com, mark.rutland@arm.com, acme@kernel.org,
 peterz@infradead.org, dave@stgolabs.net,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 4/4] selftests: futex: Add support for 32-bit systems with
 64-bit time_t
Date: Fri, 22 Oct 2021 11:33:43 +1000
Message-Id: <20211022013343.2262938-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
References: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_183447_460356_B359ED47 
X-CRM114-Status: GOOD (  17.71  )
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../futex/functional/futex_requeue_pi.c       |  2 +-
 .../selftests/futex/include/futextest.h       | 44 ++++++++++++++++++-
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 1ee5518ee6b7f..d3673996fed4e 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -294,7 +294,7 @@ int unit_test(int broadcast, long lock, int third_party_owner, long timeout_ns)
 		secs = (ts.tv_nsec + timeout_ns) / 1000000000;
 		ts.tv_nsec = ((int64_t)ts.tv_nsec + timeout_ns) % 1000000000;
 		ts.tv_sec += secs;
-		info("ts.tv_sec  = %ld\n", ts.tv_sec);
+		info("ts.tv_sec  = %lld\n", ts.tv_sec);
 		info("ts.tv_nsec = %ld\n", ts.tv_nsec);
 		tsp = &ts;
 	}
diff --git a/tools/testing/selftests/futex/include/futextest.h b/tools/testing/selftests/futex/include/futextest.h
index c786fffecb8a5..b303d0d492ff7 100644
--- a/tools/testing/selftests/futex/include/futextest.h
+++ b/tools/testing/selftests/futex/include/futextest.h
@@ -17,10 +17,12 @@
 #ifndef _FUTEXTEST_H
 #define _FUTEXTEST_H
 
+#include <errno.h>
 #include <unistd.h>
 #include <sys/syscall.h>
 #include <sys/types.h>
 #include <linux/futex.h>
+#include <linux/time_types.h>
 
 typedef volatile u_int32_t futex_t;
 #define FUTEX_INITIALIZER 0
@@ -69,14 +71,52 @@ static inline int
 futex_syscall(volatile u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
 	      volatile u_int32_t *uaddr2, int val3, int opflags)
 {
-	return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
+#if defined(__NR_futex_time64)
+	if (sizeof(*timeout) != sizeof(struct __kernel_old_timespec)) {
+		int ret =  syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout,
+				   uaddr2, val3);
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
+
+	errno = ENOSYS;
+	return -1;
 }
 
 /**
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
