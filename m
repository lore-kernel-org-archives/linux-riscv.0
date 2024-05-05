Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76E7C4345F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OaN3exbBrwJaYLUtgbJUqlvfkjNIT4Nu9hHFFN9xkjk=; b=SLxk9gC6JOCXYG
	EOgWBkQ8RQ/JNRJhOkpVNr0te8P7/fR9rEla/9cCZ/LInagddYFdmYxOIey5F+rxQjp4+yUYZXY4O
	Yfz0P6S4auWhKgezaLrySMvjfoM9WhW5VD/obs0qgXXgoj9WcuPBW+6cJfYYlqYikZiNolOWm9U2r
	heeiI7S349T3VMYHMVHkiQ+Z2yIFG9UFubHqmjoLNTEDRtuoSJKK+AghLM0p5ZeqK77A3GFHeAPGq
	pW/P7URUSCyo7q5lP26f7D7VFA4NCKj45dWmbiAlHmjhZFG8wc+z16cG4DCki1arHqzdPjq1b6KXx
	Rn6Dtljod9rtksOU/9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3QVe-00000003Hno-14zF;
	Sun, 05 May 2024 01:17:46 +0000
Received: from mail-dm6nam10acsn20805.outbound.protection.outlook.com ([2a01:111:f400:7e88::805] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3QVa-00000003Hn5-27Rc
	for linux-riscv@lists.infradead.org;
	Sun, 05 May 2024 01:17:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWiLxelx24z3YRfPkCDpK+Zg7Vqm6s7x7X8RWHTIa6fjbQ+KVEfQLaCKDG9l/q6xHESHiAlYtW33cDdJbXQ/jw5f6yYx5l5mE8UtIuh444QPQAXrBrw37Db5fKTQSxnLoNNf+4fN7wG837R7YjmeXl05uPPM9B6fiKTHeITOpnzStA9PLSisZHdKzl2hXO4K8/SJ8GKHUleLRy7OwDOG82ixtbnCcayL+ZzmuHo2Hq1v72xwwTuJgQtdYgILjDojdeIjFqIvl3Yg2Hx+Eq4veEX9Yz2JJxuB2Dd0KCeega7cHKRSh5cnpPzEJrASpCSE6W9XfPvtgUInmchiukTD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3nMaR4cTwWMZxDFxLuA7cVFZ9e4fdVmOLkkfBCle0w=;
 b=lWD6gZnaIRHUqlwMGvzmvM0tJSHMLjwOz9XqEF+95BzL9VDPLnygoUf1ZzM/ittdkyhSri/E3EF23yANdRlkvePM5nM1bRo69AFcncGuQ8WMBgsQdCsQFBJL6HxLLWmsuvQyEp/wLZR/+vZQhBCsys5ekSRXUPy42CSZRnQg7IRCMdCpgHdmf/+ORiVzZhxjXBziT8f3CyEzvjPfoW/+UK8yb6PJBlpoPQ4qnbBEd7m/Fg3iluUQRhXxShdddsJ/75PBM7MJFrr44nbDp4KQAHknwtsMlXv4wK1V6k3KgLT7l5bK6zfpKSdn8HxNFf/Rc54NwR3o9l3L2rTZKV6sIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3nMaR4cTwWMZxDFxLuA7cVFZ9e4fdVmOLkkfBCle0w=;
 b=eN5K8zr/p5CFrql/XYvYS1GpZzJTE/K+tWx3/S8giLpAqJj5yNHwm4HSqiDVvoRyGn7vjJEyPvLjD6lQzfWnJw79CUkQcdTSj3tsKz7ZYls8L07pJi4r0AbFDGtaFJ6yCL9Fj1P00taZhmLb4Tq27I1iJXlCjZ9k/iCTC2h1XkJQ71H0P7cgrgxou5ip+ZwOf1l5zAoArmXy77LQRQ/RnbwItgTQkGGqK1m/2JkQ9uiOAzjLb2uUFRV8C4jkky0fFZuPm4IT2zzdvhdAF68FEl+SphnNdUaeGmC1VgZhi0qfiX68rbN6bdFeYc1P/7wa5Yc7TdXesux1fCHEtS3O7w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB6964.namprd20.prod.outlook.com (2603:10b6:806:3a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sun, 5 May
 2024 01:17:29 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 01:17:29 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/2] riscv: sophgo: Add SG2042 external hardware monitor support
Date: Sun,  5 May 2024 09:18:00 +0800
Message-ID: <PH7PR20MB4962C6D8FD6989BC79F9483FBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.0
X-TMN: [h5eO1W7XnBu76wb8lUvbN6Sq9JbTZj0iKUUArmOfHFQ=]
X-ClientProxiedBy: TYAPR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::21) To PH7PR20MB4962.namprd20.prod.outlook.com
 (2603:10b6:510:1fa::6)
X-Microsoft-Original-Message-ID: <20240505011801.356972-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: b8dc15b9-7383-47e1-b876-08dc6ca11f32
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|3412199016|440099019|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info: FN1vYZcnP55W6M3zjAT/lJbbok6GQ4zccn/twetKL6KnhRP0LLVFSFjsrcWG6tG/qw/8eXNm0jitLvysR1QLapJ1d9RgG+o0/WAWNwDM7slLf8lUNiagYqLJk4ZtFnwXBwIsKjrpv5EEn9JkSHeeSGhfNz9wSzIodI9ZSFqimvD8BqvuSgLynxDmIPZUeRYlVKCD62M+ww3p1PyttzQpUnHCo5xJ1WdYaka3KFAUKb4SaVk2724OVL+Yreq95++DaAN5+ddojj+NhUmNsLP8w6sJQfqZUhoHUnvM59J/TqhuYr8jZ1p9EXIZMdSpkpk0mUwho/toJot1QriYhxZCBhAGky3D3rukkMAJiaC6rNFXy/SElv0fltp1nnhD0wQKyEOm20qZ58/JQl82In+XTZuWTAiYvASAOpwPurfYg9PAHHjFngwE7XzbVtXBaFOP5aeIK8iY8917QbEGus4c/aaqGFO3Ff/ffCOSB7FwDWjOwidY8EA/LedYYXOANHfD8ljzNfvderlsdi5HEKXWvXfwn3isZFLt8450/7cDXgYCSmW8CZvDlENJJUdt5ybPmjIuMzKd2vJ9mK5r4fs8YydG0ZnIqot0WKZeFf3G+kKlYj2wYD6x2g+MxAcytOIgQ4cFmDioS/tImg5TowLHn+qOAi7+uV/Y6WsSWx0XdDfuEUbbTmBXnvZEn9/nIYvK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r5giSZn9yeVTSwu0w6jTyeQt9pXHjgmGlOgygu7GrIMqVJzECka7ogLcxPpg?=
 =?us-ascii?Q?cp8/mJit1afBiu02iMxplbjtskJ1hg/pQfeaU/f9A1/9kaqKrGTHzTXqlmwe?=
 =?us-ascii?Q?mdHnDae30OkisN6g0qP5QopRLxfcrOnKHdl42o15YU68vDcQyP65vLRDTcNk?=
 =?us-ascii?Q?sd2brUxU0AbIEDlSmnKuWTvDOF9VslNyCQIFDuZ81lGY1ObSTq48W1015hD7?=
 =?us-ascii?Q?yKBhGiPLaC929hXRZQuOj0En4rsDnOcXnu6k54k939nAie527o4tDO0dzs6F?=
 =?us-ascii?Q?HMWefM5KukUfjK+AA/sBTGtNHGVuCku7M4kkX348NgOoujTNmhBtjjlr3dVw?=
 =?us-ascii?Q?e4zWUmWeaEMklvLoLpemnIZbsFaOGzJfawPSUoyXARW3SaeqBp833RmRZotw?=
 =?us-ascii?Q?MRXt+ZGyMPnvYNUJxKdJWjaccT0xFksuLRxsiWkLpAB3U9+TMZgM9rfx9HgY?=
 =?us-ascii?Q?YCpm5ZioGGV2gWQim3TSh57dTlZQDwc2O/qa9YsLbF/2e6FE2Zm8sDAhH2L/?=
 =?us-ascii?Q?ub8x8mm9uq+FOPX+fQmkCOvnJuytMaeIR2pvWgFxaqNtMzMbXMIHPDDgRNqu?=
 =?us-ascii?Q?MNxChCpwmTThlcGxFqRhld4htqt39+uaI9JvwQmN/ACuOQgOcRYbQxlyIrYK?=
 =?us-ascii?Q?xUCmgw5geAatcEyV0FNbCpsuLWuBjm2ZozM8//PFP3biCQXkbErOCiQSedkt?=
 =?us-ascii?Q?CWY6iMlBysIb5iKEUdGUDGXY7DKoSoByx+drnr4lp66zzh2/8hDZZ+eGNd9A?=
 =?us-ascii?Q?yzF0sG9Yn6XIbrpCWAQO2a71Z7cXkco/vMco+JnVE90D+G9d8AApFgTif7Zy?=
 =?us-ascii?Q?DeO3HClfDoX8zlAEeHdAvpfhCWQkn6wWU49xWTIFoASKJdvE/ZMKlpa3Wvb8?=
 =?us-ascii?Q?H6YJfE6tgkfBLJ+8vtZIRg14+2yWYVkVdxRQt7+9ULsljbr9hWFQX3CWT29T?=
 =?us-ascii?Q?NBB21SSaeFbwCKib0ag+leAR65xQ+dD+Nopzny9FA3Pyeak3WaVPWv3AezUL?=
 =?us-ascii?Q?6NVzQ3Ldu+24hbyyYMrDoA8NkGUeh+mSKMmQuzP9lmDsucvclIJ6YZGGxzNW?=
 =?us-ascii?Q?bpcEivLkCF8oFTySjaBRknbJm1MTmwNmgPXGxbqI4J9je+CrV1dAbcL1ws3l?=
 =?us-ascii?Q?3gca7YppTFva5ZROdSqBuXrnxUSsCEGI7Y/crE5AuVTGXl0zHU7i98Zr6WqZ?=
 =?us-ascii?Q?8G6W/ULNXqvEX87ResqnHDReHWkjeZJvMH3LO3VS97EgPcLZJIk92wN3L5L5?=
 =?us-ascii?Q?k57fVHVE27bxe8jButc5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dc15b9-7383-47e1-b876-08dc6ca11f32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR20MB4962.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 01:17:28.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB6964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_181742_653669_A2CC2791 
X-CRM114-Status: UNSURE (   7.81  )
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

Add support for the onboard hardware monitor for SG2042.

Related SBI patch:
https://lists.infradead.org/pipermail/opensbi/2024-April/006849.html

Changed from v4:
1. use fix patch for binding ref.
2. use unevaluatedProperties instead of additionalProperties for binding

Changed from v3:
1. add thermal-sensor check.
2. change node type from syscon to hwmon

Changed from v2:
1. fix bindings id path.

Changed from v1:
1. Move patch from soc to hwmon.
2. Fix typo.

Inochi Amaoto (2):
  dt-bindings: hwmon: Add Sophgo SG2042 external hardware monitor
    support
  drivers: hwmon: sophgo: Add SG2042 external hardware monitor support

 .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |  43 ++
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sg2042-hwmon-mcu.c              | 531 ++++++++++++++++++
 4 files changed, 586 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
 create mode 100644 drivers/hwmon/sg2042-hwmon-mcu.c

--
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
