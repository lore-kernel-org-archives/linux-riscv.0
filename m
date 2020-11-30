Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76236C64E90
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:48:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 042CF207F7
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RnrzrcvC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="hwqrVoTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 042CF207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HgdkZNYMxqCOfYiEsDHq/aWTxAmXkd6sorK6HDMzdOM=; b=RnrzrcvCmLFTz6HXLpiAvQEb3
	b3AdubJlRzf7bjm4I336LF7E5+LOg/3rNgn5dgk5xDpR2GyG7wf9lCnEFH9yeBphV9RC0yrlOn7jn
	lhbIU4OqXV5xXizAjKcWkXFjB3CTvdHwDVUIvE7AaF7XWfe7/Vv4ZpHqxE1/f1pfnc/wArjZZTOI+
	+0DAFjle9617RHmO+38YQ9HkIaXZJhXePG0gY+d4Gc0rzfPfyG5IGFXx98hWyQ89b8m5BljO8xAxF
	Dazy98We4o7HnTUYRGmVH8L6yvEea1obcalzD7cNOFgaBf+LCZdjXXOMwlowR4NMvNpC4yca0l+vw
	tZFQqTXcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsuR-0003Bx-68; Mon, 30 Nov 2020 23:48:43 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsuN-0003AJ-Bh
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 23:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606780120; x=1638316120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9FRj9UJZUXbJ36h9NtK7sWhZkQHQ9GoiFFCz8CrFtg=;
 b=hwqrVoTuTBgXXfhkpFvEe3pfeoKMoI0IopmKOljYz6poxGEgHHIvQP/G
 0n5SYTX8N6nKy7TAhugwPmz6Vug3p+rHanQGphgqvY5gfuAAjlec2v1sY
 5N2jbO/wzb2LAURScRGEtOkkkF+BBU8WMu7DmR5waPqMj+i3il/OT1BL4
 +qa+nYDj2TgeQvEStctWMUpBshw4/wND4WgMUy6iuEd8//FK6kdFSkT5n
 EilZnvZBckUnsk73Vx9SVuKCjycHaMN/v46LoUG3/rTefLNLmPEPQCeye
 7kEnc1mGTMj/SWIugHKQ129omTwxGI43Jn3gA5PF6SERpGvUDibnfmRC4 Q==;
IronPort-SDR: 3J+3PUzXhoqex09T+gPN9iAjp7c5X3OrV0pZpstwYvYh5eh9m1oxTd+hlbOR8Pr6dPSrNU8kGU
 /6007VhPaWTGVSRMDHALp/vVfesLo0PS6BWo3/RXj8dBXWnjLo7xF/UCNo1VjOVdbQuF09NMTc
 nhVzwbZKIG0+f74SXORQEa5GoBUbILPr3TLAHteA43l3cXx/nInpMofdjS1BgqN2J/DLXnkCAV
 XsKw0yMGLc6IrGcCQmJoKzhJhyuAM9gb1jI2f+RkHsY/Rl7NdFEzaB/CQXFQ7ElOxSUIeRkDk2
 QXM=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; d="scan'208";a="155058234"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:48:37 +0800
IronPort-SDR: wP9YebyfkIFU8D5BtCQisuAkZJfXJkiCfxyErqYHW8io9ulL8/xVJYwslZOVFmq+4QQnqng2eK
 5SG5ixMAng3wbrNjDx/5y/+2eisplvilY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 15:34:13 -0800
IronPort-SDR: +ptkU0/Y8NRXbHNRrzVT9Xa4Y3qmDOAY91yo5bnhnR6tzgrfDf6fVym+qn6N4XM/f/sG9pGyXP
 5wnhHyjWa4Ow==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:35 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 01/21] riscv: Fix kernel time_init()
Date: Tue,  1 Dec 2020 08:48:09 +0900
Message-Id: <20201130234829.118298-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_184839_563252_2DD40F1C 
X-CRM114-Status: GOOD (  15.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

If of_clk_init() is not called in time_init(), clock providers defined
in the system device tree are not initialized, resulting in failures for
other devices to initialize due to missing clocks.
Similarly to other architectures and to the default kernel time_init()
implementation, call of_clk_init() before executing timer_probe() in
time_init().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/kernel/time.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 4d3a1048ad8b..8a5cf99c0776 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/of_clk.h>
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <asm/sbi.h>
@@ -24,6 +25,8 @@ void __init time_init(void)
 	riscv_timebase = prop;
 
 	lpj_fine = riscv_timebase / HZ;
+
+	of_clk_init(NULL);
 	timer_probe();
 }
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
