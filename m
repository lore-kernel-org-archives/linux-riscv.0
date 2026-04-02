Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456CCD3940D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqFZP5/wt8J0fEJaVdgVD0mkAdgQ+SuSAMAPsbv5O5o=; b=gmKbiV6UoykEqO
	BNfpB4OCtSuguMRJshev9WSQiOZFQbOkHNDPVYyJfX4kJdJ80b7jTWHgNPCwHM1dXa0zQC9KgYqns
	3+eYA35cP1Ij8bl6C2RpINsfKiydc1Gp7PFYzgOU7tS2S10FJDuVr0l6idKFv1DnDsj+JqTi9uQx+
	ODs/k/A/F+H7BehTobzw3f9KOAMBQP23GMy+1+212oYCVCHw+KewnzbUvfAuEesk+nsviCtOzm4Kb
	+nXDQXPnWXgcNNtCelnCmM8OG3w3rqrfjZrs7gmjQxU2z1ltIyTU7xwqEoYe0WTvgK+qkUZjuA/Jo
	TkqJb9geJfBYhy4fgmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Fj1-0000000HS8S-2BZv;
	Thu, 02 Apr 2026 10:56:35 +0000
Received: from mail-bjschn02on2072f.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72f] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Fiy-0000000HRbO-2ZLS
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 10:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6zBC+EvlgZAJ0CBiD+ILy3H66UfmmKfL4hB0CijQMFE9lpt3Wr4I0PZXpU/6x5BXMbMNADJgsdaitmXKERvR9XiYu0LNtxm6VQaIvfWqqpgwyCGaQtzzP4lmKPACbLRjlsHcgLq+EXNdul+jyxw2tAT7u8KKbld55tc3omYx9sWkFyVFAUP4mJuVUzfXMzHUMjJ8oUX7ofi2GORy0z0zZpACKDq5WrHDRcTqTre0t0YotgqByQL/cz45F54o6Z0wL2Kt9ODB553CJgNMPa/pfUQTL1Ndw+u8JRtCgTaa5iSH7a1jePM3u8X06NoakUVumYyQF9ky3ypfJqxBGmpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1cEMTViG08MLVOUlwp8qh9FOQYCXI3qQf+jGnjeG2I=;
 b=cFCbzJoIMYbnHy7ZUrmDzoz692wDrwAdSvwRrCxq5F9QRizV+ek6BbHeNUm/RG1SYgkesezfnyEmA54HdClckQBvHdQR1Wnm/8d5W8FM/9UBkFHER3PmSe+2vWgD5JF/PtNNwQh+hl68sUFGk3sVpBIn/JYF7ceA2CGxv4OzSI2p0Hou9F1G1nsb0KYtwHJNtYbSaG1A6khl1/m1jWRJLwUcYGTr9p5Q9iTfB0LZzH4FovfsLt3H/UC2ALf8p8/iJaNeAcBHkvg2yq8f3DL7knwCC/xy7HGtdJfSKp1iBux0gBRCP6vOWOg6JNaiIODa+DucIg7myY/Co7FQ3BJj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::5) by ZQ0PR01MB1048.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 10:56:21 +0000
Received: from ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
 ([fe80::63d1:b688:cab7:50cb]) by
 ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn ([fe80::63d1:b688:cab7:50cb%7])
 with mapi id 15.20.9769.017; Thu, 2 Apr 2026 10:56:21 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
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
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 21/22] reset: starfive: Add StarFive JHB100 reset driver
Date: Thu,  2 Apr 2026 03:55:22 -0700
Message-Id: <20260402105523.447523-22-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260402105523.447523-1-changhuang.liang@starfivetech.com>
References: <20260402105523.447523-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0028.CHNPR01.prod.partner.outlook.cn (10.2.0.210)
 To ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn (10.2.3.165)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1208:EE_|ZQ0PR01MB1048:EE_
X-MS-Office365-Filtering-Correlation-Id: a7781508-fb2c-499f-8428-08de90a679d4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: xJJp/ag2bTlM6MgZNBAqIFSdIIbidjH8Wa1zymmODE7PlrQoNk8q4x6fwXKSlJhKoH6YNlb84hcpr/a8mUWNRliKTwcsGftUeuro4rwfiS65eK7rvwdDp49L3xZLIDX23lKoWOt6aVK8r/jPPpwxVrCIFDU+OcpDnTg9OHf6e3d42NI5Mol+BnyMZtYYQXVUnzOYjS6S/ILsV5/NFItX1b7pGM3hXkP/Y/XBZV0MylYTWAj4n8KH1hNIU5yTQPSNTslTqxv6AS34uTQY9OAecPbIrOlrVIG4egNs19fX290SzgfZCWHll37NXkn/ra8cJLwAZgR7n8d7bLKp26rmes3Dv6gNepnr1wA8xW6b3RKet55N6KTItO1LQ5UkmDxgCOTNz8hTOmzppEwmUpOisKI13rCuSFf/1BsPxbY8+Za2XO4oOdD77/mgiZJhKtE5V6hMBtiYjvEoepEn/CZz/07gpcqP57tsMlErofoEHHDrYj/05uiTz5wY/Gn31mkopnMaL8J3drdl24qcc3PxL2vYpQhCL6ZazrNkRRNzuo/h2CTkI+t8QX8UD6+hkXk4tz2w8xZw1F0YmZ1ei2PV5gvinaVNguRA8dBYHTgJySo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f7gjM2rqgT9tLXzGeXUvsKQ1SpZVStG2bPsoVfsjP0hi5s7C87r73Y0h0+Hf?=
 =?us-ascii?Q?0lFxOQfUIUT2LtcbtRykRLK60gPoksVUvhYUEowQ5KS3yM/nSJqTrnprHAGk?=
 =?us-ascii?Q?z0wEH0uxPT0C9npM2xoIFJBmcEDEIa8S4u0DwdlfzY94GMz2ClKNrlWgU3EG?=
 =?us-ascii?Q?Gyjj3G2GkQoFPLRBxema3gL5l6WqgygpoV7FC6G3EL2PXzEkCdeFp/hKO2zB?=
 =?us-ascii?Q?NczeVIU8i5q1fAaVxLI93Qm5LK+knloyGmzJUxjGhboG24x5AW4xpFvbFRb1?=
 =?us-ascii?Q?s/F4wyfmMuDAvTXvkjJ7NB1iZFL4Ft8WTXXpT6CT3OOFMGYAdSnaHY/2kRlN?=
 =?us-ascii?Q?ADdTVxZ9RVTPLVOE1sD9s3lV2VOLctUHBRj5VZukqRPT/OVFQVvoBdS7Xh1o?=
 =?us-ascii?Q?hTeJiUckkEZTl6CGc9E/4tdt/PUpAZ7BNggSW+PnIDNhj75uT8/Qw+N97Iw2?=
 =?us-ascii?Q?fvfgm5t7Pi/fdLKW9dkSzmcj+qFm80m1oJSbUdGpXkrL+KnOlvqCVvRyL7ex?=
 =?us-ascii?Q?gBtIMcccSu6b3FhXqgOG0XNN2bDyk6KJdRCVU+Q/+DQjq+F+JdQNSAqUGo01?=
 =?us-ascii?Q?/f/vm/Y9UKK4mVIIod4E/tBvlijzFXCpIiCgKL+H1QC3B4ulB196RhFLFPkA?=
 =?us-ascii?Q?jl553p9xRGYoGFOjsaWNx9gV+RasL/ic9+nDnJVvIfqXcS2yjUcyiY20rXmz?=
 =?us-ascii?Q?H/3OiW/VVbdM8u8NEbiPOx4J25PH2sT28o59AfLhtBeYZeJOcYEEWjwz1W+S?=
 =?us-ascii?Q?ZrMWJ1ErczVv4OnrfWNp7SIMuaD9+mV2ygM2Ug68A4O8JozS230jBbDbUGif?=
 =?us-ascii?Q?vtzcUMEloufzLIck9MzovItVtjlut8L4BqkpEzcuKyEQR0msZg3QurzQo27s?=
 =?us-ascii?Q?F/blOa88/rBalootlPS1bi2zEC01IeH+H9MUEO6IZDO85Qyfh5CmiGvdNvsW?=
 =?us-ascii?Q?FU9gg0qeNH1MBJxV3yuvmGIjmbTRfvshguOykrgT4ToPwpEBK6ynGFqaPVaD?=
 =?us-ascii?Q?sH+7MZ58JmUn7IEuXqWUdMAIoUVSe/GFt/mGGvcqUwPRryBBpVXSGRyGiVX0?=
 =?us-ascii?Q?dhyo7E5zjNa0VQDmnparFGK0tPtL6VxIATCrLreMzHdFyuNCN396x3pMKl+B?=
 =?us-ascii?Q?3KldxapJJP2WJuWslIcJRHznbc3wEELwMHFThqyUnMgJ+cBv5ToYpuZPFOHb?=
 =?us-ascii?Q?MnkdDYRCwPnpddVmspyaPZCyJEvXLm+ugge97UcwNYhd4e2fp686uXd+JSxL?=
 =?us-ascii?Q?kO/kzAhKtgpUUSMCyszubpQ/P6tPt2KiFBcbNQNQKMA8OuY8sVarFpj7g6oK?=
 =?us-ascii?Q?BngxlrI7uvmWORKU0SoqBSC2MQY/KKxqexNCIURvmfE6d+mTfPte9+E4WQiN?=
 =?us-ascii?Q?sSdXavU4w6FdCU1mJ5JDCjicnjUwdbiEvpbdTqdS32hy+FbQU3nYtpjgFsKm?=
 =?us-ascii?Q?dExTz1ERIZOX6DL+Pw3QXDEInxbVyGMHgIAr+lSSN/oXpJLyPdwzx8nSlDUm?=
 =?us-ascii?Q?Ovif3UFexC03acKwINy9MW/pD1CLUKbltmabZGiNEU07GwL1TCJi5Tpp5Im2?=
 =?us-ascii?Q?PFwiGwin3J57QNpXeTlReH3vucSQaukQbJ6Ivhrer0OXdT0zi5+OOXMGcpgs?=
 =?us-ascii?Q?3/izMV2HEg/Owf3j10YiOAk/X4abSMHQdoNy6UpcwA/KhmxdvvycxIRT2+Df?=
 =?us-ascii?Q?vhQxNr1fj1Fzt5CdNUwvQjTgzxKdaO9/FueHlb4e98dnkbZeNXfJcMHMq4kO?=
 =?us-ascii?Q?zzvARvX3lrkhtivryH8p7LxaWBnY9MMdhGrDVC/d/SJ8JOSIrmwo?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7781508-fb2c-499f-8428-08de90a679d4
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1208.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:56:21.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfM3MCKKOai8YSWMYKa48reozL+FRKbMMDXJdRGywSYmaMdiJEZuJJXZ68s7X7oxau1M1BD9iE2lFFx/hpid7uoFRWqiM2JzGntgnG+3Je1rYre/r2n53PUd6n1lurri
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_035632_658943_EBA590EB 
X-CRM114-Status: GOOD (  17.57  )
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

Add auxiliary reset driver to support StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |   6 +
 drivers/reset/starfive/Kconfig                |   9 ++
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-jhb100.c    | 121 ++++++++++++++++++
 4 files changed, 137 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3af9d79b7daf..4ddf8ba2e60d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25319,6 +25319,12 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	arch/riscv/boot/dts/starfive/jhb100*
 
+STARFIVE JHB100 RESET CONTROLLER DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Maintained
+F:	drivers/reset/starfive/reset-starfive-jhb1*
+F:	include/dt-bindings/reset/starfive,jhb1*.h
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index 29fbcf1a7d83..6f9a0f24f9b9 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7110 SoC.
+
+config RESET_STARFIVE_JHB100
+	bool "StarFive JHB100 Reset Driver"
+	depends on CLK_STARFIVE_JHB100_SYS0
+	select AUXILIARY_BUS
+	select RESET_STARFIVE_COMMON
+	default ARCH_STARFIVE
+	help
+	  This enables the reset controller driver for the StarFive JHB100 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index 582e4c160bd4..217002302a9f 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_RESET_STARFIVE_COMMON)		+= reset-starfive-common.o
 
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
+obj-$(CONFIG_RESET_STARFIVE_JHB100)		+= reset-starfive-jhb100.o
diff --git a/drivers/reset/starfive/reset-starfive-jhb100.c b/drivers/reset/starfive/reset-starfive-jhb100.c
new file mode 100644
index 000000000000..ab5e0f2a684f
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JHB110 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ */
+
+#include <dt-bindings/reset/starfive,jhb100-crg.h>
+#include <linux/auxiliary_bus.h>
+#include <soc/starfive/reset-starfive-common.h>
+
+#include "reset-starfive-common.h"
+
+#define NUM_RESETS(x)		((x) + 1)
+
+struct jhb100_reset_info {
+	unsigned int nr_resets;
+	unsigned int assert_offset;
+	unsigned int status_offset;
+};
+
+static const struct jhb100_reset_info jhb100_sys0_info = {
+	.nr_resets = NUM_RESETS(JHB100_SYS0RST_BMCUSB_RSTN_CRG),
+	.assert_offset = 0x12c,
+	.status_offset = 0x130,
+};
+
+static const struct jhb100_reset_info jhb100_sys1_info = {
+	.nr_resets = NUM_RESETS(JHB100_SYS1RST_BMCPERIPH3_RSTN_BUS),
+	.assert_offset = 0x54,
+	.status_offset = 0x58,
+};
+
+static const struct jhb100_reset_info jhb100_sys2_info = {
+	.nr_resets = NUM_RESETS(JHB100_SYS2RST_GPU1_HOST_PCIE_RST_N),
+	.assert_offset = 0x88,
+	.status_offset = 0x8c,
+};
+
+static const struct jhb100_reset_info jhb100_periph0_info = {
+	.nr_resets = NUM_RESETS(JHB100_PER0RST_UART_MUX_REG_WRAP),
+	.assert_offset = 0x554,
+	.status_offset = 0x560,
+};
+
+static const struct jhb100_reset_info jhb100_periph1_info = {
+	.nr_resets = NUM_RESETS(JHB100_PER1RST_MAIN_RSTN_PERIPH1_RAS),
+	.assert_offset = 0x134,
+	.status_offset = 0x138,
+};
+
+static const struct jhb100_reset_info jhb100_periph2_info = {
+	.nr_resets = NUM_RESETS(JHB100_PER2RST_MAIN_RSTN_PERIPH2_SENSORS),
+	.assert_offset = 0x11c,
+	.status_offset = 0x120,
+};
+
+static const struct jhb100_reset_info jhb100_periph3_info = {
+	.nr_resets = NUM_RESETS(JHB100_PER3RST_IOMUX_PRESETN),
+	.assert_offset = 0x98,
+	.status_offset = 0x9c,
+};
+
+static int jhb100_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct jhb100_reset_info *info = (struct jhb100_reset_info *)(id->driver_data);
+	struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
+	void __iomem *base = rdev->base;
+
+	if (!info || !base)
+		return -ENODEV;
+
+	return reset_starfive_register(&adev->dev, adev->dev.parent->of_node,
+				       base + info->assert_offset,
+				       base + info->status_offset,
+				       NULL, info->nr_resets, NULL);
+}
+
+static const struct auxiliary_device_id jhb100_reset_ids[] = {
+	{
+		.name = "clk_starfive_jhb100_sys0.r-sys0",
+		.driver_data = (kernel_ulong_t)&jhb100_sys0_info,
+	},
+	{
+		.name = "clk_starfive_jhb100_sys0.r-sys1",
+		.driver_data = (kernel_ulong_t)&jhb100_sys1_info,
+	},
+	{
+		.name = "clk_starfive_jhb100_sys0.r-sys2",
+		.driver_data = (kernel_ulong_t)&jhb100_sys2_info,
+	},
+	{
+		.name = "clk_starfive_jhb100_sys0.r-per0",
+		.driver_data = (kernel_ulong_t)&jhb100_periph0_info,
+	},
+	{
+		.name = "clk_starfive_jhb100_sys0.r-per1",
+		.driver_data = (kernel_ulong_t)&jhb100_periph1_info,
+	},
+	{
+		.name = "clk_starfive_jhb100_sys0.r-per2",
+		.driver_data = (kernel_ulong_t)&jhb100_periph2_info,
+	},
+	{
+		.name = "clk_starfive_jhb100_sys0.r-per3",
+		.driver_data = (kernel_ulong_t)&jhb100_periph3_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, jhb100_reset_ids);
+
+static struct auxiliary_driver jhb100_reset_driver = {
+	.probe		= jhb100_reset_probe,
+	.id_table	= jhb100_reset_ids,
+};
+module_auxiliary_driver(jhb100_reset_driver);
+
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 reset driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
