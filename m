Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B274C46CA1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 23:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AG38To4+LNjXw3knoUFUB55yekYCc07nvjFtUxXvlQ=; b=el4asoPl/Oa4Au
	asV4Jvs0tRqY9QD+L0bykVGYeU2A5CiXbPblLMv6CoH2qMwPG1Syy0eVQNmmceNubZItI1jfqoMV7
	+xQBAPSMyQ1wm0HgKnMYIU5bHhvWkKtj7CtYB6hCi9wi/XRpKXYr2okYsGbZNR5+dv9S6QSK8tfnR
	nQv1I9a/FxvwrN4hd4St/3bZzOq1Bj1hBAXrog0pq3nwCz/ExMO/uH5CajaUUEb5WmagYMYEWO1FU
	XCuhoGsqX/WooIjiptO2xUmHq3sMhS/EXnN9PIMEOB4i0bF0gWheU/Oifw/rQ4DMxxWy0ehCz5JFF
	sUiMVGN7Y0gloPsRPocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFof-00Ftxy-13;
	Wed, 18 Oct 2023 23:19:05 +0000
Received: from mail-bn1nam02olkn2082a.outbound.protection.outlook.com ([2a01:111:f400:7eb2::82a] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFob-00Ftu6-1j
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 23:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYMoLMjJGbtKFkO5pNhiZZ3TXQ9u1hQbnGQAe53wPn/yqe+f2dekUmHsJdT/92naRKNRfYaIS5086FOBDZzTgOGM0QVAhnBawwzSkZSe8D6tqG5x3bEb01U5MCJUJvW6+4TiWwkH+6Auy8XPx5n5fS7b26q6BmTQp3gM8ulU+JxJ7GBOAk2HeO8DKjpvhrwEn+yfh/ZfPFKykze7Iumh0qS/m7bd4W8foUNvpjj/gll5TsF6OBWSicJf4aTWC40OdDZTkDd4YqyGCK5gH0khc9NPlcwmQ/ZyCAQ/ewVXxigIdEWF0/A5BSV64SQu6ORAvEzKC5oypPjeM4D5dYuh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx7xPx26Mq3kzCKC4EipZZimta+A0D9rZ+GtCJMX9+Y=;
 b=Jg0ur88DpKnmRgrSWNJa8qhp9G1iK14hz49DjPIxpnIqTnT50+IiZw8DyoLPOa+4TY5RATbY09Ua8+hC1BDkor9bdVwcEHraFtkqCCuOUHk/PbSkVHmyo64ph3VYKT2FHmPpZx0PsqKsG4PEHcPwWxa8QeKeUKfeBARqpDMdcveQ3Qk7RC/fggMJOVhruF9dPZZn/VDBXuSmBEseldaRo0RRTjHb5DVnvu2a/PEwY0VJ3UHh4XjbVgdSwwFs12XbXaVILPjTdDyikAHxtME3q04s/Imxx/aXtuIfj/FeuVPC+z9REPVp8I1InCSLdtycjnkJJ/niCnlXJAcQYxeuhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx7xPx26Mq3kzCKC4EipZZimta+A0D9rZ+GtCJMX9+Y=;
 b=OR+34IjUi7DPS8oVcUTsXo8RRQJ2Sp5R7kQRHpnDnrrxVBwm8H/kTnYIhZi82VI+9dTZNGe+3G2qzL/nnimaKRhxz3Re9MbDaoG78sfN7hQmnKn0VL+5r2DS2By70dLBw7wKnL+WaBaDxxOcNUndTUi5MvkcwX1hUd0shR3MqHxWLeQWDkui7r4UTSIZ/mAW77kaMCdk/WeCU7+TsdLx6ywPn9n+pHGmJm7f0cddpFDLYEcOApA8ULD2hNtJy7FQYlC9b4Qtc5haXONM2kkN2kYSyLrEGEFY4RusPJxkeFyMM/QbiIzk+zu2Y9I1rQ7s+e7pD7/q82SthOmg6GjknQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB5087.namprd20.prod.outlook.com (2603:10b6:8:8d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.37; Wed, 18 Oct
 2023 23:18:59 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 23:18:59 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] riscv: dts: sophgo: cv18xx: Add gpio devices
Date: Thu, 19 Oct 2023 07:18:52 +0800
Message-ID: <IA1PR20MB4953C1E5F9EAA3699EA1D3DDBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [1kAHMdmURBWU7OSQ4ZAsgKBfRyQE5mQrOjdo8EJ+bVw=]
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018231855.28472-5-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: abcc7655-2e7a-4f16-715f-08dbd0309ba7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4yNbOwi3/eo0kFARmvAnQwHnK1OUzI1N0yRSAT9FZc0Gc8Ca/2J/85SZOem4m3UvBZ4hJVDotLV6FkjP0njLd0Em5mg6xK64VXgGMDabV6Wow8W930ir6paVTT76Jul/0DdhQere4sf9SRHGTJYq2z4sU+NJd6NKFxlAKg+UcnpeffJJfz/aO249SeWDL59sQP3JZDyG4s7UU7yQPIirDw4hLToUMWJAy+9fQSUuVYdT2rvGjmzj4C7tySbDafSVBvHFsa3bs/dirLcmjqyRknF3rsOBVBX+CMoWc27o0fj51mxIUw5v6derwsKUwR8Az0Ph3rE7dUJdmvQpi1gCnFnU7GVV0E9/afRW6pjDEwrbYlSWPBMmJtf2A1gqA8VqL3WMtuTMQWDB2oBvE3qVhvG9mZXzvmrA8MmEsiKa65Ioenak4O4nab7FoVIs5eCpOf8aA4/9CJG32tp6hvphdRTxFbdIwP6k8wi6uTZ8ipao2bbJ7H+Iykjua4vu7O6jLjzmvbXtsq7NhJf6NYBAbxGuv6lGSoEHH4tYk070p5aR3RufFZYMV4vCl3ZvrOe7fnb4XQKBAZfnmzC/vh4i/lTMPsKRXPNguqb2Xah/lB8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ToblB1xwTOw7JXqcotcm7B8LsXyF2ok+TDVzzQFr/MMLrTtNyVbqG3t3B3K4?=
 =?us-ascii?Q?Nh1ZHLWYjdQNY8zwy3JBCJHDvg1u1vKSzrCZcGjTxWIRrTNogSI60z5u/VYf?=
 =?us-ascii?Q?lZX04RiGDGkjEprvV7K9/21Y0Cd480R7mJZwYzekabLmc1SBB3sKfKsxXRqQ?=
 =?us-ascii?Q?7/A16MyxtoQJOEcFMkMHAHtIbeefleDw2s5bAVZfXtigRLmtrlVKupJkT1kQ?=
 =?us-ascii?Q?O1TAsWGsHYZFAhGODas85X73SwWCFX6pfhPCPfN7CL1yM6m1L97F5DeCoz8m?=
 =?us-ascii?Q?+T2W6bh2rnYsDsnFgL694z16xi/DcuG4wZQOrNzvN3AHY+W5oH7WkcWdMrT4?=
 =?us-ascii?Q?xM+YJH4vFjaU0XdGkaspxW6nI/uLfjpdO/NY/xfYTYourqB+8QLcHlk+Spmq?=
 =?us-ascii?Q?p4047PiKdSTJFFrtrsnlgMU2kQm3FIcHfdmp2R8yjmoldlHteucgwa1zBNDT?=
 =?us-ascii?Q?o/Ighc67kzxLNgKExROOw0toA8uicrUK4rHoBYOLWLh4df/dVzAk0RrcTd0+?=
 =?us-ascii?Q?uDpdMxxIDrwbXlIsfxZ5F5xUWuQCyam/AthMJlBKXkpPuDfEyVTmyFHECJJM?=
 =?us-ascii?Q?VKN4I9cMy/8aA9DzWPWHxihnYepp4W/Ck524A+2b7BmqnymN+FangrRiLTSY?=
 =?us-ascii?Q?qwH1xapW4clGgW55IvOgv8nWGTH9cr0YeVU+/wZYG3nPPNiks2wb4n2srTIT?=
 =?us-ascii?Q?HJTUo7TSOXOtlwOZ1vH0XfO/+6EVfLyuOdMw1YxiIfm7s+lYd1rQYb1wfdJh?=
 =?us-ascii?Q?raOE1Bqp3zuzEEAhCBUhk/kdpa74DzbvlERWlZazZyhP9hRox5lMMy53y3Tc?=
 =?us-ascii?Q?VoSv/D807JxqkPUbujuGtXSq9lpphHJ7ghFGwDLE1mZUHWGzXKBUgXy0nCaR?=
 =?us-ascii?Q?JqwOxerXzS5Txu1vpPIqOJBCbwMdVY2nWLxIdXm8K4xZJOcwkZ0Jyv59KX5z?=
 =?us-ascii?Q?3HpaFe/cLIiC5Ak8hA/xcaWoNSjYDwB4EAVrdN9vSRKU3Vqm0aWezFHJDOn4?=
 =?us-ascii?Q?dySojiy/A7An332tKobojlpqjOp+aCvsHT2YCszBddAOzOTNPxZXAvKe+cSI?=
 =?us-ascii?Q?hogXztMcEZcn5VLi9Yb4V0k+0eBMhLMSc+oiAo2pfg2pOA6XNlizZ+UsWBTR?=
 =?us-ascii?Q?0ZVUaMc/F5mnyu7BCxpJsFc9dziE9zSap9ct2gl5+uoMjPyyuAIJI5ECZtAZ?=
 =?us-ascii?Q?uY3viRqOBdqeMjr6E2+P5lxRM9eG8D2piiEuKgb83lKaE+i15dluq9h0Kj8?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcc7655-2e7a-4f16-715f-08dbd0309ba7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 23:18:59.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_161901_583786_17CBF56F 
X-CRM114-Status: UNSURE (   7.53  )
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

Add common GPIO devices for the CV180x and CV181x soc.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 73 ++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 55d4bc84faa0..d415cc758def 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */

 #include <dt-bindings/interrupt-controller/irq.h>
@@ -53,6 +54,78 @@ soc {
 		dma-noncoherent;
 		ranges;

+		gpio0: gpio@3020000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3020000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porta: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio1: gpio@3021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portb: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio2: gpio@3022000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3022000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portc: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio3: gpio@3023000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3023000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
