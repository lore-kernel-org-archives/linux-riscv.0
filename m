Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350E6CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuMtTHfanA5VM3LxINxJ8ph46+YOi8+AYZLc250haz0=; b=zhyYUCftndRIzi
	NOntLUuwGdZdr+RYtW8gt6HbSnww57+kL4MJ9wXE2TZNJn0HDP54DvBLBi5Nf1aPK7eYm11c6vsS/
	U2eSQFRXknG4FIrgJbCvxoYPnl+P6r/jXX4njqq/cWCECCFnoAuDRX6aTBJum4O143bihGsWfUqq0
	s/JC9nmQewWjJ1wqMMOfm8ZEtUQ6y+nOes8e7b2rkVAFea5Ovgqhsz+YJ0IrMpl78o/+j3B4vNdwC
	ft6O7nwkZJCGi9tW+fCb63Zux8D+GUucKjZDP80j0SBwgTz7RJui6LcSKTcf5BV2F/Y/qby/PYXqH
	+xNr7kangL9QCapsBM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJCM-0000000H1e7-1bCu;
	Fri, 07 Nov 2025 09:56:02 +0000
Received: from mail-bjschn02on20710.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::710] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJCJ-0000000H1bs-3No0
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 09:56:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4fZs09Z/S5IBoSLEcoNwGacGAQyUV1pHoKLRsmthPpcSOroGWNJsBCmMjpSKZzut6/8GILdJ7/YbvS+/FpTSBNFcKAQW8qzIB1vnBN4vc83dPlBBhOAKQZfLTcvFrXYue1kIjUaSbtNVtms7ltUDnGtCA7ptAN0+uzNpLNcPf9ctlClPsn5tRok+/W7d0eTv66/Cj2znPZNh397nzz2o/LPRAD++R7VQR81+NTFLhD0I+na0pGazj5rMqCOSS0dLFE8r4VLMXFso3sCZsQNY9ur5lWvVZEGfX6KoBoh9RDcYqZcghLMBD4nQGDRgJ3PIn/cAZFt7jzYr7bVrqzA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf4kqQuHDbwJ71Sfz0JWkfJUsoJ8ZnctFfRDLAakt5c=;
 b=ZrNspswwWNVR0szaVgKOD1SAZq1V1Y6c+RCDS/hcMBd4jSn0xNsfth1n5vVr6Lzb4U/gRs0eH0y/XmnFWBda2GO84IrynmFuuP7wi9f/Lx0cdEmqztq6MT3Eiwx6Xyf5TGe0YStSFXFuXAgHVSX2t5E5FJSCTyg81jIUNN7cOYkUHJViYYrlx2vGC4P4DKiyyW6DXqNY2COAUbCayeVlruCFUjq3tlnd9kYiFYddiTi/t5h8c0DHMd1pQZYQ+MLYVRZSfP86GO4jMvdGB245xjOG0PhA8jEgEE8gZJjlLGQkyKGhZDLpi7k1rvrVxbQqrLsWkYHhQ4zRzInIAnBo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1305.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 09:55:46 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 09:55:46 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] riscv: dts: starfive: Add VisionFive 2 Lite board device tree
Date: Fri,  7 Nov 2025 17:55:29 +0800
Message-ID: <20251107095530.114775-8-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251107095530.114775-1-hal.feng@starfivetech.com>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0014.CHNPR01.prod.partner.outlook.cn (10.2.0.83)
 To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn (10.2.1.78)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1305:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac73d76-3dc9-4ac9-c9ef-08de1de3d2af
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 63+yPJKYnf29w3HkUeosojTfLS/PhRe5CbHZ49jmYED6eQ1oMfuaIItG9g00wkz8R4pGpb7b3/nDbSkH5EqBgRdsZyzV845jmxtNNMKe+j6Kbg33dCGEtjcr5y4Pref+LDzmH2m/684VinuMmQzV6iFdK5c3GoTYAc9G/+vGHlJOcOOzfX39RK+oEeQVz6xmq7m4I7oNvjRsEUsT3mz0dTZKzEQXDz45HgvRh2j/xYPzDNXVdr3g40DZqP3otg8kVxC8JQsWgwv3cW6oLREHArC7sBKaPmDu3f74zE+0AhwfrK3dKsehe0cDYnknthZ5+Xl87UsiwR8DwGsNwPvgbGU8LfeRfIMaV9OqbfO3/6QjsvZQbxzDKvhyy+srdZJzgPq+wABRDnrwadEsRi1ZYAJ2o0lRV2HBE/Prc4BHkxJIL5A7/mvVwBMJKSsmHiPFHDswknBl7ip2fV500Jl5TcCfv0Pt36Y4vX8g73n7jvVNCMO3sMMRShZeSgo5yAEkRFU/bGnsbPWXLx4weEZmBDVYOzDNShodBBYQE0c8MIEIyvej4jbwX2TF8m1W6NUyezfZtl7+JKET7rbb2zVEEX3rpjx/oQqn7nUCEHPuS68=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5XTkhdGl0oeLjyh7tV3VO8UI1/rdE63susoZPjnfI2dgwG37QYDrvqGXMJaS?=
 =?us-ascii?Q?LcBhxrIZc5r9F7r1nZLGiTRm/P3IPwuixGqSt6Tg2LrobYjsyHpAAx6tPXG9?=
 =?us-ascii?Q?vNcfzQxsRXcNHnMNC11VFxbVFiz+b2S7BmoHE1UHKL5C43CHrbcOUCF2HKn8?=
 =?us-ascii?Q?SuQCnaqLYCjICgMLmjVPb/ivWLP63scnggsGxYMh32kWOE64eaLXFU4tsBYB?=
 =?us-ascii?Q?d62l2EOtS4oIwi0guSOMb/coCWbZc97ZMqxpBkG9rPqfKGTxl+Pn1P41CHT3?=
 =?us-ascii?Q?QRBu1Oopk2DKDeJY7yVdtS7HmQ/eZcgYRtQsRjuuYd/b18vtDggC8mXF4evA?=
 =?us-ascii?Q?UWClbnPYekOJDfgtHzVQFMCTvZXA1P2Z8pU+Fs4sf5rVHWxBOx36w0aI0zJm?=
 =?us-ascii?Q?Wz52DJLCJG10JxhZdML0N0bJZBX2+Mhy1PlzEXkJVB2yFtIfmJSyfG4MAe2I?=
 =?us-ascii?Q?4soCx7XMmsdy0VTu62JtJjrYQuxSPwVmd+E5KMvNO3+uvjMV8LFGxw5jxtBf?=
 =?us-ascii?Q?0AQN4TlXqn0NbaCdJZZpAJfp1pb+RKRjI5H3L32F+SndOoxxsc4XrTiyzGzt?=
 =?us-ascii?Q?Rzb5Qqbf74MJJ+fvpql1LHPB8R3CJYumxrr/yf+yHkYu8jyfgg/VWaVBpdl9?=
 =?us-ascii?Q?/1/+FXsIYiXvjjBZrUGKMLTsb6pIZ8f9QVktLr5CWUrMSBguBIUfMGJ5tJDE?=
 =?us-ascii?Q?Y3SX4dRSS6lKo8sZ5LkT6YL1xZ2x2Eq31ZZpiu+YicR7KIwklmA/4JOUlWMl?=
 =?us-ascii?Q?OFUSaQOxLzZe2OegicXzUVeJbRZ22Z0Ahzl11LvSXiJskJrovptb99E5OIKD?=
 =?us-ascii?Q?YA2BUOShO0AYkGyd/rNilr8N5O8tcj0zJP8obRsEWYMfgfRGjZ2h/KBXBTie?=
 =?us-ascii?Q?7k97OYRWPQh51jlSQhynY0n5mmXtYj0J6Q32a5z3/BGBCAwAFw/Nm3Gp3gyt?=
 =?us-ascii?Q?KPETA6Do5MtwFI0u5CpEilS4fFU3eVB0QLJbUGHm1IbJP9Z1WuRoqs+2V6HJ?=
 =?us-ascii?Q?ezBHQJw8o9I4wkxXqgpMah/DXCWEi3X4a35rVQRXmjXUbYPFmUKpx68q9QNu?=
 =?us-ascii?Q?wAnredAzTw5aD1WsjnCM8HtUH5n2XE32I9+NDnC/IChPcXrAmxt4+eCv18rc?=
 =?us-ascii?Q?tUY9Q00AGp3WhWkdX+YosfV4xRiFVmIPVO+3TWs4OROe1o47VBzjpfYPKzNy?=
 =?us-ascii?Q?dNRfexZiU5fNLOYfuJXjsS/VJ31Ipubb6ksbEu0cdZWXQhX77AbzTdOQKwrC?=
 =?us-ascii?Q?tpPta5kJ74klyRpcVgaFo4gorx9/9pOQHIpYn/f376ngiwtg5hNpXG483LBU?=
 =?us-ascii?Q?2/WrwRqbNQOODltCtftRXsqyWoWEOMMmtPDiqb4AfAfRMqm42nUqJTT4pGLc?=
 =?us-ascii?Q?8Lld1Y4O+jR9ehmMaS5Rw2v55ZErMNUPMBOFHJN70uq8qusrWNdwdd4SH6Tp?=
 =?us-ascii?Q?3FoGZ03JE9ersCGH20bi1JeMlw39vySxJHV4c+NSLHgsR0+41XDz9Dqqb9vZ?=
 =?us-ascii?Q?HrM5NSoSR373VPESigs3v9IQVT9+c3lLbI6apF2Tp47OljJ2qwpxMk8Y8fFK?=
 =?us-ascii?Q?k7yWYkO+0PULjnPIOQdH1/uATBa1lkUxKj5IKOsqvf9zxxlEDOds3/qLozdv?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac73d76-3dc9-4ac9-c9ef-08de1de3d2af
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 09:55:46.4063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6c+bSh2bncwuh/QB8Q7CYqtxr7z+wGqWNYgG+6fpdC7gK4iobDPz64HTk6295NnLZp2+qNKUT5lW+1z6SFv7IAYxbQQsIX41s9Kt0vdJbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_015559_845589_91B04151 
X-CRM114-Status: GOOD (  11.08  )
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

VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S SoC.

Board features:
- JH7110S SoC
- 4/8 GiB LPDDR4 DRAM
- AXP15060 PMIC
- 40 pin GPIO header
- 1x USB 3.0 host port
- 3x USB 2.0 host port
- 1x M.2 M-Key (size: 2242)
- 1x MicroSD slot (optional non-removable 64GiB eMMC)
- 1x QSPI Flash
- 1x I2C EEPROM
- 1x 1Gbps Ethernet port
- SDIO-based Wi-Fi & UART-based Bluetooth
- 1x HDMI port
- 1x 2-lane DSI
- 1x 2-lane CSI

VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2Lite/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/VisionFive2Lite/VisionFive2LiteQSG/index.html
More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite.html

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/Makefile         |  2 ++
 .../jh7110s-starfive-visionfive-2-lite.dts    | 20 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 62b659f89ba7..f53109253d41 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -15,3 +15,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-lite.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
+
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110s-starfive-visionfive-2-lite.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
new file mode 100644
index 000000000000..ac5e66027bad
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
+ */
+
+/dts-v1/;
+#include "jh7110s-starfive-visionfive-2-lite.dtsi"
+
+/ {
+	model = "StarFive VisionFive 2 Lite";
+	compatible = "starfive,visionfive-2-lite", "starfive,jh7110s";
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_HIGH>;
+	disable-wp;
+	cap-sd-highspeed;
+};
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
