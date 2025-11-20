Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C109CF64A2
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuMtTHfanA5VM3LxINxJ8ph46+YOi8+AYZLc250haz0=; b=kdhLBh6N0OXcWf
	JTfXDbsrfbxpyPyyk0uD6rgX8btl9WMH69KCZtUwt9vW7IBa5V1eGnrO6u/P/nZS+1rqMQPFBcbzJ
	KnN7GOePFza7UODhsMtqs7XRNnAsKw30u8YTIsH/zUzLV1zOtjm9buZwPOgaIBM2R2yLU6jiS6MlG
	hByTMqS+2/HEtObTe9w2Q8is6B7/hrg+aBu1qo0SpkwMBBr0F9MYn+v8MEBqI7C4/38P5drcxsJ5f
	iGNcB3B+A07d69xNmumWXmf66nvLCeO/JaJq9J5XGlw6mRCuKatqlX8RFgI9lSi+WaVa9Ys46ABqN
	4jKBNNFXZHg6tNVhxbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM03T-00000006M2V-18ed;
	Thu, 20 Nov 2025 08:30:15 +0000
Received: from mail-bjschn02on2093.outbound.protection.partner.outlook.cn ([139.219.17.93] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM03O-00000006LzI-1Rfl
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 08:30:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOQ8FmFOCMtk3iypLSgKVAeQ/EadDxVCOfffvebGF23/KJnplQjmzD9699yBckCSYucmV62EBKCcTi3/alu9Gboon4+lQZnyaHvLEjCKluCBdwTbYsJJFAbrMTA8fErXbe2qF4fAjKRPDppkfsLCqivUoKEGxEfl9/Bp05AzI9iasNupItOHZy1p3Ta/SoP805pTzglTL5vJ6sqWRmIHoW6Phq02/SaBq4ulh4e1tU0YSX+nQzxD2/BWpEYJj635aI75Oc7hQ301IECWdHv7XYM+fhF7JaZdAk5ZjY5jU9DcwFxr2WLuxCSyT+n5YWeK5jemDqgv4qWfqeC32/LiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf4kqQuHDbwJ71Sfz0JWkfJUsoJ8ZnctFfRDLAakt5c=;
 b=Vjrjl5Jrj+XgBhaSeUu51wl3GK592Q+wpWiU+7FZIcd2wqa+OYqIi1/gANstYGNJjBaCrmySPpH4rvu6FDRfDTTjcSZ/QEIG9TqSa5zrMaEKwSaFxpj8tGeTATW4Q3FUXR/+hpHds0hhhlvUPLVZzQhnTTFFaz2c9bS+SCqSHcgWWCnrU6wDoUz7BxIsMrmhFwkEtsdHoaBZeNCKTrPyZg3yPHibl3yS5Pi6mdTzItFfHUNU2GEMpZG/lCgyyOl42mWFZIbkcu4QCLkwjk3s+IH4Qu7BGzfBFTrmgIAWyD8JVNKv9umdC4juCu++Od+eXVxix59Nc/p5SSszWIh+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1275.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.24; Thu, 20 Nov
 2025 08:30:00 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 08:30:00 +0000
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
Subject: [PATCH v3 4/5] riscv: dts: starfive: Add VisionFive 2 Lite board device tree
Date: Thu, 20 Nov 2025 16:29:45 +0800
Message-ID: <20251120082946.109378-5-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251120082946.109378-1-hal.feng@starfivetech.com>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: SH0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::20) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1275:EE_
X-MS-Office365-Filtering-Correlation-Id: fe00dcc4-d769-4b06-e1ff-08de280efec0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 0RJ08LlNjYWgd1VYxcO5hdfB9RXHmb4O+EsqSO9gmKohrj6poqZyU70GNwirY75DHrOVHw7zUZPncyLD2moQz7eBd1aA+MJF6JXO7KRE4MzqqHmElQGVdirDrOqi25rFYTWXOHYBvj2Q6B8J9JyiOiEBmcSkbo1YhI4DWJqkjPKUq8t08LsKdaiA0r6B4I7f67LTO9KkkkGjTwIhh0eVS77J4ytN2OsC17ztRoZftU2V6wXGGEainreVIbUD6j/DTdspDDD2yqaiMzXBf8svIUBqYFpixhJyfIc0nlkiTt5LHoc4Y3E/9JcsJPDzJTGGALn3xRJo/gc98pIZPPGSK8CxfnJPCzZ/a/2LW5yoEP9NgQnXlxN1Wh1fhF/mgKilWDTxFBsiXXekkIOltDr9aAj8O5OJ5dfnPuoo9623XUrGJR9499qMytYC4+wYkDdWpvG/yk/QhkIJv5Fh8KDrbk1pnbWSyCU3/xrndqlNZbvFHJg+Y362n65M9LjZquC5R1Rm04+RELV+M9pXQiHwbpJYTqUkZAzCz0zalnSIGIzU8cnoTYKEKXXyCs1kWYT0Ut91vz0LQEoh6xRPa0KM1YQL8exH2nmehcCpbKeSrnY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yR0lEsqYtFPWuuGU3CTyWz6Lg/xnfl1itLfVa9vJ2ofHrH3+MwwKF0N0HD56?=
 =?us-ascii?Q?jXb2EF5HgEWX5EjDS6hhfVE9QvhqtBeFAbMyVDyTAhMBABbVvNw3Bil86xn1?=
 =?us-ascii?Q?abYbzJq+Fu/TLua0RyHWqhw3dBxjAS3FkwhiY4NKhbsrzFes7Vp+Wse6H5LJ?=
 =?us-ascii?Q?EOtLO1bomkgkK0v1u8WYFgfW0Cde4pYBF9BXvGqYTWwh8sHLVjefewlWOox2?=
 =?us-ascii?Q?ryAvuhj6UhY5Xj8DC0vaeyNieyCdO/IAO5iIg+YBclUigJj9nIP60f8YyDUp?=
 =?us-ascii?Q?ipRENUb9GVPvDNOuzCTmxQ5ChZ4Y4x6iU4rw+/+bA5+TwpprPJ3FDwlRoKbo?=
 =?us-ascii?Q?iBGnO8WuXfqmS6U5qliQRxNqcI4Jry6J6WJPcfBW2sLSd6m7vF992gS74uHI?=
 =?us-ascii?Q?4s4iRh0eD6asjAsvbk9oiT+Y17++xFs5Vuk/DIt2bxKWeGpQbfeBidemv1lO?=
 =?us-ascii?Q?ndgB76KX6cAW+ol9wPV6Hl235C3V41shOYt67+AR405Y3bTNlE/PtqwJIS58?=
 =?us-ascii?Q?PFzXwEeCHp/ZG3e0gBL66CDn8Ln1Eli2xc+AaE8aiP+Ga5o0WvHOq6X4oEM9?=
 =?us-ascii?Q?D8qLugGebchUuJ3zFzFNriVPv3qgXJ87HBBg+rB5m8B0N4Cx9tRudmsXG4H+?=
 =?us-ascii?Q?BVF8RFpCGCJIrXqdhJs4U2FhKQHLsmfo2l0AEzAk6FK19XydtbUJYb9jURkq?=
 =?us-ascii?Q?0N4TgJx5Uoty1TnVsmuTOn616fRhQeMqB+DYiJ6KxCdKthiBuogzaBP7H6ec?=
 =?us-ascii?Q?kfzRuHcDwJxnN1J2KeOzQRH204K+z8hZ0rcugMjS/+AxwsNqIC+rD4hVV3zw?=
 =?us-ascii?Q?qkoLdjw2/tWWrL/7G+cN7Oojq6fMX873JM/YcO/k0+SEWklA7OLJGAxkQfkq?=
 =?us-ascii?Q?kzeqw5kOoQJVPhJpikEx4rfbfgXwAUUIRQrmOa2ANL4wM+wJAKnayLPgP1+t?=
 =?us-ascii?Q?O3pnRe3WkRmsOs6vs1QnOeq0HwookZVMvko5YQd7kcyxTHXscZEgDqZjJqYj?=
 =?us-ascii?Q?5D6pClhp4FZM1InSaAAqhtn+JzMr++DxvdUbbnS3UPZa1PO+D+Q53o8bnI26?=
 =?us-ascii?Q?dJK5As4PZVG0oRVGQXHQKVF91OqMwLbc3oiTRiy+B9V9VDAr2OmStUdcG45S?=
 =?us-ascii?Q?LxmrEY3hycCHVET+5lPDEXkg0vR6Uv3pQGQU196A5GtNt7JkDby4o0BXMAMA?=
 =?us-ascii?Q?5jLw5z6BVUYAf2WOb7g+wFFK32Qz9s/mWSkMqEYg1SXDb8PofMQJbQccJFTg?=
 =?us-ascii?Q?4NUWntSbuaUVUnIdTYs1TlYhJaCXd9XoLfKx/5Qg9hEC6AkU0wJuMljRhwi4?=
 =?us-ascii?Q?reJ3BXWIqSId1b2vstB6ezIiKey9fuE9o3Vk/hFbTl2IJaHofR5oSKO9QRhJ?=
 =?us-ascii?Q?d80R0sedcCSjzDY0Ge913KAu81Ep0DB9uVPCWu3inNe95b4HBfsoydAFDKUB?=
 =?us-ascii?Q?1nVzixH9M3akCjdGV6OwQsMPRoGlIb61neqEaAt7QSoWpVxKsrFcqZIwJrSM?=
 =?us-ascii?Q?gJtj+arCS6fA8BsA/AIziuzkrJV7F6ibOCRNpEpjiiz4IZSx9czPAFSMj1n/?=
 =?us-ascii?Q?eWinxigTxsKMF2sxeXCRjxxbF0Te3xqqGrIhNOSfaYIdsfOOJKRyz+GlA4qb?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe00dcc4-d769-4b06-e1ff-08de280efec0
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:30:00.2938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUZx60EfaSem5sf+kPkdWi5bKMZulAsee3Rd+TQEmKifDdDT+GyXM4azArpbsGtUwWcb0NjjWeikyI9yptgeUbved/uWIT5lm1RxwdNfex4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_003012_255261_901EDBA8 
X-CRM114-Status: GOOD (  10.92  )
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
