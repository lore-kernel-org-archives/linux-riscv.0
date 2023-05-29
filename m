Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31695C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnQR4ecCrdRfjitxiZZ2GV7OeJFMMbu3VTVqzBd2roc=; b=QNCxI1ZxeZ+Ukh
	bAUHgUKrXvlBdek72thKm0Ln9HYn4hh7uUlP/Q5oyPpQEOT8opW+qoDuUBopA47sv4HWJSuGJDHPd
	ktGeJNkTcTo8DTejwiZMYqzkoI41tWdgOOdjFjtqrCVE3I5e74Wjo3uNj1/R/LPlPSQEhja19JviI
	+HZMsNcCmTbgg+69XHT2W+fhxiVukOTatcxiLSMY11t1o1f2z8XyALagHiQRfrAVSlEKW+Nl8vht7
	twnstTwm5m+su9/RhyCE4K5Gr0dOhtrqaNEHM/5W0BvxZQanJ+FNjqlowmakAShPm4T9gPctR4tR0
	xIcJ7KtMif+VmwbrkWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j2S-00BaDB-1b;
	Mon, 29 May 2023 20:00:20 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3j2P-00BaB7-2f
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 20:00:19 +0000
X-QQ-mid: bizesmtp72t1685390404tm1hc6lq
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 04:00:03 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: hHcwae2JLGcWbJfH39kHmo4snlKcsDyQqojZPXS964VUI/pU9KgvLuypS0Ah7
	jYeyVqCZsExVvRBfJlr+CiyoUz3vLCHyLwxLp/d64KPpdGb9bB8hSTxi9nDGIkG3T5CUXWl
	ekxz82XJnF4H40ogAAvy1iEdLCLqKp94Eo1uPbII44VKTBekWYtZMOzFa+Wod+3vQNiiWRa
	pmueuBHNfNVM2iNDyqMzp8NUw7yYOifbwx+HQ6iREaLTCMyhglMI3jTjepktljlKAjdC2hf
	jMvzw5hE1hfVlh/86OfbTnombI5g+dpuv2aAWpJsjdxXMJWC5lNwPtoAaHQHMzhAXCLpTAV
	qXV0/H7I/oJg8xtfQg/yElw+Z0v+AGL/OWV9+iaWjDFf9RP0kwU+XVcK9A5Tn7Vqx0UKNeT
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3843116070107166378
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 11/13] tools/nolibc: sys_gettimeofday: add pure 64bit gettimeofday
Date: Tue, 30 May 2023 03:59:57 +0800
Message-Id: <6d293f3957c43e60319af94b3e5463b376a86752.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_130018_167745_516050EF 
X-CRM114-Status: GOOD (  11.69  )
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

It's time to provide 64bit time structs for all platforms, for y2038 is
near.

clock_gettime64 has been added from at least v5.0.0.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-riscv/afc4944f-9494-4367-906d-06ac47648ab7@app.fastmail.com/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index ca802627e88f..533233094733 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -25,6 +25,7 @@
 
 #include "arch.h"
 #include "errno.h"
+#include "string.h"
 #include "types.h"
 
 /* Functions in this file only describe syscalls. They're declared static so
@@ -552,7 +553,34 @@ long getpagesize(void)
 static __attribute__((unused))
 int sys_gettimeofday(struct timeval *tv, struct timezone *tz)
 {
-	return my_syscall2(__NR_gettimeofday, tv, tz);
+#if defined(__NR_clock_gettime) || defined(__NR_clock_gettime64)
+#ifdef __NR_clock_gettime64
+	const long nr_clock_gettime = __NR_clock_gettime64;
+#elif __SIZEOF_LONG__ == 8
+	const long nr_clock_gettime = __NR_clock_gettime;
+#else
+#error No __NR_clock_gettime64 defined, cannot implement time64 sys_gettimeofday()
+#endif
+	struct timespec ts;
+	int ret;
+
+	/* set tz to zero to avoid random number */
+	if (tz != NULL)
+		memset(tz, 0, sizeof(struct timezone));
+
+	if (tv == NULL)
+		return 0;
+
+	ret = my_syscall2(nr_clock_gettime, CLOCK_REALTIME, &ts);
+	if (ret)
+		return ret;
+
+	tv->tv_sec = ts.tv_sec;
+	tv->tv_usec = (unsigned int)ts.tv_nsec / 1000;
+	return 0;
+#else
+#error Neither __NR_clock_gettime nor __NR_clock_gettime64 defined, cannot implement sys_gettimeofday()
+#endif
 }
 
 static __attribute__((unused))
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
