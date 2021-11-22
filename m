Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A29C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 23:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZ5xtM+lS5i2w4K6TWDGEZ2+1X44OJFNl9Ko6cwTN4U=; b=ilm5of6ZJn1m9z
	AOSPzc/ImyHqtz/dTlqJyHx+jZ1UENs5KmYYcsejQGO3c0rXKyxU6bCmIfpsaABS/FyyQv6FIsRSc
	mRX+dscaDZK0YN+bE4hz0XRn3NkWa4fCcoM3IuOqNghr9hNG9TkjBorssbBtgRu21WiXNOCKzO0pD
	tvJG//PDU5un/JMrlkKxejNFX6wsf9z44v6d2TLHl1KfSyUDfIg1OanbZhbaC0BKjkCHSM0EY8iZy
	m2g4aiEcGXzlb4rPj4mdxXz6MNWmzqmITZ2mFK3wPTpv6ArlDDiiyeIePdK+4LT0PKDz53XRycead
	5yZ5vir6QT07416gm39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpIkF-000RT5-1Y; Mon, 22 Nov 2021 23:29:07 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpIeS-000OqW-9X
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 23:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637623386; x=1669159386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cW6tKnHnT46fju5wQk23yzM0+ePdggRMpkOpnMzhj4U=;
 b=Ru3a6yFhO78HTsxTTDELk3jtTeKhyAp1Wuz04iCCWDhF/MLaUCOc728v
 YxF8sqerB+PorTLITLDY4VMqVhIRqVCRZ57qKuWrQxjrw6+pBtosDaJ/T
 hHevRhTutUVOoJAgg6wUKoHIiGh8kSkGphJFyuZ0P5Tktomg6RAZ6771L
 PKbJUmO/Op4eufvFscv6palyH5hHWkbvbYbdPG9A5v+uXxHUYIQCBtpV9
 Ovr5Go0rk9MITd73eo/LGEzlNp2v0ZwKc8dvIppXMTh0gbG5v5nKT1wDv
 86uVlKSt4Y0Ipbf6Nl4ghXu9MKqWmH6uk94CgmpLQta2ECjpN46BJ5rqs g==;
X-IronPort-AV: E=Sophos;i="5.87,255,1631548800"; d="scan'208";a="191158520"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Nov 2021 07:23:06 +0800
IronPort-SDR: I197nmpBPBPV6YIw5GZfQW7wk6HkQ8aVKrNOU23qYwWWtuPPKwTJYYwTtwLJtw4rO8reQJFvIL
 LVCBOCHdf/gidN5gRwkZWe6XXQL/QA1cznL2QHKH+iA4F3CRnmswTYovCAfPoJY35UCLTh0n7b
 +uAjt3jTVxh8ynVaqCSq3acGsVMN/Vwb7Ql8NoPA81rV/o/EOE+4azGpdnH8ERPuAYdhoIxjxr
 Vq0bm8tDTkFytStkLVFv1q7dLBsIDVecfqLqOihYN1ZIrJfjjvmgxXLldImjloK6nwrOs9RDQD
 24vUePT08a2KM6yf0VdQPkJq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 14:56:29 -0800
IronPort-SDR: RkXmAb4IHDYYe1+nQqcrq5RN1/Fe/qVf0iG8GbpiluDQHoDw0ApujbHi7/Z2EerRNEGyrXDuCq
 VbijGA8LNNfHvWJujuFM2dD5Bxkl9SwSpRUFeWQP1onePwcdcKXvdgLmHhiK7o8SDRJB2bP3rE
 X/wLwL8ekTKJYxPVvCYXADeMI+o3bQsOYm1gzIf+kjlsFmdGQ6R5cbmFfl8aoImbjqhoreROiv
 u4CbGZA9fSq4ZkIrxICPWv+zQIZE18O5r9aiUIf/Tb3ulcSK1OT5t6ogtnTfo9CYI1S/+eER6V
 WF8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 15:23:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HyjxQ6Y2Qz1RtW4
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 15:23:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1637623385; x=1640215386; bh=cW6tKnHnT46fju5wQk
 23yzM0+ePdggRMpkOpnMzhj4U=; b=OVmVNDlRcCmsB50kGHheqayKTOkbh0YKmU
 rUFwReqsy750zw78a/CjaaI2w8hTXAfHMTCWVQqqn6l3uijWUVV6T+6yRWG7pI6X
 e93Dlx2lPIFb+Tw1MgD+p1TnRHMllnilQW0WLKmThFg/NHNZ1YLd8XYnI1XnG0lU
 pRTx4rZL80kkC1YSiN9BP2Ld7sO77WM6kUNei9PSHZhrKMUR23fOBATHkAZxouJ2
 SJqfI8MmbSiV1Aaod5WIzkFGvXEEmt3TPtQYFPfb1KWtGvjRo4ZKnk3VS9PS+Skp
 QoFYh+xevkHlac2fvHKcVjhkeMb0EoHm2gSLaHTTUbyMdO3+Q3yA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id ZqXFPFlXpZ00 for <linux-riscv@lists.infradead.org>;
 Mon, 22 Nov 2021 15:23:05 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.60])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HyjxD2k8Cz1RtVn;
 Mon, 22 Nov 2021 15:22:55 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: mark.rutland@arm.com, atish.patra@wdc.com,
 alexander.shishkin@linux.intel.com, peterz@infradead.org,
 tglx@linutronix.de, namhyung@kernel.org, dave@stgolabs.net, arnd@arndb.de,
 linux-kernel@vger.kernel.org, jolsa@redhat.com, acme@kernel.org,
 alistair23@gmail.com, dvhart@infradead.org, mingo@redhat.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 2/2] selftests: futex: Add support for 32-bit systems with
 64-bit time_t
Date: Tue, 23 Nov 2021 09:22:36 +1000
Message-Id: <20211122232236.119533-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122232236.119533-1-alistair.francis@opensource.wdc.com>
References: <20211122232236.119533-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_152308_388925_FB1997A9 
X-CRM114-Status: GOOD (  16.77  )
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
index 1ee5518ee6b7..d3673996fed4 100644
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
index c786fffecb8a..b303d0d492ff 100644
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
