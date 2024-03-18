Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F2AC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 06:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrlfC9uFm11nz+V9fw983aHVE3FKpwFpfCglJUMO/rY=; b=k7M+JQT+IUcQE6
	bvyLND1XMABE1gUpXm/OjLePZBw99fqm82qs5+2V3ft7SC3OYZa8ksFi+R0ICfmQPzW5JHiDsoO/X
	SGvbD68DSgV280RILPog/ZnX8nFyuuiuYCT5RIZPZ41Xw9T0WnGItZRAi9LmEarZaPdwdOw+SPB+G
	t3kJBypwCf/eh7oP3uN0dYvl59EF3initqUru7DycU7NznrRufUFWhEItHgj63EsYNNwsZ2urxRbM
	J/gAGf+SwB8K20iVJ/arQn/D97qPP6eoQCRzAyg69pYzjJSHaiMLsyWWjn8S1ZNeyDmtNmdljK3+N
	U0lu6cAGDFwlGUwUVgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm6ej-00000007Uga-129S;
	Mon, 18 Mar 2024 06:39:33 +0000
Received: from mail-bn7nam10olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2804::800] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm6ed-00000007UZB-2OYJ
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 06:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m59jB33G1Qtzeab/FL9TWv9CxTRWKMmKnG5RFIv2zUw85nCPLGk1iQjeGE/Kf3h4aohXUsr3sVc5YmSw4kzpVEm2ZLVQLRwoe9bKZEEroYxprOp7KQ/LtsU4bvShRkrbaOcf2m8KXvCcBzCI69+eau3EHMFBvVe3XM4o1/TM9MwJFoGyd+ZmEjgLmtQO9lZZSxz0doiLfkT8A0GFIXUumoBa4VFUDX6DL8OgIWWvpF/RRCj84X0RhvsPjHU5RwvhyDE7Q7Z46oNWiez9BlGl1TZ92zkazMQ+QzOni75SKC47Pe2reU6Q/6bt4DfMGpbYZr35VvXvFo5SMDUANG0bPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS0KlR6sMzZ54c2Mbq9eCPI0GiPAwbDVfnXhdu/XLI8=;
 b=ClDk7JMrQXGV+w2siNPg6Smjk3haEQGB/W3Ua2/LIi17G+Rnr5JCY2gXEXsgbifn6eWqnO/F0ujb78VwmN8WHiOvPHR/bMTxKd+kdAtndKOnpTHurvo2rBGdS82/sAHiEdXrABCWL6aD4LcbifoYCy8NDCthCFyUmTcDED7zXAti1eeZ5nU/3biEk0afKOQZi3CdcSNqpR3ToFDmTQENlagj1uhbzpOq28CFd29y3LSyjkFOUSA9dumsx6+XYh2fG8eqOCg8WJubv4UaADXUjR+NpCl6TMV/EqVWcIgiBSI/wVVGQKaZhUlue5AUcH7/hChJX3LfByqewwP2f8OreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS0KlR6sMzZ54c2Mbq9eCPI0GiPAwbDVfnXhdu/XLI8=;
 b=aUl5sEYhYEtkXlb1XLmfLKH9LGTy1UpQ/mTxdfwC0dwS1Sw27MsjHPXxj6BVuMsKBOmqGU/zA8aKtcafIuyhBCAwXfes8GW9LhAlGGWtilYupXMtoHZcSNG8w/Uxi32F6GzLh96oY+QGCepXYUvGKfkzkSOzf9q14qJBrBLEU2AxjKBrLJKgVBxoMuBYLtN9JADF3md8EZ4/lesT7Y88u1i0ugBraTotU6VJlEQEiAXOHLqs/DsxMvvuFQO5Cp2BxSvd4xmSyn1NwnA4sKwE/qxUJl6+yjA6hfyOCFUa/sKAFPFWtGTs/qb6eMWDBNMG94jWmBfK/A+FTKKoFiMpEg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SN7PR20MB5460.namprd20.prod.outlook.com (2603:10b6:806:2ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25; Mon, 18 Mar
 2024 06:39:18 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 06:39:18 +0000
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
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/4] soc/sophgo: add top sysctrl layout file for CV18XX/SG200X
Date: Mon, 18 Mar 2024 14:38:50 +0800
Message-ID: <IA1PR20MB4953B7D2659EFC5CAEE27B34BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB49536DED242092A49A69CEB6BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49536DED242092A49A69CEB6BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [X9oHuYmE/1e2DgD2cB7xx7Ogi/q8GhN5cY10QYEmxMc=]
X-ClientProxiedBy: TYWPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240318063852.1554712-3-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SN7PR20MB5460:EE_
X-MS-Office365-Filtering-Correlation-Id: 775a481f-39e6-4e6d-ba51-08dc47162300
X-MS-Exchange-SLBlob-MailProps: 7J/vb0KDx3g6a7F03Qev6MOuCGwUNmfEARcLw0sujbt34Dd00NjjbYQVK4cVEuGnTW4SzT+RNYTzwvll47QYHXPseAVdxcK/wvGem/v3zhap7ULmb8TUdySc28ONEy3Vz3c+HRX3RIVtwf+8t8cNV0DmNJBt3wiiba3NoTPZi5QYk2W6eCk1CA0C0Ik2WwJWkPNkxqVCwFVJtTj+2PpW2ULZZGsry/nP0aAl88OsAqxQRoJY5mY4RMUG0rOFT9QCr6nzbx5Xl7gXp2nsF0sHNrn0H+PhTRHyU74gFUWdB6V/Qvfer3hink75suAl8lT4pbvAtphpG0aykfDSTtNlT6xvUHml/DYhT5FR6tgH9ckijA6N7PI5xOL0XXKElqaW6OcSi9tfwPN0A5Q+quJaoZKRiUw6g96MoKByD4dALJu1R0miaPeO3UE8rD3rJQiyIGuQxu9dGodH9ZwrsUSjDxZYFkEoOZ9b68XO29VfIKl+PwkUAHCR6lhL5ds2KnlFurUFBlxzZ0CTVTLXWocgbvgk24x3/gR2j6JNOyOYI6rp+0TEVgWLUFuOrEescNMtkdSvo7ZZJHX0KNGXxF2YrXs/UJvjqkpdM3RydlXqubKPSf64H/6nbsETEe759ZEhUGjAnHK1ZoUH21N6+LBQTrsyTnoO5NxcUdKGMbBFQ4loj/I9U7ENlz2o7mXfABf+8LtpS4TBHgsP74ZPJ0bMpPWWoFLmxXsfF6f4ulerrM5gl04mQb/9txarRRAVthVW3IDpQWR9NX3JguPsJ5beiPaxLpfBD9DN0kPMbarb1vk=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xl5w4nxT5XdTch4xFSirGtvuB8uGusyV/z++pj6stA8edIoM0PCPHfzKNRDsp+/4xK4CDdqJeLatQccG59a1ubTWpX4MDvjRVgt510/l6RYdSivqYVE5Aged3zszQLfMLDgpe6/NOJWDqpplyvYeXNa4D8Z//4O/FkWGaCvQ3ep+WKS44X/LUgFT9xzwsEjVaCG2iBGleLB7cSorJxP4/kobwoFW6ivkNWYBfPGirvsrftLyACT8KJLRv0FttObqHlauYjgxgxu+5ka5qWNwsmtJqe9M+SNrxQTSkAM5L2+vQixBMDkZ15am4Qjy3PsEbERqdqt6DUPKcgNgxIBMBno3bD0MnDMOWLHI/xqds1+MKs/h5AxRVN18qIsGiYbr4yQbogXNIWwNPOy8jJZjCdYMjCN5rc0A/5qnpCi7fgw+SxfWkecdVGcvvCpATRSvy2zP1Xr4FZZ/bHOAgwXa5p8GmhGDU1BVXMN9ZupuY7kAdSTL7ruIuMo8Q/llSyRGiKryyPLETqiILAyPtTNyTv+iFnx50HEDpV7FNyrVZu22bCGyvNhvdI2Stg31cOPsoXomOnbNIQvM3F6AQF2s9qWfwgz6gJ4w2jvVEAQIoruQC6ejTvbaFQSVCEMah+vD
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEQAYPrmM8Qq1odX7GuGwyR7cIkNu36XDwO6Pd27qwhSFSqqp7JMABO4HiQ3?=
 =?us-ascii?Q?opd+zJH+E0cnjVK28VvUasjU0tQ9NqphJ7b+etWBkCQHeqGVMO2WLktpw+Dq?=
 =?us-ascii?Q?ZxqAtfQyozoEoPAw2HEbDBYmlNWbl3EhuIvdH/IYyN5EEj9gT90dgLKQvprM?=
 =?us-ascii?Q?ql2Oks7fkOl+xF7gKpWbZVwL5MJtBuSDSGLu5/wEdBDoZbK/4UFX8k99IwDT?=
 =?us-ascii?Q?I1ahHD6dye4Tl1+M4opHw1oan25IBGmkjFegeZ9tGYtp0u/lvmmCssw0EAhx?=
 =?us-ascii?Q?B6pPbliB9ML6T92QG8WSrIYeZut+4f17mlBf66mOZfG8wvt4Z50Wt7ekpjmc?=
 =?us-ascii?Q?X7TdH2kENatn5c6Ufw7aYWo+vG3i/4bd/c79aXTMpU9OkEWq/8daLhHaJ5pl?=
 =?us-ascii?Q?sCGEa5Ewhue65uTlFBd3kb/yaFBk6lOhZqQ0gMC+v8akZQkMuR2uxLGIVVjT?=
 =?us-ascii?Q?bRJGopiSeBDHHWqfSXI07ue/XFyGMFN1LO3k4SV166Js10cOF9XeUdTKozSB?=
 =?us-ascii?Q?Zs9Xys1N3R6nSKgBxRckATed1+T45A9+HLK8DppFeekA4Q349xHEhvAMWmMu?=
 =?us-ascii?Q?jA8xrTzNtpetaR8fAE9TovBruO6wQuh42MGph2XqCwUx8B04pZHDmAhQK3GE?=
 =?us-ascii?Q?pY88hNJ25Ht53d69K7ZSHNsO7WukanV5QBATqYiv3DwCU6OYOiMC3qXIOFfC?=
 =?us-ascii?Q?Dz2+PtbyPrrdbJ0ZlxtXrupVamfxSWZp1jF1KMBddi/jO90yo9MvLUCHyGrP?=
 =?us-ascii?Q?fWHJslPNDcIzQs9ZfAtWVyIDf/btMBMZIyFx0S+YGK1kBHTX9FIjtKV04qPY?=
 =?us-ascii?Q?VZB55UoZKsj8Hg/te4evJnm7JL7ZnIJNPBSi+gyLozc91A6KoPCLgTrRlvRf?=
 =?us-ascii?Q?fJSVQCLFu6qkHmO3Lk9Wd0IxLqzUDaGkX/0PA5Dfw7j75cQMkJli+3R7Rv/W?=
 =?us-ascii?Q?9g51V1Vu8lMW1LQRbcUoGI1coJ1SMEwMJuWy/mWMPPqtUnOJGwmbeoDAJ5F6?=
 =?us-ascii?Q?ZP8GYHk2ndBgf4heJ592HcL+qb1FXaBEwzTYagzof+IDekPywKW4V0FdUKns?=
 =?us-ascii?Q?n3JCBWhg2flf2vR+Tgluce4hW1PUS5orA1EX5hRrmS7XbmLe+9k8ub+Ju8F6?=
 =?us-ascii?Q?TCLg5Tqw6eXt27g3ZbSGKhr6dgo+lYWHcBJAzsEbT9N3tnJSATYq12Qs0OHQ?=
 =?us-ascii?Q?RChbxYBj9mn46f4OSZQdb66oJVCGXGm02LA09UaFKn8oS2cZKEdd4Rt/W0Ag?=
 =?us-ascii?Q?fFIw7r+z+yOdWQ2H3FKX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775a481f-39e6-4e6d-ba51-08dc47162300
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 06:39:18.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_233928_732466_CE79ABE1 
X-CRM114-Status: UNSURE (   8.96  )
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
