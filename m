Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01A7CA5FDD
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUPlmAwhR2lVY7+5CB48UbbpV9T6JrF6ObM5Wm1daMw=; b=phtsJv8S3iM+34
	eb+0H062S6gpwIiz8wxln3k/VkVrW/9nkmJMg6vhbO7lYU/GF0IOT970GTVqUtMvgexMTH9EhBdJT
	vx5Jovpt0keRekpNIuGdh6ZqnEYKY5tTTKZcd5vWUKVcMlTFyu9mTu6AhjMPV//QU9t5eorl7HaYt
	rjkFa5rorHHeg9qZMYxjOpymTd4uZDdFfXI4bh3DwOQ6ufJlszqgAD7Dj6VZO4cC9HveIHzyNa1nU
	4j9QeFe4x9Qf5h4Df7cH1q+VFp8QSSsAQGlbOPK+8i19z9N37rE13IppJkHAuzEfs+b9mWBOlNwvO
	RxMwaP1hY42cjAV/RcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Lk-0000000Dfhs-4855;
	Sat, 03 Oct 2026 15:08:32 +0000
Received: from mail-sh0chn02on20703.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::703] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Lh-0000000DfhB-2qlf
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 15:08:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IX6mqdrj/Avm5xF45Km67kErD1fHAnmW/zPIz/3IM8fKfNa/Yt6qSg+6+4qGUY0evjoCV4sg3XKxTPk0533g6YpzxMAe/ga1gSLYvePlNWxoJsf9VIdIi5vNGlCphL/83uLL8tC+CO9gBE+HtRefHJhqSuqCEXm6NkhI5mhSvFYNQrbYj0U6nPkAMTP8afY8Y/LrP3cAt4R2LRHN2qr5aQSoJ/fkdMZ/EXjGWQf3KbsKfT9Vp4MAImSqK34TQ+DpvFQw1r9AQLBj+czXnyg9DdOwijID1LfEyYGIBcZjatFFAuKgB8QgHq9Nx/3nhlV6cQygtMWJUaW7aha+koxa8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wm1/32twPwYRSffWfmwyFIqI9SkCNvwgf6s7Akdcxrc=;
 b=DL7IZfAcuShj/H0135FBdY7lU/D2y4UdabkY2Kl1jayvftP8jLopwnM6gKL9ITQMyBH+cRsVTWrYFZ/J8T4CQor4xQomRRvN8swZf36Qrd0fTY0a3dPolysMHyAIhVcsD3JnINwlZuzrp/6wrsBkiIHFnZ6y/3E7W7x6oi8cLcqAynR4J4OGSEahE3rADchaggIolUWbercPKDfXfEv/rCVmYTIPCxLm/t0LTc8oh2Vu5gigSYGmunT17jIJ723etcCU6VI95omCvG2mAIGNBS4Hy/ICKDOYZJelpU7nuAKYKqQdWnfwNoREVI4LM2cbo6jvHhUqE992Q2RPH0S9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 15:08:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0472.016; Sat, 3 Oct 2026 15:08:05 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>
CC: Michael Turquette <mturquette@baylibre.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Emil Renner
 Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>, "Gustavo A . R .
 Silva" <gustavoars@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Hal Feng
	<hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 10/23] clk: starfive: Add JHB100 System-2 clock
 generator driver
Thread-Topic: [PATCH v5 10/23] clk: starfive: Add JHB100 System-2 clock
 generator driver
Thread-Index: AQHdUNlXLmh95bym/0m9TiTYdcb04bbqnEuAgAFT/aA=
Date: Sat, 3 Oct 2026 15:08:05 +0000
Message-ID: <ZQ4PR01MB1202D613F74D237DB1303984F2882@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-11-changhuang.liang@starfivetech.com>
 <179096707365.821688.712584426844385414.b4-review@b4>
In-Reply-To: <179096707365.821688.712584426844385414.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
x-ms-office365-filtering-correlation-id: c92c8dec-a213-4930-7a15-08df2160209b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: fbD0gSRyYWaMTmnKLPJVxUADJESIbf3JuSw/D1dSab9BIh5i0ECwtrpZLSojALw67yxJ+omp7eYTl6epC65dxyIO8kAtW5sCBMhJe6D+NHXCHfwfGR3XClO4rAwsMSQfzYnwuse2dAqr99dXgF9PFrKr1qLq4TBBhDMZaZSHg3k/wiz0PGMou7Uy/GET0syMe39vnrEIj9M0z2jxcny1SHrCfArQ5bswuoBJVEtmJT23e0BydgKTIBOhBhWMkWImV9VlbXxYz/QrW2M1ugF/lJKdjSf1CZWXtdGt9V1vcHyYfnH2MFEE6ObKdSzpJ9Gv3+03biGKFYn//dGXUXpjPJYaO6ya1GtwOok6a2vOmm41WzIljTxZ4zOj66pnOCgRPgIV8UmM75jSYaTE9xr0NWib0zyAkFXEu1yN+Qzvt3WhmZpt7ZfUugKuwgPMi9hfE2d61rIxY3XJo4mVpMkxUCYuDNtQM2JiGZWJCbUmAaa9L6oONG2TXltcpqdqa4B640PrP67sm5SYI379k5vMaaOeowSDENASelC46YUTeYOUbVwP2jP2NQbkWkui2YkO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGRMTDBHa01vbmI1NG9YalBUR2hWVUVKS1FYQkZ2dDdEek9sVm4rUHgrZUo0?=
 =?utf-8?B?TWZIUTZSdkU2VlVLKy83azFGa1Q5dEhRMCtiajNGNUpJMjF1VnVEVkZQZ1Yx?=
 =?utf-8?B?eHh0WEY5YVNpU04xU0RMeEFHeFQ0b2QvRTlZVkQrRGRaMVRJMDduUzBwd3F3?=
 =?utf-8?B?ZHB6djlacEtGcTRWWUd5Uit1RlBvS1dFQWZBaXZRYk1jL1AvYmZZNnVWbU1L?=
 =?utf-8?B?V0s5YUNzTHMzR1RVd2EvQWxPMmRzMFFIZUlXaThIdWlod29zNW5IdXhTQnNT?=
 =?utf-8?B?dWZMYVpJUVkxdXIvOXA3bjFOUDVmeUJCNzRmRi9lMkQvMTZKWFhlNEFxOUxv?=
 =?utf-8?B?Uk53OUVQZDF1UTJ2NEdYNVc4ZnZtQWtUS2x4TXV5MnkzS29VSE4wL2FhdDlw?=
 =?utf-8?B?MkszTXpWZWkxU2FRczNGMkdHaUtLdWFLZVYwT1RxTGY0MHM0WXpNYlJKRVJP?=
 =?utf-8?B?cUJlblNERXV3bUppQzVuTEsrVUVPTWNoNVJPNWdaeW1NT0FrZklkZ0ZCQWxr?=
 =?utf-8?B?aEdkd3FkbzJHUFlBT1plWE9UczBwZW9JdHMxcE1abzBteHdZZ1REYnN0NjNW?=
 =?utf-8?B?VTlYNlZ2azlyVit5aUFNQTVVVTlaT3gxSHhFWUNZZDZ1QllTYmF6eEdSdTh0?=
 =?utf-8?B?MW1kUkJkRzBjVjBReXo2WW1TR3FLQ283T244U01neDdoNG5aVWxBdlhIVVBu?=
 =?utf-8?B?MkJFVlU3RXlRRFgwMVZHNjNPMXFxTmVxYkRycm9HTG9YMkQzbmoxMkFYM1lK?=
 =?utf-8?B?OG1TSnJ6ME0zRk50R25sNVlEM1hubVhoZ1l2eE9HMDh2dW5ueTVwZUtjc2N0?=
 =?utf-8?B?ODArZWV1RHpoV3U2M0t4QVo1UE1BcWorWmFmU1NWcWxYZE5ITWJaL1RMQmxC?=
 =?utf-8?B?WnBpNTR3QVlRcWF5dkxmdzVjME1hR2lIOGZ2WTZoVk5ib0hGN3FySGdFZ01G?=
 =?utf-8?B?bmFhNGxpNm1uc0xWWHYwU1N5QU8rZnQwVldJeXV1d1cwZFlNditWUi9RT1Jr?=
 =?utf-8?B?SWdGbTA5WjdCWVhST2ZHMzNVV3hHZnpJOFo0QnV0bEZjZjVURjhWZXJDeUVX?=
 =?utf-8?B?dDVSM1NGdm1FcUFEZ1VIRi9kTTBidlVwYmhPQUMrNk40NnNpUXJpYy8yT2Z2?=
 =?utf-8?B?MzRrQ2h2RmQ0M1FwQWVvVDgxN2wvUlBjTkNMODdoQkxPVWRUODE3c1lQYzNT?=
 =?utf-8?B?Q05rSWZ0VUtCN3JKQUpkcTNwWVNFOXVQbkN6Uk81cVpVUWNRVHdxRnFhMmxQ?=
 =?utf-8?B?WSt5dlJSNXZaZUhLM3E5cHFpSnNwejVhR2ZTaHB2YjhFVEljYUpCOGdveTZH?=
 =?utf-8?B?aDhXR0VzY0FiM1hoMzNNdUUxbEkwazZGdUxXS0ZIV2Q3QUdLa1FLS0xCdFJU?=
 =?utf-8?B?b213Z3NuclpnVDN2bytYODlYUUVSQzFSbkxrSFhPeFFvVkNWVjRIOGFmSWht?=
 =?utf-8?B?aXhXWEtmSUNmRWowZ1krWWVpc0xrNzYvWVZuQkZwTWRQdkpEaHhNYWRVQW9Z?=
 =?utf-8?B?dzVoYnBNTThQUmZLV2dDdnpGUlRsOGFPVmQ1YkFYdUhzeXFkSjdLWld1TmJs?=
 =?utf-8?B?eWdVU2hvcTF4WlVGRk9iV0RhRHU5MzRzQ09YNXlsbldPc3ZUdFdXa2hyTFhw?=
 =?utf-8?B?eXRhMFM1bmY5Qjg2MVhUb3pRNlZMWWMxMEY1azlXSGNNa0crbzlmQ0NzSGw2?=
 =?utf-8?B?QStLUU1aVTh5bW85Tnl0ampIc1l6cVhmZTgwa25GeEdTM2Q4aTVZTkxHZjRm?=
 =?utf-8?B?SGZRdWNOeGxhNDIrNk51MzVtalJmVXozVCtxU2pHYmRTZ21QZXliaGYzN2lD?=
 =?utf-8?B?VElWdmYxT2t2dkxTZHR3UUJPRkhsdzU1ZXpYR0RTbnRFWERWVDY0ZTF3aEEy?=
 =?utf-8?B?TXEwYjgrZlpoRS9pU04wSTFBR1F5aEJpQ3VpRUFHOXdkcDlXZ0dHNFlMTS9B?=
 =?utf-8?B?Uis2M0tnVjB5VVdIdGZ1Z1ZhTU9PTlFjL0RhN1N4amM4dDlXVkVqYjlmRTlD?=
 =?utf-8?B?Rlk0NXQ4UjFOcHlVMU0yRGFmOEgwZHFZRGFiMWtDWHZCeFpsaVFzVW4zai9D?=
 =?utf-8?B?bVRsM3pyaUJINWs2YjRBSUhSaE1MV3MwR01LWEE3ZEZPcFRlRlNuWVZ2VzVK?=
 =?utf-8?B?Wk40YnlzdnEyWUpjQXdLakJFNUV2NzdzS29BOUtSaWFPdVdMcDZrR3VRNTk3?=
 =?utf-8?B?OXVaNmllajkxUzdpQ01keDVFTVpTbFdQM3VINGRmdVVpWUZKY28xbnRjdjJX?=
 =?utf-8?B?V3U2ZHEzS3NKcFJwMTBPbCs1ZE5MNGNzYlorZVd0bi90R3o2Slk2MThSUFEy?=
 =?utf-8?B?YmlKd254em5ycUp1bjhTQVJKbXBBMW8zdHRLeDAzMmNHK2JLUm43UlZtY1dH?=
 =?utf-8?Q?CPXKGc3iRtmqAJxk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c92c8dec-a213-4930-7a15-08df2160209b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 15:08:05.7242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylZw/GEcyh4n8AL88swop9bXLHp7k5NRP0T7O4A4PJKW4uJrFzjbkGgBEBN1jh53qxzBlIk/PYjljHJwSb6JHOl4wbbRV5yY9BEoScFN8z2Du9vjJWOm31Xd3w8tuJ1G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_080829_746516_1951C92C 
X-CRM114-Status: GOOD (  17.85  )
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

Hi, Brain

> Hi Changhuang,
> 
> > Add support for JHB100 System-2 clock generator (SYS2CRG).
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> >
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index 11da8bcc4046..cfaac934a8e0 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -92,3 +92,13 @@ config CLK_STARFIVE_JHB100_SYS1
> >  	help
> >  	  Say yes here to support the system-1 clock controller on the
> >  	  StarFive JHB100 SoC.
> > +
> > +config CLK_STARFIVE_JHB100_SYS2
> > +	bool "StarFive JHB100 system-2 clock support"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	select CLK_STARFIVE_JH71X0
> > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> > +	default ARCH_STARFIVE
> > +	help
> > +	  Say yes here to support the system-2 clock controller on the
> > +	  StarFive JHB100 SoC.
> > diff --git a/drivers/clk/starfive/Makefile
> > b/drivers/clk/starfive/Makefile index 0061550e0f7e..29cdef20575e
> > 100644
> > --- a/drivers/clk/starfive/Makefile
> > +++ b/drivers/clk/starfive/Makefile
> > @@ -13,3 +13,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
> clk-starfive-jh7110-vout.o
> >
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> clk-starfive-jhb100-sys0.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+=
> clk-starfive-jhb100-sys1.o
> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+=
> clk-starfive-jhb100-sys2.o
> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> > b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> > new file mode 100644
> > index 000000000000..a2c7e8eba9b6
> > --- /dev/null
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> > @@ -0,0 +1,129 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * StarFive JHB100 System-2 Clock Driver
> > + *
> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + *
> > + */
> > +
> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > +#include <linux/init.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-starfive-jh71x0.h"
> > +
> > +#define JHB100_SYS2CLK_NUM_CLKS
> 	(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG1 + 1)
> > +
> > +/* external clocks */
> > +#define JHB100_SYS2CLK_OSC
> 	(JHB100_SYS2CLK_NUM_CLKS + 0)
> > +#define JHB100_SYS2CLK_PLL1
> 	(JHB100_SYS2CLK_NUM_CLKS + 1)
> > +#define JHB100_SYS2CLK_GPU0_NCNOC_INIT
> 	(JHB100_SYS2CLK_NUM_CLKS + 2)
> > +#define JHB100_SYS2CLK_GPU1_NCNOC_INIT
> 	(JHB100_SYS2CLK_NUM_CLKS + 3)
> > +
> > +static const char * const jhb100_sys2_ext_clk[] = {
> > +	"osc",
> > +	"pll1",
> > +	"gpu0_ncnoc_init",
> > +	"gpu1_ncnoc_init",
> > +};
> > +
> > +static const struct jh71x0_clk_data jhb100_sys2crg_clk_data[] = {
> > +	/* jtag mst*/
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_HCLK, "jtagm0_hclk", 6,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_HCLK, "jtagm1_hclk", 6,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG, "jtagm0_ATPG", 12,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG, "jtagm1_ATPG", 12,
> > +		    JHB100_SYS2CLK_PLL1),
> 
> The ATPG portion of the clock name is uppercase. Can this be lowercase for
> consistency?

Yes, it should be lowercase here. Thanks for pointing that out.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
