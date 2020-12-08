Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B29C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:57:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CA423A7B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CA423A7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pXmyeHiQWauj3DyWEbteQOLXnwiCV3QfT51T+JvVr2k=; b=wlH78L4aZxZWSAWhwoTnJO1mJ
	QkscgMG2Xx4a4vXSZ5O4QRiReeC1bCx7DCik07tcPxcJvmrg4luX0bQAMyAeDjgC07zkOvhfZpKK2
	R4KezqgufRKWctimVH7ZITnwijPmWnde36kHWLooPJOq+raTHxP6qJas0s8iIazIaWLZUvCWfZxg2
	UN4+j2RJnJcaT/y6KBIqHmOScvVPFIO+ezL2idzghjj9klmqFF9NsWvCNHlya/QlRQnQV/XZSF8lI
	YRGl2yxriPFazMkAHcVHR8KKRwAqy8Y19pjbbSm9sD1//jCaRvAsCPid3K+kUrDBKjuvezpZw1iFx
	MFXjN6r/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmV3W-0004EC-F3; Tue, 08 Dec 2020 04:56:54 +0000
Received: from mail-bn8nam08on2067.outbound.protection.outlook.com
 ([40.107.100.67] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmV3T-0004Cu-Q2
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 04:56:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSQgkpVRiiNhGxHZuNgAIqY0rMQ1aFQxdtowdMa93cOFl050mIRTBP6+jAjMsfpKk5zxqavLUIYtG4kzh/HtDERI/UZZ9W/p3EETR2mWAwVE3RRViUTYOrmTkplakRf3Ep5fj1//sHiaLcK0IeAa5ArdrBn5yYV8d7+rXXuaHffLv6RTbkdO88vB5WTrQSvGtU1XPyb18TbKQoXaTrT0uULxUpHnqrmGd4h5jiiCVZj3vUK/V08o9RxbySuC8l596/wMatn5+871wBlkJ2bx5z+hNBlKSEkliZcBMlhJ+0Cgj9sbiIS29Epk5CDiB7UfWbXqr59UJACX9SXEXoC+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=595i8qYAJj06O7chMo9vj+g4CoeMalJrgEeFxCtIp2E=;
 b=Zz6lagCsqfW9etPAKNR9+g21dVEe4DWro2vbNc6no1E6vlU7+5wrf3jyq9A2WhoMSEvtbq8hFU1XoisiMLjRXM5sst/7Q5V1/rNYrHr2FlgZSbF4/bVplwsCh8ZjvRyNjsnE5petCHfF9cRyuKOEUrgTAWM7sV0TwRpe8zgmiyJYdnk/gvhP37dnrYZ8SpAa352CiMst/4N5BOfaD63LhvOMOReKy0WmEHEW/4gGDe9vJOBw4w5a450Vo8v0aIPXczOa9Zadl+mDCvrv1izJa8GMjzPe/Xe1sou5LT0voR6LTBnxTmtAhYQCF+8mDdVAh0X8jBnS4h2Wh74vKsZNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=595i8qYAJj06O7chMo9vj+g4CoeMalJrgEeFxCtIp2E=;
 b=mTZ2SxGmxU9GMdpzieHwIsLSlbgE6WVxF+jWizuZn3DR7xZ/TTiM+NOmtX33XdCRTNKNFetyiqRnS3tYtgEOnY42U/9giJpR3dwSUTKnnj9Ut+PBsUy9XeSyg7Zx8ToTrTpgGJJ8l7TKPRJ6Pcgwc7m+CjaGvhQmWw4E+PU4YYI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB4440.namprd13.prod.outlook.com (2603:10b6:a03:1d2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:49 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:49 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
Date: Tue,  8 Dec 2020 10:25:39 +0530
Message-Id: <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::27) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 04:56:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e844ab-8c93-434b-4073-08d89b35abee
X-MS-TrafficTypeDiagnostic: BY5PR13MB4440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB4440009FAA6E9DE75220C84C82CD0@BY5PR13MB4440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7a/ByBO1LwNlQk2qhM5Hu8pnTl7Mt6yF9NBvcf4Fr6StoMIGMwunkEwsff6ZbfS2g12uVp/94kUY7NKeFmdggU3lVeRw8XA+70TN4e/Lh5GDq7245mcV06lNZKY58g1TEeRJa5lOMcN/BY8ANO6ueCfQv7WtLV+IYIAwGQC7+jfQRfy3r5thUs5OM1vjMBQNjyKqSP6I40bNUQNdmIQ4u9TOxFZxZagAzqoagl/mGLxLYvZD96rEI5bxVzrf3XQvlVeJddmG85i1xv1XVLPVNdSvrrWcED6pVrLPCGpiT8usiBiUhOE586T7gg2Lop2a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(396003)(376002)(39850400004)(366004)(136003)(346002)(52116002)(83170400001)(956004)(5660300002)(4326008)(107886003)(2616005)(26005)(2906002)(316002)(7416002)(42882007)(44832011)(6666004)(83380400001)(16526019)(6506007)(8936002)(8676002)(36756003)(478600001)(6486002)(186003)(6512007)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gsRqDePLmf72SoMh8GQgdf7mjZ/z2K3751FPmXH0yIdKQ+A+3PDsMZE+on/M?=
 =?us-ascii?Q?Q67IG1+SdwSMamkI4e6U2LF7AqUFpx+S6cGjnwP9J8QT3x+AQSKduF+41x7C?=
 =?us-ascii?Q?SZRGR0zamiQD9uqATgCe90KWoRK41GEMCH2dAn+SFBLkgpDSe6ezKeInBObI?=
 =?us-ascii?Q?E2xGa8OC42+8Kz2ouYFw6qpd74ldbPtNEamKks1gqsPZZ4pAcgdayB3pnE3v?=
 =?us-ascii?Q?nH8pCeEzg/93g9WIZSQo/AwzY5na6yqRWtMc4W3+Dc/CCI0HlqKjwCid+SaD?=
 =?us-ascii?Q?25Bx4XVqAORgXjXpPerxWL37z3vSfqxKluIVm4RzU0ZPtoftWpPQyUWEEPHw?=
 =?us-ascii?Q?smuTIax4bOgPYHo5bDiG8Ktr4S1y7ODf42S4s8IxwFuu5ERXQcH7uDJ6Zczp?=
 =?us-ascii?Q?xaBHqfRiT3OOqDUHZ2AYuTeGZE7W2Y623si8revzzSMbfUBmLXAPSXSeGRpr?=
 =?us-ascii?Q?OPnpvqIDJz4GLExO0yoK3uwc8gQ6a4ypoeIs42v86DCkBpfep998gst0kXZ2?=
 =?us-ascii?Q?jHaew4MKHUCaFdVHS//py6daW5kInzKRaxiXSpIj7+zVTYEGYF02Rq85y76T?=
 =?us-ascii?Q?TkKg8mWz8sJp1uKOulosNYTqzCx3lvklUZk7o4xIy+7aKrZ3T2vuadra/5nc?=
 =?us-ascii?Q?+HUnb/6wqHJ/qTV8DBy6/8xjtIDN4FHmsdqudNSLx28q/0vizzDPMAjwWBGb?=
 =?us-ascii?Q?0yIgnga6GbSKfw635nxUXac6qf/98i+k8xGk0OFynRh4rVDa6u1YMUripFFa?=
 =?us-ascii?Q?Dl3od3glUEnyTKn36YOAAlP08kLflj2VvxQuu9hP675SwQsfZgftlnICs79+?=
 =?us-ascii?Q?7kX+PTBMO84N8w73889CYNkWgLBIFmkxxf+U/+12qkYXrBUqytIRkrYNd0FR?=
 =?us-ascii?Q?ERNJV0OZTmPnOEa/My+l1xjwfJZpt0SoGgFNZZWaYcUUmSYkEyTz6ohI+iue?=
 =?us-ascii?Q?tia007qI6t4m0RQGrnJYty9+zCNACjTgP9eD/YWruAq+BJLCpBukJ6sw3ymE?=
 =?us-ascii?Q?qCeO?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:49.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e844ab-8c93-434b-4073-08d89b35abee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lsmj6f7qDL8QydwNf+Oamcezpl+yuFtjwqoWoyVXBB3tjG39Y8f+FIyF0FO0/rxAQ0GL0wdtRCT0il7B/QCmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_235652_044571_28BFBC00 
X-CRM114-Status: GOOD (  13.48  )
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
 gregkh@linuxfoundation.org, broonie@kernel.org, paul.walmsley@sifive.com,
 robh+dt@kernel.org, bgolaszewski@baylibre.com,
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
