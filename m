Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99BDC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 22:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9926A6121E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 22:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9926A6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ6BoiMOFL+9V3XNElsnr7b3eNEsiORaR4WIVBKgx08=; b=qZMoXrRex+IQcJ
	rRcxam/FUFyjjbOxvpUGrO/Iv0dcCXdsPY3T4nDKiC/98xpaFkKfHCJf+Ej7QzEHlyRYo608I+Lmq
	WMDM9vLupe8snVQ37cVFYxpQSWPMaHOvBI+/Kn0VSK6Q4B/aLCEhGSxhI/4QqCK5UX7OUHMeUEoK9
	bO7oWruPaTnDMqWxTZaCSXl+ioJJmvrxGFqWDi/EaV7P3BUz732xl4FWmc5K1ZC6ECywPSYtLEC/q
	Ixec6CZ8Oj2QhAnhtDcIdNLCpEO69Exw5SHe5Qq/WMJb6lWcZWcsCk+4Cul2F7kSXwJ0HKGSylE31
	yL+qXCycdY0WVad2GzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdKFm-005vdD-M2; Wed, 20 Oct 2021 22:40:10 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdKFj-005vbm-Km
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 22:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634769607; x=1666305607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t4IGyendo4BsqYlBXcz6RY1/SabKmba0GonLcqIFhF0=;
 b=o97PPK7qKF0UpfNuLsXZ/UfOwouVmkIWPv9KK2M2ZY1ZDBbc45zTShXM
 Rt1TjTENl4m1vcA4LayfgaeB1L/Io2gMZnaUWa0mfL68UcjGvpncTfDDu
 R60e2BMMtRDGSx6m1WoIgKo8da0mB6bxYMd9e5fZEXDa7+2J+xXEqdOLt
 RjV835MiGme10frhFE4RRzUAgwiUUHfnQ6sOo5WHFAqMA4w4XyEKMQAHb
 bCFw8vpA8ZJdZ34zhcSzxo9o8+GuNaRny/b3a/x8anLbYwtdrbJEQInUU
 2unA5IaXwNtWx8EV667thRJmgLOG+s0a17qNU0HoBxu1rqyr/aaYfmUFq Q==;
X-IronPort-AV: E=Sophos;i="5.87,168,1631548800"; d="scan'208";a="287328444"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Oct 2021 06:40:05 +0800
IronPort-SDR: FGvJY4vcXyA6KtoW9hhZ0mETphW4sK3sNDSI6nT1O2MtanLnV/Ky2HJCdwO5LOL3A1ljxF2fq1
 vkkaW5M6x3dasYiI5N1/0S8FUO69BWld+TsuWrXehrhMdQ/c27AwP8knzaERU+pBqrZXPEWhoO
 vda7JqbpnMIzXof+XySlTFjyxjOcev77FC+Cfw9ao4FsCBgtU45n4DmrD5Jv5g+/p/z/GaVKwH
 9RhDH5FLYxdeFWVEWCkkKx9VES3IDCe5xQ4y++K1t8X8E007vEzrScTe1g0OYpE+HD8WN/1XGw
 QDqFh1QEdLlDeUUdE6NQa69V
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 15:15:42 -0700
IronPort-SDR: EFSROuSQtjuJfmPD83IeiFUadjyvYQ8y7Gpvk9O1yhHDcaRgVB5PADLMPJpp/0rCJEYQSc+D17
 3nPwzJT6IkOkuT3fdEv62qKhRCJZmAd2cMSl4QmJuiJw59FyJruNa12V6VubONS1ozv2uQh3/f
 6H6C35lz3Ze6huJokBhdcG/IkqWWdAFzWxopi63WH4vChZvb6E6Q/aZ6TIVZgS73u2VlNGvijg
 x7AuKyCgTTa76paB4KsV/kR3874N6rRyL8roQIB+c9hP9q26YThzCwkXDOx/va6CYYqhZjtkGQ
 KTA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 15:40:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HZQY06plLz1Rwrr
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 15:40:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634769603; x=1637361604; bh=t4IGyendo4BsqYlBXc
 z6RY1/SabKmba0GonLcqIFhF0=; b=IC/mJaTEU70L5dB8tUNlENk+i9mh/z73si
 G5Hk1o5pXrPGRsLuA2znC3W7qrC94oZ0YAdhWjifFf9msVzgbiDVeEHc5xXbQDSQ
 SvKEYWeNx1FOGAVCb2Zv21sreHjClw+lAtNmTnFq0MXfL7/YAJdQVJl811Wc4oz9
 N4MI+v8RgwDm/bkChzSPJ5Q+QYRdX0373Oob/QQ5IKti+izWUy2QBdgJ7oUZ+MSm
 l5LIcfhlY8u1wA9/pI1CvFQZx8Z3ey5bnrhwOWuPOwcZ8Hr0scUCaM+TqmFyMTv4
 w/ZV4UYRsL0GiQUv4+z0I1HSln5IZzdGYbGwOzhEoxrtigmaqbuA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id hm6kuEAuReWo for <linux-riscv@lists.infradead.org>;
 Wed, 20 Oct 2021 15:40:03 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HZQXl5j5vz1RvmF;
 Wed, 20 Oct 2021 15:39:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>,
 Davidlohr Bueso <dbueso@suse.de>
Subject: [PATCH v4 2/4] perf bench futex: Add support for 32-bit systems with
 64-bit time_t
Date: Thu, 21 Oct 2021 08:39:18 +1000
Message-Id: <20211020223920.2810727-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211020223920.2810727-1-alistair.francis@opensource.wdc.com>
References: <20211020223920.2810727-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_154007_754501_D710ADA8 
X-CRM114-Status: GOOD (  17.48  )
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Davidlohr Bueso <dbueso@suse.de>
---
 tools/perf/bench/futex.h | 43 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index b97a343e7ec66..6a7dd86871eb8 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -8,10 +8,12 @@
 #ifndef _FUTEX_H
 #define _FUTEX_H
 
+#include <errno.h>
 #include <unistd.h>
 #include <sys/syscall.h>
 #include <sys/types.h>
 #include <linux/futex.h>
+#include <linux/time_types.h>
 
 struct bench_futex_parameters {
 	bool silent;
@@ -28,7 +30,7 @@ struct bench_futex_parameters {
 };
 
 /**
- * futex_syscall() - SYS_futex syscall wrapper
+ * futex_syscall() - __NR_futex syscall wrapper
  * @uaddr:	address of first futex
  * @op:		futex op code
  * @val:	typically expected value of uaddr, but varies by op
@@ -49,14 +51,49 @@ static inline int
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
 }
 
 /**
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
