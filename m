Return-Path: <SRS0=5aT3=PD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA134C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 23:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7759B21907
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 23:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HhfqGWtV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="SOwn9I5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7759B21907
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ruSGODaEuVOkGboB/lkObm5+Qm066qbELpcZb1vHcLc=; b=HhfqGWtVG6Ap7t1bNWvgacBkRv
	AmMCVyNpUFkTj8ghfc4n0ZZA3Jao04nWy2wIFaz4eccC2DJP4OQwxqnhzk6CrRvOE7HGO3p91LF7P
	7c4rBbrTFxbw0uZz3eMwdplR9BrF3zpGu14NjXNNHEJSsvvvpynTTZ5nHK8qsqkuJtv/sGHdkhE8/
	m1NYAOpNnODgYTouPCfYkRaN2FpTIkkRCYrFuzRxjFskjdUKXPatyJpcyLxS6GT7JFbwj2dnA2vCR
	cfCZaOS/5VywqkUz6reSZS4jnn58XgWR/pd/YErjTvZuWZ2nIyvnwF4bBCOUF986yBjd7osFnAPcW
	7VIt/Cqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcIIp-0002FU-Eo; Wed, 26 Dec 2018 23:09:27 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcIIm-00027y-Ct
 for linux-riscv@lists.infradead.org; Wed, 26 Dec 2018 23:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1545865764; x=1577401764;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Al1RyQfl0mslg7dvwfKrlns3Gv2SeAFssupFxW5Hyac=;
 b=SOwn9I5SlLHRIhNBezk8Hy/Ayh7utWT0XP/kf2FVZpClDFDPSg0g/QT+
 2NIFFu66xYOTExcXlaPW3kT+/GBuSOeJW4glijQsjaMfj5irOYqNjkybM
 +Q6blXM7cajWhaOWBKA8kQpGwml6WcI7ptczqePAEDV7Il90imvlW0kSU
 eTXKNaTRKw21zXDsJMmkASLZ4JEqqJfq9AheQbEMSwLkEXN4YdlsGC/uY
 3cskUZy9zyGIzxhjAgnv7aRyEPzh1rffyKd9a/+f5Ca9ZEUpFy0gj19Mw
 YKINkA1Gzp1puyw3SQ2YZCCJEOjFW1kDKoGRhWtGdrTZ7qwPZjRFJfezu Q==;
X-IronPort-AV: E=Sophos;i="5.56,401,1539619200"; d="scan'208";a="99246006"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Dec 2018 07:09:07 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 26 Dec 2018 14:49:52 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Dec 2018 15:09:08 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] RISC-V: Fix non-smp kernel boot on SMP systems
Date: Wed, 26 Dec 2018 15:09:01 -0800
Message-Id: <1545865741-22795-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
References: <1545865741-22795-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_150924_470235_780FF883 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In non-smp configuration, hartid can be higher that NR_CPUS.
riscv_of_processor_hartid should not be compared to hartid to
NR_CPUS in that case. Moreover, this function checks all the
DT properties of a hart node. NR_CPUS comparison seems out of
place.

Do cpuid comparison with NR_CPUs in smp setup code. Update the
drivers to handle appropriate code as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cpu.c           |  4 ----
 arch/riscv/kernel/smp.c           |  1 -
 arch/riscv/kernel/smpboot.c       |  5 +++++
 drivers/clocksource/riscv_timer.c | 21 ++++++++++++++++++---
 drivers/irqchip/irq-sifive-plic.c |  5 +++++
 5 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index b4a7d442..251ffab6 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -34,10 +34,6 @@ int riscv_of_processor_hartid(struct device_node *node)
 		pr_warn("Found CPU without hart ID\n");
 		return -(ENODEV);
 	}
-	if (hart >= NR_CPUS) {
-		pr_info("Found hart ID %d, which is above NR_CPUs.  Disabling this hart\n", hart);
-		return -(ENODEV);
-	}
 
 	if (of_property_read_string(node, "status", &status)) {
 		pr_warn("CPU with hartid=%d has no \"status\" property\n", hart);
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 57b1383e..9ea7ac7d 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -49,7 +49,6 @@ int riscv_hartid_to_cpuid(int hartid)
 			return i;
 
 	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
-	BUG();
 	return i;
 }
 
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index bb8cd242..05291840 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -66,6 +66,11 @@ void __init setup_smp(void)
 			found_boot_cpu = 1;
 			continue;
 		}
+		if (cpuid >= NR_CPUS) {
+			pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
+				cpuid, hart);
+			break;
+		}
 
 		cpuid_to_hartid_map(cpuid) = hart;
 		set_cpu_possible(cpuid, true);
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 084e97dc..acf2af10 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -89,20 +89,35 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	struct clocksource *cs;
 
 	hartid = riscv_of_processor_hartid(n);
+	if (hartid < 0) {
+		pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
+			n, hartid);
+		return hartid;
+	}
 	cpuid = riscv_hartid_to_cpuid(hartid);
 
+	if (cpuid < 0)
+		pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
+
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	pr_err("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
+	       __func__, cpuid, hartid);
 	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
-	clocksource_register_hz(cs, riscv_timebase);
+	error = clocksource_register_hz(cs, riscv_timebase);
 
+	if (error) {
+		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
+		       error, cpuid);
+		return error;
+	}
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
 	if (error)
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpuid);
+		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
+		       error);
 	return error;
 }
 
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 357e9daf..254ecd76 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -237,6 +237,11 @@ static int __init plic_init(struct device_node *node,
 		}
 
 		cpu = riscv_hartid_to_cpuid(hartid);
+		if (cpu < 0) {
+			pr_warn("Invalid cpuid for context %d\n", i);
+			continue;
+		}
+
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		handler->present = true;
 		handler->ctxid = i;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
