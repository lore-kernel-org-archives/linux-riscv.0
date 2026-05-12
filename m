Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F493CD4F26
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YDfRDM63eMJmbDwufAMTuIK72gR7W6o54sDpMnd6ko=; b=0BV4MlQrEVMHW6
	0XRaQxuUWfIYkAfrxu+V9yfSi25VKLEgYSdAgJ+PvzuN7poQpLCftu5u77hkvqrvXTBfjxtZ2U4Do
	oB9GoJSl5dKUCWrxT3ZcjhxEz0h3PbEqQXPz8c2bL2e6Adl7PV3EGsMmZqnMtCXwlRW6ll455bVO3
	dmERbdggyAgzn+3cYKL+yUnVB7sgNGP5c3ryV9zAmMFw/BivWGtu8XYM8ETlJg0nEJtr8pN7YQKDJ
	JDE7+dAewVRjdekIhDUU4AIYrMRSxykOMJOYQ1B5zMJqh7+RVtYNzTewntTinZEfx+6F0F7SSRtCH
	qT7DNyEuX9Bjx3KngSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiay-0000000G61W-3sfi;
	Tue, 12 May 2026 08:36:04 +0000
Received: from mail-bjschn02on20729.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::729] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiau-0000000G5wh-2vI3
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 08:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAdRv2Ii9tm/v0c9r3q/93NRv3D0wvE7k1kJpy++8UIxQ+nytGTdz0PfGHgLWPm2KnnrYrJpMGPoJ6WZCsm3JxvMsYequIxx9qFssovlZmB8ELrebc4y15p4BUijIJHF1qToVTmGmXTPz4CN74rSEmHdOkQnL33WAP0okTQaMKtDhwys14vpDtfkSBSthA/Hpl4uBTPSkvTYMEUKwLqdqBMqBTbe6oYHpaeu04uQxNt3Tw9riQdiEluRZCZYmBIoO33eliXDEuGW7IM7ygLvMbmxbKiLXhE3/aQGhKfeEoxD1KyF9gx/zcb4BoAvbB059VtSDoxbMITDfVKiAUddKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOUf6PuPZpxGZ1eo9C1z0DlZDfWdiKdivkAXc7M4TdY=;
 b=HaZ0gB8ebQjq5SGshV3X+vJNfUGUlplzCu/Ymt3EhYopks40WfBObrhWqvtRvF3/H4SnGlR8v0iqvB14B4bEjRd4alF+PaCYl6Vtrw5OETt4jLMRpvcoV8KeKSrm4/HoxDPsRL9KIJWZdIZeX03vdfvxFEuZfQH8IDtpBXPE7fgZ2yuP1SmUjUjXKVo/sjajulPklVrXuvIobYwb7EB66QCLAGavkSQu/jWb5ChK/ygd2cySZNwLz2Pz4wdd8oc72d31MGMQVIEltI4J3vZjWPLyW37RkLr3gP5noQvudH8h9HCO+AX4oKqACNK+iwk216mFQNFhqJv7nWKvo0LBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 05/12] clk: starfive: Add peripheral-0 domain PLL clock driver
Date: Tue, 12 May 2026 01:35:14 -0700
Message-Id: <20260512083521.3448-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be45b32-e45d-4028-a705-08deb00172a1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TRzDrTRs3xMosYnso4rJzQb4tBxWOjJ/G9E7Lb+0FKm/yBItOHEP5WJ9r5db0hQuP5cpbauL6B5c53dURoM7WzHjA26yMLoaJ2ZUkoBxMlSrSFApHO/LczxNJ9saQt8mvwGx8k9hk/jtT8mrjzTPneh6DBxuQdnm8+Vi0CuFmdVOmXNehOVcht5ARdg76a5J05/qbGiopPiRz9XVsR+FZ1B1GNL0zUAtu6S2ed9pVZqnqD+js0EBsUOCGcUc2wEBkMeAQ/YflMGbqOcb4DijB1EF2sJx71fkTmobMrt6Gjy7HqSqVlBsTXXjrTrZkS094UszHf/SV17564CdRWFSKRVlt8xyutrXHKFW+5Nh6EjBFiwaFgPtT4QZvRW1XOqJZgljSPo1kqmmsRQhOsxIn7wUAJjbbucEeNcvqznN0Lt+0KKbETjPmHqDN4zQmuAyBgnd3mXZDu3KCiiy1mFNzWWzL+o8i1nCfWXgPHQ8iTHih47spMvhB4T5cxnX71DOaaEUkc/xAcqBbCuE3/pcte2KeRfu8XP0JI1DIkU/AtOGpvP/MfAdEWbXsjolmtdJgvpRu9tXh7x3gr/VjyI3lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2WhWTzTplk7lz9UGogUlyhAWTpGy4xAXG1S3hT8btCBHDYuog7rKQWjIOYUf?=
 =?us-ascii?Q?WBK48NzT484F5aq6YwV9ei5Q8STn1huSQKc+AqFP1/ymVnyJudZA+geLqO07?=
 =?us-ascii?Q?CUjU/Vcnj1siXc/fEKJc7nxQjPegbUsCbG44CPswhvzy72vAnyUYByOMm4fE?=
 =?us-ascii?Q?3gKOcDVKNdVHZCK/PSceVGV6rsm1JsCx2rPUuC0Ja2AWA3siqQU+KBUSzkyF?=
 =?us-ascii?Q?JEUkRR0l2P9mzVvtDB+1jxNf6U+GckK5Thu7qxf3HDlz4x7748lth2QliTTq?=
 =?us-ascii?Q?aL64B1DUeam+CzfdPC5hsKLEKSR6i9mV/i8YkeUcqwMZonMXnq6EHaAKkvIZ?=
 =?us-ascii?Q?nmQpQhaEEhQ9FzLzDr6qiR10uaUlqES8ranjJ14GKvlvqHLRxbm5c4Zw7q+Y?=
 =?us-ascii?Q?4oVhhe+FZz/MOgCAff1lFL4bZVbCvI+rmeN2QOB0suqHGesKGW1hP1zIfalo?=
 =?us-ascii?Q?Ntl536+QzK37IDVupFeRPFFVzsARYNyJZfw+Zd5D3LYqnp2JqZeRMBepDwi4?=
 =?us-ascii?Q?NE2e9ZyIdSvuKgaoN0QmbpuJC1xGB04F0qyLRZB4h4HzLqsjCrVFl+NuYFpa?=
 =?us-ascii?Q?m76bw221wlEJW0q1Zvnrdy3kQLDW5mKKIZgWK0hS3gN/utORleQaiHx7XAvR?=
 =?us-ascii?Q?A/40uBdtvml7Xc/ntPDM0zhK+NAiut287RD7/aUaMoIVVwS01IVFXYOhKy+/?=
 =?us-ascii?Q?2tz363aE13tpRIxvj+J47VLBSpFtclDrD83Lb57Q17iFvTdpACDxaICMHmzy?=
 =?us-ascii?Q?4ohBT7O8ckc2NfUEg0W1qTjsy4v9MSG9W7gCFoFuxTV3PkFLhgkmq7ggBhL0?=
 =?us-ascii?Q?LJhHP0osX4IPDZHKqdA0tZ+dHI5faYC00Pbkg+sXpyyARfbjFhvBvzTCvvl4?=
 =?us-ascii?Q?W7qNtk/K6SW+V3vCayLrwQ1OyzLhYP58NOck7QT0QSpySfBojqvn6jy8tgDD?=
 =?us-ascii?Q?fUvxLscao7HrEghLM7bxqECdjB7pUaRjLcmpArFO5qegYJg/HZ/0Z/E9dMyi?=
 =?us-ascii?Q?fvHtTbi2+yUy9nl3kD7ek7cjEiNUuVY9foJYUys2MMVAerShMJDBQSaTVimV?=
 =?us-ascii?Q?x/x0uFOidKlbPr7dwZF20XIddht1n6k3yypPvrx+W3PviWbrLXmJHE6wp+y1?=
 =?us-ascii?Q?ixTPvootSLiJiYQPfWyzOXfGCOqlE65rS9sZKug2WcUr0RbJ8ZxAqdsw+iVs?=
 =?us-ascii?Q?faN1isNLSa3Z/pQRXzhUXxTzafbE1T4pT+uGw4wOK/8RmjwQ6CzQ8gZZ0Iqm?=
 =?us-ascii?Q?Vo4Y1Fv6AJ+KN0tAvsSDxEaZHlg1/M8M03uNAwPaIzV7h4WDjBCIEPXei4s4?=
 =?us-ascii?Q?q5hz4ujzvvopJsK+T3+PnUh7IqfSR1LNw07HolMs6J5UfoQIFEZ8PgrMLmDb?=
 =?us-ascii?Q?8zXzteBHFCUpE4cp+FSAgCrYR2jZ6csAoWUv7+0I4S1x40UfSh0WyuvDkGkv?=
 =?us-ascii?Q?BQWlNAvUj0fD6ORsQ3plwpxlraEICYwKazPYe1Ab0IrmLpWlmE4FztoS5I4o?=
 =?us-ascii?Q?TIyuhAreQYCdv3qFTdk97M3SYD9w/omITzeD3ONf5DsWUa+3wrf107bj9jM4?=
 =?us-ascii?Q?HUTFRXsiwb/53PWyg2EWli0tEXjrd7mqTUriUrLnbZZXqvb/j3650mh6gk4R?=
 =?us-ascii?Q?7qRLqgxO1QzcL2HNWbKqB7QlYaHY2lp7ZAEFupvMAs+fZl/j7/XuIGhjL1z6?=
 =?us-ascii?Q?asf7aP0i6kfFQSvVcD4RJoBEoZ8IPZtpD9t6Zaj00pfo4ILPazbjCYoJcv1o?=
 =?us-ascii?Q?7klFQccZIFKTLKJYl802e5jAAUafeVSG5CSD3zK3DZtQynfAoHKF?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be45b32-e45d-4028-a705-08deb00172a1
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:39.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFhz//j+7f6Yy5HRmv3VkrvYz6SGYOrMvJS9/F0daqpHJMxxfBlp6bDA47wm8RnV9Wq9KD09Lk9StKjhiDOMVtzPhFVnJyJhUR4+1np+YAZJS33Qc/tKaJU7upIqAuVs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_013600_739274_367CD559 
X-CRM114-Status: GOOD (  10.26  )
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

Add peripheral-0 domain PLL clock driver support for StarFive JHB100
SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index 603b928bbb81..44a33afc04dd 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -28,6 +28,9 @@
 #define JHB100_PLL4_OFFSET		0x18
 #define JHB100_PLL5_OFFSET		0x24
 
+/* Peripheral-0 domain PLL */
+#define JHB100_PLL6_OFFSET		0x00
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -510,11 +513,37 @@ static const struct jhb100_pll_match_data jhb100_sys0_pll = {
 	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
 };
 
+static const struct jhb100_pll_preset jhb100_pll6_presets[] = {
+	{
+		.freq = 2400000000,
+		.fbdiv = 192,
+		.frac = 0,
+		.refdiv = 1,
+		.postdiv = 0,
+		.foutpostdiv_en = 1,
+		.foutvcop_en = 0,
+	},
+};
+
+static const struct jhb100_pll_info jhb100_per0_pll_info[] = {
+	JHB100_PLL(JHB100_PER0PLL_PLL6_OUT, "pll6_out", jhb100_pll6_presets,
+		   ARRAY_SIZE(jhb100_pll6_presets), JHB100_PLL6_OFFSET, false),
+};
+
+static const struct jhb100_pll_match_data jhb100_per0_pll = {
+	.pll_info = jhb100_per0_pll_info,
+	.num_pll = ARRAY_SIZE(jhb100_per0_pll_info),
+};
+
 static const struct of_device_id jhb100_pll_match[] = {
 	{
 		.compatible = "starfive,jhb100-sys0-syscon",
 		.data = &jhb100_sys0_pll,
 	},
+	{
+		.compatible = "starfive,jhb100-per0-syscon",
+		.data = (void *)&jhb100_per0_pll,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jhb100_pll_match);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
