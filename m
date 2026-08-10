Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CA6C5B560
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 06:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9Zc0pYJVMY5EMgcKfmXQwLMABQTv84WDXywZmuW8pA=; b=fYSE5vt66qM3de
	jYUXAKOSd6OO5VeMEB8uMcVSS3eeTY7owDpb91d0PzPKt1YJFIhWPJ1JwM9xX7YPGxrzd/AXwqHC3
	2gvfPNT48L+5DSLFzjVhr62MLpj1T8xDzuATS4CJ7OmKz7msHL63LDwPXaoA+1+yHGNmsRxO1fn8c
	ExxtzIYbCBXBFivJ5Vhk8cF17y5UC8AvHtnSbLmFYtMM9SQnmoahD6fvN4SY+6Fb7XhVYZAWsDNzJ
	XkwmB0aIsYmRBe8G6dR7nyfssz8YiObWYkLzlOmGy2foPy0IIhltBVKvN8bYgubs5+Wa/5Lhek5NQ
	WKMQB5T7Sxsolp5bvrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJdl-0000000B6jN-1qFE;
	Mon, 10 Aug 2026 06:37:41 +0000
Received: from mail-bjschn02on2136.outbound.protection.partner.outlook.cn ([139.219.17.136] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJdi-0000000B6ex-2hMP
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 06:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9kUFIThu5N1KWyJnxnhi6TgVG6SXhsgA8qkgSBbyGKW8U0wG6/YmbOfEjystS/U63bToqiZ6uQB+2TYKJ3GR8Jo+MjtaQuyXroJdV1IGlpmGZlaqKjDZS5NkdilOeT6wWFsM9Y7memde8+DLxN+izC5cn+k4t3D8Z6DXKRANATSnCmK7v/wLp/ppMEtJwXQc1iiNDjsicw26woNVkqHSqPGE09Fbb4eg+OnfHdXZHdwLoecm0m6e0Y0gIepVqSR/Lilvis5w6qlSAlRYp7ye/Xu6m1zsRpKMOW9PEr6Yu25EkQnokAtSl3OGJsGq6JUVxjDCYYvrXAcLWQMbN4hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/Un8q99WBfoZ5H5w+n/6gPJBMUV2k3U2UUf9+kAh/c=;
 b=FDSnQyCefUpwhwcED5CJJVdTZSAdrWFbHd0/IIhtNuMqyoyIyy+/VnbiDy/74oV066jXpO4OM/dn7IE73Vx8hOdy33zn4TLJqb3EF/u4UKQVfZRj+5rEXWeINB5Dfuou2gZ6TVS0g00U2xIA5NOqbyVPgbduawzR42NHeFUCUShKIrUAebDYpwKOGcU5y+vLlsHd9jbw7hgCydOdtVlhaL4EWGlF3STYDebPRoTTffJTRlDyzdPtttlApIR2Iz904EULLSWhXJF9pXNvN5xPgLmRcXSdqPHk0lwRcTKpdBb7hDnYLCALmsOJNzqZty6MDMB9z11V5YZbDRq3MXPpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:06 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v5 06/21] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
Date: Sun,  9 Aug 2026 23:36:35 -0700
Message-Id: <20260810063650.239303-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::31) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2e8ea7-075d-4ecf-fb9f-08def6a9cbcf
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|5023799004|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: nyD3Q0iWJWsoYaRjq35xrUWLpVXUVyfqRXpDCpBXkCa3RKNI7fdLTHMeZJ4rPHD20Y4HaFZpOaOPMgKYI8FvbL1Brjp1GnHgpwynlYoAXFRMxLYk6ViICsYFqjoGtf054Xo6/wbwySZrUpw2GwjNTC+LaSLX0+/gxNwlLrReToNFXIZIDOPhjYahPCiKESrAr/AYXJ9MtDKm9CazRB2cL+4+FkRsiEQygbwsXl5Fw7tMndwVPXlptLqaEXyaqltMXcx/aP7DZ5Sq94c7+4yk87rWhcZNKlyf5DSYvp0WwR3WVGbUsnasCLsElNAKy5CXvs36i93rJV87hp0/ULUJiWMwGq6D4TWIbq4B2xvZ1/9JKHt+w3hEIUHLYJrtcKPhOG5/Soepoz70eiSTn3bXrCG3MCFQUs36ExdYKwrA+ZsWHfSrAM9Pozm88I+ruxsMuAqpPTZozr6JKPtEi3sNPoyAogLDUU1JSb0JCPUExy/71ALL370z3ZakbCeWQPBEvH44f1a/DFEZRAYggrN8foMlkZX1kvhAC3MJ9ywEmwzD0HXJESIfOa14eM9GZSktK/o7nXV/uzwk0iGnOkgVSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(5023799004)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hfXo/XY4vUfhEw8dDoi+cT0z9i0PCImixW+vpx211DOIjhptIzEGcxfR9g0S?=
 =?us-ascii?Q?ybAGyS8oNr3s42t3VA5MCxb2ZdH+4+B/Y2wWjkFrNj4n4sfIgtV6B5wMXakI?=
 =?us-ascii?Q?bK/TTKc2kOeVtevaVfBolVs7JumIolwGrxJ07osmHMDylJTiFxAFNYxaftDP?=
 =?us-ascii?Q?dereAOW9V40wxiPF9N1IwKq9IE59G3W6z3jePg3STOWrOuOda9K+f8fJ0S+2?=
 =?us-ascii?Q?+viTkF8+dKN2wgk201R2YfapRCznoPdDGCatxZBFYVMBV34q1J79Lxs1rkFC?=
 =?us-ascii?Q?A177IP+E0WINg9PO01/VwZxBcipJ2/lfrSt6l1v8pB+iUhfhh45sdVHQC9fl?=
 =?us-ascii?Q?jZHYSSIIY7z1RU/SAY0EIfBhEA3tyrZBbo+VAFG0QBFMqQaN0VotHJDJaIYv?=
 =?us-ascii?Q?M5kAa8s2ctpN36t45ErY4/ZPNRDXqtbM695u0F2IsVqNhAuc8js3koGFPCx/?=
 =?us-ascii?Q?qxj45dFN1sbBfghKzh4xkoztY058Y8vpSVr47b4jiwTj+V43uGtxMXPPbhxj?=
 =?us-ascii?Q?loNwnukGJfVjThwZDXpidtQ8EoW0PGiBrZTXG5t+oBQY6GKwGRyoONWwpsbU?=
 =?us-ascii?Q?C/cYGOxcIoxYNJQ7c1/27MY9s/JFhwN2Ecbej46BjvyJZSdqnZgtay2vo77/?=
 =?us-ascii?Q?HALGkmdnIE/HtP0iD5trNsTQxUsryZgUTduMwc8oXFSPBRY8SWbhilCKdU1n?=
 =?us-ascii?Q?DGrQLu72EREq0DRu/8a1aC5kXF7FL7corS1V59ROCSIeT2NCM/YeUAzf6WPR?=
 =?us-ascii?Q?yZopWHGl1dxqhXEibQL9p+f4b+sp5Gkt7T7N+32UtAjL7SdYz/Vpwja2MBr2?=
 =?us-ascii?Q?uGdluwGAS2KvOXpTr58KsmQQcqEMKydGiqDOWEugVbCM2Qj1xA1rRyRI2dbQ?=
 =?us-ascii?Q?cUE9DPeBduIKuyVowdzaLcruTFkiE1BOFXuvLrUt7L+UPEarvs400g9NhE3y?=
 =?us-ascii?Q?rD/j0PyRTk+t7XaErLBTvOCIGkMwvyf8KDkjDMV+o6m0i8+p1BTTqe5yGcmH?=
 =?us-ascii?Q?zzJK/RQWGi3HC9ViGkQBPYxFxjq1PACJF2ntTJWsfrGarny5px1EZFezuMAj?=
 =?us-ascii?Q?Z1EgqQFeEIDI3sHH4H2Fcf+FYnq/WP+hGQZdQbzgqJfy2i7cSgwLo6KscUy6?=
 =?us-ascii?Q?/fH64AHuIrmREdmINBSqbajXtl+cA4ug8CELFgAmZ31QpUD58GkFQjqc2jsU?=
 =?us-ascii?Q?HdFUwxti69qUvybjMq+DIF5ODmeezK9h667mzkyv2eWVCkOLafc+d5+7y6BI?=
 =?us-ascii?Q?EjDSXVJuf72nStVYQ1YtCmuf+vTIK9HQ9XJatBQ3emCquYRfQXEQuKWl6cNv?=
 =?us-ascii?Q?KvZBUiorgQ/GytktDNupxwc2sCMyeMUcPHxe4ubJ4nXR8mO3AImC9QsTaUJj?=
 =?us-ascii?Q?lVmkU+psphN7o1p5Hae6eLP5KAnjIAR9hJcW23QFiIdbkOubKk2NpjSV/Qug?=
 =?us-ascii?Q?3vj/NtzLXx6Ojam8b88MWTuxFOHBccjbXxQF2oRHu3ScMYfdcaf9aYj65VhA?=
 =?us-ascii?Q?w9yQI8x011PPXxHrwUaqkiibe9beK4SgsBLHGtu8x+BZAq+IVhvIDGGBU9YW?=
 =?us-ascii?Q?AtV9IwIE8ckXXRAY8ffGly1GtBRBvltR37HVRfbnmJRByISjX2LjA0vpxotc?=
 =?us-ascii?Q?owHHirZL2CONWtTcJzj83iaXWYnvM/uFK8wsm31U/gia6q8MPC/NI2tUiVPY?=
 =?us-ascii?Q?/gXh+Sx4bqNLfxBhxNxT6PvZxw0jqH3Z59seDdF59AIJEHZbwDRwlscAopjm?=
 =?us-ascii?Q?eQLnMAIIVcPNQtoTEXDx/5yagSXvLUEISd9PfPY/qI1gvrfB3g50?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2e8ea7-075d-4ecf-fb9f-08def6a9cbcf
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:06.3799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFs+ZoZESn32ZdkX/FdqtZSSpA5hnaRX2ef19Z929Svel7TAlFyoEzbPz4Ep6iBNEy848+rOpwkHSNeECUHYpYX6Pv4VNiF/x+0CiLyORJqD3KbV4Pmn3e7tqUtEu3pw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_233738_706814_479322EA 
X-CRM114-Status: GOOD (  17.58  )
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

Add pinctrl driver for StarFive JHB100 SoC System-0 Host(sys0h) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 11 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  | 95 +++++++++++++++++++
 3 files changed, 107 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index eb0b3b705ec5..d4babf78f8c5 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -67,3 +67,14 @@ config PINCTRL_STARFIVE_JHB100_SYS0
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS0H
+	tristate "StarFive JHB100 SoC System-0 Host pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE  || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-0 Host pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index c0d368f413bc..b26156a6d0eb 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
new file mode 100644
index 000000000000..64305f9c1c3c
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 host domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_sys0h_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi0_reset", .gpio_func_sel = 1 },
+	{ .pin_start = 8, .pin_cnt = 4, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_sys0h_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 12,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct starfive_pinctrl_regs jhb100_sys0h_pinctrl_regs = {
+	.func_sel		= { .reg = 0x40, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x34,
+	.output_en		= 0x38,
+	.gpio_status		= 0x3c,
+	.irq_en			= 0x44,
+	.irq_status		= 0x48,
+	.irq_clr		= 0x4c,
+	.irq_trigger		= 0x50,
+	.irq_level		= 0x54,
+	.irq_both_edge		= 0x58,
+	.irq_edge		= 0x5c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0h[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "espi0_vw",		.val = 1 },
+	{ .func = "espi1_vw",		.val = 2 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A10) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A11) },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A15) },
+	{ .func = "scap_trigger",	.val = 3 },
+};
+
+static struct jhb100_pinctrl_domain_info jhb100_sys0h_pinctrl_info = {
+	.name			= "jhb100-sys0h",
+	.pl_desc		= jhb100_sys0h_pl_desc,
+	.crl_desc		= jhb100_sys0h_pinctrl_rl_desc,
+	.regs			= &jhb100_sys0h_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys0h,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys0h),
+};
+
+static const struct of_device_id jhb100_sys0h_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0h-pinctrl",
+		.data = &jhb100_sys0h_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0h_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0h_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0h-pinctrl",
+		.of_match_table = jhb100_sys0h_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0h_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 host domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
