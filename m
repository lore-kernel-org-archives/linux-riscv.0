Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2695BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 22:40:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08806121E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 22:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E08806121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVlnfljcsoyzAaVJIKtIvvPUai62O1sBpsfzPkZszr4=; b=vHuP+/4tLY4kw9
	SmHGoVoMEtxuLkeBEt+frD/8xv/KXCc3Iiqfle+tsW5NuifwxMgldbloPaTMStv+dOO+3zCAB9ucc
	Vh+iPA3h1FtbT5D+S7/hLmeevefo//Cm8v7/ctA+cRlASZrJUB9InCA/3ABSibzK+ob6pkpcAKutR
	89cJWy8RfvdXewK4ki0QSDQz7oSHU6nNHdMnwe8uRJxFXbIjAGOoAJnKBXaWDgjSoK2G1iyRsLx9+
	sHygPxj+zXUp+p6y4yT4Wau0evhf1dX5G9hQ1PA7AgKRrI1b+PSnyQBY90kpbW3EbpoMM9KIhANEK
	yfwDOOwqXuJ97N9TURZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdKGB-005vl1-E2; Wed, 20 Oct 2021 22:40:35 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdKG9-005vj4-AM
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 22:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634769633; x=1666305633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iokVJV3cYX9f/SC9Fc+lMMtmzbpnIQZDRYW/FHmCWd0=;
 b=lQwrtJEdLY/50J6ejoVcQPlIp33kTzJwDIMzBczcgs46XTU5c231rgl9
 XilkpaxhAeQZsJMfEvf4gfB81bQGFYLGzBkCSwrZ4Qiv2fx5ugQwDuV56
 3MmZB8jBpv/w2+yWL4YmRlJSmcVoiOd6VQm/WJXYPww7wDCfmb75fV+wh
 mPkM4OQ29X2dwXzUiqlZH6mrlvcM8FqPo5F83AenjymNCci1Wk9MSgjr6
 ufj98us9ef86o//Q6Clt041vWPtnwUttyaiuhwwOqwbwVCnYWGsmmmcu/
 bILh2c0RT02B6xQ+YttUezro6qmxXyty4AYkFGlDBSFkQzt2M49cjDCi5 A==;
X-IronPort-AV: E=Sophos;i="5.87,168,1631548800"; d="scan'208";a="295186423"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Oct 2021 06:40:31 +0800
IronPort-SDR: Yz83FomXw3JhqvFbatUoGSOi7hE1GdtJ0j95vfi0g6uo3I47UEspK07/hc/VYhQFh+S3wzZqsq
 Bl3KFh0uXDBkmimKWrKMZrIBN65qgHOrdXpujM8Y1Mlj9qYfh9vn8+KxloFI+SZGjFUoMLffs7
 Lb2kAOd/qjkOkSTy9eWuTrw+SGl7toohXU9JihCNOvxtuMgRsyV+h6yhfvbKfNFn0TowjnOyUq
 4gnHyRC+ybs+Xoxtfb0N0g54enBLfp6w44qR+rVRGp4U8ZVA5e+DZILK23OzzIbnxcnyB/tjWQ
 CecQsBI66cVJhZCpmDAVsMUT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 15:16:07 -0700
IronPort-SDR: /S4mLrI197zGXgDBPbxL8B7Cc314FBCeQXJWGBcPEQfyf1ysPybdAIXOlzUV6JiZEJUQ7zhP3i
 FsGLGf21q4vmcDoUKCtlrN+YivtvxoKxMFasM3ejw+43X9+dFYYxECwj1GWqvFj6g9yjCoFN6w
 IQHfRvgc4y2hWrojfkJ59ZuMbcLVdkapDFXz4gKpB1ecSgHQaVoHSzoEJG1K1pyiv9QvGvGxxq
 8y/sqvpSGP2nkSIAajZKT0W46lwdYsW4fmF4BB+4iuvpblKhPTVJY73FF80shS4i9NG+AYagnB
 owo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 15:40:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HZQYV4vj7z1Rvm1
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 15:40:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634769629; x=1637361630; bh=iokVJV3cYX9f/SC9Fc
 +lMMtmzbpnIQZDRYW/FHmCWd0=; b=HbmBALspll9m4t/0EDKKGA/oB0V3treqkQ
 xIhDbAG8iqUVNKIkW2EnoBNPC3BM3gslxGNdMhJnGa2hZc8hr+8zwk5T89c9Uzo+
 jGCPEg14L1xAueenvGRHT+b7XvGOy1pE8YkTVhAAbm13dX4hbUJF1Mf4OMgplYRC
 vOxPf0dk4xYfarU+MqcVzqB8FNfRn8zM61k//SniLMk5SE8VPOoxDEvKPZGDoJad
 eI/3xWawihNjTBfbffi49TkpXnBDFaWMLnQ3kP+RE9bxFjoc4PXjB42iBY9l510Y
 xMTs0+pr2/agO5wRBUcj5rkYYQupuE/PgtS7dG2+GAWH5vqqoadg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id o02HnATsLML2 for <linux-riscv@lists.infradead.org>;
 Wed, 20 Oct 2021 15:40:29 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HZQYF5gT8z1RvlZ;
 Wed, 20 Oct 2021 15:40:16 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 4/4] selftests: futex: Add support for 32-bit systems with
 64-bit time_t
Date: Thu, 21 Oct 2021 08:39:20 +1000
Message-Id: <20211020223920.2810727-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211020223920.2810727-1-alistair.francis@opensource.wdc.com>
References: <20211020223920.2810727-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_154033_388234_67231BC7 
X-CRM114-Status: GOOD (  17.76  )
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
index 1b133f81e9b7b..b303d0d492ff7 100644
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
-	return syscall(SYS_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
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
