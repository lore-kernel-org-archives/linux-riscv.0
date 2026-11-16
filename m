Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B5606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 02:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qVo9Bist
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UkvOhiBovsZbq9ty3YLa1QBNsGCuSvTyF5fRJtTnC6A=; b=qVo9Bist08Y8PEmzR9stslasSg
	pnN18aJJVFOJ72j28Yy2IvEBCE67p6o33P7az8Ad3+YBzoN8D2hqn4gZFWhJa1q/7LPXnYiduM7xG
	7YJ+TY1f3tgNLnNv9C4UKXl1UNKqdAuNK8LbN+Vw9ICk6OCVJdsdLJcQgXwibrs5pB/crQUEiKAqJ
	YUDB5X5lCj7D1PlD2HHlLge6QGkylxQ/Wv+wl2p/hXG5loj1iE/KmgrV33rWxyJnVxAGB1FDXPiw6
	qZnjT1I6A/dUz1QdNYXKUISFFByXiqq1tz3tVPrcG2IulExkmHuLEzncwbpukPb7R23LfcGVe3Rgm
	mLKtOc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmAJ-00000000v4I-08tS;
	Mon, 16 Nov 2026 02:09:51 +0000
Received: from [2406:e500:4420:2::726] (helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmAD-00000000v2x-3fvL
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 02:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXchSpeCxj6SKS3obDqtTt+ov7DPeOp8wTgO63dW0HyF3HX+xuSZe8tY8+JlNbaeMhYaO5HlRSbJMTsygvda47ZNDdSfF3GQMKgBt5uie5XujrCj9vq/65g8/bU/fsw6HGN/lHrnmXHzmW4B0myMQJJJaUpY9wiNGW360KY0/ivMbVg7CKeict1ndMHLIer3eaWjvvjuvt6ynH1O4boeEAGV5WCt9WhzJxnu5x8rYbawuJHKlzZvVs1OWZN+hJ07R/8yxJ3n2f5HNqOXObMPQ/rxxVLvtid+5Y3XOvernloPWpoERHFP7LMhGW8zfh2R49w6JJOyeVTlQiuRxRONog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kguvMeAG+734dMSclFesJD0PaWewOZbvdI/0UhPwtJE=;
 b=SZ/uIKu5Caa56N1KIpsNeyF8hxrb5b1oRN8uhYlNKsyEzTMDJyK5sKSQ5V33uOpkzM4PmtVXQ7GzqFbUgh/PrN1RaymcajuB561dNc2u2o0FEPeakXYnNfX2CsnuPKEch3QZycbdyDakBNRXvI5tF+eiGG/Ast/3dEHHvwFliNSvRiQ1KC9Hv/lxLmTT00HzQI9j/6bjU9E+nRv+c/DLLsZiQq5+oyEd3LhKzsCB3x+rbdvCbgTM3vEEUIPk53H5FM2eW7f/YKJgRxj0/hofvobWSxYOjiFCB3PPz+Vh21xXsIfedxfAl//CfKtdCwaLh7hZyE4X5T7QEGL1+Op3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1266.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 02:09:25 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Mon, 16 Nov 2026 02:09:25 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v1 4/6] clk: starfive: Add JHB100 System-0 clock generator
 driver
Thread-Topic: [PATCH v1 4/6] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Index: AQHdWv1vtBCSUoJXt0O7bBKqPZrfnbcvYmMAgADGoYA=
Date: Mon, 16 Nov 2026 02:09:25 +0000
Message-ID: <ZQ4PR01MB1202E4FEAE49C1FFC4705897F27C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-5-changhuang.liang@starfivetech.com>
 <179475230833.3873592.8310507156583636155.b4-review@b4>
In-Reply-To: <179475230833.3873592.8310507156583636155.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1266:EE_
x-ms-office365-filtering-correlation-id: e2d3495c-6428-4ac6-5d51-08df4386a32b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|38070700021|261021133027099003|56012099006|10067099003|4143699003|261022105027099003|261022075727099003|261021130227099003|261026140227099003|261026121527099003|261026135527099003|261022115727099003|261021121427099003|261026130827099003|261021135927099003|261028144727099003|261022113327099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: WQn0VZ7nSiaJ63XcFkCAnjAOzmXUG7IfgenJte0QHyfxapnWzF5880piP8XTbJ0Lgg5epk/CtKvET6O0eDT8iOt/b/iC9G2GjNDXXiq0O81obIABFY52FVkuJCwhuWyVCQfomJ2Deu/meCUqtz87BGv9UMObvjO1vfXJTC2CyfyTj3kFOpMil2j2DF0Np0sf367PTOS0QWWtRQCgboLrLafibpWQiESqshBF3kz08dF+N1E3PwjUROR171rJoWK51xy7QMTqujRH5TGjQG3brRv8O9Jf2vq9leiSKc3lzVp5ww8P7WgtnqAmguAQqDvve525Oc1ikTke/E/uG5RNAHW9Y2bPaJnsCmqTalMtLxRD8aNnyYJScGQ+bVF+tOR4ZqDHocEne7M0gpmfLeVycRj7OvJynblGEpGscg7P6MFY6U8yjdDEejqEA2hHdvHUNYcR+jBVpTdlz/nFj5yRAoXNoB+0MStTJYCbAMo0X33nQ1S0zizi8UmfTvX3pKq7pQNqfQXN90dwuXLyeBV1jnKqeY7KCYtAQtA406MREsVdd9dmnfo0+M22GUBf37KD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(38070700021)(261021133027099003)(56012099006)(10067099003)(4143699003)(261022105027099003)(261022075727099003)(261021130227099003)(261026140227099003)(261026121527099003)(261026135527099003)(261022115727099003)(261021121427099003)(261026130827099003)(261021135927099003)(261028144727099003)(261022113327099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0p4V3hHei8zb3RsMEd1WmE3RVZ1M2ZZZU9pcnZ1eUdiUXdKRGkzZmprZ09w?=
 =?utf-8?B?WHcxZWh3d1JycEZvR1kyTC82ZDdOQ21NOXh6Mmdqb1I0Mk1yMzhBSVVhMGxr?=
 =?utf-8?B?YzArYXlaQUJyUFVreGtUNjNMU1J2NHIzaG84Z1M4RVVzQm1LN3hTSS9qSGU4?=
 =?utf-8?B?TnpUN1M3YWxrZW43ZS9mSVMySW1rQmJzWTdpQmhsZ280WjhPbEZabkdrUWJP?=
 =?utf-8?B?QVlmUForZWtSNm1oaVYvWnArY1JJaUk4dXlVeFJsV1MyaGJSTzlObmFWZVZL?=
 =?utf-8?B?WWRUc2FyaEM4Y3U0c2JoY2R3MXhRSHorMFZJbUk1SXVIRnNabVBlSHZqalZz?=
 =?utf-8?B?RDRUZHhRSGszRUR3VTlvRzJIYURIMEJ5Rkl1RjUvZVNIQU5jamhqdVJucHM4?=
 =?utf-8?B?aWhWQiszRU9xVWFOZ2U0eHRZeHUwQUR1cGMyQ1RhUW5ueVdiUmV6L1RMcENF?=
 =?utf-8?B?RjRDNnFsMEJIZWU1RHVlZUNHRXFicDVCajhFcFM1eWFHeE90bTNJMFhmRW5r?=
 =?utf-8?B?M1RjY0ZZNGJxZnRCOVBYbzhUOUg4ZWw0STEwcVFwbzNZNTdxYUtPR1h2STB0?=
 =?utf-8?B?QUFJdFVVRU5Dc3NONE9nL1ZNd2NaV0dnUmQ2WnJjTXBsRDZYNnRVVGxRZXBB?=
 =?utf-8?B?Q0hnV040YXRNZ1JMVG54UGdlWlVNZ091cFZDV1M1eEJ5dVM5cmFnVERlekM1?=
 =?utf-8?B?N3F6eXhNSVpvdnkremE2c3lmUnRrSXpmbVAxQXFzcytzaDdjQThXMFBiZGVy?=
 =?utf-8?B?OUM0RzI3NmVHa3NvQU80WFRab3c2UHJIT1JTZUJsUW1LTWthN2RoT2JiTWZt?=
 =?utf-8?B?cng2YUpHZ2ZNQlVndG9PN1NmNGpZc0hlbHFIdE95eDh5dmVSWnBrK255MVVY?=
 =?utf-8?B?d1VVRHVmM01MMUJ6cUJCVkhSRDNlWFJhdlljbGUxbmtJMTdQc21RUHJoY2VZ?=
 =?utf-8?B?bjV2cXQvWTVnTHI5ejRtZktWdzBIM2NLNFZtRXUxVGY2VGdFSStveUlnVnlU?=
 =?utf-8?B?OFlhUVZoZVhDdmQvbENSTFlZNThSRTFnTUVHV3ptL25WNk5pUVFlYkVBYk1u?=
 =?utf-8?B?cTcxOU9td00rWWIxRFJhd0hOZU90NjFSRW1GYWNCQVR6QlRESnkxSlRJaml2?=
 =?utf-8?B?TUJGcTFBSGUyT1kyUWhmMUNpZENsQzBhZUZxeVh0S2FNSSsycXZuS2xLcHpq?=
 =?utf-8?B?OHFzVUIxamxWd0ZING9sYmxzb2xybWZPbFJldTY5b1lIS0R3Y3liZGRVT1NK?=
 =?utf-8?B?c2N5cU5NYldna3ZNRGtheHRROWNmZjBld1R3OU9HaGI0T1R4M1N1SFlQcU1r?=
 =?utf-8?B?RmpTTlB1Ym5WbUs3R1hSSnQ2VnpoL3FxbXA5cmZ5N1grQUcvdTBNUFU4YVZE?=
 =?utf-8?B?QXZ3cktkeldvSXBNcHE4N0lKcjJTc2NEajB4NDM3bDFMc1hVZmtielVuMTFR?=
 =?utf-8?B?UUlJOTByYUJOOVBkU09mTW5OVndhWUQ1L05vQ2tmYXcxM2xWOUpqbXlNdk1S?=
 =?utf-8?B?c1oza1k4c01oLzZUSU5vZkdnMlBxazYxZ3VUQnN6SGFZZnFkQVJsZWMrM2s1?=
 =?utf-8?B?QUh1dld4c290clNNZ254LzNZbXRjMG9DaEFFUi81T29PRTNZQ0Rod1E1bVF4?=
 =?utf-8?B?cVJTM0hPRTluVnp1RXp5UHREaG5DQjF3Y2NraDB6MmZHeHBQVC96YjRvNmta?=
 =?utf-8?B?ZldzRDhIMkFidzNMSDh5aDhtNXJuUGtxZEM3K2VIV3dmYW4yUVRzelJ5R1FH?=
 =?utf-8?B?TnZZWXJ1RXE3c292aEZKM0FYRVpyYkxUbm5rdVJtMEFHTmpoeGpNNWFJVnZM?=
 =?utf-8?B?RW1FVWFXU2U3OXhPMmdScDQvZ0ZXT3Y3RmQvVSsrRmgwOW5kSm1rcGNuWCs4?=
 =?utf-8?B?SjEyVHZ4NWJIY3NhcHozanMxSjNieGpwakR3aWp5N0NGdlRnSzJzUkpjb1Zw?=
 =?utf-8?B?T2xYYkVkSGpMNE5iMEZZdzFvTnZUY2tFeVZ4cWhrU0NNVm1TSll5MVhrWE9Y?=
 =?utf-8?B?MnYvcFVZeXhFcmRMTFhTZEx0WUhULzNBZ3Nmd2tMZjdtMTFadTE2S2h0ejl6?=
 =?utf-8?B?RWsxZVRFb1JPOGgyS0xPemp3NHZocS9hSzdvckgrb0JxNTRHZjlZM2ZpcUw2?=
 =?utf-8?B?TmY0amZuK2poTEpWblRsaUdnT29PbHpTbW5ZYitSVklJa1pJdnRBalI2U1pr?=
 =?utf-8?B?SzNvN2JPY0QvMWo5NkYvaWM1Y0QxOHhVbnhsNTdRRHA2WDhRMmdSazV0TDNX?=
 =?utf-8?B?OXlOekw3TWorb0RoVlBwTk1CUDNHT2ZkZEdKQWcyMDZqdytJRFd4elFOQXEv?=
 =?utf-8?B?SHlXZ0hQOGpaaTBaZnNnNFVNNXlkcFZPWjFIc1R3ZUxuWkpPazM3NDdEc0Yw?=
 =?utf-8?Q?MghtDxiBTe4nhX5E=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d3495c-6428-4ac6-5d51-08df4386a32b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 02:09:25.1809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVoLtPz40MfCa+D0aRbPU1tHGHMDqT9SiZUkLvqS0RUWNWrk4I1HzINr74vQ0URND9AZG12vtuuIX2oEwmWuR19Fe0sq0vZNQZHjcE/1u96XGFoA/2XQPwPMwwbAjU2b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_180946_065456_3194E051 
X-CRM114-Status: GOOD (  22.07  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Jerome

Thanks for the review.

> > Add support for JHB100 System-0 clock generator (SYS0CRG).
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  MAINTAINERS                                   |   7 +
> >  drivers/clk/starfive/Kconfig                  |  10 ++
> >  drivers/clk/starfive/Makefile                 |   2 +
> >  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 148 ++++++++++++++++++
> >  4 files changed, 167 insertions(+)
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 93abbb315065..f66998e8eb64 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26837,6 +26837,13 @@ F:
> 	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> >  F:	drivers/phy/starfive/phy-jh7110-pcie.c
> >  F:	drivers/phy/starfive/phy-jh7110-usb.c
> >
> > +STARFIVE JHB100 CLOCK DRIVERS
> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > +S:	Supported
> > +F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> > +F:	drivers/clk/starfive/clk-starfive-jhb1*
> > +F:	include/dt-bindings/clock/starfive,jhb1*.h
> > +
> >  STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
> >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> >  S:	Supported
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index 51716655554f..cb246ae12c08 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
> >  	help
> >  	  Say yes here to support the Video-Output clock controller
> >  	  on the StarFive JH7110 SoC.
> > +
> > +config CLK_STARFIVE_JHB100_SYS0
> > +	bool "StarFive JHB100 system-0 clock support"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	select CLK_STARFIVE_JH71X0
> > +	imply RESET_STARFIVE_JHB100
> > +	default ARCH_STARFIVE
> > +	help
> > +	  Say yes here to support the system-0 clock controller on the
> > +	  StarFive JHB100 SoC.
> > diff --git a/drivers/clk/starfive/Makefile
> > b/drivers/clk/starfive/Makefile index 199ac0f37a2f..d2ba83d7d02c
> > 100644
> > --- a/drivers/clk/starfive/Makefile
> > +++ b/drivers/clk/starfive/Makefile
> > @@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+=
> clk-starfive-jh7110-aon.o
> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
> clk-starfive-jh7110-vout.o
> > +
> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> clk-starfive-jhb100-sys0.o
> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> > b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> > new file mode 100644
> > index 000000000000..dd4d65f4e682
> > --- /dev/null
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> > @@ -0,0 +1,148 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * StarFive JHB100 System-0 Clock Driver
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
> > +/* external clocks */
> > +#define JHB100_SYS0CLK_OSC			JH71X0_EXT_CLK(0)
> > +#define JHB100_SYS0CLK_PLL0			JH71X0_EXT_CLK(1)
> > +#define JHB100_SYS0CLK_PLL1			JH71X0_EXT_CLK(2)
> > +#define JHB100_SYS0CLK_PLL2			JH71X0_EXT_CLK(3)
> > +
> > +static const char * const jhb100_sys0_ext_clk[] = {
> > +	"osc",
> > +	"pll0",
> > +	"pll1",
> > +	"pll2",
> > +};
> 
> These are the hackish part I was referring to.
> 
> > +
> > +static const struct jh71x0_clk_data jhb100_sys0crg_clk_data[] = {
> > +	/* bmcpcierp */
> > +	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN,
> "bmcpcierp_ncnoc_main", 6,
> > +		    JHB100_SYS0CLK_PLL0),
> > +	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG,
> "bmcpcierp_ncnoc_cfg", 12,
> > +		    JHB100_SYS0CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS0CLK_PCIE_REF_CML, "pcie_ref_cml", 24,
> > +		    JHB100_SYS0CLK_PLL0),
> > +	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_DATA_INIT,
> "bmcpcierp_ncnoc_data_init",
> > +		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),
> 
> I think the v6 that came before this had a bunch of critical clocks. None of
> those were critical after all ?
> You did test without passing clk_ignore_unused in the boot arguments ?

Yes, I tested it without passing clk_ignore_unused, and these should not become 
critical clocks.

Best Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
