Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00219C48260
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 01:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vh5+AUCaTONDg9llBdCwUxJma1BgAGQsEGep3KI7WaA=; b=nVBicapxKuXFnJ
	A2PfqAXP8a/gpJHeUjIVvhe7874vJuAcyZ9LLu+7m/8wTJ9XnMLT344SazuI+HpzWltw87ynhwUR3
	PCsVS9Kg3egTXd1R81xp1qDkrG/f1IywguVQtfc0QmpaY31OxySI6pmdIXNux3RFULioz900ZP45X
	QE23ZaT5tAMtCZj32xlDxLWg3Ds/s0lnn0cneDcMOU/orI0EW8gxP8jLwMbSsCe3VhoGn/YEP6qXU
	taY0O5aoD0ahShYf3hqgwKn6rSlBgsVMUprSFc7AiNDo5/FUDPBOh5C9pQK09SADS17dEZE2hRe5E
	Sh+yTQgmp5A9V/GJJxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra4BM-0000000BSqp-2xS1;
	Wed, 14 Feb 2024 01:35:28 +0000
Received: from mail-dm6nam11olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c15::801] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra4BI-0000000BSoj-3ysT
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 01:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXn9yoZ77s7kCduIICl8lSNEkOyVKjrCVlHAU2xwv20+QP7kJTaRoE9ftqCA3BD4UDJxTp5oNcl+xzxRY+sk6QTt7P78oWsIVKj0cd4Qy3/AcGn1zkiBinvUCKC+mSq6ZXpjzt8ujwN69L3dMsP9jSjuNBkBOirLS2552rrkBjYeKoHlh5+1Lz3EoVmJvAscQKIQ4xS5c0DqN5BuqkB6G7vzXv3VBJ+QEHbMr7YRsr+q2SfDw4b2I07JJ3qc9U3rr6RKSA4msiVobG8BqjmKulYJ4Z4HsObGOll8E2K4IoxqHtUTlKZ9MjtlkF93Xg4BG8ez5CFJnsh26RqoapXP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ3oWre1toO1tJ3fQ/pwva5OqdmfBKn9CMUrFHLt8/c=;
 b=DR1/uN5HLn2ckfh+X12VTvmLKBn696x1nw2TN01MfekIqSU6q9gxtuSh0nY6mavkuUM9AonNB1uGmg77Nj1rsKDK3wLkvcqln0/CzvqkAZH17E0x34vVjstCP21pPN/wT6qLInH2Emc7hCmycGOTmZSJFvkvws7xM/ky0IJpnHU0p83gme0Pqx0Mh1HUBNg1i2hgyeFaO9GORM/KAhL0/RjxPvGpaBqAWj8SeBCFwLnlabBtP0E4ogPjMx6aU6QiVPlpabXSlCat+6FXVzE0oQHu/Pt2mHWzC97FFTDOrt0Wcfdc6WkzDrXwoP6Uicu3Z2GT4CqGjrND/MKfWz0NKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ3oWre1toO1tJ3fQ/pwva5OqdmfBKn9CMUrFHLt8/c=;
 b=cDnySdk9LyJOHtfun1jIyWjd6EgqwY+YhMn6K42TKnvX/+v9DADP3/m6bk+QyezEwC0HecWsCLkvc8RW12Dg3y2XJi/O2tKO2lcHszgt1yyosOmu7yqUJkynn76ngB7w2oDo+C8lMr1dj0JRpnccWV9o0RNBVkNxBFv5L6gTUDlkUM3yTPhLf3WFtFvPXShk0YY8uTFPKZxywh2fl2fiWy9rBfnmkqQ8zFNendiLP2qnG4Cs8WU0Oohu02mH1DWsg24VnZxIYV8+Z2OuX4BVcEhMz67MunQstJJJqVhLdS/uGBucoJ7SPKentXUOaH7wV1gV550yVnry23eIc0YnwQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB4663.namprd20.prod.outlook.com (2603:10b6:510:1d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 01:35:05 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 01:35:05 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: sophgo: cv18xx: add top misc system controller
Date: Wed, 14 Feb 2024 09:35:08 +0800
Message-ID: <IA1PR20MB4953D95E8657A480813767FCBB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.1
X-TMN: [/RIzKeYGoLE0OWLM/butKtI61vcXo3fGt5O9peYt/6OB/XyYityQa9fsG7btveDY]
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240214013509.135383-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df57fc8-465a-4b8b-14c1-08dc2cfd2ba7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogEBPpSLGDzgVdxd3go1QpG7mbLDxbG1LYgHyGDO5EsxlT1nVhzPmtYyXH9Fp9HA7C46qKSR0wozew3tqdWnL9P9x7x5J5VBodHJLx3Yp4aqxrocwXfrHhOHspLYZ1EtLaFTV5kRaVDBzoIQpwnMWqkTRu2tEvyHxMQ6cInotkFo1jp7Y4MXNri93A7wo8Px4GLZ8q5Gqxm4/MduKn/vY5B6mPZcwcB0rj5ZtlHpS4N54MIq/bUeMdp6Xx2w1cuwU8uHGCIK/uuW4jxKILKQnggKSYFGhYWjkKhu1j5mBJmFYtKBz8U8HwutAzgR+d+kDMWfFeLBDyvHvdEQ+eOsawPcZvwuU16eKMkASveGqcAZgNkNqiDPi9Tq0eszr543ABm1PfMUJ2ThfhQx/TxMl5apyS6vdXB0O74aVGqtHCVohC7hz1Wu7KIWX5oKvl/MxsWEX9aG0uZLolJSvod38exrwtipIOJAkqd6YSYXAXaoWpykzsJHGiCxzV9yKEWiAfHq5IXu77MT6bbHbVkLYUO/cfvjus4riJvTrfkv3ZcMZ/V4k0uLXeTFNxcRxBGohrtIU5GjUdqoeWx8gN1GIkuMOvpYy7MNXh3HVJp2DlrGKhV9m855PlwNzNAl5dTk
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6aBJaTmWl9/A74+91Vpve6FXGd0DxaMbLMwPfgCXK5dsQy5PEssIMEq7Be+k?=
 =?us-ascii?Q?uai6tXsopxnrlsOAm3bCZQkFXhOyWpwC6OXfLxfzagC+ihTYnavyrvg5zM3H?=
 =?us-ascii?Q?9fLEdZSZAtH7+9iKDe0RgEIndi8hi9Xyz6IPXBW2SC5hRf+HiZC8vtpqJda9?=
 =?us-ascii?Q?tKVpzkVHbO2xlxZFNc5KbWfDzjI2hStMC6IViKrlf6YF7MYpW1oMn7HYB6sZ?=
 =?us-ascii?Q?q19uE1XAtKEBA8NBI2TUztCGBpfJjC1rq1GvH62fV23ow7MXnXwE9A+T3vzn?=
 =?us-ascii?Q?jxd7ar/bzTs4GZT07mJmzCoT9HbGoy+r6Zx4X++pJCBA5iZ3qCTx5yZMXJf3?=
 =?us-ascii?Q?hQaeGJ8I3TgezwOwmvOQgQRwwTNgUsO8PISUcRImxDKdMEczWBT8PPknWz/p?=
 =?us-ascii?Q?hoVTlidg1pthFkYWENxhXlPdWnWZiiUmpOLhZ1+HgOJ8uxBCkXspiMwm2eXA?=
 =?us-ascii?Q?5og0dSUaGFlDRLlp6dY9ZYF5Y1vQUIxiyu9vYkz6Bc9uMcsuBpFJuX4UWGo1?=
 =?us-ascii?Q?J0VCzkZN7scziAKTDwGU07DEDKcOl05+nsOlhtnBpQrmARgVw1B8Ylbzgn6N?=
 =?us-ascii?Q?COXlg+56awEXrZzOxZL64n+Fbzvafa3qJyK0qqQf/gbCFuD5Y3X4O2KLdJuJ?=
 =?us-ascii?Q?qPrkIcuQRnUJ11uleEuTvv1wt4o1Yqg00seCZngraIjHqCYsD9rv9cwdszRc?=
 =?us-ascii?Q?IEto78zkCWX7dj1DtNd+L/W5rFMiz+52CnL+Bwh2jly9NCYONHZHtcBgdLeW?=
 =?us-ascii?Q?1LcpTQTjZu4XlOmHbFyRtz294x9ym0trtJry10tFWmEGvQVgnlqiTAil3xd0?=
 =?us-ascii?Q?WzTtG9VjXnWxrQ7TUoEwk3xGYYmeSMAX6vSIkr4CkSbT4roqyKF6iwwT1CKk?=
 =?us-ascii?Q?Q/N5uOcWUFDh/WAmH15AwiUmhtQX3fudBPHXp9Q3bIwxMSJH396L8pROzr3c?=
 =?us-ascii?Q?3U5bVRbzM9RCCuInrrr4D8pCyE7HkQwjEndoTd2lwO4tstCYoWkQXL5oDdYG?=
 =?us-ascii?Q?0zwcuHtrP5VsMWtX6Aqh1X+7YbLI17qrZtmttfF93TMMEgW3vPZ52sivdLRC?=
 =?us-ascii?Q?mASlQQUtuSG9NAcWLxixDEPB4oMIu8vzoh2KaS9Pt1c/W8XOrzsZJWaeWwXJ?=
 =?us-ascii?Q?llK9+REZ0cisrvO4hk1Y7zIbmWYQICIhR+F6ajKrIOIPAXfXTBjgcDhlTank?=
 =?us-ascii?Q?vb8sN8jPmyMO3fKCH5A78ABl97g+yb4Rvoom/smEPVqs9ql7To5oRGqq8Ivk?=
 =?us-ascii?Q?emzF6dBmvPGmoR7oS3BNjN02UvsOvCbLp+iKRqjcNLYUnmd0MZ7Ql20/V1OA?=
 =?us-ascii?Q?f2M=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df57fc8-465a-4b8b-14c1-08dc2cfd2ba7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 01:35:05.3232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB4663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_173524_999665_F631550B 
X-CRM114-Status: UNSURE (   6.58  )
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

Add top misc system controller to CV18XX/SG200X series.

At least for now, this topctrl dt node has no related driver, because
it only contains register for other devices, or the subdevice for some
other purposes. The patch is submitted for providing potential common
dependency for watchdog, sdhci, usb phy and maybe etc.

Inochi Amaoto (2):
  dt-bindings: clock: sophgo: Add top misc controller of CV18XX/SG200X
    series SoC
  riscv: dts: sophgo: cv18xx: top misc system controller

 .../soc/sophgo/sophgo,cv1800-top-syscon.yaml  | 43 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        |  8 ++++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml

--
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
