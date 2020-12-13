Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A13AC4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA69022D74
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA69022D74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HM0tU4okIFitl/FCRtlMAEFpffkxHv47JTbmlEw6PQE=; b=eefO48Wm23vHofE0s8ww4vfbn
	zWpw97LJnw2pxom7er+gDm2djQaf9akIay6QSaQqN6evFhjJeNUrKaIsrjQuXiHNmTMyIpsUoOfqD
	7ceFB/+fUdwb/RCVgpRntG37q9LeH8ypSLw2SKXd9dwcilWV2GqFiVDusoJYH/wAFCEBK68HGw8sG
	RSzYijkVSwJKj6a23e1XQ0lcs4p7mCUHYL+xJKcf0RoHBaYeowQJVcUy7o+4g+P6Scrt+0p/7djzp
	sfZGoSWcOeSKukWF8FnxH3GCVEAOMoWczh9FzpvQCp26JmLdS449Ho87VZOAPZS2btNKVnfWMGdzP
	yabPK9W2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMSe-0002Tv-18; Sun, 13 Dec 2020 08:10:32 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMSX-0002SE-Ee
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847025; x=1639383025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0B+kwvrbaYpEs4CIb2Eoho1O+FgaDjaWqzP4OVlKPRk=;
 b=iVUzS2G79Mq634ed0/YCm1xP7QMP+PdBPRH1LA/agKe/L1SWw6RVelfd
 ubwcMODCNMGzuwhkcU4YVbj5+OL+msl4hsCm8Qsf5vPg6uGio4epwYprI
 MQw/rWDL9yKi2lhjmimRuqfWpMZniblYBEeeAbBgfnPPBfJTJVjhe7IW6
 Cu8ykv20NuJ5YR9O4gesYVtCtB78WUFoCl98FTfemiAoT/XIMe2J8iX+M
 1tNV5mSRoOGgfqASMgVtlwDU1BDBfpSFqEq4tBUw1DbJGhkBuaksjPuWJ
 9PuPApTo28d5x6poqh8DHWzTJXmwWMRMOrg+YtT3Nno3PBm8QVMhNYBXy A==;
IronPort-SDR: kbDdC517VWQyjBmA2YkSBok8aBy5yC4zoB7gge2zgLpCC5215s4vILk3I6ISmxWj3xvnlMVSa5
 q1GOtwzBUr258jbKXItDQAtBV0eWpFXaFTYEDMBIvQmWzdk3Vzwb/WMbLXLyb2NZxf5V2Ypx/O
 FiO8SGZ16rjsvzWyYg/eTUogJWjkiqRuCYereJEKBRTUUn9a1KDeAG816YldBmQx4CZqdjmInq
 ltFaoRQRvnyzXpxTMtb4Ygc/XchlVAUeqmDGIIP10IHjTaVU7b8DmLwZblokABpKlf3oqpAL+7
 7IU=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235141"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:23 +0800
IronPort-SDR: hY90z/NDmx5A4ie4IWW57ivMF+MGuHQE4sNXXSLC8HFuyvWpX6Mi/42lmt4wu23pFoqkGs01cu
 HvtwhKt9AbRrqPAUBYib1Qlk+jjTUE/R0dh5CN55lqZupnLAjl0R3PcuS+TonQ3QW5YFr+zXSw
 cimlvFaiAVdY8z2+PToiYMWkZ0Sz7ENKdjw4rXyRxoCmoJE+ILtysHXi5VzDbgAQ1iuZJIYs/C
 dkDK/UB8XNhbKO7KLMzNC5IDHPxep4O4BrgheQcyXEPs8nhGGNgLz0eG0hSdIUNtAbg4Sx9gtf
 0N6ZPT6pgzK4c4kAiMDMqWJg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:11 -0800
IronPort-SDR: phBnnk65PusQ0bwYwHH9+1T1Su+s67k2QsMgEdULSzGcS46Ubk65GjC09S0GUpan0PLhM98qJX
 Mw2y6BJaw40FRuEobVcLRYyZvvur6PgWZM5VVenS9u4OpZ4p7VP0KUjDRaCF/TBj+tAGHwROda
 qGoBbM97pDs6xBuDvmqD37xB5vGO5pDnvyzQneI4beRCy+fO7OphgI3dh6Pc2OQWgG3AFve1r2
 zggTnck7PY15M/teoEl6cQC9tJYVcDpPRlGjIhzZlF1CDUVl7RYIRtDN085aJOtKRy9saaru2o
 xRc=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:22 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 01/22] riscv: Fix kernel time_init()
Date: Sun, 13 Dec 2020 17:09:55 +0900
Message-Id: <20201213081016.179192-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031025_658900_B52E4FCC 
X-CRM114-Status: GOOD (  14.14  )
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
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
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
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
