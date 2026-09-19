Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEE9C982D7
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3DOg4yqvjPOYX2G6ytYbGHS47PyVZm4K4sJcUzk99M=; b=fhzuekG2lwGefp
	5D7sb97SA/j7UnL8H90JQ223Ci4Ch4YLRtxnN3VcCesyQvLOahGvj1ejle+MWDcUb3juxzW0icCsx
	f0csUaJNN6v8ItJYjKeEoV/uZFoUuMnqqOrqaFqnCZm02FC8kL1BdDkFOVHVWCSd3qgsksjbh4Zps
	9x232Dh2sjDRC9hiGhlRADKAuLvMICbc1dvN8n/B5O00wvs2I9CdlbzK9bWirRk2gh6NQP1KzLnh0
	OouxkURn1Wads9gcRLAMQaUTw/otC6bpoleymLoP2qktYjVk4xXOf66jy21F04H0i5qQwCqbouXLu
	MzWNTnQuOVnfEDXdHaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rrD-0000000G9ea-3Unu;
	Sat, 19 Sep 2026 09:59:43 +0000
Received: from mail-bjschn02on2113.outbound.protection.partner.outlook.cn ([139.219.17.113] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rr8-0000000G9dj-0hpT
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 09:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWUANzW1vBjxuVTNXEADX09OCMTu6CG3qFSkQ9C+ii6nM/O1Ks7subBYcEM5/r4qlBlts0lIi87Go0Fe8vC6WXRTEhBKix7wUB1mwuyj4rWUqL4HQSsEyYACK8avorgljHCFPzDplcnfKlKQajcvM2sfXWgmmLTRS4uZpHVVCfXjEF7dG+JbwLEITNJFl+LyhG4MTFlWu4U7FIkZGA8bmQKgyUdsixZscyZuDfG1hjVgoXPyPJVU1FqQZ0Y+pRFK4RMkSPoGNvfMnpLgNs9UATmu9ZWuUf/4tklfvuZD61IG6H9Eo250fNXaqGnYxjtspPh84T0qKHkyXo2eoukhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ada0BsBMLhTWoyMyz6qAFbKAeXcqhDS5cNiPl5e7V+M=;
 b=U57Fbl+WQ/3l6Z4pszZByfylliiJ6XVPLjIqzH4scpOG/3t7j/kkCVHuNmHJa3FxECzX/7JkjPnnxs79G1kGVOmD9iFuUBGAD/5D17peCAvYGE/8BogSzRoqa3qu1OHCYhOKE7MmcLC4C5AtHsrM0eSVfOP34dBl+CSTtU9JIdHh52RaLLAjU42aiqqBZYMrRtWxXnZb+Cf3u0aMetwXg8+AlGqy1uAzrE/bsmUCat4P3JIIwRgmhcO6eZuEyASJIlZ1wYtbEhhwsYUmIKa1j+irxhArr29Rxa/Nd0FYfeBpghCZ5L9I5T2aQeH7iPKie1KeWY14DP3ELBItSrYskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1283.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 09:59:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0428.014; Sat, 19 Sep 2026 09:59:06 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Hal Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Kees Cook <kees@kernel.org>, "Gustavo A . R . Silva"
	<gustavoars@kernel.org>, Richard Cochran <richardcochran@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH v3 21/22] reset: starfive: Add StarFive JHB100 reset
 driver
Thread-Topic: [PATCH v3 21/22] reset: starfive: Add StarFive JHB100 reset
 driver
Thread-Index: AQHdJmAYveuIyf3zqU2+QbYV4aA7jrbSlDuAgANaB9A=
Date: Sat, 19 Sep 2026 09:59:06 +0000
Message-ID: <ZQ4PR01MB1202963BF92C33795AAA0A08F2862@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260807112923.191627-1-changhuang.liang@starfivetech.com>
 <20260807112923.191627-22-changhuang.liang@starfivetech.com>
 <NT0PR01MB110298B34F8DFB2791A129FCE6B82@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <NT0PR01MB110298B34F8DFB2791A129FCE6B82@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1283:EE_
x-ms-office365-filtering-correlation-id: 526d7e8c-2431-42a7-4617-08df1634a498
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|38070700021|921020|10067099003|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: g5dgt/ICs7X4cqMlEtHOPaz+kg3QyD4tggzvoicnI0b8k5hIOgoDJpNd19lTqxBNkEoUyaEhsBby7c3R+H7g+W4/9QQ4pS1itwXZ8m39WEHmHXWYHyim3qnBrGufkVWF6R5ROCGA+kC5hqkP3D4nYsmduYZXVj3zHCZnRYhQrdOhPoNOqZyyYjcVgMyrnS6fACa4iYeAo9B2J70NR7U0e9TkXy4PR99wLvtQdTBW1FwYFthvcwfF3YIEzG4FqVWx5uwXr/wNijkHXwZKTXXMW0PO7BpaBHGgwJsfWdSCWq+oUS7qIb9nID90dP01KuGX1/8ETIExSGOSUo6wkGgAPjn9FOdxuhWmNoxmv1uG7J415Ookq6XAP1tbI4F0uxfLoQfgGuFkhNYMLiLR8PRAV2wsiuxnPxPSBmqoWQZJrys4rgNVP2VTgEVVix0LSlNtpsVpWJIAC9iul9oblQK2vc1zf9BL42OolNWhwdQpmZoEGVTyvMehpWuCCgd0QZNTOFCaOIOYsHSeXzVgX9U8huRu56iGidHQDZVc5ATglb08yivPpOEkvTHHfr/kUrPee4tj/t3FDaNeHxa5ArJRHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(38070700021)(921020)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4+ew0yvHYQktnB/OZ+mKn75wedFWZbNmIEV5KBFfeebVnDQBgXXMUvsyj2EY?=
 =?us-ascii?Q?rD/k8Gzf3OYYLysxjRtaby0RC6/XgBF1ls8DnPERdgKR3HJAu2bKOKlx/wzf?=
 =?us-ascii?Q?mCvjK+ByttQ6QvsqSa+ntgFdYVrRcQHNnnOzizseWnuwUuW0uOJyHT9wRMrU?=
 =?us-ascii?Q?bz6HN/QLrK82HukSynSK6+FS1wt2Z6RW9Q46feCD0T7GsCto1KkHF9ASXHZn?=
 =?us-ascii?Q?6/xSnyFXUT6BUvQKVHRpTGLfkN5QPENYbvweKl3CIYmjR7QMaWBnonwMAcL+?=
 =?us-ascii?Q?AFvWoQrqCVBCRH78Cic0zAwt4Q7EvxJVnwS48pnT6Cy6f13gVlVOHToUtLoT?=
 =?us-ascii?Q?pFyr7UXYwXLWplaYjfRMtGrndj4P/G8WhZiTyb1stK0X5IG8u0/Lt+VcocOB?=
 =?us-ascii?Q?tysvKKB47KLSxqtY32Rrok54JRXRgSY8f2e/lpwYfuhDLdg8fupwUW1wOAx6?=
 =?us-ascii?Q?Fv0EQZDB5IrEKopMEk34EIdvmw/eOaU28ssqKT70TvYdW/phbHr49pnvAr1N?=
 =?us-ascii?Q?wwsTMcH8C8K/S5QoeCv+wb1CqGJUBDB3DJ4Sq8EC26w+HOJe09I7a4+iRXLw?=
 =?us-ascii?Q?FGXruoDcA+FNnIK0rNbejTsv7+ZHArzOR6gboSrPFajKRqUTshSPbmcluduE?=
 =?us-ascii?Q?C3Ib5gXMlNWyqHN/yrSZxgQCx1fjrmzveONekurdQ3p3J9b3Vz6zkJMoPKjZ?=
 =?us-ascii?Q?8jkcw65XapJ15nr20bXSp5lwF2Iosv9gn66a7xodGtDpJlmn41Z1jVyRH0XN?=
 =?us-ascii?Q?bGmEDWgR8jdPMZwsSZX3pFKpd5EY/i62NETOSg9VOvhaRXwHW4l7poeXoOHF?=
 =?us-ascii?Q?jDFsIpyitNzrpwBTUAwTx4CDDMPYtgqoSLr4NondyoMFNcAjDg2/NTKkE0JY?=
 =?us-ascii?Q?3RR91PQJYW7fmSFcD9le3mfxftd+VuzmsQiQNm55bfzwwe3kNic2LxxYfIwk?=
 =?us-ascii?Q?6MImHq1SANezQUD/GX0YnhmhSEzb44tUghVfbhTQWwdO1boFkDYGcumX7pqr?=
 =?us-ascii?Q?riJZY1Xx0ODYGOEOHjy0zBfPDtbkJgCbonmenNsE0dZwQ8d0pY43Yj3l+oMu?=
 =?us-ascii?Q?GdlukG31VKGLYG/PZjdxq0q4xu8rLv1QzlY7HXD6yb4jnS+JLT1M3wQKbxuU?=
 =?us-ascii?Q?iRBmKbm6j2A4dwz4a1FEVXJytlvuUAAKw0vj5miCQHL7L1O82vrQi0QIJ130?=
 =?us-ascii?Q?AbPlAW0jfxFVWv1pViWpxlJ+OPTYvZH2M14VM7BLFE85+9Lv62IfU5cgPkzY?=
 =?us-ascii?Q?6F/Cc/TINIoCdz9DrKvFJDXFls6gz9VOo2jDyT7l5A72fqsgXpfhMep5Ab9d?=
 =?us-ascii?Q?QNEqZYnLbpXp/CDADovCLffpqB62Xow2sxnWkKswlRk7/3cd/c7BdhHjjzaA?=
 =?us-ascii?Q?bcvaWmD9FCD4iOpdgPdeVzXJ6LB7zH7HDhFPPLFlFpQn3ktPjNj8Bvc4TCv5?=
 =?us-ascii?Q?PS0g+Z8LDElLsh+JQ1DBtErEuny7pc6Aa9u7RsrK/OZTfLzj0eQ2drwMgTbr?=
 =?us-ascii?Q?tAg19uP5d/UDSXvNluEH+/t0VWY2j2+1oe0ZgjFUbKGf5OMBEz2BKCogrjOb?=
 =?us-ascii?Q?886yy1pfQ7hUCbB8eGyT+z0zMlxe+LRQoVokjtMMnARBJlXkK1+Q/1H2IpLk?=
 =?us-ascii?Q?7AEP0leJI8LmbE/yVUXSlHehgbEm+gEHxlMqAWB20ON11K8bGSNvze4ET3Xu?=
 =?us-ascii?Q?qsa3LJ11vHUVGq8pXMtGUnt3qwYmDDwBG9LimdKwCbspKBTWBMVyypTege1t?=
 =?us-ascii?Q?lGnwwyGlFFzjFm28OfLqdBOc5tTW9sk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 526d7e8c-2431-42a7-4617-08df1634a498
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 09:59:06.4905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ixbkMPCzc8yesmbdFEL8rQTVeVedwX6691mWVpIw/piHz5wVv9zPqhxS5S9jLuyEP6MtAGnsX72hNtWg2oeZJv/IrXkH9Zh0rZEl6tlvFtGR+7RlU+S0LWWRHMPuK0x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_025938_385105_4852FFBA 
X-CRM114-Status: GOOD (  30.02  )
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

Hi, Hal

> > On 26.08.07 19:29, Changhuang Liang wrote:
> > Add auxiliary reset driver to support StarFive JHB100 SoC.
> > The StarFive JHB100 SoC has discontiguous reset IDs. A new function
> > reset_starfive_register_with_info() is introduced to support both
> > contiguous and discontiguous hardware designs.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  MAINTAINERS                                   |   6 +
> >  drivers/reset/starfive/Kconfig                |   9 +
> >  drivers/reset/starfive/Makefile               |   1 +
> >  .../reset/starfive/reset-starfive-common.c    |  99 +++++-
> >  .../reset/starfive/reset-starfive-common.h    |  19 ++
> >  .../reset/starfive/reset-starfive-jhb100.c    | 302
> ++++++++++++++++++
> >  6 files changed, 425 insertions(+), 11 deletions(-)  create mode
> > 100644 drivers/reset/starfive/reset-starfive-jhb100.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > c48b56d0ab94..709600e80951 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26088,6 +26088,12 @@ S:	Supported
> >  F:
> >
> > Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100
> > -intc.yaml
> >  F:	drivers/irqchip/irq-starfive-jhb100-intc.c
> >
> > +STARFIVE JHB100 RESET CONTROLLER DRIVERS
> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > +S:	Maintained
> 
> 'Supported' is better.
> 
> > +F:	drivers/reset/starfive/reset-starfive-jhb1*
> > +F:	include/dt-bindings/reset/starfive,jhb1*.h
> > +
> >  STATIC BRANCH/CALL
> >  M:	Peter Zijlstra <peterz@infradead.org>
> >  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> > diff --git a/drivers/reset/starfive/Kconfig
> > b/drivers/reset/starfive/Kconfig index 29fbcf1a7d83..ce00495be6ad
> > 100644
> > --- a/drivers/reset/starfive/Kconfig
> > +++ b/drivers/reset/starfive/Kconfig
> > @@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
> >  	default ARCH_STARFIVE
> >  	help
> >  	  This enables the reset controller driver for the StarFive JH7110 SoC.
> > +
> > +config RESET_STARFIVE_JHB100
> > +	bool "StarFive JHB100 Reset Driver"
> > +	depends on CLK_STARFIVE_COMMON || COMPILE_TEST
> > +	select AUXILIARY_BUS
> > +	select RESET_STARFIVE_COMMON
> > +	default ARCH_STARFIVE
> > +	help
> > +	  This enables the reset controller driver for the StarFive JHB100 SoC.
> > diff --git a/drivers/reset/starfive/Makefile
> > b/drivers/reset/starfive/Makefile index 582e4c160bd4..217002302a9f
> > 100644
> > --- a/drivers/reset/starfive/Makefile
> > +++ b/drivers/reset/starfive/Makefile
> > @@ -3,3 +3,4 @@ obj-$(CONFIG_RESET_STARFIVE_COMMON)		+=
> > reset-starfive-common.o
> >
> >  obj-$(CONFIG_RESET_STARFIVE_JH7100)		+=
> reset-starfive-jh7100.o
> >  obj-$(CONFIG_RESET_STARFIVE_JH7110)		+=
> reset-starfive-jh7110.o
> > +obj-$(CONFIG_RESET_STARFIVE_JHB100)		+=
> reset-starfive-jhb100.o
> > diff --git a/drivers/reset/starfive/reset-starfive-common.c
> > b/drivers/reset/starfive/reset-starfive-common.c
> > index 772bdf6763d1..86dbb33bb216 100644
> > --- a/drivers/reset/starfive/reset-starfive-common.c
> > +++ b/drivers/reset/starfive/reset-starfive-common.c
> > @@ -14,6 +14,8 @@
> >
> >  #include "reset-starfive-common.h"
> >
> > +#define STARFIVE_RESET_ID_INVALID	ULONG_MAX
> > +
> >  struct starfive_reset {
> >  	struct reset_controller_dev rcdev;
> >  	/* protect registers against concurrent read-modify-write */ @@
> > -21,6
> > +23,11 @@ struct starfive_reset {
> >  	void __iomem *assert;
> >  	void __iomem *status;
> >  	const u32 *asserted;
> > +
> > +	/* Only exists in reset controllers that use the
> > +	 * reset_starfive_register_with_info helper.
> > +	 */
> > +	const struct starfive_reset_info *info;
> >  };
> >
> >  static inline struct starfive_reset * @@ -29,19 +36,40 @@
> > starfive_reset_from(struct reset_controller_dev
> > *rcdev)
> >  	return container_of(rcdev, struct starfive_reset, rcdev);  }
> >
> > +static unsigned long
> > +starfive_reset_id_to_hw_id(const struct starfive_reset_map *map,
> > +unsigned
> > int nr_resets,
> > +			   unsigned long reset_id)
> > +{
> > +	for (u32 i = 0; i < nr_resets; i++) {
> > +		if (map[i].reset_id == reset_id)
> > +			return map[i].hw_id;
> > +	}
> > +
> > +	return STARFIVE_RESET_ID_INVALID;
> > +}
> > +
> >  static int starfive_reset_update(struct reset_controller_dev *rcdev,
> >  				 unsigned long id, bool assert)
> >  {
> >  	struct starfive_reset *data = starfive_reset_from(rcdev);
> > -	unsigned long offset = id / 32;
> > -	u32 mask = BIT(id % 32);
> > -	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
> > -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> > -	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
> > -	u32 value;
> > -	unsigned long flags;
> > +	unsigned long offset, flags;
> > +	void __iomem *reg_assert;
> > +	void __iomem *reg_status;
> > +	u32 mask, done, value;
> >  	int ret;
> >
> > +	if (data->info && data->info->discontiguous) {
> > +		id = starfive_reset_id_to_hw_id(data->info->map,
> > data->info->nr_resets, id);
> > +		if (id == STARFIVE_RESET_ID_INVALID)
> > +			return -EINVAL;
> > +	}
> > +
> > +	offset = id / 32;
> > +	mask = BIT(id % 32);
> > +	reg_assert = data->assert + offset * sizeof(u32);
> > +	reg_status = data->status + offset * sizeof(u32);
> > +	done = data->asserted ? data->asserted[offset] & mask : 0;
> > +
> >  	if (!assert)
> >  		done ^= mask;
> >
> > @@ -89,10 +117,20 @@ static int starfive_reset_status(struct
> > reset_controller_dev *rcdev,
> >  				 unsigned long id)
> >  {
> >  	struct starfive_reset *data = starfive_reset_from(rcdev);
> > -	unsigned long offset = id / 32;
> > -	u32 mask = BIT(id % 32);
> > -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> > -	u32 value = readl(reg_status);
> > +	void __iomem *reg_status;
> > +	unsigned long offset;
> > +	u32 mask, value;
> > +
> > +	if (data->info && data->info->discontiguous) {
> > +		id = starfive_reset_id_to_hw_id(data->info->map,
> > data->info->nr_resets, id);
> > +		if (id == STARFIVE_RESET_ID_INVALID)
> > +			return -EINVAL;
> > +	}
> > +
> > +	offset = id / 32;
> > +	mask = BIT(id % 32);
> > +	reg_status = data->status + offset * sizeof(u32);
> > +	value = readl(reg_status);
> >
> >  	if (!data->asserted)
> >  		return !(value & mask);
> > @@ -132,3 +170,42 @@ int reset_starfive_register(struct device *dev,
> > struct device_node *of_node,
> >  	return devm_reset_controller_register(dev, &data->rcdev);  }
> > EXPORT_SYMBOL_GPL(reset_starfive_register);
> > +
> > +int reset_starfive_register_with_info(struct device *dev, struct
> > +device_node
> 
> Also, you add reset_starfive_register_with_info() but a very similar
> reset_starfive_register() still remains. I think we can merge them.

The current series is quite large. To reduce the review burden of the current series,
I plan to release a separate series later for JH7110 to reduce these similar interfaces.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
