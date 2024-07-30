Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FA5C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 07:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+b0nCWqKu1jNtNpZFck0U8mQKppe98STr5FmC6klkY=; b=RGyK7XDAEoNThh
	FZbDkBxtnamBBuyF7lAWiuz6N323YDotbKOhCqArBx6sVnvLLW11Myn57NjqGT9YOzZo+QZQcZSu6
	F/7iVXlH0IEIbfCKSCBwW0FglpWSSV7aT1KOyWl9NjwdnEKA9eS50uhZX9wffCOe8CaT1HfH2eRHf
	BvBsjIl/5fYJbHA1NClueLrsG4guulTshVQd0/ctptSjcsyRos7RILuzaHf4foSjAkQg4kq+6vytt
	98Um1X5PN3q6pz3HYkQ6/AEqU+5sH7e3ZWlLIE0mk44otqp3CMI0gsuFibZFVXZ8uZML9dJl6JRSa
	+dxAgqHuMUeC6DB8sQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhds-0000000E6PO-2zhd;
	Tue, 30 Jul 2024 07:51:32 +0000
Received: from mail-mw2nam12olkn20821.outbound.protection.outlook.com ([2a01:111:f403:2805::821] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhdp-0000000E6N4-3CNR
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 07:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBnaYZLILghTFyTEhFl0d+0R+uxeaj/eUKn982QSd5rPB/8pc+ad+1BYocxrVVHdxwVpGxETSM9GBxI59DNdXo6K0eJhxovHwYYrsXZPQ4jsX/GZDy0199h6yGMXweLTfrUQ2ieT4TWcTrgRr8RX2lMwi4VqNERBodrzGWFWmK8vMLakgpvqs70dSVe2YCHF8b86thckhzImSblppDZ4ikMaxf+jDmfw5qTSYL1UlgfNKW8oizS3eal2Lhtqw2MEJCAtxboBw7qd5q3TW15cavM4ncr+1mUtykb0/DYHAVCxXYTEXp/AvBSrDdGd2bCJinb2p/LLmQlbbiOvtIdCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+Tfw1dxS0oeqMmzxgma1iDLTRKCmGYFX8bp+GsGX64=;
 b=Nv31Ac6jXm4RzK8Honef6jxbw4xZrGQOPHndLsE2Eosxrc0coI1XNK2cwJOQG3yhuein8UOcgEv9CA/D226cbtXTuLYoES0V5MDRrC2fNh3sHMr0m4UIlYbexHC8HI5/cm8/i55p1O2BYPSSUPM9xPCBa6dzGPMwtzYt6nvBQiKiqge3bDZ8x9iF/w6vppmgVazd9Y+Wu/rIrYqtnGA2R8ctpowKZLwpR82rLZ5dPOGyWtBSamf8eEJ48rE1L37FQQuRge1FatPmo97yR/eVQZTjAW93mal/XkpNOJRjaCrcXZ35OB3pjGPmr4vibgvl0kp5ObEdYeL6Yr/eT//q9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+Tfw1dxS0oeqMmzxgma1iDLTRKCmGYFX8bp+GsGX64=;
 b=hy6emlfjERYHsIG9EpjsSqlBjfLhBArJfAbxpo9J212DJQlJCfqjq9cQ+Atn2Um27ygctkRoJTE3c6mPWeEXH/kGq0Bx04VKf5PpMZxqkou5mzsIKFESmXJX8WAx0YGJtZZtWRhhRUbbIg+3rVxNEr4LjljPdYRA2+Z1DrMrFLKz/32VysYXxJkbNheOD+0Bhn16i3CQapkrKzu7cKAl/PvSEwJK90bu5lBvDHwGMuwp+Yp+a8LFSendxoYlU6hyauGdnuU+mK9kXyesEsBGRVicLJdqt6gUV1nMr5SLsMrWe4imM07p+AF7t61qWvg0DrGv0Bb+5MlbHpdOZuge1w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MN0PR20MB7552.namprd20.prod.outlook.com (2603:10b6:208:4c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 30 Jul
 2024 07:51:23 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:51:23 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 3/4] riscv: dts: sophgo: Add mcu device for Milk-V Pioneer
Date: Tue, 30 Jul 2024 15:50:39 +0800
Message-ID: <IA1PR20MB4953826DECDCC141A7CDE634BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49538C09E94D90F07B7B2562BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538C09E94D90F07B7B2562BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [LKmAa7ANCEJWvC84jqUzMW371ZBNlHeE6MJdR4GF50s=]
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240730075041.489815-3-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MN0PR20MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb6e5fd-c61e-4d53-2832-08dcb06c6887
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|5072599009|8060799006|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: mt3kvQOennPGqdOQOEMGUP3UH61TuPcg+ka6I/fADcLYZ2LjELLCz+wngt3uRLCFBDOYt7zH5519ZsEDA/XXN09lcm/rw8L8PvTmnhHkQwxC6MNCQpenrWRWVp/c5iz27Saxig6OzMSSRnguh6JkK/xn7EReILi8SFsP1d0JwsrNPySPY6Fp5VxbACLRCkx5eGsHg3/IBRuK4K53bik2NB704Eq5Yw76e2T1HroBFwvi4e6+tPLDX00NXnMxa1C+a1+E3EtNQCqVO+6sqtFzlg0wsMqOydCALMArdQyh+aTApGFCwPfbG5gUxlmXMjRv86Wyt7/YrHyqRPn+5ZakbFt9BkA9CwBxOPBTexCdLhPZGgpHNyeJIzsJIcMPGEa9PYjcHApJwKnfQ0LqemAX6lpNYV0zB8jEPA6Ev+JiGir+QPWSaHBn3Pc4HcS4+uM9PFNbo0islO2e99ntpg/iaSWOI5bP5f67n28UYVTkEkNTsfqFue+CvBEhvFx94xaLVm8BYGxxvUEYgSiqgmhhHbrZBbga+PX3CffqIMmiD2+cOU3fjGcRLHl766vZtKtg/U1FrA6MJx5e8zird98aRm5nl4wtI6qnD+5lrqoBeCOt6NdQoI1k+8V9ZoVoxZxH0z6oeNJIpMGcfGw4Sm0MC5s69Dt9MPXQEVZp9AYqctGtRpaGfbqSPH51Yw+D3tPw/2LdaAr2iSJlzNiulh29sg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPPegSqUdX9wFRH3x/Zu/oTc+fq5m4u0CtyE2aGL6GYwBZBNo0U0tMJsg2Br?=
 =?us-ascii?Q?wDT5ddyzVHcMf2JSwHZtiK0hw3NMVrZnCaXf0QGbL0AKKNz92XYWXzsJOa/I?=
 =?us-ascii?Q?T07FJ1ZHJsgI+eNfQvx7QEIHdSHFBJPIg8VE/WiWss+ogpG5z9LUvuekujVA?=
 =?us-ascii?Q?NuvVgen3bWSg+2JOrp/0nWVVlEDPP4vFuLYUnQSkCeGYXAhj/EjgLTMLFr7K?=
 =?us-ascii?Q?hPfzjV/aS7CY139yABGOVe4L7xOEzKvh2YMvIZIb8/NglJ9tEgjG2kHkL97y?=
 =?us-ascii?Q?x4lSB7L9tm9NxAnPTeVItOya9V1UwwIvUCP40Y1B3GCyUm/GR/22cN3rsqPz?=
 =?us-ascii?Q?SKR/3j4jCMqvz06wPLUACmPRZ1t+TTOuzki8R59gBFXEhaeVqc/MlWXO5p4g?=
 =?us-ascii?Q?sSdlt3jCjYLhcY6KLnRIFEyKQ9PhyBXYG1AOU5f/AbhajNfrguummtaWMP8a?=
 =?us-ascii?Q?nO6zUnF8Ubmpbocc1hjCx0me5SsVJNr9T6ydd1Wqya4Skkr9onOEHSKOGh/y?=
 =?us-ascii?Q?UfR0nZGUVSMzI9AWLsP9lrfhaEMcOKNQqShXHeNl9K8vg1lOkwT7TZmKWHzk?=
 =?us-ascii?Q?wdeXNk2XOudr6yhT5m8Ig1c8Sjo/OMfQxbHrgT8sVoEGwBmOKrjTkOl5XMYw?=
 =?us-ascii?Q?m4ytb/4RetsJXWeHLD/IDWePhnua5wO2DipYKAs4vL/QXuKc/T/kfX4A91e0?=
 =?us-ascii?Q?UHrtVTGl85z26j0SePsg8989Tw0MKWCQ679yiaF1BAoVtP4wntsg4NBsNnO+?=
 =?us-ascii?Q?RdfwAg+2OLBM1DoG2TLZlunUjmuN3lzxKUopGK8sKmUaJKUzPaFda3nB26ZX?=
 =?us-ascii?Q?yKWN5TimTh1JZf2mLLRLeSB9s036mCRKQFB55ikLZhEOf/cbyBUtaJLS9D2d?=
 =?us-ascii?Q?aZXwtkF/pPQ3HwbeAaJoKDgr/XVof/IBIYA/2YbC21zioKsPa6wOQd3GiS6t?=
 =?us-ascii?Q?YIN4SI80tjC939Ynd5SASSkj9lNRWQHXxkOoxCT9Xgeyav5Z1qyuRsG/HMAr?=
 =?us-ascii?Q?CQ99eLIvT6+Cw3XycRjXqBR0Itbgx9lwnwDE4LE+yLWdCPgM6jj0twYYPGVE?=
 =?us-ascii?Q?n1ELPATPCGoOKHMbWPnVcx1qHGjqrBoQxHX1P14jnXUkOIqeBR2vmUVce+jG?=
 =?us-ascii?Q?CzMXnfKVljgHHSQ/gmCIIZAUfngq/pjMX1A9aRLXt64ib9B2igXmFTl/zO99?=
 =?us-ascii?Q?SbapuLuwh+aI+P9FPbt8v/7E8lxRQTlO96XW+zM5mTjaEpe8rg+zXHMKI27t?=
 =?us-ascii?Q?xgrp2qVHLRTqWmizdi/v?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb6e5fd-c61e-4d53-2832-08dcb06c6887
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:51:23.7973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB7552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_005129_860493_7BA9EF18 
X-CRM114-Status: UNSURE (   8.35  )
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

Add mcu device and thermal zones node for Milk-V Pioneer.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 80cb017974d8..8b8fdf6243d4 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -26,6 +26,66 @@ &cgi_dpll1 {
 	clock-frequency = <25000000>;
 };

+&i2c1 {
+	status = "okay";
+
+	mcu: syscon@17 {
+		compatible = "sophgo,sg2042-hwmon-mcu";
+		reg = <0x17>;
+		#thermal-sensor-cells = <1>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
+
+/ {
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 0>;
+
+			trips {
+				soc_active1: soc-active1 {
+					temperature = <30000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+
+				soc_active2: soc-active2 {
+					temperature = <58000>;
+					hysteresis = <12000>;
+					type = "active";
+				};
+
+				soc_active3: soc-active3 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+
+				soc_hot: soc-hot {
+					temperature = <85000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+			};
+		};
+
+		board-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 1>;
+
+			trips {
+				board_active: board-active {
+					temperature = <75000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+			};
+		};
+	};
+};
--
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
