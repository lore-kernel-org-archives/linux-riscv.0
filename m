Return-Path: <SRS0=2lO5=O3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36375C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 21:31:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D6721871
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Dec 2018 21:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4I4cpoM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="atusBLcC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D6721871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gZqus7aqWN0/nD1H2tgrbXL05VyaIpgWYQn0TZivTy0=; b=P4I4cpoMRNE9RZNqh+Ml8VdslR
	A3ONhUIPiGG8GvsAnoB6UvLfD040W6isAtAb/vgy9a8pvFkHyI6UWeBgYgUmQEigMoPsMEzF8Fjcs
	PipsO+p5OCe0mWc6WqKV/grwIv8INGnSM+TGkksX4eyAb4EE2O/vjTZpuIPmeippYcqzItPVy1rHn
	MrAEdBlnqqM81lGcQHHkW5c6H6zXYULR+9u8CqrHVcl2Lg2iGmFdXFZZbxRc23q2a5DQauks4srt2
	HwnXPnNau/A/mbpYdHV5SArFq440pqcYjSGckHdS7XZdXr4xWdjkX8/ACHDzC2RvD0LvYcR9B4BtW
	gNwV08zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZMxX-0003uJ-0c; Tue, 18 Dec 2018 21:31:23 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZMw2-0001Ad-8J
 for linux-riscv@lists.infradead.org; Tue, 18 Dec 2018 21:30:02 +0000
Received: by mail-wm1-x342.google.com with SMTP id c126so4282514wmh.0
 for <linux-riscv@lists.infradead.org>; Tue, 18 Dec 2018 13:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HuxNRSLo1Y/SD7lAUX6QeRhvOXk945RDrLuI7e8huwc=;
 b=atusBLcCLc2S/PnQIGuPkwaWqoeJ6o1qCwBPOsDx85VjmTYC0rvdf+OkM/cQ4XNNXZ
 +DFmvR9qAtYuhV268U9V2pz7MRJ+VD4qoh1mN8iP143Vl8F7cpqVUCdwHiT5VbSmQQr0
 i1FOfio58SrDoVxkYVf7dJskuiT8wr9xmN764=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HuxNRSLo1Y/SD7lAUX6QeRhvOXk945RDrLuI7e8huwc=;
 b=UVxbE0x3rU6MM0Lsz0iZRnkVyItEpT11MS4uyqxJ19fhS41wZjMPce9uICR/kpu7MI
 H8DSeEizyBVqM0tqLRkDjHXwfC8VeYpi/Arxjzi09XbEX/Sr6/g7PvMzLDMmLx6YQgdQ
 oOGBmXshNdCUOYtkklJvZlbu2lITUeuhvVf09FzuCgXW85uas3WvKHUAP5CjAwr0kRa/
 dImkdbzH/pEOs0PImkeHrRAgPqZArlkL5Io+tvBoHeUs6txQQHzIanZbN+bpm4AHe+8m
 o3KfxwUJeoi4nfb5bRYz5GpaSuP+5fxa0yQ8NPVcOHwpJqAfgL2KzcdxT+WJHZqA7vHs
 LuSg==
X-Gm-Message-State: AA+aEWZbH1KBJrEMcXSbW3vuN2k0JSXAksDgFDV6hxYYQ6hYeq+O00Ur
 /aGO6+3HwCS+wfPi0Ah3e0/dtQ==
X-Google-Smtp-Source: AFSGD/V1T4DONWUr6IaFJgBR3PuM0TVp/xv+chpP/j5o7RP2FzPqAwaU6SU7Di30AjuADT8agOcFlw==
X-Received: by 2002:a1c:5892:: with SMTP id m140mr4706654wmb.60.1545168578695; 
 Tue, 18 Dec 2018 13:29:38 -0800 (PST)
Received: from localhost.localdomain (105.50.92.92.rev.sfr.net. [92.92.50.105])
 by smtp.gmail.com with ESMTPSA id o4sm4153485wrq.66.2018.12.18.13.29.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Dec 2018 13:29:38 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Subject: [PATCH 19/25] clocksource/drivers/riscv_timer: Provide the sched_clock
Date: Tue, 18 Dec 2018 22:28:37 +0100
Message-Id: <20181218212844.30445-19-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218212844.30445-1-daniel.lezcano@linaro.org>
References: <d3f1255a-592d-13d9-5d3f-bd3ec7a36742@linaro.org>
 <20181218212844.30445-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_132950_812298_E3E63B2A 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: Anup Patel <anup@brainfault.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <anup@brainfault.org>

Currently, we don't have a sched_clock registered for RISC-V systems.
This means Linux time keeping will use jiffies (running at HZ) as the
default sched_clock.

To avoid this, we explicity provide sched_clock using RISC-V rdtime
instruction (similar to riscv_timer clocksource).

Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Kconfig       | 2 +-
 drivers/clocksource/riscv_timer.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index c57b156f49a2..a4ae339e0101 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -599,7 +599,7 @@ config ATCPIT100_TIMER
 
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
