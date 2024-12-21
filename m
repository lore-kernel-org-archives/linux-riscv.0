Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2A4E77184
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 04:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPJx/0GOF/kJ5IyD7YSbQCWEOgEZ5jJS/ibYIryG7To=; b=3CR0a0I3a0hmJQ
	v1zvb7NI9ByU5BYCB9ByAPlAAGUDyPHrX02ilBQbMUuSTn1EDfnSu9kbj/M7kujcJRoJwoeL2CKB5
	CjkZloIV4Y57WuDujANbfm9nDWfeOcxz7FoC0OceyT6rn6vxtdsJ2EKP0hev7YgSAVNnAw+vxIsQj
	h0Y/zjO2deUf1ke3cshD6KnrPBTxHMNEMVbp8NyYUmc5G7SP9qArBrqXqJ8dRMczhVukD6TzlERe+
	GUa5r2+06fU/SpdVXRuQsuskieZ/JTt+PD27W1A7Xhyra7NFaIPzmv1ykZS3GRB81pxrw704sVQI6
	+nJFyziaEkHyntVsxS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOquA-00000006Wd3-2cZj;
	Sat, 21 Dec 2024 04:15:54 +0000
Received: from mail-sh0chn02on20731.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::731] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOqu6-00000006Wbr-0xnf
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 04:15:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRhwJMkFupctRgvylzOQrxYjy/oFInu7uEy1Jhy99ZFILV4Q1Le6CaYS4Mg01fgN9X+73gncxiem4MX6BAtKtFeyikiLsvdZtb1F27hYjO8FBeRtPO1a5K1FcWFOAsiRHY90SiKQYHR7i3cyOC0uAQ5IsJs694aoRx3e7STRicslNcUX3NI/PfZjdVwqG/Jm2znpKO2jQP5sIecFh2Onh2vu+GxiTSg1aANp2szy6K/HxzZU0npFEbN0WtJZIx0VaHNrQe0ck1FYamSNAffpO1lIMGzUIJeOb1WviucVnkztCCIV/CIvVDL16OzCSfaZdU5qlwE3tZ0N26i2Vq1pPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZLHKrn0kU2rhkvlyZVj/uHvJTZYRa4HBepFoPKsJZw=;
 b=G2PccFHlPtCBn3LxhJj5X85bsiO15eO20fUOK9Hkv+7b02c2QvZMbncmELTf2wA048olLVWa0DRmNzs2iJiXsV3lMD/gOtJIO1k0IR851Q/WoeawZXFk5DVp5vEvaG22onVhVnsWghsjZSelCdGfRgV2De7zU8crzWxwBI5wswdsbbQd20+EPkpZn4H4Eao5yQ38RNgGlJZIA8qrPHipx8z+i9tO0/pHsAACBQ8xYP/wkAllsO+gOEYLXRXcaKrB6SEFbvrItTGQS9djDoJPNB86K6+0hdV94DOg2EPzaTctkq0gMdRF31Iii+jg6Bwq9gZXMlcXHA+pc0jIBNLvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1274.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Sat, 21 Dec
 2024 04:15:57 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%7]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 04:15:56 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Jianlong Huang <jianlong.huang@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: RE: [PATCH] riscv: dts: starfive: jh7110-common: Use named definition
 for mmc1 card detect
Thread-Topic: [PATCH] riscv: dts: starfive: jh7110-common: Use named
 definition for mmc1 card detect
Thread-Index: AQHbT/cItPZg0BYxikqmhcJqnrbnzLLpqmPAgAAcd4CAAP17AIACkCAAgAElwJA=
Date: Sat, 21 Dec 2024 04:15:56 +0000
Message-ID: <ZQ2PR01MB1307BD49C0A49DAD3AA76049E600A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20241210040652.164030-1-e@freeshell.de>
 <20241216-elixir-cupped-f7a83bce4e12@spud>
 <ZQ2PR01MB1307F1FC7EEB8701525AC9DEE604A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <bd4df536-0a5d-4ba9-ad0c-51a7828acd9c@freeshell.de>
 <20241217-strained-latch-52bf7d03716d@spud>
 <4ae45ee4-69ed-4fe8-9350-9f83c13a9c89@freeshell.de>
In-Reply-To: <4ae45ee4-69ed-4fe8-9350-9f83c13a9c89@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1274:EE_
x-ms-office365-filtering-correlation-id: fe1c758f-6466-4c69-ead4-08dd21762afd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: JMQT5X8isnssoF9JIsgfdiDxIYWFH9LtN/LO/eNTW5m+Ml9lF8TSyvkg8BKV3EoAugh6uKaNZ0WLcd3P/zbKOf9pW2vMhdEdbFyENfwyZaTll4jRcB+h3vANq6E2oEP3/vvhahCFyKPAfp4ugi/5atm/7z4rU1Wtap0kIKjM5ObPXSg+Pd0XWDnmTKImwNyFSbSZ6lNOfPCoGVvbRfXf9IB0dOWswyhiUP7SPjg+EwCw8HvaILIJ/tOzmmv/a0TsbEFNKSiCybHYD+XyUSrpfW7HQVW/PQP2ny5MpXVkT3peLs+yVtQ0mnrHo07QqbQ026ExRxdJrJP/PsUrUbL2i7+FMedMVY+412GPzYRBKolbsxwnIxzIHQpEVGwe2m73rv4aPK9PqLOU2EtOBBPzvSECY8NNiowomN6LvSG2a4YA/FT88cubeGKHXz5JX4Z3+p+dtCHIS3XFitOWZQQsf8mHAHSsxU2u6c7joVBjMPR4uSE+9rM61IKFfzKBHhL3p4SHvTshegL87GvVqlY0jQrM6QRq9QaGcpL9Yjg3NviQWsYp1CGKJd3Cfv1V77LjQUoaP/WwJhG9E1RSKKMrMJQL2yU9lkR05x7S2uOcLA8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTFMakJ6eTRaL2oxdUVUdXlySzc4Q2kvM3Q1OWZpdFZDYWJqZk0yczZMYkhh?=
 =?utf-8?B?VFNFbnBkTlFOYTYrTlZjVTRkdnpMZzk1NUdWNGhINHJCYzlyd094WVZpeXR1?=
 =?utf-8?B?WXlsUjdMSUpLNHFpUU11V3Yra1g1YmYxWk9NTExSSVJES2xpNFd3NEZqbitR?=
 =?utf-8?B?U0tXMGczTlg3U0tIL2tETXhQQmtuc05sQk9GeFI0YS82amlwZTRxZ21HRHYw?=
 =?utf-8?B?QmxCcTMzbkEzWHV6WnU0YTBPS0xVL2MrVE1lMHZSQk9EWUE4V29tV1JLS3cr?=
 =?utf-8?B?S09LMXZibTJOWVNPc2F1UEpOQlZsQVd2ZU9JdkZiZWIwbkdtcjdzSWlreDQ3?=
 =?utf-8?B?blI0ZGFyRFFCK2NONDhIZ25wWUlld0dEWlJJTS90NlZ4UlZjS1F6Z2pCaVp6?=
 =?utf-8?B?Qk9oNUpDMEFFcGthZ3dJNzU2T25ta1lsTUtyUHo2aFJ0cUFOeUJPU3pCOFUv?=
 =?utf-8?B?SDNidTRISVVNallQSzBtVGJMTDF2UHFCTktndjNhNFhNT2wrcHd5RFdFa21v?=
 =?utf-8?B?OEUzS1ppeWdtamRVRlFJN2ZMVmR0SFpoM0t0WFV5SndJOWNVa2plN2xkYnRj?=
 =?utf-8?B?S1YxOWMzbjUwd2R4UWE0U2NOb3o4bStDUlRFTy92ZHRmZldJakVla0Jpa3JO?=
 =?utf-8?B?bzc5VHpxVHl6TFRiRmVMK1JCaUZNczRJRDc0REFnekF5WnNtak9GcWczSzZu?=
 =?utf-8?B?TVEwb1BmMCtYcXhzenA0THl2V215djhDSnorZ1dkNEVndndxYzVESzNCVDJI?=
 =?utf-8?B?WDJwSGlkd1JYL01mdllHV0FYYXY3QlFwNFBZQUE1RmQwaGxrcjlxcU5YS3h3?=
 =?utf-8?B?dTIzM3NCNU1nL0pHVWkwc3BHN3h6ZnpVeHdrMEJ6ejY2ZDkzSEIvMURVZUp1?=
 =?utf-8?B?RWl1eWoxQkpVM1hZcURrRnBhVlVkUm5RWkNVclllU1ZnK0xkVXkwNmt5RXk4?=
 =?utf-8?B?VjNZVHJ3N0tsZGR1bHhxMHN4dk1QQW0rT0hNRlZyYzNTc3FDUjFzcmNpaGlj?=
 =?utf-8?B?MWs0MldXZTFhN3R0TVpMZlBtd1pRaVVCNlJSemtXd0tkUzhIY3lzUUc5aWtZ?=
 =?utf-8?B?TTQwZDNXM3pnNjBZRFlyZFhRRTVHSDhja2YzK0N4bGZIUGhHSjgwWk0zdmds?=
 =?utf-8?B?bW9PSUR6a1Z1RHNHdzZoaGwxNERiS3FTQys5NEtrWTNyQjVieHVrMTc2TXhK?=
 =?utf-8?B?VG4wWkt3eEhjRHk4ajljZUtVcEszYUFmcW1aV1gxR1VXWlJTV0xvK3hYdWNv?=
 =?utf-8?B?bEFJdEFzaHJyN0VDSmZWK0FseitUNEVMck1RQmYwTHFZaFFPdzIzcnNBL0pH?=
 =?utf-8?B?dXEySjlza0JWRmN5YThBUzNRaUN5T3lYRkRkZXlJdlBzQmxSQ3VsSVdvOUM0?=
 =?utf-8?B?ZHRnTVNNaGVwc3pBQ0IvV2JZcEM2Nm9HQTN5alByWDRHN01NK2NPNWZuV2x5?=
 =?utf-8?B?b2pDRXRkMUNTVytETWJGTEZMd2lyMFVPZm9RMHVLNlJybnhBUFM2S0IyWFk0?=
 =?utf-8?B?dFAvZFVRRXhFNjQvZnV0MXN6ak11SmFqcHZmY3pDN0paL1Z3Y2s0YVdvQVlY?=
 =?utf-8?B?WE8vblNpVEd5ODh2bVpxT2wwQmR5SERJNlhPaGNTaVphT3JuczlxSE01MUZ5?=
 =?utf-8?B?RWUyR3d4S3lrRllvV3lRV3g5aDRZdnRsOXFxQUZTZEcrRHdROVNKNzYwdjFt?=
 =?utf-8?B?SXZ4ZzlGYlo0NTgrVFJJMFRXT3dOSyt6T3V6dU43emJEK3RHblRteEMwZFZW?=
 =?utf-8?B?NnBibTFJR3JpTXdFZ085TDU5RnlqMjhsQ2Vsd0s2dHhNYlYrNHJ2KzYrblpH?=
 =?utf-8?B?TjdHUXJ0V01LUjhBcWZmZnRad1pkL1dlaG1yUkQrR1ZybGkxOTZxWXpoMnEx?=
 =?utf-8?B?RWtycGxneTFNa3N6Z2tTa3l1ZGlKbFJKbFljZzE2SFR0WEd3bE41ZWNTRzd4?=
 =?utf-8?B?czhqMUpOOHNrRDh4bHBKUitVM3BoVmF4WUp5QkFIbTZ2M0ZmK2YxQXY1WXlW?=
 =?utf-8?B?eHNUV1kraUxOd1hXbFFDdUhCS1BxSjlnTFV4RVUvMDE0S2V0d3lTNVFnLzdI?=
 =?utf-8?B?V3A0K2lpbnB1Nm1ZSXJCVWJ4Tno3OHpIM1FhSGcyMVNuVUl3K0kxdG5RS1hr?=
 =?utf-8?Q?Bio1HT/n6Afh8jA2Eit+EosMh?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1c758f-6466-4c69-ead4-08dd21762afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2024 04:15:56.7129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVwIJMKHeH+xk4ZOO7TGOTHBDdZuiupftJbXRxaAJgSKOVHJolsaNCyXJ1318jQWNbvYCUzFzbrWW6ujBQ1BEdmo6w9OGlNisXNR6LYiI/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_201550_270798_DF2418F0 
X-CRM114-Status: GOOD (  22.92  )
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

> On 19.12.24 17:42, E Shattow wrote: 
> On 12/17/24 10:33, Conor Dooley wrote:
> > On Mon, Dec 16, 2024 at 07:25:59PM -0800, E Shattow wrote:
> >> Hi, Hal
> >>
> >> On 12/16/24 18:02, Hal Feng wrote:
> >>>> On 17.12.24 04:13, Conor Dooley wrote:
> >>>> On Mon, 09 Dec 2024 20:06:46 -0800, E Shattow wrote:
> >>>>> Use named definition for mmc1 card detect GPIO instead of numeric
> literal.
> >>>>>
> >>>>>
> >>>>
> >>>> Applied to riscv-dt-for-next, thanks!
> >>>>
> >>>> [1/1] riscv: dts: starfive: jh7110-common: Use named definition for
> >>>> mmc1 card detect
> >>>>         https://git.kernel.org/conor/c/c96f15d79172
> >>>
> >>> No, here "41" means the GPIO number, but GPI_SYS_SDIO1_CD means
> the
> >>> multiplexed function and should be used by pinctrl pinmux not gpio
> subsystem.
> >>> Although GPI-SYS_SDIO1_CD is numerically the same as 41.
> >>>
> >>> Best regards,
> >>> Hal
> >>
> >> You're right, Hal. I'm confused trying to make sense of this.
> >>
> >>  From dts/upstream/src/riscv/starfive/jh7110-pinfunc.h:
> >>
> >> "gpio nr:  gpio number, 0 - 63"

This place needs to be updated.

For sysgpio: 
gpio nr:  gpio number, 0 - 63 when using GPIOMUX(n, ...),
                6 - 63 or 82 when using PINMUX(n, 1 or 2),  64 - 74 or 89 - 94 when using PINMUX(n, 0)

For aongpio: 
gpio nr:  gpio number, 0 - 3 when using GPIOMUX(n, ...),
                0 - 5 when using PINMUX(n, 0)

> >>
> >> And yet in dts/upstream/src/riscv/starfive/jh7110-common.dtsi there's:
> >>
> >>>                         pinmux = <PINMUX(64, 0)>,
> >>>                                  <PINMUX(65, 0)>,
> >>>                                  <PINMUX(66, 0)>,
> >>>                                  <PINMUX(67, 0)>,
> >>>                                  <PINMUX(68, 0)>,
> >>>                                  <PINMUX(69, 0)>,
> >>>                                  <PINMUX(70, 0)>,
> >>>                                  <PINMUX(71, 0)>,
> >>>                                  <PINMUX(72, 0)>,
> >>>                                  <PINMUX(73, 0)>;
> >>
> >>
> >> Loosely on the subject of MMC interface and GPIO numbering, what is
> >> the above code doing? These are not GPIO numbers 0-63 so what is this?
> >>
> >> I'm trying to understand this so I can write the Mars CM (-Lite) dts.
> >>
> >
> >
> >> Conor, and Hal: sorry for the mistake there.
> >
> > No worries, I've dropped the patch.
> 
> Okay. I was able to find pad definitions in the vendor Linux source:
> https://github.com/starfive-
> tech/linux/blob/5dfc879916d946dcc2521ef1eccd1d8bfb06a75e/include/dt-
> bindings/pinctrl/starfive%2Cjh7110-pinfunc.h
> 
> There are definitions for GPIO indexes beyond 0-63:
> 
>  > #define   PAD_SD0_CLK     64
>  > #define   PAD_SD0_CMD     65
>  > #define   PAD_SD0_DATA0   66
>  > #define   PAD_SD0_DATA1   67
>  > #define   PAD_SD0_DATA2   68
>  > #define   PAD_SD0_DATA3   69
>  > #define   PAD_SD0_DATA4   70
>  > #define   PAD_SD0_DATA5   71
>  > #define   PAD_SD0_DATA6   72
>  > #define   PAD_SD0_DATA7   73
>  > #define   PAD_SD0_STRB    74
>  > #define   PAD_GMAC1_MDC   75
>  > #define   PAD_GMAC1_MDIO  76
>  > #define   PAD_GMAC1_RXD0  77
>  > #define   PAD_GMAC1_RXD1  78
>  > #define   PAD_GMAC1_RXD2  79
>  > #define   PAD_GMAC1_RXD3  80
>  > #define   PAD_GMAC1_RXDV  81
>  > #define   PAD_GMAC1_RXC   82
>  > #define   PAD_GMAC1_TXD0  83
>  > #define   PAD_GMAC1_TXD1  84
>  > #define   PAD_GMAC1_TXD2  85
>  > #define   PAD_GMAC1_TXD3  86
>  > #define   PAD_GMAC1_TXEN  87
>  > #define   PAD_GMAC1_TXC   88
>  > #define   PAD_QSPI_SCLK   89
>  > #define   PAD_QSPI_CSn0   90
>  > #define   PAD_QSPI_DATA0  91
>  > #define   PAD_QSPI_DATA1  92
>  > #define   PAD_QSPI_DATA2  93
>  > #define   PAD_QSPI_DATA3  94

Yes, these pins with indexes beyond 0-63 are actually existed and
they are set to unchangeable fixed functions.

> 
> Where I got lost is that these are in mainline with include/dt-
> bindings/pinctrl/starfive,jh7110-pinctrl.h
> 
> I did not find these pad definitions above index 63 mentioned in the
> JH7110 Technical Reference Manual.
> 
> Is it worth sending a patch to use those definitions in jh7110-common.dtsi?

Yeah, actually it will be more readable to use the definitions to replace pin 64~94.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
