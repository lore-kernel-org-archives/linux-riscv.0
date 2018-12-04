Return-Path: <SRS0=2eJe=ON=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154A1C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 10:45:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9CB020851
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 10:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="im2BqmJ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="JhKZ8XBf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9CB020851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kfBH4mimqmt9EKXnQKfBtwiSV/1tYddQzQj0cPr2oRU=; b=im2BqmJ7lBSTwGi7V+J+bHJBDT
	3TBjAXb6+CmgwVuefnRG1BXkZlHwB8Q1x7fFYKMbkbyLUeuCNIoq6GILFqVAhq/oQ80w1i/sEL/Ej
	xkroSiolL5I+tuyM23ukAqHAM1P/H3eoHIVA4OmYSkHymbgl9poBdfvTJoERDLo4j8ZqQOiX2L9Qn
	SPE25DaI5atVmsFhxg+VdeqdtAGwJmoNbYzbUaj/dcoSQ/53PUh7XjuhpR4fRxbNDmzqIMyPiAQEI
	0zU0PA/sRS7DT8ZgR1JCPE1ww2MMb3VDNjqKyNmuuefljU1Czxpl6/j6DCoFxvDeiFlkZaAN4MWbD
	LDS8arHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gU8DD-0004PJ-IU; Tue, 04 Dec 2018 10:45:55 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU8D9-0004Lv-TU
 for linux-riscv@lists.infradead.org; Tue, 04 Dec 2018 10:45:53 +0000
Received: by mail-pf1-x444.google.com with SMTP id 64so8007435pfr.9
 for <linux-riscv@lists.infradead.org>; Tue, 04 Dec 2018 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L4yb/wtuagw+sPGtsZIsDQ9oRwj4098XHksxUaA5GSM=;
 b=JhKZ8XBfpmf5oNPC5DsZRbP+06aecEB9EHz57ti9YKa8qDmAQnflfCNurq8ocVp3rk
 BFT459NWwejSu/+jAz7hXqd5sX40tOt8yFvRsv3iymTKQNHleups1SYUemKZruBGck+K
 fpxLKT3l9tdwmL6TiBfSR74ZmObeWavsE+OdLSeimwlbXiDwJE/LBNCn/n1Et8Z0nbdO
 aLHCdHP5axFGcCOawzUBv/6DUOx9WdEf8xplqkrqumjnUOtUD90+f9djKcexijrkVBue
 w7I5e/fVpFqlZrtNRbEWkR4p0+1exmaGrgihIGPI7yUIZvCNGhg7KldY532s3rxZeny/
 Gf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L4yb/wtuagw+sPGtsZIsDQ9oRwj4098XHksxUaA5GSM=;
 b=VL8Pzp7U863t8l3MIbQZfSCLmNWnUxmqwl+JfBqv7akxFPVEbtYXUY1bUfA56xZUBO
 vsC9XGnSr60drNqjbom1iBxkOAtiGx0qh5KpPPpBj6w0EPXtpAJWasriIZJluTh4yEKJ
 ZbeOZDlwsac/YfBoxiTwluPbtNkYOiIe8WxhzgkDDI6SAMgxPYxOHDSxU7XdKUJ1hskN
 6cCIp1HajPSYNSWwgiwFEEzw0zjIEGfEJIc75UjLyLpcrSspJiUlCSv3+GbqU0mo4Zpy
 cVlNXSuv5TSlBvcrVhnS6xeuIeqlL0XeMdvPKFU4LS737vittAQwJY9ZCvRmeGTRI+Xq
 i3Ig==
X-Gm-Message-State: AA+aEWbq63arkrpSfmkWLFbdfyRvIxFND3HfcNW43JhT3NQNHX9UwNdE
 c3m39kQ9Hc4pvH25kkTTrZ00+xvdZ3s=
X-Google-Smtp-Source: AFSGD/XCMx2RUewUEkFdQyd/qO+zjuxGBrfBuTBAky+CysatspDpy4r+JH7O71zM+WZ9lhK+SWBwcQ==
X-Received: by 2002:a63:7556:: with SMTP id f22mr15040408pgn.231.1543920347035; 
 Tue, 04 Dec 2018 02:45:47 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([106.51.23.39])
 by smtp.googlemail.com with ESMTPSA id s37sm19034734pgm.19.2018.12.04.02.45.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 02:45:46 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 2/2] clocksource: riscv_timer: Provide sched_clock
Date: Tue,  4 Dec 2018 15:59:52 +0530
Message-Id: <20181204102952.21297-3-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181204102952.21297-1-anup@brainfault.org>
References: <20181204102952.21297-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_024551_962631_C57DEE4E 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we don't have a sched_clock registered for RISC-V systems.
This means Linux time keeping will use jiffies (running at HZ) as the
default sched_clock.

To avoid this, we explicity provide sched_clock using RISC-V rdtime
instruction (similar to riscv_timer clocksource).

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/clocksource/Kconfig       | 2 +-
 drivers/clocksource/riscv_timer.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 55c77e44bb2d..19649abd7c75 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -611,7 +611,7 @@ config ATCPIT100_TIMER
 
 config RISCV_TIMER
 	bool "Timer for the RISC-V platform"
-	depends on RISCV
+	depends on GENERIC_SCHED_CLOCK && RISCV
 	default y
 	select TIMER_PROBE
 	select TIMER_OF
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 084e97dc10ed..431892200a08 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -8,6 +8,7 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
+#include <linux/sched_clock.h>
 #include <asm/smp.h>
 #include <asm/sbi.h>
 
@@ -49,6 +50,11 @@ static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
 	return get_cycles64();
 }
 
+static u64 riscv_sched_clock(void)
+{
+	return get_cycles64();
+}
+
 static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
 	.name		= "riscv_clocksource",
 	.rating		= 300,
@@ -97,6 +103,9 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
 	clocksource_register_hz(cs, riscv_timebase);
 
+	sched_clock_register(riscv_sched_clock,
+			BITS_PER_LONG, riscv_timebase);
+
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
