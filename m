Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6700AC54E67
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 03:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WydlrvXXAfrF9x7W12vJ+BtMsXowQ+IQWmfxGxLhbM=; b=dGxiL+5osSSLaB
	769gxeo0uXwoBTru7ZQUnSb0/uNXevnNP24wwL4Y+ie8gg7A41K+k36C4VUtpKk1F8GmiFQM1ofKc
	vQ/yiuSFiJETUbmDbkAGFmI7WIk97aJwpBwHDWtPR3GEkIW/PC4Mnpur0NGCBs9B2NOGX+//Jud/G
	j/WOaxzSD/sezu+LF2L2ictDnWZ050MssoQ0FLswjn4hv+8N0IgO3KTxstxq0qG98mFuZz0UnHqYo
	Dsp5c0ZCkIWBI7R9G5lsKBFMQRucEEA9Gc9q3DHwNADE/twLmMUfHtvyAqEf2eC/17W9HBtt3v+P6
	gFgVMvPW9koePJvqY9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm3LG-000000076h0-2K0c;
	Mon, 18 Mar 2024 03:07:14 +0000
Received: from mail-sh0chn02on20718.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::718] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm3LC-000000076dW-2PsW
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 03:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Isnf6Ml83z3pkIUlqmOrbSWw3hEKbCX+E7Ve7sOfqg9BxXTgGTjyU5cjNN5WgjW6nM1yRAD3WD4Wd4vICHGwol0mJSpmU5LTF0VOcHRQfLpvwD0QGzKLxxj30zDDgTtQ4bPG+bO4Sx+kajYZb7RHI/WuhaKggMv0FCAuWpRWhnw9iWV+UsyXOYqxEjicxc7ptpOCpswC92cM1sMG5HsjGQNEoXuHjw17OUepbJoRqYDafGt1zCtTQyk/+udCpqLGCMCLmrfbgFIPq+njAxXdQi7RbVZUYSJsaxxXLl6rm6byQXQxCByFusOk1Md9sDHQNOa/qycCRGYsWqFG4HqRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwesO3TlWOUb/SeUcoTcgPg2OAH7CMFLLOgpIP0oUaI=;
 b=Gh0uL+U/D+otwMbLwqrhew65e/9wUcubv16l+UsDJklIbkbMWKxTs66NWMa3+8SxUri25ZJNBgUGDOmZ8cA92mb8ZcYUrjdY6vyZt+ERBn1CvRdjIZY5uOBQW4YjGaUQqXcpUAbQshAUYkrByjQhbaKHOEjcZvc7DFp9eG/JHyKlUX3UgT+oT/TrlZzku8yQGZF/Z3fWttd3GNPItaE4asEfRzphHx5uVTwZdqatBIB4NeLgkYIE+1K9TYqVqWH5k+zY6eoybMCWS9Fks79Rrv6CTuswm9kpRAjVJDOZfie/VofyIBWK08orYBmnbPUFfhhO7yw/p4B1ksHs2Q29PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::14) by NTZPR01MB1049.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Mon, 18 Mar
 2024 03:06:58 +0000
Received: from NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
 ([fe80::6011:feb9:5761:3880]) by
 NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn ([fe80::6011:feb9:5761:3880%6])
 with mapi id 15.20.7386.016; Mon, 18 Mar 2024 03:06:58 +0000
From: Ziv Xu <ziv.xu@starfivetech.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v9 3/3] riscv: dts: jh7110: starfive: Add timer node
Date: Mon, 18 Mar 2024 11:06:49 +0800
Message-Id: <20240318030649.10413-4-ziv.xu@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240318030649.10413-1-ziv.xu@starfivetech.com>
References: <20240318030649.10413-1-ziv.xu@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::11) To NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0986:EE_|NTZPR01MB1049:EE_
X-MS-Office365-Filtering-Correlation-Id: 685ca1a6-f96e-48e7-7335-08dc46f8792c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2MMQshF4yl6PnIGzPPUiz+cYxr6WpGGxYmXr7YTrcjMRxNDIPXtVJ0hzGR8+q0qlQnZmeeYYPksDM1n5ieHJr3GuHUEP81/AxJ5kc1KLm6bVRSlHRvGGDxbKmqDGYyes3Q54Ni/yp4lTH5OIAGXBkkMdxC0WCEKuAWmaTDY4emat2kzwqJ8SOvlGiZpZXq12Npf0WV3cMl2aD6mmN/4cyg0cFIlx1Z7fdA5UtBI0NkU5KvMs+2zsBsH17Affk5yBRDwbX9hKBDF5O+M6gzAPkhdZCDVCCREuWgKuPEs+ww1MNIKj7uBsBp09AEk6l91iRhqpbVRbe4lVuM1R9dsDAQM7ZxgSeaCo6InbGE3b1ejV8hAKfvK3N7gh+Zfpb0buHs7gvCWIY97fxZe9+p8D+OUMIoUr8bsMAQ/Ame4s+W3PwuvvexfYIwgpV7z/tmgn/51JyGdMvAI3OeATvpepiJKhi9baj20fP9N8+UMCOY5EylySOC1tnyH8Xaghq4+/1WkFqPb2Bl/2RlaVP+h5v1C36xr8sZQ6CKfZ/1F5RwO+OgGLYQi15JYlCz+lrDIaVO2Yvc+ODTcCcr2rSX7rzEAMpR9eSFaVUtvsbZqP6ps++iAZAgXnYgxer4W9wAU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(7416005)(41320700004)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x4ZWWwT9cW2ujWoxKEwVCPHcaWqCWBYjXiqviyx4TweXWPv69FuORzRX6eFb?=
 =?us-ascii?Q?SvU3dibLvDoYqi3JprAQU9kYvqUQ+qAgm42oo82exVY2m7hAhziT1S+Cwnkp?=
 =?us-ascii?Q?ZRkl7WH/iIx5sZmytETFqmwCfZZ+L0/weZ80+qPvG0tTVtDhFLnOuaEIhrzM?=
 =?us-ascii?Q?gUAOi51zBEfkqWLYgew7/OZ+TSSxIziwfiAUYoT0SNt6m5nnMh06TbdrXoTm?=
 =?us-ascii?Q?wnFKvCKR2g+vS1DbMc5K1evx10PQY9n2/wJd5zva0/btk4APFfRffSMWEBSY?=
 =?us-ascii?Q?iHfpz6yEFcWH/I5ikKJ4xvo+pNdFxObHUquL6LUNyZa7KOkpMB5YXaUU4fN+?=
 =?us-ascii?Q?K1J/Xe4z7ah3HZd7E49QVn7EfQIb3al1ZtWZnoABBSNnTH2SXaurO1zRmD5C?=
 =?us-ascii?Q?UuXIOEesV6ki/Tz9nIJhHkVm5DHW4LTbpmw5UqmDFl93FrodLEGXfY+DiPG2?=
 =?us-ascii?Q?Xhrg6zO7qbt+g6I9FZN5e0PoG0YT9VvMzIns1B9jKdMfkCzLi/6UcbdTcFP/?=
 =?us-ascii?Q?KuxOvriAXUWUXNwbrYmeuKUzUvxPuFayi8jJ11/L5gwW0L/87F+XryRIH9Z7?=
 =?us-ascii?Q?5rkyzIInnFJ3i0iadJJj4jSM9YNR46ICeJGMqNiVbgUUjkvkXRVAVojIb8I7?=
 =?us-ascii?Q?eOQs+wPRY6R4KU+urWwG6DDQOqIK0nohXOipIFxkHOsqOFnSBYo2lDfbb5gi?=
 =?us-ascii?Q?elWEHcwWLgEPAxiV9KbQNPgDw3pWfIWwMwGfrXWF4gE+nmEC4Gn0Uku2F60E?=
 =?us-ascii?Q?F32yTaJtHot8EJMwwairJ/1WRRsSwbQH71n4i7+i7XkJlFiNeob/w5yxbIl4?=
 =?us-ascii?Q?ku0DZdWdP61jWzoU5yQ7nYfmhQHrNOFPUaODpYaxRhto6LKiPxAs8aSxlNSo?=
 =?us-ascii?Q?tERzzeZFYGZ+OgTjwjAvuGCKE/6V4rnwS0xruYAY+uv6oMV5/kws1elJpz7G?=
 =?us-ascii?Q?Nu7U5ezA3u5Vs3NRDPLjRtzYLixeGe7Zj+OaIs//LqGSHW2O0wLOFudY8mxN?=
 =?us-ascii?Q?y7WJdIRfGdTgZsKhwWsKzYpe3I3QaVee5Y+juPSxr+k3VlyVIQ7kWq0xC5Q0?=
 =?us-ascii?Q?51td16YU9JSR4mlbhDgaGQTBwLCEypyarzk79NdHw+NOu1ppF7jqHqo649Cv?=
 =?us-ascii?Q?BDW4PCG7AlZhHksl5JZXIQog8a8oZrLgjJaTssz8GkQUaiy0YdEGaTJAacbO?=
 =?us-ascii?Q?u6AkSiCnpmeJRDd590VOKDHMPbl7qoUioki1MZvqwiUJ7Yf4R0ykvUFCJu6+?=
 =?us-ascii?Q?F4fOHytfqHkXWwVBmIIrpmsLVGHFpoE/nJGQmd536aWjzdOFrsUuLsSXXsve?=
 =?us-ascii?Q?NMd1qVvLpRQ2guvCOUTBJmuMP19ex4YkTyhqNayXFWaiDWQWMwfmsg4/nuRI?=
 =?us-ascii?Q?nAcGkuMaM5EbGJGrNzN/akU+sf8V7Vai3Kmgyr++YICf72z7aJFJ/B96NgMx?=
 =?us-ascii?Q?zhaN+Cpqlo9EfxCEtpFORn6kYytqSN8vQ4Gi6+Ay8M0KGdOZI8HdBIDkBDgM?=
 =?us-ascii?Q?5P/ySeWuD/cSNqFKuu3kosLwTnuqI8ix08tB+Otnrfdo8HrxKenqXD8IEJIu?=
 =?us-ascii?Q?y7FtgYkizFjm5cvaA7u7FoqJVam+sbRC+3b5Dd77?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685ca1a6-f96e-48e7-7335-08dc46f8792c
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0986.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 03:06:57.9615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6KiNd5F0vUMI3IUEgoiGSVAOl7GNOW1t217HpDXBVdF+YCeuvWG6B1ftYd+jbhIKAU4rW1YcRj3rIb2cdhzYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_200711_065255_2F50F1FC 
X-CRM114-Status: UNSURE (   7.81  )
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

From: Xingyu Wu <xingyu.wu@starfivetech.com>

Add the timer node for the Starfive JH7110 SoC.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 74ed3b9264d8..40dcceaf1f98 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -904,6 +904,26 @@
 			#gpio-cells = <2>;
 		};
 
+		timer@13050000 {
+			compatible = "starfive,jh7110-timer";
+			reg = <0x0 0x13050000 0x0 0x10000>;
+			interrupts = <69>, <70>, <71>, <72>;
+			clocks = <&syscrg JH7110_SYSCLK_TIMER_APB>,
+				 <&syscrg JH7110_SYSCLK_TIMER0>,
+				 <&syscrg JH7110_SYSCLK_TIMER1>,
+				 <&syscrg JH7110_SYSCLK_TIMER2>,
+				 <&syscrg JH7110_SYSCLK_TIMER3>;
+			clock-names = "apb", "ch0", "ch1",
+				      "ch2", "ch3";
+			resets = <&syscrg JH7110_SYSRST_TIMER_APB>,
+				 <&syscrg JH7110_SYSRST_TIMER0>,
+				 <&syscrg JH7110_SYSRST_TIMER1>,
+				 <&syscrg JH7110_SYSRST_TIMER2>,
+				 <&syscrg JH7110_SYSRST_TIMER3>;
+			reset-names = "apb", "ch0", "ch1",
+				      "ch2", "ch3";
+		};
+
 		watchdog@13070000 {
 			compatible = "starfive,jh7110-wdt";
 			reg = <0x0 0x13070000 0x0 0x10000>;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
