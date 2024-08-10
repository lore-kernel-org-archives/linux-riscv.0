Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E67C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Aug 2024 08:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/T+/2BjyrITSESGzN9iF6iTsE8WggE6JZT/6iuJB320=; b=p3QhkgXS/tJBy9
	f5Vzz0MNj52do63BdYmqTSb6wCieln03YH3RkujDJL0o5Vm0cFvwuaBzABF/RjBW9m/+xRKVecHGf
	DEDQUGhJxpQBM7QecQl520EM5aAXxkWl+FB+xnz2G4nU51Gzc95NRJwyD+BTNY/k+UetBDB19M4M9
	WoR8QBmyqXpSILBCLRDz4zQ9hXKFq+yjuo+EnqhNLfYNp5HRM7WnOJ5Cmvlf/Hn9eHbUgOOpZ0X5b
	VPcIBrqTDUN5dog3uIg9Y2cgArgE94PZYZ8Yk93n8U0tkRo8BjJautD5nGSykenlmH8svVhRSNbmN
	m0o8ufVjGbBD0CZ+Rl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1schcc-0000000DdM0-0mLS;
	Sat, 10 Aug 2024 08:38:46 +0000
Received: from mail-co1nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c16::800] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1schcZ-0000000DdKG-1O5U
	for linux-riscv@lists.infradead.org;
	Sat, 10 Aug 2024 08:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gec46kg80xwkSnw0cyuq7WvYCZ9kSik44LGtrHAAQ93CJW1H+fLWOc0no6lARuQJs+A7cQddhc3BfdG4zISsjSo/sps63991n8hFIe4u/uUgHb+xaH5CEri2SDLBrAvAGTBlAfDNpssn5GHojtzSBUygBGyIhMvBCi4nRvLaYGLpdYN54rc81JFWzXlxuIsMxj0GyOYOMbQs3pCGJN0CsrnvG/DNJhL8z29FZybiWfj7nFNrz/x18zF/cV3Pqhc9AQUFOkUoKrm7DnvcGuZzUL4EOv406u7KUo/Fe6jZ5+Ke7GUCnZhfCAFA/nR/oIrEy24naZaCi1i1yzBUGjsXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5DhvMZxAVmU6ey/uShz3eHHxQgnrGuQywMkbuh9Hf0=;
 b=G/Ym3S8lNU7QO3FklyINiCdooLz4XMcA/cVh0S8WJWFGLmND4ya/28XuSph2eqnf/INHHaMmHgIgs9WDrI8vfA9U6BsIHCtUR1O1mFtRM7xPgc3FFscHEiKl3ssUkM6WzymHIEyQVETUWlPfZmSCd5sZvXm2B6BLvYxVrWJyFU3/rE5ny93R01QDtZeBjVJFDTZG9n6iGzvYvJtUWxLK2rNrHLpFRre4yK6WtY4H9s1uK0pcvrkArScSMq53nY8o8Epo+DhCL1tjrW9rfC20wb3shtTQ4oRTe8Ck2o2UCKqBIQeDOkC+52+med01j0sg2y9zwBuJOBB5Hy0TOX/tmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5DhvMZxAVmU6ey/uShz3eHHxQgnrGuQywMkbuh9Hf0=;
 b=J0lzRQdEus41fkU/Y1uctPXPGbNBGuM5jMyTBQ0dJL6nkk3WHi2xh1sIVdqMNwojsxrSBweInNLFwi8CPVFoDFDL+Tg3YTzTffRhXJ1m6RBToMpJOua4P8QsKoTyyxkou8uY01z1SUprPXuTEybFvhdkROC3YmJcT+PI4eddHOJI9LHKnBmAfLzFjZDJ1qBa/17TCiWMNhVbERgQUwfwlXGwAsd7epYkWVlbSq0cy6bzVJt4q+X0v9XZZ+2luEy/0ze8fCAfUb8ohFz8V9wWXMSAkRluj7+DqECwit9y+IEWAhv24sKDnAx28bsNPsVGuWX+/G477rHsfqCswfPM9A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB6115.namprd20.prod.outlook.com (2603:10b6:510:2bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Sat, 10 Aug
 2024 08:38:36 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:38:36 +0000
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
Subject: [PATCH v10 0/3] riscv: sophgo: add dmamux support for Sophgo CV1800/SG2000 SoCs
Date: Sat, 10 Aug 2024 16:37:57 +0800
Message-ID: <IA1PR20MB49530ABC137B465548817077BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
X-TMN: [kOHMHg8eEpVPBLra0eVjI/YVKZ+YOm4JES/STwzGdzE=]
X-ClientProxiedBy: TYAPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240810083758.486702-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c4b9f16-065e-4756-2ac5-08dcb917d30a
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|461199028|19110799003|8060799006|15080799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: 14d/5VaOTTvAfWeO2YeZ0h0IHU1HTjlStxHUXeTUr7VPxC/w0Ef/dOy3vxe7Djzj0lzZhIZrnNsXj/UqeTJoZrQIIt8lIwUNtps3c5/S36WK5ywsVTiFKoohvDClbcvBZhPiQBFe5+4XCXd1xrmCLij2YIA5+ivZJc9dsT0XqeNPLLG+chUVKBpupworlz11qF7k1+ilwNnZCa1Eixvbm/0ueJmnw6SUjwpsPtOZT/2CYDJUN/YIAamyxNTPfEHl6YnkLI0jl/xnoWJbrCKulDaDE5hDySNtFE18uAoF5V1n4QKu3cG0kr+mdcKktKaUPSFnq77nA9c0sjdz5gFfU3sHz2Pn1iwRrKGFzsrHydqCGLmJL3wwN7FxtwPJSmVkPgcVFuZvztaPvXtK/wfdd7iE8djDHgtlG9/pCj68ZBqpIeWxNYgR2iKxqxOZpGwBgY3rMTE2crxrJyZBOn97/ZNFDnwD6lr1V4NfbQ8EyNM6oPYsYB0G7jRa/olGFgQzy8jIWuPBTTXJvTqO2Jac1LLfHlLE1OR/NJBqBnVhwUgp9mBbTtK89DSwofbMr4UeJeMCwMgE2UdiovYKwysN/1Rzv+iFBVNZ1mkvItZIuO5OBDEOycE9ZPHo2CUJ3/ngdo6WiIgMD1wciM6mPJ6o5blC7aMkTpwFmQ0bdfllW/7wQKU0khGR8/2aV71XcMyrBSrnNIF6ii/nCpAnadcpX0XEW9kbLIxvePIHCQV2CBc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WEFgFb/AMhkuSYhGvpap2XAc+NI3rN3xbquhkIyxDTwx9uykmK+QNIMq9rCb?=
 =?us-ascii?Q?7929nwoWfuw5ypAFVgMFbOjsX3kD/lC+mpya3rCtaklgfc72uUKYyrhM9boK?=
 =?us-ascii?Q?Pp1TSgyif8FSxJJB4PxVuHUobuJdqfRRAUDvjldInY/TciLUupvKPjj7e1hh?=
 =?us-ascii?Q?3Xr9+Vqcu0B2Dp8VvFZoeyMZg7N4bguZzUEeUZtfq+oFE6EzjT0pageACiRj?=
 =?us-ascii?Q?J+FPxuRHiVyRKxowhzBC6eBQY7OwUA7gHGN0nKDHe1x9lwlOZclYMjKD+HGY?=
 =?us-ascii?Q?g2Im84mNI7cZKNvBWu6Gy0En81zuti1Ej3xcGo+B97v+gUe+MISrYwpQhM8G?=
 =?us-ascii?Q?XPRlh6aFkZJfII6dE3k1mib0Px+aGh0vDLB8DfhZ1y0keQ+1ka+fXDsgGnbu?=
 =?us-ascii?Q?WgstbGWEr698+d64AvVI/7+gf2Sb1NBQKCCf6WNh7m4cFluTJYRpdPdMz2Ag?=
 =?us-ascii?Q?v7XBA7JfZYaVnNV/LwOJBm51jDcSsVppW0h2b3RbcjbWvOh6aR/cPfs5GT1u?=
 =?us-ascii?Q?L+J78JGkQc5V7nc1vXWnJs3VvOAE70kr1WUnJSYxs1d8W+cQD/ffthWOP/zr?=
 =?us-ascii?Q?CLQFrnUkePbsU7re1VHUM0Z1nNpGN025uBSrs389rg6dr/d4WpjBDf/CX71g?=
 =?us-ascii?Q?g1IzbLl+egG1O4l+68LqbKVLU4sgFshwfh32HD4TkhoeauIpeve9B1vZL0L7?=
 =?us-ascii?Q?/e9AotqhRCS0aiWNE87JTyU+qi6A14f2OwRmVFXSFLQO7DAxTEBKtKHkHyc0?=
 =?us-ascii?Q?erw180QPSYEI2jCeGRXRauVHyd2e+g30uwutXx+s1TGk9jLTfkK9SM2WrmH5?=
 =?us-ascii?Q?dB0ZIY4vVWIuLg46eQiVJgcTP/vYF93Vug3ZT+ND8JMk04TzakahXM2vy/ol?=
 =?us-ascii?Q?6G7dcboCW+o5OeflxYUr1TjCFFMgBRLasbwfEZ1tkOOw1dCUHvhPLolmSmPa?=
 =?us-ascii?Q?Gc9fE0fmNZr4r0MKvWb1gbu3UDxf7yQ33TftE+umaojS33F1dB2afcYuyp9w?=
 =?us-ascii?Q?j4iaZtgPHKj+N8yc1yLvA8PilL/booLiGA/nKWv1vNiUuEmobvDkpIQXHEA5?=
 =?us-ascii?Q?1q1+Phy8BzN+t9+9w5raiAoAZmypHrbMTIfcoLoVr0QvYZoIv7Ps2svWTE/G?=
 =?us-ascii?Q?zaAURcCuYAmFav1v//NI97ep4WkmKEhcl1hiq9tKc2gMZ/uMCEgLIwXMdcvD?=
 =?us-ascii?Q?mlrNL34cy8SLtokaBHX1nzuxUflgQkm9/5ZQBL+txcMEzi6spUjdCmyDVT4B?=
 =?us-ascii?Q?1TV3/4xeS4foI1zPaJK1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4b9f16-065e-4756-2ac5-08dcb917d30a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 08:38:35.7432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB6115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_013843_403591_EA2A1CD2 
X-CRM114-Status: GOOD (  10.64  )
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

Add dma multiplexer support for the Sophgo CV1800/SG2000 SoCs.

As the syscon device of CV1800 have a usb phy subdevices. The
binding of the syscon can not be complete without the usb phy
is finished. As a result, the binding of syscon is removed
and will be evolved in its original series after the usb phy
binding is fully explored.

Changed from v9:
1. binding: rename to cv1800b-dmamux.
2. binding: remove the unused formatting.

Changed from v8:
1. change compatible name from cv1800-dmamux to cv1800b-dmamux
2. use guard to simpify spinlock process.

Changed from v7:
1. remove unused variable

Changed from v6:
1. fix copyright time.
2. driver only output mapping info in when debugging.
3. remove dma-master check in the driver init since the binding
always require it.

Changed from v5:
1. remove dead binding header.
2. make "reg" required so the syscon binding can have the same
example node of the dmamux binding.

Changed from v4:
1. remove the syscon binding since it can not be complete (still
lack some subdevices)
2. add reg description for the binding,
3. remove the fixed channel assign for dmamux binding
3. driver adopt to the binding change. Now the driver allocates all the
channel when initing and maps the request chan to the channel dynamicly.

Changed from v3:
1. fix dt-binding address issue.

Changed from v2:
1. add reg property of dmamux node in the binding of patch 2

Changed from v1:
1. fix wrong title of patch 2.

Inochi Amaoto (3):
  dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series
    SoC
  soc/sophgo: add top sysctrl layout file for CV18XX/SG200X
  dmaengine: add driver for Sophgo CV18XX/SG200X dmamux

 .../bindings/dma/sophgo,cv1800b-dmamux.yaml   |  51 ++++
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/cv1800-dmamux.c                   | 257 ++++++++++++++++++
 include/soc/sophgo/cv1800-sysctl.h            |  30 ++
 5 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
 create mode 100644 drivers/dma/cv1800-dmamux.c
 create mode 100644 include/soc/sophgo/cv1800-sysctl.h

--
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
