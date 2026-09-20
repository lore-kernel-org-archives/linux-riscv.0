Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EA8C982EF
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3S9iW+eVN0r7UPsncx7eH3uo6ukhML+q2Qbs1I2suM=; b=sCNVXLZoJftYLS
	WHP8umoNCs+x8DmNyUkrrt9lRwRXJ2z1/rLieaYzVnn6Oeydz0AXC/RjFlgJcN8PvTcJQ7d6HMLEW
	QmNmmNgJAMW4MpTW+0wOAycC3ZoxbZqPBWvac65rJdt6+pAerOEyKkFT5Mg+zRiYjVY2ZSCEDV9JI
	/QjqYALC5eDZ95iTY6EMo8VdJhellJEfviDaBDUDIahCf4WrsUAHAEFgWGUa6NtYV4Vw46NmJIxkP
	xJVXWopL8l6M9UEEhQoRQ8axPPfQf+rTMC0dsNTubyqNWj3slYSMnoJwfLh/l/IrohSIAxNlW2C0+
	nJlO1eASb6B2+kvr4nDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8GEr-0000000HORY-1F42;
	Sun, 20 Sep 2026 12:01:45 +0000
Received: from mail-bjschn02on2072b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8GEl-0000000HOOA-2pE7
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 12:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaDsbdh06KT2sJBkdcu57HC6MombUENTNxQhmoCrX48I0L05Ee7PXxr/OL81RRi7bhECEKjmuiRE2k+/77ksH6UrfiNz9FW5vHyaYD7yrOkMqJYptST3ViuNGIBTOf9pJiHVncd59Z9Q6bhauLrwNVCRUBbkp45H7UFAwQdsl0BzYbmcesN5x0RmF3HVPdwisXgc6VLtb4tXbBT8Vr+wwD9Gf7YP990mYrwNcvYL/WVM8RQlWz7hy78YEiKPrNbCHk04mTRvWLUWheNVkGYB6gThfCvabQC0zI7AxOeQHQQuA+0+mRJaaPfkul96lA0d24FviALj2Ue0Jbr18/2qfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz8lYeT6ST+sGokZUZT2h8CdABtJak8I/Lr1wsc6SjQ=;
 b=iyANIit+vloywPPHcfpneVcHjsTaVmIVSUvRKE6Fn0+Nd5dyrp+Qby4/QBYWNHRyd/00nd/281L6czVeJu5xl4lIsMDDHMVn6vum49t6bRwDB+zeeO71WLxSCDEt69WOuqVCZQppjXb6c0M6y8P0FNp5GvcB5OL0vh7/Wp7kGofg15EaCioAzIvEgfdxbpcgxEb9HOPAsviPD9lHGuxgMGeTTJ/AaioWiuuLNKvdLXI57/qhfdwPV+1VEKH0OMkWXDlj54BieORZde+sTzGlu9I8/76+8Ch4jlOMU5MB92NLOYJ4L2KBE6I6vq8+Cjyl9zPEnLS1z1QiQKdxIXciRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 12:00:52 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0428.014; Sun, 20 Sep 2026 12:00:52 +0000
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
Subject: [PATCH v4 01/22] reset: starfive: Rename file name "jh71x0" to "common"
Date: Sun, 20 Sep 2026 05:00:23 -0700
Message-Id: <20260920120044.194901-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260920120044.194901-1-changhuang.liang@starfivetech.com>
References: <20260920120044.194901-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5dcfc4-4041-47c3-b18b-08df170ed1c3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|366016|1800799024|921020|38350700014|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: WkqISFWJKsb1gc56WJh0EdRXMr+OSz0K+5ptiNEShfyeUsVKFK6rnK4RJEMAVHmkK2dAbWtgrdvngmtf6qOpq5WOu9Juin+2PNKVJ6d9uRJkBt4iYEmtamqPClm38woUxNXCefhlm0RaOobSYd+w3w31UKWQYhDeCgd19YMSU1tm6QnFDx9L6mLeaPU7AeG4eyqpXBuk70dLT9M0/uyYizN/8Kz1eSTr+q9WepFqA3UlIA/xVVdCqpUEq07I7fALh0fTMpl3mU6sdEZ6kwIF09RQx2Axic/HsgR/zPzujYItYpsff78tX6UpiCedSPPRWpd+x5iKVvCjUH8xbfW+1Q4agy3aWEk7DzBIPSzZ3CM0K+4XeDmFQLg/hHqLatcHqOQLnKUkNI4lCIsQcFS4WNAQHvZkk+wv7AG85PA1Ezgqi7oGkkIyo4fJZ12rml0gt0E9SL0uSQRHnkXvwR8NqKJCE851yqry5pN/FAwxnTmabb2sP3TltkKQH/WXP+AzBCLjSEVtC7sEpLy1s/VzmeIUI7+EVuwoZWYWWOhsyWpeR21GJdV6cjmO716YqxzV1h3E3HQb1z6oA1QiIfr1Qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e5Ten46j/0Z9t72RiaU0tTqLjbgAtBdf37q8WrG2sDJxPEx/dWk2mM/U5ryf?=
 =?us-ascii?Q?HPoRnakiS4wnsX0bAG5edSvjn+ytCZ/zMOE9K4lKcA9oLtBvrqckFR9AtOZx?=
 =?us-ascii?Q?walt290s8Jo70AugMQDauujk9nxWEseDOW7/0ELIitZEzqBbUN5kyKajgEL5?=
 =?us-ascii?Q?DYpI+Twct3kW+iJpNo05UrY7dUVYhsXP9tww2Q1RVDZNK0CmEmb/kv4aH5E8?=
 =?us-ascii?Q?OjLKRLvBesT45umPKpETEVTCjMIFdwBA6xRiLfU1Q2daWGOClXzZ9iOd9uY5?=
 =?us-ascii?Q?+kfJUjtZlXfQeIRjhtWCZcVYZxUtYDqUog5ULJ3U8WeBVfyi9relgYxIARBi?=
 =?us-ascii?Q?NZEvztLLu2GOPm9ldoDBbvkiSv3S11r0Afiqdg4NUtHst6N0rpUjoMFMG97o?=
 =?us-ascii?Q?fkvGTzH79D+Q8eRN853Ja3MFEY2JPvWvg2X02np6PIjzGQcxT+7W083k61bi?=
 =?us-ascii?Q?rS5W9IxjGjV31zpc4FEdHFODTlNkST9WWMm7WMtnZ9hk/P0Jire0NsG7vUiW?=
 =?us-ascii?Q?kBHYbH9DBxbSdklSUt8K6W+fJ2nQUMyfIpoUWzZ7XZ42VOZuvMEohUpd+9ZF?=
 =?us-ascii?Q?aGo33P9gbmE7SKqlIjJVHigrUIrq6ohxR2IXf1uGHTzdZfDPDh4EI5ZK2aQa?=
 =?us-ascii?Q?vTMmcK16AnbtBW0VlTHidaaU3nQ1j6epsb4HR2N1WdjUXYLWxpNWnt7SBWbI?=
 =?us-ascii?Q?xEZvW8vpuAoDEOBDdseSxQsXlmqfRXDi0hlOlB5du8Q0Z5kewf++RRE1zbkF?=
 =?us-ascii?Q?oN0fbWDn8gdLtWGYDeIi8nPIndNJdsetuQX8pX5v2LAxwpfnbYboQmb7AmfH?=
 =?us-ascii?Q?RmcdkBKP//gnjorUaJMs2rstkgmo6TTJe2SaMlzgsXZL7iIrn1kuIsrajf/O?=
 =?us-ascii?Q?QNoQQ3BbcQQpr1CCnPb95+aX3JCQZXqzJPeFVJ7jsCl0J7r3DexuEfegJyoi?=
 =?us-ascii?Q?NaXMKKRi8c0ymZF2GJ3bynxaNs7bgDE6imnZpzjpTefAMn4cVF6LcwCYLqap?=
 =?us-ascii?Q?V8A3iLEGihlP8DXcqzvnHqneOS8asBxNSw2amv7qoWwr5wft0ArVQnKrQhzZ?=
 =?us-ascii?Q?jKQfoTLi6GPbL5ZJWgOh7QE4/wfCr53PLNVL8XJtFVhvPEAmIv4pFfqRu6Gy?=
 =?us-ascii?Q?2guZ+6X0ZhRzCbjj8JT7c+uv7vQ8SWSNzDsQ0gvVEfujbUJpiYugZQWuwocw?=
 =?us-ascii?Q?0fDdZ06M8CWgf8vO8ehs8gJUzOi+Fzo/koKZIe9MpPIjR34DJAhw+I0FuaGE?=
 =?us-ascii?Q?ExfXfgOWzbtRupIsVQea9EutzhifcX5qfG/2OvWPUdFd6PJB3qO8M8SDZEwA?=
 =?us-ascii?Q?GSLWR8MtdOY+X5BxMezh6SY/BWDrsAWmwiJx/wraqghLKfCo0ET87gyf8tks?=
 =?us-ascii?Q?7/FgVHoI5pjDSVKwIOKbwZDSc5BVJnnghhpqyevSbJuxHVVhM5jthiXnucmz?=
 =?us-ascii?Q?V/0wcGXSFIAkkBVdl2dZlSqvBz7inv6PbhdlhyIlI5MIgoYMWGTdxbTtGyUq?=
 =?us-ascii?Q?nUc5+/uIahkdeSDD/9ZZQReY+g0vqh18RNuZ2ebSnC+hdvMRPPn6S0dZyfao?=
 =?us-ascii?Q?hhok42qfO5O8tiQg8Tdt6oTAs1g/KMohSbJ/MMKOdxEm8hlgrqdJawYXF56l?=
 =?us-ascii?Q?vMR+pxRypNjcRDG9Sjvvxs4AdO9ByJMUqneWeAovsD2MTuQ686jac9NAukB4?=
 =?us-ascii?Q?nBfQlKnwETRKCMyG/IdoJi2Or/mA+2CjIdVKtw2ba9iohpIRMLi366V62277?=
 =?us-ascii?Q?gGRmOfbggnCcZZ19WL35W6KY3kKg+TBAiPKCPAmQ8CQJGAbt0+ld?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5dcfc4-4041-47c3-b18b-08df170ed1c3
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 12:00:52.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AVV6VQ2KUXY17iiXr/Ly6uXyi+9WX5G85SMqJgVy7Bwda7OqxpsUkZoAx2wScTnaOrijEh7DagykFXar4tRSBDcCIF2JwDSp1Ydmx62jUbHcMAUoWBuyIaX/rkoA4lS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_050139_725147_908EFB37 
X-CRM114-Status: GOOD (  11.57  )
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

From: Sia Jee Heng <jeeheng.sia@starfivetech.com>

StarFive JHB100 shares a similar clock and reset design with JH7110.
To facilitate the reuse of the file and its functionalities, files
containing the "jh71x0" naming convention are renamed to use the
"common" wording.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c              | 2 +-
 drivers/reset/starfive/Kconfig                              | 6 +++---
 drivers/reset/starfive/Makefile                             | 2 +-
 .../{reset-starfive-jh71x0.c => reset-starfive-common.c}    | 4 ++--
 .../{reset-starfive-jh71x0.h => reset-starfive-common.h}    | 6 +++---
 drivers/reset/starfive/reset-starfive-jh7100.c              | 2 +-
 drivers/reset/starfive/reset-starfive-jh7110.c              | 4 ++--
 .../{reset-starfive-jh71x0.h => reset-starfive-common.h}    | 4 ++--
 8 files changed, 15 insertions(+), 15 deletions(-)
 rename drivers/reset/starfive/{reset-starfive-jh71x0.c => reset-starfive-common.c} (97%)
 rename drivers/reset/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (75%)
 rename include/soc/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (81%)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 03c17cd2032f..edf4c45e6ff0 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -14,7 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include <soc/starfive/reset-starfive-jh71x0.h>
+#include <soc/starfive/reset-starfive-common.h>
 
 #include <dt-bindings/clock/starfive,jh7110-crg.h>
 
diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index d832339f61bc..29fbcf1a7d83 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config RESET_STARFIVE_JH71X0
+config RESET_STARFIVE_COMMON
 	bool
 
 config RESET_STARFIVE_JH7100
 	bool "StarFive JH7100 Reset Driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
-	select RESET_STARFIVE_JH71X0
+	select RESET_STARFIVE_COMMON
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7100 SoC.
@@ -15,7 +15,7 @@ config RESET_STARFIVE_JH7110
 	bool "StarFive JH7110 Reset Driver"
 	depends on CLK_STARFIVE_JH7110_SYS
 	select AUXILIARY_BUS
-	select RESET_STARFIVE_JH71X0
+	select RESET_STARFIVE_COMMON
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7110 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index 7a44b66fb9d5..582e4c160bd4 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
+obj-$(CONFIG_RESET_STARFIVE_COMMON)		+= reset-starfive-common.o
 
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-common.c
similarity index 97%
rename from drivers/reset/starfive/reset-starfive-jh71x0.c
rename to drivers/reset/starfive/reset-starfive-common.c
index 29ce3486752f..d615c4a68cc0 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Reset driver for the StarFive JH71X0 SoCs
+ * Reset driver for the StarFive SoCs
  *
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
@@ -12,7 +12,7 @@
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
 
-#include "reset-starfive-jh71x0.h"
+#include "reset-starfive-common.h"
 
 struct jh71x0_reset {
 	struct reset_controller_dev rcdev;
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-common.h
similarity index 75%
rename from drivers/reset/starfive/reset-starfive-jh71x0.h
rename to drivers/reset/starfive/reset-starfive-common.h
index db7d39a87f87..266acc4b2caf 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-common.h
@@ -3,12 +3,12 @@
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
 
-#ifndef __RESET_STARFIVE_JH71X0_H
-#define __RESET_STARFIVE_JH71X0_H
+#ifndef __RESET_STARFIVE_COMMON_H
+#define __RESET_STARFIVE_COMMON_H
 
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u32 *asserted, unsigned int nr_resets,
 				   struct module *owner);
 
-#endif /* __RESET_STARFIVE_JH71X0_H */
+#endif /* __RESET_STARFIVE_COMMON_H */
diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
index b178dc7d958e..2952719fa31a 100644
--- a/drivers/reset/starfive/reset-starfive-jh7100.c
+++ b/drivers/reset/starfive/reset-starfive-jh7100.c
@@ -7,7 +7,7 @@
 
 #include <linux/platform_device.h>
 
-#include "reset-starfive-jh71x0.h"
+#include "reset-starfive-common.h"
 
 #include <dt-bindings/reset/starfive-jh7100.h>
 
diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 29a43f0f2ad6..87dba01491ae 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -7,9 +7,9 @@
 
 #include <linux/auxiliary_bus.h>
 
-#include <soc/starfive/reset-starfive-jh71x0.h>
+#include <soc/starfive/reset-starfive-common.h>
 
-#include "reset-starfive-jh71x0.h"
+#include "reset-starfive-common.h"
 
 #include <dt-bindings/reset/starfive,jh7110-crg.h>
 
diff --git a/include/soc/starfive/reset-starfive-jh71x0.h b/include/soc/starfive/reset-starfive-common.h
similarity index 81%
rename from include/soc/starfive/reset-starfive-jh71x0.h
rename to include/soc/starfive/reset-starfive-common.h
index 47b486ececc5..56d8f413cf18 100644
--- a/include/soc/starfive/reset-starfive-jh71x0.h
+++ b/include/soc/starfive/reset-starfive-common.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __SOC_STARFIVE_RESET_JH71X0_H
-#define __SOC_STARFIVE_RESET_JH71X0_H
+#ifndef __SOC_STARFIVE_RESET_COMMON_H
+#define __SOC_STARFIVE_RESET_COMMON_H
 
 #include <linux/auxiliary_bus.h>
 #include <linux/compiler_types.h>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
