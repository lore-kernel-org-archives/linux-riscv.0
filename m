Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31EDC61DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BSuiPK/dXC0w4lVc0Mhi8ZcTbt1Hv7momvnBJJAmMc=; b=lVeDqG5u4aCodq
	HRctZf1Gx28IHAEmZZlUebNp7DdNMHcDEfnS62uqVVm5ifwfHV0Z+cqlZ4LM8l4E4fYaclRK9TioT
	vnl77n9B45rRAAbdvlnwvt/Lukrly/BMdVqSeNXWx87QKeuFiVezOnU8Z50Xi3xQLrNdNNQ2OX+9m
	7Lth+5kSeWTjNGFpfUZKJ8DiL4LUwpRp0LEONokqgjmUUuNWdtaukwo1SuL+hDiJaLwLhe64LCbV6
	xzqNSHjUqDMOJ/lm2kmQjBts+8Sj8Q2ZyZ2JW5vQfVtdWInVo88mLw8abngdi7LECh5PkrQ4azhkf
	C3CAmr70ic5UWaeKk/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10J4-00000009CJe-24nE;
	Mon, 31 Aug 2026 11:36:06 +0000
Received: from mail-bjschn02on2132.outbound.protection.partner.outlook.cn ([139.219.17.132] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Iy-00000009Bs8-0aZX
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 11:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAIMBr3UAPH2VkFx9xzpHqZqhFfS8JMGOXscDONUd+wSR6F2af+oxURJxlNdHDhC05R9PvNSqKJ2S+OhvEmdkXNqgl8YJN/GORTVt84hnSCfGbaWUJhIqe0SGiYotSq+1NabsTNCUFIDJN6Nok8OXNugPbYlZvdeHQ8KgvSd75AktzCdLiIpsUP295v9s1cl/UGDl6jrQQuKf3766DUWbwKhqiaN8o1fpyEUAynrJDvD5mbE7u7l0ff4iaBEOORPligwaw8uvLSbD4WvjB8+Dkmj+s7C8WfX5gk7ztwcBG0CJwzdSAegN96JRawU7vuozTZ31bBFJSuxj0fryjwJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oObIx7t/yjPm1GlxI5Ra2RzhU/Wur/orRofk7RMUyYw=;
 b=ZKrthkn8BwG6xFT2nnrywJ4ZhV/jG1JNv1Bam1md50E/PqiWLNeRoHHoxLUvcSHVczOfsWWPfxCD6pSLVTtOHqOk/mw0c5Cv60JLVlQn8OxmHn2SoYk26hv227SSosDd1hzV5b2MoodHAKdt+LEbwzP/dxjguCgzOahGlAA9T9WmYrzxOpWxxupaWcRtCY3ygfM82t3YwmLbmcbctY875ohqVBqEs6uWKEN56ineiXDfgWXU2+TfibDCm0Go7vHhv+A00ipYIFPxmollT19PWGaTRjE/CBps1RGS7VE+DVNXfZC5yYSEXjU5xwYzNING/mlb4GfkPXWwQdyS9xSknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:44 +0000
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
Subject: [PATCH v7 16/21] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
Date: Mon, 31 Aug 2026 04:35:09 -0700
Message-Id: <20260831113514.66382-17-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca553a7-6794-42a4-1754-08df0753fe36
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|5023799004|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: /NQJ7gd4Jz8X3ORsCvHv29f4mHGsmgBTvcW/6GOiB8ixDJ1xFpOWrWguQprdJw5YigYEm9YB5QR7KsZEJ/voE7Ng9K/54uOmnGl669lCfkl1w9VAOk5J67dUUv3mj748opESO7WpKMzJET8VkO5cRLLcaiFFRdGYgtH7B9YQGa9T5lNFJcoVZVVRF2+NkPHSmBE9TtfZ1NDulQQfkbi/ri1cFVZJgE/2LNnEjO+6Ne88KM9PoiYYkX7AT9ICkxf6j95/5HZiBCRkWPTxYymGOK1kfDJQnYYQHe+HGpZSlanaxQ4W94cr7Wj4Df48jRGTQ/mjO78t2tF4F+6umdNcHxJmy47du9fkSCGNUSdghkiVoGxsljXaZ9aVSmdVsJQq60pnCZbEshHuPe8k4lUpvHkYnCJPoRVw6VKHN5zestcf5duDUFyWBDyiz8KIFt5jsqjDjXsaS3EkEErRUYJjV9qCYsxvuByRKRDW5g+9JMKLsO356CgB7zODb1k4SXExbNNENfJ7w3+QgdloHnfMFet7HSyfm6PjzKUQCSR4BE0nODsVTP9PWGjrrGjkTAlLmw4BTSuxT5Rwt2+wUwCsfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(5023799004)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CaZYV/fIF5EJRpeoCWPsLZBzcIuTb7bDxYwEil8W6vjxl4T+7ldezN/Qfkqk?=
 =?us-ascii?Q?zJOO7PmoFjSshcoCeiwg1jUKAlFgVOC8ot6QhXedPcKvVVkL3/DAxGuSM6UT?=
 =?us-ascii?Q?iG2CrxBUyINA5vXf7cRMWqM7sMuoLIdEgb2c9K2BR9pyeZcxjQaeeWVK5VqT?=
 =?us-ascii?Q?azTE6QnebRsYie3/cJK6P8c5dSb8RzBbok+hDXfreDJDTr9NmAM7F9iDwtan?=
 =?us-ascii?Q?I7XJRbbQ2z+BvuAUWukDLMcQhFblakEDvz/999U7479sLPqCGOZgbRdUnGDr?=
 =?us-ascii?Q?q3+Q8wDKuE/kpFdbwmUUiD0UqmEj4AeG0xia0inv5bmQzWBwn9XfE//9OdRU?=
 =?us-ascii?Q?1jt0Fx82rez7BgKT6IBGCGzxqKPBiAygaxUjH8naaMcWdxQBc4WeNInFBb0u?=
 =?us-ascii?Q?mbIZpvRIpGMyNH9jCK3fTao2O3k6NrW7D0xwUNbIK0dgLumW11sfws92igxm?=
 =?us-ascii?Q?u+FGE5wsxBkcepX01QTCHF1LBptC14qKWoLP9+6aYL3AFmHsi5gvbEXDDD01?=
 =?us-ascii?Q?cZwUgS4wMeSfSzXAPoLRuE1n/1xXp1s9H+4SoBqYECvsrMqf4IiBtQRe/uaO?=
 =?us-ascii?Q?tzm8KxIitNcawzShNUitwahxWXbp3RB5NC8RnlZMahmLqeZb83aSbEvNhrgh?=
 =?us-ascii?Q?8LYgSWTpgRiy02r+MYCFo3Yx90WbtWQw/4qTXXSl0b1AfbjvWzrGuQAcqjzP?=
 =?us-ascii?Q?6FMiEZBp9LvegwVBiu9AJwinKU8zD2OlK7Y4vwKOmc+rSu3I2cbQ1GDE14WK?=
 =?us-ascii?Q?/1RCFeEJeTarjeTVmiaHa0PToqQ95csNQMT6of3O+M+JYEddsSUqTsd20zB5?=
 =?us-ascii?Q?Pn8KLvr+XLlga3/YBbsstUVtlTaCDAN9wXk/aJcP+RW8tPyMJFUgZ/DCxt0d?=
 =?us-ascii?Q?MLQrhBz+m/uyuvfWMiNArxT90F7Fl7xXgxVE6Q0lL4EIy01ouzaNNgxWryNg?=
 =?us-ascii?Q?Si77KMzLjHyyjj14yFDLYCuX+flQW2RyRCIOoz7Anl1wP9IQBjnomcQ4v5bU?=
 =?us-ascii?Q?dqKCSWj0D6u/Z/Ns5VOHfY6p1ELsY5MPxXJWuX4/9kKC7xISlQ57PQZF6nqh?=
 =?us-ascii?Q?NIoJZNV++yT+rFtR9irHGnMpRDeDtTa4g36KGsKQ7hZ5HqVESEvSq3Be0UAC?=
 =?us-ascii?Q?HDV16jmMa7VUDfk+ETz9oCLjYgUuRQGKP0VPLflhtrMJdiN5DPiQcDuPsGsB?=
 =?us-ascii?Q?6WHYXw9jucA/avv/fvI92HLFaaclT19vfHsoP/EZ60LZT6NclWSc8OT4PQNB?=
 =?us-ascii?Q?CtKf489pfs1y3vC1qmcwFM93qntXoOVNtreUuasdG2RiUx91uClM64nPNoov?=
 =?us-ascii?Q?ZT7fzmoOuSL0VSD4+9xX6gftIjrGdxooQwMUbG4huPo8mEs+vfXiUEjVbjp1?=
 =?us-ascii?Q?8G8Bz8pikSkr6xYmqUZuN6PBQ7z3YRlIyupKhnMgMYjOHqkB8YW6Linyhb+R?=
 =?us-ascii?Q?oEKmbRv3Oz9YUUKBxyBKnqEt7sxuOMwvOAQFZNYp5y/QSBBtkz5iDC9YziQd?=
 =?us-ascii?Q?gsNrtNwG15hw1GxLobadSo41GD/pCOmxhDpJOd8NdFKtEXPVnaK2j3sTlob3?=
 =?us-ascii?Q?phXY/myaMWeInjgdGY3zoMW/Hzf6XaP1b90cSCl1xiEWDMWgTUi526z8RGYW?=
 =?us-ascii?Q?mPUPUtAL+l6f5/WRXF5RCY7UYCBmPf546m8bHIZclN/Rc/YZMcsZqtBik+y7?=
 =?us-ascii?Q?bfvcgZZkRHvgbrwdC7ByKROANfBBt8YiABR9gNA5lfps57HJ7g7nyg4sY2Pp?=
 =?us-ascii?Q?IcAXmeFpOhNhix4bg1amXLvr22DMqVfJuDBkbMzB2yNw8OOP3gTt?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca553a7-6794-42a4-1754-08df0753fe36
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:43.9021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqxYexG8cEZXNu6avwDh9ntqRq/aPKTDbK8gPnsPl+YdTDAeNLUwJPP1jawo8SLWgpU5ND7E7bTg3E5nD+A/PE9+AHLOQdUHG1GUJG2hzqzhAvG6KhgUUO9XDZa772i7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043600_188431_EB6D8D8F 
X-CRM114-Status: GOOD (  18.65  )
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

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  11 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   | 123 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 9140263eb396..1567b0a54ee4 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -78,6 +78,17 @@ config PINCTRL_STARFIVE_JHB100_PER1
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2
+	tristate "StarFive JHB100 SoC Peripheral-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 6beef7e313ef..33213bd1919f 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
new file mode 100644
index 000000000000..a2cf4995552e
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 15, .pin_cnt = 1, .name = "gpio", .gpio_func_sel = -1 },
+	{ .pin_start = 16, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static const struct config_reg_layout_desc jhb100_per2_pinctrl_rl_desc[] = {
+	{
+		.pin_start					= 0,
+		.pin_cnt					= 19,
+		.fields[PAD_CFG_DRIVE_STRENGTH_2BIT]		= { .shift = 0, .width = 2 },
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 2, .width = 1 },
+		.fields[PAD_CFG_PULL_DOWN]			= { .shift = 3, .width = 1 },
+		.fields[PAD_CFG_PULL_UP]			= { .shift = 4, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 5, .width = 1 },
+		.fields[PAD_CFG_SCHMITT_TRIGGER_SELECT]		= { .shift = 6, .width = 1 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start					= 19,
+		.pin_cnt					= 12,
+		.fields[PAD_CFG_INPUT_ENABLE]			= { .shift = 0, .width = 1 },
+		.fields[PAD_CFG_SLEW_RATE]			= { .shift = 1, .width = 1 },
+		.fields[PAD_CFG_VSEL]				= { .shift = 2, .width = 2 },
+		.fields[PAD_CFG_DEBOUNCE_WIDTH]			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per2[] = {
+	{
+		/* gpionw */
+		.pin_grp = {
+			PADNUM_PER2_GPIO_D19,
+			PADNUM_PER2_GPIO_D20,
+			PADNUM_PER2_GPIO_D21,
+			PADNUM_PER2_GPIO_D22,
+			PADNUM_PER2_GPIO_D23,
+			PADNUM_PER2_GPIO_D24,
+			PADNUM_PER2_GPIO_D25,
+			PADNUM_PER2_GPIO_D26,
+			PADNUM_PER2_GPIO_D27,
+			PADNUM_PER2_GPIO_D28,
+			PADNUM_PER2_GPIO_D29,
+			PADNUM_PER2_GPIO_D30
+		},
+		.num_pins = 12,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+static const struct starfive_pinctrl_regs jhb100_per2_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per2,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per2) },
+	.func_sel		= { .reg = 0x8c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x80,
+	.output_en		= 0x84,
+	.gpio_status		= 0x88,
+	.irq_en			= 0x94,
+	.irq_status		= 0x98,
+	.irq_clr		= 0x9c,
+	.irq_trigger		= 0xa0,
+	.irq_level		= 0xa4,
+	.irq_both_edge		= 0xa8,
+	.irq_edge		= 0xac,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2[] = {
+	{ .func = "fan_tach",		.val = 1 },
+	{ .func = "gmac_rgmii",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2_pinctrl_info = {
+	.name			= "jhb100-per2",
+	.pl_desc		= jhb100_per2_pl_desc,
+	.crl_desc		= jhb100_per2_pinctrl_rl_desc,
+	.regs			= &jhb100_per2_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2),
+};
+
+static const struct of_device_id jhb100_per2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2-pinctrl",
+		.data = &jhb100_per2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2-pinctrl",
+		.of_match_table = jhb100_per2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
