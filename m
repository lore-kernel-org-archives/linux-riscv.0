Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9AFD730A2
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 05:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uw5TJYNlKFa/p+VapfI3y6RfyVzzgov0yFqBU8WH/wY=; b=l1CoNlvHJ8wTvA
	+bT6bgjlyx2Z29Hd1fD7X045iwoArw5fzZKek92COy7aw/SfNwpZFk9dxmYTsS5DJRNu9B23FAbxl
	dAMPMuS4DlGPGhRg/varvlH7ae5qkig6DLJa3WtTnWuvE3AlIP/41x4ywENMXWCiL47x6UkkFp1+1
	65UnxNBuxOIm3ZXwUFkm9hzJaiU5eQEvYXT+JOcxafAH5wSWuQGlro76mcIu3baWHg+kKQniaqCrI
	DRnVTAftDo+gmHH4irWejesk1f50FzvXlr2grhBy+baS3TAByh5sqIanqRBMlZCCqd4CHY+oFhd1z
	dTTK2NowsmDdDG5IrrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XQa-00000001Ll6-32Tf;
	Fri, 03 Apr 2026 05:50:44 +0000
Received: from mail-sh0chn02on20715.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::715] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XQX-00000001LhD-42hO
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 05:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVXX425WQVhjUZJo25Z5fu1EbzUpVKo2OKa9jOo8w02oPGEgb1iIYYAVrATR0Mmwvir60k+qRZKmA34d4lakEi54PveOJ0lA95XJbp7GGRSob5NM1VDqa5L/fAM/wQzPDScdg9v5oWvEs4JsFXjubtPCAWvvRUJLzdcKeP7vTSeJ5zmeaOaDiy1K50fyBp56xsNjhX33/NmLRG4BuYpu16g8VS+WudOHYXb768VZoR89zLj9jQDiSW7T4LjT+ixXPLfL5yvZRr4fum+70YjBL4Z/OdpwjxzKBUYPG7PNrTQfk5CTK9gOX5cuEhaQzHn5Tdd5evB/92wpZKiGwtzthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVKA09kT+K3r+ccJSR1JLnRbusJalf8fkhezCQUWCnE=;
 b=MKnvhqMUSwLFD1782uDy5uHisKjh3lVgoul80FlcGdDKQzG9IzycLh5b+mpMxIJsSeYJb5bSx8Tmh8cdHDKmnlqkzRE/vEmLP0wXXuXo0IiLfEePxlu4uTa9uM1d2+6+qV9dRUza7jN+H+znOHSk1/rJV3fHGFd7meBtLLfuGPb6gE9wR9nELKnkONjWJrkzAYBgfdZdJMFCH19u5wxnKQ4l7PqsbC1fCGajOxzEEpCZhjoZ2gw6pqv6VLd/2ncXka+UkPxdWmZJSPvXuZOCFXpZrD64YQjl6KJbnLE4ISfxEerTrR7B63CDCkXGriDR+xrr774gHIYcHPQaQ5ks8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:05 +0000
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
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 05/13] clk: starfive: Add peripheral-0 domain PLL clock driver
Date: Thu,  2 Apr 2026 22:49:37 -0700
Message-Id: <20260403054945.467700-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: BJXPR01CA0052.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::19) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cae45e6-4518-4b3c-c8b1-08de9144db2b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OrKJ68gsLd1UHA6YNfZ59Lp9HbM/byIS9u7YwnrZRwN5QG5hGW6tHyHr086kCpIwKPbN+rU2+UPZcfcRu1GXjqyVbnCZhLoLj0ojy3yZYhwnJL28f0IHNpQcGk1ES52nJg3xAy7WTuJ7RCUc/tukIwlFKdBkjcwNRHQvCeSsviAOcfrJsp8c/aPsBxq2ZBPTVrKXfo6VcwnktbIwa9Yr4LXmNmNvRG38eWndIaYS3w9tJi5xGyqhjQ1+SI/1h2vbUJfKzqJeKaxgNxfI/pdjyDPvB5rhH0IqddfJiCOBKRm5l9o6evUkE4tdg16DbiDChuqAMzxiqgHWauSclzIdDWc1igQALz8SZGPOvgx1fCub6FXyveTpyYeYFR4U9r31PMC+cA3yJeLw6qYY+NbJhDX/6wgXYW0XrkVviLnIqpLKSdWfk1pLEYaXnseQzDkWXVnFLCDaXMEBEHAvqLk62MY1tdC3Y3dUEReBVmCn4m0/SpU2kVARLsiHUWX5Kzs0hBpY+fORWPFPZmtl7qkfBwTphOjZyYl5tkWQ/wMg/p/OXwG5fkHy45cjZ0YTOB+i49ehm0N0G+ThVbVExFXLuBqhTDb9vnTcKW1swWSBaqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AvIEAYXLMmy12hPZbAsxOnR2GiX5IajnjpS1qIjsQgFjrI0Cy6PkLR7w/rLN?=
 =?us-ascii?Q?LGhIhZ09vfrrIMJ+y5lNf5cDxl3n/M+N/R6d6UrxFmI9OTlAiWZS0/iL8R0U?=
 =?us-ascii?Q?TJRFQ2atfhR3YL3tl4+/TBUgmIGiq22ay/q5st2WrZPish/Pu/ywasIr5+c8?=
 =?us-ascii?Q?LaXlp26hpKgNGBBTgiBgL88c+4UX98ONdb4yxYxSQ9bRVB5NZ8Q5+8my2UPL?=
 =?us-ascii?Q?v+pHz+e1TqV3DHHdcj/el4UfncOzOHQp9lW3S8+zlhUATcCciSajz5E8h6XH?=
 =?us-ascii?Q?M5kvFwbY4VvI/f3z5NnfWTXjm8mxKBzqvd1ev7b1+QH1gCba7tbN563/WCm+?=
 =?us-ascii?Q?JznJljOcOazbEgNWKWHThU7EUAaQRb2T4L8jmwcxPImukjyy069ENjNVER0x?=
 =?us-ascii?Q?trktZt6bpkCsozlgfmLkkCsr66n8VZbK8tuyO8IPkQ2+kvKEloFSYEzkxMC+?=
 =?us-ascii?Q?M1aQ5iDvHArbsCWuWJYnBEIuByZ95FYxTfWyLuFqDc6MDA+P83BhhGHlLUNF?=
 =?us-ascii?Q?alu5AVW0XE4f2pEFgi+ida4A1ENssmYhUVIMONIarfO2RAQqoCAou5cihpEQ?=
 =?us-ascii?Q?ztFIielezzNkFzwkhTVWrnAYg7wWY2KWw96B6V5bNO0lvjm+1BKLDPuaahRA?=
 =?us-ascii?Q?Z8fIo1BfJpfkGJx5kAdbmV0xiU4EFvaA4HnapETMCN//IXE3A5u1k19eJ+aO?=
 =?us-ascii?Q?bZvIl789eCC4A5xS33IbTWcVTqOcbwqu67yZHFGOaqd23KAPJetSxiZe31vC?=
 =?us-ascii?Q?vPXCk6X7Nk5fWslood/Y+kRNHm6JEBENzm33cXe7X2WMy1bfl0BJzkr+2cLZ?=
 =?us-ascii?Q?A817jPoKwQrwK9e5BYZBsBiTK8wvbaEITqgQOkr4nsBR23AkEjkjGddFAAag?=
 =?us-ascii?Q?Q8KXtzgft/QNE1Nwl9tr4G2Y4fVAyopne7TlCCy7RXd4gLRAGUITMtrWAAab?=
 =?us-ascii?Q?sa73k7gli+TOygRJHBtCAKCXdgzNyonV4jOSOg9qup7d+xrUt8Qiho07KYRd?=
 =?us-ascii?Q?+6lBHVb0HL5Jmtx/IE3s0MOdpJGDdYzdaJvJjFdzCrKvROdIXM/iX+Du+Acg?=
 =?us-ascii?Q?2P2/dHa4ANDYFm4W5lKjsz1xFfSx+38UHpd51jeI8YXHmxMd5ooVet+07zF+?=
 =?us-ascii?Q?YeSwSZ23K7gZTWSZc3Lw+77sEE0+jE5PMa5W5w+wkiSNAQb8JWIhe82ABYZ4?=
 =?us-ascii?Q?QNhPQdxcMsRwkEwkdk6ysXnOZraLCqPWldRpcFb0Zm5yz+cl8XSt2bR4QR71?=
 =?us-ascii?Q?UtK90Z4SoLaD9Ba0uV5AIOhTH72EqZ5lwTmaVjf3e6UF46T4dOVpp+TFy8PC?=
 =?us-ascii?Q?tTi9s1ak1CiiEL4Cmx6kMXh+LSfii3WWKG+PHNvjPuJnVQBDSaQizwZs3i3r?=
 =?us-ascii?Q?4kaQhXJ9OKsl2CsMemojYags2vTi6t2F6BWopPLN01EoqLa6s9lWYku4D7Do?=
 =?us-ascii?Q?S4rd1HVSAP7X9KrxFUv8Fw9MBXAibLhEVP4n5wHQcxHzMC3szm/1McFc7L79?=
 =?us-ascii?Q?CH0M37lALfLqQuaa452cdiz13/865beR6rAYj8uPcofkaxzMxbcB3F5KXll9?=
 =?us-ascii?Q?PLxsxjBUa3zoU662F47orfeB87fP6Gu8pFyxVwC+PbiFzkvYzyEC5ntZgWXR?=
 =?us-ascii?Q?XhGN/o1wVVe//A2442SnNofks6r5DuWL6RjAwI14+4kM+meqjXE/KcWHCkHq?=
 =?us-ascii?Q?mk9UFH8rO8JmaGxZx+fEnvte1J0eAj8dAimB9WZ917YZO5yNhVN2XgTTgGlx?=
 =?us-ascii?Q?iR37+KxfRb1tf0tuzwjtcKB91KNwM0MmGXDYowxo6KaqV1mHNb9f?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cae45e6-4518-4b3c-c8b1-08de9144db2b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:05.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQjQkm4hcG1+jF0T+e3mv3HMPyOLdNAofmyyzCDPmPnIH8LCj4ZPvK0PLoUqM6nxF/nqI5vO1ogtaYxc9OcwGj7V9jyxWRocS8ox3FZcI+8nALMsa4an0JxwGNv9VZi3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_225042_000125_A3F0C29F 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index 1751a734ee83..5fddb07d0d13 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -27,6 +27,9 @@
 #define JHB100_PLL4_OFFSET		0x18
 #define JHB100_PLL5_OFFSET		0x24
 
+/* Peripheral-0 domain PLL */
+#define JHB100_PLL6_OFFSET		0x00
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -479,10 +482,35 @@ static const struct jhb100_pll_match_data jhb100_sys0_pll = {
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
 		.compatible = "starfive,jhb100-sys0-pll",
 		.data = (void *)&jhb100_sys0_pll,
+	}, {
+		.compatible = "starfive,jhb100-per0-pll",
+		.data = (void *)&jhb100_per0_pll,
 	}, {
 		/* sentinel */
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
