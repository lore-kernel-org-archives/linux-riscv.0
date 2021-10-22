Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E95C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 01:34:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B4E610D0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 01:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2B4E610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3z/x8A7W4ABpq+pI7n9D5b661jMDMrkI5R6R/cAIzLU=; b=1//3UcKAz8qW8N
	TgQpJkC/IXUjTLcC/v+WgxJ6skEUeV8LnfjF/N9ziaCQfsWdfRuhI5e30h7JOomMOTdo2FtiSCADf
	2SRAijVe3lZFc/Oi0ikoPx0Gb/4gd19W12VqP/z99rHTAIPVQHJWD0TuAPGiFi/w4FdOjhBzj0hDd
	26pV9WqKXs2sIXYtQmWeIMTBVvTcilYA5uIbdzlV2yCXDovUHZ9FEi1GXr36L1iMFwveXDOZzcbru
	Y6yKI4hmXkiHMGGl8CvrJ62ZpXiViPcW42DAkKbBDTo0PlZqHEb1vyWPMBlFcsLk4A2jGMxuLZllp
	jQGc7V2QFjihROoZmadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdjRu-009QRR-Jw; Fri, 22 Oct 2021 01:34:22 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdjRs-009QQf-In
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 01:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634866458; x=1666402458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0jezQdAQdWhHmDMWZLYcoD4DYC4/yRryNOc0ZTLZ39I=;
 b=bIm7CLWKgMM80P1VZIFdsZOnS3bEPzGqk1ohdUtQjfEIBWFeByIKqBEI
 k4DAne+aLAVE00jbjxuJmFl/aLj971UnLO8dyZ/YqT5J06xcCEY2QIdui
 ITHw+ik2jzQaFk0UI4tMLEcRknZ2TAmZ+46ukqC/xO/jAeJ0ltzkxUhN1
 ZZnFyD39jx59vizGpL2behTZ5irfvba2/BrdWLTuiKXsOp5VWT8S77Igg
 X2BVIISw5t/ioa+jIzHmFsilNiCNdZBDpoZ6FDENqkVjB6DTJIhoNyk5Q
 BihvSIjMM6w4v+8fH/2m+ls69fGDRNx6l5Gawv9RHTAznFOBwzkrD9gif w==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="183571767"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 09:34:18 +0800
IronPort-SDR: zq1l/TntoH1qg7PkM1Ku9hnzx52YvrMAEQkNZtvTEpKe3VtKyty0/B3wA3xEuiSKxNuMsKc7Kt
 n6YLobEtk+mctKFjE1ah0fAgQcJIRVWUNccSsCOY/dU+vEFnpYmke5dJkkGNcFigtuo1XsxSog
 O2XyTZeD/QXcQCrnmX4AyXX07VRu/gAJ51SwM0vUvBNANuZLhj+N78yydnxlto0mrHFUGQDZyb
 xEtDQkhrYefnop5QWCxS6r5/FkLxLrLy0uEM9+h5NSft9/6rELlXAFUXaA7ov6o2l+ScEO7HZJ
 DrKJrMz1cryTmqyIEKh+jiTS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:09:55 -0700
IronPort-SDR: 41bDs95KdXswoW3qJszu9dg1ZSJtrtU23s2i4WHpuj2jgg6MWVGQlMGFIw4k+3DDfldRYvGyt8
 qky5Tal4FiadyKg+iACqKxAAZdi4CD63V8+u2E8QU/I7rbB4ngV6XVE210FELSfHUx04Ah8Wls
 /2E42ZfmZAQZn3So5F5QxxmVDJqEOSdnx36+/iRcHJ9hFLZGAewM49HjeBRAFk08ferDgVEoyf
 lo0u7l4BVjN73W1T/tsAtOD20tAhXvx5qmm25F1yrna03qIyOPj6/eLqoWwNgCYUrFX7khIluK
 Ez4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 18:34:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Hb6MZ5bLRz1SGYR
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 18:34:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634866457; x=1637458458; bh=0jezQdAQdWhHmDMWZL
 YcoD4DYC4/yRryNOc0ZTLZ39I=; b=srYgOZj35H5p9OIJQafrSjr8v7mCjz+hup
 H56NYdLtorEQPLbINDMzDLT4r+FJEn7KMI8jdsV4oo+l7Uuq/NISmJMLZODbwGk9
 S2Ha3vj8MPkrHvONyQlGO/ZxWJ6xyyf1Vq+xvot3DtCGsdZ2ap4+6uxcI4nWlcSY
 GJfNTGvXueh2A41SdyjIkRt89B1pHtcbW7AZ3vRroWby9RBF39mNDJv55D3N1PPc
 711XAvSiuygtbyeQwFqca6UDVI2SC/ZO1A6V6ySbbbkOElqONZXEbS36PSofpvde
 /BgQZKvoJxz/gZP5RdVHfHNqHQRFmaz3MYdrrxrVcIvlACCsrrYA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id RTWnDPK4zEje for <linux-riscv@lists.infradead.org>;
 Thu, 21 Oct 2021 18:34:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Hb6MK10B0z1Rvlw;
 Thu, 21 Oct 2021 18:34:04 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: dvhart@infradead.org, tglx@linutronix.de,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org,
 mingo@redhat.com, atish.patra@wdc.com, linux-kernel@vger.kernel.org,
 arnd@arndb.de, alistair23@gmail.com, mark.rutland@arm.com, acme@kernel.org,
 peterz@infradead.org, dave@stgolabs.net,
 Alistair Francis <alistair.francis@wdc.com>,
 Davidlohr Bueso <dbueso@suse.de>
Subject: [PATCH v5 2/4] perf bench futex: Add support for 32-bit systems with
 64-bit time_t
Date: Fri, 22 Oct 2021 11:33:41 +1000
Message-Id: <20211022013343.2262938-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
References: <20211022013343.2262938-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_183420_657771_B28C179E 
X-CRM114-Status: GOOD (  17.34  )
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
index ebdc2b032afc1..6a7dd86871eb8 100644
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
 }
 
 /**
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
