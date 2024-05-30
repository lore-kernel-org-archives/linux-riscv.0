Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EA8C27C43
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5paAFN3UGDSMv0r1pNZGynyuUCkzBXki7vMedwK7PYw=; b=JHQsR0lqU5mHLl
	nMJLnsLA2VG7qpW6l3HP0rzm6ADorhU+JVXD5SqdNR1YPY/HQNg/C275+0lTBXWL+V5DTDvqn3xzk
	s5UzKVIXgXq/VkyH4Ch+fJyhcOIWqI/6q+rY4OxfJqD09U+naK+WKMkJ1Kj2KZ7jJeqhRd8uv+WVt
	uLVcWeszF2ASi2cZgn/Oq3qkz2w+J3flH0lpU1WOVugg3tEDEsUIgfjSqg9T1AE7RZaIKOZd2/ZQM
	MQyj2J7SOi9g+vN/SpMFBPdJ1EGWWR9ZtjQE75GEBmi6hIMCGG+az7mPulmTE1aQhFqkLIltI58UE
	xFxYro1o/TAIzMAUvaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCg9l-00000007QcK-0fBL;
	Thu, 30 May 2024 13:49:25 +0000
Received: from mail-sgaapc01olkn20817.outbound.protection.outlook.com ([2a01:111:f400:feab::817] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCg9h-00000007QYF-0FO4
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 13:49:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpLR6XCGgVCZs9kwMw8WVQtoG9TGQuhoBJ1ji8xLYm+o+0WnTctDh0/F0RT6WoPiyGaCjnxXHef/j72XFGGqgQol4MLJHWIQGV8lVa8u6GvCq3XY68SZ116gBbe435UAxTmnbdu64eyKm8seLCSQ3NQkFv1aqbWfwfZoqS+yfiPAffmzRY3oiHwLjvcpE61rMFhMY06HJDVxgiJXEKc0U7uhOVfUNZNBx6FwG26IHC/hbLkm6drbq+K5+/bBoP9Wp7TxLRTulVvniwobYr7ZfSAK9PhwbYpeVKwKGuvLF94PDkRDvJJULC2pdbRmzGa+2YbC1XgGRN0m1bx/I6fL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYss9djwK6bL7UY2NUukNDwb58o4m5NbqYrXWUGZlgE=;
 b=IAS5mYsoZS2H4KsK+thkSzQVG2V0NxMiOBBSF27zj74vI1r9d+PCOAfJvszLsCP/NPZBsq408AhFF7gix2ZuRysXup2rB+gzBxQjAOBIFPY+3rgl514/CkjmutFu5j9u6uJtC72Ya7oIHflz1EfSbIa55cjYe+PiHXvA/xqNurVQn0W998awEaXJPTaEJNj2cVYw2iIzpl+2L6+fvY8hPVZGwwqaapMYc1hsBITmEImtbRXl+Plzo4KPcUczYsFvwMEGjh0y7mpFgUtJAPeGv/JaM45WJtBW4XuQDxe0MFQWSqyNtnzu296zFwJ/owDUMxDXwJJEcGbAENRO2DORKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYss9djwK6bL7UY2NUukNDwb58o4m5NbqYrXWUGZlgE=;
 b=LrzWycIRUDpiVhOFPrUAcGW/jCMgljoHsAP+gM8f5X7erI0v5f7q9BVrz+wLzf4SlMC1C0RJkoNRXAtWH73yBCnoXoU8WXB1Kdsf17KFrYJYgPcYrmfU6z2laLOOWVw/qxUtCSBj/31pj1UOa4ulLGj7idqUuPtJfRVAuswCNZS83HchJ09sjg7Q9aO9UJO++EIDtYaLUaDHCBSOAupZMLk5Xfz0BK4SRYzCgwA7wX9iajubdPcP/5lQJAUG3C3F2ezkYhkFZ7U62YHsMFYzjqaia+/VUX6D889zwfrrT2Fgrs187azZmwh5N2RSBz5Ln+YecZUgMZTFeo/lO1vRiA==
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12) by TYSPR01MB5657.apcprd01.prod.exchangelabs.com
 (2603:1096:400:42c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 30 May
 2024 13:49:12 +0000
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756]) by SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756%4]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 13:49:12 +0000
From: Haylen Chu <heylenay@outlook.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>
Subject: [PATCH 3/3] thermal: cv180x: Add cv180x thermal driver support
Date: Thu, 30 May 2024 13:48:27 +0000
Message-ID: <SEYPR01MB4221BEBBF659F8495BF0E831D7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <SEYPR01MB422119B40F4CF05B823F93DCD7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB422119B40F4CF05B823F93DCD7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-TMN: [YWUfnzWzre1af1lXCVRyc6z7vzbmpc0k]
X-ClientProxiedBy: SG2P153CA0036.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::23)
 To SEYPR01MB4221.apcprd01.prod.exchangelabs.com (2603:1096:101:56::12)
X-Microsoft-Original-Message-ID: <20240530134827.53431-3-heylenay@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB4221:EE_|TYSPR01MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd4b755-f484-42bc-9550-08dc80af4973
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|3430499023|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info: ArsMR5ClokS1aixcRWy78DLyFJMDpg9/xenEoQiQsx+2W+Xjpusvc+ZOKKaJKRF217YryRuZJuNfzYa8cK9hmt+J6QmJvGtfnVrtrsvTpIcvNLXJx3NlPxC1gTjrSLLqdz8kfweY98UUoqpt02vhdq8zSBzxk8RrTXpYS27a+iuftivfBsE+0us5RsVKMr9iC9eLtFSQrrdNpyGJEh6IBvvuL9uFrTfhO7MdboNkNAjJCk2M1N1pXdN9SKaMzXKfC+XrAcHG9J+A/Z9IgMfz/ev9Nkg0nG331p0KyQI8Y3MvwtXl6BWvGf8rpuIOeuzpm5/2675v5TXQw7iRrl5pQwXPlpFIB/86G7oM9/QzzYhcyjhiX5WGdHVZ4YFdVw/OWYGSkK2T9VMY3ln6eiXiBhYMVE3pcNXLOl0KEE3o5hnhba7jPjNsGMiMpmZ1tFvNIC3gOqFL3514MUdeLwk/nZe1jnR6RFNWqj4zOt38hRIBkoK+OhMY5TNL+XRbYinkLtpGjGzIWlSmS23mA2lD2sblTjSqvpASN5wtcUy3gydn9DeOGCrCorQ/+fnTqIBAmtvqZosPF1l5hZU1cpvxybWKI6EoEnBfCwkLRu1n+9nK9PkrAt5JBXs6RlbgU4rV
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CZKiKaGZdKumqZ/zeYVEyhQO3n7wYsOeWVE/3FkCoPp/uPcmyVAHwfsZZZxf?=
 =?us-ascii?Q?mYS2i6HlijUJJLRaL0+bYmoL2q9zkkK7LAhovId15946hsPekrObMjDVoBK3?=
 =?us-ascii?Q?5pMIMtKoMMTft7koK/3tNOAXfP/J+wAjK6wdiZsAVbKGI3b8BTMMY0pKeEmJ?=
 =?us-ascii?Q?29Ww/Y4OyIFOmNRVzCZ6KPLkpEXVnoYa0V0G3zC8GQz6ndRbezXwRgaEstEz?=
 =?us-ascii?Q?+caKil2eAI5pbgAC00bk9JFa7rz+19+wJrMJaV3tUXllKMaKNVmlvdH38LkK?=
 =?us-ascii?Q?SeeCzvAZa/SxAgwPjcOmzIABOntLFNbv2xfPZwGlhDunZ5TO9KVb9ZpCN2Z8?=
 =?us-ascii?Q?gvfYYyQCAh0R/pJhiIkZV1sEVmIG/JXuE5iFbsW1mpef05RmrgvzBB/taG79?=
 =?us-ascii?Q?F5yO6bTPt2boyJx2e347njSPe1aeOXaohquhpFqHjfDtsWTs1UAuXpYaaPOJ?=
 =?us-ascii?Q?BIrzCH5rqbDA0xjvh2pMQOFKPlu9edDkV0CCCEiaZSkwTTDaWDTtrYPmH2uK?=
 =?us-ascii?Q?QqXmdknYQCL4VUMZUK644Qi7fqsDSEmbpIlc844TR8VUj59nXm8LkRZXiTsd?=
 =?us-ascii?Q?tUBC0NpFiMCl7B/DbxmxdjExaQpeGPtyl3tr9LZrjC5Cv3Pc/1RIiqcxG4LS?=
 =?us-ascii?Q?HSdXZbt8dJ2gb3l2jOHV5yVxUDdsQEZj/XfxkfSKMhME7ie/PwRFAxVZ/lhz?=
 =?us-ascii?Q?taH78lc592/TUZA3mpCLSIBsYtFAzG3Y1/j6AlZrdxt7dNeWF4jEcLG+QU5R?=
 =?us-ascii?Q?MReAzgrHulAXE+5SDwnYaqdl5abhUCMJMpml1QU4eHciEE9nv/6W3xJZ5mFh?=
 =?us-ascii?Q?sMUICB2clKf5trxRDvCRlAb67PDcR2mFxt4oUCStLk32LThZcvcoN5dyDXKE?=
 =?us-ascii?Q?9rUtRJRWZIg9xDtZomyYefbv6en+tofLiWb/x4Ep9u1dKG04wQ97eLE/T+Az?=
 =?us-ascii?Q?klJ6rez7RDyfart1vNqKq5sXYM70edNUl3xA5FLgXsy/Tvb0I17lvhkKwnkQ?=
 =?us-ascii?Q?X5joXPHGTjcPerLazoaO7LUknLrN0IvLdY7fC5R3bQM8cQ67w/6ToWJffqVj?=
 =?us-ascii?Q?IJkT96nkPr2S/T/AhvF0TQ4oKfQFI3NRLN0YK4M/v+G0oWsjAEH1itA0FS3K?=
 =?us-ascii?Q?f7WcAFm20i5UmdXJz3dipdMr2m4bds6ML8yMnpd3PntfsLL1SHUFPvFGy8In?=
 =?us-ascii?Q?H6gEGeAsjV1iLQO0ixpk4FjjlO24HoR+2S/f0lWZssYXehTsiRWDwhmkUa8?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd4b755-f484-42bc-9550-08dc80af4973
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB4221.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 13:49:12.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR01MB5657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_064921_132828_1F5F3974 
X-CRM114-Status: GOOD (  18.40  )
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

Add support for cv180x SoCs integrated thermal sensors.

Signed-off-by: Haylen Chu <heylenay@outlook.com>
---
 drivers/thermal/Kconfig          |   6 +
 drivers/thermal/Makefile         |   1 +
 drivers/thermal/cv180x_thermal.c | 210 +++++++++++++++++++++++++++++++
 3 files changed, 217 insertions(+)
 create mode 100644 drivers/thermal/cv180x_thermal.c

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 204ed89a3ec9..f53c973a361d 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -514,4 +514,10 @@ config LOONGSON2_THERMAL
 	  is higher than the high temperature threshold or lower than the low
 	  temperature threshold, the interrupt will occur.
 
+config CV180X_THERMAL
+	tristate "Temperature sensor driver for Sophgo CV180X"
+	help
+	  If you say yes here you get support for thermal sensor integrated in
+	  Sophgo CV180X SoCs.
+
 endif
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index 5cdf7d68687f..5b59bde8a579 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -65,3 +65,4 @@ obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
 obj-$(CONFIG_SPRD_THERMAL)	+= sprd_thermal.o
 obj-$(CONFIG_KHADAS_MCU_FAN_THERMAL)	+= khadas_mcu_fan.o
 obj-$(CONFIG_LOONGSON2_THERMAL)	+= loongson2_thermal.o
+obj-$(CONFIG_CV180X_THERMAL)	+= cv180x_thermal.o
diff --git a/drivers/thermal/cv180x_thermal.c b/drivers/thermal/cv180x_thermal.c
new file mode 100644
index 000000000000..618e031b4515
--- /dev/null
+++ b/drivers/thermal/cv180x_thermal.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 CVITEK Inc.
+ * Copyright (C) 2024 Haylen Chu <heylenay@outlook.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/thermal.h>
+
+#define TEMPSEN_VERSION					0x0
+#define TEMPSEN_CTRL					0x4
+#define TEMPSEN_CTRL_EN					BIT(0)
+#define TEMPSEN_CTRL_SEL_MASK				GENMASK(7, 4)
+#define TEMPSEN_CTRL_SEL_OFFSET				4
+#define TEMPSEN_STATUS					0x8
+#define TEMPSEN_SET					0xc
+#define TEMPSEN_SET_CHOPSEL_MASK			GENMASK(5, 4)
+#define TEMPSEN_SET_CHOPSEL_OFFSET			4
+#define TEMPSEN_SET_CHOPSEL_128T			0
+#define TEMPSEN_SET_CHOPSEL_256T			1
+#define TEMPSEN_SET_CHOPSEL_512T			2
+#define TEMPSEN_SET_CHOPSEL_1024T			3
+#define TEMPSEN_SET_ACCSEL_MASK				GENMASK(7, 6)
+#define TEMPSEN_SET_ACCSEL_OFFSET			6
+#define TEMPSEN_SET_ACCSEL_512T				0
+#define TEMPSEN_SET_ACCSEL_1024T			1
+#define TEMPSEN_SET_ACCSEL_2048T			2
+#define TEMPSEN_SET_ACCSEL_4096T			3
+#define TEMPSEN_SET_CYC_CLKDIV_MASK			GENMASK(15, 8)
+#define TEMPSEN_SET_CYC_CLKDIV_OFFSET			8
+#define TEMPSEN_INTR_EN					0x10
+#define TEMPSEN_INTR_CLR				0x14
+#define TEMPSEN_INTR_STA				0x18
+#define TEMPSEN_INTR_RAW				0x1c
+#define TEMPSEN_RESULT(n)				(0x20 + (n) * 4)
+#define TEMPSEN_RESULT_RESULT_MASK			GENMASK(12, 0)
+#define TEMPSEN_RESULT_MAX_RESULT_MASK			GENMASK(28, 16)
+#define TEMPSEN_RESULT_CLR_MAX_RESULT			BIT(31)
+#define TEMPSEN_AUTO_PERIOD				0x64
+#define TEMPSEN_AUTO_PERIOD_AUTO_CYCLE_MASK		GENMASK(23, 0)
+#define TEMPSEN_AUTO_PERIOD_AUTO_CYCLE_OFFSET		0
+
+struct cv180x_thermal_zone {
+	struct device *dev;
+	void __iomem *base;
+	struct clk *clk_tempsen;
+};
+
+static void cv180x_thermal_init(struct cv180x_thermal_zone *ctz)
+{
+	void __iomem *base = ctz->base;
+	u32 regval;
+
+	writel(readl(base + TEMPSEN_INTR_RAW), base + TEMPSEN_INTR_CLR);
+	writel(TEMPSEN_RESULT_CLR_MAX_RESULT, base + TEMPSEN_RESULT(0));
+
+	regval = readl(base + TEMPSEN_SET);
+	regval &= ~TEMPSEN_SET_CHOPSEL_MASK;
+	regval &= ~TEMPSEN_SET_ACCSEL_MASK;
+	regval &= ~TEMPSEN_SET_CYC_CLKDIV_MASK;
+	regval |= TEMPSEN_SET_CHOPSEL_1024T << TEMPSEN_SET_CHOPSEL_OFFSET;
+	regval |= TEMPSEN_SET_ACCSEL_2048T  << TEMPSEN_SET_ACCSEL_OFFSET;
+	regval |= 0x31 << TEMPSEN_SET_CYC_CLKDIV_OFFSET;
+	writel(regval, base + TEMPSEN_SET);
+
+	regval = readl(base + TEMPSEN_AUTO_PERIOD);
+	regval &= ~TEMPSEN_AUTO_PERIOD_AUTO_CYCLE_MASK;
+	regval |= 0x100000 << TEMPSEN_AUTO_PERIOD_AUTO_CYCLE_OFFSET;
+	writel(regval, base + TEMPSEN_AUTO_PERIOD);
+
+	regval = readl(base + TEMPSEN_CTRL);
+	regval &= ~TEMPSEN_CTRL_SEL_MASK;
+	regval |= 1 << TEMPSEN_CTRL_SEL_OFFSET;
+	regval |= TEMPSEN_CTRL_EN;
+	writel(regval, base + TEMPSEN_CTRL);
+}
+
+static void cv180x_thermal_deinit(struct cv180x_thermal_zone *ct)
+{
+	void __iomem *base = ct->base;
+	u32 regval;
+
+	regval = readl(base + TEMPSEN_CTRL);
+	regval &= ~(TEMPSEN_CTRL_SEL_MASK | TEMPSEN_CTRL_EN);
+	writel(regval, base + TEMPSEN_CTRL);
+
+	writel(readl(base + TEMPSEN_INTR_RAW), base + TEMPSEN_INTR_CLR);
+}
+
+static int calc_temp(uint32_t result)
+{
+	return ((result * 1000) * 716 / 2048 - 273000);
+}
+
+static int cv180x_get_temp(struct thermal_zone_device *tdev, int *temperature)
+{
+	struct cv180x_thermal_zone *ctz = thermal_zone_device_priv(tdev);
+	void __iomem *base = ctz->base;
+	u32 result;
+
+	result = readl(base + TEMPSEN_RESULT(0)) & TEMPSEN_RESULT_RESULT_MASK;
+	*temperature = calc_temp(result);
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops cv180x_thermal_ops = {
+	.get_temp = cv180x_get_temp,
+};
+
+static const struct of_device_id cv180x_thermal_of_match[] = {
+	{
+		.compatible = "sophgo,cv180x-thermal",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, cv180x_thermal_of_match);
+
+static int cv180x_thermal_probe(struct platform_device *pdev)
+{
+	struct cv180x_thermal_zone *ctz;
+	struct thermal_zone_device *tz;
+	struct resource *res;
+
+	ctz = devm_kzalloc(&pdev->dev, sizeof(*ctz), GFP_KERNEL);
+	if (!ctz)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ctz->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ctz->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ctz->base),
+				     "failed to map tempsen registers\n");
+
+	ctz->clk_tempsen = devm_clk_get(&pdev->dev, "clk_tempsen");
+	if (IS_ERR(ctz->clk_tempsen))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ctz->clk_tempsen),
+				     "failed to get clk_tempsen\n");
+
+	clk_prepare_enable(ctz->clk_tempsen);
+
+	ctz->dev = &pdev->dev;
+
+	cv180x_thermal_init(ctz);
+
+	platform_set_drvdata(pdev, ctz);
+
+	tz = devm_thermal_of_zone_register(&pdev->dev, 0, ctz,
+					   &cv180x_thermal_ops);
+	if (IS_ERR(tz))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tz),
+				     "failed to register thermal zone\n");
+
+	return 0;
+}
+
+static int cv180x_thermal_remove(struct platform_device *pdev)
+{
+	struct cv180x_thermal_zone *ctz = platform_get_drvdata(pdev);
+
+	cv180x_thermal_deinit(ctz);
+	clk_disable_unprepare(ctz->clk_tempsen);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int cv180x_thermal_suspend(struct device *dev)
+{
+	struct cv180x_thermal_zone *ctz = dev_get_drvdata(dev);
+
+	cv180x_thermal_deinit(ctz);
+	clk_disable_unprepare(ctz->clk_tempsen);
+
+	return 0;
+}
+
+static int cv180x_thermal_resume(struct device *dev)
+{
+	struct cv180x_thermal_zone *ctz = dev_get_drvdata(dev);
+
+	clk_prepare_enable(ctz->clk_tempsen);
+	cv180x_thermal_init(ctz);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(cv180x_thermal_pm_ops,
+			 cv180x_thermal_suspend, cv180x_thermal_resume);
+
+static struct platform_driver cv180x_thermal_driver = {
+	.probe = cv180x_thermal_probe,
+	.remove = cv180x_thermal_remove,
+	.driver = {
+		.name = "cv180x-thermal",
+		.pm = &cv180x_thermal_pm_ops,
+		.of_match_table = cv180x_thermal_of_match,
+	},
+};
+
+module_platform_driver(cv180x_thermal_driver);
+
+MODULE_AUTHOR("Haylen Chu <heylenay@outlook.com>");
+MODULE_LICENSE("GPL");
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
