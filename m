Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BBCC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ycab4BmL8aDBwyQ4CsfbqYTrohlpBKLuNkUC9TUS00w=; b=rcbqZLw+umoT42
	Sa7ZXyY02SJQZT1Ou3BRcMZuMVCuJVnjy2I+jvRIkGtbelSaaVqzdYdmFgvtfVr7hQ7IOXhHqq2Ib
	+bs9Ohe/DD14GkuyBSCN6A5ApRn9Qj2bKZ3nDmfxFA/YC9njTxN7k6MHL/4syNOzUqLhrp27Lg+LH
	oF3csQe/Ot+K1Kc22P+3jUIYqAQ18zzM/MDnhkhbgaYAE5pcF1n9FyZtrx/9zMzUCu/xEqR4/zAJb
	/GWByEVSiZ0VflWSTckuXkWDlZJuLZUvZIh28lLZjs5GWaMIiqBShLwo8d/WGuq7t2GBZlbMqIypb
	hET7+wuv4krhZeLWBhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1UY-00491m-M5; Fri, 18 Nov 2022 13:33:14 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow1UO-0048ny-7O
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 13:33:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 421B724DBC2;
	Fri, 18 Nov 2022 21:32:28 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 21:32:28 +0800
Received: from localhost.localdomain (183.27.96.116) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 21:32:27 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/4] dt-bindings: power: Add StarFive JH7110 power domain definitions
Date: Fri, 18 Nov 2022 21:32:13 +0800
Message-ID: <20221118133216.17037-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221118133216.17037-1-walker.chen@starfivetech.com>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_053304_460977_98E60068 
X-CRM114-Status: GOOD (  10.78  )
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

Add power domain definitions for the StarFive JH7110 SoC.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 include/dt-bindings/power/jh7110-power.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/power/jh7110-power.h

diff --git a/include/dt-bindings/power/jh7110-power.h b/include/dt-bindings/power/jh7110-power.h
new file mode 100644
index 000000000000..24160c46fbaf
--- /dev/null
+++ b/include/dt-bindings/power/jh7110-power.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0) */
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Author: Walker Chen <walker.chen@starfivetech.com>
+ */
+#ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
+#define __DT_BINDINGS_POWER_JH7110_POWER_H__
+
+#define JH7110_PD_SYSTOP	0
+#define JH7110_PD_CPU		1
+#define JH7110_PD_GPUA		2
+#define JH7110_PD_VDEC		3
+#define JH7110_PD_VOUT		4
+#define JH7110_PD_ISP		5
+#define JH7110_PD_VENC		6
+#define JH7110_PD_GPUB		7
+
+#endif
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
