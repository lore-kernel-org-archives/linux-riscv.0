Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37050C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E483D23A6C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E483D23A6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XuK/QRGtqKP+5UJecutJLUJ9yfLlE/VrfxcC3ZZk3vs=; b=po2djuBooXz8S/9IMLMG2GiKP
	OqMvsf7vTdbssEvfBme6UNKC27EaAPo1NGyom85WbiaoiCTffeFg3+P5qFuAmTJwYXCDuANnL+Boo
	3doHhIYehtdmrh6T7Pdh4d3YoZErPhOH87vlkrRZEpArqyWLojop7jiUVnDO0zhbt4ZSjS2khU5hB
	NSn5O+ccyEAGQhHTSnxiYZOWDKp0aTTY5/irTKrIY6I0fKJ1fpR6Rqq8W2XlZbASllMMkYyVOH4aa
	2+9KMxrj31230OXQqNbaZikwlRjn57ay2Hw9mn/7QChzT1tMxUfOVRn7KcaId6Bit9QkUjyaZ6Svm
	WV6vORpVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXVg-0000AL-ES; Tue, 08 Dec 2020 07:34:08 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXVd-00008V-6A
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607412844; x=1638948844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EAsgY70FjzgQvwdP24wPIY3ZkM4SKpRDXaMvRy+2s84=;
 b=IlNYql25E3V6EcASEX49Tu2ABuhfprlWEGDf3Fefb5mzKo2W/42J9qQ5
 W2MAsnqg+3MYrzrEsEdjHzdtYGnlSPDu8xulBc/f6t6qratuTgbNPkYZG
 EvjarAK8nEHQY44m4PUW4I8ehPk2b+SA7r+cN3fXPfnomZ0PTM0ysX8Qd
 wAhRhTIk4nTQI98rBErwCrGVPnNq8/HlmCo3wd8N09AZRzSXa4M/OBW00
 dpaIocreamAeDZzjkvd0ncQanLL9GRtdV0M3MQLEbXFflXxRsLBl/u9kA
 6JCeWUF1GcHTLOdeQ31ep6VwfqHciZoRUM2JwufNi+4M2uSWREGvzp9KF g==;
IronPort-SDR: emezr+PFwv5neXEc0Xyh9oPV0UGal+JzavEZcmJKsu3UJCrAA7lriQDywamYFnQY86+bxcZNzY
 718AaAvNUGHK90WmFqOu/89tyf+mD3qNuVu80iw6IjWlR63/KyjdQ1GAzZ0x/FszJA3aQj79pF
 eQAkbUhqiOKV9R++jMNzrSR8UId3UuJ6Gj/PYiDhQEUi1xwLlpLK/mavFr6fQ0130iJdHjF3ZQ
 QIBASsx2avIvnJfxohkmgarwa+/lyXkgnmtF00Sko7e3XNceXr1gs87WtCsHyMtiGiwEzUzYeO
 ndw=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; d="scan'208";a="154714879"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:02 +0800
IronPort-SDR: ZpQ8kkv+LLzzZ7NYKnw/QPV4eA/KCk/d2GhBaMZCCElx3DzlOuFv8SRUkYr79CzErrJTeKJmUt
 2glxXc0KDMhDjBTUae5QHLwkcd1ZnhMs4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:19:29 -0800
IronPort-SDR: eWr/RwVIt5JY/4HEWKoubTNTXERr7r9JzXM5dmkLUZPAD9BYIEygiQIGC42pccotnhRthnIvFZ
 brgkVJfctjvQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:01 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 01/21] riscv: Fix kernel time_init()
Date: Tue,  8 Dec 2020 16:33:35 +0900
Message-Id: <20201208073355.40828-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_023405_419730_E83B991F 
X-CRM114-Status: GOOD (  13.03  )
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
Acked-by: Stephen Boyd <sboyd@kernel.org>
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
