Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E24DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 21:54:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE992175B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 21:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mviOTUmW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dy6q7q6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE992175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tu/uhgITR567E8eTcvV7a2K94ofyfaZdyNwW3hPPHoo=; b=mviOTUmWQu0+TL
	44mmus1IDifwM0WFsH3Z8RhWuppyxXz9CLLPxGHNuTLJyNJCOPVWCS0cieOdJYJZi0FsPTN9iI00X
	C++jtclm/BGYCqcuK1bF/3uIGlUqvm3u+TpQP3+I8z0RkgQhQhX8HKcbzTirImuyyBSFnHRczUpAP
	ipSZsaattLht0R/uqf+ZDItdTBdPfwNUgeji74wuWeTazkdAVEtN4CgpfwwoWuy9QM0KAZapaIEI0
	ewPafsuoCHn+wG/If9ayFxzg8N7TamBooKWP4VDgSwxnyCQfQSFHYlt1SK1K9pmaYPL7pttPQs/Iq
	y27FBmZhppimFsoXetYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7S7M-0008Md-7X; Fri, 22 Mar 2019 21:54:24 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7S7J-0008KZ-Mo
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 21:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553291661; x=1584827661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RhPWR/oqGZTHzl6ZH9I2xdRDXGA1istoNPUJXot1OEQ=;
 b=dy6q7q6ZcIG7QsibnSJ+Py4U+aq8N21pRSidQeRWfOSGpRUmRY3EVvAo
 ojxglfeu56o9JTFVN8110vB9uOqGYRLdfqILdGOl5ifUod9yHDFd6cl6M
 nc8O8m1OrRM4A5MHqwt1zQ8TaU5kkQX0jQ7o66fAfubqhN1DRoI7DimY+
 RUj4cOPJty2u4Duq2zjuOIbZrbou01z+Ao4sg7E2Qse99fWXtDxlyTVEY
 eiQoDTcMu99qnC1greBRHp7SLwCk+JyaR5K66Tir7QH/7jh/bPFT6lsEC
 AJia0xbal+SkUCt1qz8FYgYDZ8IBfwEYmK4uyi/w4Q5Qc3Wr0KDSuUR6+ Q==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209606996"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2019 05:54:17 +0800
IronPort-SDR: XtC2z3R+dxRYscbJUqd/sfhkcphcDcYqR2GDLdAIRxjs1ZJYH7z4xxDA8NdftSRpkSNB7BFPSs
 zpHjewfWg+fndanhC+THVfJasdURIR05sNXzFIKK58pU2ofcgUuZYhCw8dueNIgf/FbwrXo7Z2
 MtFFwxYpmaFthp6jJy2JUpir95muK3cfnC1bqKsuA6io0KqQB3w/RozibHp5fpXTLl2MSNFn9t
 mz0xQIT0oapD5NZK4mAb5eVoJOn7HedtcUvK2Ip9qFER+/jDCTlOqoV5k/fo8jyXoVQJDqTyEh
 jR6oXtlzhAFfA2QRGivbtLAV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 22 Mar 2019 14:31:50 -0700
IronPort-SDR: LwXnijMbOfyBZ8NEuujdKPU+fNSGF47JW9DaLSOW3DyS+/X86awOTUCEsn2faPgtSJMcamZ9+Q
 jGj7Qz5KHgywPODC+dkiCehua8+zh+saiIHtVs9sWz7NU5YgGoCfHVR1gqLmzNOMX0r/cXd/Ex
 8lPU/8WLWyvtBHN3cyDD867UQlsCuI0KToAB+nc6JnT59n4TxVNsan9K6KlRUBoEXruQo/0S6L
 qXpxQQOaShsxhz5XFSSNAor0cQXnty/aZvtJT5UbX7uTUL7LezoDDMgSMlnkEmz8AlEHTcmJha
 lPU=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 22 Mar 2019 14:54:17 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource/drivers/riscv: Fix clocksource mask
Date: Fri, 22 Mar 2019 14:54:11 -0700
Message-Id: <20190322215411.19362-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_145421_892748_B8199597 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

For all riscv architectures (RV32, RV64 and RV128), the clocksource
is a 64 bit incrementing counter.

Fix the clock source mask accordingly.

Tested on both 64bit and 32 bit virt machine in QEMU.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/clocksource/timer-riscv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index e8163693..5e6038fb 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -58,7 +58,7 @@ static u64 riscv_sched_clock(void)
 static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
 	.name		= "riscv_clocksource",
 	.rating		= 300,
-	.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
+	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.read		= riscv_clocksource_rdtime,
 };
@@ -120,8 +120,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return error;
 	}
 
-	sched_clock_register(riscv_sched_clock,
-			BITS_PER_LONG, riscv_timebase);
+	sched_clock_register(riscv_sched_clock, 64, riscv_timebase);
 
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
