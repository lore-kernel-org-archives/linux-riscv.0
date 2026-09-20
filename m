Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4A4C982DA
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgS10tTobKKqzqeoyXt8VBbbDpgQQDgRLnjKOoz5Q+g=; b=jAeX8a+x3UYbH6
	MZ+3vQgy0KSAOpAdM90WEdrVZkUmQRr3H2OJN20aG+YPe99fzf9vf7pXLuovuGN3cDdaQoWiRl2TA
	1gMfVvdZDNyAm9wErYmlxTPjm3tTBWDZZsIdV93K+LRjsIazrJe5kGKR5lavKDLwTzOZghFJr5WKH
	hauxJzNmBX2HkwLODSuUvpjrKBYfCje+N8hlgvpEaWogRKpZglBlE2NiJ7jXLDrioq1MWDN2GvrBi
	wxO3zA07HOP5dmuMpuf3ZlG1uHsnTeecOG2C7Zn/e527NSgT0v5yi0uF4Km7bEXt7EwfExnPC1qad
	zd6s3yAZsIXYbqtLjb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8GEz-0000000HOXq-1zum;
	Sun, 20 Sep 2026 12:01:53 +0000
Received: from mail-sh0chn02on2072f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8GEt-0000000HOO9-18YK
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 12:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxSVXaG84BzavKIs5HCTz5OPRQIlWwEL5sHxa2PNS4qWuvjqnh9W4Da5jAFaEaPKqWrhmxk6uoAk+uBnoinLwBz95n2DYmCJ4pcCqsBwUpzfa1LZj/0OJsY4vD4uvdxGF8vkZOyUXI39BbrU1tHIElaVoAs9ZMKqHARF29yJJEkk3mamLTxwke1rWfiMhrBMKRyXo5ZlBhCgdXsojny1qp04kMf688tkOqvR3d7eIEXlHIAOqBP1MaaDmIdx0EuH5zEkILZezdsrsGri3uekF5JkzOWyykBLHPn6BTJbge3JmS+FuNNsqXvHq240GlRFVG0ncR/LLqAsecJTrAlO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLp2UuMpIvckFv35N07aWi2jI8KkUy0mZM7krSOqBI8=;
 b=Xy2zrIIVUq0r/E04rXcZ81yheBkdQ3JhYFjAmT79c5hSa5yVxjQ7zaZAs2fFIPo8jcJODKFJHaSYBIO7AGPb8o+eY4Z2Nmix1LjGew31KgiSx+ynksMM/mwxejBl9xuuKVL4AKPiA8C0MQxia8+80DcP5BfB2iqXDCS68KovmCfGvaw21GjmI3sqLT054PZF1QVbmLGLs2Z7HFag/Veubq08dZVTyApaGqvH3DLtO6slnhC/inUo5Zs4cN6sFZGFoLBxQYKxixBagYypmOvrZnIs5FFezXVb0Fh6pCVGW97YZXjdRMpVAGdn6nJsDJFxRHpW9zeWRb6lWDlaHOZowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 12:00:59 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0428.014; Sun, 20 Sep 2026 12:00:59 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 08/22] clk: starfive: Add JHB100 System-1 clock generator driver
Date: Sun, 20 Sep 2026 05:00:30 -0700
Message-Id: <20260920120044.194901-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260920120044.194901-1-changhuang.liang@starfivetech.com>
References: <20260920120044.194901-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1070:EE_
X-MS-Office365-Filtering-Correlation-Id: ced42273-8510-4d17-83f6-08df170ed601
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|366016|1800799024|921020|38350700014|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: SQL42oRgHp8r3LaTsv6ELRA6qDq6VSObXkxAtkDv5neUyDZbXSHPfu/Sx6/J1VXqhGoDD3RNx4UMgR7BoE+/lWP64VLqcP0hp6sc30bSJmCchSSVMpHU/YMzcepUZUiRABVqNi06cgrXoy7QADKYHUBrBro08u5KkuXSa2hRAJbar8hjuZ2PLgsqXnJhSQVoms+Z7DReSpVI1XsrFx7T5ouOHol++6AuQJurzo4JVVMzPTbrZIgNQyUXBujPWsbJtnK9bCkzBWBlx4EscsHOqosc6+1DYTG1bS2/csMkGPfDPgD1+3PkkjOAREKfrwgaOLH59V3bE1R8YlKxdeprKkWVliQWIQQNhuPI1tG5qSt+hEaaCNkkoavaEG+fiksWdZCaTNp95UilH+eNvD8gW2xn8Rhk4yxmUdxqQMiMIL5b2/2vHLPhKqANsUWYNSM+04/EG5AMFagBFyRePlFMOYFFFWANay6IF8ULb+TyWSvfycVXWhfZp2gDqDu9qLGnCXKmtHr/0SmbzBBf5UStB5g4dMxffQtGoKh6ty8EytKXZh/siij9YaOfxKt0cGh2FslWlyBw2Pr8nJN672Geuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yon37qMUJcDgIxhFYYs4D4X3ejleL8sjmgCc0e9FqUqx0H3MaF3zkvxUcPZi?=
 =?us-ascii?Q?bqs8wskJ/oinEcuiBLJ27Zytblv64ViRXwHlTnTlFJdCId3kMYTCjhwvro4V?=
 =?us-ascii?Q?yg7wiPlZ+lpR4LRQ8uwVW+1xxzQPE0BPVJDo6d5gCjcy2go/jpIZR2EUkYMj?=
 =?us-ascii?Q?YsRLMA5SxQ14kO+Af+Kdp192/TUHPovzm3RNLCipELgn2L2KjW+5ddWH6dgM?=
 =?us-ascii?Q?ZK9gbbIwB8WXxSks8+NEYpWn3FqSI6025tekUaZrEE5gzO3new93EvBhurTA?=
 =?us-ascii?Q?n1dGwLn6StlJKfHgexsw72DhvAAETLR+OC1MWpvF6MisJZM9M58AUrInA5Zy?=
 =?us-ascii?Q?vcwm6dFKxa77ce5aEcZCtPeNHO9rx0advunD9ats0frIVfoQ1Elj4EJKWwPp?=
 =?us-ascii?Q?p+Nu4tr+AvXu8urXRdyaVmYBj0eURqDFlaWBZKE28RKtCjF+oDC2xX/OzN1i?=
 =?us-ascii?Q?xRwk2iEJWe7Euhub93R0Y+QtMx+m5YoIC3OLgOn6K5r97rTMLgTUFvdRPBn1?=
 =?us-ascii?Q?mdoKm9nxkV4amI7pzwj9B/zZLHjlDeEyu7CWSJPxfsuOia82ogbewkEAEd6q?=
 =?us-ascii?Q?NvTWSQAdwoll7TbLc4ZEPfSLi2DVAWgbpcBp6zW/8xVBkPjOWsMpxh/O1gYN?=
 =?us-ascii?Q?D11RxTjFT2lOTSGojapmUNA2/Cg2aOdwhxtlGLC9g4cc/Ssv+BqqSTPoO8vX?=
 =?us-ascii?Q?wCyDLHRbEaPjoRaLVygBLP6rdk5ldQKbNpKQ8d71sVc2bS+0ENTwR2wnCpuR?=
 =?us-ascii?Q?MMUKjZSsDCUfzM2vHRezH2Bf/XLfPTpOjWia2aYHSf5JouZzLTV31N6A+n19?=
 =?us-ascii?Q?gH6W5zKr2wbKKkzW+HuEJtg2xgpEZDdREBlVoSmSV6gTVdAtL2CIHmpP5qKj?=
 =?us-ascii?Q?aP9mb7ieSg+VAo1jWtd4BNtJ9oBuFT7PkBUehLPlFvgraBbWHTZrQHuNu2re?=
 =?us-ascii?Q?I9d9ABXVCO4cMlKPMtJRk0ySr5Acc7SwMpCHc7TpEtur/jCspsbvi2RdeUtu?=
 =?us-ascii?Q?gcgmrrjGmNSSldTN6qNAM0r4W5rA6fZKVZQd0A6Wg+N5+Fd91ZhvFC69kuxn?=
 =?us-ascii?Q?VwI/7vHdz1kMmpbVlEmdEiAbGo16Vn1pk3NhMODcV6lArzewQZl4vlhVslNU?=
 =?us-ascii?Q?AcTI4KmWtPPpPe7czKblI33lH3IZvVR69suGYZXMtaCUxh0e+xkUmVvrMMgf?=
 =?us-ascii?Q?8spmRr9mwvxEhngs0d6O6RorkwzB/ZErJwR2UR5NfJsqLP0+iqzkgTtbxNn9?=
 =?us-ascii?Q?C2/P/5eHm9atn65B922LCJtnN7PQys6H5ERrjVtP5AC7cnvd1d+5fo2UJbja?=
 =?us-ascii?Q?MkDKO/2eUMNxtlJty1krhqBAdBHS2GNdTV2NLodCL8m1ljmeHqoOpFn3tvi0?=
 =?us-ascii?Q?BrCKtw0yC9eYPrL+onUNJ8v01tvoKZq4xsMj5h7J1hZEwolBVYa4Ge5oizER?=
 =?us-ascii?Q?a/VEOqBgkqk55tr8OK0ynqJxGuBYTaRNtYlrWMppegVUmcHRWpOMLV5ML2zi?=
 =?us-ascii?Q?D7zmunkpfPVOGK4gKuP1s7+7ZB+BGo+QHd6mtgd8nnH49f+6lZpF+sN20q/V?=
 =?us-ascii?Q?wsgfOR3An10Z2pO1JUkh1nsYZYzchroVOa10qaKF1P0tuAPes52/x3vi4EaM?=
 =?us-ascii?Q?/NDrBtNGJGY474ZnYG7EPvrA8atFL6Y22ZGt7VO9N+6U6hXtwDdqnrrD4C7R?=
 =?us-ascii?Q?sHm7IwV2ij3xuA4H8OJo7HZt2GJaEpGzaJ9Eg2w8+3gOrBnxbiJ357jpShbg?=
 =?us-ascii?Q?Ql5nYKIpJBweR9JNTdDfC14PGNcbDQM9cNNrDChYKVaf9oobvVQx?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced42273-8510-4d17-83f6-08df170ed601
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 12:00:59.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9wcJHXcSi1qIhdzBJ0DXPI0i3CtVMVGQvXiyQ9m8YxNdCteC+YURls37xdH/8O7UOYZExSZ/HBeAsWHXya1dRXzDS/gIgkWfz9E4ldNkz/MEqOhwLBKN4sDpgGITBQD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_050147_313956_69C7FC09 
X-CRM114-Status: GOOD (  15.97  )
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
 drivers/clk/starfive/Kconfig                  |  11 ++
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-sys1.c   | 105 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys1.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 7926e02ccd7d..798af23b9bcc 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -83,3 +83,14 @@ config CLK_STARFIVE_JHB100_SYS0
 	help
 	  Say yes here to support the system-0 clock controller on the
 	  StarFive JHB100 SoC.
+
+config CLK_STARFIVE_JHB100_SYS1
+	bool "StarFive JHB100 system-1 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select AUXILIARY_BUS
+	select CLK_STARFIVE_COMMON
+	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the system-1 clock controller on the
+	  StarFive JHB100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 2c5e66d1d44e..b3571e2f0555 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
 
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys1.c b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..d181bdd79253
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
@@ -0,0 +1,105 @@
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
+#include "clk-starfive-common.h"
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
+static const struct starfive_clk_data jhb100_sys1crg_clk_data[] = {
+	/* root */
+	STARFIVE__DIV(JHB100_SYS1CLK_APB_MAIN_SYS1, "apb_main_sys1", 12,
+		      JHB100_SYS1CLK_PLL1),
+	/* sensor */
+	STARFIVE_GATE(JHB100_SYS1CLK_APB_SENSOR_ICG_BUF, "apb_sensor_icg_buf",
+		      CLK_IS_CRITICAL, JHB100_SYS1CLK_APB_MAIN_SYS1),
+	/* hostss1 */
+	STARFIVE__DIV(JHB100_SYS1CLK_GPIO_ESPI1_EXT, "gpio_espi1_ext", 14,
+		      JHB100_SYS1CLK_PLL2),
+	STARFIVE__DIV(JHB100_SYS1CLK_HOSTSS1_NCNOC_CFG, "hostss1_ncnoc_cfg", 12,
+		      JHB100_SYS1CLK_PLL1),
+	STARFIVE_GATE(JHB100_SYS1CLK_HOSTSS1_PHY_SCAN_1000_ICG_BUF,
+		      "hostss1_phy_scan_1000_icg_buf", CLK_IS_CRITICAL,
+		      JHB100_SYS1CLK_PLL1),
+	/* npu */
+	STARFIVE__DIV(JHB100_SYS1CLK_NPU_NCNOC_CFG, "npu_ncnoc_cfg", 6,
+		      JHB100_SYS1CLK_PLL1),
+	STARFIVE__DIV(JHB100_SYS1CLK_NPU_CORE_DIV, "npu_core_div", 10,
+		      JHB100_SYS1CLK_PLL0),
+	STARFIVE_GATE(JHB100_SYS1CLK_DOM_NPU_CORE_CLK, "dom_npu_core_clk",
+		      CLK_IS_CRITICAL, JHB100_SYS1CLK_NPU_CORE_DIV),
+	STARFIVE_GATE(JHB100_SYS1CLK_DOM_NPU_BUS_CLK, "dom_npu_bus_clk",
+		      CLK_IS_CRITICAL, JHB100_SYS1CLK_NPU_NCNOC_INIT),
+	STARFIVE_GATE(JHB100_SYS1CLK_DOM_NPU_INIT_CLK, "dom_npu_init_clk",
+		      CLK_IS_CRITICAL, JHB100_SYS1CLK_NPU_NCNOC_CFG),
+	STARFIVE_GATE(JHB100_SYS1CLK_DOM_NPU_OSC_CLK, "dom_npu_osc_clk",
+		      CLK_IS_CRITICAL, JHB100_SYS1CLK_OSC),
+	/* vout */
+	STARFIVE__DIV(JHB100_SYS1CLK_VOUT_NCNOC_TARG, "vout_ncnoc_targ", 12,
+		      JHB100_SYS1CLK_PLL1),
+	STARFIVE__DIV(JHB100_SYS1CLK_VOUT_PIX0, "vout_pix0", 4,
+		      JHB100_SYS1CLK_PLL4),
+	STARFIVE__DIV(JHB100_SYS1CLK_VOUT_PIX1, "vout_pix1", 4,
+		      JHB100_SYS1CLK_PLL5),
+	/* bmcperiph3 */
+	STARFIVE__DIV(JHB100_SYS1CLK_BMCPER3_NCNOC_TARG, "bmcper3_ncnoc_targ", 12,
+		      JHB100_SYS1CLK_PLL1),
+	STARFIVE__DIV(JHB100_SYS1CLK_BMCPER3_CFG_125, "bmcper3_cfg_125", 10,
+		      JHB100_SYS1CLK_PLL1),
+};
+
+static const struct starfive_crg_domain_info jhb100_sys1crg_info = {
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
+	.probe = starfive_crg_probe,
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
