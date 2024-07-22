Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260C2C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 01:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2JAwYH9lFzvJXjUole17qHape2/FHMFbWK2SaBVvYVs=; b=T9I4P94ZhBFHkx
	YLv/T2AUBLFp9uzDwPC3WcLa1vEOIVRlR6goX7sQg7foJvI0Dm+oq52ZZy6eKXnj/H5VWwQCJ8PhW
	SjNrA3E/RIzgt3S9WHx+SVRbfQYvqXpunSm3h3UolohG7jeYlu8XeBW7ZTaCO96RZ0ZDcilTo8fBe
	XaSmaiQWQTH7OvD/UmwBNjegMb/SqtKftBr1jbJmG4Uh2aEYj/xJhL8qmeZSyQhr0UhL9JSeZUf1Y
	SuHzazXQcSDCQ4yVcwCghT/9UUdnEeFU0OJp4ikYDC1X9H8PUwn5Til4fb9UZ5GT/yZUNXX3Y+i/B
	UEpHIXSon5UVfHdYj3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVi1B-000000080nc-0N51;
	Mon, 22 Jul 2024 01:39:13 +0000
Received: from mail-dm6nam10olkn2081a.outbound.protection.outlook.com ([2a01:111:f400:7e88::81a] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVi14-000000080ky-3hj2
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 01:39:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFwF2IZ+VBSclj1MF8t0oG9PiInVimrzkVmw7DcbR1iv/WvTy+WvTBU1t+Nnfm8Fi2MwovA1/QBJcRhogXTUlxc5lnIbsPlxxH8AnMeQLheP7dBMhAP2I0qspubLLOhZbmYuRl5iKgOYyhKx67/8+G8lpWDroOHz0rb5+D/MFQggDq3nyUk0DIdMrx7QPVvpvaaXvhajU/3UR5BUIxpDQShNBevoTbYil7VkUjA8z5cT4FiNviBf2tiOB+b7GlBEEqU3DRV6MndXPMY4K34vlynnAxYIsrt5c5Pki0OP8Q2dIPysIkMewcb0+NThoP3rnd6gJ6rCR4LOHvZgGTHYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DRYBECPv89wBAMlppVXOITN+eZaOKkeCXFrnPDQzTM=;
 b=ncVeFm09q3YsFWuiAGNjzqPfPXe9doGLAR8sEZ8lWsVq7GAN8HjzKpeML9qAUT0N656Qkz7N6RFbq7cZkDySTPJs2QMhOHc+noaLqCcH6QiKznLgEGJX1IRAWmLxFPQVjFsX4D/ZgLZbz3dTFB3Y3ft0ooU4MVtOFRatwyvKBU/MR5XFWahVq/iQsG/CfYWyhyexAiVojFc1iID3EOtFedfhlnaYIURK3/cERlI9l/EwPgpNcvbnbqFKtR1GrYf0q4nzeqScTX/PpJjx1ttsYyShTJv82cznZYWWXFXh6Kiu9JZSE5JGc4PGM8+rl5nGufmJ//igOFslLMUOYFs/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DRYBECPv89wBAMlppVXOITN+eZaOKkeCXFrnPDQzTM=;
 b=UxViA/oyRCqz3ZeS3w1x3GDOqkTl3/TwCuduAeCZemrr69RGivBOuxeM6c72gm17ItUDjZyp2NaPC/aakB/G1ECHvGlgZwrGgv2VSNHoBDVRNMvjk+jnhQ9eFpqyEk70f1d7Jpx7yihmRH9a8v+xVVsFp/4aHRmUO7ebR70XG/dvCt2ZY9CtarBdeSN90NChoG1WPku+HruRD5PdjIhh/oDUgVba1m/aqZW4vXqJn8veWhOhFV4PTopRqPZheweXBDDBhZAv4gCnBpFlo9hw7rEac0zVv6+UZyOcGFUULdNHj/QfbUs/hHBHss02V4yKF3PJyOYxlavURgpUTHAvog==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5403.namprd20.prod.outlook.com (2603:10b6:930:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 22 Jul
 2024 01:38:53 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 01:38:53 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/7] riscv: sophgo: Add pinctrl support for CV1800 series SoC
Date: Mon, 22 Jul 2024 09:38:33 +0800
Message-ID: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
X-TMN: [u3wO/2eRbFMbo5l7Ih3LPzk7u2jrrAMwOHotFNtd35U=]
X-ClientProxiedBy: TY2PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:404:a::14) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240722013834.620853-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5247c6-5864-4d17-c4c4-08dca9ef0b60
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|19110799003|440099028|3412199025|4302099013|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: 2s3Ky78fjNM48MPY1Eqksi1DrMbIJhAheYYtptnsRyKUcD7i6Gw9nN4d3+JItKnKLgNE3MNoyWNbhbhIPKVL4rlkymOgEAUc0SzeEgOyZJGA1rfTfV59l299Pfuw4ZnIkdlCGCQW3No5Vo9/ul6dDFRJHW7y8IDVHb2SHh6LUBc/hsUaMWlE1HLHGkhyMhlypcrlGiVW0oZgBKV6BbkQF/y6Aw1tJzGAVNsGLQ9f47zSEoha536QHyktmf+QPvJZwr7QvBUy+aNUNYR882y4D2C6L0xi8KPeINAv2ajFimuix4N2apaao6+HHZ/5hZuGpxjQDk/alaAF3OA5ndnw24XBoWFZPnD7m9nQp8KvjusMpaa9EvYacV7HQZceLjMRmF9jJF1Y9wTbE4RXUl8E3zpR+fVoWmj975zbvOzzaSZ0FsHZyBJg98/9rj8YT1aQ6+p0cx1AY4yDkiRNXm+WDwzsuLiB4Lcs36kqV00ldg2CRJteLGMm1pYIbuia8JTv/Lbw2+flzUjtj1zqqolcKPph/vTGoUXf9yeIikZD6t4sSPdVTzbs5bm/j/Y3NgzsR9hbDXYyxNzRN4ZZhxp/Z0tD4bDlnkZ0Bz8iy50hShl/EzxUml6WhTz3knb3CYtq6M6Qu02X16RecckvLVeYiQLhcOXfZRkzkbEll+/6vd2un+2Xm8w/1/peed3U/mT7EbRxQ7J/hid4hyyCZ2orf+uKK/PYWkW6g2B8xsY6sQC9vSnYQXogk76MFijNQK9aomlOGF89V6cpAKXpjb8Bxmvl9VnuAcBOl020VuWm700=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IzBWhFiKBMwYlg7fueV1PUYtVk7dYKAvUXbY2kCmsDRW5RtcoE4CPo2MA5ZQ?=
 =?us-ascii?Q?NP96a1kxmwJ3n9wZ7kKX/a6Xw7uktH3FA0JPCCyFHKWB6cchWeszljXBRE84?=
 =?us-ascii?Q?tBGDbHEbPFU4i64wdEul2mdgH/fhwMwnWCzP0f4xctqUZj9V6LAoL1jngCvN?=
 =?us-ascii?Q?s+t+J2K8DN9buTEi2F7Qy+iVr+oet2CsFcqvWFWdqYu7Gwbs4xC8DQU8Pb/l?=
 =?us-ascii?Q?mUunI2JmS5XsTS/GSaeycJ6cfxzMmUH0TWXLED+Z7KRaRBEJXKc+KvfgKlmp?=
 =?us-ascii?Q?43RGLBoqbyGVfF5ZfAk1vtRlhP//k/bVPinBNpriNujwFMPqgxGRW3X8TbDY?=
 =?us-ascii?Q?iV1L19BGQxVORuztkwE98bAVJq0IQLAIQ2ff+GaJY8hCfBY8aUN0ZVObN0tj?=
 =?us-ascii?Q?a/NJoVdfK358J3FgY27CMtVxFpOMWavfrobLLXU0JSA6kHk65A/A/Kenx2CD?=
 =?us-ascii?Q?SWiexRY/peOzNOXl8rFWTTYe8RD4zs+waLeVQA34JqoJO81tl6SvrOo9iZr2?=
 =?us-ascii?Q?YOYvTYvm1Pe+QFgycebNv7VP2Fld42Y9p+Uh02CV/3We+Z3hjNhtEbPt6ptG?=
 =?us-ascii?Q?6A2Bj8g1R7HSV9p40J6ueExe9ZV7T0YWRBOImnMhEnjtLaYnV45hU4EdKSzs?=
 =?us-ascii?Q?P7s0Vc4bm5gGAIjM5DO8GZR5KCIh9B7zrztoifQ5IMV/633SPV7OVEvQh96F?=
 =?us-ascii?Q?ZZsEn8QC9hNtwoTWH5M3PqTo3oiXmSTndzw/T7R0fT3bxjLnPqwuWz3DiPiw?=
 =?us-ascii?Q?Q0b/KHYk4UEBem8aOlifdXbLFU+rj1J7dsZnZZGKQFgL9uC3JQXJv6p8YsLX?=
 =?us-ascii?Q?ET65ggpL33aQ9wHcKEKsgXhBd4j9ALPYktyz4EnsFEB9qUAZa0SZ33Djlybi?=
 =?us-ascii?Q?TtDBtFp38JSRUV7IAzbWTFHvo469/JVPRNFIoJwXq+sAZMj++SurvTO2muRN?=
 =?us-ascii?Q?IV6Chd5fVySAd0XGcqGiahSf6xWqdBIG6X1DCRvLoiIciJdkJSkxb6mvt/HZ?=
 =?us-ascii?Q?cdUsWks4B2kUrGb9IM0b5+BX9eSI9B4LZUuG6X94nvcALZYkwYAe/wVVSwPp?=
 =?us-ascii?Q?UEpAuABXqVescQ6qJWkXaF64A92sBzyC2DqxWwi9hYxqgvzOtdadZCb2Jtl6?=
 =?us-ascii?Q?qD74szQzuKhINOczmNClu2oyYnHoLOFtV+yOmtAoy43dD9AD5J4cGz2ePCEW?=
 =?us-ascii?Q?V/Tve50dIEx7I6jBWg1LRQk97A4kebBKZQvOQ2+4vNJTReRbuZhHhg3RH4VI?=
 =?us-ascii?Q?xiM4XariI8xZ1S8fe+LY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5247c6-5864-4d17-c4c4-08dca9ef0b60
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 01:38:53.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_183906_933144_94293388 
X-CRM114-Status: GOOD (  12.48  )
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

Add basic pinctrl driver for Sophgo CV1800 series SoCs.
This patch series aims to replace the previous patch from Jisheng [1].
Since the pinctrl of cv1800 has nested mux and its pin definination
is discrete, it is not suitable to use "pinctrl-single" to cover the
pinctrl device.

This patch require another patch [2] that provides standard attribute
"input-schmitt-microvolt"

Note: As current documentation is not enough to guess the pin
configuration of Huashan Pi, only the pinctrl node is added.

[1] https://lore.kernel.org/linux-riscv/20231113005702.2467-1-jszhang@kernel.org/
[2] https://lore.kernel.org/all/IA1PR20MB495346246245074234D337A6BBAC2@IA1PR20MB4953.namprd20.prod.outlook.com/

Changed from v1:
1. replace attribute "sophgo,bus-holder" with standard "bias-bus-hold".
2. replace attribute "input-schmitt" with "input-schmitt-microvolt".
3. add vddio operations support to report pin state.

Inochi Amaoto (7):
  dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.
  pinctrl: sophgo: add support for CV1800B SoC
  pinctrl: sophgo: add support for CV1812H SoC
  pinctrl: sophgo: add support for SG2000 SoC
  pinctrl: sophgo: add support for SG2002 SoC
  riscv: dts: sophgo: cv1800b: add pinctrl support
  riscv: dts: sophgo: cv1812h: add pinctrl support

 .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 129 +++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  49 ++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  10 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/sophgo/Kconfig                |  54 ++
 drivers/pinctrl/sophgo/Makefile               |   7 +
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c      | 462 +++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c      | 771 +++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c       | 781 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h       | 156 ++++
 drivers/pinctrl/sophgo/pinctrl-sg2000.c       | 771 +++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2002.c       | 542 ++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 ++
 include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 +++
 include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +
 include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 +++
 include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 ++
 19 files changed, 4159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sophgo/Kconfig
 create mode 100644 drivers/pinctrl/sophgo/Makefile
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv1800b.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv1812h.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv18xx.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv18xx.h
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2000.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2002.c
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h


base-commit: d7e78951a8b8b53e4d52c689d927a6887e6cfadf
prerequisite-patch-id: 11fce0bb5b2e9784ec7d6086d5d5e9979360384f
prerequisite-patch-id: 3d5f38fdb9d8250dd9872ab72ab7a438281b4a03
--
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
