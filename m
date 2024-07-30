Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF715C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cB/pkvu5TCDH2aXUXsQMys9t3IDmlnqz9gmi91GpI3I=; b=xIsUrfNwT1a2W1
	5tUloTV9mGHJ5N9qE66jxbHExpSZ5/hpBs0FU5fZmXuAI1txZbtJ9G6lepH/tG7ex8eEoxfh8/dDc
	8C/t2VbtPIwOJ9el780y8XTPShHoqA5faylwMHhzCu3ZnLrpzFAb+Pv2+/k6G+3BeOZ1YFPo8gcAj
	QANeVHzUtRXRI7EzV4nxXu8RYkDNoaR7irQXiKL/XuKM65cZfVXU+47RrPyIU9xzv3tBaZCguTS+a
	plndASmJGn92yQqLoatyPeJxcp9F27yxPJC4ra4EeS1lXGocwX/f5WxJtxSUHnfhrpVYobNCVjFNh
	8yzTd2/2kT/B9/W72wlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhcN-0000000E5hs-2rsr;
	Tue, 30 Jul 2024 07:49:59 +0000
Received: from mail-dm6nam12olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c17::801] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhcK-0000000E5fb-0p9I
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 07:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Plb3ZuAh/wOlKYtvHO0ixcAWg4poHZ0ixV0dT72ll/a8zPUqDpqJyHaaQDBuG48dIDgkr2X+yPpsG5xcJjeNSK82Ql8+WoiGtsQnqJj8Ju/TJfGKw5yY5aXgxnmRtNrL/aIw1LW9zVzIKeqTJQcwNRKLwe36mm8a0zdZf74ZnOuWPc9sF7Dy9SUYnTDoDLEWq3E5/Qua0jDiZrjBNSwriM20eQwCzQP8/oGWXYclbaDHjQUlRwll6HPkiStB0BWM8HYKmSSpCWA6oCL7V/e+gSd5/mMDvHvTJc9SJMmxem4+pI9Q+MeYSQLzXQ+JBoD4UHLzTREiKuTbMeDcl1ay4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MDIH0TdH3THLul1CiKzfxoh5McR2HGXNJ2L6FJoGMs=;
 b=mYXQWKyzhO/SSY3Fnt3N75yKRG4j7G9U3UULtEZtxNLSiQ1Tba0Ggmh6Ag6I/1FO/8c2wnkjzMExEaTVfUgKuzw+l2ZcaLIQsDtMPLc1XfSwpc+q1/ZoH3Dg5u1ifrFp5thQKKCRL3HWqSQMOo6mxNChfTWjkykabJQjhvd94Sg/ak2qev4k2v0Pjqmk/EmVJqFs7vGq0yIifFNICdPIKsg544blAg4xP37eh0vdWZVFT1YEf4IycnE4RIcrmKEAKd4VooQ2+5XwamMqgxTeKF+yAdO8isjQhsBBYyt/osZu+XplzRUIEk6B1EHBOsYlMGBQYwnCdLtDKu+NitfGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MDIH0TdH3THLul1CiKzfxoh5McR2HGXNJ2L6FJoGMs=;
 b=lYzWXqplN4XPAuVMeA99zhEr0hz08yq+g10+5auAgl8zvHX7RDvpGEwnP9g0M0YUA1yN1YDNhSIzneDv4aF8jVFk24XGq9DD1hPL7VoLind+4R+/JKkh6pzbRgvlugAnrfIPiCLxfPn+Vj55ob7FITltVjsucCrRgMTflqvgH7XXyiH4pE31paLCFmMdV8G1dn1HmNF/9vG9ROvJ7F4YbQamGjjwUuJtSGXkqneKxwXlu9Ms67WE40cn1lxQrDi4ozYG3tC+1o2UThme8XnOpSth3mhyvUSI+zNJSYHPMMyWkTUxdN08QpeFuN+wNMyAKZ2VIRm+/lP8UWu642UHBg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ0PR20MB5253.namprd20.prod.outlook.com (2603:10b6:a03:47b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Tue, 30 Jul
 2024 07:49:43 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:49:43 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 0/4] riscv: sophgo: Add SG2042 external hardware monitor support
Date: Tue, 30 Jul 2024 15:49:13 +0800
Message-ID: <IA1PR20MB49538C09E94D90F07B7B2562BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
X-TMN: [zfw/hIWxqvcL1Cq+vX0SJ0YG2ugcqXjORz1bTFh6noc=]
X-ClientProxiedBy: TYCP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240730074915.486187-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ0PR20MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5dd5a5-8a26-4641-d0f4-08dcb06c2ca8
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|461199028|19110799003|8060799006|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: VNqfqXbd+rNWtTQmcn6KMSYra5fHnJwRWKfQ5GMilwbnMgYEgs7FZX7kfR/g0sc2T3mucAp3zatIDOPgdUCyytTEJ2zDRR5vker5bZOhVe7JzMc2ijQd6b8xqkkpaIJEGu1062IcbVtaRuvA2upDfBXcjibit/kR+tJZUHYbiSHgebPEABC3t5R4KYML7Tl0n7mPJVH1pLh4yaFUBHevcPaPPgGu8obml82QlDsvZ0EowEbOlPNSuw3T0WkaOi+hJMv/AqYnu8yxj5Om+42JTudo+m/pi1wSy5oJAyHbjQWrO3dPidMJViTKGFvr2WGrktAoNGwf4Oc0fe7QhuC/o3Ow07mGXeQoOrIqdoomU5PKieqhk+G8aYbBD1N3DvSDQuaaFYkuurEY21WqFJYTm+GtiE5IfRw/2HfzHOIkpYZzM86f35lS5ujdHB6tW3AATAE1wMArSq5miegVO4JeviaZw6IZx9wtJL9zzxnzcII/mrjoMgmewHE0L8NVK99jRN7ANDY4GHb0hBIiPeyJxnsIZ0j2iIMLKyy4cwI5RL+uQz9HG0P1NCzzLNd5xFYfLTuqByfs3cO4gt7xTxaejzSx80MrQp++tu9YetIZEyCGF112vmNcBu3mbjgrQR4wG2KTqG6YkqLaA7BTapGNioF9a2NHck/yK1mx9VFPO8TvkEX2v6Xc5h0Qng1oVbehaYPsfmiA5QQavpwsFPmfDZodt8jqHYoTR3hf/ES/c3sMAG2dGQxb1OskqnebgPNX3xsvJpWvoydXQAxvA8dbbTGK4GFPQ9MDfwlj3syzrN/+Ff/4eYLKPXOU2SEQtOME
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ChfMbh1DA0HuVW+vo+i5yKckQcnWHzhB0PlMB8+DgveIAeLw4eqMPJ4Rjo2?=
 =?us-ascii?Q?zFdpIy2x0S6U65BvCQs9HRFcIsATmCd5wFIGdIvHAmEBglP/9+lk3AN5Q2as?=
 =?us-ascii?Q?gyujgNgNvCJxFijCMjR6mpD9p5hje7XiTr0nrucXaYw9cNS1kaBJ1oWXqRpy?=
 =?us-ascii?Q?9BopVT8abrvf8JqW5E6Gt7XuROtwlHYVOkqvKsu/CB3tT76LUJkzg6B3NGpY?=
 =?us-ascii?Q?RjLaUXT9JWbrFbTcVfPvKwd22J1ulaofvGUqtjJ7eTJEq3z6UHcMrvjlgI7I?=
 =?us-ascii?Q?QGw0PCLJ714/zOSt7y7IFo3VIg6aJDhehkSVV/qg/scSvM+AyE/5fxNPf/Tq?=
 =?us-ascii?Q?660/aGoeotK/noJV6O5/QHdn2zAZMBtUEAJpPOaAxSz23VoDIl2dLKf5pC0O?=
 =?us-ascii?Q?72GHWogCr9/yILDTfU9idw4wLlXAarrGos59/Zvo6U8cxXL8Qtor8ovJKLGB?=
 =?us-ascii?Q?m1zgWPJffdomX3SniU1/puyFMGAdk/Olp856DjOq43zSfqEbudl0Ftk/7+Fl?=
 =?us-ascii?Q?yYMlGs0UtYthKmDRuSTNdSvpSA/uimEWJ79u60PoTlaohRMwkNynODyn4zau?=
 =?us-ascii?Q?eV7X312ZLZGebfFnU+qp6eiBQL6DOT021l9nBazlvu5RBI8QJDVDxFM6H5Uo?=
 =?us-ascii?Q?wx7jyOumwibvZJOxdr/EMkQzapg/HNXEQAo8z1eP8V5Ivdf8tB+A60gnP7/v?=
 =?us-ascii?Q?slwreTt52wx1M69DkVTxB+cc9sASSg7eY/4D4Lrd1pL2F99RkNLhdQ5c37EQ?=
 =?us-ascii?Q?xVt9FcSmgeEcWqOjwdV0+yDBtOaZgVNZtndgIZdfknMhNmKVXc4yF0NNY6cJ?=
 =?us-ascii?Q?2kDKTXon38ijbj1BJDn68UuyULb3ANNFVCoq1FgE0SyO/rpc7chC+dPmkRsy?=
 =?us-ascii?Q?ZnfdVxhQgmkEQblMFFuGmfxfO+yY6OCP9iYqWnntB+5StjVGWAPpSfQGySAO?=
 =?us-ascii?Q?Z3KXxy2wOaA0RWNE5BqMhaJSqXDROFtW2onndaA+90pR9Ol5nVXzwZlfrXyb?=
 =?us-ascii?Q?GWp2Oa0Aa3mOtqESDzXOzIunA9+sBJ8iPWzweDj5BFtJc44QAELadqz2TI1d?=
 =?us-ascii?Q?zPHbfDBo1uO+1tVmw9iEGfEZsrpwYr/YI7QYLcHtelHxnnftf07zm47Nm00m?=
 =?us-ascii?Q?gGZVRtlEMlGDH7copyGDKZ12TJURRMQU7TZf6Mu5jVaAGVlyyJoSg+NKMsrE?=
 =?us-ascii?Q?hxsJsTSNaE44OaZJmPafmkWbKs8E94OmXaGP+gca1OH4V45i8iPpUpSUJP5o?=
 =?us-ascii?Q?0UuaXrYiBRoyFXBlQj5q?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5dd5a5-8a26-4641-d0f4-08dcb06c2ca8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:49:43.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR20MB5253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_004956_248746_79229C67 
X-CRM114-Status: GOOD (  12.17  )
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
Can be tested with OpenSBI v1.5.

The patch require the following i2c patch:
https://lore.kernel.org/all/IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com/

Changed from v7:
1. add mutex protected and fix the return value when writing
"critical_action"

Changed from v6:
1. restore the driver name to sg2042-mcu
2. remove unnecessary wrap function and check in the driver.
3. add dts and config entry.

Changed from v5:
1. rename driver name to sgmcu as it will support more sophgo chip.
2. move some attr to debugfs.
3. add standard crit_hyst support
4. add documentation

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

Inochi Amaoto (4):
  dt-bindings: hwmon: Add Sophgo SG2042 external hardware monitor
    support
  drivers: hwmon: sophgo: Add SG2042 external hardware monitor support
  riscv: dts: sophgo: Add mcu device for Milk-V Pioneer
  riscv: defconfig: Enable MCU support for SG2042

 .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |  43 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sg2042-mcu.rst            |  39 ++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  60 +++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sg2042-mcu.c                    | 406 ++++++++++++++++++
 8 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
 create mode 100644 Documentation/hwmon/sg2042-mcu.rst
 create mode 100644 drivers/hwmon/sg2042-mcu.c

--
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
