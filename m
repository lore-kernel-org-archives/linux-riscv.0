Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FD0C3DA7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 04:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrlfC9uFm11nz+V9fw983aHVE3FKpwFpfCglJUMO/rY=; b=Q+cl8KN1G2jV1c
	ZfuGCw3yJvpGhFoDB4NDYEn3RvuT2HS1JLp1xI16zuZQO/eWrEM2iOL8FewM9vAbpGKDs4o6g4tZW
	Vzvgnp8jemXsSpOok2UC6ghDXzFQmagU1U2wKwT/qp0JioTgpOWnTZmutcB976b63pMOt9WSqSQRd
	8b0+dacbjj+US2/TIu5YqB3XlfYIQPnd+ongD2GgLo3WAW+Fn9qUBY8UO423ak7u4bd9BWTqWCs+a
	gd/c8FpH2/Lha8q1DpJhN04XpZdSB/6NHEf25xn3oOZP+4DYdZIzg2IjRrAR4RMgv1LngmmjHxXX1
	NTX+FMWW1JXsneiFJrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYI94-00000009yHR-3KQJ;
	Mon, 29 Jul 2024 04:38:02 +0000
Received: from mail-sn1nam02acsn2080b.outbound.protection.outlook.com ([2a01:111:f400:7ea9::80b] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYI8b-00000009y3e-1fQ8
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 04:37:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReFOjxyDCrZpjPFR0XXMg0E+GNeBO9QY8nSrgdYeroQOK7WsfReCdob8f3qNx4P3Afp1C2HVnfGdEfIhN2hr8oqhivhYkPNG+0Vu7qsnX7apiRtRz692hSISsnT1wviTUGNd5u6O3AEozxxQXHGm8kr8509YdXriEDkwtMDX/HYutaG0R8ZPDRC7/ZBjvghxUFDUoxp6B+ng5ngpWZNoVqmf3lRofG0WNIdMg5KYkm06CV2i07vZ3Ah65DvZYxyU7xiSLxoFisrWQ/uGztzhpBu0SyXgWCmQcHQj2mqkzII0VxKiFiNAe7zzaj4Vm1LwmtUgj8BU485MvwVKqRGZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS0KlR6sMzZ54c2Mbq9eCPI0GiPAwbDVfnXhdu/XLI8=;
 b=A5Lqqz1vfUaniiiHFBApbClhntoErSXR1xi6ZmA5Or3IYxYrJNY/dpREVQFNgAYQbigTxBzp+hPJy/jswHoBoCBz+OUdLkXbkFOHtUOAjUt2n9kPzmB8khUy10BkY9d0hk0VAArX/Dl6+iaf/KBOmdgi3TxFNgirY6w+5B9BtEhwUjyN1FvpFNew9HvUHEGud1/4FVYk7DxRENmqCaFtd/feX0kitJD6aFAwi4Y5tNt5HMZlsUMnZ/Geq8qoriYwOzffU6WIS/qlan7dv6vI24MO0ixDECyYhB3N4uaMv5tCrZd3FEWA9LsIivFjqL1u8xCGk2vtGSIm/CSP77e1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS0KlR6sMzZ54c2Mbq9eCPI0GiPAwbDVfnXhdu/XLI8=;
 b=Cz6kOL1k/1XDH2PpIq7XZzIGXDKqZ3H5j0/7ofYzKXY7tOh2dchUDtmxcwF782FoCZ85Vb6R5IftgYu7U6InuMyvBgO20swqkPW/mF99khzKcO6Dp5r3FpYuu2QcC7G1vahA+YaTNoVcCfFNUMZZmC8Cv0i17knOZZh+EFjiSz9KjC+JbRQKOeuyR+tXTlpb2j4J9qZAqSf4t/eBBhdoSu3G3Poy8K3F1OnUrONcAH6cdAd0eDGrAD+TJ7+WdzyxLvmZQWeKPF2XbcrBO9/o4iHECjSAqtuV1bUIqc51qtp3RGR/fFTvdWKXYsHFjg9koiNeelJ7gAOIHsXWNHSi8Q==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB4516.namprd20.prod.outlook.com (2603:10b6:806:23d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Mon, 29 Jul
 2024 04:37:21 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 04:37:21 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Liu Gui <kenneth.liu@sophgo.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 RESEND 2/3] soc/sophgo: add top sysctrl layout file for CV18XX/SG200X
Date: Mon, 29 Jul 2024 12:36:52 +0800
Message-ID: <IA1PR20MB495366F49EAFB148B3F87DD2BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49535EC188F8EE3F8FD0B68DBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535EC188F8EE3F8FD0B68DBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [SCg594rCqFiUdthjqEsQzSxrPO0NXXC2O9iOrWRJ4DI=]
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240729043653.899480-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: 392636cf-7f55-4af9-099b-08dcaf88228a
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|5072599006|19110799003|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: ijHi0uciQpYg1OrTTTc1BKaW5U6gO9gkWzoAi1XZOcn7ku2KhSxMSQRZDAUfg9ycoMf2JXWBnE6GjQeu5Px1pBX3OO36x2BhpLH5BJCPiS7IFh53BOJ/3B++DJGT4BVeABYx0tM76kUlo2iwYUGKbLo/6dqik1EuOzb5202pz7Us1AOU/e5mYOJjd0nwzXVK9TOzfgiEPZIZxDRCTCfIrrTT9sA4sR/3nU0nIQWqkdyDr+0pSLyeIVnvbngeJWxNRGRvxeBnIlJtaYa7xcGPVqIz+EnDsuCFf77yGq2u2vY0qYLg0VAHJEEAFAvBjVaq+RRZj5DOfARJLKeoo8aTqyEM0E3OgieJrAflaDDQKT0wsilNeZgG3XAKahHhJE0dmfZkvXq0/AWJpf4uObKo4OWm3BYzxrT+A+BO5vQduWV83qOwGBqXPh+N9ulmhuKHJ8oIX4zEbbOPCxLjkuENU2eba6Nm18s3fK1EA+v/FgVOjeGZUEL/6CtQkKIr3N5p/a5loHneBhry26u11ENjI78p8Y+eRntxs3VKdSgRdlOdVXgumDKpxcRuGRZyC9yn58GYFvxidvSioPycn4FyjIDDfbspgF6qXb0dYVaayXTUYOvqOOwoKxjbCBsWFZhYBZ/bMVKP9x10DnxLTkfV+/zJQXp9A3NK+meMblWjalMrZdAKk0x/xspkBlOLgoB2msYR48DyVf9lYeTE3GTFAA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4inxhWuPewfygN8GQGKH0jdUrcmlup0TAp/xAIJnKsu6po/xLVquGs0ZMIgG?=
 =?us-ascii?Q?Wo5Qpk7MB4GVA07OPf5F4pSoL2HCmU7D5FFZlEOa7cf7XYLxvnaT9laF+uMV?=
 =?us-ascii?Q?rI8SKqNyadBL6aBbD1qxDQGMU4XCg5s56yJ+qJdSVilpi+bRC4x5NkSbCGyf?=
 =?us-ascii?Q?wW1A+x65vXA1W4MGxqo6Sguj31+HHLW0rSUwDPpIcbZT0N2MW7obInYYBU7V?=
 =?us-ascii?Q?WgK1GX/5clm6RatyJ54SbSkPpCx33XCSLNmbKJj6D+vTwE870J0K7xG9f6JY?=
 =?us-ascii?Q?MBX0pYz3Ll3hCgpqt9HK4OXP+dPnQAKGx+Mgd/ZoTnrpjhlJr15ZsipO/tu6?=
 =?us-ascii?Q?1aGOiaxWw4m/u6Gky8bsjZNF2JvXofPGiNBLWId1/G9DFUhUIGwlaX9o3whi?=
 =?us-ascii?Q?tVXuoHIpctTJ4jk7/yJyOu/xgkBT51iOy7ZthBosSR7OTB2cQlEit6f59mCY?=
 =?us-ascii?Q?FAiKqUulQ684SOt0YZZhL8vZ9LKWVlrjDjVY/by7F+oMj3XupeugXgJW2Eiu?=
 =?us-ascii?Q?CnXl9cangcW/W1zySilL7IaOAPGZczYGzloG8XNsJJWaLH1EHXFWnsIb/DXQ?=
 =?us-ascii?Q?iInoe9DJTZ3CIaliymHpmJ4w0NiFEZDOzvTU1tB5gbSkj3yxdeebLuNFNft/?=
 =?us-ascii?Q?O4IOC0LamM09tXy3OrUQ7nfu4wwXy7F/M7zlBhIUGDNWp1oISBoVf2TZ4K5H?=
 =?us-ascii?Q?qtGFfkw/S5ji13KG+2zvNbj05cJMEAkBk1wZJb0pGSzOZmSP3I2weKOj/2JH?=
 =?us-ascii?Q?SzjsdVgKiBtrSOGoiQGPPDcxmKJFLA/Zx1hwt63tP6xAZrLvnc16ohR1uM8F?=
 =?us-ascii?Q?VkdcFuxHAcyTpvPCdss5hf8CJurrA7ujKdeYF6Us/gpUES5tMbQ+bPHYtqQV?=
 =?us-ascii?Q?RVliPjqsKtvyFvkFBZze/vpmRxuvDpZg6uR8Cl1FmlNm+Ihca+rR+mUcOEC3?=
 =?us-ascii?Q?O/0rSDQgGUCfZSWaCF6nlD9t6cZsGr7jvO70H52rVsm5IH34scRIgzPYD+zJ?=
 =?us-ascii?Q?8HL0HbtMmm8FrwTWxJAhYxJkLBWuqG2GjJCBwGaA7PguMQgjOcXXkhlORiSh?=
 =?us-ascii?Q?MKMWbtJnhRzjZGR02w9MuHUhkVE+lCGuICwgoYl+4kvdQKose1qssOQzACl3?=
 =?us-ascii?Q?gOOv6e+0TWVTUqV8CGIirTB83XmeLsqB2DIGpKFchvQqYsxcU8zCXM+DwIxz?=
 =?us-ascii?Q?aD3n+GBKODJRBMB2SRM1z8i6n+IQCK9f0LLelplcu3KFRxw2ziXQrnpMDoKu?=
 =?us-ascii?Q?QpKrdQ1c+QdDQq+nrSwz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392636cf-7f55-4af9-099b-08dcaf88228a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 04:37:21.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB4516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_213733_483192_3C895F29 
X-CRM114-Status: UNSURE (   9.31  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
