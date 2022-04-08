Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9998C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmRBDqzYavqJXyBmh5Ypgle8J7V7hXNUzq7cJZeAQMc=; b=ir2CSHS9ulUZyw
	2DheJCBpJtkH08DV4FI7cy7v9E2qn5b13dNBwuAgE409CUm4LS5Xp/KQOEYuGAjjcrBJnB/zgNmKE
	l9Uzzzu5C3ypsNRwTWA8TvZJs9Vt4bpJMNvqVXpW5I0uEoCt7+yOoMRE8wMT7f8Mearq83tfDwPcK
	07GMjK2NY7CEXwoOzCdAoSOwKHPeKl3FxE1oWACqVEFqQ3Lz8vZfj2AOcEiILwo4aR6vSYXsjCTb3
	Hy3ZeajPi+CDpL0yxZjIljnLLT5JuyMlpqxfkavqkYIqruu49HXRMBLNV61pUB3OxOCA426EUzKYz
	50eBzY+kDamOxGsOmdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncpkK-0000gW-IH; Fri, 08 Apr 2022 14:37:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncpkE-0000dE-TY
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 14:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649428670; x=1680964670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z2Bl5qGTo3dfoTtGTbFb0RM34Y/R4subC/+ygZpA6i0=;
 b=2FbMk+pDFICKvsWN2pRlixOQ8CZafx1dQPaok08xB6eJ6s+Rvoc50YIO
 AX/ZDOcHbFVbXSMgXZZB629xIYFIwAL2+CWbm/pQeQSPfVi8oSAi095md
 BBcC7FREAYhx0z7+puYAaZgzShgGa+qq4e+fjfB2ONE72VxPiNem0qRLC
 dl3TVrLhzN1FNAceBvmlOFugUNAc2DDP5k7ubDEUei/fcWyOgMTOnMk1m
 GuGsnAfgv630NEOF/UzH9sQKsT3f9xmZoHexN1cjfsfQpGKBjaurYFdzF
 9tbg8RUILhGRHFUrggSAUZcYjVeiIobEoHP9VM3nz47NFihh1FQrmGHLP Q==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="154925644"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 07:37:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 07:37:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 07:37:45 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 2/7] dt-bindings: clk: mpfs: add defines for two new clocks
Date: Fri, 8 Apr 2022 14:36:42 +0000
Message-ID: <20220408143646.3693104-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408143646.3693104-1-conor.dooley@microchip.com>
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_073751_051166_3F89942C 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
index 73f2a9324857..3cba46b9191f 100644
--- a/include/dt-bindings/clock/microchip,mpfs-clock.h
+++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
@@ -1,15 +1,18 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * Daire McNamara,<daire.mcnamara@microchip.com>
- * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
+ * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
  */
 
 #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
 #define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
 
+#define CLK_MSSPLL	34
+
 #define CLK_CPU		0
 #define CLK_AXI		1
 #define CLK_AHB		2
+#define CLK_RTCREF	33
 
 #define CLK_ENVM	3
 #define CLK_MAC0	4
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
