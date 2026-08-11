Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF77CC5AD55
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 05:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7+Ufry71lw41SlrE/DH6XwImKYWOZHp2N/SfXqGOHo=; b=ntJ6t0YUgMB9Ly
	uycHoU3BOEK/cAjBqAb0fdPnj27XZNGAeeWfjKbipyQh4Rsdj2JjfmwvVc7+IBVT07GqQRWwRjm4m
	3WIs6EL22Q5FUcQBIjP07zSDUcrO8+1O7zEZqhV/acGRTy6aZ5jCUGy5LHP1exQ75jfkILlCN6sNk
	iTsLJ5c+E9qiLIvU42Gyib67PmMD8HP9/PKtPHifY2rHtHe//2f33AsYgBOGnHKkRekb0mezBqIW/
	uGPp/+Tf3Tu0Y2i3XtONmLZmkXZl5mYUtOnFe/BDmm7fJwR8bC/z1x9gE1M5D3RoQ7WNrwbz6I9jx
	uswhKHGLSMMTYbCgos1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfPQ-0000000DLWj-1aT5;
	Tue, 11 Aug 2026 05:52:20 +0000
Received: from mail-bjschn02on2116.outbound.protection.partner.outlook.cn ([139.219.17.116] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfPN-0000000DLW7-1muH
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 05:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwNHjl3SSBbOlaHs/IijuV+Ie51nqqC/KtIh7SQ5ndWJ0VMDC1eIudQnGomaVs00UARUV/r+tcEaQKN9J0HIrW4/ux29puilO+DyytKowrDs06vcl7AV4VIpQAfrv+0WveWTG2ZF8tXJSqL4pcsn97a8nl2qGILlracncT6NYYhK0H3Q08vmBGBHu4xHIy4wTjCr3KCA96CKfaVP7oNoKHbmxI+jT1TxtafzgEoNWofe+Aqb96K7K8/lrqQcUUKi5eSyo3qwNlBflu9lVSpQf3sDKyt3ZcIGHqgFe1PBfIcdwuRnWJ6maLY1HIEd1wpZOkuObPHnRSkIeP/F1jGJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtfH2KBQe/N6vJ5BppW2aWG7DmaZB8dDPCLawfcBzjo=;
 b=dKunCBs4zhmnyUEJbBCgOn7XrZrVrK3cblVLU8OjWEcvol5GH/pt96uCu3o8RN5Nah798OJ2kAYRipAJ2NaqALlU8Y14OU6yiuXNbBf64bNUcqcX/tJj9eiLHy+Ph9u4FjaeCCdt04eAjnm4twv0FXJELIkPs8r+OUX+qVYA5d9F5ineB1rLEIjLcKBc0cvQ/FGnNe03IQNYWAIU/1arTJnfh0D/IK6mVbdKK+Rr0JUtxPo6fqHusixXpc7MHIvxzXb1MLNCFSrr7cWn3QrGyOaXlww6UTsOfWrEAReTT6OsOxp29WhNPI8UJRmou2kBDEMmQgJOyiBfxG4MDig9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 05:36:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Tue, 11 Aug 2026 05:36:19 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
	<keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Topic: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Index: AQHdJ6GQ5ts+ksAe6k+ENksiQTa0y7aXdLuAgADirHA=
Date: Tue, 11 Aug 2026 05:36:19 +0000
Message-ID: <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
In-Reply-To: <20260810-caress-rack-45615c8d9747@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
x-ms-office365-filtering-correlation-id: ed83ee85-b85a-445b-ca19-08def76a7877
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|22082099003|18002099003|56012099006|38070700021|4143699003|10067099003;
x-microsoft-antispam-message-info: yA1KJl9+saGAev1GOzVvG+orrdBmfIt+uvG6BVzm41nxvYxcNGAtPk9Dmh1wflqI0zbIhAqh3WQm+nJRghDdDTdx25t00sY7V3r7BIccG9SV8tEOB6po1q2lHbrcqRLurpzEcKXYnvwW5z8zguaK2wtTIhC1ZZ141M7tWTTnE58hK0eojmBh9fz73TF6fld/80GrvuKK7zgEuuAOUV1NKMfZwCu6ktzonr0E9lvR7P11CanUMAvsNcd7032YQQtxcbBal/PS2Dys8c9tsUWFOSVngFEeKNbHRYZYcophxIYZwTNzX1hjRUxD8+7Ae+ctlSrAUMFlIOxPW2T+rywcXTXH6PTjdzXTNLNWuqicmTiU3ELn4XSUcbWWEvL8Ti5fovh+SPXQCzmDJMRwnVaX6sxWedn0DjjixS6OATZJn39yUIHCbdBeWcTu0BM1cPsHkmkcLA9qSJMTeSdOkF9tUcsyINu8XeHNKduKNDFFLLyjUpuBB2q8vUBa7ZQU1aNTiP4tTtxYRcVE3eg2v0pNjG2GOT5UWJGZS8LkvDYsCs3WiAS4h+/UnnMU8us5j/vQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(38070700021)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w0XWyZaeWPPz0SaEfeEd6a+jn72EIW57UUJkyuVIM6omn+r6sp3eYmCu4cIo?=
 =?us-ascii?Q?7/iFvThp3Jj033V3Lk9nTBAhmRdTa20oQ6vvHwJGsEWHqLSs/pllXSK0aJQM?=
 =?us-ascii?Q?j9Y0RZ7gg+xPQyQUHzayIzhMouW+/QIDY60BK8TCQ3DY4zThUIpOWmr7EjS/?=
 =?us-ascii?Q?AatEvqrQMU9en3GZBguJwv08O6jx337Fll0W0wbT0pikelgC5n+KkT6ZZG6X?=
 =?us-ascii?Q?plM0qhRDwnCeb7Dm1ABaSz0zvIMoXIzBppPcagme6zdnq7G81rWNTV9TWJCL?=
 =?us-ascii?Q?DKbAoLuGpuSdFkDP9NaNkRn0n/0qdEjgdpPbH0kKGaIGHWaEwKFKR4/Ma617?=
 =?us-ascii?Q?Jg4XeEY4YpdL3gchqSOAF+uE5YsxqzJQCcBcK9hGemqd2CVUs9aMSt6qZDS1?=
 =?us-ascii?Q?c82VyL8lYGPJ/3kQ9HV64K8otZ36pOnRDpoRq8ZVykf4FqPhIQAe8Sa0IVlp?=
 =?us-ascii?Q?Ed5ANFxcote1s9AQootkInwNCjgW/d+AbpxPZIOgLwaOUYjsw8kNF++uBDWj?=
 =?us-ascii?Q?7w/c1vvl+B4ipnk7dr9L3gq0h+GjxEZhdifxWgqPXfDpz/lQp5aOcZ/UqdeV?=
 =?us-ascii?Q?mhLJGbYFVvpEWH4kiCzAmWssqi4xD0FCsCaySmqLo3ypXhfPjcrzb+reN/N2?=
 =?us-ascii?Q?aiEnmu21rdPPA4lc0f+nf0R/38Hz4rkFEge/RssjuuVsPM4+jIE7WrzPZmeY?=
 =?us-ascii?Q?v1mQeA+HqhdTQZ5sNNzElTBx9s+SttUJs9phfP5U/u+Vrea1MeqiTYVURiA6?=
 =?us-ascii?Q?J9J0E5YE8EvkJTSNinol9O0aNpz/sn7hUa0QAMaiTmTrfCELq+IBZZYhImIy?=
 =?us-ascii?Q?Cj9WQCfMeFim/GjaXG8KUVTxQUnbMlOjtU0CE6liWWcuSnT/YOhDfW3qvuCa?=
 =?us-ascii?Q?PbIx0O8QO/w420YNTspTjtgVQ43jsllxPLeor60ZYdqNtvZ2L0joGKuZJyHe?=
 =?us-ascii?Q?tjeBhQhOs98bjiL1yTW7cB/bHT9yif9GA2AQ1ZOZR5rZNfSBKR70ShRj1GiJ?=
 =?us-ascii?Q?mG2ffn11xn5hi3Hjgi4bRzM9Q+/FF2OJOGId6LSDCxsp7OhHC/41lT5ekKqf?=
 =?us-ascii?Q?ZVMbIo1r70ST6VxBNgV/jbY3Ndfgx+oRqoorbKezU//SFP1XMwrsC/fXzXgz?=
 =?us-ascii?Q?m47gQJyLLhyn8Vm6QMH2PwWemIcKxI/duZuv6VbjiUbAxR+Cfkp86PMbfCN/?=
 =?us-ascii?Q?U7Cai+fNh8FjQHyc1GZcNirvr4lqd3ZYwTs7WW87+pHyZZX0ELQib3NWTbS6?=
 =?us-ascii?Q?yq6Rb5lPPhVeaaWy9vU4LVLzUlGBk2MOkOJoOg8w34X/eKosvWBtGkIQRQAK?=
 =?us-ascii?Q?n6Ne7q3J97QVn3wNJKoscFGFTgGGHRfHaT5M2d/6CZXiqIfWlU1rS2Pzp6Tf?=
 =?us-ascii?Q?g1jaZdxsTJXFReVRfXGUnSPYrc8DJpBbNVOCGWdpQyoP6ob/26s6mbdFt7eF?=
 =?us-ascii?Q?+2hopCC6XD7meHHBMDddYqlybDG+anAYkRPuJ/neBMCoWpdwdn1DEL3436kU?=
 =?us-ascii?Q?o5FzndedSq1ni3DNUuduXWRH7E/KbsVdNXfcIQ1RN+zIUoteJDujxYYc1gPF?=
 =?us-ascii?Q?ndH8KXC3Gz0bU5Wwn95AfdFvpHMq4qHONcuzAy8AaS9ZxPFAHeyKhWiD/dUw?=
 =?us-ascii?Q?yrIQHkFAuD5gHWjMCKGeEdOLrEolaFlTxGNxazjPxtyrpnQGCEOYWjA/Es/F?=
 =?us-ascii?Q?cRsgTWBmdSbMRPydZz66TeD2uyppu3E+H8d874yO9iIC5yqZnT1qxa6cFwgY?=
 =?us-ascii?Q?PQRQcFk1E0xN5FWzMM3Yndy1vOnu5xo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: ed83ee85-b85a-445b-ca19-08def76a7877
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 05:36:19.2714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkS+MQ8kQ+y5NS3EOKwOGiWECkTMCRk9+6ErTow4k6erovnD4JKqoLeXDMH0E8NbjHu7ulWRxPG1bNaceC7VyaSwp2vcgjvPLKz1CDvXnFzbRGky+jT3fKo5Ovx3HgJO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_225217_637479_8142E2B7 
X-CRM114-Status: GOOD (  27.31  )
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

Hi, Conor

Thanks for the review.

> On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:
> > Add socinfo driver for JHB100 SoC. Currently available for
> > distinguishing between the two reversions, A0 and A1.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  MAINTAINERS                                   |  6 ++
> >  drivers/soc/Kconfig                           |  1 +
> >  drivers/soc/Makefile                          |  1 +
> >  drivers/soc/starfive/Kconfig                  |  6 ++
> >  drivers/soc/starfive/Makefile                 |  2 +
> >  drivers/soc/starfive/socinfo/Kconfig          | 11 +++
> >  drivers/soc/starfive/socinfo/Makefile         |  2 +
> >  drivers/soc/starfive/socinfo/jhb100-socinfo.c | 90
> > +++++++++++++++++++
> >  8 files changed, 119 insertions(+)
> >  create mode 100644 drivers/soc/starfive/Kconfig  create mode 100644
> > drivers/soc/starfive/Makefile  create mode 100644
> > drivers/soc/starfive/socinfo/Kconfig
> >  create mode 100644 drivers/soc/starfive/socinfo/Makefile
> >  create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > cecb4f279160..90919c672d4d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26040,6 +26040,7 @@ M:	Conor Dooley <conor@kernel.org>
> >  S:	Maintained
> >  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> >  F:	Documentation/devicetree/bindings/soc/starfive/
> > +F:	drivers/soc/starfive/
> >
> >  STARFIVE STARLINK PMU DRIVER
> >  M:	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > @@ -26094,6 +26095,11 @@ S:	Maintained
> >  F:	drivers/reset/starfive/reset-starfive-jhb1*
> >  F:	include/dt-bindings/reset/starfive,jhb1*.h
> >
> > +STARFIVE JHB100 SOCINFO DRIVER
> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > +S:	Maintained
> > +F:	drivers/soc/starfive/socinfo/jhb100-socinfo.c
> > +
> >  STARFIVE JHB100 SYSCON
> >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> >  S:	Maintained
> > diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig index
> > a2d65adffb80..b3b01fc38139 100644
> > --- a/drivers/soc/Kconfig
> > +++ b/drivers/soc/Kconfig
> > @@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
> >  source "drivers/soc/rockchip/Kconfig"
> >  source "drivers/soc/samsung/Kconfig"
> >  source "drivers/soc/sophgo/Kconfig"
> > +source "drivers/soc/starfive/Kconfig"
> >  source "drivers/soc/sunxi/Kconfig"
> >  source "drivers/soc/tegra/Kconfig"
> >  source "drivers/soc/ti/Kconfig"
> > diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile index
> > c9e689080ceb..009f85ff891a 100644
> > --- a/drivers/soc/Makefile
> > +++ b/drivers/soc/Makefile
> > @@ -30,6 +30,7 @@ obj-y				+= renesas/
> >  obj-y				+= rockchip/
> >  obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
> >  obj-y				+= sophgo/
> > +obj-y				+= starfive/
> >  obj-y				+= sunxi/
> >  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
> >  obj-y				+= ti/
> > diff --git a/drivers/soc/starfive/Kconfig
> > b/drivers/soc/starfive/Kconfig new file mode 100644 index
> > 000000000000..04b020083d3e
> > --- /dev/null
> > +++ b/drivers/soc/starfive/Kconfig
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0-only menu "StarFive SoC (System On
> > +Chip) specific Drivers"
> > +
> > +source "drivers/soc/starfive/socinfo/Kconfig"
> > +
> > +endmenu
> > diff --git a/drivers/soc/starfive/Makefile
> > b/drivers/soc/starfive/Makefile new file mode 100644 index
> > 000000000000..ca1e609b8104
> > --- /dev/null
> > +++ b/drivers/soc/starfive/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only obj-y += socinfo/
> > diff --git a/drivers/soc/starfive/socinfo/Kconfig
> > b/drivers/soc/starfive/socinfo/Kconfig
> > new file mode 100644
> > index 000000000000..92bbab62895b
> > --- /dev/null
> > +++ b/drivers/soc/starfive/socinfo/Kconfig
> > @@ -0,0 +1,11 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config STARFIVE_JHB100_SOCINFO
> > +	bool "StarFive JHB100 SoC Information"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	select SOC_BUS
> > +	default y
> > +	help
> > +	  Include support for the SoC bus socinfo for the StarFive JHB100 SoC
> > +	  platforms to provide information about the SoC family and variant
> > +	  to user space.
> > diff --git a/drivers/soc/starfive/socinfo/Makefile
> > b/drivers/soc/starfive/socinfo/Makefile
> > new file mode 100644
> > index 000000000000..26c2bdf1de3b
> > --- /dev/null
> > +++ b/drivers/soc/starfive/socinfo/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_STARFIVE_JHB100_SOCINFO)	+= jhb100-socinfo.o
> > diff --git a/drivers/soc/starfive/socinfo/jhb100-socinfo.c
> > b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
> > new file mode 100644
> > index 000000000000..638f81ef174c
> > --- /dev/null
> > +++ b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + */
> > +
> > +#define pr_fmt(fmt) "jhb100-socinfo: " fmt
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/init.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/sys_soc.h>
> > +
> > +#define JHB100_REV_ID			0x38
> > +#define JHB100_REV_ID_CHAR		GENMASK(3, 2)
> > +#define JHB100_REV_ID_NUM		GENMASK(1, 0)
> > +
> > +static int __init starfive_socinfo_init(void) {
> > +	struct soc_device_attribute *attrs;
> > +	struct soc_device *soc_dev;
> > +	const char *machine = NULL;
> > +	struct device_node *np;
> > +	struct regmap *regmap;
> > +	char rev_char;
> > +	u32 rev_id;
> > +	int ret;
> > +
> > +	np = of_find_compatible_node(NULL, NULL,
> > +"starfive,jhb100-sys0-syscon");
> 
> Remind me again why this is not just probed as an mfd cell from the syscon
> driver?
> 
> (Hint: please put this info in the commit message).

The discussion result with Krzysztof at that time is recorded here: 
https://lore.kernel.org/all/20260405-strong-watchful-marmot-fdfad6@quoll/

One register should not be treated as a separate device node.

> 
> Cheers
> Conor.
> 
> > +	if (!of_device_is_available(np)) {
> > +		of_node_put(np);
> > +		return -ENODEV;
> > +	}
> > +
> > +	regmap = syscon_node_to_regmap(np);
> > +	if (IS_ERR(regmap)) {
> > +		of_node_put(np);
> > +		return PTR_ERR(regmap);
> > +	}
> > +
> > +	ret = regmap_read(regmap, JHB100_REV_ID, &rev_id);
> > +	if (ret) {
> > +		of_node_put(np);
> > +		return ret;
> > +	}
> > +
> > +	of_node_put(np);
> > +
> > +	rev_char = (char)FIELD_GET(JHB100_REV_ID_CHAR, rev_id) + 'A';
> > +	rev_id = (u32)FIELD_GET(JHB100_REV_ID_NUM, rev_id);
> > +
> > +	attrs = kzalloc_obj(*attrs);
> > +	if (!attrs)
> > +		return -ENOMEM;
> > +
> > +	np = of_find_node_by_path("/");
> > +	of_property_read_string(np, "model", &machine);
> > +	if (machine)
> > +		attrs->machine = kstrdup(machine, GFP_KERNEL);
> > +	of_node_put(np);
> > +
> > +	attrs->revision = kasprintf(GFP_KERNEL, "%c%u", rev_char, rev_id);
> > +	if (!attrs->revision) {
> > +		kfree(attrs->machine);
> > +		kfree(attrs);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	attrs->family = "JH";
> > +	attrs->soc_id = "JHB100";
> > +
> > +	soc_dev = soc_device_register(attrs);
> > +	if (IS_ERR(soc_dev)) {
> > +		kfree(attrs->revision);
> > +		kfree(attrs->machine);
> > +		kfree(attrs);
> > +		return PTR_ERR(soc_dev);
> > +	}
> > +
> > +	pr_info("StarFive %s SoC rev(%s)\n", attrs->soc_id,
> > +attrs->revision);
> > +
> > +	return 0;
> > +}
> > +
> > +subsys_initcall(starfive_socinfo_init);
> > --
> > 2.25.1
> >

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
