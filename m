Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8667FC04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 20:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55CA420850
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 20:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C/0MppDc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="H9BWdq0W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55CA420850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PhkFuabG4/FItqrEvGbDMAWJ5Pvnhx4/0e4A1WCG1BI=; b=C/0MppDcQjL2/VTADAfJORIbVB
	R+qbM9Nz6LAxql0/4EWBaIGvx0ZY4mXe753vVXtm44McXac1n/qFsocPUVju4d8EZyCkwhh08sw+V
	WlsNTQnqAyY5KR3xkNp3yGoBpEod8GOHcmQNmWDpwVUAHZiED72EPLNKJpaYGvI859szKxZODxyKU
	SyUseszJ5Z/rw19sfMs2Q0pCGUuJ66loEE0GO6jcv58OMNueidwLzCPF7T1dLj7dQ7y9UeH8ABYXL
	5kaUm6BQf03+3X3jiegNDw5E0x2GKv9gka0XHfGZe1/IRefZ2t4vk2jGpP8rQMMhZeG0sqhE9kskd
	a6+6BEXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTvHv-0002nK-4c; Mon, 03 Dec 2018 20:57:55 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTvHr-0002jY-H4
 for linux-riscv@lists.infradead.org; Mon, 03 Dec 2018 20:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1543870672; x=1575406672;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=gT+4+YOy/e4V5jGHXisg1EpxZnAGQEmnG+MEmJ2rGdI=;
 b=H9BWdq0W4pmOSNd/kmWv5k9C2eVdWMDHgQkN59Wvwh1IgOw59+fYBdKM
 9HokpPXn+gbt2BjFFVDXtQhBB9eYuyzaBsGa6AXTd8xmPVHXmlzErx9ep
 YLvDir7QQGLGw/SVgiYMUUvVIF7NEhABL+WLA9LUW5XsV7uTHpKgN90tZ
 uVFkqgBwpb/HfNeYx2TGFWeLC5xeoXbHW17GC2E5uDZ6tE0lNwVz1lQC2
 iqt5BxYrrhRrCOXfoj1V25C1qgnxE4NIz+RMdXRtkOYuahVC3lK1ZZEJf
 nSCHonhbgRqyh27neA28OuBsrQJ2xU/kASZocTZoRuQdTWwaPpGkkhU1v Q==;
X-IronPort-AV: E=Sophos;i="5.56,311,1539619200"; d="scan'208";a="95690461"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2018 04:57:40 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 03 Dec 2018 12:39:55 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Dec 2018 12:57:40 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] RISC-V: Remove per cpu clocksource
Date: Mon,  3 Dec 2018 12:57:30 -0800
Message-Id: <1543870651-16669-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543870651-16669-1-git-send-email-atish.patra@wdc.com>
References: <1543870651-16669-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_125751_653571_3DADE83A 
X-CRM114-Status: GOOD (  10.45  )
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

There is only one clocksource in RISC-V. The boot cpu initializes
that clocksource. No need to keep a percpu data structure.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/clocksource/riscv_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 96af7058..39de6e49 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -49,7 +49,7 @@ static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
 	return get_cycles64();
 }
 
-static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
+static struct clocksource riscv_clocksource = {
 	.name		= "riscv_clocksource",
 	.rating		= 300,
 	.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
@@ -106,7 +106,6 @@ static long __init riscv_timebase_frequency(struct device_node *node)
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
 	int cpuid, hartid, error;
-	struct clocksource *cs;
 
 	hartid = riscv_of_processor_hartid(n);
 	cpuid = riscv_hartid_to_cpuid(hartid);
@@ -116,8 +115,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 
 	/* This should be called only for boot cpu */
 	riscv_timebase = riscv_timebase_frequency(n);
-	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
-	clocksource_register_hz(cs, riscv_timebase);
+	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
 
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
