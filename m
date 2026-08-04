Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B069DC55182
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 01:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QML6ZEZBzpAu3VvxGRrsxW6cqCHBzbuDxIuUmWE6fgg=; b=xLjCuqrdXQ1C6b
	8QUolsG88020Xu/8gva+GG+erjFr8JKEIZMCCZGLOqt0F5tTx5mEVns4Wc+7Is7Kws9tgTDTtNY8b
	9YlJkCixDyQ0zFVVMDXcS3CYQw1lXuFYsIOU1R7bOSsDVOHFt0VhfhLhdybWxmCtD/GU1mYxA1FDM
	qCPDtBbDV7c/UEbW/ieNXNjOhFCpKvV2lfwgw/OOb5jQtlQVtJXk2LVgWV8dC/KST/lUEcIKXrm0+
	4oJkKaOJkZghpSBz8TttGpZMBr9lwCKM4wssF7diit2KpGeULPxqdDGmVlulcj/0PbK/YjfcxUHcH
	P4Wyg+WmT08gtN7UnDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr3rK-00000000ml6-0Ycy;
	Tue, 04 Aug 2026 01:22:22 +0000
Received: from mail-sh0chn02on20730.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::730] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr3rG-00000000mji-1YkP
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 01:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsuVIW/lynIbAMUp0CRo25Z++I3rwfaaa4rcltoPq7D8IaURvqNO2/5k9csYN+8PtHAgImBi7jchY4Y1myUXo/QB0SqYe9ujKF3qQtVIJ0myjOMCYulTNuaa3z9MPomcaoQaVx2Vsjvut0FDPWAH4clwUAZhjMyU4tfWi4sG0wJy1eS2ni2/N520VXBB9GNnWPmz9LOg5MDP0b/Zr/1ktkXXFdfd0K/1laWPJh1ebEZb1gX9LqcqiXLGZv0n5MiIaH9geT0XPnQF9Cqa0bFvEktB1r7uTmFil4CT8v65EIXcITyzQ+pX5tvaaR88U0FqMZJhmbb2g/6S+4eNc+80/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8um/eRgqxJERjE5TDC+zNWuPa5ZSVZe+z7TogbGwpFc=;
 b=btyZXG58i/Pt30bI0C/+T19dAAQrWIzyQXDbTL+LNHQSHuZYRQ4mwvDVeVt8C+CAC++d8PJl4atuVPPk9AZO83M0D3H3eV4zaPbTHujMYHPSaQ5YwHCmbzgiz3KRAFAGGYTzo5HtGGXFJA3bqVEFBjSXAQVAWprfvFidSapZRgExV64tCsfK7xlcs5WnnewKAIA9qEul/HOrbnTKctqN5RaNFDcsffYdSxJkUUrOElm0dAtKJufV9FOcEk5OCE5bdMznyDVyVhimISpy1tQX6Y1w7O8Y9pf9F4WItpXG8yGXPVqURNw6h8U4u7t3RTTfhUMlTelWzVrOm2mB6fdBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 01:21:42 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.017; Tue, 4 Aug 2026 01:21:41 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Bartosz
 Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHdIYczihHpqGBQtEmjRJKnf0h+hLaMdmEAgAClxbA=
Date: Tue, 4 Aug 2026 01:21:41 +0000
Message-ID: <ZQ4PR01MB1202B695C951FF8C30E3508DF2D42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
	 <20260801072711.153217-5-changhuang.liang@starfivetech.com>
 <a4a807f1f0a4ea49feb0a3f39474ad0cb0b2ec49.camel@pengutronix.de>
In-Reply-To: <a4a807f1f0a4ea49feb0a3f39474ad0cb0b2ec49.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
x-ms-office365-filtering-correlation-id: 7d0ff8eb-79a9-424e-d252-08def1c6bd8f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|921020|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: +NrOQFw9b0oypDmNJwecSjDTT7oM1lPZoA6fBEZnQF6dll9gAM5D7JfwfkLXQt5D5klek2fnMfpvCYGbfh8AgwebLoXb0K/K1GIYlf6U2S6x8zVRg2Iktmh+8crWvIbpi1412uJ5v/42LxiB6uoxHfa3GOhQFHi23jf8SaewuM+EmRSGKscGARLKJnM/tYM0BCXSiMLgCVTvnhvi89e4mHvVB2eetJo0M4gH6LhsYjVgTAKNPt4NqlB7JajwkAMF9vSGjTI/QybaMg3mj4EPGzt8pDcTKyZbxpkjTTawzskw67k7Kw6PbBdg2JitDbQz9FZoTDyoIcEXhSd1GYdVLN13MZh57g7MHqC7AgoXb5N0BxYIW+IEm6pBpgelbdFSlUQLSCtodLF0zIMYZyz3aJPDJfOwdkYRdZ8B5dJpvATTUE48t2dZZvlidpq28p8D2x4NKJSJlHrPpZwZTGiPZQYYZka45uq4nosx7n66iBnM4Z9K3KohChA5jSCdjyqyXxybCGRFYias9SnZk6o6MHNsFDiTgdrQ9ay/tQfX9UXvrZEy0bFgP29YDN2PN+AphUieqCF4mUjEqPhgwQI3mA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(921020)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bysvS0lVQldBcElaOGZVSHFkb1I0RTVyOGh3SUxsOXNFdzUvV1NXa2JadktH?=
 =?utf-8?B?Zk5sZFRaczNyVGJlNGo2N2trRjZXcGt0YVhhYXZXR2F3SEJ4d2JFMjhQaERp?=
 =?utf-8?B?S3pUN25ST05GQm5Ld3o0LzF4YWp1cG9kcExFcGttVmowNmFmUFRtZ3VhemRK?=
 =?utf-8?B?OHlSVEFKd1NVNWN6Wk1TREh0emdxNGtLRWROeFZpV2lUVTROcHhSNTYrV1JR?=
 =?utf-8?B?aVMzbG8xVXErMEtRRjMvcU85cnc1OFN4eGUxWjBoMXhuVTNXMFRVSHZRMk1N?=
 =?utf-8?B?WlVwcG1oRlZ3VzhaU2VhMWZYcm40ZWUzOThvNWhsS0pnNk12VFJsaVRmc0Yr?=
 =?utf-8?B?QzdEa01Yck1LSUdGM2NiK3RqL1FWVXVxL2U0TmZjVHpsejRLVHVRa2NlTElV?=
 =?utf-8?B?Y3hDQ2RMRkNFbG9IMnliRjR3VjIrZjdHc3o4UVA3N1BBcnJLYU1Nb1V5QUpy?=
 =?utf-8?B?dFM3ZUsrNzdxYnhaWFQyV3VPYkxHKzZsQ2xIRjRERlJDVThZckVJczdIVjJ6?=
 =?utf-8?B?ejhEWHU4TEJLYzJDTHJsaXVDanFOa3dCS21ZZVZ3OXVSSCszeW9IOENBaDlD?=
 =?utf-8?B?eXh2aHQrWnVia2pLd2Z2YTlzN1ZTcHZKS3I4dE10Wko0L040WC9CbkxmVUtT?=
 =?utf-8?B?L3FwN3ZIT2gxaEUzZ2ZOQW1zQ2d0T0FlL0MzVXdJSXJuYnZjcGQ1bEFOWU5P?=
 =?utf-8?B?cGc3SVNWZkMzdmxXcjdMVTF0SGJCWGdhZXV0NlFwbnJ6ZE9tUjhEeHpzb3JJ?=
 =?utf-8?B?cGJaMzZTTVhOaHlqQ0kxUU96dXJvbWpPOU90Q3lKa25rOXBTK3l4bStyYTJj?=
 =?utf-8?B?cmJhWnZobU5RTHU5MGlzR0hhMWRhTkJpUXNhcGpybFZtYzd4T3M4SElZT1Z1?=
 =?utf-8?B?b1k0ei9EaEl3bWJ5M2hnWGtLWklBNHZXdWl2VzNTekY2WlJ3S0ZVeHh1RENk?=
 =?utf-8?B?ODV6Yy9GZGk0T3VJcFBPTFZONUdkcUFPR2R4YjdjWDcyZUwvYkNadzZSS25t?=
 =?utf-8?B?cm05Zk5OTU9BWkZYVCthQmtGZENXL1lvaVFaaWlVVmpPYTFRdlVqU0Uxc1do?=
 =?utf-8?B?UTRZQStpdldqZ2FzNW1LZUNVY2QwdEV4amxNbnR1b1Y1dFRkM3JXa053dlB3?=
 =?utf-8?B?WEF4b3lvOGNTMER6WHZpZjlqN1IramNEbG9wVVFuYVNzTjMyM00zS0pNU3Nk?=
 =?utf-8?B?dzh1d2dEQUltdnE1NTJIck1ETnM1cUEvU0xTSVR6SWNqS2UxQk5yb0xHZjlq?=
 =?utf-8?B?dXdLcitFZEFEZnVMNUZXd1NOTWdmUVV4d0dGTng1bTRZMVc0NWlvc3J0RmxS?=
 =?utf-8?B?Sm4xK1VMUWVQUnpMOUJFZXdpUC9xMjkxbDl1MnNVKzdmVlVpZFpJK0NUSlpR?=
 =?utf-8?B?VDRwc0tsQlhHTm9qRGFuZUpVbGk1NGpKcUVnM3prL3B3cHhuNnBFdVZrRng2?=
 =?utf-8?B?YjRqNk5IaG1wYUNsVWc1bytzbTVuOHBVQTJQUkp6a0VQTWhmRnBwaG05WitJ?=
 =?utf-8?B?Qkc5RXpXZVl0RTkzb2NLcUt2Rys3RTZiQVJCRnIvK1hxUEtiQnN2MzJhbWl2?=
 =?utf-8?B?M29odUlldktUampiMmx5UnQyaGtrUFBCQ1NXN1VVYy9lMGlGWHB1SGdWM3pF?=
 =?utf-8?B?U3NpMjU2UVhmN0s4c0lSTG1OR3dUWE1kV2c4UUcvZXJDTEkvczdKNlJaM1RV?=
 =?utf-8?B?dnBITTJ5dDlxeGJzM3ZBTDlndHZKQmloam1wSXZCV2p3cTIyV0ZmV2VEOEdE?=
 =?utf-8?B?YjVnWk9qVklQRDZwYUM3VXBITmFqUXNLRFdlMjY1WUpuL3Q1SCtCbFJCQmYx?=
 =?utf-8?B?bE1zQlh0SnZ3ZnFVYXI0UlV4dDJqTTYzQmpkaEdyZXlVbzVjNGVkRlg4d1F5?=
 =?utf-8?B?aVRnVXZocDJmUmozaWRtbkNiK1BucWJjUEkyTFB6TjFFenNnWnJRcWV3NjFF?=
 =?utf-8?B?Um9mTVF5TjZWR2w2VDBiYklJczNjakU0N04yT3pTaHlPQkUzTFFXcDZ6NURw?=
 =?utf-8?B?Q1VrYk9USitnOVpsa3dod2hJc1ZueVFmV3FaVWNicDZmSDF3bmJBVzc2Zkx5?=
 =?utf-8?B?R0I5dWg2MDhONW1rWVl6U0JDekVZU1ltelNGR1MzaHpLRWRDam1VMVlHN3ht?=
 =?utf-8?B?eW9tMVdNQ0cyVWRIYUJ1MEZxOWRNWmtoWU1RK2IzdnQvV1hwVjNDR0tkNjc1?=
 =?utf-8?B?MllEcUQxWDhSQmR6ZXl0ajZjbHZESUtvMDlYN1EvdXBIR2J6RGJyZVpUMjJS?=
 =?utf-8?B?OXpOZm1jT3plYmFmakNIRWFZSnhaRHljbHp2Y25sTHNIT3hVRC9HdlRaWHdK?=
 =?utf-8?B?NEphbHBpdmtpTFVFL2ZMN3ZpU05BTXdLSmR1RjNDTXhqem9FQllqV1ZpcmFx?=
 =?utf-8?Q?l8M460caNIloLVFY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0ff8eb-79a9-424e-d252-08def1c6bd8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 01:21:41.8881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6bAWCdAn+Ptg2PJNPB/Df01CcVbhaSaX45myqsN8CHOoPrcL4zW7qicFJQpf8OiYZ744529vD+rJcMLsVPb9hh1h2XFs18fCNg2w35xavSOOVuqOJnND4wASyD4Q8YHd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_182218_435410_F123E5F6 
X-CRM114-Status: GOOD (  23.06  )
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

Hi, Philipp

Thanks for the review.

> On Sa, 2026-08-01 at 00:26 -0700, Changhuang Liang wrote:
> > Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> > controller.
> >
> > Simultaneously add a generic pinctrl driver framework for registering
> > the pinctrl of other domains (sys1, sys2, and so on) in the JHB100 SoC.
> >
> > Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> > Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> > Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  MAINTAINERS                                   |    9 +
> >  drivers/pinctrl/starfive/Kconfig              |   20 +
> >  drivers/pinctrl/starfive/Makefile             |    3 +
> >  .../starfive/pinctrl-starfive-jhb100-sys0.c   |  119 ++
> >  .../starfive/pinctrl-starfive-jhb100.c        | 1456
> +++++++++++++++++
> >  .../starfive/pinctrl-starfive-jhb100.h        |  159 ++
> >  6 files changed, 1766 insertions(+)
> >  create mode 100644
> > drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> >  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> >  create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
> >
> [...]
> > diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> > b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> > new file mode 100644
> > index 000000000000..ed23c0c43960
> > --- /dev/null
> > +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
> > @@ -0,0 +1,119 @@
> [...]
> > +int jhb100_pinctrl_probe(struct platform_device *pdev) {
> > +	struct device *dev = &pdev->dev;
> > +	struct gpio_irq_chip *girq;
> > +	const struct jhb100_pinctrl_domain_info *info;
> > +	struct jhb100_pinctrl *sfp;
> > +	struct pinctrl_desc *jhb100_pinctrl_desc;
> > +	const struct starfive_pinctrl_regs *pinctrl_regs;
> > +	struct reset_control *rst;
> > +	struct clk *clk;
> > +	int ret;
> > +
> > +	info = of_device_get_match_data(&pdev->dev);
> > +	if (!info)
> > +		return -ENODEV;
> > +
> > +	pinctrl_regs = info->regs;
> > +
> > +	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
> > +	if (!sfp)
> > +		return -ENOMEM;
> > +
> > +	sfp->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(sfp->base))
> > +		return PTR_ERR(sfp->base);
> > +
> > +	clk = devm_clk_get_optional_enabled(dev, NULL);
> > +	if (IS_ERR(clk))
> > +		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable
> > +clock\n");
> > +
> > +	rst = devm_reset_control_array_get_optional_shared(dev);
> 
> The dt-binding specifies a single reset control. Why does this use the array
> API?
> 
> Using devm_reset_control_get_optional_shared_deasserted() could simplify
> this a little bit.
> 

pinctrl_adc will have 2 reset lines, one of which will be shared with the ADC. 
Refer to the dts below, but it is not currently included in the current series.

			pinctrl_adc0: pinctrl@11bc2800 {
				compatible = "starfive,jhb100-pinctrl-adc0";
				resets = <&per2crg JHB100_PER2RST_ADC0_IOMUX_PRESETN>,
					 <&per2crg JHB100_PER2RST_ADC0_PRESETN>;
			};

			adc0: adc@11be1400 {
				compatible = "starfive,jhb100-adc";
				resets = <&per2crg JHB100_PER2RST_ADC0_PRESETN>;
			};

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
