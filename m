Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F9ACD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlgfdtVj+EE4vl0JHuxMX5n5ziHLvWPCcXC+75UqmNQ=; b=pevJJGGyoBJc2E
	qoVEdvN/dkSQmEchuZ2rsKfJWs/2O4oCfn3aOG658T3TSaJrtokl+8EjFUzb0x75sJcdwzRHNiE8N
	+qDMPCAspLCmRReIe4NevcE3TcbIy7qix0s9pvmFuO8VJPy0Jp52VaZ6I8k0RUqmFGRJots4JKWvw
	0s3OS41ZE1n9VjTNlr5f0EC85v1n85hW78cF3LeA2JXxoCBWHhhoY8Mhw5A432GaiVUUtmWEDzpMW
	e63jOQrjwtvq63QNcYwQ8tdj3AHoFV44uJt36oUcFbO4f2OSPCrFWju8WQw3v90PvZ2U55GQ+JOfm
	ExpVm7c7jUjy77SGmzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruuM-0000000ESbL-32qr;
	Wed, 03 Apr 2024 07:19:42 +0000
Received: from mail-sh0chn02on2072b.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72b] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruuI-0000000ESaH-27D1
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 07:19:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJiG2KGZWbe9LUWo2Pye5jjPo9PlfTvEj4rWq9xOyUYQW0yYeNmtOwqP2HDRSm9yOoKBzqPTMjQu9cm4us6RiN7H+A3vfSDyr93YlGbMi554uOpGX0UAw8pd2SG8tpAw02JPmUUL/qKKfKfgVYf5jSnRPLIQ2xJfK8EUg6ze0b2nmTYGBc5EYvGUtcoqMK+jxj05t76ZDqGL1drindTVbsZKqX2XP0+kwYv+Tvebmrqb9+/iI0tGK1CCPldMpvgNAf0KnIN4YUANfo+uXIc8F15NR6Q9mmOjncyxLoDerJph/geDPzx62wNP23iKnQ2KuvvvKuXBgH4EY/cgomjbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5TWBHue3KQrc8B9IIWELf1S6Fn66DtmoMzYVjeCmGQ=;
 b=dGb/H9yjx4x8YpkKO1sb7zB9NevbvDQS4HJt76K8yMCie/a0yZaiO86RKE1jknPOjGk3x77uZhb1qUAad15ykG8HJxJ+aD/7ju4Jd6VxmZJsVD8cbDV72gkaA4ngaWNRyXoC15T1tjoqI9s6tyJMIKwI2zWv811omJ/grbBcxWXVSVGheALxZHs2Tipaues2IL44YML+vKWuAsW6UUfiXKvnnUZvrcPBORloCoTjhtj39oGewWzkm0S7SNhy+vXUHfxbHvikEKLZ6NY/MGk+3HcJr4TVcnI3k6M4TObUVoidQunF3zes1ywpV7nDep6yg+eNb+Is+lvX74VgBiKiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0987.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 07:19:27 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::9a50:2c82:c5d4:2b3d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::9a50:2c82:c5d4:2b3d%4])
 with mapi id 15.20.7409.028; Wed, 3 Apr 2024 07:19:27 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Conor Dooley
	<conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
Thread-Topic: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
Thread-Index: AQHahN18qtXBKBZlXUquUnYUH2QsmrFVKPiAgACsqfA=
Date: Wed, 3 Apr 2024 07:19:27 +0000
Message-ID: <NTZPR01MB095662C4A6FCAEB7B35C48FF9F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240402090920.11627-1-xingyu.wu@starfivetech.com>
 <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
In-Reply-To: <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB0987:EE_
x-ms-office365-filtering-correlation-id: a7b516e9-8101-4184-648f-08dc53ae65e6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DmylQNxB3g6o4BxiKSIXl+s9rqmz/Op6phwrYg4t2doBxLaVO/+xW42sOT0voCksIoIJtj5IAacwVKyrVqQMNJ2zM7+wreflz080GRCkhfZ7W/ZjaiUEOtzpfPDncEkB/lBJA4vDdV7yR4BmK884OtYoA8Hk5PjRM3c8Gd3Dfv2oRekXyj7QIYio4suKowSX94twcOQQ39Tdhj7u6RWv037qBqWZweabiq7lBTbN4QO6B89JVALyT7KZxfI8+htG4OhvHwCUPhJIGkfyC3dV2ybYsRaJVZdD9X12z6SjDOv33Bd9wKRSlBWdI8yswWpmwWS++UX6iGMPI+PuediT2vx8zxCj+uJ9tOEAG2XlhcX3tNbZwnpjqy1UBjstWIa0VHgwX0DRQv8XIt2a58E119l4lmqc0p598OqDxtA4fSRTrp5+RLQMjtO5dB9/UDHVuubUe4kkebGu9giiUF7d5Pa3aWRmX/gvb5+sQ3pPlY7XqPDUHAqzqAO9JxDvRoMXl1kd3mePsW9ZcSdVKq7TcOE44pyxXTqx0rdzP+7O+vyzLcaobwIeRS+Gt0VVY923RMAtWoAPiIFlRLULNZ0pIAEaYOxjNrJ8M83gH59bHIMqVjWIc+woIWAUwPK1wnRD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(366007)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHRwdmNhNjNLQUZrMTExc3pGdldXNzVlQjhIQzM1MW5DRTRKREhFNjZjS0Z5?=
 =?utf-8?B?cFFoWEx0Z2EwOGtHRGNKekR3ZHoweld0SVk1K3NsQTBaTjlQRmdNYVZmUk5V?=
 =?utf-8?B?QmVGaWU5RUVBb01PS2k1V3VYV1B5SXFCeVdUbU9HK1pkMTQvUEF0aWZucDBj?=
 =?utf-8?B?NzZLMkI0b0g0S21ySFowaHM4UnlYem5hNE1YdkkzVHl1NlYxaDRqemRXc2RN?=
 =?utf-8?B?WXQwblNtT2l4Y2JVSTh6QmVIMm5nQ3lZNHJnR2xkbGZaR1Zpdk1ObHNyNEhE?=
 =?utf-8?B?MmtpUnlQTXFWbkd2NVJMeUpnRjIrWWx1Z3JEVUJnRmVKc2lIZG1pMk03K1Fq?=
 =?utf-8?B?TlNvY0xDV3BZdm5lTmR2Nmd4SEh4aEhFZjNYSjJSWFZVVnA4eGxBV0RLc1lU?=
 =?utf-8?B?Z1NXRlRwOENaUWRqa1lDM0lUZWF1OGdXcTUvZ2d2T01URnIrbTJKK2g4WUJm?=
 =?utf-8?B?OGVlSGpFKzFSNUJRVlM0RmdZL3paVUNVVlRINDgxYjVjeHVITGlKeUc0WWpo?=
 =?utf-8?B?bHVvbDZCSHVuNFZKNzlmQTB3Tmg5a1JOYkJBeVN0Ulhxcjd4eDdFTzRNVGo3?=
 =?utf-8?B?MHZPZVd2RVMwS0xXaWlCZGhiRVB1WUt3RlFKcytvc2FRN0hHb2RHZkZtSjRI?=
 =?utf-8?B?bnMxL3FZd0YwN3B0cmFIdktWcWNqRUNSWlJKYWhPdThnOUdWR3dhMXFncDBl?=
 =?utf-8?B?TkpxWFdNY2FMU3owTkR0YUJsYnBNc2ptNnJwLzlVN01MRlorUzkvbG5hNzMz?=
 =?utf-8?B?aFBpVmt4RmtzK2dYSnlCL0tHNEhyeXl4Mit3dDFibytXYzZ6Yk5IcnlYYnZC?=
 =?utf-8?B?WWtCM3lEWWlZeTFoZjVFU1ovUU9GdUM4U3A5TkdHbUNCdXRSaDE4SHNoU05P?=
 =?utf-8?B?THF2S0J6UnNkT0h0N0g0TTdLK0JGN3lBejB3R1E2bFJxMGJBTGxrN2dWWjBV?=
 =?utf-8?B?bG10ZUFUYklmQlBNYjdGMkhEK1EyOEczWTJXRnNqSjc2NXB4NXh5SnNRTnpz?=
 =?utf-8?B?TkdQclNhcmRaaFBsbk4yWUtoam1tbjBxUjAyaVYrMVRxWmxuZmZTeHdrRStX?=
 =?utf-8?B?b3d1SmJLTnZjb0g5VVpldExMb2dYb3g4ZEVCK2ptVlN5ZXJXd1hFQlFIMlA5?=
 =?utf-8?B?RHhQY2ZRTTh0cWNtZlN6MkZ4M3phV3p1aG91bWs3N0ZtcmZtUlNuMVVvRlJF?=
 =?utf-8?B?cForMXhaWjJkVGJreHFuZm5PM0RvR0ZEcGppS2c3QXUwQWhXMWU2Nkd5M0Nm?=
 =?utf-8?B?NmV0cHExd2ZHN0FBUG1vUHBxTmwwdkJUY3F3eHV1cTZZZHlHZnJoTXFBRnpl?=
 =?utf-8?B?UndIOW9xcW9BKy9aWVFGaktsQ0s3dWtUNVUwWUN2YVVSSitXdytHRFVZT1Bm?=
 =?utf-8?B?UXhVWEpjeXJjWVo3aEZKZEJMTk1wQ3BNdnBKUHhTYkJENmt4TmVPampWWGtN?=
 =?utf-8?B?ekd1TTV1VTVQd0YxelZ3aEFKMUFMbnRHUGJGRUpBcnFFeVNVK2JCSWxyTXh5?=
 =?utf-8?B?ZndNS1Naall3ODNERkdXbFhwWkZCbVZ6VmJlZlh6d25VS3VadGIwRkkxOFc3?=
 =?utf-8?B?K0lPamFhWmVmd1QybUxKY1JyUHovV21BYnprTC9FRWNjNnlHeGxVTXFxOHJ0?=
 =?utf-8?B?Q3J3WiszbHRFbEV4dWZFSkpsUlF5VW9ybFROanRZZmdPTjhYazhsYWFvcERT?=
 =?utf-8?B?QXRENU9sb3NINi80amFzVWR3cHlxTEJ0SUt3U3dTNWk2c3RST3ZpQ2ZhSVdU?=
 =?utf-8?B?RVR3VElwNUh0QjBaM0VQOHhKWkx0RVFVNTRGNGkxQUhXQTNVV3JPWUV2a2Fl?=
 =?utf-8?B?eDFVNUJ4MEhjQkoyYmhCeXhCRjF0ZXNjZ1FONi93UWpNaHNnSjNsazlvbVJL?=
 =?utf-8?B?VkFPTnh5UllhZ0hlWmxRd2RTSzBKd3NGM3lTdXdFczErYTNHbEdhWG4wZEZp?=
 =?utf-8?B?WWRYSzNVM2UreVVBQzNEN0R4K0V4UERHRkEwaHhPbXVLV2pxUmVVKzFNMXhY?=
 =?utf-8?B?WXNuZXdrc3Z1TkE0bUFHdTRxMThMejdSVWMyc2xRek5pYWFZUlFWYitJbkdT?=
 =?utf-8?B?TUJaTGFlaWVuenpTMkVLM1hRaytpdTZ6VWlKb0lqVXpUZE0wbXhZN1NQVDZy?=
 =?utf-8?Q?rAqa3ZSDkCi4AIp5IG7CXuBHO?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b516e9-8101-4184-648f-08dc53ae65e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 07:19:27.8759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Otnlr7Nd7bKDnVkOLWwRrag3JfDDOTnD26qSMGRb19VDY+BpsVA8hzLQp/ihynhtNfFEE+cXdAcEbS2tjXNRDlqPPANTBzKu6XPaMYyB9Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_001938_576539_86412415 
X-CRM114-Status: GOOD (  29.16  )
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

On 03/04/2024 0:18, Krzysztof Kozlowski wrote:
> 
> On 02/04/2024 11:09, Xingyu Wu wrote:
> > CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> > But now PLL0 rate is 1GHz and the cpu frequency loads become
> > 333/500/500/1000MHz in fact.
> >
> > So PLL0 rate should be default set to 1.5GHz. But setting the
> > PLL0 rate need certain steps:
> >
> > 1. Change the parent of cpu_root clock to OSC clock.
> > 2. Change the divider of cpu_core if PLL0 rate is higher than
> >    1.25GHz before CPUfreq boot.
> > 3. Change the parent of cpu_root clock back to PLL0 clock.
> >
> > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110
> > SoC")
> > Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> > ---
> >
> > Hi Stephen and Emil,
> >
> > This patch fixes the issue about lower rate of CPUfreq[1] by setting
> > PLL0 rate to 1.5GHz.
> >
> > In order not to affect the cpu operation, setting the PLL0 rate need
> > certain steps. The cpu_root's parent clock should be changed first.
> > And the divider of the cpu_core clock should be set to 2 so they won't
> > crash when setting 1.5GHz without voltage regulation. Due to PLL
> > driver boot earlier than SYSCRG driver, cpu_core and cpu_root clocks
> > are using by ioremap().
> >
> > [1]: https://github.com/starfive-tech/VisionFive2/issues/55
> >
> > Previous patch link:
> > v2:
> > https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfive
> > tech.com/
> > v1:
> > https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@starfive
> > tech.com/
> >
> > Thanks,
> > Xingyu Wu
> > ---
> >  .../jh7110-starfive-visionfive-2.dtsi         |   5 +
> >  .../clk/starfive/clk-starfive-jh7110-pll.c    | 102 ++++++++++++++++++
> 
> Please do not mix DTS and driver code. That's not really portable. DTS is being
> exported and used in other projects.

OK, I will submit that in two patches.

> 
> ...
> 
> >
> > @@ -458,6 +535,8 @@ static int jh7110_pll_probe(struct platform_device
> *pdev)
> >  	struct jh7110_pll_priv *priv;
> >  	unsigned int idx;
> >  	int ret;
> > +	struct device_node *np;
> > +	struct resource res;
> >
> >  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >  	if (!priv)
> > @@ -489,6 +568,29 @@ static int jh7110_pll_probe(struct platform_device
> *pdev)
> >  			return ret;
> >  	}
> >
> > +	priv->is_first_set = true;
> > +	np = of_find_compatible_node(NULL, NULL, "starfive,jh7110-syscrg");
> 
> Your drivers should not do it. It's fragile, hides true link/dependency.
> Please use phandles.
> 
> 
> > +	if (!np) {
> > +		ret = PTR_ERR(np);
> > +		dev_err(priv->dev, "failed to get syscrg node\n");
> > +		goto np_put;
> > +	}
> > +
> > +	ret = of_address_to_resource(np, 0, &res);
> > +	if (ret) {
> > +		dev_err(priv->dev, "failed to get syscrg resource\n");
> > +		goto np_put;
> > +	}
> > +
> > +	priv->syscrg_base = ioremap(res.start, resource_size(&res));
> > +	if (!priv->syscrg_base)
> > +		ret = -ENOMEM;
> 
> Why are you mapping other device's IO? How are you going to ensure synced
> access to registers?

Because setting PLL0 rate need specific steps and use the clocks of SYSCRG.
But SYSCRG driver also need PLL clock to be clock source when adding clock
providers. I tried to add SYSCRG clocks in 'clocks' property in DT and use
clk_get() to get the clocks. But it could not run and crash. So I use ioremap()
instead.

Best regards,
Xingyu Wu
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
