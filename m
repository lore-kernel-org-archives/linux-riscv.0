Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8E1C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQm/msM+yVVB82Hxkr6aFH1hZ6Bwb6QHKvu0xtABfms=; b=Kwzg2jw5QxFOjo
	7GswKe3YDCbLo/3G3+OokQ3wWhzqxQ70zH16ZfBEL/iVp2+zE9xmjLs4Kc3h0uaAC0yoI3/7rvbDc
	bJaNmUecaQdPTeKYt0aiaZFMefVWfGTlGsqO2EaGdv94abfnMHTj43n5Ab/krYoRnY6svopWmTaiC
	uqhoSfy6/bJj0F9VMvxksAiUf5wnu57+5wUoSccEOZUpNK6mM8JDVjP2TkLxj4huPROTqVQf+hzaP
	fXbpWzFZtVp78+O665QPn2iPB1oJQ3E+opEy/TJbDUWPfaqlmYqwMkcKVI2J5bYCQAFbmoEmk7LYb
	wmN/iYtDyn62QH/5Wpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXxD-00HW8m-2H; Wed, 13 Apr 2022 08:02:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXx9-00HW5y-JG
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 08:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649836935; x=1681372935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wiUAzHIPMa+jpdUCRIcyJzb2DHINVr1TKpIJwUq7qw=;
 b=knWcJxgpFH0SP8xprg+iz1xx0J8SuheHH1RAe1ZOWIKnSmPuJZ6TMFqR
 pGQL8mBzQ+YrIsJ2VYS8+PD/0rn2BHuLLCOJvBvxfbU31flxfsGJpXw9C
 HTSIdPZ0mtyFiWELyGzdUm7vPCQgnpFbvaU/z1nvLfphGhpJ5tonNh1EM
 vQ6v74Sw3HmcDI4/FCzmgL9YFvWw7+8QAvtEmNAD1wwR9e7UaPxMck7p/
 uVg7wPL0PJCYkbsAKnDN4c8M2Wo/hlCA4yXL06FUAkHIdS2w45BeioORe
 rDYIuvrWXIQJQyO3Qu2Q0+3LwKwmKUx5SLxOR8h3O0GcKAyhdH/UFtwNh A==;
X-IronPort-AV: E=Sophos;i="5.90,256,1643698800"; d="scan'208";a="160365332"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Apr 2022 01:02:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Apr 2022 01:02:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 13 Apr 2022 01:02:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 5/9] dt-bindings: clk: mpfs: add defines for two new clocks
Date: Wed, 13 Apr 2022 08:58:32 +0100
Message-ID: <20220413075835.3354193-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413075835.3354193-1-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_010215_701289_FB717EC9 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RTC reference and MSSPLL were previously not documented or defined,
as they were unused. Add their defines to the PolarFire SoC header.

Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
index 73f2a9324857..4048669bf756 100644
--- a/include/dt-bindings/clock/microchip,mpfs-clock.h
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Daire McNamara,<daire.mcnamara@microchip.com>
- * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
  */
 
 #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
@@ -42,4 +42,7 @@
 #define CLK_ATHENA	31
 #define CLK_CFM		32
 
+#define CLK_RTCREF	33
+#define CLK_MSSPLL	34
+
 #endif	/* _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_ */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
