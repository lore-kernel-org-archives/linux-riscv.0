Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F53EC43444
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B56B206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JvWRLOgW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dT/I3FdO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B56B206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MelWyik/GvTedYzr0C70EUDI4YFAIhb+oANEHLcLFj0=; b=JvWRLOgW7kYqU6yoWjwo2SrzB0
	lQIUfjqX8WdVBtu1sQiovvDRk6quG3VdnnZI9AUUjf2tPW//PmTyLiJ+IEvCY2VEE8HXtd/iJKVLQ
	V2tXOMQwZHaV0EeTvD4P6/QSMftk0RYbTv7ITwgY4liSX3ASYbhXrh0YZPI2RyOTZBOD0J2MDvjl9
	BzNaFc8j2LdU8vq8wdQBHtDNamjpAgjY5MNBnbq9zusGNMe2tX7vK2duyaX0UtC4NZJHvLEZQgeLa
	YO4ugLROyNSCa96TfNmkWnDNhReGbkrxOwB21c7zHyh9sUoZe6t+uXsSmy9+Fm7D7IEVMdIM0NtQQ
	W4qKs9kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggnqe-0003yL-Bh; Tue, 08 Jan 2019 09:39:00 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggnqU-0003lt-SD
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 09:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546940332; x=1578476332;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=EOWNqUgwtvE7+G+LcAd3R3IxmYj+WfEqytDyPfTDJSM=;
 b=dT/I3FdO0+UedEahT3/fGcReO1KaV2gNjHmp0Jcq9K/BPKLL6DeNk4V5
 tG613nsaDKHGgvHAsib2GlOhplVIvLWA4bPu9vSSyYSTTGiHv+0KcLFU4
 vLGUMKmNf54edcQhxwgHnTQuj5anajSWAZxt/7WFNqRGKZhwf8QQjGhky
 ZQcpG4+s3z1NK3f4Bd/pYPFlOtnV2jo7KYJffWGBYKgav+PI4qrGy+u9I
 b8woeV2Z5g5eCA49mxQXCKawovQjg7R4wmmivEHbuQ62BmImtUzJ9Lcno
 Q68Tqod+yBwX5aWceIUF31fNt5dAGnFlktk62bbTY3OO334//CO6BIqPv A==;
X-IronPort-AV: E=Sophos;i="5.56,453,1539619200"; d="scan'208";a="100000258"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2019 17:38:48 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jan 2019 01:18:52 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jan 2019 01:38:47 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2 6/8] RISC-V: Add required checks during clock source init
Date: Tue,  8 Jan 2019 01:38:36 -0800
Message-Id: <1546940318-9752-7-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_013851_011272_6C0A160F 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, clocksource registration happens for an invalid cpu
for non-smp kernels. This lead to kernel panic as cpu hotplug
registration will fail for those cpus. Moreover,
riscv_hartid_to_cpuid can return errors now.

Do not proceed if hartid or cpuid is invalid. Take this opprtunity
to print appropriate error strings for different failure cases.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/clocksource/timer-riscv.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 43189220..d9b914e9 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -95,14 +95,31 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	struct clocksource *cs;
 
 	hartid = riscv_of_processor_hartid(n);
+	if (hartid < 0) {
+		pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
+			n, hartid);
+		return hartid;
+	}
 	cpuid = riscv_hartid_to_cpuid(hartid);
 
+	if (cpuid < 0) {
+		pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
+		return cpuid;
+	}
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
 	sched_clock_register(riscv_sched_clock,
 			BITS_PER_LONG, riscv_timebase);
 
@@ -110,8 +127,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
 	if (error)
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpuid);
+		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
+		       error);
 	return error;
 }
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
