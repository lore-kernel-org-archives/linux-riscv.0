Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970B0C3DA49
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 01:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1yvP01M+meCitg3OdWZvYSCKMt47Yn3MYvKEyT6YMJc=; b=eLuNpb8dh8blKd
	qdQY1sJemBAIW1Rf8HmI187L1qhCJJjAE0aFUIFOE7AmKsMGHO0X9gMAIeXtGbrASrlXojTmCr6Km
	mfXbwtlBUFQeRhdFvrd+X77l2/ZRY9InLbIxgRO/Yajai90VPguPgrkyxhLJfkHM/tJRB7XVu9mP+
	C211heES35eIUzn8NMwZImijOphz4wsctEVDViYeCF0I3osk7o0PpdRIv44xQ4DPl4UJeCgIstWvE
	jIOFYQisMoiNzm1cSUiZ3+94kGqEvovZEl72klMrPgpo1ILXJCYpLpc8zXy5D5s6eoqgmPnMpLRbO
	VCZ89XJLEyqAZWL4+1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYEmE-00000009YOK-3FnG;
	Mon, 29 Jul 2024 01:02:14 +0000
Received: from mail-sn1nam02olkn20823.outbound.protection.outlook.com ([2a01:111:f400:7ea9::823] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYEmB-00000009YNZ-030i
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 01:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+8iPfzuyHy83Vz7IHZXi/cNfbGosFjwLOdKDLp44APjl7/h305zbk1zUxnZvz3+34UyG/DgwfaEdUGtczxe9ZN3n4d3vIkuLkhDEOqUc8P71cMLjZTRyzRSkTtDo3SNFbCLA9+JfYuxOnUOs2aa6ChMvOrhdp96Q84rknRQ1omgY59Ie39qPEHkvJpjy+5WCklhHp8Y3tI707js+ZOJNA8pD/TU9T+I4KMzT8VRLms76q8iuuhxgFVAkzgGqKQIuknxGpJk0lpimqJO5VtF1FrhnVQiZLLCL/hH5c9IXoz/Axn5VoeUGcst5l91wVNTp5ZHfAP3doBRMrGcn3HRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD/5j7U73VpBTb2YWZQp005DHmQSkPACYirVO4xXnGM=;
 b=ShjPsYxZOCKPqTvnBmhgg1eowosrVD1TIfn0D7W8PsKBAavOm2tedvbViwT82MN255LCSDuq3Qv4jOJqMpmOKtI10f45aBDpYTWp/Zg4Q1nLwY+eqVEKtaSQygaCH+5xHKTjguGU4Pk4rnVPp08nBBramweWGi8jP+bOHxnvn71vFdf4SeEcVCtposS+/khyDMXg7emluATCB2TfYjOIGYRHKqwT5ADxFLL2ek8hC8E8HIwJ6e1/9TC1BIfVNU+rgA9QN8fAy87NrKi/Vxd/iaHgo60W2RMdKFzAPA1gmykJFvvvuIBL1/H1f+G1IZfixlzTXh8ONbaseKS+Uuof7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD/5j7U73VpBTb2YWZQp005DHmQSkPACYirVO4xXnGM=;
 b=VLOzAA29PH3vZs5xNI9vNFItGC5l02gmfoJ7y0dtLmV25Sb6/Vx5Fw9K/gUQ8mZdsRZd7+yN7GnL7YQ1JEVFV+v4UFeT96jzr1Cr0lgwqoqDFAoy+Z9Zs53dD3GIbjQi+4jcBznPaYy7Xg5rCp8Uvs+2FD9JjKsdE+2aGEFO2fLh1ugHXda6GtAFKEwImAwt+h559h3odRD0RblmYvdmypyl4uXKVZcCqGihywr5HhJMFAGmvviiXRFjD9upjwI7z/WmDm1BmWJuATWBS4g8m1R2tJThi0Or3LdZ3tSmj1Ojgs4t9EvIUbC5DwahXqPvlQ40klDsW2ObjkCyRHxK3g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7300.namprd20.prod.outlook.com (2603:10b6:408:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 29 Jul
 2024 01:02:01 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 01:02:01 +0000
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
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/7] riscv: sophgo: Add pinctrl support for CV1800 series SoC
Date: Mon, 29 Jul 2024 09:01:38 +0800
Message-ID: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
X-TMN: [4aY9L8EWsxGCiW3ggauIxEwCzZw4XdaPAt2yNS8YBO0=]
X-ClientProxiedBy: TYCP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::11) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240729010139.648085-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c64829-4344-475f-4a33-08dcaf6a0d96
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599006|8060799006|461199028|19110799003|3412199025|4302099013|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: 1SXeZ+9MiEjefGY0iIZ5e/lT9216g579IpczjMoUIaI/xnMKR0WnOw54BmmFyqRH88kcXOIoV97RDBsNYA59E8rwZtIJ94J/ZXThyD+wSENOF2KcYyZdSx1p+RAnvkiwZtBjDS+NepyR4jUafimNYBdXkofec9OXIQPH9Oj5/gdj9W6BnQx4RvfKHHmhfxp5X5cCdAMOehmXdEXYLXAvsdYspYO7GZw8C8BGhBZ/CR9wILJkDzdsaRdPfTa1lagvOSm3zzcivzQSO6CrguD32KM8o0s0AksSDf00m8lL0v4ipwp2AvijrWnvjm4OgR3OejWl49Eji64riixSW3lN58xuTg+oo+zIAdsH5bk1ZMjgBAlspYUKy5jULw6zLk+hGJVM7OX3MvXQJ2XUN19y4RkahC54F0je1Ym2pbFKBWxaU/GtO1BLCvO8zQBmcrRsL511ryyKNtPibsNeHUW6bMwmJ21u1LEfuxA31d1VoBsYjqMSLqE/ggjPX2E2CTKukgTBrNPB2mQijZwVPOWMxT+bZtVqowAulaiwPni4oOJT/t1AyEEKeeDMPuCihsRR9TM3iX6NwIepfECrI/g3R8Qp9+hdMP91XYGwz/jXfOCk/GlJsFOtFgRqYOgCQpe51017FdmAoqVQBBG9FKwvMfdU3kIytTU2JI+MPwuHKvQDcam6TeZrxO9uL4N4jdXKO9Xo9+E5NIXs+WCMOxs6QrwuL0bkfJDY39vhWmkA8ig5+fR7kMs6xp2wokua8cwkB+pd+MCaPoXvznDqgli6e/ddsG++MQ1Y+OTkn8Y68tNwH04p16fNYXtCJdbV7xEt
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5scg0Pf7y//6R7ok9NwntRaITCqKn3NziXokDn0yWFq9zj9Xq5JDBG8h1igb?=
 =?us-ascii?Q?Aspeh3Ju/cWHienVnuDQUiTd8iYjlYvLnRlFLb8yvd1YVmlHY6OOBb6i9ona?=
 =?us-ascii?Q?TMzVNKY+2yKJyb5w2FtxF0vSwWRzfAkow+1QtG14RZH4l6bJAJ0/i9DVCFlR?=
 =?us-ascii?Q?vAaS/E5osvxu+StfpK2JzycYnLixyARfgcjBEDWEE/r3+lJdfeiGOUHG+bpu?=
 =?us-ascii?Q?w/zFcnaOlV4r2gMuKo/XbbhrJkgnE+emUDZsQ+WCKA6JKnoySKooffi8y7KR?=
 =?us-ascii?Q?UJvu4xQNsE623ZquBiphB1tnrk8QauFBFmry9DRm+HvlyTWwXo8GCUxwWqKy?=
 =?us-ascii?Q?+Vi4YaH47XtK0/i5NsMLJSVeg+21dZNhVuBWZKJVqWspPcfOc7m3AkjsSk2N?=
 =?us-ascii?Q?Y4uSnwcek7lBf79P2LU2otKuqNsBeN4jg0ikRLuAGu7JhxlTSEe9g0xhg0rf?=
 =?us-ascii?Q?TdaZ5apenm53Sfo/k+rYpyuS5nFXzocOfJWjG0IcripKXKjbeWe5JvIBDqcS?=
 =?us-ascii?Q?EIE/Nws9RttiRUXH+IVL7MtDu2b64+YQacO5bSnnA6VemR7wxhy57LMkTDqJ?=
 =?us-ascii?Q?QNL1HZZE9zmgTqDC2Vi2nqxu6VcoqcgnuxXAQVjr5th9DoPm/++1N9Dhzh7K?=
 =?us-ascii?Q?Iv/f0z0UxQH+Mdb04MP+6kJEWhwFQyqDlERvPmHnc1RUMLFys6A7AW+1wa41?=
 =?us-ascii?Q?bJ6+R2oEkEzNTDi/VxKp7/CI2Cm8pUh27wZKqKB3YTXdlmb0k3IxwMFyR38T?=
 =?us-ascii?Q?GcL8Ge3azh9K9MBLo4Vh/+t3xcntaPrU3pZh0IqZxK24RwK5Vq3MNTXTJn8G?=
 =?us-ascii?Q?SUywWCqcs+YfVTOitfZMwWlTABOiBQpOPECe7/7LAJHbMAlspjT59esFZuEX?=
 =?us-ascii?Q?eQDVTaXjtAtHtyJqz884QFv6G+i85yav7w7gmSzfjPkQdDlM+KlWVyovkV4r?=
 =?us-ascii?Q?6YsIeNOw4KdvZ/Ix432asUmCqcBa/UzUcwMoqxwak9v3RXdTiDGbnj9v5dV7?=
 =?us-ascii?Q?iKvyUNYsyiAhDk0Xhnt5AmYqsQXOhuOlvd0f9u/i1jJr8Ie5f1jC050mQx5S?=
 =?us-ascii?Q?irp3K7GDWZoxP9ZqT5eeUcLFJ0Vlz4+eoSYtTNNhYblzPoH/I7WVr8UbYfjA?=
 =?us-ascii?Q?j9BgAcmzgvIaitQcYtOkhCby4V3RI7SizjHAVfrCtgtiaGlpbp+cJ+E2JxgI?=
 =?us-ascii?Q?PyB+WWBy51Y4BDibaQBEjJ5cuSbL2M4JOXqZb0io3BGKFXFsTycGOJS2bqNE?=
 =?us-ascii?Q?BV2yKWhYW/ovUBCmTwSU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c64829-4344-475f-4a33-08dcaf6a0d96
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 01:02:01.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_180211_090694_01E44101 
X-CRM114-Status: GOOD (  12.46  )
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

Changed from v2:
1. remove unused export function.
2. drop "drive-strength" and only use "drive-strength-microamp" in
the binding.
3. drop unnecessary ref in the binding.
4. drop unnecessary entry for binding example.

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

 .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 120 +++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  49 ++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  10 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  10 +
 drivers/pinctrl/Kconfig                       |   1 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/sophgo/Kconfig                |  54 ++
 drivers/pinctrl/sophgo/Makefile               |   7 +
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c      | 462 +++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c      | 771 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c       | 765 +++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h       | 155 ++++
 drivers/pinctrl/sophgo/pinctrl-sg2000.c       | 771 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2002.c       | 542 ++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 ++
 include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 +++
 include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +
 include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 +++
 include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 ++
 19 files changed, 4133 insertions(+)
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


base-commit: 0066cdb6d7427d785e1a878070c4990384b93508
prerequisite-patch-id: 11fce0bb5b2e9784ec7d6086d5d5e9979360384f
prerequisite-patch-id: 3d5f38fdb9d8250dd9872ab72ab7a438281b4a03
--
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
