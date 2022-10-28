Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F6CC38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kmjM0PQhwuCjAX8iFC+mC7ShsddeT8QnKV9r444/tE=; b=xAgxvkCVNOHDEQ
	ULyDQ/1ie6SbO/6zOKG0MBt1r+PgGXa0jfy409ItELfF7DdQfSuX0IqKg3G9LqmA6cNgqIzXv6700
	Njfu1RGQOWJU1maTobEGkFP8S2isDcvFgUJGnQ/NkWfxvucms35cFeVqYN5OPTH1aTEQDIykGdJ8k
	2VOlAxK7MUwUdbq/l1gipr7ppLq3p3TpWHBHNlNcVGsz47Wrh5zE2Lhdd62yaaZgDR0ehigz7YavQ
	dv9ouVr7KQWr40ylaby90S+C79d/OMun7c8Iz9yrHGQazzvecft0SX6dXFXjPatm6EF2tNRshL90J
	Say+kjss41qMiLAMjnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMFX-00GX4d-4U; Fri, 28 Oct 2022 10:06:03 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooM78-00GTXU-6o
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 09:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1666951041; x=1698487041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r/Wt8wTrrxLwn/R3qKGQRI/nbpEUQa2isveXNykvGmo=;
  b=CoWpMyVPk8fXs2aNiALzsvYWBCkIvcyd5no20kZVKGIMIzUZP/JvNctu
   8ElK2BUi1VEdZ1r/YphgTmEJHdZ6zZ3UOlmghpaKqM+mn+MYskcc7eTQT
   w8pC9VxjNXLhHk+YbC/bbG9PcR7tiIgcNaR13RH2cjOEwvkqz4IYJVc5O
   jIXl6GRuWQY/wU6b1fgYGivWQIyYip7/8b3oZ5rrXU52JWxhJbka8Ee18
   wevbXy07KK8c0zNDwnkFnGmMsERo2Y+SMutmZ7k6WyjKxcckx/FCWiDVy
   +1QWwjFOqHEmfpNMNMo7acrzxl6IxNN1byYZ92NOwfnEI2RV1MT9GBR/l
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,220,1661788800"; 
   d="scan'208";a="215318005"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2022 17:57:21 +0800
IronPort-SDR: N99BV9AujTp/h0Q1rxjxIZB8npOXVZgvuhRrn3GUxkI1ov2sM3WDGN0xUnc9G5vg88C+uphWNR
 ics1feSXahSCLNs/YP7iz5PI4fN9+7NcFgaw2IW4yuUhWPxw3DPWBg4/RJcIpfMiktxyjfRNOv
 3g7fDMemKDNtalozshB+ybxfsTfkSHtCSc4xZi4Ob9GjQTKtcEcv/beXBYyePLKsnUY4A5lsVN
 fDBbHtVhFM1l5hYpMkahd4COWLWbGetXqWlGHAWYzhLIhaOvuuCE6+KjND89Fzf9fT6mRdt2+z
 ATXdXb6b1O0HmGMniuFNPSK1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:10:58 -0700
IronPort-SDR: iIp38ZdPnvLasN84dJzrPyivi1m6YNGD6HnPXro5hXQSrQr2QmECMqLSUo8Ic/ThwjBPZ111Zo
 7iJW6qNrjKKiXucAcRYq8AwAGdH7UEl7KXNGA7A9diLDAYQ0gbwAnMvEjU1qizEcwg/0csOxod
 5pZJCRF52rqHa9mTILuU+NeXMFJQWtyTvdmt9a1jltBOvpawZQFeVZCQDII2iKyjiiCm4/0Zfj
 yFT1JeDu87kpinFweYSYwdlEYcCJ2YrmHBESofge6t6T8FATujBiFA1eWE2m8GduoAnoyxBhq8
 VVk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Oct 2022 02:57:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MzHyn2p54z1SHkR
	for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 02:57:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:references:in-reply-to:x-mailer:message-id:date:subject:to
	:from; s=dkim; t=1666951040; x=1669543041; bh=r/Wt8wTrrxLwn/R3qK
	GQRI/nbpEUQa2isveXNykvGmo=; b=J/XB7nV3s8VIP3A2o68BCRLdofvNTcUQoQ
	WBFb7oiY2q3ZtHUgU/oyAMv/aTGdkNAeTg4zioNsvN7N0Hvi8camt+2Vqc4Qmkma
	qD0h9f2TouksOrzl9VGkBu3QSVWJZF96fMvqslYzl6fx0nuuG0EApS6wBlbZT/Ju
	ylvGiB/zfeLKclZ6F9BQzXJ3tz8BueH6n7jBLDHqU0xCaJBqIduYTbdnPuq9nUUV
	Ys2p0lfJmr7fykFMktiyg2cVClc1P5j8dlG3k/YHZfjvLL0WFRrE/yew1NptDn2O
	JaS6AJcDVjHiv/l5rwKPGC4g9b+fPyNrNQTpGA3BdKyqPUbB63JA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jdcIbtv2LM4b for <linux-riscv@lists.infradead.org>;
	Fri, 28 Oct 2022 02:57:20 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.50])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MzHyc2BBbz1RvLy;
	Fri, 28 Oct 2022 02:57:11 -0700 (PDT)
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
Subject: [PATCH 4/6] selftests: futex: Add support for 32-bit systems with 64-bit time_t
Date: Fri, 28 Oct 2022 19:56:30 +1000
Message-Id: <20221028095632.1081262-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
References: <20221028095632.1081262-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_025722_387823_3231B83B 
X-CRM114-Status: GOOD (  15.82  )
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

Using the new __kernel_futex_syscall*() functions let's add support for
32-bit systems with a 64-bit time_t. We can just direclty call the
publically exposed __kernel_futex_syscall_timeout() and
__kernel_futex_syscall_nr_requeue() functions to do this.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211209235857.423773-4-alistair.francis@opensource.wdc.com>
---
 tools/testing/selftests/futex/functional/futex_requeue_pi.c | 2 +-
 tools/testing/selftests/futex/include/futextest.h           | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 1ee5518ee6b7..556bf3e74755 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -294,7 +294,7 @@ int unit_test(int broadcast, long lock, int third_party_owner, long timeout_ns)
 		secs = (ts.tv_nsec + timeout_ns) / 1000000000;
 		ts.tv_nsec = ((int64_t)ts.tv_nsec + timeout_ns) % 1000000000;
 		ts.tv_sec += secs;
-		info("ts.tv_sec  = %ld\n", ts.tv_sec);
+		info("ts.tv_sec  = %lld\n", (long long) ts.tv_sec);
 		info("ts.tv_nsec = %ld\n", ts.tv_nsec);
 		tsp = &ts;
 	}
diff --git a/tools/testing/selftests/futex/include/futextest.h b/tools/testing/selftests/futex/include/futextest.h
index c786fffecb8a..1686f94667b1 100644
--- a/tools/testing/selftests/futex/include/futextest.h
+++ b/tools/testing/selftests/futex/include/futextest.h
@@ -21,6 +21,7 @@
 #include <sys/syscall.h>
 #include <sys/types.h>
 #include <linux/futex.h>
+#include <linux/futex_syscall.h>
 
 typedef volatile u_int32_t futex_t;
 #define FUTEX_INITIALIZER 0
@@ -69,14 +70,14 @@ static inline int
 futex_syscall(volatile u_int32_t *uaddr, int op, u_int32_t val, struct timespec *timeout,
 	      volatile u_int32_t *uaddr2, int val3, int opflags)
 {
-	return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
+	return __kernel_futex_syscall_timeout(uaddr, op | opflags, val, timeout, uaddr2, val3);
 }
 
 static inline int
 futex_syscall_nr_requeue(volatile u_int32_t *uaddr, int op, u_int32_t val, int nr_requeue,
 			 volatile u_int32_t *uaddr2, int val3, int opflags)
 {
-	return syscall(SYS_futex, uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
+	return __kernel_futex_syscall_nr_requeue(uaddr, op | opflags, val, nr_requeue, uaddr2, val3);
 }
 
 /**
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
