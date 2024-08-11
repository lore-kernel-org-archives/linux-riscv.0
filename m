Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E5AC531DA
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Aug 2024 05:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPJsdqN2rjPdnhep7a666R2OCsC/aJUOTunwXI3u1RQ=; b=pTv3g1DQ/32bM6
	c6ivGPRPwHI20q4fgMjr/XaThtpxanntvGtqcvNodUeCo20X/E23KWAi6ekY/LF/XFbzpXCVyfntc
	xABzFClMoPSg1jFFlKOc71WPvm2wpbnPwbbYXxCXEngjLU8XE/CiiaVXevH1c6IQGf/TP+TnTo28i
	ljFtdKKKC6uyGp5qEXoUzTtNLjgcfzDSuLny2Gp/GlgfWF+sVp9TN541jt3esdL2DXWS6T5Byapky
	4Wuc5B48Zh3h7JNcerKC/vNUMOXP9z+8BLoCuZXoAt9l8LV6+FfLNUGgp3bny97aNYY2jUvWSnhio
	pmOF+AElZ3OlC46+dLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sd0xZ-0000000F3fV-0c66;
	Sun, 11 Aug 2024 05:17:41 +0000
Received: from mail-bn8nam11olkn2082c.outbound.protection.outlook.com ([2a01:111:f403:2c14::82c] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sd0xW-0000000F3e5-0HCn
	for linux-riscv@lists.infradead.org;
	Sun, 11 Aug 2024 05:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETySH65oQC1UbLxCeLg5r2aBVk4ZPfZH9Ctm5GKl1yDstmEbtHI82pF2nlarqGy9L34URtjF7OEZYquOIkXPktbnio3tQgP2LmWz5KZDyxc1sRhDLmn37rtbdEbxNIIx8//bMja9hXtx45hFwNdY1YVKEvKVDKtop8O/cMDCeTVZOxIwEl0uTVeFDvV4D2jgig44LF9ouSlbBJTkexceCDAmUrTkodfYtqmmprZKtZPb6703G7VbR7R+aZoIOlbjPKSAFoVh06NpIMz4wlILkPMAWGnqFlxY6kHR3BjVYDhqxL53d/MzMUZVlLG2prAIwjq3tTBdSb88eE+cX/RBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8BiqYB/pmIIGwtoQCg80Q4LlvGH2VU5I5bg6jVgwmY=;
 b=q42R6Yie3E7BmyG8GpuZUguYVGxhKDqYpBQm9dw7i0W4VkSiD+OuNJRowiFWHANplBh7z8dPSDeG058GN+5JDmKaoCVMmkLBB075NdK6QRRb3uXuxHDUmld9Vs0aWt5SmOV9F8m4t39SasOs0jS1duEOFZKydvRdaeVDPjaatMMPWAd9c0sHTeUFC114Lse6d4+6QEQOWqwzdVreOEeZDnH5+W3sVucLL48O1X9ltahNtqWAFIZAy48Gnx7VqdT2/82JYQ26qkdG4HPVwfu4NrvHowBvllG/2auJ5WHI6qxQHBYSbjvUDuklXc+lF056EbhKA/6PKnwfARwtc3HxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8BiqYB/pmIIGwtoQCg80Q4LlvGH2VU5I5bg6jVgwmY=;
 b=rKvkhV0aZ9IjFRXQF4GYfpE6Ode5bszGA7fNc1/Tc63gGWL0geuaiGBPpOTvaYWbhaERep5HRD1QdRaNHOxabdTOeYNbPE/vCOCR5VD5TNGceJ9Vy3Nmr6njV/p5pJS2Wlac9ucg7sLPWGrpqTSWQxDmd00onM/Y+OWPE2zHwjofTtba49C4LMUQzFS42lCurln22jlEjBddb7Pt9A+/smskgenY5ZVuDlrHY74O3Wi2jytcAWvY/zLSa8nLi7K/rfndzHHLUmjQw+3L2dkGv4ZpsfdY7vmzfFe7Wmjk+s2pKO/r9CBAQC7rx9KGiJceYsV9VcRTFLTOQKRA6V6eRA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ0PR20MB5255.namprd20.prod.outlook.com (2603:10b6:a03:47d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Sun, 11 Aug
 2024 05:17:33 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7849.018; Sun, 11 Aug 2024
 05:17:33 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 2/3] soc/sophgo: add top sysctrl layout file for CV18XX/SG200X
Date: Sun, 11 Aug 2024 13:16:38 +0800
Message-ID: <IA1PR20MB495384C4A2F64AE100350BE7BB842@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB495324F3EF7517562CB4CACFBB842@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495324F3EF7517562CB4CACFBB842@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [2uICKqQkWee1iWMaWIOa0v1yIiLV9F3yHRuQ9V+HEtY=]
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240811051644.990577-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ0PR20MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 3424c54c-c8a2-433d-2d7b-08dcb9c4e75f
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|5072599009|15080799003|8060799006|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: tj1tzBt0EBMXLkrQpTfDyiere5uVMN9P05QrcgOk/odhzG69foYTaqLXdEd/SY3SI5kl9rvIAEWPYw3MMuJOzs3t7rYkj6FwNJrqyo5GlvFjF3Tu8oXtAxPZlYslnPdIfi9gGIXM6REHlzmySLNXciZMVulbXI1eUQ5/K3g5ztyaqOKslj7ZVjyfZthc6ouiAdD4EVocD6uAYFoHFU72Frbf+GpfEVeaAthR0ipCKljOSgpDW0Fiz4F5us8zHdJIy+nRPCWXPhKyLQmdj4tp8RlxXwStFKunAQ79Ya755rRtZXZXcDMlG7piPu/cRsEPt4/CXi91o55++os9jk9dSLHoy7/QfQXfKzcbTCTgIcz4a/7ejVKdzsCPVSU6Hyg1mCAO3CTHF24T4w4A11VLepoXym6e0YrkYvUlPWH5kk/AG/qXhZt3dFH2c1fQ588uwNhKHx+dF8VUYSzz0MuKVayWC82ACKWuwApYw5qYYU3doPVIcYZ4M4e36Womz5IHGVyVW9hXQTg71Y7lG3Kf3JPkn+/TiaYiwuFV1JMjiRDPyfJsRAD+1SVgZ8NT6xJYf+sxma/UULmLNa0zmptwmW7p69wRZzaq+HPJZ9d7kf7VZmbb+9LcojvUx0JbQLSxBDsPIjb6j3JdPXJy25KDkQdR4qRAS19S1v3urT9I9PuKUowWX9Lr8Lu8fERJc54iBSw8SM4LpBXz5dJvMRAg893Ie2oRucxJu38nyfQRUyk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u4e0yFousAlJRDSQTArvC+2D+i67GX0EEdS5tMth8sGJrhbGLpwjXaIE6NzW?=
 =?us-ascii?Q?6DP5hVRk62nP+r5HPWD/DTS1NYMJ5u6V00wfk6anVayrN+GGLTtafM5/VtP3?=
 =?us-ascii?Q?ISbO2L58lB1je1H3qH/fJ9Ssun/qtUrkgbYTRDKbBIB+5aQ3hgkbxcHmcXze?=
 =?us-ascii?Q?vQYmeYQ6xm7BSalJf9rOCjpwROqRkU2NPMoUKykU7jc8xo6yngTsMTBXIHof?=
 =?us-ascii?Q?RAz0UBI2f7fThkPmnpqCC670hqqyZRx6if8HNiFmyUI+/J6FnSK7kLWmfkPh?=
 =?us-ascii?Q?WUx5mY9nZnlUb2pe2p4nbU4Jn3s5iNA8Xkpz6xCwHB0Yq+VSogo5PYmMV8To?=
 =?us-ascii?Q?7aO8Wx6lUyFpNjTOdAcqooErNF4grGckToWGBe4qoJC3X99ShdN+X9e8Aw2e?=
 =?us-ascii?Q?vh+XQ2lwcHH2hNkHTI72JTSOiSdYpqI9qClDLiAy8SF9r3DXEgrAup7Ptd9I?=
 =?us-ascii?Q?OlHOezm7jcHHtSCY9hkS/JctQEwZymCiW7gsnyKUwxqVQTN13iIu8F8GuOn7?=
 =?us-ascii?Q?ZG+R+LI6nt2XLf66LsJHsJPoYovtFZrAHd9INuWmIt9HS4kqx6ZqehiOJgnZ?=
 =?us-ascii?Q?7VVCgK4npdJEuDllsR6Hq1IvAeuFO47yqtnbPEfp8w2Z7xRM1Ujdj+9bDN50?=
 =?us-ascii?Q?6Rrw9vQMyLWWQCvOhxvWXhHpcQ/aoqqw8GkvtETW0g4lhPjLwrwXF8+Oznmd?=
 =?us-ascii?Q?xQwoWkmE1O5WJ3cUz90Arc+ZI+GnUrNHD8xDkWAr2chwByFpc56+IYnO74QE?=
 =?us-ascii?Q?8esvWnBIH0eh6EWCzBFjYJ9louk6mEiTQ1dhKQwCmpr9fV5BJNS4nrfYkciu?=
 =?us-ascii?Q?SIamnVlOjsHZ+BcEkbs4aAnET5uAyez1la0+gpT8maJcWM5r3VslXbNDEbCV?=
 =?us-ascii?Q?iJidcCzfJkt068t0JknE8Glc1/anmDePe/fYgsZcAdbPhx7ItjkFJzJuCvoG?=
 =?us-ascii?Q?alyPrF0j7TaaLGB8eN2af86pH0yAlv8MSiVY+gY+lKwv1IRuXcuSxsnllaUX?=
 =?us-ascii?Q?G3PmaY3+LKJ4b2UMKUqvyuYU/PW8O/5CLIBeGG8VMMaqF4CM1ANM8EIKieTU?=
 =?us-ascii?Q?X3mxmms0kQ7Mb6gFfMlaM9LSeCk2T7N9e3YuBBPilC21Co3spIrMQXbVm1WB?=
 =?us-ascii?Q?gpQWopb1VFic8Xzs7soj905qDwY9xwQQ+gO0KgsIbfvX4lSpSyvztaIARA5Z?=
 =?us-ascii?Q?ojglwTRVrKOCwzFp8UbhD57kIvh47uG0EJa/lV7ua+UwimhdVjIuctwH8Dpz?=
 =?us-ascii?Q?X1MK+iEMQ3+pktLuY6vn?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3424c54c-c8a2-433d-2d7b-08dcb9c4e75f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 05:17:32.9922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR20MB5255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_221738_126450_7A8EE21C 
X-CRM114-Status: UNSURE (   9.16  )
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

The "top" system controller of CV18XX/SG200X exposes control
register access for various devices. Add soc header file to
describe it.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 include/soc/sophgo/cv1800-sysctl.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/soc/sophgo/cv1800-sysctl.h

diff --git a/include/soc/sophgo/cv1800-sysctl.h b/include/soc/sophgo/cv1800-sysctl.h
new file mode 100644
index 000000000000..b9396d33e240
--- /dev/null
+++ b/include/soc/sophgo/cv1800-sysctl.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef CV1800_SYSCTL_H
+#define CV1800_SYSCTL_H
+
+/*
+ * SOPHGO CV1800/SG2000 SoC top system controller registers offsets.
+ */
+
+#define CV1800_CONF_INFO		0x004
+#define CV1800_SYS_CTRL_REG		0x008
+#define CV1800_USB_PHY_CTRL_REG		0x048
+#define CV1800_SDMA_DMA_CHANNEL_REMAP0	0x154
+#define CV1800_SDMA_DMA_CHANNEL_REMAP1	0x158
+#define CV1800_TOP_TIMER_CLK_SEL	0x1a0
+#define CV1800_TOP_WDT_CTRL		0x1a8
+#define CV1800_DDR_AXI_URGENT_OW	0x1b8
+#define CV1800_DDR_AXI_URGENT		0x1bc
+#define CV1800_DDR_AXI_QOS_0		0x1d8
+#define CV1800_DDR_AXI_QOS_1		0x1dc
+#define CV1800_SD_PWRSW_CTRL		0x1f4
+#define CV1800_SD_PWRSW_TIME		0x1f8
+#define CV1800_DDR_AXI_QOS_OW		0x23c
+#define CV1800_SD_CTRL_OPT		0x294
+#define CV1800_SDMA_DMA_INT_MUX		0x298
+
+#endif // CV1800_SYSCTL_H
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
