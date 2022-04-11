Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9D5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Or+/WIAZ5FAsN+GbU3xkYHy87ebMzK3npb55UvB0FV4=; b=2ZBdi2/UKTUAWC
	IjtZrSwOg6RRjFphO4mn3thGuGCMv5atvf5hcm1SKa8mqRf3jhEv6PjSVuZw4YxBLSiwXShrdie45
	nQa9ewp6qbNO+p1rS891AkOw7KJypa9bb1tUvprkqFF19lOvorK68aWVQSbkrjA+GRl8+ib8XE5tH
	/EPCGTyXA8eKqhm2c3n9xEQs+ArhBOErlxXP+ePmSjl1vlJ6R8rp+jNkO6Wwq4kY6xvwUcNEEweIP
	1oL0/Xya2htcJgaQmaMdSKVcJYPlvA8t4blPYDBrUP9I6F7pqCyCGcOnJFqDuw2dMAD7Sle3XY+vK
	8BoTCN43gfqEQLGg2xQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpvA-007i80-VR; Mon, 11 Apr 2022 09:01:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuW-007har-Hc
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 09:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649667636; x=1681203636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cMUD//YndY/uYZAoKQOOrsgN8z8FUO65LegcEIgqKaU=;
 b=weg+n1oGSpJIPbnphdRHX0PfiFmghoU6VOQs9Hm0Pvcjy1+3VCzELa8Q
 8Gqg78gHMM16QB9w0MptEJQHf5Rpc1jWai9K3tP76OvBD3twkLMZYZgCc
 v1/VFkNkTN/j67+lQgAX5eogTH69zC9L0dkY51zN+cT7hQYeiD9/QpfYo
 +iHoScLSFINyWraCXtK9pa4NdObwgeOaOXmnXu/rHRiguqbalG52s699G
 ibeQ3YbANO+xXlx3h9lurH6+5AOcINjeOi8iPfondlU13SnDn56c2ZPHI
 mamHQNhbA+gbZSvsdvCKw7Kn3sq0yRWyG5eSQJD0ZlIrE/zDSDy1g/4EY A==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="155112938"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:00:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:00:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 02:00:30 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new clocks
Date: Mon, 11 Apr 2022 09:59:13 +0100
Message-ID: <20220411085916.941433-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411085916.941433-1-conor.dooley@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020036_683533_6C04C8B7 
X-CRM114-Status: UNSURE (   9.31  )
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

Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
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
