Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE90C64E8A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 08:04:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49EA520872
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 08:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49EA520872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pXmyeHiQWauj3DyWEbteQOLXnwiCV3QfT51T+JvVr2k=; b=LEsLXOZBNC4FJYfvr6887QTDz
	B2SVaSVPQZT6dl5sFnbvtKc7T0Zv1qhGP5K23BcQH0OnAaFuWi3vAH+iYGa3N2353c/6QMk2pb8hz
	Y1JSvN0pOkwon5UmA1Juv1BHYr2zAHmtZtYQfU0rRu2lWbWFibNYSBU2vlkfHNINXpHSvRw/tJnXn
	3mbW4t1P4bIyNbWES1+2BREwSVoq3tBVtuS7rQisum/8NLYrFnW4/GcIMqlp00D8sdlHoQRGbHIwe
	S6LFwHGiL6xXiX6q2g90pwxGnryJy/UaluiXdUR1aho9shHZwNx8EYZQeqUSsg2I8mQqpe39QuHYn
	XVYkslG3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkN7v-0002zR-OB; Wed, 02 Dec 2020 08:04:39 +0000
Received: from mail-bn7nam10on2084.outbound.protection.outlook.com
 ([40.107.92.84] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkN7t-0002xt-3j
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 08:04:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/2h2jKg4TGLo82zUNyx44CjbVS7hXRAUv6Kf+fMBcTdJKqnRWtRl0JEfLk4UORFCwP9icy1Lhpo2z4Xd0UQPsb7qkXsCCyL23CAE91I9swDcwFfI5UYTpWlXcyXN6/NBY8HzY5e4A8YMI1i3VCeN10YiZlaen2GRFBjBv45IX9qgkTteors1yTsb4ZOLuItk2wWv9isT1oCPSBYuDeTSDMiONWHp1BHMepI+PvjU52QbO40NUXHpDyNpo/i2XkaTN2IYfpbGWI+IBWKQj4ogYNfsApZjml1lulXSDa0fzyQ4fYDBEHJIX+0BPSZ7muU7tfYY2MSCamQb1/tjzeOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=595i8qYAJj06O7chMo9vj+g4CoeMalJrgEeFxCtIp2E=;
 b=d6oruZM2NTEx3AFaAkBCzudsgq3UaE/dSwTQelE38fZiW7EKr7Gy4eiZ9gt/qYFctBonaS+RpPw7PxckXS9WKu5sMK5rjbAUrihptq8mf4zEqEC1hKGNS7MuGcRM8TvumnliToC1UOQFnLGHCQGKaYVMBFFQQafRRGzY10ZVlWlhsGvNpXMhPAlpB3kCRHty6zmP7fT0Ks4qpLwU1d9p21UqZnN2eDliOJ8B+iE3WS1V6O/Roo0Sh0K+IjFlCZSGpe8DOSLn/fJmpxxmyAywPoXX5taGsvpgj4LLuelvsZdiC5cT8q1e+zN0mjYPrspgvRdLdLQhPJ8ZRaPAt6zbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=595i8qYAJj06O7chMo9vj+g4CoeMalJrgEeFxCtIp2E=;
 b=lNuoiwx+H4ZifZUaY5VUgFh6FblUaam2UsUNLQ2edEuO8d+bfPECi1jfyMa3VNuqppI6u1iXSBacxEXhClLmaAU8Rxe9YWuH7B61TZWCi4LYVHS/CIsV5WwJUyVni2UIrQC3Wy4xgsQ2mEogyyimQlOJfCNHMXZlwckQqox96Iw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from CH2PR13MB4458.namprd13.prod.outlook.com (2603:10b6:610:6c::22)
 by CH2PR13MB3543.namprd13.prod.outlook.com (2603:10b6:610:2b::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Wed, 2 Dec
 2020 08:04:34 +0000
Received: from CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c]) by CH2PR13MB4458.namprd13.prod.outlook.com
 ([fe80::bdcd:2c1b:bf81:515c%7]) with mapi id 15.20.3632.006; Wed, 2 Dec 2020
 08:04:34 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 2/4] riscv: dts: add initial support for the SiFive FU740-C000
 SoC
Date: Wed,  2 Dec 2020 13:33:54 +0530
Message-Id: <1606896236-62780-3-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::28) To CH2PR13MB4458.namprd13.prod.outlook.com
 (2603:10b6:610:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 BMXPR01CA0018.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 08:04:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4329b155-3fcd-4bbf-4f7c-08d89698e835
X-MS-TrafficTypeDiagnostic: CH2PR13MB3543:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB354338BC4C79BDD9F551919682F30@CH2PR13MB3543.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: riAp1BmZ/RVMIJ4OS+awx9afGzV61kRCFdQrQ2EUdC0HD20nwL/fVvJHjbzB5jGpJ6WJbFsIgALJFkqMOwWAmU09OOLORHG9VVh685CRjpcpEb+ALBtxfHunQMlCUSZoeHCtZsXN5O4QWtpRdLPsRyS+1TpVaAo5vBWgWVf3mfr80JCV/PttvlOT63iEsfrhPQufGyl7pzUJcAoPTZDBPVrB2Z5EkQuGjJ6fz+oF9at+iwPcd25lQvyORK6qFs4003Dm6fdFL4DoEhOHyEva9BH1THPkuq1a3i2AfQKIJAheeRzFTMvRg7nC5oSHcsos
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR13MB4458.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(366004)(136003)(396003)(39850400004)(346002)(376002)(83170400001)(36756003)(42882007)(66476007)(316002)(66556008)(83380400001)(2906002)(4326008)(956004)(2616005)(26005)(44832011)(5660300002)(7416002)(52116002)(478600001)(107886003)(66946007)(16526019)(8936002)(6512007)(6666004)(6506007)(186003)(6486002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nwPFtCQ/et7OTvJB2Gvv5zN1+yU89WRT7hVKI3hNJexlL0g0Bdffvvgz8WXS?=
 =?us-ascii?Q?9L2VuYGaTJrz++Wh+s+Qnm92aP/mAFqPu6CnzuOUSnoU0qCIYSdzrx094oXv?=
 =?us-ascii?Q?dVdFOExlUwvtUYL4MvFM7kAFn5M3GHNNn/0bUwRGLkYhI7sV9RzLart+b2O7?=
 =?us-ascii?Q?5lhcRMrdlQrsOd3FkX+zYPfZ7fHo9SiyJWAnGC8+1TwzXArdA+l7Eg7ZBQdL?=
 =?us-ascii?Q?Sq5gz1FcEwgocHQZfh4I8zrWGATDP7r8DAXTsK+l3C5D9DZ3FkllOQrjPKgd?=
 =?us-ascii?Q?/SqwERQe+DYfc2l2ynM6/rvCWEvoTM+L7vGW51BF52fGcqZauJl3loI+Kx3I?=
 =?us-ascii?Q?NCktRcAHtVdXTnfX3Tz7WPJRLAMH0RKsjF8OIzHQvPMROOMXMsRRMlyv1Yji?=
 =?us-ascii?Q?fU+yD882+VcFw/mN/YzcFy5/kG1IHGbbwUpgFwA0sR3KVpcL6BDynqPtXG7L?=
 =?us-ascii?Q?jDs857v2ytLFZ2y/deCFKir6tz96T5YM3TASpEnSziftAHvSdKAVDNSMTmQ2?=
 =?us-ascii?Q?lfj0CeVutjREPlXp0NW3SuOl+rI/ibKcQCxqoKr4P7pJdHOhIDVozVE0J9FP?=
 =?us-ascii?Q?r+Qa/wAG5pio8ToC0Su3LCTzXto9456AWdMt1nSuyfT1cRw393XmeID4FRMF?=
 =?us-ascii?Q?uSSBaJEcXsgUpwwXrT8ddCXFCHBRdQRWxRdgWZTtzybtDKkMyuvRC8NyXWYl?=
 =?us-ascii?Q?CPPypg3YXCdHuYdZookuZ7MfMRD09MQSq7JQ6bZfbhzG8hwMmBthZ3p/fOJa?=
 =?us-ascii?Q?wb7o/ObhFApyhrBteGYE8EjETrM3imbHDqiC7eEF55qoADhZgNMujAjw+aeu?=
 =?us-ascii?Q?SBlAFyljF8ASTdOKXYDWTYqz30ReJbRbZ2cBuN8gO31Xyo3zlKcX+oweVxZP?=
 =?us-ascii?Q?hqLsSSYrUnUJrTN8hd4SO11l3fRUI5/Dr2D59mrCxxhqHBySv274LmtAjOxK?=
 =?us-ascii?Q?D+ESrEZ7ih+wLPiayEJwDZECc+xdj0cdwkBa7HE9LX3SQxOv30VPLHIgTQF/?=
 =?us-ascii?Q?FaqT?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: CH2PR13MB4458.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 08:04:34.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 4329b155-3fcd-4bbf-4f7c-08d89698e835
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiqwU1My63XLhLnOlA6ZO7cRYXg/nHzj4ljWXXYmTE4KlPnHldHNbQuhYBuLA5nZ0dAQNzgXkKPHNuZpij3fLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3543
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_030437_268320_83F4FF1E 
X-CRM114-Status: GOOD (  13.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 sachin.ghadi@sifive.com, gregkh@linuxfoundation.org, broonie@kernel.org,
 paul.walmsley@sifive.com, robh+dt@kernel.org, bgolaszewski@baylibre.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com, palmer@dabbelt.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built
around the SiFIve U7 Core Complex and a TileLink interconnect.

This file is expected to grow as more device drivers are added to the
kernel.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 293 +++++++++++++++++++++++++++++
 1 file changed, 293 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
new file mode 100644
index 0000000..eeb4f8c3
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020 SiFive, Inc */
+
+/dts-v1/;
+
+#include <dt-bindings/clock/sifive-fu740-prci.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	compatible = "sifive,fu740-c000", "sifive,fu740";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		ethernet0 = &eth0;
+	};
+
+	chosen {
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu0: cpu@0 {
+			compatible = "sifive,bullet0", "riscv";
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <16384>;
+			next-level-cache = <&ccache>;
+			reg = <0x0>;
+			riscv,isa = "rv64imac";
+			status = "disabled";
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu1: cpu@1 {
+			compatible = "sifive,bullet0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <40>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <40>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
+			reg = <0x1>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			cpu1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu2: cpu@2 {
+			compatible = "sifive,bullet0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <40>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <40>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
+			reg = <0x2>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			cpu2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu3: cpu@3 {
+			compatible = "sifive,bullet0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <40>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <40>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
+			reg = <0x3>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			cpu3_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu4: cpu@4 {
+			compatible = "sifive,bullet0", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <40>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <40>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&ccache>;
+			reg = <0x4>;
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+			cpu4_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+		plic0: interrupt-controller@c000000 {
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			riscv,ndev = <69>;
+			interrupt-controller;
+			interrupts-extended = <
+				&cpu0_intc 0xffffffff
+				&cpu1_intc 0xffffffff &cpu1_intc 9
+				&cpu2_intc 0xffffffff &cpu2_intc 9
+				&cpu3_intc 0xffffffff &cpu3_intc 9
+				&cpu4_intc 0xffffffff &cpu4_intc 9>;
+		};
+		prci: clock-controller@10000000 {
+			compatible = "sifive,fu740-c000-prci";
+			reg = <0x0 0x10000000 0x0 0x1000>;
+			clocks = <&hfclk>, <&rtcclk>;
+			#clock-cells = <1>;
+		};
+		uart0: serial@10010000 {
+			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
+			reg = <0x0 0x10010000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <39>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			status = "disabled";
+		};
+		uart1: serial@10011000 {
+			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
+			reg = <0x0 0x10011000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <40>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			status = "disabled";
+		};
+		i2c0: i2c@10030000 {
+			compatible = "sifive,fu740-c000-i2c", "sifive,i2c0";
+			reg = <0x0 0x10030000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <52>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		i2c1: i2c@10031000 {
+			compatible = "sifive,fu740-c000-i2c", "sifive,i2c0";
+			reg = <0x0 0x10031000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <53>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		qspi0: spi@10040000 {
+			compatible = "sifive,fu740-c000-spi", "sifive,spi0";
+			reg = <0x0 0x10040000 0x0 0x1000>,
+			      <0x0 0x20000000 0x0 0x10000000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <41>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		qspi1: spi@10041000 {
+			compatible = "sifive,fu740-c000-spi", "sifive,spi0";
+			reg = <0x0 0x10041000 0x0 0x1000>,
+			      <0x0 0x30000000 0x0 0x10000000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <42>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		spi0: spi@10050000 {
+			compatible = "sifive,fu740-c000-spi", "sifive,spi0";
+			reg = <0x0 0x10050000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <43>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		eth0: ethernet@10090000 {
+			compatible = "sifive,fu540-c000-gem";
+			interrupt-parent = <&plic0>;
+			interrupts = <55>;
+			reg = <0x0 0x10090000 0x0 0x2000>,
+			      <0x0 0x100a0000 0x0 0x1000>;
+			local-mac-address = [00 00 00 00 00 00];
+			clock-names = "pclk", "hclk";
+			clocks = <&prci PRCI_CLK_GEMGXLPLL>,
+				 <&prci PRCI_CLK_GEMGXLPLL>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+		pwm0: pwm@10020000 {
+			compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
+			reg = <0x0 0x10020000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <44>, <45>, <46>, <47>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+		pwm1: pwm@10021000 {
+			compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
+			reg = <0x0 0x10021000 0x0 0x1000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <48>, <49>, <50>, <51>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+		ccache: cache-controller@2010000 {
+			compatible = "sifive,fu740-c000-ccache", "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <2048>;
+			cache-size = <2097152>;
+			cache-unified;
+			interrupt-parent = <&plic0>;
+			interrupts = <19 20 21 22>;
+			reg = <0x0 0x2010000 0x0 0x1000>;
+		};
+		gpio: gpio@10060000 {
+			compatible = "sifive,fu740-c000-gpio", "sifive,gpio0";
+			interrupt-parent = <&plic0>;
+			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
+				     <30>, <31>, <32>, <33>, <34>, <35>, <36>,
+				     <37>, <38>;
+			reg = <0x0 0x10060000 0x0 0x1000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			clocks = <&prci PRCI_CLK_PCLK>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
