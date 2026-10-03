Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED6FCA5FDD
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mgwy21WHtwUn8iqNCNNb2jX+YdxszeKL0oduIpHGo4c=; b=xkI5fBv6whhZkz
	Sw4PvNGhyV92ySrpjiHFFplJxyLmWQJWuniAGj338bQg+33pOijO9sziibceCaBgA7KpAYeHo1Y01
	6p2GXVrezhcIPiCN8EwZ+hI3xPz28velng0ez4/iglxoi2LueIqbxdJeoSaW8ya//XIEDcSVUdtx0
	AZN4UCysgdJYl9FBYW00EBblPOUW50dMY2ZgKQQ0qwYUa0KDCyrpc21SfipfOL0fQDtx8ptW0hT4O
	vFjpn7+SnnZ/UIWL7XhwYtPL05TdfeTm0R9nMxfaS+gmTCwh0L56ZykZ+IbkZlWD7RUu9fyLUfUYZ
	hKbA7WpbqaeTajFZx1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxWe-0000000DPIm-2G5G;
	Sat, 03 Oct 2026 11:03:32 +0000
Received: from mail-bjschn02on2131.outbound.protection.partner.outlook.cn ([139.219.17.131] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxWa-0000000DPI1-32dR
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 11:03:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpUP+uOU+3b6HaM7nEcMgBaMFMDNzxJh6CW3JzGPr4KdPupw1vqG4wWc2O+q+3JvPM7I1IqtqcWqFXqLkfQB51X9IMRKMJ5fBIKH0oSNqeftjdWmLMNa4bjcxoc7p6dMoDPZTg86nnXWsyxWR8vgi7ZRakqDw+2ZlNg0Slp7c6IcHcmNyp05Jv+dsZ/waArl1m/z4Ne1g0YlBwueRQgMRk57Jo+esbCEAVBqyiSPq0dBLmfNq3E4DoXBf/s0XDb62gEIJa92B5qqn5V7lOesZ5RzVFB6B/nN4XJDRhpjLyE8OhmRMEoFfj/4Mzd5QGjmXWyNyJUBVTH1sclbBPsp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPWPfzs95PfMFSZooKuxmMrKOskewU0ZzLsTTVNdUlI=;
 b=DQ0+y0u/tzCooifGENhrIjaFub9SkaC6TMqyBmVLqqN74vt4pdKADEqJVaDbbno+kgqABb6ncSe9GCLPQt3vnGdB3pNFW+kpMYinuYnsrflDvYm184qClroDy9JtUQL8XXZ4iHdFZoCWpH9filx9+yQMvilo1kg/x2kyQARgkdMFGOExBjVfhFiIKZ+OVaI9S+z++7zkz8BhY7D1jUybs+upwAiJG1haZ6jw9V7lY2ikTmApHRYB1f9/MDiAnQ3iHB+KoUNPF3wBENpEjijCBEQMFYDpCuVp/u3X+Uj+dpR0K/jYCB4roBRNPhGhjNWhuseU7ZxRrxVeiHyMZppp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1155.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sat, 3 Oct
 2026 11:02:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0472.016; Sat, 3 Oct 2026 11:02:49 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
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
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Topic: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Index: AQHdNtN7NA8V7U+etEm3PQ/xHlQDfLbnBYkAgATaQaA=
Date: Sat, 3 Oct 2026 11:02:48 +0000
Message-ID: <ZQ4PR01MB120246C3208C10BDEFD32BCFF2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-3-changhuang.liang@starfivetech.com>
 <179075859479.1471718.5492634704694937513.b4-reply@b4>
In-Reply-To: <179075859479.1471718.5492634704694937513.b4-reply@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1155:EE_
x-ms-office365-filtering-correlation-id: d7a7716f-0198-4cd8-5509-08df213ddca9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|23010399003|376014|38070700021|56012099006|3023799007|10067099003|4143699003|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info: u2+WcmbRAYANUVW3xPvPn8IDxDivthQHUz4SEGVtQreW9EQMfanl8JeDUiLserGyntQJOQ1SnsCG7UqpYHFQxZ6UpLdk2qGsP13Bvee7ytGA+yYrs9Ym/PXkd8btOMlwYWAPqUEoZ7BcOML1jl/eJK/lfB+Aw1/epE6oIBgIvQhT3gXIj0M8Dgube7EfGqwFwa8PHdkN88mYccgRDP9xpOSjyjX6adGUy+XBp7FgILMz0bm2kndSLlMbu6gkp9wXnLjGrGdr2y6gvTuq0bH+DW+9tgFwR4sDVW+DqNSHdPG/XrfCFlpQFz61tG6zWhdLBdzz/4dJfkqs+u7BV9Z1tDFRDC4/JC3Mmf+r2pr4KmDExxA+fsVn/TI95uaYGnBrMn1gzp9BzCQa0m+7/OqTX+mn2AdTxQZfYYcOKPAnmB8yPdRrnwBQCdEClmAR/K+McjTQlXz38yU5N8vxHrkRfeqjleOO2YxvSobMeIAfWvI8TNHMryx8kge9MsoDBpBICtp7XXGNnIFMh+rxhGykxikNvB8YJKXziYvP7ZYEbCqGfGFqRiFyFH055n2xJbIM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(23010399003)(376014)(38070700021)(56012099006)(3023799007)(10067099003)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXlWY2dtVVFnWkFsaGI4cWhISTh6WWEyY3A4VVBTSGRmVys3bDlLTTBUVDdQ?=
 =?utf-8?B?MXUxWkJkVDFSazNhcTZiMGhkQi9oNkxLczgxWTF2cFNwaVNMUkFtb0Z4SEFG?=
 =?utf-8?B?d1NnOFdXcVdsek1EU2JlMUhFU2xvOTV3cTJ5WVVjUEhoQmJZKzRTTVVweE1X?=
 =?utf-8?B?RlJRK0JyS2dZdUUya2JoK2k1SUE4ZjFHRU1jRkVYVkVudlNDRzVSWnJhM0Fj?=
 =?utf-8?B?eG8zdElZM1ZEek5KZ0k5aXkzVksxRlY4KzNvQk15c2pyT0xqc1JrdWpneEZn?=
 =?utf-8?B?N1VDSTlmZ1lRcUkzUjNGcGVTa2Vzc1ZxYTlsQ3BHMHhkdGFORjl4S3U2ZTBi?=
 =?utf-8?B?bC9kTjlyVVUvUXE5N0xCa1dJWWErZVdIb1BhTzQ1ZGhUQmlFRGVUNUs5cFBl?=
 =?utf-8?B?NUtzK1huYkdsdFNYRVB3SVVZMmZnbUI0ZGl6ZG9oWFMxUzhDV0tiZi9rT1lS?=
 =?utf-8?B?a2FzbGZBa01WeWNud0c3ZGphQnV5MXFWN29UV3prRVkvOEw4OEZnQkQ4RHRE?=
 =?utf-8?B?czIrdFBMbTEyN1Y3aXhIV21EN3FyMmV4U0hsNjBlcWViWFcybHFlaXAvNWdT?=
 =?utf-8?B?L09JSWhMY1ZLNVpleDJFenM3bm9GSm5RQzFOY2J3WHdsMXpTcXRlME9tR05s?=
 =?utf-8?B?MGJjY0hlOExuVGxOVkVndTIvT20vVzRBblZ6dlZJamVpOFBnTWpGeHhMdCty?=
 =?utf-8?B?TjU5cm13djlCTTlSejd0N1haaENiZ0hwTERBeWs5UmRqUnpEMmRvRTVLUjR0?=
 =?utf-8?B?VEVFYUVRSXF3blJuSEpmb3ZURUtWQStoc1RxUWkyNnVNdTM4dXNYMDFxYTFN?=
 =?utf-8?B?eEFjL1dVekNxSDFNN01YN2VtL2NhWmErUUo4QWtSZWZWVVdHVm13QUlxMEx5?=
 =?utf-8?B?RlJIMHhkNloyY0FaK1hFNXB1cWhIeUgxbEJxV0hGZWRxMjUyUDJ6WktyMUI5?=
 =?utf-8?B?ZW1sSHFlckhEVTFFTkk2ZmNFL0tSeUVtOG5sQnJhTUk5YmxRNnZ3ZzMxZ0FB?=
 =?utf-8?B?SnYyWkdBR3FaWk1zMDgwSSthMU1XVFRTWVlkcDE3aU9PazJqd1dmK2tSWHF5?=
 =?utf-8?B?MUI1NWVkd0VCNWxEMjBGQnV5R0prTkNHZjBTSUU3cjZCRG9qdjl1V2hGeU5u?=
 =?utf-8?B?dnIzenZYSStSNmZsOHdaRG9jZEhSYlhPQXRTTnNlMkU0b2FEZU0yUCtsWWZV?=
 =?utf-8?B?QUNscnZkRmRBN0NjTnZMRVQ5UHRHTEpLQytGd1RCVE9oNUo0WHZwVHo1M2F0?=
 =?utf-8?B?UVpJMWdBSWR3TmdqbjczcHFNaUhCbDJyTEZnNVZLTENzNmpYSGphMGNWYkw2?=
 =?utf-8?B?VG5kVU9Hems2L04wZjBjcXZKbTRxek5zU090dWhSRFlCOGlzR3dZOFU5UGVj?=
 =?utf-8?B?aEo0cll4WG9GT0xtaXo1aDNnc00zRDA5RVJhS3krZDVkazA0MTd5R2lCS3Vr?=
 =?utf-8?B?SDE5Zm5wN2lQVTV1cjhLZjRROXJSTm5CblU2ZDVqTk1qNDVReStKSUw3TDM1?=
 =?utf-8?B?eVFpeG9zYndET2k0dkptdEhNaHRQMnBmNFMwSFRscVY0eHhZcUtVc2lhdGNM?=
 =?utf-8?B?dElteVBTZWVnUzFOVDRTWXFmWHNGYlRSenA2WFJjUUQ0b2lSS2J1U0dselRl?=
 =?utf-8?B?TTNtSzZ3Z2RZakwxYURWWGw0SWNlSXJrbEpDVmRISXhjazVCTVN5bmllRVRG?=
 =?utf-8?B?WExwWHpkaXNEQ21VSkxnVTFjQkM0OXJUN3c0M2ZhdFNzNjdNQnlFa2V3MVkv?=
 =?utf-8?B?Y1BESzhDME9GbFdDZzJ1OTBjQVVYdElobWJVSHNQbStkbUh3VmtYZVE3bFhF?=
 =?utf-8?B?bUxFQXE3RUJpNWdyS29FaUZWdHZFMGFDTzFiN0R0RTFZcUZBR2ZUcStkdk03?=
 =?utf-8?B?MUJNZHN6N0JVWTZteXU3Qys3c2M4RS9JS0pxdjc2Tkc5VGJObWF6QW8xMS84?=
 =?utf-8?B?VzgxeDNEdW5xcEgvTmhweHVuYWhIelVBM0NBUVJGUnBwbWJVbHlqZHkvREFq?=
 =?utf-8?B?a3p4WlYveWxpdC9kaHgvSUg3cisxMWpOS3NLeW1kZVYyTDZZUjluUklXc2Ni?=
 =?utf-8?B?Z3RzMk5FT25LUDlaNTN2a3QzNFg3MmdkWGUwWFdKQ3c4SU9CSFNaVU5LNGZn?=
 =?utf-8?B?WDg5U1JxOHB3NmR6cXc2OXVFc2ZlQVVFN093R3V4V0lOd1EzTzRSYnVQZmIr?=
 =?utf-8?B?SG9aNlpjb1FUbCtQdXllbE5hNnJRWWNtblpKQ2lrLy9wcUpLTER6RVpPcE8w?=
 =?utf-8?B?dk9QS3hzWXdTQUlIdmE2SjR6bWRZVVU1YlBZekU1SmZMWUtZZkNVemFnVE9l?=
 =?utf-8?B?c1Z5OUJmR1ZVSksvRFJzM3N2V0dUYlhjUDdjdWhvRW1BTHVIcytmU0RXK1VS?=
 =?utf-8?Q?RIYYTcsaorvHEpmg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a7716f-0198-4cd8-5509-08df213ddca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 11:02:48.7635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLvFaqM1ij7lIN78PelJ2Zt83CEBdspoJPSBCyzHr65cZtw3WRRZHkvnVY+EV198MRBUp6jpWJFuCj9He9gRDv9FHXe+KKl8vOWb9S7EjHe0RpK8IQM7H6SCzdYWvdAS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_040328_943415_ABEE8582 
X-CRM114-Status: GOOD (  22.28  )
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

Hi, Jerome

Thanks for the review.

> On 2026-08-28 02:56 -0700, Changhuang Liang wrote:
> > Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> >
> > This driver is instantiated either as an MFD cell of the sys0 system
> > controller (added in a later patch) or by matching the per0/per1
> > syscon nodes directly.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> > ---
> >  drivers/clk/starfive/Kconfig                  |  10 +
> >  drivers/clk/starfive/Makefile                 |   1 +
> >  .../clk/starfive/clk-starfive-jhb100-pll.c    | 524 ++++++++++++++++++
> >  3 files changed, 535 insertions(+)
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
> >
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index 852464949334..2603d054173f 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -117,6 +117,16 @@ config CLK_STARFIVE_JHB100_PER3
> >  	  Say yes here to support the peripheral-3 clock controller
> >  	  on the StarFive JHB100 SoC.
> >
> > +config CLK_STARFIVE_JHB100_PLL
> > +	bool "StarFive JHB100 PLL clock support"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	select STARFIVE_JHB100_SOCINFO
> > +	select MFD_SYSCON
> > +	default ARCH_STARFIVE
> > +	help
> > +	  Say yes here to support the PLL clock controller on the
> > +	  StarFive JHB100 SoC.
> > +
> >  config CLK_STARFIVE_JHB100_SYS0
> >  	bool "StarFive JHB100 system-0 clock support"
> >  	depends on ARCH_STARFIVE || COMPILE_TEST diff --git
> > a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile index
> > f00690f0cdad..547a8c170728 100644
> > --- a/drivers/clk/starfive/Makefile
> > +++ b/drivers/clk/starfive/Makefile
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)
> 	+= clk-starfive-jhb100-per0.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+=
> clk-starfive-jhb100-per1.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+=
> clk-starfive-jhb100-per2.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+=
> clk-starfive-jhb100-per3.o
> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_PLL)		+=
> clk-starfive-jhb100-pll.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> clk-starfive-jhb100-sys0.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+=
> clk-starfive-jhb100-sys1.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+=
> clk-starfive-jhb100-sys2.o
> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > new file mode 100644
> > index 000000000000..e23365164497
> > --- /dev/null
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > @@ -0,0 +1,524 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * StarFive JHB100 PLL Clock Generator Driver
> > + *
> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/math64.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/units.h>
> > +
> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > +
> > +/* this driver expects a 25MHz input frequency from the oscillator */
> > +#define JHB100_PLL_OSC_RATE		(25 * HZ_PER_MHZ)
> > +
> > +/* System-0 domain PLL */
> > +#define JHB100_PLL2_OFFSET		0x00
> > +#define JHB100_PLL3_OFFSET		0x0c
> > +#define JHB100_PLL4_OFFSET		0x18
> > +#define JHB100_PLL5_OFFSET		0x24
> > +
> > +#define JHB100_PLL_CFG0_OFFSET		0x0
> > +#define JHB100_PLL_CFG1_OFFSET		0x4
> > +#define JHB100_PLL_CFG2_OFFSET		0x8
> > +
> > +#define JHB100_PLLX_CFG0(offset)	((offset) + JHB100_PLL_CFG0_OFFSET)
> > +/* fbdiv value should be 16 to 4095 */
> > +#define   JHB100_PLL_FBDIV			GENMASK(13, 2)
> > +#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
> > +#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
> > +
> > +#define JHB100_PLLX_CFG1(offset)	((offset) + JHB100_PLL_CFG1_OFFSET)
> > +/* frac value should be decimals multiplied by 2^24 */
> > +#define   JHB100_PLL_FRAC			GENMASK(23, 0)
> > +#define   JHB100_PLL_LOCK			BIT(24)
> > +
> > +#define JHB100_PLLX_CFG2(offset)	((offset) + JHB100_PLL_CFG2_OFFSET)
> > +#define   JHB100_PLL_PD				BIT(13)
> > +#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
> > +#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
> > +
> > +#define JHB100_PLL_TIMEOUT_US		1000
> > +#define JHB100_PLL_INTERVAL_US		100
> > +
> > +struct jhb100_pll_preset {
> > +	unsigned long freq;
> > +	u32 frac;			/* frac value should be decimals multiplied by 2^24
> */
> > +	unsigned fbdiv		: 12;	/* fbdiv value should be 16 to 4095 */
> > +	unsigned refdiv		: 6;
> > +	unsigned postdiv	: 2;
> > +	unsigned foutpostdiv_en	: 1;
> > +	unsigned foutvcop_en	: 1;
> > +};
> > +
> > +struct jhb100_pll_info {
> > +	const char *name;
> > +	const struct jhb100_pll_preset *presets;
> > +	unsigned int npresets;
> > +	unsigned long flags;
> > +	u8 offset;
> > +	bool continuous;
> > +};
> > +
> > +#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flags,
> _cont)	\
> > +	[_idx] = {							\
> > +		.name = _name,						\
> > +		.offset = _offset,					\
> > +		.presets = _presets,					\
> > +		.npresets = _npresets,					\
> > +		.flags = _flags,					\
> > +		.continuous = _cont,					\
> > +	}
> > +
> > +#define JHB100_PLL(idx, name, presets, npresets, offset, cont)
> 	\
> > +	_JHB100_PLL(idx, name, presets, npresets, offset, 0, cont)
> > +
> > +struct jhb100_pll_match_data {
> > +	const struct jhb100_pll_info *pll_info;
> > +	int num_pll;
> > +};
> > +
> > +struct jhb100_pll_data {
> > +	struct clk_hw hw;
> > +	unsigned int idx;
> > +};
> > +
> > +struct jhb100_pll_priv {
> > +	struct regmap *regmap;
> > +	const struct jhb100_pll_match_data *match_data;
> > +	struct jhb100_pll_data pll[];
> > +};
> > +
> > +struct jhb100_pll_regvals {
> > +	u32 fbdiv;
> > +	u32 frac;
> > +	u32 postdiv;
> > +	u32 refdiv;
> > +	bool foutpostdiv_en;
> > +	bool foutvcop_en;
> > +};
> > +
> > +static struct jhb100_pll_data *jhb100_pll_data_from(struct clk_hw
> > +*hw) {
> > +	return container_of(hw, struct jhb100_pll_data, hw); }
> > +
> > +static struct jhb100_pll_priv *jhb100_pll_priv_from(struct
> > +jhb100_pll_data *pll) {
> > +	return container_of(pll, struct jhb100_pll_priv, pll[pll->idx]); }
> > +
> > +static int jhb100_pll_prepare(struct clk_hw *hw) {
> > +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =
> > +&priv->match_data->pll_info[pll->idx];
> > +
> > +	return regmap_update_bits(priv->regmap,
> JHB100_PLLX_CFG2(info->offset),
> > +				  JHB100_PLL_PD, 0);
> > +}
> > +
> > +static void jhb100_pll_unprepare(struct clk_hw *hw) {
> > +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =
> > +&priv->match_data->pll_info[pll->idx];
> > +
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> > +			   JHB100_PLL_PD, JHB100_PLL_PD);
> > +}
> > +
> > +static int jhb100_pll_is_prepared(struct clk_hw *hw) {
> > +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =
> &priv->match_data->pll_info[pll->idx];
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = regmap_read(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return !(val & JHB100_PLL_PD);
> > +}
> 
> Why are you using prepere_ ? Are you register access on a slow bus like i2c ?

This is MMIO, not a slow bus like I2C. I'll change it to enable / disable.

> 
> > +
> > +static int jhb100_pll_regvals_get(struct regmap *regmap,
> > +				  const struct jhb100_pll_info *info,
> > +				  struct jhb100_pll_regvals *val) {
> > +	u32 value;
> > +	int ret;
> > +
> > +	ret = regmap_read(regmap, JHB100_PLLX_CFG0(info->offset), &value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	val->fbdiv = FIELD_GET(JHB100_PLL_FBDIV, value);
> > +	val->foutpostdiv_en = !!FIELD_GET(JHB100_PLL_FOUTPOSTDIV_EN,
> value);
> > +	val->foutvcop_en = !!FIELD_GET(JHB100_PLL_FOUTVCOP_EN, value);
> > +
> > +	ret = regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	val->frac = FIELD_GET(JHB100_PLL_FRAC, value);
> > +
> > +	ret = regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	val->postdiv = FIELD_GET(JHB100_PLL_POSTDIV, value);
> > +	val->refdiv = FIELD_GET(JHB100_PLL_REFDIV, value);
> > +
> > +	return 0;
> > +}
> 
> Looks like a bit of churn to me ? Can you just read the field when you need
> them
> 

OK, I'll optimize this part.

> > +
> > +static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw,
> > +unsigned long parent_rate) {
> > +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> > +	struct jhb100_pll_regvals val;
> > +	u32 power = 0;
> > +	u64 rate;
> > +	int ret;
> > +
> > +	ret = jhb100_pll_regvals_get(priv->regmap,
> &priv->match_data->pll_info[pll->idx], &val);
> > +	if (ret)
> > +		return 0;
> > +
> > +	/*
> > +	 *
> > +	 * if (foutvcop_en)
> > +	 *      rate = parent * (fbdiv + frac / 2^24) / refdiv
> > +	 *
> > +	 * if (foutpostdiv_en)
> > +	 *      rate = parent * (fbdiv + frac / 2^24) / refdiv / 2^(postdiv + 1)
> > +	 *
> > +	 * parent * (fbdiv + frac / 2^24) = parent * fbdiv + parent * frac /
> > +2^24
> 
> This show the overcomplexity you've put in this driver by mixing toghether the
> PLL with the 2 skip-able post dividre You could simply decribe the topology.
> * 1 PLL
> * 2 Post-divider and 2 muxes to skip them.
> 
> CCF already provide the helper for those.
> 

Got it.

> > +	 */
> > +
> > +	if (!!val.foutvcop_en == !!val.foutpostdiv_en || !val.refdiv)
> > +		return 0;
> > +
> > +	rate = mul_u32_u32(parent_rate, val.frac) >> 24;
> > +
> > +	if (val.foutpostdiv_en)
> > +		power = val.postdiv + 1;
> > +
> > +	rate += mul_u32_u32(parent_rate, val.fbdiv);
> > +	rate = div_u64(rate, (u64)val.refdiv << power);
> > +
> > +	return rate;
> > +}
> > +
> > +static int jhb100_pll_determine_rate(struct clk_hw *hw, struct
> > +clk_rate_request *req) {
> > +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =
> &priv->match_data->pll_info[pll->idx];
> > +	const struct jhb100_pll_preset *selected = &info->presets[0];
> > +	unsigned int idx;
> > +
> > +	/* if the parent rate doesn't match our expectations the presets won't
> work */
> > +	if (req->best_parent_rate != JHB100_PLL_OSC_RATE) {
> > +		req->rate = jhb100_pll_recalc_rate(hw, req->best_parent_rate);
> > +		return 0;
> 
> Yet you still return a rate. Are you preset, which presumably describe some
> constraints for fractional multiplier properly described ?
> 
> Add just below you do not care for the preset ...
> 

In the next version the table stores the multiplier settings (fbdiv, frac, refdiv) 
instead of rates, and all rates are computed from the actual parent rate. This 
special case and JHB100_PLL_OSC_RATE are removed.

> > +	}
> > +
> > +	/* continuous means support any rate */
> > +	if (info->continuous)
> > +		return 0;
> 
> ??
> 
> I somehow doubt that you support everything down to the 1 Hz. You still must
> determine what you will provide.
> 

OK, I'll add output frequency range constraints.

> > +
> > +	/* find highest rate lower or equal to the requested rate */
> > +	for (idx = 1; idx < info->npresets; idx++) {
> > +		const struct jhb100_pll_preset *val = &info->presets[idx];
> > +
> > +		if (req->rate < val->freq)
> > +			break;
> > +
> > +		selected = val;
> > +	}
> > +
> > +	req->rate = selected->freq;
> 
> Instead of storing plain rate in your preset table, you could just store the
> multiplier you support and let reclac_rate do the job
> 

Got it

> > +
> > +	return 0;
> > +}
> > +
> > +static int jhb100_pll_set_preset(struct clk_hw *hw, const struct
> > +jhb100_pll_preset *val) {
> > +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =
> &priv->match_data->pll_info[pll->idx];
> > +	unsigned int value, cfg;
> > +	int ret;
> > +
> > +	cfg = FIELD_PREP(JHB100_PLL_FBDIV, (u32)val->fbdiv) |
> > +	      FIELD_PREP(JHB100_PLL_FOUTPOSTDIV_EN,
> (u32)val->foutpostdiv_en) |
> > +	      FIELD_PREP(JHB100_PLL_FOUTVCOP_EN,
> (u32)val->foutvcop_en);
> > +
> > +	ret = regmap_update_bits(priv->regmap,
> JHB100_PLLX_CFG0(info->offset),
> > +				 JHB100_PLL_FBDIV | JHB100_PLL_FOUTPOSTDIV_EN |
> > +				 JHB100_PLL_FOUTVCOP_EN, cfg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_update_bits(priv->regmap,
> JHB100_PLLX_CFG1(info->offset), JHB100_PLL_FRAC,
> > +				 FIELD_PREP(JHB100_PLL_FRAC, val->frac));
> > +	if (ret)
> > +		return ret;
> > +
> > +	cfg = FIELD_PREP(JHB100_PLL_REFDIV, (u32)val->refdiv) |
> > +	      FIELD_PREP(JHB100_PLL_POSTDIV, (u32)val->postdiv);
> > +
> > +	ret = regmap_update_bits(priv->regmap,
> JHB100_PLLX_CFG2(info->offset),
> > +				 JHB100_PLL_REFDIV | JHB100_PLL_POSTDIV, cfg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* waiting for PLL to lock */
> > +	return regmap_read_poll_timeout(priv->regmap,
> JHB100_PLLX_CFG1(info->offset),
> > +					value, value & JHB100_PLL_LOCK,
> > +					JHB100_PLL_INTERVAL_US,
> > +					JHB100_PLL_TIMEOUT_US);
> > +}
> > +
> > +static int jhb100_pll_rate_to_preset(struct clk_hw *hw, unsigned long rate,
> > +				     unsigned long parent_rate)
> > +{
> > +	struct jhb100_pll_preset val = {
> > +		.refdiv = 1,
> > +		.postdiv = 3,
> > +		.foutpostdiv_en = 1,
> > +		.foutvcop_en = 0,
> > +	};
> > +	unsigned int power = 0;
> > +	u64 fbdiv_24, t;
> > +	u32 fbdiv;
> > +
> > +	if (val.foutpostdiv_en)
> > +		power = val.postdiv + 1;
> > +
> > +	t = (u64)val.refdiv << power;
> > +	t *= rate;
> > +
> > +	fbdiv = div64_ul(t, parent_rate);
> > +	if (fbdiv < 16 || fbdiv > 4095)
> > +		return -EINVAL;
> > +	val.fbdiv = fbdiv;
> > +
> > +	fbdiv_24 = div64_ul(t << 24, parent_rate);
> > +	val.frac = fbdiv_24 - ((u64)fbdiv << 24);
> > +
> > +	return jhb100_pll_set_preset(hw, &val); }
> > +
> > +static int jhb100_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			       unsigned long parent_rate)
> > +{
> > +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =
> &priv->match_data->pll_info[pll->idx];
> > +	const struct jhb100_pll_preset *val;
> > +	unsigned int idx;
> > +
> > +	/* if the parent rate doesn't match our expectations the presets won't
> work */
> > +	if (parent_rate != JHB100_PLL_OSC_RATE)
> > +		return -EINVAL;
> > +
> > +	if (info->continuous)
> > +		return jhb100_pll_rate_to_preset(hw, rate, parent_rate);
> > +
> > +	for (idx = 0, val = &info->presets[0]; idx < info->npresets; idx++, val++) {
> > +		if (val->freq == rate)
> > +			return jhb100_pll_set_preset(hw, val);
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +static int jhb100_pll_registers_show(struct seq_file *s, void
> > +*unused) {
> > +	struct jhb100_pll_data *pll = s->private;
> > +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> > +	struct jhb100_pll_regvals val;
> > +	int ret;
> > +
> > +	ret = jhb100_pll_regvals_get(priv->regmap,
> &priv->match_data->pll_info[pll->idx], &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	seq_printf(s, "fbdiv=%u\n"
> > +		      "frac=%u\n"
> > +		      "refdiv=%u\n"
> > +		      "postdiv=%u\n"
> > +		      "foutpostdiv_en=%u\n"
> > +		      "foutvcop_en=%u\n",
> > +		      val.fbdiv, val.frac, val.refdiv, val.postdiv,
> > +		      val.foutpostdiv_en, val.foutvcop_en);
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SHOW_ATTRIBUTE(jhb100_pll_registers);
> > +
> > +static void jhb100_pll_debug_init(struct clk_hw *hw, struct dentry
> > +*dentry) {
> > +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> > +
> > +	debugfs_create_file("registers", 0400, dentry, pll,
> > +			    &jhb100_pll_registers_fops);
> > +}
> 
> regmap already provided a way to see the register through debugfs.
> This debugfs whole debugfs section can go away
> 
> > +#else
> > +#define jhb100_pll_debug_init NULL
> > +#endif
> > +
> > +static const struct clk_ops jhb100_pll_ops = {
> > +	.prepare = jhb100_pll_prepare,
> > +	.unprepare = jhb100_pll_unprepare,
> > +	.is_prepared = jhb100_pll_is_prepared,
> > +	.recalc_rate = jhb100_pll_recalc_rate,
> > +	.determine_rate = jhb100_pll_determine_rate,
> > +	.set_rate = jhb100_pll_set_rate,
> > +	.debug_init = jhb100_pll_debug_init, };
> > +
> > +static struct clk_hw *jhb100_pll_get(struct of_phandle_args *clkspec,
> > +void *data) {
> > +	struct jhb100_pll_priv *priv = data;
> > +	unsigned int idx = clkspec->args[0];
> > +
> > +	if (idx < priv->match_data->num_pll)
> > +		return &priv->pll[idx].hw;
> > +
> > +	return ERR_PTR(-EINVAL);
> > +}
> > +
> > +static int jhb100_pll_probe(struct platform_device *pdev) {
> > +	const struct jhb100_pll_match_data *match_data;
> > +	const struct platform_device_id *id;
> > +	struct device *dev = &pdev->dev;
> > +	struct jhb100_pll_priv *priv;
> > +	struct device_node *np;
> > +	unsigned int idx;
> > +	int ret;
> > +
> > +	id = platform_get_device_id(pdev);
> > +	if (!id)
> > +		return dev_err_probe(dev, -EINVAL, "no match data\n");
> > +
> > +	/*
> > +	 * Instantiated as an MFD cell of the sys0 system controller,
> > +	 * which owns the DT node describing the PLL registers.
> > +	 */
> > +	match_data = (const struct jhb100_pll_match_data *)id->driver_data;
> > +	np = dev_of_node(dev->parent);
> > +
> > +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pll,
> match_data->num_pll),
> > +			    GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->match_data = match_data;
> > +	priv->regmap = syscon_node_to_regmap(np);
> > +	if (IS_ERR(priv->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> > +				     "failed to get syscon regmap\n");
> > +
> > +	for (idx = 0; idx < match_data->num_pll; idx++) {
> > +		struct clk_parent_data parents = {
> > +			.index = 0,
> > +		};
> > +		struct clk_init_data init = {
> > +			.name = match_data->pll_info[idx].name,
> > +			.ops = &jhb100_pll_ops,
> > +			.parent_data = &parents,
> > +			.num_parents = 1,
> > +			.flags = match_data->pll_info[idx].flags,
> > +		};
> > +		struct jhb100_pll_data *pll = &priv->pll[idx];
> > +
> > +		pll->hw.init = &init;
> > +		pll->idx = idx;
> > +
> > +		ret = devm_clk_hw_register(dev, &pll->hw);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return devm_of_clk_add_hw_provider(dev, jhb100_pll_get, priv); }
> > +
> > +static const struct jhb100_pll_preset jhb100_pll2_presets[] = {
> > +	{
> > +		.freq = 903168000,
> > +		.fbdiv = 72,
> > +		.frac = 4252017,
> > +		.refdiv = 1,
> > +		.postdiv = 0,
> > +		.foutpostdiv_en = 1,
> > +		.foutvcop_en = 0,
> > +	},
> > +};
> > +
> > +static const struct jhb100_pll_preset jhb100_pll3_presets[] = {
> > +	{
> > +		.freq = 800000000,
> > +		.fbdiv = 64,
> > +		.frac = 0,
> > +		.refdiv = 1,
> > +		.postdiv = 0,
> > +		.foutpostdiv_en = 1,
> > +		.foutvcop_en = 0,
> > +	},
> > +};
> > +
> > +static const struct jhb100_pll_info jhb100_sys0_pll_info[] = {
> > +	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2_out",
> jhb100_pll2_presets,
> > +		   ARRAY_SIZE(jhb100_pll2_presets), JHB100_PLL2_OFFSET, false),
> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3_out",
> jhb100_pll3_presets,
> > +		    ARRAY_SIZE(jhb100_pll3_presets), JHB100_PLL3_OFFSET,
> > +		    CLK_IS_CRITICAL, false),
> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4_out", NULL, 0,
> > +		    JHB100_PLL4_OFFSET, CLK_IGNORE_UNUSED, true),
> 
> Please comment when adding CLK_IGNORE_UNUSED so people have an idea
> why it is needed and how it can be removed

OK, I understand that there is an intention to remove this flag. On our SoC, some clocks are 
typically not referenced by any driver, but we don't want them to be turned off. We currently 
use CLK_IGNORE_UNUSED to preserve their hardware-default enabled state. Perhaps in the 
next version we will replace it with CLK_IS_CRITICAL.

> 
> > +	_JHB100_PLL(JHB100_SYS0PLL_PLL5_OUT, "pll5_out", NULL, 0,
> > +		    JHB100_PLL5_OFFSET, CLK_IGNORE_UNUSED, true), };
> > +
> > +static const struct jhb100_pll_match_data jhb100_sys0_pll = {
> > +	.pll_info = jhb100_sys0_pll_info,
> > +	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info), };
> > +
> > +static const struct platform_device_id jhb100_pll_ids[] = {
> > +	{
> > +		.name = "jhb100-sys0-pll",
> > +		.driver_data = (unsigned long)&jhb100_sys0_pll,
> > +	},
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
> > +
> > +static struct platform_driver jhb100_pll_driver = {
> > +	.probe = jhb100_pll_probe,
> > +	.id_table = jhb100_pll_ids,
> > +	.driver = {
> > +		.name = "clk-starfive-jhb100-pll",
> > +		.suppress_bind_attrs = true,
> > +	},
> > +};
> > +builtin_platform_driver(jhb100_pll_driver);
> > --
> > 2.25.1
> >
> >
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
