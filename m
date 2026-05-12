Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5F7CD4855
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIf0GZQ/UDRxRxNP/mIkfkFhMVUzSCVJVExuo85no/k=; b=wtc7s/csyAb9tu
	uK/3d2+1vl64hgSlobBCXy83g8TbbNblIubGCpjUgyFAjaj2O010iwHcIAVmhMIHk+mkfrrbJQ+hI
	7th3CKHaBf49zTHHhjvKW4l8Sib/fBJFfoXM0GRyD3iYMALP/rYRvWY50EmdUf723MDxMWEiTeNoN
	IGSSqadpJ+MuxkiCfYNLb+Bny8AUPel1fWGsCrCh5TtfAh1g5bfP97t4EIlZj9VE7jW0JvwHMdkcq
	o0hOCzWp+fH3tmWNzMqVlhFxq9y4HtEkWf9OIIIMc+w2ZBweDYYMrq+BSQnjTdWI+o4Emm8Zw7Q7z
	jzyoNzebwI5L99MigCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiau-0000000G5z4-2vLB;
	Tue, 12 May 2026 08:36:00 +0000
Received: from mail-bjschn02on20729.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::729] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMias-0000000G5wh-37b7
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 08:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBgUpoSA7cEs2uz+nuNk8zDpcwY9hVISy5k6ZcO82+QAZAYkYomaAtB0t4mdrzG8adR615O7pF00nZ9SKAXcdlSk2KhMClj7WgqGGJhsHPzFfwHFtNgOvEBJDxfmiGuZ7MmPudTCkZrlXnX3i4eb3pX8dk8/HpDarKI0cto0IBWHHyavuBcStDWzvsT1NcciH/3oZ7PuHQsjmNw4qc3fYViSgXK/PLb2wHbSvjt/VVNCgPaM6Y/8UHhe3nTQJSvl8hGvBbDGDz7vHoGNXyjqce3Nt0E8klrvIpXOJmfzGj4BMzHaHd08dqZoeaZ2KTjVMWVX1I7b5JLK5aySN7zU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUNSkcfSS4+pkXj7344xil240PWZmkMKPZ0UBixyBz4=;
 b=ESm+LVqWfvVzsSqTw8Lu6Tbt5tWmZ8OTKYS2nn1rWDGGgL/ldmQ/64ozhKPmO8eveNQSqhNhqEAUnWrnZ0LBBg5ljtwyfo/dz2+7dOJN5JWwWpMwQ7SpiId0HXT2Uvl5/3+kPymdoeCq6TvfyDpW4Jqp4iiZRxL85bksZw8QQQ6DTMQCqlZmdpMDRyghklYpHyxe/RDGPsNPp/cxscxspWwfUKkLp1xsWQsELuakLRo2VdFaVfh870QqBZqWvqntIY4bigtMk4nwfu2c3ApQuOPV2YcpgXjihwpXbNaA2qQewyKoQZqMUKg5QhOFp6p7nRv7iiA2H3UMSBZfuSs8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:38 +0000
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
Subject: [PATCH v2 04/12] dt-bindings: clock: Add peripheral-0 domain PLL clock
Date: Tue, 12 May 2026 01:35:13 -0700
Message-Id: <20260512083521.3448-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da45a5c-5051-4357-617b-08deb00171af
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5jK/4QKAzL0OzG3QPWyupXr4OKCZZeE+CmmcHB4JBHn8JUeCQicXT/1FFcMyB4N6s1hbYxUN7mtINVotc3QaXk8fM0R4sTTxNsPvSosWaQdpn2B5Y6oz5T3VN/XbmhAGYiBLxdYZ/k0Y2RAFpaNWdGKsjiGWrW67fMkIyq0lrhQMCh/ejTfx7mVdO4co4JcGnS/0bscqIqKarPWKLX039GsZHySWSrS5bjsnQlRJ8WFVZXBIjpBimFAV0DILnBl8JsxwTwtZ21b/kA472PNDCrYeZbm184qmkqAV2ahpcQZOSDWhEqoSIq4uqdEK1kocPwi/Ni5DQT+/IzILG4LhJ6r9BLfLat85WkTueOfLOXmcZq9PVBHms21JH7TrxQB9RV5pID3LYjTBN80ws2EZQfzDeFFJAdHTEV5o56QyxdPDBh4ZXvP3hgN+n4M4yrskbhIi9j2mF64zJ42OJPs8/nlA4WXpAu0SjQi65pfY6Au000dfMZPriM33MGk7si/ozcVY8xl+cAFWsq2ZMjqHVYSZOCtLnHvW1jA35FGOHEyAze/GyK+1VEZxP4j1Eb1d/1YgZBCufKYzMpTxLdQP3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YVc2AIo2hEsrZhwiTq8J/O8eSnQLw9WNH9atfu+S9wR9blTScF2jTn/h00RC?=
 =?us-ascii?Q?72Xme4Exh2DV4FyBGasKrRpfsfdcgalpDpsIYpcu2wS1dw3ooY1B5OlsRyL8?=
 =?us-ascii?Q?I3TAtfGIuQqJIlwPM+hjoP3/TXIWWaZGOfND3xnX3CzxvNY4AQYdwbDhn8no?=
 =?us-ascii?Q?xcrI9uusHLdkT31NVn9v/uuWVagrKNIiCAqfjag2Wm/52Szh7TTADvecbTQO?=
 =?us-ascii?Q?zcO/MOCyYh9iwlSKbRDRhPZ6DRT25L15fFhbAGSFchN9ucB578VdifT7ZGMR?=
 =?us-ascii?Q?7tDpe5Gn3yx/yquJi6/kZhF5EXuD/9sVsEpvNTMH7zI1vQtOmAqrcehZVkiw?=
 =?us-ascii?Q?iLMZpip+SsdhGmTlVlwvkkWnqD2ZlEoVHbEW3YDa4E2KaUnDDo4HSQy179RA?=
 =?us-ascii?Q?lhzN2XzkqI+o/ci3COf7HBuk7EtshXuKGV2zPssFyfhFA9YoE4BeO30/MJ4Y?=
 =?us-ascii?Q?FsxXZ07JQAqxcjgXD0EFkl0dLuww185TjE6HzfwqoQQmamhdIoogvI8wRefm?=
 =?us-ascii?Q?brvCf1AAlZ20EzRbJE2IIh4BLDMzCqxy2xVioh7oeR+w6+GeXHIjTS3SMknY?=
 =?us-ascii?Q?Avj35GsPyaLLJyzCrHKisHUS6zoA7nawD/GZVvTjYOOBQpWnMiBiQefMtV64?=
 =?us-ascii?Q?kuoNQ5HBf6YdzN3E5lgu7iJM0oawYdyfSB8wJB1UWnGSk1E57NPn+cXRfZqp?=
 =?us-ascii?Q?+lgj/TjV/j7BnJQ3K4Zac6ty4nymvauVLTaNPgsPstWtr7vjLvWO+NY2h6E6?=
 =?us-ascii?Q?vFOyTm8P+v+11rxW86sDxu8tzuOqVA7guIM0xTF3It6tj67cM9qByfc7X/Gt?=
 =?us-ascii?Q?/APnVf98BjicnVsXTUYg+55369MZmSZEmorK4cJ6q1FBzbR6MUvojJ/ugsT4?=
 =?us-ascii?Q?Z3dDxHio21z6TEonhagVoGYgGUeFRffNi3gO1suyoJ34ZHPiuDSv1KuiCIZ1?=
 =?us-ascii?Q?S8Kvb5lutNgs6f4Ih+AUHwP6J8/WbfgoEaw9+OQgaLSGAbQHpVIQD0KH8V19?=
 =?us-ascii?Q?RYPFKFHPGxDV7FaZKN6EqQHUQOs+Fj85caL3l8kM1uRfzByp/sblNLWyixE9?=
 =?us-ascii?Q?ZV+Rs2jH+Ix1l3raoQ83y5/dm96+SocSjRbetr7hKDJFT5C9kxzc48YaE0Go?=
 =?us-ascii?Q?jSIlbXtx8qP/YfqWloqOgPZc+DHKo4ZzKn5LbMB1rk/CHYQoLlwxaZreF2Yq?=
 =?us-ascii?Q?3FcXsepCwOsxoXcpLGoj8dGUDS9icTgHmDv3KKgxbACqLtlu3HB9TYeJtw4n?=
 =?us-ascii?Q?SbnGoF7gcAqKrI7Dv43dFq7/4O7O6DscQkxtygpn/hPvNBLuSr4kj8rpv1y6?=
 =?us-ascii?Q?Y/+TbwTVPUPMXWKNbrB9/Fz3v36XnFJKkcqPZT+IWQ1ZqHm1gkM5H6dWJuQT?=
 =?us-ascii?Q?fOe9FkwWgOdru74HA9aaykQm2O+ORzjuVZHN6YmFVGOREH5m+aaUw8YJFZGJ?=
 =?us-ascii?Q?4icuKfuf+xZ6vaztZeXQFX57h4MdRxZmhL0AvhxyFNFYeohm6wq+ydvu59Rq?=
 =?us-ascii?Q?RPBGt4oHJfBRxUTznAz7+QMz5KYa7Q1QCHaQW2gRfGCSzQFByLDlCgGosG01?=
 =?us-ascii?Q?M8kPXfgjzzI1/QN1J7kP1K5lFgLpdq/S6z4TMUpXsttzDEr1fKmb+Ri3evZ+?=
 =?us-ascii?Q?JRGTPWYeLklhz1RNVSM7RFLXZVbSMV7FbuHpsnI0P9E7vvei5K+hnB2gYJZj?=
 =?us-ascii?Q?xj9Lz6CDFe+OGXNkaadk+s0rIG9iLj8l6Sy+Z1awbODbv9Qza+E/gezlsUpG?=
 =?us-ascii?Q?Yr8aj5Z6Q1VtCqQOAYs1HBdUk1+ND4DhF47XC8WLsBve0ksJhgM5?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da45a5c-5051-4357-617b-08deb00171af
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:38.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOi86hELZmbKecqoPVJwcGwBcNQoqZZ+wU+wEDXLQJeMAUh2i1aAEEn700Ulm6FoZ1Il5FB4JG6pgxWAXR5OVltmfmS6FQEcoNKT5qWK1A/5ZHeoaFBKQRUH4+D714i4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_013558_782771_D3BA80D5 
X-CRM114-Status: UNSURE (   8.08  )
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

Add peripheral-0 domain PLL clock for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 include/dt-bindings/clock/starfive,jhb100-crg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/starfive,jhb100-crg.h b/include/dt-bindings/clock/starfive,jhb100-crg.h
index 98b3cf28b677..37a4535472bf 100644
--- a/include/dt-bindings/clock/starfive,jhb100-crg.h
+++ b/include/dt-bindings/clock/starfive,jhb100-crg.h
@@ -14,6 +14,9 @@
 #define JHB100_SYS0PLL_PLL4_OUT				2
 #define JHB100_SYS0PLL_PLL5_OUT				3
 
+/* PER0PLL clocks */
+#define JHB100_PER0PLL_PLL6_OUT				0
+
 /* SYS0CRG clocks */
 #define JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN		17
 #define JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG		18
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
