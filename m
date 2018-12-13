Return-Path: <SRS0=TUPX=OW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7731DC67839
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436C320851
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 13 Dec 2018 23:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ouYjTMlT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="aRo516yc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436C320851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BUveTPedEdiDu+snkhTsLkmRxilM/eIo4KIJNWY/YVU=; b=ouYjTMlTAHBZrOR+Dni5Oo5dxG
	H73fyJAQhh88SPew6Y6Pecea3VfrRZcpuAcyQh/hW+OOpXi8kt21xuP/SoctiXqLuitRdGS1c8zoZ
	vt7zivzwG+O8Ttw0gJdPJMD835CMyxyRJSaZ/cMpGw9Q5/Sgsi1oD7xYfPfIPbxgeL2vaKIhYzcg6
	kIpn4PPNx5BeG0qJO/C/oQov3OuxRpCi8Wf1I/jUf8ag2dPsfG1+8qD0MSdPI7RESZiBF7NYd02+u
	iOwUVfYxqGagI8LKieQ1c1jcFBewy69z96tTqwG+3AvIuOaU3zQiPAYnn3VlTjzMg1JP7T6L6HnJs
	qCprG0Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXaCN-000513-D8; Thu, 13 Dec 2018 23:15:19 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXaCK-0004Ef-Oz
 for linux-riscv@lists.infradead.org; Thu, 13 Dec 2018 23:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1544742917; x=1576278917;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=b5KAQRZJT4zUe1BE7oYg6So4dJiL7LJW7fLH12Vxeuo=;
 b=aRo516ycdkojMFEeu9KMa/vfsO+IEFQeydxpi0h2WwBJ4u1F+4CS/A/u
 tHz/t4EFiWFhwkS6gf7IrZI4pb70KzwsAYLjUls1rJX1EgruIeqpsYF1R
 ghWTtyFePBI1XGSQ9fk2XwgJSjB02zlGmJWvhIaoEXhjcmT2gRz9qf/ru
 XXFFBLBjHi0KbPNf9Qq/YehkPuDYKyqSDC+HMdEICMy8tnhARKQk1GeTD
 PiwvT+HKjmlnv5YtTYjmxDKzLsAJTMEO8YC7fRSb2wsVp1o1sInMX0DuJ
 gRybdL45dFWtBRtEFhs87sMaJbCZCE7Q4+kPbxFBQwS6S3aQmqZJ9ScEf w==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="97770439"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 07:14:53 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Dec 2018 14:56:28 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2018 15:14:54 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] RISC-V: Fix non-smp kernel boot on SMP systems
Date: Thu, 13 Dec 2018 15:14:29 -0800
Message-Id: <1544742869-19980-5-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
References: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_151516_969502_FA0243C8 
X-CRM114-Status: GOOD (  12.95  )
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

Currently, clocksource registration happens for an invalid cpu
for non-smp kernels. This lead to kernel panic as cpu hotplug
registration will fail for those cpus.

Do not proceed if hartid is invalid. Take this opprtunity to
print appropriate error strings for different failure cases.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/clocksource/riscv_timer.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index c9e65086..c1e1260e 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -117,6 +117,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	int cpuid, hartid, error;
 
 	hartid = riscv_of_processor_hartid(n);
+	if (hartid < 0) {
+		pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
+			n, hartid);
+		return hartid;
+	}
 	cpuid = riscv_hartid_to_cpuid(hartid);
 	riscv_timebase_frequency(n, hartid);
 
@@ -124,14 +129,19 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return 0;
 
 	/* This should be called only for boot cpu */
-	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
+	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
 
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
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
