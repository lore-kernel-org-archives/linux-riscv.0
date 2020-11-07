Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E9CC61DD8
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D94520704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XIjAsSsx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="b+uoicjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D94520704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HgdkZNYMxqCOfYiEsDHq/aWTxAmXkd6sorK6HDMzdOM=; b=XIjAsSsxZH7TmaLmUgaUADn9A
	OTpjDTVgGFfdqMdU+BWYhVtCgWg26byCjGJ0nh7+gwv6iDBpIezhxOXrQ+p3aWECwbZKcBnrbZ+a3
	+6VvFdyvxEio1S+0qlriLhdijFoSA7VSMQNX8JC5LhS2ABcKh/QNhW9ZOMwPOIz3G9n0y/zVsvAUD
	rgDkltz0bEToxoM+mv4Ulqx91yBcRgtsRtVlGKJnRH/tJK7+YMxdAQ8FBe7sV6Q3scJDRCyl8WQF2
	cv0+z7iU67O25OxgzkUGHOCEmUSIlusPfNelHuvc/ihwRp43fU+iyEDz/hyVUGxO7flVEwHK0DjCc
	rfJkawHtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJN5-0000aP-Br; Sat, 07 Nov 2020 08:14:51 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMz-0000PH-JT
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736885; x=1636272885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9FRj9UJZUXbJ36h9NtK7sWhZkQHQ9GoiFFCz8CrFtg=;
 b=b+uoicjH29u5OVXaeo3l/tlr0xmDcIOWiZCU3aNdSPWCdYzmOmJxzgsK
 w+p9S1012QEhpXnivYO7q7ghPnjPbNDuIbDt+dwgBg536ja5wFH0i4UIP
 CBEjs7cYKO4e/Z5jf8rdofngdmiuLvO/2ZgP846fuy2kRjPanbBB3WUPt
 d56zAZVw/BNhaYJN4mJDYXm7fsNujc94A36D2cVHtbqnpy7QkaJqzGUbE
 W7NzGqvSrQB/REJCwiqAQJoqnHMuAezetFQ1XUHDRGZXnXKqyFdnQtcT3
 U9I2PsZ1pXySPb8k1spTN3pWX9Sus/8YQP1KpZ6Q7Ih1+UyqcDtQlVLsH A==;
IronPort-SDR: zcshx7E1fIS5Ka4P1LomE+6KL9EBPYzTDRrcPRYPLoI6pQpk105oU52ntCFqb76FHcdDYqiSKf
 3Wgk3k0NYCLzYQ+E/hgvVAV3C4CnfFs3syGhnnh47B2xIa1t1FP0fZXBVkijp5P6exX3MDLeyU
 4lE6453ktOuM6JiAT5DyLyydOqM2FnMt0MfW86VNqfQbGUOhxj/WiFQV5nQoNVxrheuMO3mFld
 BPTQok07bUtvCq5YwDNkHWi3KLi4ru3CbgvZvVR8HULGCGYzwLsXATWtb6FVBWKdpO45x1EWAa
 vyM=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079278"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:45 +0800
IronPort-SDR: LRMjJD9Bq4QU+ASyjRjnW0Aej1OK8LfQQuMhlV6NE1YNwgdpkw7WMDShhnlleCyBJjZxBOrVZp
 eXml9P0cvKvln3cLiSy0tga1V9J+enIygjSW6oZPyzibjtR/IhE1sOqlxYVMOxhxPW4qW3UHoF
 +p/EEADtPRZ9yC2OHVc47PhqXTE0FwCEuRx4wKNbDoTb3qBlltjOz4ob6T9vxW4NjkUUyxENS4
 KbW6ewbWiGWLHoZihL8JHSf23fCEjTcbm3X4MkIob9qI5WmkkYhf3zJ2rtsdvPX6AKnFW2aUS0
 QQxy0Ujlep13XwKoM/QWQWuI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:49 -0800
IronPort-SDR: bsAAbPxhXeDIy1nlJsSKE+tRuqxbWo1/7u+arvpKA2lAET/QNMdr3zvocxX2jbfsbYlXs9bvEO
 Fm7DCw0P2OdyDDyO2ze8poOfGV6zbZxsnf4uvzPO/I77VGMirVUC/ruEYCZ21viQipiAvKltd4
 CSNJIPeYmHIXmXrY4IlkHjE2ulrcp5b1uv41XbSr3JQWSRW+Od422ooQBDAE/kIy/Bhs4TWrfo
 xOo9kqfar///MEnTLDERFeB6QRkOV51jFB0kQjo3ADnzaiHY9oD9YsBVThclN7rcXFYmh/0J5J
 MZs=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:43 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 08/32] riscv: Fix kernel time_init()
Date: Sat,  7 Nov 2020 17:13:56 +0900
Message-Id: <20201107081420.60325-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031445_926351_4FA613C8 
X-CRM114-Status: GOOD (  13.06  )
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
