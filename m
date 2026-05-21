Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0769CD5BAA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 01:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPI5UcmyQvchVm8LaTnxujesvn5v0F5aLpPEuKHrJ7c=; b=JZgOqa8QFKwmxF
	L3zOZT2oAdzTZNg1FcPgTOmfETb7seoZYBBrzVSHOhKn0KXQAGm03d0+XC6kPXzu0R56dt9i/q5H8
	Q2Lo07Xsrz+OrF+FL765GB99oWHlPgglJhwGPu8Sc+ZyKnQuRMReW+AeZ3JHQCJoUjvF26XMS4p7o
	qCOfu3e4nuHmqd6UwbgygKFJjUWMGC/oUOM3+Y42xzHmXKE27gEVi27iCOOU1GONGidvC/hZ2YScB
	uFCvpGPQALo6ULkP7g3qalC5Cpbu/VdSOrzkL+NfLGlra2rinXsl4fpTgVs/bVQHKO7IwNo0R+Ax8
	tnxgml+lt7WaJOU3s9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsEu-00000006N4p-2aEb;
	Thu, 21 May 2026 01:30:20 +0000
Received: from mail-bjschn02on2070f.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::70f] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPsEo-00000006Myh-0tKm
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 01:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm2ifkM+qKnX+L4jopZBxrkxozidJxlGC5AyPEfjSbw3NxCMvlnKx8UbtUXAgdYbuuFo8BUKqxizrV91jEEutNLk1SDetLzxjq6iC1dUWd3fk4PGg4abqGpGZEsRo/xW3cFPY0erSURSkyqjrWjBPdyGWCpbJPYuTljzOIJi189OpzdWrWrj5fQAbywXw7aqLPoiaGsT4JmszqKz/JCjEVpfJDY+8V3fFypYpL+XKGNJ+PNxio/6ygduKukZC/xPKmUSVoWn52radhOL8yQ6LkHN3g+QzyLUs6JRJxiFqcDBpNSBikWGS/hYrykbw3t3WlQHpRW7W0f0MAFyeGkJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJYTaCoW/laMHzvCF3afe/xvhvIBIcVenV4rII+cHd8=;
 b=alHKRMszStU2XBI7r+iR/K6nnexPX4ZtgLVzdr5vZcf5e2xDCeNENayo5TG6uqV5HlkQX/DFFGPj0tzc4vNd3aDT1rEavJqfhvjdEVAz6Tw4Sc0K5ZOBLjLrLwAAr/iLnPwKumlCGEVhVcUUs8YsBV6HnyYVARcrepuApfv1SEpXFcHe1b4KJypbYkbNUix2HmAcmvJgdPm+AOU3GVhwHrfuTIpwGZPqNBJJKZXHwx1tG5ByuSTVAc6JgMHBWOtLsOPNRkhqRvGAL2uLz0LQzSsXa3mOrwC3GdSuuyrIxjq+Y7jegtdFGEJbo1uXjr+21nf9xpqT+zd1wVsyi/rfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:51 +0000
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
Subject: [PATCH v3 3/8] clk: starfive: Add peripheral-0 domain PLL clock driver
Date: Wed, 20 May 2026 18:29:27 -0700
Message-Id: <20260521012932.24163-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd379be-000d-4704-c6a8-08deb6d87431
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: puAOadZpniR/HXtwGUgLBytOwfY01c5KACMtTgexfxI/to3683vI7D8ZR/pCCqoCgahAUMcvSF6lNxeY7CDhjAF+j8agtCeUi0KhK0NAlYjZM9XRnFvgEHrKSjy4qRPl30AWRjFu/aiBNZyN+2IlqtpfoInR+YeFWlq5vsT7N7Mo+raiy424cm2EbPlrutWynt9CXNUH4BntS/XXSxAXdYyL7dvULMa3amvZAozsddDziDqFUZy0+DreHCr1xP7chGTX7o0+v8DHxdL4fiBw01Bxoa9qo1C5y3yKUM9Qm3c8qGL8jAbvmRinUog/EzA8Sz1q6wZqMOImSDuLmvwLyX/hmIaaQ7A/C06g1CLS/IfzNi1cRStO1nfqfOEuNqvFcaDyJHxosbdPEIVDzCOh85AKYt0+lXWkyGfUV9S0y+DUyjDYlClsndOhHsyu8H8V6yEjRzA4jOdgMT2ijndFX1L+xyn8CTR5TKbcsLvXiXGnxgpANe0/t7Tai07czy2EryS+imhOInsQC2h6KZLnTd4FqE8/7aSVU1Y+KQnbGM9NXxrcJ2bVMSDdFAHdooSG+m/3pGov6knT7E8Iyu/c9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y1WEhEwP8WBNp69cVmis0Go8/YOZc0D4F70SfQPM927/vXjxPtigCLtSGI49?=
 =?us-ascii?Q?CIahScAupdL+QqEst6CIrG2+cdLb9Ah6SBC7DXHXHZYs3weIs4g049Ukt0zn?=
 =?us-ascii?Q?HOXKbvHRpyNmyuC3wzpLmt+oIHw/cp/3gro+XshNAb5Wk+aHWcv+7uoynJCG?=
 =?us-ascii?Q?mGuVbRf7I5/EDEyUd3jwgiCxjVPMkX8XZSbZqp4hLV69+xGmBx2FbZ2THHto?=
 =?us-ascii?Q?pIO7UbVOv2IVJazfRKIx9xwyLU/LNP9TJ+zqCftrus0sVP+MMvusUsdWDXG5?=
 =?us-ascii?Q?XpN5E7xhAzkGYvSyD7t7lNyyutLVA5zYy3zOFZNqY+LPf/RuqlGz/oQm6VxQ?=
 =?us-ascii?Q?ig7dsBzs6CWN5Boa28q6YMp43FIlk61/Gfqe3Dmzc8mm+1AGZajV2B/EQ2pQ?=
 =?us-ascii?Q?gPjPlXp4vJXmh7UowPQ4jx3YOCuN8BGF+9nW30JZ6FaKHVa2VO3VOcYbTVIy?=
 =?us-ascii?Q?MDEtrLQ6FO1j8CvFK6UcINDzHIEm4cVIhpyhEveQWUq+08PDw7UHk5kY4qAd?=
 =?us-ascii?Q?zgMTOBoOuIAG62JAcOMMGhZJZY0jjTw23452I7F7BZPjMKVotJAJ4SLNTcaY?=
 =?us-ascii?Q?RacqAahAjQjYtupMMrFd6IZYxpgWf/HMR2ZRrWcN7e/c8gG9C3V0njo4aBId?=
 =?us-ascii?Q?RpFNRXxq5mx69Xofh1ZYHY0lFJ6b0WV/l+yR0vRttE/eSrl47D2eX4Imlly7?=
 =?us-ascii?Q?sShNV3xlXFgc5RCuGgxeSW4SpLWtgcU28UxR5svcZCNtiDr/+02z8p7jtoj/?=
 =?us-ascii?Q?Pgxd0PbjHXmi5gAvdzjCC9MTpYCkwemZ3lUp5QLyS9QuD29CZVlJVe+RAR1f?=
 =?us-ascii?Q?kkWhjlYZGIoKcPPAPew9X3scmFzwU9VYOHZA5E466TSz0oEebwJKEHjK5MLX?=
 =?us-ascii?Q?/IH877lsETSeIEfRF8/tR7DirOUOu/OTsMdorKE5ABsVaVOlNC0JMqokTiBP?=
 =?us-ascii?Q?Ald04b+DcJRfYkAa38BfNP7gNWt/Z/uZEiqPgzLate7O8hxDm8bbnDt7LzyE?=
 =?us-ascii?Q?WxbDnmPBtJxrOHyGHplvHexTCflGTnT/4nyOt0CMSXb8VdrEf+0ULVxez5cT?=
 =?us-ascii?Q?3lQLM3qori1AIw9oUKQYslXW/EX6y0pItpwz9Jfd5Myg2kyDuS9q+1bBcrC7?=
 =?us-ascii?Q?9s7JzRsy5oZqgafH5tpUs1GgOOuPRpjhrD79dUsbp+z9/aIH7W/JlOSp+IA8?=
 =?us-ascii?Q?8yQIXc3cHXrItpOu7Rtt7s0X6yPPAd0IdFiQh3Ijoi0f2CuFN0pV037xrwSk?=
 =?us-ascii?Q?WLnZBgkvvTUQwFMkKhP79WRp4lE2XQ1mWAr8wapT63OL5PkgJGZx8Dgl4kHU?=
 =?us-ascii?Q?iXFldmtnAGzq6cOcCd97+Cx8tyGH7LMzOeehf4J7iCL/VJ0tgNsI+x2V/iSb?=
 =?us-ascii?Q?r6AGzswcMXAQVeNMcvT4H91FONbQcASOi09p8IxO40WGhVbYZelvSCWwU0O+?=
 =?us-ascii?Q?IRvoE1ezD8+m7Hdy2o9jtUHZnlJnyGRHZmeJSVto3iJktaZE0SbEXx6RAzBN?=
 =?us-ascii?Q?uqX4eq0utBjbcWn8v8JWTiLXWYSyhUZmCGBUEoeNF7qWcXMiY8HOKjR9J5Iw?=
 =?us-ascii?Q?XViNZ2qEdN58i9/KklChm2KfvvkJjTC38b7XSbR0Csbin2wSGJKP1n7ELo9T?=
 =?us-ascii?Q?YbR3jJNRhgIVVx/YZBi4N4yhGZ3NeIhVMKSDrr8QUMkoZJNK4DC3cm9hXNns?=
 =?us-ascii?Q?W80w6O+P1Ef5lqLbN60I7s0n68jtTwHIwALY07jQ/qu5zSplBCLb7lsZbqMI?=
 =?us-ascii?Q?t+jXaM6wXKreghNMfBsvV4Q497H/tRhuKy4tYhPhHgq9y7rOEVyZ?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd379be-000d-4704-c6a8-08deb6d87431
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:51.3042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO/6GwgnAcfass4N5c+dyjrHMYMb0zh0CjVEOlvO6SNemn7B+z/CDx18YRF/YNQHq3NnT3itolv+xOyT0YkpcgzEO7aWbEo8z6cwUo/Yr2pdMvKvD0zcESsHQvUrbQ2i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_183014_262011_E53739C2 
X-CRM114-Status: GOOD (  10.03  )
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
index 603b928bbb81..08fac2a55446 100644
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
+		.data = &jhb100_per0_pll,
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
