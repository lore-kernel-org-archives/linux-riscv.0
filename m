Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F3DC10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 00:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4643D218DA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 00:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OXc8/9am";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TR9CPVKT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4643D218DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEmIcBCm+yuTEf/KQqnPFoIbu4DeLePYO54f/rpip28=; b=OXc8/9amncM/jP
	bt7cFGsYiETv+K8E3dpLA2lFMlO2bpSq5DTfpHXto0+4VlLpaVMi0sa+oGqgk1+5GgV607enk56YS
	Me4paHhlOcCA/P/CpvgJiNiPOL0m5Arefz/sSI1i9F3YvJ7Tsb8JkJe9ZLH76LmBcpyPEJ1g27vvh
	38WoaNquUa0g6eOtVjBdXR38Tq57eaDPcEniGbe8/7jtc+JJlbWsK0QOak3b/olUlxQ7P1KJZGt/K
	gETV8gyNuZ9aOxTh/HMlWRa3i1ZA9yoa0x6mZkU97HWfy6z74wEaMMagklp5z8CG8nMDBgPha29rB
	zwZcDO2ko050/93oQclg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ5Mt-0006GP-Uc; Wed, 24 Apr 2019 00:02:31 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ5Mq-0006C8-0e
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 00:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556064191; x=1587600191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R2/5jwhYTGQ1JCFD91I9OK6vJ4c5B03XruX+Wm8H9FA=;
 b=TR9CPVKTUhnDX2uq6BxtrvAxf6c6mfh0lFGMr7fk1PbguATXgBqvmg8N
 /+SJgl2hkSBHV2rfPpBmdqEUqQVj6jrnLrRVA92IJB5KshuqVVvuokI8V
 HD3BKSxZneMvf+NoJxJkjPDjhlcZvFb02B5V5WDnfz+CtmiupYr6miS3f
 FcjwbP006G6wIN4JtyV5fmhu8BpdOLntaVurrTqvTU9yPm33UwYNgeVne
 zBQaNpbfF3TZVporBlw2cTUhUQJQjqXFogPM/19I4QIHVYhI28ygS++3C
 jz+G3GZrPcPv0AVJwgY2p3NXxt0J4nvJrdCAhm6BBPSNA8pQT+IBZRKY+ Q==;
X-IronPort-AV: E=Sophos;i="5.60,387,1549900800"; d="scan'208";a="205772516"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2019 08:03:04 +0800
IronPort-SDR: grBR37vvZXqO1DDdYe/P90/K/CUsfjdRosW1Pp/ob8W/qeusL1wuLASdipAuJNoITaWs+OGcM3
 EPwa62LJ21/rQD6XHR0BmdiiuLibzLfo83PPc+Ufzw4CC9ed/WZFNqrCT8bfCds+SnP+gd/8NB
 EoFGSZQ0eI8UJ1FAyV8PdCCybuDn4Q4lhkR4zyjuikztshtwSf6qjuQSnMEIwYk/XmTnuWYqqZ
 DD6TA+LxN2Ct8DNy5A5WuAwnUYXDo1EEKIrENHD+uM5WbFaUEnwFx1x0KQtM6B9h2Z6ENjXBOs
 SW636deoO7sYxDzUQBJwLzlM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 23 Apr 2019 16:38:55 -0700
IronPort-SDR: NOADQjAz6eLB2ulCCRn0+vCTxLNg3viC5jnh/ICSir8Y7r7k2imFel2bN3hhmoRp27+eU3dYJf
 dczho/LE9GN07SkGgbRHzTsVH8kpxmDjIc59M4xPaySkAJz0YlHVzrkM+bNB9ZrRyHPU+jmjOY
 48qdQD3mtEx/LVDzKuxulu/oo9wUD1rI24jeT5GHLO4zUussvi67gVyUoIzqdIfQB7D1Ppmd2W
 UHd+PMB8bnry9ucwR4iUGlShBY87JUyTKqpTp1EtRzNQmrgDp17hFl1oQG0sd0iKfwEOW01eqC
 YHE=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2019 17:02:23 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] RISC-V: Implement nosmp commandline option.
Date: Tue, 23 Apr 2019 17:02:26 -0700
Message-Id: <20190424000227.3085-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190424000227.3085-1-atish.patra@wdc.com>
References: <20190424000227.3085-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_170228_100963_485126B3 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

nosmp command line option sets max_cpus to zero. No secondary harts
will boot if this is enabled. But present cpu mask will still point to
all possible masks.

Fix present cpu mask for nosmp usecase.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index eb533b5c2c8c..a8ad200581aa 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -47,6 +47,17 @@ void __init smp_prepare_boot_cpu(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
+	int cpuid;
+
+	/* This covers non-smp usecase mandated by "nosmp" option */
+	if (max_cpus == 0)
+		return;
+
+	for_each_possible_cpu(cpuid) {
+		if (cpuid == smp_processor_id())
+			continue;
+		set_cpu_present(cpuid, true);
+	}
 }
 
 void __init setup_smp(void)
@@ -74,7 +85,6 @@ void __init setup_smp(void)
 
 		cpuid_to_hartid_map(cpuid) = hart;
 		set_cpu_possible(cpuid, true);
-		set_cpu_present(cpuid, true);
 		cpuid++;
 	}
 
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
