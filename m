Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4B4C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 12:35:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600F320850
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 12:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W7pDRFIe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="uKFkUCDH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600F320850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OZU9d01FUz/JZ/ll0/Cq8kxHiYO3rNg8ka949vi1t8Y=; b=W7p
	DRFIerh5seH+u1hNdYvE2MzhpTUp7b87Stjen61XdK3Ql0QmjAi50o0NyNWnOaha+nA7m61YFWXLi
	081oVwDKeSw5/7sy0cMJAqKfT2bPy2GsBGoMA4y1kRTF/+XaVPoJ2yM1bVtz/AE1besGfvixWYaDs
	giMaJ/naQzvfDmBdn5f1Qdo1PZ4sO6C3fqq8EOo52MMEga3yYHJDNuHg9uietunElKNl7m+h7jgnk
	3MgnV2i9036HehJOX+qv49yxVeAnTvQkqw0jQrANXxO2ztGDTfbwJ+7Crs66SzR6HGBOP+PpjAYXN
	6VAXERuTJ4crVe+XZ1WSPCA4rc4j9XQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTnS4-0007lJ-QU; Mon, 03 Dec 2018 12:35:52 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTnS1-0007j9-Mj
 for linux-riscv@lists.infradead.org; Mon, 03 Dec 2018 12:35:51 +0000
Received: by mail-pf1-x443.google.com with SMTP id h3so6313736pfg.1
 for <linux-riscv@lists.infradead.org>; Mon, 03 Dec 2018 04:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=VxYFohe4PUgyDK+i9RF4Q1Ec9VsEPmNXJGRFJEnW1vs=;
 b=uKFkUCDHyBFIxffqmFqrFo2Lrm1D/9XOiktDmXELXTMfnEF+Oi+5qhVW1A5nilB8Wp
 iUt4GM5FSlbW+iAllEui54vRSn3ZbKOVMm6VM0RdkcmQufF5ofbl/qIF/CGatdCjss4b
 rDl2bnBIQihV5XPlFWRu4p9TCRlsBCmEmg4uB+XNW8J4lWpZxsEF9RulOgytPQGHdAl+
 FAUhSBSJiN4xVYc5pFma/zjTwhRVW2YsxXaZge780HexD8HarcTOG5hprxg2R22Xi7WU
 /UwO18Xm05bCfQSNuPXXtbejApKID1fdyErpX9ETMSRBmwKU4dvyKGPL8g69PNQiZXp7
 71SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VxYFohe4PUgyDK+i9RF4Q1Ec9VsEPmNXJGRFJEnW1vs=;
 b=f6C88MvjyQt/e2gZqjYz8uUn22jPmcNmrquNZR0z/vlQQfcdKVFEk4dNVkQa9mVybZ
 N41QuiY31uAMbsY9pDEgnFkVhH2H0zaP65JAEyH7p2LZEq1ynZCtbiUbu/LziE2ixdIG
 Rgeg/7/wedO1lrPhqFNpeNOB+Nvjz3zLl7U3Ioff0c6v9Ec74YIqPbpDEDiCGJywg7/y
 uFshUic46y03HpfMjEeqb8dpd0Nt1wIWZvsoeJC0daza+H83P8FlzElzhOMCpl3dXh56
 jNwYFsfR06rONxzn6WYReLHek/YOMkdkB4b6wFecYPpEwAPh7KML8VNBsmwmiHYH9hAz
 Yz2w==
X-Gm-Message-State: AA+aEWbpV6c0Q0E4Iuba7UzKESYW6Y93nbk759exEzPbNkORerySZPwj
 LrxNFZGZzegy9KlSS1tN3CUycw==
X-Google-Smtp-Source: AFSGD/VjrXjEwxL6rQlgvb3LUGa/9olGeUYZNUrpXG7eSbFvcV+DR5I7wzsgt2Gemk0hA84DCbzFxA==
X-Received: by 2002:a63:d655:: with SMTP id d21mr11952926pgj.280.1543840538071; 
 Mon, 03 Dec 2018 04:35:38 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([106.51.23.39])
 by smtp.googlemail.com with ESMTPSA id m20sm14809124pgb.56.2018.12.03.04.35.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 04:35:37 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] clocksource: riscv_timer: Provide sched_clock
Date: Mon,  3 Dec 2018 18:05:24 +0530
Message-Id: <20181203123524.11778-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_043549_740762_DBFD3962 
X-CRM114-Status: GOOD (  10.19  )
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
 drivers/clocksource/riscv_timer.c | 9 +++++++++
 1 file changed, 9 insertions(+)

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
