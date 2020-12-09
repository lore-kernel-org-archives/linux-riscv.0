Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E723C4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 05:35:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEAFD23B4B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 05:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEAFD23B4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XuK/QRGtqKP+5UJecutJLUJ9yfLlE/VrfxcC3ZZk3vs=; b=GWAXhL1W9tBv1lig0VEh3v/fG
	R6ltNa3Rj/s7dHwQXu28TIsnxqk4DQXZozUqPAyHxC83xI0ifsHRRvc4kPJJMBPKZlyeiwLpqsCsv
	D7+9I5haZMMvq/RanexgaEX3jddjCAe2oM3f8w4fGFV68FEaNlKhKT2SMRTha5PeF4TTM5/cGJOtY
	LycnVnf3tb4B4v3rTDmelksTmIOoJq/9F5b1UGH0LJcS3Rux2G7lI/8etdyLNaq2SAKLmedNxUKBB
	oJdOAtu2OFNFM9wOGJz77t0J3U3p81wmN1g5poIl5Gk0XURziqVWz5JIASLxCpAMB0m3N81wVxwVY
	9j2m2E6OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kms8B-0007or-Mp; Wed, 09 Dec 2020 05:35:15 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kms8A-0007oD-29
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 05:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607492323; x=1639028323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EAsgY70FjzgQvwdP24wPIY3ZkM4SKpRDXaMvRy+2s84=;
 b=e27tnMX/kSPqwhSqo4GTY1hq/2uAQXHp88+vWUusVmGfNFEZRB48esvI
 QG17q3wlsKUbkfcCyu1rFe9WNL82GoK9OVfFDhvxSsRnEKzg3oMTnNcUs
 ebIgJ3KXcMotDVqDiZevvotSMYFeJ8XgGtN8FyIo7v1IwJqWeHXVjXEbj
 /2HCVsSBnHreFHq63EhM9cJd+xSdwbq2vPkO/EQ5fpklM4FvX2Aq/3Lcl
 UURBpDZFYZpIkT5oIYQ8LMv3p3rPjpLj88R08/zHyTsRvq/yW9QvrW/r2
 Cyco0/TetgKxN9aEvc03oARSxnFw+mnr75dDJT9eMR3sCq53W+gr1ngae Q==;
IronPort-SDR: fXfybk59/W/F/F903JoQyvvve9hpO4LPfiR6uRYSVGXPP07A1xJmlN4eAmpD/n6KQOeJyt4FCT
 13HO1O6tLxHXq3DR42R7MAjY14Ki/eI3Wo6kC4fR579ti1yiQOfFB7gjUNsmk0cpNJ3zzBmJiY
 7ZP8M3usZI+FSGHAbVfEMuFVMKOnwybi8kRYhv+gfWibUAUppZR+DsbzIEEMmWBTa4T0ZzTXdZ
 TkfNu6g1KBrea2ppq9lsXpahdLvINI8KA2F3KQJIw4ogVOtao652UA8xsrlyKnC5cuIA/zEkWX
 8T0=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="258465519"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:38:42 +0800
IronPort-SDR: Grqzmt4ABR6o8yTIXvvDx2e2+/YQC6B8rYb0RjwpAcMJDfONjrxAojG7KjzVwn20m63gsofWMv
 tvN9gq2gvZpmOMj7wyMuYFRqgysqQFj9w=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:20:39 -0800
IronPort-SDR: 4uVy4+tmfwhiyOcJGoLJ2t844A1lXmKlNHQYogYXcY0+htmUicyDEHGhihOFKRXtUX72PQt70q
 Ng//O7QT68IQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:11 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 01/22] riscv: Fix kernel time_init()
Date: Wed,  9 Dec 2020 14:34:45 +0900
Message-Id: <20201209053506.122582-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_003514_246837_E9A03397 
X-CRM114-Status: GOOD (  12.87  )
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
