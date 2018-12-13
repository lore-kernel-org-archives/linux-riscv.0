Return-Path: <SRS0=TUPX=OW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C22C67839
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C30220851
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lgrdJ0gk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lcX5jR28"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C30220851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TzcV8asSxvOqGaFNBvilJPgvR18geP9TV+/l00BTEIk=; b=lgrdJ0gksoRndAEDayk8PyX2ZZ
	H+YMQWXZA4xCRPaO8WDY3G0lJzwL/OsW/iVm8Lr8iMGvYdt5YtjqxkUMCH3BuTlNo0/4p9jfVTJei
	zAb4OkqYh3y8dOUsibCmlZRIzydNg1SHBBwMtZs84VOZOc5H8AdC40IzVpfsfeNG7sJeqN2QKZqVj
	ITjVOXsNAF9nt3D15svOrtlqmNErzYv4hgt1C2Y3SQG53q7FrSIwq7uoM+ymUaeAZ6eZ91+sv81Ta
	pMTMKzoHkUSSgL0+UDMnZk0b+HhM1Q77xIixumdAGddGfTGQk6ZfTE3Ss16hjw0k0JSyOpU6eoNgW
	FPAVKCwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXaCF-0004hE-T8; Thu, 13 Dec 2018 23:15:11 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXaCA-0003WL-I3
 for linux-riscv@lists.infradead.org; Thu, 13 Dec 2018 23:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544742906; x=1576278906;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=BHWX4R4PvQqPuiagEVF3DBhfwi4Xf90NcYD4tNuJ0oY=;
 b=lcX5jR28hwQpfzpjjSdI5dDQOdIA+FQehPXYRWvL3u2IQue9vI0NS4RF
 Tms+6d1NoA/J+GRS/Igd3RFSo21eDVx/RWSGC5bY8z3TRz2WAwEJTWAIJ
 UU0SEALgS6VoRT4lYYccyd23yMzoOG0oI9ZDEoNEvxN6qRphZDItG8c0T
 /7QR2IhJJ+pOLY6ZDEzHHG+wRQ8soUVfxWfZxWnoptoofmv/czyRLmN5j
 wzk5bKuhIwYlYMoK0KeKy12GMmwcGnjB2oDGm+edyC+HIqxmWoet1mXy9
 7fH4VuAJdaI71uvWtuNjPh0PKshqmnBScqVRnJ+z/l8PqY/kavKLclYgw Q==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="97770434"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 07:14:53 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Dec 2018 14:56:27 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2018 15:14:54 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] RISC-V: Remove per cpu clocksource
Date: Thu, 13 Dec 2018 15:14:28 -0800
Message-Id: <1544742869-19980-4-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
References: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_151506_806460_A880BC96 
X-CRM114-Status: GOOD (  11.87  )
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
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
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
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 drivers/clocksource/riscv_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 75262409..c9e65086 100644
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
@@ -115,7 +115,6 @@ static void __init riscv_timebase_frequency(struct device_node *node,
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
 	int cpuid, hartid, error;
-	struct clocksource *cs;
 
 	hartid = riscv_of_processor_hartid(n);
 	cpuid = riscv_hartid_to_cpuid(hartid);
@@ -125,8 +124,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return 0;
 
 	/* This should be called only for boot cpu */
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
