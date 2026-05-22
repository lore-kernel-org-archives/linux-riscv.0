Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F04CD4F5B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 06:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEkzJQtiqcJ1pjOYCQYVpnfbH2hyx4XkoK+cLepVIqw=; b=q0tguldEYRBk3C
	wdUI9za/yPEvxY32MlMrPTQwR/E4nbjPga/ZxR5RASlLS9OHqWOxTR3WvnCiAeQMGdEco8hkSLorV
	KaigFo/CvNurmN6V5bp1JPi7cj9QCaqxMl85OeJwl/hrZ9o6UmicytTiAMOLrSv5COxJUHxpZBTRG
	DZtO9AFeUZqpw56HD/CBq+p0/gEULznVoWFcKcISvaD3Sg+NNWu6nNun1KKLLwNRR06VU4hGnRvjr
	dU6weZpu8rsriFY+tIFXiOIi1xwPzRnxQObshW0hnLDCsxcw6xmHkJOQUAwRgq+nB2EDIfNfLr/O2
	fnEJyRORn7eC+QQBoblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJQF-00000009ykg-3h4Z;
	Fri, 22 May 2026 06:31:51 +0000
Received: from mail-sh0chn02on20709.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::709] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJQB-00000009yis-31aa
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 06:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3Zt7LEYfhpkikQa349/kHggubdPxwpX2oq1IsThW4qHT9AnJbhZkaWS+S1eumiSriiOdCLHpi4Yuu7GI3/vnP2fCBZQqVP1OJ5GllzMOo2SI6RIFwHACTJ2Kq5NW6J7sMkf9WfGAq9yG1f2lBnp/XXR/VEh02hZHzlNbRgM5IW8jmlczqmy2ISLwKMFCWvxNssEukZT7wKTe7CVNG4qMp6KyDpEXDD0Swr7FHUWiUzjLT9YyzxySAtU/DmP9F4fQyxlnrSrQgzoEYiw+jzfHCqPtH7z8Q1nrpflMD3W9ewZ4Zr/1c3zZVMG1VyRhGhkZT51n9wuBckQVUiUn+Q/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l3O6NYy5ZNayIgBc2X9wZa0bRo2S3WrfYc994/DdP0=;
 b=Hqv+whv1vfrxTBKNyA0LznUjKYtQHks/l/cAbcJNNrgzCK0a5lcPDIK10yqFlQkDfWfKv7bUhmop1A6fNpNohv+YZhr+4aAVOMhgfGOVMbC6HucRaGsGqhRWtDL+2euEsIWCFrI+nQIxo10NfOQg+b4uPl9dQxNdKY9Pb66SNgpeVzoAS22n2DJO1A8a1seNSbKVRgmMVbR+yPNrEUKLGNiMCZ0mrs6uBNDC0BF3ZA/POvgEN1SV94xjpOj7DQLlDiDRpHR4/COzItJKOQUKUw1p6KLFUWiKyUcYYj9IKDWIrAuCs/IHOlicBhmDmup5/s80vyg9OMfgDPxDViKQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1273.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 06:31:27 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%4])
 with mapi id 15.21.0048.016; Fri, 22 May 2026 06:31:27 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <ukleinek@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Changhuang
 Liang <changhuang.liang@starfivetech.com>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v18 1/3] dt-bindings: pwm: opencores: Drop starfive
 compatibles and update maintainers
Thread-Topic: [PATCH v18 1/3] dt-bindings: pwm: opencores: Drop starfive
 compatibles and update maintainers
Thread-Index: AQHc5C5S9fqR/+n1kECZdRj+yravLbYPDuOAgAqR+tA=
Date: Fri, 22 May 2026 06:31:26 +0000
Message-ID: <ZQ2PR01MB1307DA0D079BD2912D31F658E60F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260515054723.25024-1-hal.feng@starfivetech.com>
 <20260515054723.25024-2-hal.feng@starfivetech.com>
 <20260515-blinked-gigabyte-d2882372b616@spud>
In-Reply-To: <20260515-blinked-gigabyte-d2882372b616@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1273:EE_
x-ms-office365-filtering-correlation-id: b978336d-87ae-4db6-6e7f-08deb7cbc096
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|56012099003|22082099003|3023799007|4143699003;
x-microsoft-antispam-message-info: WoHgJyI79tyDbokk9w95t4vYxO3JqZqnt2qkTyOask65TUlb8ccOr4CwqY1Wfwv6poKl3KNHslIWLtrS9sFmXJNV8bI21E1CKdK//0XcsMljW8wyWwCNUkpj7SsoGdjNexi28JVkVXSctX1IzblknXbPJrt1U1ldNqPgcELS1WdpfRPm+fFi8onpFeT38B4iV731//wHJcFsGYhSCwsA6+b/D5BOgc3Ty9nQLzb9RGr+gSOBjtU+jJsHjU/kb+Iaxq3Awz23Znz0daJehTwH93rvng2J/DaMpKAovCPtA8Eeob3Ur+AjqctHArp7/OA28Iuthqq/5xRulYLQGwLFv9b07oCFdabiD+MRZxYe5KRNebdLYTDoKCdJyMVBvxMI5JrCBY+RF0fktbtHrt0m9MDcXqbDsaDZG1RMwJOp2Dph8snDd4euAT7JZOxooFI3c/ijmGB6jWEzteF8jjVWd63I0q6XSWSLXWjjNQNPj22WprreXCs4Q6LE752QNCnxHytnAcvCFR4fjUzJux/3g1lmlITGrZGJ9PhEW07xeRe6u9r53GtPNZM/VwgcEY3X
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(56012099003)(22082099003)(3023799007)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1p5a3VwTWgvbzV2MkdxaUdXTlRvY1EwVHBXOVZaVjlUNEdOMXREcGV4WUxJ?=
 =?utf-8?B?ejFXRXR2RGZnNUFuSVdCWmZLRnp6TkE2aHJ6Y3RmcFF2VTlnNU5nbzJmcUhk?=
 =?utf-8?B?SkVaZTdHSE9nMmhHT0NrVjArb1FVaUtXaGJGRHI4Vy9WenMwTFNJbXZraGhS?=
 =?utf-8?B?MVM0M3M3cmowa1hWd0s4c3JINlNTdytBdzdVUnVmc3ZCN3I0N2FPOENIc2Rv?=
 =?utf-8?B?TmV0OWJ2NnFtVWJBcHA2ZGdacHJZNHptSGJxNkNpYkdSL0NCWnVJSS9pcUsr?=
 =?utf-8?B?dWZ5M25aeUtIdDV1Si9ncmtVNEtHcVZybU9EOGlRaVkvOE44cFN1YlN6eDRt?=
 =?utf-8?B?dWFTaXMrTFl5RmlZWFFicjJzSUtQS3kwR3hoM0t5ekQ5U2tBUWl1dHVBRENJ?=
 =?utf-8?B?VjNlRVM3aERISXM5b2RxYmxKRmhaYTloRHJab1N0ZWxQYUFTcEI4aXgvcFRa?=
 =?utf-8?B?cUtjTDlTc3A0MThMUlRvbzJsUjluR1lGaW9tRU1FbWhyekRLazVldzhpcVkv?=
 =?utf-8?B?OXZMVS8xVUIzYStNaFFaM21lbEFlbUJhcTNWcDdpK0hlbWlkODYyYnVJZDlX?=
 =?utf-8?B?L2hObVdjdUk2bTl5T3lnTHdaSFZ0L0hBdGpuR25ZL1ZRSlZjaHJEU2RIdEY3?=
 =?utf-8?B?bzJ5WmFwcnVUTUdZelQxTER3Q05WY3Y2NlhwaVdCVnpzUVFzNEEwcGxsT1Bx?=
 =?utf-8?B?dW05SGorK2xDcWw4aGNwamcrY1pxczJPeUpBR1gzL3RFVzhXeVA5MVM2dm5R?=
 =?utf-8?B?YnpFZnMzRWk0NWNNbWpxOG9iNXVPSTBia1lKOFpmV0NHYTBSRm5manBGMTM3?=
 =?utf-8?B?UERlSzRPTjdRTkZ2SUtMVGg2ZFZaNDduNFppbWZwVldOR2lsVnZnUDcrQno3?=
 =?utf-8?B?clJ2bFpDSjVjWVhhNDBvYktPZ2J4QlpFZUVNQ2ZqWU5oa1FWNEdLVjBML0hD?=
 =?utf-8?B?YmN3MmVWWnFES2FEeTBtWGVILy9SakErTGlxRmhPQWw4anQzVjRGSDlMdTda?=
 =?utf-8?B?alBWZ053dmdRZXZSYnhtSjhHd2NGYnNhbFhkbDZncnB5RWFFMXRXZytzRzIv?=
 =?utf-8?B?ai92TW4yQktidXFHK2VyeFdtekJmWkhRRnNvZVhkREZTZ0daMXl0UDV4dnl1?=
 =?utf-8?B?WVBPaURIb1E4eUhXSGtUTGVDRlQ0K2Y5aXYwckVITzR0cGc5WWlTOGNtLzAy?=
 =?utf-8?B?T0xXMTl5bDE0WW9CZkxKWFk0SHVYV2RES0VSTUJaL0dqL2U5UW5vN1VxZTlJ?=
 =?utf-8?B?MDJlVjhIdUVvSEZqT3V5Z1ZBU2xOU3dXREJHZHRFTGQ3WVc4NTJwZURQWUox?=
 =?utf-8?B?Y1B6cjcvNmdmTFl1TVRnYTZzNUx0YU5hbDdDMVA0UjdqcWNIcENscVlqY2tl?=
 =?utf-8?B?Q1doUmxyMHU1K0d0SWNkbmhUN1hIZ240eEY2MURuWHpsN3E0K3VJRWxOVGgy?=
 =?utf-8?B?a1NORy81MWk0M0hORTRjU0pZSVUrbmxySnN0aTYzNTBrOWJPV3A3cng2Sk92?=
 =?utf-8?B?WEE3WFBNcUZjaHpyUDBoYjlIakllbk1qV3NRQmtBVHcwUldndldrNytaN3Az?=
 =?utf-8?B?NGQ3c0crZG5qUUZjU3VkY0FGSXRFVjlZTjVCNTJlOFhnei9ibXk0NlRpUUdv?=
 =?utf-8?B?Z2hFdGVabWZTdlI4YXhBZW5BWjBnUWQ2R2llY3cwR2hsZ2FZMnRubDVwRXBL?=
 =?utf-8?B?NVUzQ2szQVZzYmp6OTg3eW41bzZEdHNjR0thR2g4bGMzVk9icGNXRytDSDU3?=
 =?utf-8?B?RmlEd2kvaEtJOXlxQ1BuQkNYcWdFaEFhWXZFSFVpam1HTG9hTDJJMW1NZERp?=
 =?utf-8?B?czlPc05LeXJiRlBOS2JyVlJCSmlyUENxSVNYTHU4bjVrdlFDVm5scmxESHF3?=
 =?utf-8?B?aE1NNE5KbmR5R1ZCMm91dDRqUmxaWUxwUzZHeGZTT3BKdkU4TDEwRnc0Z1hx?=
 =?utf-8?B?eklwNEFMSjNQQVRKT1JhRG56eXc1d0xGRkp5bXlLam90MXBNQ1BzbVBDZFBx?=
 =?utf-8?B?eHVpRUhqYUtJcnRYM3NBWkNHczFZOElpUElqcVBFM2xMZGZFd0xZTmsrMjFW?=
 =?utf-8?B?amVnL3FQNFpFUnBPT2RXQkhsVEp3K1d4YTVnUEtEU0ptNGh6RFBhNWtYbmkr?=
 =?utf-8?B?R3hHWE94dVd2bzZWcTBDNS9kWTk4eGx5K2VIUzV2cnVxdG1ITisvZEVocitm?=
 =?utf-8?B?RlBMVGo1eExFL3RqbEJBb3VpVGxvb2lpWll6dU9wNGdHeXVnWlNtclZwSHBv?=
 =?utf-8?B?d1dIZU1yOFdSTnY5WHMvM3Z5Sml4UGhKWGc4S05oSlcyN2FQaGNwanVXNVkr?=
 =?utf-8?B?RWI0TERLRWJiLytMelhHRGszQWsyMy9lajdkUUhCTEZBalpRcU5uZz09?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: b978336d-87ae-4db6-6e7f-08deb7cbc096
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 06:31:27.0158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URPhdUC1ehZuoVUfn1sYDOdgNm4TnA6oG2+GwJghIyya9GoVRrqHC4GD06JVEwKZdthpaJRgbIZ+5hR3PttjvAet1KLox5IvHi5DHkih+lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1273
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_233147_761807_4BED9D86 
X-CRM114-Status: GOOD (  18.21  )
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

> On 25.05.15 21:06, Conor Dooley wrote:
> On Fri, May 15, 2026 at 01:47:20PM +0800, Hal Feng wrote:
> > Each of the StarFive JH7100/JH7110/JH8100 SoCs has 8 OpenCores PTC IP
> > cores. One OpenCores PTC IP core can output one PWM channel. The only
> > difference among them is the register base address. There is no need
> > to add starfive compatibles to distinguish them.
> 
> NAK, that's not an acceptable reason to remove soc-specific compatibles.

Got it, because it will break Device Tree ABI.

Best regards,
Hal

> 
> pw-bot: changes-requested
> 
> >
> > I will maintain the pwm module in place of William.
> >
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../devicetree/bindings/pwm/opencores,pwm.yaml         | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> > b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> > index 52a59d245cdb..834fb17ec595 100644
> > --- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> > +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> > @@ -7,7 +7,7 @@ $schema:
> http://devicetree.org/meta-schemas/core.yaml#
> >  title: OpenCores PWM controller
> >
> >  maintainers:
> > -  - William Qiu <william.qiu@starfivetech.com>
> > +  - Hal Feng <hal.feng@starfivetech.com>
> >
> >  description:
> >    The OpenCores PTC ip core contains a PWM controller. When operating
> > in PWM @@ -20,10 +20,6 @@ allOf:
> >  properties:
> >    compatible:
> >      items:
> > -      - enum:
> > -          - starfive,jh7100-pwm
> > -          - starfive,jh7110-pwm
> > -          - starfive,jh8100-pwm
> >        - const: opencores,pwm-v1
> >
> >    reg:
> > @@ -48,8 +44,8 @@ additionalProperties: false
> >  examples:
> >    - |
> >      pwm@12490000 {
> > -        compatible = "starfive,jh7110-pwm", "opencores,pwm-v1";
> > -        reg = <0x12490000 0x10000>;
> > +        compatible = "opencores,pwm-v1";
> > +        reg = <0x12490000 0x10>;
> >          clocks = <&clkgen 181>;
> >          resets = <&rstgen 109>;
> >          #pwm-cells = <3>;
> > --
> > 2.43.2
> >
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
