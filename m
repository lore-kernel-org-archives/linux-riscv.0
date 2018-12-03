Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD83C04EBF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 20:57:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5B220850
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 20:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9zQLIBX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="eXR4wHCV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A5B220850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5HEltgvwHjjpISJcFiAJVvNZp9MFi+3WUMgXqixjFlU=; b=q9zQLIBXPfOBpERqRNJqcVIXeh
	8waNYvip73iICBLir2zBUDq/ju5ft9cIatUPYFtEuQ6l4iFM/Uro7GqhE8zJFLNIgAE5L4Veznebq
	Xa5jxg3lg/pxi3vB4TKwCEPO0xat9YjeipbqZ+spUTEmzjmc2XHNUaZWfDQ1gC6Jtvn6g21UdYMbW
	7Ia7Iv/a7FHSuuNwBpd2Kv14RFIymBGIBf660hileun+CrTlEga1qn2+PuWmy8Mcm1DvVemY/HmuF
	Uk6q0p4ZrXsbTUxchA7nSZCoOJHPkJkZJbzZFd3PLtBiKYLVFniqI0T1HKQ/lAqFJDPjwT/sLqBG/
	O7qVdtlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTvHv-0002nw-Qc; Mon, 03 Dec 2018 20:57:55 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTvHr-0002jX-D8
 for linux-riscv@lists.infradead.org; Mon, 03 Dec 2018 20:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1543870672; x=1575406672;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=lowe9NWClqF4E9Y9BpuPy3f7/a/C7Daf2aZ8bK5IdEg=;
 b=eXR4wHCVRWE2QXVnOi795F/il5kJTFGA7M6GzovYK6ZEvQruyxMZ38CR
 pWbS4t26hjKItial1UmYIGS8WjDFIzPDT2a+QqBxHWPjoIPauEgg8MfHd
 6ti19uAFnIvB9MAxPi9t64K71XAMCi9OPzot8A8ERjQl18+BxqruKG4L4
 2yhuzDdMlKYMun84dQErgQJpjmQtdNKRFqoFDMych4HU6N9sUqiZT9hN1
 67vVF2ujcstjhLhS0ljFcuRm5Qzd7QuY7C/d1DW3sYuosQZQDe4DMer4B
 ADVb4okdFO/sDKNKOnhigD92sM+YepxNPu8wEzXo6poT05gajvv/sXM+M Q==;
X-IronPort-AV: E=Sophos;i="5.56,311,1539619200"; d="scan'208";a="95690459"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2018 04:57:40 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 03 Dec 2018 12:39:55 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Dec 2018 12:57:39 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] RISC-V: Support per-hart timebase-frequency
Date: Mon,  3 Dec 2018 12:57:29 -0800
Message-Id: <1543870651-16669-3-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543870651-16669-1-git-send-email-atish.patra@wdc.com>
References: <1543870651-16669-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_125751_494008_6146ACDA 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Follow the updated DT specs and read the timebase-frequency
from the boot cpu. Keep the old DT reading as well for backward
compatibility. This patch is rework of old patch from Palmer.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/time.c          |  9 +--------
 drivers/clocksource/riscv_timer.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1911c8f6..225fe743 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -20,14 +20,7 @@ unsigned long riscv_timebase;
 
 void __init time_init(void)
 {
-	struct device_node *cpu;
-	u32 prop;
-
-	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	riscv_timebase = prop;
+	timer_probe();
 
 	lpj_fine = riscv_timebase / HZ;
-	timer_probe();
 }
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 084e97dc..96af7058 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -83,6 +83,26 @@ void riscv_timer_interrupt(void)
 	evdev->event_handler(evdev);
 }
 
+static long __init riscv_timebase_frequency(struct device_node *node)
+{
+	u32 timebase;
+
+	if (!of_property_read_u32(node, "timebase-frequency", &timebase))
+		return timebase;
+
+	/*
+	 * As per the DT specification, timebase-frequency should be present
+	 * under individual cpu node. Unfortunately, there are already available
+	 * HiFive Unleashed devices where the timebase-frequency entry is under
+	 * CPUs. check under parent "cpus" node to cover those devices.
+	 */
+	if (!of_property_read_u32(node->parent, "timebase-frequency",
+				  &timebase))
+		return timebase;
+
+	panic("RISC-V system with no 'timebase-frequency' in DTS\n");
+}
+
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
 	int cpuid, hartid, error;
@@ -94,6 +114,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	/* This should be called only for boot cpu */
+	riscv_timebase = riscv_timebase_frequency(n);
 	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
 	clocksource_register_hz(cs, riscv_timebase);
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
