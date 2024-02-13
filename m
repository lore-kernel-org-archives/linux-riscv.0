Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E92C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/sRast+48c3XSfo1bf0yQBzaFhd4LcPV8l9g/kBHPI=; b=1xANWD3QWnYnwi
	SgtDsP9ChjzT1/nQwUoI0SIbLRNF0XIuSW9NlO6xO3eyJIaJrVMIAElflk9xUOeuJeWbiOrVTXBqZ
	YtzrPheFjquNimokSkCWIXysO5LTwhpy2mfEbzl2tAW9baf1Qw8P6dbSOd+hDdlp4qbM6taeiPqbY
	nNC0IMBF7bSTneyJle0Zq4QTlF6aE9MmIqRPw1ZuLEM9+mLtgFV4vg1FZMzVY/wVMwV93DNLs3Cl1
	eLKO8IxgxAFcG8sV14umXHyr2A1td9+5RveyKbJ16RUc6+cl/g+Pqneeid0XA9hG7cEieKiMkvRH3
	ZHt+SjSWPpJ8qPxazD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZo4Z-00000008Oor-0rYo;
	Tue, 13 Feb 2024 08:23:23 +0000
Received: from mail-mw2nam10olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c12::800] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZo4N-00000008OYq-4AdP
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 08:23:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx3FuZQbET6/tJXXkj70FVDY75Wh2nTpgObIcyQjltRjcP12Ccx8katHxFuEWzAnWpyTGMEHTBe5R4QOn4RNws1MBNgKrwOCkqAtAJFNgzSHeLb/NTIRF9PyV3ei2PDzpgMyl7leY1SNHOmF46HJzWdpoO6MXU1b2zxZ6Osx0gdkJ1IuAmIM5OBGhAflSmlrr3KwC9MKMyRYiD7+hm3sdua8RJtvkC+N2uTJ1aeT4ZoQ3sMIKKwWI2F0p2epg7yvLi3DG+29duI0wbAZInTdfCRa2e2VWkz7zX1Pd1uTC4e4IapTq8CHgqGxguGdVKq+UUY2e4VRjrOH5rc8jqtTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyRv5L4lTGWr/YFoJERjkWSSdZceulflgQk5aOu3mY0=;
 b=iOqQM2YDlLpU9FgEgWSa0T2kS6SSZlAmgaMJzhFJPXfXAEVxcp9BiZ4Yq7L6CuexaZ5/Jbz9DCFDEV59II5JaVGMgrzKt8OBwVW36pT5xYTuKSs/1LS9qMniIoyGL6JmNQBbUjCayST3B9/VrNJKGD8Awo9ZUQoV+QTFoqZJ6QKIbjvcl9fifKqc2KJ3LEkJuyRxHP7J7TvBS/ciYxRB1QHfkp/bNsV8x/z4vJllu6Q+STDyYg4ofRegzKXPVqsfiXSKkd4DFgFINiABkm4LeibVHbF0OQJSpcZYeXvS7aeFY4zCh/VPSLPSBadiMZS/MYt6lFv/fj7fUrWZCvlD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyRv5L4lTGWr/YFoJERjkWSSdZceulflgQk5aOu3mY0=;
 b=r67YywfztOsU9sn6bYyZ5LDMgmJidV0FsP1P6nKCgiPKgwqSazSiJXYuczNr0v9GmfLtZlSZJm/0bzeRGIy9XAMeGsE5a9gIGNtigyYqJVsfGjFvSope6T9pIowUoxn2/KinqXOLyll8mm78d4/SBE2C/pRx5M+nmRB2CwHiBjOKZ4TIQ1s+g54YHml0VsRTaIyUmTUYUM28iMYYz7VoGBQVouY5+22AF1Xop7goEmWeKTmVEbuxZ45N+Ddkod4GKE7iOY23wEM2ANPM0eJmbPNe4ztcVbf2S5XU5zqe/eWxjGpNYOKjfvjglX5fefyOukbvyufKTFQ88WHF27Hk+A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB3776.namprd20.prod.outlook.com (2603:10b6:5:3ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 08:23:08 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 08:23:08 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 6/8] clk: sophgo: Add clock support for SG2000 SoC
Date: Tue, 13 Feb 2024 16:22:38 +0800
Message-ID: <IA1PR20MB49536304EB35A0019AC98F0BBB4F2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <IA1PR20MB4953366482FEBFC5E7F6F34BBB4F2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953366482FEBFC5E7F6F34BBB4F2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [WNin8Tbm5oV1Cli6g2LgvUKEsUshwwTYLw6H4hP3Sjki8nB+lDZy3Qh8LmqQG0wF]
X-ClientProxiedBy: TY2PR0101CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::21) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240213082243.591875-6-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB3776:EE_
X-MS-Office365-Filtering-Correlation-Id: 20bcf9aa-37d1-40b7-11e8-08dc2c6d027a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ybvFoa/SUzyEciHi6Oh3rM3o8ZRjKWpImbura7TMehBq4GSb4nHzGNJ3+Br2uI0XpjMOGarLK/ak+Fek0Wi9jb9ptpSsfA0otXMDPutL+MhckD8CbXX44O2Xs3/fMgyi50WbnnVuWa4RuxMbIfpg4ki4kWuC2CPoyjGt1ttaY0P5XoEmK2nH4WfSJVZF1dRNcIbdun/aAV2vd2o5obkYR4UpVVyQjRucSiFsT4mGJX2fvrm+TjvTOfBRL0BZDkhUGr4HCN0CC0HcTNGfYhginlqM35DjnG6iFv7/XrjJoRjvxCHgv14AMBftmvoFRtguYIr/1K1gt1h+0bPx5ccTq8jo5ll+WcSuxWrqfNBk22+7V3U0W3ePjrQ4UPIe/4lnEwnL4qSv898kI0ezYdQnAHxNc7GzEfQHr4RuQjMAA+C159cqn34JBFSx/uSmvic2egMXU+ct+yB0oNYaY9Kj7dAg3jF/Gif1Mn5vwmEighWaNtxbcc2kAmG+/8sE21klaIhMzB5hC02TqDiwA5ZYHSTR+6I0q+nu50WwVVX2BsozyKIJaU7MUpPQfa3tn24DjZQ3qC6Q2kDBX0LBjcziz/IgQTUVXBQvqMSLtVYObLPo/ihRxLH4QRP3ED2MWZ+6
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ywGNOs8Bd/p4BQc/L5K9N9++fQwmIyV7iTcwct97WoT+nX2KTjXaxy6gTy8B?=
 =?us-ascii?Q?++Qo9QL8jcCGm7yhia9LRt8nJ1OMUyW7FCm6je4g4EDWsWf9X7LLyzlmmWHH?=
 =?us-ascii?Q?+MzBohK0FjHjSjrKZz0RbGFfKiP7/bGK533AuJRaogtDoT4ikWSu56WPzM7x?=
 =?us-ascii?Q?cpNL4kPThJjjHHWmIJqiOPvN/NimVDa4wUNYXR3UQ2TbI1NqCoq5Oxsu/UZ2?=
 =?us-ascii?Q?qp01eiTuUluwV400CmywyTJjz0sHsUxGI3l0EQ5stEXzO33Q9uecZ5NqPVvp?=
 =?us-ascii?Q?KKRTIL7tWONk64q0y7+d0n4Aend9SUin8tN3XbFpRmis8aUE4xKuPGpKPa1c?=
 =?us-ascii?Q?eFTnAva4MnSTXfUHWFNxaBpjDyHtW4xlCJh9slpgbT/VlvesY1L+RWIBdd2x?=
 =?us-ascii?Q?Hctt6FbT/jUQUbjV5BlrJ/cZIPD8gHZ6fCMmA4rbpNp6O9GiHcI+ZuUZS+k3?=
 =?us-ascii?Q?fFFaJg1ZkqwN1Pl+KhcHPZVjgsYQ1bK4Dsd0Xgjc8X73fvgoNlhqcmsl7Po5?=
 =?us-ascii?Q?woQvt0dcQQbJY4aEO/BhTncLyqTaCfDQ+O0esvrhlfx8kBQIm/njCGIvlxYy?=
 =?us-ascii?Q?W6jSjwrPsUSleRBH5YHuflafTdgwKOUh4xRSlXyIaslFUNblOCmsllZJ/+cI?=
 =?us-ascii?Q?rWCSX01AEARz0xeWh301jxxIvkXabiYY5OzO1yG9A4wC/WCPuh1n/RHLuY2I?=
 =?us-ascii?Q?8TRSigEXOLZ7fOm9Gm4figrzAW8+95tLUxbM69jcRArKSAkkURFaa8uhexKN?=
 =?us-ascii?Q?qbSkCAi0smd5dVE1lfC876ND3Sp4bitcQQtP9h2LkC1eE1Qh20+5qILthq+8?=
 =?us-ascii?Q?JgOzgAM2iNOcRwGa39AF7tXvsu0z5s+Q9FD087ZlrMd7jTqs1QiMmv4ZDcA7?=
 =?us-ascii?Q?v2+zABX1dGEwqNEez5wwsHqrPEhhFIsBS2R/bpjyswz4Ao3iziy7NDsRzEcF?=
 =?us-ascii?Q?mZXGci65DOy7H2duLfj1xCI1rgBxOInA3v2nYI0nSXWIMxfir1HyePIxetQ8?=
 =?us-ascii?Q?XAWwHVUFoJxso79pugG9HN5FPweJ7L511JMPZljWAKr12hjtDaDcPBi5Hy7j?=
 =?us-ascii?Q?aKQ4ylpI5CWwog8VDqQLtEHZt6EnbK8mnc8hsqPvA2ipV7ZqWKxMkrmiAWIp?=
 =?us-ascii?Q?HS4NII/M8O+C0AGOk11zZsHwWD16AILHzc3wuQ/zvQuw76LElBqVTPrbORSi?=
 =?us-ascii?Q?rozVtYL1Xn9yofRbAHpvov/gb+Zk+trcvqodTNvn+8pJuEAqjCqWoQRZXiZN?=
 =?us-ascii?Q?Lmeq2OxpXlIfRBg9uqCATm414S5Jc7FdAOJSuV0kRMmjZ83kBNoZ3GOG3gSl?=
 =?us-ascii?Q?PyE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bcf9aa-37d1-40b7-11e8-08dc2c6d027a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:23:08.5723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB3776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_002312_184848_6CB92BF8 
X-CRM114-Status: GOOD (  11.05  )
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

Add and init code for SG2000 SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-datasheet-v1.0-alpha
---
 drivers/clk/sophgo/clk-cv1800.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
index 6ee8ef56570c..1aedf2df242c 100644
--- a/drivers/clk/sophgo/clk-cv1800.c
+++ b/drivers/clk/sophgo/clk-cv1800.c
@@ -1437,6 +1437,20 @@ static const struct cv1800_clk_desc cv1810_desc = {
 	.pre_init	= cv1810_pre_init,
 };

+static int sg2000_pre_init(struct device *dev, void __iomem *base,
+			   struct cv1800_clk_ctrl *ctrl,
+			   const struct cv1800_clk_desc *desc)
+{
+	cv18xx_clk_disable_auto_pd(base);
+
+	return 0;
+}
+
+static const struct cv1800_clk_desc sg2000_desc = {
+	.clks_data	= &cv1810_hw_clks,
+	.pre_init	= sg2000_pre_init,
+};
+
 static int cv1800_clk_init_ctrl(struct device *dev, void __iomem *reg,
 				struct cv1800_clk_ctrl *ctrl,
 				const struct cv1800_clk_desc *desc)
@@ -1510,6 +1524,7 @@ static int cv1800_clk_probe(struct platform_device *pdev)
 static const struct of_device_id cv1800_clk_ids[] = {
 	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
+	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
--
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
