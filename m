Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C3AC54E5D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 02:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8U63jX1S2aTy6miRNfYGdn5T34i02oo4hLTI+UYU0js=; b=lM1J1wAoX0qymz
	qV97T95V7PkszCazzs8xg5r7we56wOotQf2wnh46ZByzfKOZh6n35o6fN62eel34qQjxIX9wKeIbv
	6g1EaynV4tHceCN6QHjRf+M6BEah2lewowCYM8yfhoOBYsDAYbjS8ZJwSIIoD/tEu9MKq3Wh9jaz5
	OU+wt/WbEZfldtqQ/wQ9qlKx2VBaNu+ZYuMpyfRhqlzeHeSqqbEsJLNITFRiVA4sa+AsUpDmFVUiH
	JDfc/zc8gz/nD2qtwTY0sWzvkMyOBCaulRvUANiT67C3Wk4yRyjWUw0fmJSvtete99ChZq7VG+LkC
	d3tmhqXgxHZlkYWob91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxfA-0000000GSsO-22II;
	Fri, 15 Mar 2024 02:51:16 +0000
Received: from mail-mw2nam12olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2805::801] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxf5-0000000GSpK-1ZhL
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 02:51:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWwd6VMRe6ybFwm2mKhKvwX+4SKMZv2yfv1ebyG5RPccb2QcQrwcVtB+Um1KeIOoKnhMoC9AM5U/30/s3r+dN0ztDtVrAJKlAldm8VtJ9DLap3f8gfMoyjS1E/eiRt99JaAd9ukeefxPuz+eziKTyzP2UOkqNMy94nFqlbQS1SeUZVjBpPlJOA2OaQtyFUKREHYDkEidE4bFa9VEILVqCEyQHRwvXuHl9v9IuFUA9kGOngDcqQIZVe1XHCKKImn2AdGYOzyloX6rqqrI0y/IIOmzFc01IZQt0yieQsvXMqACeoB6kD4J0E3MK+bdwZtzOvSp+wHTEWQvCMiOC/yNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnWIaekvWfIQHaZcJpQ7RUb/6XvShLmgknIWz1YlPKE=;
 b=gmT10AQKYczhTMoh+oOHUr8JphHiYZ4by+G//CeBh/X6hK7zasTZ50cYVVcbK4Og7T4bg7Hjh/SFA2fdG63L3JjMxqPmvqjbWggarX83CWl86S0zsQLQgP48A/PcpL4w14/JVBkFJRwCNl7rA/kXVeYILA9vVQ5MjjABQTx+KETYNrfL/ytIMvl2tnfcEF73jCsFF63TrUH4OQXRMQPgg1HLbG1H+dLbDfBtCx4L0UfxE/1pQz0b6kwc5/tKvQF3KkKS1EyvwmInFa/Qfpj29n2Vok7KYxOMnqN+JjhFAMOV7lNZYeX0gDw8Gb8U7D7EPp/AcwxDo0DO5CVAR4rk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnWIaekvWfIQHaZcJpQ7RUb/6XvShLmgknIWz1YlPKE=;
 b=o/lpHBiuYoE/q1rItdk3gzUOQ1NCqMtb7KaMzylfZkVWL661y9TW9Zes81RZOA2SjEYAnoorCABRnV4MFaFmK0AiR3bH7OtN1aLhGBKx0OvabztQVzvBhUI7wQTD8Y13Y8vA34EkGARgX67UxX1JlT3SZ7yQ17S0NHQxwb24eIc6KbyRucmAMaYQ2Gh2LtMX8wyeGaPW7po04rTPz2zlBITh/4m4M8kZ8EAJXf+El1tuMAfMqVPY0OZ5cmdWbncHviSyOon4vJJf84T7sF9fXjsv6pPIwPiJpTXwPNBPl/pRGsq7mf+Kk1KRzZO/Xc1Os+FtDJ6XA3va3Tfc6hikxA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB6264.namprd20.prod.outlook.com (2603:10b6:8:ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 02:51:08 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7386.021; Fri, 15 Mar 2024
 02:51:08 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/4] dmaengine: add driver for Sophgo CV18XX/SG200X dmamux
Date: Fri, 15 Mar 2024 10:50:35 +0800
Message-ID: <IA1PR20MB4953D34BD281F4867CD885D8BB282@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB4953E7BB0B270157C8D1DDACBB282@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953E7BB0B270157C8D1DDACBB282@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [qB1A89wk1cXXIqOH9v26pP5/Sv3BKJazopYi3bwYNRI=]
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240315025036.554158-4-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1379ac-c81b-4e98-8a04-08dc449ac3bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tr33UT7UwOVNZt2d82b5D6uX/COpEk5W4ykbF4lVD/G3elvB4M+Z7uP2mquR2p7gmvgbaY57ukqjWWfzsZ0qO6mmlhfsTe9In3G6+25HCV4wdlZpvCNVfsQA/QwPaAYAfpT2vT3SATIgxa8CbQ5Kzn/2IiPsncs98idikJVKhCuBCBFc3xavkGbMwsdXNCMrpTiSsjrFhAsknjfXYIuvWBtDk7bo989mCvDo3kB/SVuGxeXn/sGtwBfux3XgYJLo/OCJjDD2WH/eq2TXgwpWktUtOnu+MT6tU6WjluAGXF1dbStPdJ4g/5ATmt/vKzslRQ2rwZ4WHtKpnnoOhSfsJzI9ZLaTt/vxqc6lPF4TecQhvIThEwuln9rafwMjV+KBsamhBu/ISHbEtVaaja2qUvoL9C7HlXe85ekzl1vDIQbwvZljwByQICGEEA3LfFuEyHSe4qG+pIe+ViPITfgWIEmhvPeAfEPNYVVtyN1Te+yRNXpQa4bvW6rZoJtK8e8QsF9WfKNU4NhLthHQ8hIgt3FuT11WBVWkDdk0HZxF04gp8ejasjYBxEpf6cgrfiXhMPR26+eqqXKMzb/j/XAaebkoOcatHSVSCm+f24zBgqqsWh+tKQVBdC+jVgmzhfY3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iJFaR+K8bXzoRptYjbdR7MY86DIrCl44zSZGh1mFBpkFDCBYQoPq8r66GTyy?=
 =?us-ascii?Q?hYrTepQJDTkWU9C6zvivTUj5Eg4oAgYJPzkfQn3Kgx40h+c5/egYKV/kJnm8?=
 =?us-ascii?Q?gB9yfYjLk1lYxlBXNYXys0x9Qty6uKoLG9TT3bZT9fj+PjpyymjZooYbFPIM?=
 =?us-ascii?Q?WozSU/nMBFh6W44qNWE2OF78LwgJTcRQYg4xNzqBsTmpcWD2MD5EgjN+oINg?=
 =?us-ascii?Q?tCo/DSZNnJXRJOdOODaUUAYHzQ0XmfL/wXsvYYvChPEv2CPjOq8GUFKYudIm?=
 =?us-ascii?Q?0tnx/w9VGfBMBw7MVo1YXCjvUVbQt22fw/ULgus0z5ZAHs40qpA9fi+wYxiM?=
 =?us-ascii?Q?IbW8sH/pykPZPkxxJGRD54TnAROxch7DYc1pFHtje9J0CnA7p3dCzyBpPm+y?=
 =?us-ascii?Q?iGQDwhDkLbGIIQElUtH8PfM7inlTBFndJDH8bEWIo8A0bqSfr2BIiOT6Od33?=
 =?us-ascii?Q?56oLsialBPtnGyT55aJGnQKvDz9rgGzcpJD9DoW/6br/IUA0lpBFWNRxhYSF?=
 =?us-ascii?Q?O73egxgKx3tMBqXX/rX+WCctwDWF/nCUeN7/N83/A3C3m0KErvDCRkwxUQ30?=
 =?us-ascii?Q?ivIlO9srEgEtJdbX/Lvt9onwY/e9n+CwkbSPmcbEN1VKAHbYK0j8O5XYs2Aa?=
 =?us-ascii?Q?m1BMDHenF8eFoLy6UsBIkKOMW2rVjOpc2yrwrYDGN2gKHugc47d0V33KVaqr?=
 =?us-ascii?Q?AYSjgQUwbev+OIor1a5LfA/iCkLqfnMb5h5WUtjWttVQ6jUhutYDxW5azJ5O?=
 =?us-ascii?Q?L37SZ6WZD6aySz2yBbKu4FhPbsrJJaGlh2eQ8ik+mr47q1w4GnViYgJVWAHY?=
 =?us-ascii?Q?kN48Ev86nZvu8ZPmpyenQVonZe9Wr2nTnf1nZMdQ3zDRj5vuie7pEEX9eTwC?=
 =?us-ascii?Q?Ql95vu1opWZSiApn+PToBfEH9NSYgJ/j3VWC8oRdGdtHLgfGuBE0ydVN5NG8?=
 =?us-ascii?Q?WIA1gQpcW3ZYPKr9kpBTC8+IKAKa+yhG5l6I1BiTw42dro1ZoXKpcn9m4gHx?=
 =?us-ascii?Q?pI/qtPEDCrJFkQbPji1JsLv8ool65fUhD+snH0SwZL4J05e37194uFmgKFD9?=
 =?us-ascii?Q?z81b0ZvQxxvwOnNKvJ423iGsxtjQ47oMioLTfI4xK2V3sQff/8khobLuowsB?=
 =?us-ascii?Q?swtBHhuxCjvBLdPfUVdcc3Q8mV73d1fRq6UwbOWAtSVPO0m7t0f1dy+Hd84V?=
 =?us-ascii?Q?oUi8d0sa+psZy8cx9iEltt2VEue0WD/uqL2PYfG8Gd8BslL8AOCduJ1Znv2n?=
 =?us-ascii?Q?8GkqDbE8aElyhFmeLQU8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1379ac-c81b-4e98-8a04-08dc449ac3bb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 02:51:08.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB6264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_195111_743994_7B4165CD 
X-CRM114-Status: GOOD (  19.39  )
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

Sophgo CV18XX/SG200X use DW AXI CORE with a multiplexer for remapping
its request lines. The multiplexer supports at most 8 request lines.

Add driver for Sophgo CV18XX/SG200X DMA multiplexer.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/dma/Kconfig         |   9 ++
 drivers/dma/Makefile        |   1 +
 drivers/dma/cv1800-dmamux.c | 232 ++++++++++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+)
 create mode 100644 drivers/dma/cv1800-dmamux.c

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index e928f2ca0f1e..5220b4eba3a4 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -546,6 +546,15 @@ config PLX_DMA
 	  These are exposed via extra functions on the switch's
 	  upstream port. Each function exposes one DMA channel.

+config SOPHGO_CV1800_DMAMUX
+	tristate "Sophgo CV1800/SG2000 series SoC DMA multiplexer support"
+	depends on MFD_SYSCON
+	depends on ARCH_SOPHGO
+	help
+	  Support for the DMA multiplexer on Sophgo CV1800/SG2000
+	  series SoCs.
+	  Say Y here if your board have this soc.
+
 config STE_DMA40
 	bool "ST-Ericsson DMA40 support"
 	depends on ARCH_U8500
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index dfd40d14e408..7465f249ee47 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_PPC_BESTCOMM) += bestcomm/
 obj-$(CONFIG_PXA_DMA) += pxa_dma.o
 obj-$(CONFIG_RENESAS_DMA) += sh/
 obj-$(CONFIG_SF_PDMA) += sf-pdma/
+obj-$(CONFIG_SOPHGO_CV1800_DMAMUX) += cv1800-dmamux.o
 obj-$(CONFIG_STE_DMA40) += ste_dma40.o ste_dma40_ll.o
 obj-$(CONFIG_STM32_DMA) += stm32-dma.o
 obj-$(CONFIG_STM32_DMAMUX) += stm32-dmamux.o
diff --git a/drivers/dma/cv1800-dmamux.c b/drivers/dma/cv1800-dmamux.c
new file mode 100644
index 000000000000..b41c39f2e338
--- /dev/null
+++ b/drivers/dma/cv1800-dmamux.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/module.h>
+#include <linux/of_dma.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/mfd/syscon.h>
+
+#include <soc/sophgo/cv1800-sysctl.h>
+#include <dt-bindings/dma/cv1800-dma.h>
+
+#define DMAMUX_NCELLS			3
+#define MAX_DMA_MAPPING_ID		DMA_SPI_NOR1
+#define MAX_DMA_CPU_ID			DMA_CPU_C906_1
+#define MAX_DMA_CH_ID			7
+
+#define DMAMUX_INTMUX_REGISTER_LEN	4
+#define DMAMUX_NR_CH_PER_REGISTER	4
+#define DMAMUX_BIT_PER_CH		8
+#define DMAMUX_CH_MASk			GENMASK(5, 0)
+#define DMAMUX_INT_BIT_PER_CPU		10
+#define DMAMUX_CH_UPDATE_BIT		BIT(31)
+
+#define DMAMUX_CH_SET(chid, val) \
+	(((val) << ((chid) * DMAMUX_BIT_PER_CH)) | DMAMUX_CH_UPDATE_BIT)
+#define DMAMUX_CH_MASK(chid) \
+	DMAMUX_CH_SET(chid, DMAMUX_CH_MASk)
+
+#define DMAMUX_INT_BIT(chid, cpuid) \
+	BIT((cpuid) * DMAMUX_INT_BIT_PER_CPU + (chid))
+#define DMAMUX_INTEN_BIT(cpuid) \
+	DMAMUX_INT_BIT(8, cpuid)
+#define DMAMUX_INT_CH_BIT(chid, cpuid) \
+	(DMAMUX_INT_BIT(chid, cpuid) | DMAMUX_INTEN_BIT(cpuid))
+#define DMAMUX_INT_MASK(chid) \
+	(DMAMUX_INT_BIT(chid, DMA_CPU_A53) | \
+	 DMAMUX_INT_BIT(chid, DMA_CPU_C906_0) | \
+	 DMAMUX_INT_BIT(chid, DMA_CPU_C906_1))
+#define DMAMUX_INT_CH_MASK(chid, cpuid) \
+	(DMAMUX_INT_MASK(chid) | DMAMUX_INTEN_BIT(cpuid))
+
+struct cv1800_dmamux_data {
+	struct dma_router	dmarouter;
+	struct regmap		*regmap;
+	spinlock_t		lock;
+	DECLARE_BITMAP(used_chans, MAX_DMA_CH_ID);
+	DECLARE_BITMAP(mapped_peripherals, MAX_DMA_MAPPING_ID);
+};
+
+struct cv1800_dmamux_map {
+	unsigned int channel;
+	unsigned int peripheral;
+	unsigned int cpu;
+};
+
+static void cv1800_dmamux_free(struct device *dev, void *route_data)
+{
+	struct cv1800_dmamux_data *dmamux = dev_get_drvdata(dev);
+	struct cv1800_dmamux_map *map = route_data;
+	u32 regoff = map->channel % DMAMUX_NR_CH_PER_REGISTER;
+	u32 regpos = map->channel / DMAMUX_NR_CH_PER_REGISTER;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dmamux->lock, flags);
+
+	regmap_update_bits(dmamux->regmap,
+			   regpos + CV1800_SDMA_DMA_CHANNEL_REMAP0,
+			   DMAMUX_CH_MASK(regoff),
+			   DMAMUX_CH_UPDATE_BIT);
+
+	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
+			   DMAMUX_INT_CH_MASK(map->channel, map->cpu),
+			   DMAMUX_INTEN_BIT(map->cpu));
+
+	clear_bit(map->channel, dmamux->used_chans);
+	clear_bit(map->peripheral, dmamux->mapped_peripherals);
+
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+
+	kfree(map);
+}
+
+static void *cv1800_dmamux_route_allocate(struct of_phandle_args *dma_spec,
+					  struct of_dma *ofdma)
+{
+	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
+	struct cv1800_dmamux_data *dmamux = platform_get_drvdata(pdev);
+	struct cv1800_dmamux_map *map;
+	unsigned long flags;
+	unsigned int chid, devid, cpuid;
+	u32 regoff, regpos;
+
+	if (dma_spec->args_count != DMAMUX_NCELLS) {
+		dev_err(&pdev->dev, "invalid number of dma mux args\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	chid = dma_spec->args[0];
+	devid = dma_spec->args[1];
+	cpuid = dma_spec->args[2];
+	dma_spec->args_count -= 2;
+
+	if (chid > MAX_DMA_CH_ID) {
+		dev_err(&pdev->dev, "invalid channel id: %u\n", chid);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (devid > MAX_DMA_MAPPING_ID) {
+		dev_err(&pdev->dev, "invalid device id: %u\n", devid);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (cpuid > MAX_DMA_CPU_ID) {
+		dev_err(&pdev->dev, "invalid cpu id: %u\n", cpuid);
+		return ERR_PTR(-EINVAL);
+	}
+
+	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
+	if (!dma_spec->np) {
+		dev_err(&pdev->dev, "can't get dma master\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	map = kzalloc(sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
+
+	map->channel = chid;
+	map->peripheral = devid;
+	map->cpu = cpuid;
+
+	regoff = chid % DMAMUX_NR_CH_PER_REGISTER;
+	regpos = chid / DMAMUX_NR_CH_PER_REGISTER;
+
+	spin_lock_irqsave(&dmamux->lock, flags);
+
+	if (test_and_set_bit(devid, dmamux->mapped_peripherals)) {
+		dev_err(&pdev->dev, "already used device mapping: %u\n", devid);
+		goto failed;
+	}
+
+	if (test_and_set_bit(chid, dmamux->used_chans)) {
+		clear_bit(devid, dmamux->mapped_peripherals);
+		dev_err(&pdev->dev, "already used channel id: %u\n", chid);
+		goto failed;
+	}
+
+	regmap_set_bits(dmamux->regmap,
+			regpos + CV1800_SDMA_DMA_CHANNEL_REMAP0,
+			DMAMUX_CH_SET(regoff, devid));
+
+	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
+			   DMAMUX_INT_CH_MASK(chid, cpuid),
+			   DMAMUX_INT_CH_BIT(chid, cpuid));
+
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+
+	dev_info(&pdev->dev, "register channel %u for req %u (cpu %u)\n",
+		 chid, devid, cpuid);
+
+	return map;
+
+failed:
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+	dev_err(&pdev->dev, "already used channel id: %u\n", chid);
+	return ERR_PTR(-EBUSY);
+}
+
+static int cv1800_dmamux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *mux_node = dev->of_node;
+	struct cv1800_dmamux_data *data;
+	struct device *parent = dev->parent;
+	struct device_node *dma_master;
+	struct regmap *map = NULL;
+
+	if (!parent)
+		return -ENODEV;
+
+	map = device_node_to_regmap(parent->of_node);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	dma_master = of_parse_phandle(mux_node, "dma-masters", 0);
+	if (!dma_master) {
+		dev_err(dev, "invalid dma-requests property\n");
+		return -ENODEV;
+	}
+	of_node_put(dma_master);
+
+	data = devm_kmalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	spin_lock_init(&data->lock);
+	data->regmap = map;
+	data->dmarouter.dev = dev;
+	data->dmarouter.route_free = cv1800_dmamux_free;
+
+	platform_set_drvdata(pdev, data);
+
+	return of_dma_router_register(mux_node,
+				      cv1800_dmamux_route_allocate,
+				      &data->dmarouter);
+}
+
+static const struct of_device_id cv1800_dmamux_ids[] = {
+	{ .compatible = "sophgo,cv1800-dmamux", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cv1800_dmamux_ids);
+
+static struct platform_driver cv1800_dmamux_driver = {
+	.driver = {
+		.name = "fsl-raideng",
+		.of_match_table = cv1800_dmamux_ids,
+	},
+	.probe = cv1800_dmamux_probe,
+};
+module_platform_driver(cv1800_dmamux_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
+MODULE_DESCRIPTION("Sophgo CV1800/SG2000 Series Soc DMAMUX driver");
+MODULE_LICENSE("GPL");
--
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
