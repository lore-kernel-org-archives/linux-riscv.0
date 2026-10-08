Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10373CA6014
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe0UpwzSLyRknmEA+T4LsAhNa3SiiyVQZkz8FfV6hQU=; b=G2agjefa5hvWhY
	3Wz0KjDQesm/k+53ABOb7MFhiU5fc6MZafweet+1k8SF26N8RcXbOOXPB8k2VVEo1xwMghWGubGRB
	E9xroWRMtd78pOxd00JaHVjvTEiIndLJAUGd3zQJyrTNXEMkLfcETKtYUCX6l24vQBR3Es3ImRUD/
	l0ySaSA4zdpmcWUhBVsQLYHv974fiPZzLPlrJafeINqWId3tPOxeyg8UDrLGUuOMWln7jLXl6dpGm
	CdbqjaW1gC3i+4s+0icuK0jTySyVevD3L/2V0n95gvVOFSkAGUjJ9zhtUN3aTl0KuUizDcNOh8eQM
	zTOGA1fjlYk+XdgBpuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnKJ-00000004M34-3O9s;
	Thu, 08 Oct 2026 12:34:23 +0000
Received: from mail-bjschn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72e] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnKE-00000004LwB-2Fq5
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 12:34:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYsUZuVDMAgBfu1Ji0rH74sZsr8xQDQZ6+iYSlNyHnPdZ+5ED2VMqPlaMPYeRIanchk+k7uSPqe5gTpGpF8XvNdT2ng0qbBFvvBzsM95MWyA7V0Qi5ggO5yL+XAuzAhjbweZbgcDTfSDl1aadMumUqC7OAnA9qewLd+jhWDHcgyorvIOrlFS3dvBJy/Q/wnHFKn9If7nSDTELvNqsqwDzI2o377n0sDTcXquyGHoZWU0WKWwr7NC/O/V6C/8c/zboJkbHlG2HHDH/4MuNW9PN2/q41jXJJbbr6DL8CJJPDyHKWgdIpdWmDHWqv/6A04oVBt9misV/VWvyrLetJeEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+6Anqh3fdqS0WV+gtE2iLiVype82GIbUFHK7Df+2Os=;
 b=jkP/Kg+O/k9NbzKgbgN/ZRT3BwiYIUCjG8dTe+AdpqU6qVA8Tfbuqt+65+qEUhNNd0Jm525nHbDJOurQEuwUx7bDx6KWinbDGeARGiFZ89sAs1Sl8s1TyvIFS+8HYqqwLuSPCEFIgmvQVEZEOIzWmDLoaUmdcBb8TqhpVW5VYGWdMx/BKIo/e28Qe2EZAhH5FlM1AHMtua/ZWq2H5jDavv2gZWTmipbXkG4KxCYBCJEb/nKses1qDBMYqHYPiZ7pzcklj+USUp5gyqGkWmBzdrB8ObhLAArHdoD0/btZZVKYx3BvkG3+DgxVmIKw2ubEV0df195u94I3s2aHv04OBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:55 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:55 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 06/15] clk: starfive: Add JHB100 System-1 clock generator driver
Date: Thu,  8 Oct 2026 05:33:29 -0700
Message-Id: <20261008123338.11081-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e124af6-810b-477e-4335-08df25386b0a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: xmJ7w5+RXCgvkdZRdLasQDWwIZzv7ra9p6lSVnT0KnniEgOm2HxwcMB210dCFdNgLe1Y6nUuzbDOfuhlspQpcKP0fRtiPOg9V0lfb3ZEi6OYDXfZF19P8s+wST7fga9l8a8vqcK7j/HJp1HrwfHu2BsYbDRuRh4xApHKu8pVEHZK3Ek0zCVG2rd8+7gVON0yUx5grKP7ydachvvda0LhFMj357C/XOSarO+eiZZ11+PrhaJjNm19S2K1ZnwU4QI6MdG9aBwMUaKtlR17Qks1lzMowPFnkYXNIqCjN+7xqkOQBjssZZ7qpA5L53bwZDh4Hv3hihZ6+UOn5gmt0aZ3ee1KuvbUY+LiQRiyVWVhVJ9DNXvjDr7Z8Hh/4BvpASVuUsv79gfjVwiZ5adlcVYyIg8PD6vm3SmPdJ2+E/4pPnqeuSeVIYlE8cMeYBn/tJhyB52jM1O07HwVJH418FQETAnjIJ+6yiVKFZrsYVpbaEjK7J3ZR4K0EldTQJ8TQrNd32VtCgOXnMV2DUmcm0NekeVDQ40U00c1U82tddVPrNCoOM8f8jlMeYnFEQt0CFru
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9FABTjM6+Lxl9xVW+rEMOzE9tk0U3EAY4p1sIztqV1IJYW/x4PSFejJyqy/i?=
 =?us-ascii?Q?KjoPioiDdaO6ZprMlZzpQJOC9FRycLtWZ20UUrPVZYVBMHtJBC0lnC+yMvnr?=
 =?us-ascii?Q?T3vNIM1yvxFG5ka2ZCIwYzAnaKIK8tCXsaMcHb2+0IINuz0VnmYzYYDoKkRI?=
 =?us-ascii?Q?RzDAKYCiruRtZpxJ63m9qeHN7JDH1Y2nmpE/E+5B8ACZZjPR5bYx0AJVjX9e?=
 =?us-ascii?Q?nPA2aJhiUS0AZIwIjelYvgh8Bbvi4BYe3/3zOvr4SVIo29nNR3Xxefu5dx+w?=
 =?us-ascii?Q?wE3FO3hrK1SMAjMm+/PmD+Wj9QOz0ZyEswBuNYtBleGeY3hHjwkbAP3l6Gnb?=
 =?us-ascii?Q?ScWuuaoBuZVf8B5pguGu72xcPvCzyUVqQkeJNWs5I16HrRauqfsYstJF3zcg?=
 =?us-ascii?Q?UkucaK6zmCV1qFoVNfNF5OJ3XO0pxXKviqPOiNc4abp4dWPIrjTMMM67Vygf?=
 =?us-ascii?Q?3MHVeOdrZrW2tNfgvFtvUSxGM4E+G3Edqq4ybvQauRNW5GFk26TIUkOlvoJC?=
 =?us-ascii?Q?brie+ROfO9uz/sOUlcDK3WPCRr9mAEUID7je/0eOjTd08dyUrf+/Rr3rY8B/?=
 =?us-ascii?Q?/qQ3e+zfDyMctTiAD8r1tnhCWrLu0EJjiSUNOplCE6RPrbxgpt4RZPErfeOW?=
 =?us-ascii?Q?R2FqELzbpXrISrQUWQkCHVskyotvRimvzN3fn+xCjq5pEZZrQ+p1KXGcrf8O?=
 =?us-ascii?Q?a1W0I2CPcHt/RenrNL/IzWGKkD4MlXIGMddGy+6dBmIxmrbuJYbwCTjag6Jw?=
 =?us-ascii?Q?AxaRWx2Tg30XwVEYHrM2f90bLwuGdwqTtm2ToPGXYnWH78LvKXyuWCk4kBn8?=
 =?us-ascii?Q?Rt2cdTjin0m3c/9aN93LzWqX3ceYQ3DgB9ZfTU1h2q88oogTLwSiXKpKi1lO?=
 =?us-ascii?Q?5TbtmXyP9A4dmz2nU1Jb0n5WJx+aVwldyrMXPenhf8sP/IFPz4uVS1hVPto5?=
 =?us-ascii?Q?nW/D3niDJQohE56Y7II77UE6vqAXYAYzIBPTaJgggvhT0acurTVD09/zB/cs?=
 =?us-ascii?Q?VC/NGQ/+jIITBHv7bsY7O8/pA4xO05GnpiIYbquFX6e3V8t4loIhFJWBXT2Q?=
 =?us-ascii?Q?C4xtsfDMtYqjYTodWA2AzqKOqIFjfavoptIV2HtZEsNn1BOdg9UVfvV2FEnX?=
 =?us-ascii?Q?IrgTCnSte1VwXb75xeO6OMQ09NfSGjeRUxb7w/6DpYoZOzrn3dhOwluN9rox?=
 =?us-ascii?Q?inXQ9O0Hs/kKJet9cG0794lEGaFy4NI6aUOkbmPb7cF+Zb4BazvfhphfjzDP?=
 =?us-ascii?Q?0BOUbFu8T+V6/VcQPLSj6lYJXL3I+AtGegK0FhwJSCnJYr0sYn/XL1V3kLzO?=
 =?us-ascii?Q?ogSx/m8j9fLxdwar1Cul1b+yCmSAy+oJ3hTGwuh6fnGGLu6QbDfLkTkq1But?=
 =?us-ascii?Q?DXwQ4M82obDj3qoaCZ/dIFvKRz0SwTvXRXAvx9rgZy0PH7sI2SeHztph411H?=
 =?us-ascii?Q?Y71NnTTsO004OGWPbKeBm0LOb1oyvGAnKLdc8rIuRP/hS7/B5HHdVZC4T+pi?=
 =?us-ascii?Q?5oOWDPOPadYAXMx+DBOpWslxum81QLveockvtGU37wBcM3mnpan4Iy0MVBz2?=
 =?us-ascii?Q?9E3r1iTWKhsPFHu+QVddioVGhGOOj3sA/RFuk2hdD3taBLbejGuYR28GjvdI?=
 =?us-ascii?Q?uUnp03jeY9HelDRo1yZewNr+M2Au5SyfxqMXeypaPG7aSEZZPboRZpUhoct2?=
 =?us-ascii?Q?UWQo0srlnLRAHfRGdpMIGHtZM4Avu6jmLlCbd52dphzMtZ+uN36Albtx/fVu?=
 =?us-ascii?Q?AfE9bM0Tmg2LZzY0Qmz5aCoQsOZXTbD5xjelAK7vz0lpXmgoeOiw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e124af6-810b-477e-4335-08df25386b0a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:55.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSQ8ssJ5qGrzj/t91a/DmN9skgxUYBAN4hXU8ujy2MQAQ5meixaZzO+ryX6ZU4Yfte/eNz3CjvFS6tE+NkUKqLR/7TA+oBIYD+aL0L2ovnKiddTDvdM8C4oXl3cdratL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_053418_581066_2FDA28D3 
X-CRM114-Status: GOOD (  18.21  )
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

Add support for JHB100 System-1 clock generator (SYS1CRG).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  10 ++
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-sys1.c   | 118 ++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys1.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index cd5b7754403e..11da8bcc4046 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -82,3 +82,13 @@ config CLK_STARFIVE_JHB100_SYS0
 	help
 	  Say yes here to support the system-0 clock controller on the
 	  StarFive JHB100 SoC.
+
+config CLK_STARFIVE_JHB100_SYS1
+	bool "StarFive JHB100 system-1 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the system-1 clock controller on the
+	  StarFive JHB100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index d2ba83d7d02c..0061550e0f7e 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
 
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys1.c b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..db37b243db18
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 System-1 Clock Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+
+#include "clk-starfive-jh71x0.h"
+
+#define JHB100_SYS1CLK_NUM_CLKS			(JHB100_SYS1CLK_BMCPER3_CFG_125 + 1)
+
+/* external clocks */
+#define JHB100_SYS1CLK_OSC			(JHB100_SYS1CLK_NUM_CLKS + 0)
+#define JHB100_SYS1CLK_PLL0			(JHB100_SYS1CLK_NUM_CLKS + 1)
+#define JHB100_SYS1CLK_PLL1			(JHB100_SYS1CLK_NUM_CLKS + 2)
+#define JHB100_SYS1CLK_PLL2			(JHB100_SYS1CLK_NUM_CLKS + 3)
+#define JHB100_SYS1CLK_PLL4			(JHB100_SYS1CLK_NUM_CLKS + 4)
+#define JHB100_SYS1CLK_PLL5			(JHB100_SYS1CLK_NUM_CLKS + 5)
+#define JHB100_SYS1CLK_NPU_NCNOC_INIT		(JHB100_SYS1CLK_NUM_CLKS + 6)
+
+static const char * const jhb100_sys1_ext_clk[] = {
+	"osc",
+	"pll0",
+	"pll1",
+	"pll2",
+	"pll4",
+	"pll5",
+	"npu_ncnoc_init",
+};
+
+/*
+ * Regarding the CLK_IS_CRITICAL flag:
+ *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
+ *   or not a consumer holds them, such as the bus interconnect and always-on
+ *   blocks. Gating them hangs the system, so they must never be disabled.
+ *
+ * Regarding the CLK_IGNORE_UNUSED flag:
+ *   Clocks flagged CLK_IGNORE_UNUSED are not consumed by any driver. The flag
+ *   keeps them in their hardware default state (enabled) instead of letting
+ *   the clock framework gate them once it disables unused clocks.  If this
+ *   flag needs to be removed later, it must be ensured that these clocks will
+ *   not be disabled even if they are not consumed.
+ */
+static const struct jh71x0_clk_data jhb100_sys1crg_clk_data[] = {
+	/* root */
+	JH71X0__DIV(JHB100_SYS1CLK_APB_MAIN_SYS1, "apb_main_sys1", 12,
+		    JHB100_SYS1CLK_PLL1),
+	/* sensor */
+	JH71X0_GATE(JHB100_SYS1CLK_APB_SENSOR_ICG_BUF, "apb_sensor_icg_buf",
+		    CLK_IS_CRITICAL, JHB100_SYS1CLK_APB_MAIN_SYS1),
+	/* hostss1 */
+	JH71X0__DIV(JHB100_SYS1CLK_GPIO_ESPI1_EXT, "gpio_espi1_ext", 14,
+		    JHB100_SYS1CLK_PLL2),
+	JH71X0__DIV(JHB100_SYS1CLK_HOSTSS1_NCNOC_CFG, "hostss1_ncnoc_cfg", 12,
+		    JHB100_SYS1CLK_PLL1),
+	JH71X0_GATE(JHB100_SYS1CLK_HOSTSS1_PHY_SCAN_1000_ICG_BUF,
+		    "hostss1_phy_scan_1000_icg_buf", CLK_IS_CRITICAL,
+		    JHB100_SYS1CLK_PLL1),
+	/* npu */
+	JH71X0__DIV(JHB100_SYS1CLK_NPU_NCNOC_CFG, "npu_ncnoc_cfg", 6,
+		    JHB100_SYS1CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS1CLK_NPU_CORE_DIV, "npu_core_div", 10,
+		    JHB100_SYS1CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS1CLK_DOM_NPU_CORE_CLK, "dom_npu_core_clk",
+		    CLK_IS_CRITICAL, JHB100_SYS1CLK_NPU_CORE_DIV),
+	JH71X0_GATE(JHB100_SYS1CLK_DOM_NPU_BUS_CLK, "dom_npu_bus_clk",
+		    CLK_IS_CRITICAL, JHB100_SYS1CLK_NPU_NCNOC_INIT),
+	JH71X0_GATE(JHB100_SYS1CLK_DOM_NPU_INIT_CLK, "dom_npu_init_clk",
+		    CLK_IS_CRITICAL, JHB100_SYS1CLK_NPU_NCNOC_CFG),
+	JH71X0_GATE(JHB100_SYS1CLK_DOM_NPU_OSC_CLK, "dom_npu_osc_clk",
+		    CLK_IS_CRITICAL, JHB100_SYS1CLK_OSC),
+	/* vout */
+	JH71X0__DIV(JHB100_SYS1CLK_VOUT_NCNOC_TARG, "vout_ncnoc_targ", 12,
+		    JHB100_SYS1CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS1CLK_VOUT_PIX0, "vout_pix0", 4,
+		    JHB100_SYS1CLK_PLL4),
+	JH71X0__DIV(JHB100_SYS1CLK_VOUT_PIX1, "vout_pix1", 4,
+		    JHB100_SYS1CLK_PLL5),
+	/* bmcperiph3 */
+	JH71X0__DIV(JHB100_SYS1CLK_BMCPER3_NCNOC_TARG, "bmcper3_ncnoc_targ", 12,
+		    JHB100_SYS1CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS1CLK_BMCPER3_CFG_125, "bmcper3_cfg_125", 10,
+		    JHB100_SYS1CLK_PLL1),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_sys1crg_info = {
+	.clk_data	= jhb100_sys1crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_sys1crg_clk_data),
+	.ext_clk	= jhb100_sys1_ext_clk,
+	.num_ext_clk	= ARRAY_SIZE(jhb100_sys1_ext_clk),
+	.rst_name	= "jhb100-r-sys1",
+	.power_domain	= false,
+};
+
+static const struct of_device_id jhb100_sys1crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys1crg",
+		.data = &jhb100_sys1crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_sys1crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-sys1",
+		.of_match_table = jhb100_sys1crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_sys1crg_driver);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
