Return-Path: <SRS0=Q8j1=OA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF641C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 04:32:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE12610C7
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 04:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FE12610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEgzwc8I0qv3Q4totxqQQr9TziRRnawEhb5SmqL8JPI=; b=RbANn+sG47FiJ5
	v+jb8HMpGyrnCwMlL6Tt2l8MnInu7JkJdSvQ7xmK7kb7F6jwsBIB0Gf+rTFalRTCSK+XkcIknrUTT
	4L8ZUVvNlwhoGCDbbyhWBwSI6iYntmRS5xzTm99OoZa/ywxSvOGqtBvZhLFjdc5paixPrYNfsZA4R
	7YpqPdeDLOzH5X22AyRVnx0vOgdKf+2tgU4DqT4e4K1HuXnyJ0TRVssmJSD6tWAcotyqTmiztMvcJ
	bIhcpuX2GafAjQ/iXX5zO2XFMoHui5LoWpqm4W+xG6WLeFEm3e4I3PW9jY9Z/tIeSnixkpa8HRhpN
	oXZtSFFVFmP5ZkPKPqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOYCW-00BllL-36; Fri, 10 Sep 2021 04:31:44 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOYCR-00BljE-FW
 for linux-riscv@lists.infradead.org; Fri, 10 Sep 2021 04:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631248299; x=1662784299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p/2CzwtH3Y/xDgZQCRcik/tdTEiXPRTNOFUZ/p2XQrg=;
 b=PzUrk+xBmsc4jOtfHIFDck/tOOKQC45WleNLtvo/ntU+DfGEV/rYqmx8
 R8P14pjuzWCCP5PZelE6uANm4lWLcHtl1DFm1I8Ehuoso4hZ6YQfu5Yvu
 lHnjBtBTddbFTZzj4kWrwFP1k0TY0qwCcpcMaWQdDAcrO33AG2cRZvjQ6
 6tp1Srv0aUzQgl6tRy3lOw/ZYkUixQh3sjQWWp28tJa6IuFonqJlsnivW
 VE10xo5f7eIfYjZSMPHH/6+b3TZ3qQZqqj1gyl3XhsM416xwa1In1HeyI
 P8q0QOVukZ6UbunXmmTc6zQeyzNLEjYu3gmrvho21Kz/gHV315ahWyYGm w==;
X-IronPort-AV: E=Sophos;i="5.85,282,1624291200"; d="scan'208";a="283444422"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 12:31:31 +0800
IronPort-SDR: TgNlQ2Slksp1PEHQ4IggwD+3+h+de5Mv9gYT357KnGzJ1Sm2qKmJwv55xJt4JfRYSUJ6qmNYKT
 Ya4cy/hhQ4+KjOg59vzheteUdpReolRtj+fMOn3jv9BRdPsghoxCizE0gfhEv+1Hzp1vEcFjGC
 YwscQVxbxEpRPM+i9TjZkzjpBhOac3F67A3tsQEsee0PhNkAPIIo9QjPUAnYGQwrDXaWhdrz8P
 V8XQWnQsXw5vbVPMLi1mEUoleoHp7EBrBwY6QMV6A8niXRyXvP1smokxFUru6doKVgm1O6W4yA
 999KBfTsKsRep35tRTy9Et/+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 21:08:04 -0700
IronPort-SDR: 2NoOhDB05GZ9JOIJv3c194FxymNYhTaWv3flqpiR7/D5jbEwb3gKkj1zwQFJ2T5YlW01hxNs6p
 Wa+sd3UKi7V9Dhx+N5KHAuswp9CMB0pSKfLHpWRnOP1cJccSbV+/RgkpQLKeWSELU6prkz8h9I
 sVe5kNVePr4mPuVC2Qck+6j9aErjArQyRm9f50qbWW6mrON5mzXJnLTsKDH91zcTl4f6oLI2RQ
 mhMoKNVPf6PHA1n0x7S4fctICwBSbST4F/EYRKXNytmagKhrvthTb+1jb8p1Vpm0Dr6VHeJX6l
 Nqo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 21:31:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H5NHQ3m4Lz1Rvlb
 for <linux-riscv@lists.infradead.org>; Thu,  9 Sep 2021 21:31:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631248289; x=1633840290; bh=p/2CzwtH3Y/xDgZQCR
 cik/tdTEiXPRTNOFUZ/p2XQrg=; b=XbSP56r1ZzmSQBEeQQVA1qtDRI5maIEM3t
 uapGwaqHmxNNJuZc2jFIbE5gyvH3iy+xTSwb5ye5QojAaJ3eUE2GWwl9bwnMW7ur
 URuxPyVDW5ZtCU88mH3dWTjgePiYxQiuS9tfuIpkG8c3/JnTZm9xN5rlZh/3pKyj
 yUaV9lUpkiRtSN0YOFdA3bhKHMx9JtffYEHMIO0IPqJH5vix24gSpDWSZ15WirUm
 lN3Lxq9myz6fTH2ON53nqgSpb08OCpPwyvU/z8Zuwkueiw2T+vtLzeO/tj3dCV3Y
 ZENFS4ygx+rw7pUaFpnk9NMfT3Q+srrtQyATjNc66sGJwmcA8n1Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id MaUqrZtFrR9p for <linux-riscv@lists.infradead.org>;
 Thu,  9 Sep 2021 21:31:29 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H5NHD38bsz1RvlX;
 Thu,  9 Sep 2021 21:31:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com, namhyung@kernel.org,
 jolsa@redhat.com, alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dave@stgolabs.net, dvhart@infradead.org,
 peterz@infradead.org, mingo@redhat.com, tglx@linutronix.de,
 atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 2/2] perf bench: Add support for 32-bit systems with 64-bit
 time_t
Date: Fri, 10 Sep 2021 14:31:02 +1000
Message-Id: <20210910043102.3616198-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910043102.3616198-1-alistair.francis@opensource.wdc.com>
References: <20210910043102.3616198-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_213139_625595_E9B40DE6 
X-CRM114-Status: GOOD (  16.85  )
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tools/perf/bench/futex.h | 43 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
index f80a4759ee79b..09c5596726c60 100644
--- a/tools/perf/bench/futex.h
+++ b/tools/perf/bench/futex.h
@@ -27,6 +27,12 @@ struct bench_futex_parameters {
 	unsigned int nrequeue;
 };
 
+/* A version of 'struct timespec' with 32-bit time_t and nanoseconds.  */
+struct __timespec32 {
+	__kernel_long_t tv_sec;
+	__kernel_long_t tv_nsec;
+};
+
 /**
  * futex_syscall() - SYS_futex syscall wrapper
  * @uaddr:	address of first futex
@@ -49,14 +55,49 @@ static inline int
 futex_syscall(u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
 	u_int32_t *uaddr2, int val3, int opflags)
 {
-	return syscall(SYS_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
+#if defined(SYS_futex_time64)
+	if (sizeof(*timeout) != sizeof(struct __timespec32)) {
+		int ret =  syscall(SYS_futex_time64, uaddr, op | opflags, val, timeout,
+				   uaddr2, val3);
+	if (ret == 0 || errno != ENOSYS)
+		return ret;
+	}
+#endif
+
+#if defined(SYS_futex)
+	if (sizeof(*timeout) == sizeof(struct __timespec32))
+		return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
+
+	if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
+		struct __timespec32 ts32;
+
+		ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
+		ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
+
+		return syscall(SYS_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
+	} else if (!timeout) {
+		return syscall(SYS_futex, uaddr, op | opflags, val, NULL, uaddr2, val3);
+	}
+#endif
+
+	errno = ENOSYS;
+	return -1;
 }
 
 static inline int
 futex_syscall_nr_requeue(u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
 	u_int32_t *uaddr2, int val3, int opflags)
 {
+#if defined(SYS_futex_time64)
+	int ret =  syscall(SYS_futex_time64, uaddr, op | opflags, val, nr_requeue,
+			   uaddr2, val3);
+	if (ret == 0 || errno != ENOSYS)
+		return ret;
+#endif
+
+#if defined(SYS_futex)
 	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+#endif
 }
 
 /**
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
