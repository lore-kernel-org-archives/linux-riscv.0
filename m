Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4ECCD4F37
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w7o5w4WecL7IjpyOKy6NGy88xgjpRrum2y2H+lGyIs=; b=JvB5rxbOrk80lA
	cPsrVDUzG2E2/e3p3Lz2lw+/cQPixQnMzl3S7bWuqz/SncCoOtEM6NkZPZckDau0FBAd3xn8sLHiW
	F1d6RkmR0Z2DLJpQsqPEU1SZa9gJY0VHXcMrkS65DRJ0z24xEcLXqxyOSKGNCWUHtbE6Uv0agELaH
	siEQcfLwuM5zZkIm3NKj8WveUUp5nuC0Rbbj7dZiOg08KCDc5FT5Pr6aobAp+c6D5mDqNcjel2d8g
	NoRNrDsf3FJuEw8RKb+bGsf69lgtYQe2/5/KPJOQduvxbXwxy3lO7r7mlASBVAXkg3Der866G21ys
	YTJatfzxJCR9EhV7PDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMib3-0000000G645-0Z6g;
	Tue, 12 May 2026 08:36:09 +0000
Received: from mail-bjschn02on20729.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::729] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiax-0000000G5wh-3VXL
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 08:36:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jg4zyoz2/zgJk2x9f+rA+68GB0xBkyT941BVLQx10xfS+f9ymgJFCF314pwu5ESafdec4qfMQsCH+34Co6F5qofwrlFP7MuS3V8pnQQHVNyOiclpWnBde9BOHMwSbVOXVlUKmej0kuSQlZOsIe4fEheZ0m2+Ub5PVIcP9FU50G5VCUVGxoMenIkULkzCnDP3AUD53V6OeSxMOfZ1itkyvn/tNXsNRsoXUe0FkVTfaSXA35iZod1cH7cFGpqmooTNx3fKC9XwardfOPDkybdWxsftYfNtctYDbjAZslPmHuPRwTxttyGvrihYv68hukCKPIpS4r3bacdl6ZhkIH+2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxgCrftJlpy5u9AWIY8gz8oPA30kvJE71aBQsVoKaF4=;
 b=WJMpGhue/652UXLjxO3Yonv3wF5NfsaTbkIlpUMLrGZWFhck99RKgRs+Px54D9xyJfX/W3zVbHavs8ZBRSxejIGHb2FUMsbP/Kz4ik9LJ/X0H9NEgCMi000Zl/Ddl/ecx1+exnxbPmliuTOvVweKJss2jXAz7EaqzldkbgGlPBnAY9f6uG80GztFJU0U5Ifa9+zKFb4vrb0XOSF0MA9ZMoQN0l9PmbaGYUOIEGXmlrUxzzGizmNFhZgVotVAsgfDVB5W3Cg7MImS9dNKYuVhT+X4k4t1DpEMth+gYuzqPUVT0qoQ+dmif8xbCr6RsHI+FflDGLcAKoUfAwABshCQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:41 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:41 +0000
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
Subject: [PATCH v2 06/12] dt-bindings: clock: Add peripheral-1 domain PLL clock
Date: Tue, 12 May 2026 01:35:15 -0700
Message-Id: <20260512083521.3448-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ab93c3-5608-4654-61fb-08deb001738b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mGbmZmaxZ/1pt4vvyi3MNYNqVDrSrmLp1BhL8pqh5KqhAcRBP8SMQTWs8h51VM4xJv/3Oxh/TvvKyO1rFfdwY7k4NSBcHRnDhW8RKuJGYzbYkarguYiWOw421ZF4Hwajyvg2THLTrPalo3WJq0/hwyTtSzZOX4To+4CvoitLSBQZj2b4rulNEz2nFGOPor47iBpZ+LomV2RoG6y7jvKp254V2VuW2xvJTWEQidoLQpBW/zZe+9zhgTpSG5dFu5yfiLeXHzrdZx3GCnypczGm/Q55OJTB6Clvy8yMTO1HpNNzf76TU7k0p3cGb/H5lZmswQa/sg4M0OcKMaq8jDzJA0z/L/JrHj2WznpyU9xtAqtrMAe3wIVoOPpgwNUwEMl42pOMPiXSfIQYS98zsuIbqPK7kOtZjhCWNnGTzrF7qANFSKgYy2j/pbyHzH2V0sQAUo19NV5WmbGGx1sM3Q8i+UCqm3BC0EsnqXsR+Zm3THKqimT3EjlKJrDLtqXSMk3V065UULHYnkCKYCE6Yv+GOaHaO/jck9X+XEcAnzvVDtD3/pd02qCuGD6NAYbP1PA/0sHkiifn8AK7loDLAbYcDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pQGpdaWTVckEa9k1uSUc7OSZRnoU2TKpS8/VzDL/VMJZMNsP2pPOj+CePsR1?=
 =?us-ascii?Q?Wie8ViTz8TiYTTK6ZJBzQEBqs8RmI2FUgyujZJTenOpJdGTxRjC1DwXpygKP?=
 =?us-ascii?Q?O6mhXf/dRRgVNZTh+xxOoicq56wKN9sCKLmhFBUm67cENArPt212XN1isN3I?=
 =?us-ascii?Q?gI/L3Jxo7/xVhcnoeDnuMuZjpcoJM8Gev39bGQ/1euU5emsUIw/7zSba79tt?=
 =?us-ascii?Q?xE/H5zqgnQx81UPWmRzV/XcGiz0gRLDduD4rvYmvi9mQvc2QEr5kVwpLgEMK?=
 =?us-ascii?Q?Ufi0KmFtJV40qr+PgAF1LylJpZEDG3vCKObmR2Vf/NXeuyLgShrcH32JfzwP?=
 =?us-ascii?Q?hrI5DdZR4TTGsEUdKpf2CZsMW/A/fg86vz4GAdvVx5Ehpa74ZhASv4up/hdC?=
 =?us-ascii?Q?xYFHwKz3qpIoNoMjraYH97SMBEmJG0UcFW7jq36gu9ea7wK9XfhOSdJvaQlp?=
 =?us-ascii?Q?l1h+u0Bm8u8jrSVJhuLgFizL0Tj4Yj+tJpwwxvCvk9EnFX9UYA03aaVrx27S?=
 =?us-ascii?Q?x6bgRBwZeaLHHmczSc941aYiq2Muh8/S+ZXTe33kqC0uqHhM4pSQtbgL/6LT?=
 =?us-ascii?Q?KiVt9ga9TL4mIbro9o3ZaWvxXLNUK1ynv6Qoq6QlF4l2yEJ24uvd+6Sy7nAM?=
 =?us-ascii?Q?2eNuxh56M7YOo+Pv/fvoMMUi2wll+eYVee+GYCPDLX5IxCMT55A+Uo2RE1dj?=
 =?us-ascii?Q?E3H35ebRzS92wvHycoKvkBaVJu0h0SfnaiIHdRs4BRQ9ZfrKwztisTf/wYpX?=
 =?us-ascii?Q?D+ReNcrJwd+XX7lPTnR3dJflBvgv/jPbDfBc/aPAOWMRPSfquPl7bVIJOrxx?=
 =?us-ascii?Q?jRqEWdF4PFX0XXh395ADLTP8BaQKJAa9UUvUEaWLqWHTF8AUWQGD8Tun8Ij+?=
 =?us-ascii?Q?psiCNHVYBO969/8BRZq7eRnjDCGLP/S4jd9BlLTcxs7PY4PASqTUEUCQwToN?=
 =?us-ascii?Q?9h7ofHfXRS8uwobM2ctCBgSMqnLBZw0iiV/njjNkjCqevNYVpT9tBmzpXkUR?=
 =?us-ascii?Q?GRQxlhswFf5kwpneH0ERUipcTwrBy8ecSQpsfhJSb2yFpBYDGIl1SR630MjI?=
 =?us-ascii?Q?toUNM0CEl4pPCkunfUaScwmHGAKBEUul3sjE2Q/WlFbz1qlN0/cXxl6EyAMW?=
 =?us-ascii?Q?7D/dTpX6svNGWE5L08cpGmk5myv72AuoyJM4V6TqUcFt8FFGTgZtGZHDmKex?=
 =?us-ascii?Q?qJDWMd2aK3/mQAqSGZu/yBwkr3bXV50i5vPSqX2JNMX75ePRfdhntFfhZQ6C?=
 =?us-ascii?Q?c97DvyeQuqXODf47ebnaEMOaxoXcAlh+7o5Ymrcn4PPpZOA4XQuqCKBS2paF?=
 =?us-ascii?Q?4jWcIVf/fbssLtQ9FzzcUS5457PjZ4MwWsHeYgjYt2RKbbfOfIiX6iTP8khy?=
 =?us-ascii?Q?exRaEbnH7tp5Qqn2rQDCHESREtmD3UGoRcIT4qObFeuI8Tl7HYaF/GbTyeH1?=
 =?us-ascii?Q?sJwgPrALKLq80snACgZl9b87t3SR1fSvszITJ4p9NdLyIwRTIBNaAuHeCvEb?=
 =?us-ascii?Q?YaendyVuNBVdAd5qXTwsL72nOnxrahBt6Z4M0hMedmMqtC+kLuAxliym0C+r?=
 =?us-ascii?Q?pFDobflfowxITytY6ZAJ9nWuxniY1d3C/wJVYinHC2F8Im+AxRNV5aAyYYmq?=
 =?us-ascii?Q?RwbGpW8Rm70l/oHjX2vZJS4RBUZwUzCp80GSHAE/8W6/ydgG8IMLbDdVoFzv?=
 =?us-ascii?Q?VI/oxx7NFvY3rN65OA1P0OZcyv+hyFq3jcadcl3VYaAbheIpxOjhPzbfIzKa?=
 =?us-ascii?Q?umqdqZwGuPbWxFI930nLtTPU9+kXHhsDm3xMsXtBYGekjjex0yEe?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ab93c3-5608-4654-61fb-08deb001738b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:41.4357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNLQjs7DXUflZgnzkJ1tGeh3h/nDZ7r52KvKgi007xy7IJEgB7ELjCaBQsudQgYpqRoegbqlCIAxTYV+vPeNj2bWCC/5sAyOVGjbSSDMdbcuxzEV4JsSGUaqf1MHjedm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_013603_877473_2E772C60 
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

Add peripheral-1 domain PLL clock for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 include/dt-bindings/clock/starfive,jhb100-crg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/starfive,jhb100-crg.h b/include/dt-bindings/clock/starfive,jhb100-crg.h
index 37a4535472bf..4270bfa532e8 100644
--- a/include/dt-bindings/clock/starfive,jhb100-crg.h
+++ b/include/dt-bindings/clock/starfive,jhb100-crg.h
@@ -17,6 +17,9 @@
 /* PER0PLL clocks */
 #define JHB100_PER0PLL_PLL6_OUT				0
 
+/* PER1PLL clocks */
+#define JHB100_PER1PLL_PLL7_OUT				0
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
