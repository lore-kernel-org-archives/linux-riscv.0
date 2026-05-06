Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76893CD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlPOyukpT1+qvgXZFxZCIYtUDCHoONTyGXOObg4oTJk=; b=O+FIxJ27xNYG/H
	a2S0gVPVCAWN2+mAQUTK7WF7O+rzgiVRaCzy/yuMkI/wk6hKGFFZqMGG1rI5OgugWpCVs51QbbuNo
	6YsEWuPyx1a3toQU12ve9lCrygRblLnnsIP+IBvIGDTCpIe1yag4VngbIbv1OZhW7G1TDfhjkeugl
	svUBUqYOYsuY8pefkfgyQOhhWqDhfLBgDmb7RjkIHdQ8JYE4up21a6G3TvsGml4zmzJ6m5fFtCnhA
	Tw1ehtXL4Of4NWKMXaI3if0OspjGeREmQBYSceLW3nwL0RmcAYkEBhI0LrAP4imYenay/Yub0JU8E
	G9T28/lz2HDKGT7Z67Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYLl-00000000JwA-0TyM;
	Wed, 06 May 2026 09:15:25 +0000
Received: from mail-sh0chn02on2072d.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72d] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYLk-00000000Jur-0CeD
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:15:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejQgdwa+4j/Pzyc9MmTIxTFqDwqH2AAtGgxl6yW9rscbv5ZJ1msEpQ7wi+WfXr8zvQj6chbPxz/ibLG+FybYOx4AQi4dMuu/4yS7z8RJfq8Z0GP3EfVT1mL8yJKIDhng8gVISrYFuLl2OROl2N/Ond/5n7UMTeIpO3QhNY3KUj9NwnyZ2Cuod4DvAjJwmEbwpdczzPD9Hwo/XdncQwfl+oeMvi1uF328+WyNCpQJ0Q3EkaHRveHZtDO1SrNhi5+bGP7X2vUFC640DorAXfjSxw9coicmyrkzeX+ziktv1OluI01kzyLz2TzvyMQ6E26AkF9Lr+S5WF2YdWTEfcUWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaa1cAL6tLkap27wliNORNCj8ONjiRRS+SK9oo6mg3A=;
 b=WlXqtn4M6l40wdUbqyQjAZgEsgtVqmy0pIg0HoMKoo9MKz0DvweHLg8NsYkg8diCkL4xlrB4Rp1LVIfIXPhuyLzy7cvSdSBs5OS56FRm+YDTGj0Wug4sVZa7EsN72q491aR1FDPn833YqbAfP8t6P3qAFf1A7Q6HkbwHlX+VY/DRiiWMsC3iR18aaoa0U/uLm7bgloFRUMNEbgrOE1bAPZdLOU7huX1M5gwQjICrO1la6pMcGqtd3QClLf2qIz74xxLHaJH0Zp76Gm0oWrduvjJhkdv8nqYS6YW5jZ7bLgI+1u6yjJqac06jbGa+cDVtIIH+I5Gnx7fAngWi1xffkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:59:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 08:59:50 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v2 2/4] dt-bindings: interrupt-controller: Add StarFive JHB100 plic
Date: Wed,  6 May 2026 01:59:35 -0700
Message-Id: <20260506085937.754808-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c071a7c-54fc-4352-eb12-08deab4dd4e0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: ao53BPt88SG+CQJnSrycomXdWyYdSWBnR4mqOT3OLGYxzV/+2f+6m/twkCB6cLpgOaaXuRHTU/MvDLeCqV4Ob/nhJ8JyLc/qFlkeax7KnfUnnLmCZ4twDidevujCFI4sG/N24fc3se5+daryWlte6twuXDP2p7St7rLRlcttJpvdnzVONZwe5j5FDNpSqB93bvBmb4NdyTK7WeYhwYohVLvTuUugS+MspMRlnNBvQqdo6kVLsjiTCnT+X/HO7GjYkndS9Kr9risXFv08u21Ny9kKcn9T6mjN/aqyK09HMhPfVviXYp6cTtSHQ3Vb7rUqpmkscdd49h/ShfrW1hNISAlZBxDx7CA3tfB03DKKWWl0+xoM0ZFRnYyKyf4WQ9isswXS2un7eZdTPtGmbRwOqmvJ6RghDFmQ3DILdhPrnUdwPSXoEAE8BV796x3jI4wMoT6gM3yxdCZzwWoxwAr7DKr3GiskxvJGegv9RgKUftJ9J20c1YVnrjxmYesAghuBkJ2wW2jks3QIAhnbqaslBn/YjdMNMxymztx/8wYRhfHc2/S5mKQmPsQKZGW7KUdz/OUiNiHYj32BhbHRRwyGlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2KBZ0yHjt9R7ztl9lyUmc5c+PCElPp9EsWAEKTRVL0hhN1S60rG7V10MbSdk?=
 =?us-ascii?Q?KsbDb6AQApntuR/nbaROBTlBXP2s74WQN50HZNCefXs7O4CoDiHwsZd2sAbH?=
 =?us-ascii?Q?e7ih+d0DdCfheRcaGP2pdUt8mA1mdTQ4YJULglIvefZsmtK6CIxSyQ7p2GN0?=
 =?us-ascii?Q?6RrMFz1DX9UbSDgifKjYDMgFAkNsoT/biq6BsCvDyErrWmSYyamFyCThDcRF?=
 =?us-ascii?Q?7TpDmrv8d9qEdVy63QX691+oGZWY3LAfvtlwZpf6eiCxKaKiwyUz03rDdtw8?=
 =?us-ascii?Q?VeKwn/i/xFFzG1iB/yDyZyRd9/tbRk9nnvqJ6Sas3CTTuUmI7zxqEVU93Gky?=
 =?us-ascii?Q?Dnw+UlxclPW9HhOUmEPsSg7iihzTxDhzPiQE/sh1jTfSlJSCKyIf4X1atg+c?=
 =?us-ascii?Q?Fc6SWYrXL13vs8uRxm+JmMAwzxKnF99rJegip/KVDPlQRlHhoy73s35QduMJ?=
 =?us-ascii?Q?0iMsM0B6pXNYOxQV/7juuWXiCMtgK0LQC+yfYn8Nof1RYjN1Xg7ZxR9kMYWr?=
 =?us-ascii?Q?8in+sxBXlueT2BvxVAeBvWXmdd0D3lXjxg8/tGTVC7NzJnwnsaimSERWGo4c?=
 =?us-ascii?Q?zhmaY4+d3qTGQ/uJkGhLgcA4htePQ4jcBZdHL6H8pB0VWruw1wJ+r7TZxUFO?=
 =?us-ascii?Q?uMC4Z+MZn7FE8pglR9imDrkyjwIWR9oM097rihPztUmHJbGiwIVFtOX/FGgi?=
 =?us-ascii?Q?+2dS2OEdVLOdNlUZqCd3fmEkuOrhwmZDftPEd+/8Z+Lgiw3f52s8QQsj7h+e?=
 =?us-ascii?Q?dByxHUHr7sd073qBaUr8+vypw2+4PG0mA0cus/8S7pKK6DL3Cl/1uQY5jipE?=
 =?us-ascii?Q?Xe7JMtH0eUkXPbH78YmdM6ws1Ny2C0CEjtRdjQZB9TTNFcfg9fBPezwHOWJb?=
 =?us-ascii?Q?YL2H68eUmvuPhdZFbYdTPWZWVgccricoxro+aaxusmwPoEpZEZJ5eA7fsyFE?=
 =?us-ascii?Q?eB7rDgapwj9HAYnQXJq+9Hy8S7YsG6PKEClDbYcWVXgFWM6HYDPtYcCm3cC9?=
 =?us-ascii?Q?FynwSAeIfdo1KLSJWQ5OhjSp8ZWVP125wYjkpJb2gl0hKbQAlWldBA58bGiB?=
 =?us-ascii?Q?6aUy/hsUVtRDsccWkcWxAqod4dTYl8nUpLzmTmUr7ZMpNHWQF5zq9m/9vDk5?=
 =?us-ascii?Q?sQ4/kDbIairS6brd2k/WOvTk/TGc41FrJ6kSF94SebcnvJlVCGK/qEcGTtJm?=
 =?us-ascii?Q?MirHM8hP58YJJqCMoxQpf66WX9ecfJ7ep7o7n8jjR9JPat+uh6iFWIzu68SB?=
 =?us-ascii?Q?CUcoBnmiIZG1YoaLZfQocQwPZB2t3OkDnr0auLnGCDf27j6CwY0d27IoPnJm?=
 =?us-ascii?Q?509CYcASiA4oLLJPIDGLuSglp2xAIHiF23esAQW+ggjJraYyxZZ8Stg55c0n?=
 =?us-ascii?Q?uPhCt1wefcLEce/s/EUfjybhtfCYEFw8mJTPzdHkSUyJPL7dUMbS/7cSZ/28?=
 =?us-ascii?Q?scQmqFZsz487be2n5FS03zAZT81MfNxbw3IXG6EyZXAQ6tyfhwC3FNGvCO/g?=
 =?us-ascii?Q?RX0ZY//zrM2iMUYO2f8NFx2wdswfMHE0QIvF26qNS6lPHXYccKbWyVeVmzXg?=
 =?us-ascii?Q?AbvzZgPnkuDYhKk+fNFFwI/B0yxC15glz4shecHnmmmps0Laa/cuNY9p3dAG?=
 =?us-ascii?Q?lVlspR2AMJQ6ypRvL1gVdmbKaAy1x1OjYBeltl4Dn77BRTV5EUGWhNuXpc3a?=
 =?us-ascii?Q?TsU3/6Ym3LijxSyh7XNJ5OwPzBbgLJ2q9XO44zMb8iVWTwSqaiHP1MeX4M+R?=
 =?us-ascii?Q?B3HMdJGMTWhY3RkpSdDQiZT+ivxfJI85ey4qie+gpqfJqe4pddDh?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c071a7c-54fc-4352-eb12-08deab4dd4e0
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:59:50.7258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lI/zBhUQ/4KmzyBCOmpBfLqrJ27r6/V9yoxtrWgPkGrwEyUKYDN+DuYlBRJRQ0sRbghbrFouOLCne0RPBjGl4wyFBsG6T/7Y5dcGviR2D+gHRxAbnXWB/BvC+2TI0f3n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_021524_081201_1E945A8B 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: devicetree@vger.kernel.org, Michael Zhu <michael.zhu@starfivetech.com>, Junhui Liu <junhui.liu@pigmoral.tech>, E Shattow <e@freeshell.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Joel Stanley <jms@oss.tenstorrent.com>, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@oss.tenstorrent.com>, Guodong Xu <guodong@riscstar.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, Yixun Lan <dlan@kernel.org>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>, Michal Simek <michal.simek@amd.com>, Changhuang Liang <changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add compatible string for StarFive JHB100 plic.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 639bbeb1f6bd..4a242d252aef 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,7 @@ properties:
               - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
+              - starfive,jhb100-plic
               - tenstorrent,blackhole-plic
           - const: sifive,plic-1.0.0
       - items:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
