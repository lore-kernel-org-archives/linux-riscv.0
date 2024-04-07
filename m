Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719D0CD11C2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 13:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oj0nNYnF7Vnp4pHHRqlmrQWA1AC0xbDmskJDyqPlQIE=; b=0ZEAF3t7g0bgii
	qjUtwFn9Q4uhdDJkOGl/FXBtw1+LokKIr5Iw9aldB+zy/D4luHqgbViVYZEO/qorNNIoAG58oCL/H
	zuF9xSxXwUTNBySdCvg+JK5UO2h24eC0OqguI6fUUvOu74x3r1d3HLFc3q7ZBTmqbdl14VLl4U+5N
	PPLf3XHHZjFA5nmZzft7d03gZ7Q1i/jRb4yMDQB/aLvsYLCxsUjylMK2VyptLOndCh2yMUnpGyOc0
	+MNNshvwv4Ay6uaJ1ntpvKRB4Bc9bRTIXXdRNLX79v+disQUrfTBgrCTrDBAA+izHBCYPbMVThCXE
	aqgee7rrJhfiBG1oiZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtSMC-0000000Cd1D-0BXo;
	Sun, 07 Apr 2024 13:14:48 +0000
Received: from mail-bjschn02on2071c.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71c] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtSM3-0000000CcxP-0LFE
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 13:14:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypg+LvC5639Lz1KIt8F5hLboES06wjnF25CVmBnwY1KW2HtSD3nDqnoNN81ZmOdp1rOvho4Di73ltUjKX/H5AWoiniliY2mrH6nA8XTo3TVy8cxPOHURscftGD2lr35HIWICO8DQygQnOKoXJ2t5KTXYm16mkgl0uDGilQyt64pRJky89yOvyN5a4vYJOWCSpRCGd3Oi15iaW1abJSqAITDZajtQQEgQsLkRIwWeVLMP8AoNmU4au1FRn/hO/r0/bVD7n7xegyJic93KP0XC1LtOawIDQtpkR2OIOvfpaGSg+mdG1kZtCD9vJdYEIW77dk+P3YLu+LXCMzckhhnvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HOhyEyXjFJ5wY4pYwcOa2cnTWpX5SvWMGb7dRFsZfo=;
 b=Tgb8RgFHmQ52hadbNpS+Pval8xcQrIwETg2mS35/uNmaqv6nFBIrn9vP3OP1+Eb3dsdK+c7w5ic/se7NqT824Kk5bLNxBpNFA7WyNFTmMYHrTI8XxaYg01Ml9kUHNUZBAVQjdYsqh8BJx09eb6UNS/LSNRYYDkvACGYIX3mI3hH9qR+9acF3562mCJoWvZ5IJ2gIang10hLrRRod7JLmSewp3QoYa1vQFz4nBcGyb4ymDP0S16WIjcD82Qb2SSt6cT/nNZTkY+BpMjVRI01x6fNXH8ova696NEtrW21bROB0dlwujycsrFJG6sEAsD+WpLpNehRQ1nJWfk7XtUGkfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0953.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sun, 7 Apr
 2024 13:14:22 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::6174:711d:d93:87c9]) by NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::6174:711d:d93:87c9%4]) with mapi id 15.20.7409.053; Sun, 7 Apr 2024
 13:14:22 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Conor
 Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
Thread-Topic: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
Thread-Index: AQHahN18qtXBKBZlXUquUnYUH2QsmrFVKPiAgACsqfCAAFBPgIAAA5cAgAJ6jgCABCt3UA==
Date: Sun, 7 Apr 2024 13:14:22 +0000
Message-ID: <NTZPR01MB09568C037BFC15CE7EF0E9A49F01A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240402090920.11627-1-xingyu.wu@starfivetech.com>
 <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
 <NTZPR01MB095662C4A6FCAEB7B35C48FF9F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <bcf12c0b-d569-4d64-adfb-bad053c182a8@kernel.org>
 <NTZPR01MB09566AB865A0266332268DC69F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <74d6213f-51de-4d48-a7fb-844d6bb57fa7@sifive.com>
In-Reply-To: <74d6213f-51de-4d48-a7fb-844d6bb57fa7@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB0953:EE_
x-ms-office365-filtering-correlation-id: 32be69af-0085-47cd-448e-08dc5704a443
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WVNCSC1JbXJZoqfy5vP1ZO4MZS7OsjLAjOCUs/4LcENF1i4XrhbHpVOmrATty3WO6GHB4OpL/Pg39HhivzpAPHRNYfRAlqgxqAGGyoiJnxDgqHrHLEzMSXXmKd4wIuZBZQLx98f5EuTQrUZSQDPf+dlbr0zss3YqHLorjS3BZE5aFhqd3iortnxdWfp0inlDsOXYhCtkHPC5lc7Qj5o/gW9ou74eI3DI1AyZRPeLlrkQRWPe8vq78duF8A4ZQ7hIozhvs4/6bmNThZu/aURIrTd+PqPDrSbkq2zN02AWmBQGO5sBCKDzPb+3oSjrPB3HKjpi8MJu/rxCXqEl53g/fmfdBh++Q5z2Rem4/2vLiL07fLZuzYE73HUL0+ST8fYjKVmIn/M2WqfDO+eu453tr/VO9yeHUvrqawIzoRv6uzYhrk3wVjuhS2yEqHALaeCMMguR67pWUdsfM6kF6wGHLE17Kf9nz2GVu5U+cfEOAruwgyUPNIx8W8T8OqttJSg2jP9GFtHuCfHcEXZWsXJgLvNFw5mT2YqFQKP4EeMTN/mlS+q5oKESQPFQ+NtLgfZKWJzNNKRJSrok/ojE2Ki7VTsOtThdymL0PlwD1tcSMs1ES4nkbtl9r/WqOvzQ1S53
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366007)(41320700004)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1NxUGFscmVRUUw1Y0dwcHZOUDd4dnY5c2xqSXFFZkJyeUk0ejlxK3VvSFNS?=
 =?utf-8?B?SEpIUlBiV1RQdyswMDFnbXpTc2Y1M0Z6c3loMVBLblZEWHdDVmNLdk9SVGk2?=
 =?utf-8?B?Rk8zaFFVQnpUbXMxRks5VGpaYlFnK3MxZExzbUJQYTRpNGhmSUhtcFB6RVEv?=
 =?utf-8?B?cHNWcTF0WFA4dkxoTlZOWjlTN2RRM3A3VHp6ZFRuUDRVN0VXV3htS1JqaEJQ?=
 =?utf-8?B?VGZXc0pnZDB5czhkOFR4MUpFcGlyR3RwUmJobk1pYlFINEtYRmU2MlhVZ0lM?=
 =?utf-8?B?VzJwQkxRNWpCanB1Ykx6VWU0d0psbHcybTZDb2FZRU1hWmIxblI1ZUFBQXYx?=
 =?utf-8?B?c3BWWXU1bzNIeStNM1BPeDkvdUZtMUpkaTVnaWl5MlpDb1Bnbm5aNkNwZThX?=
 =?utf-8?B?VnNYZzNBaGRab2Z4b2J3dVpNOElrTWx4NC9lTTI5UWZIems5U2hNK2plY1Nn?=
 =?utf-8?B?endZdUdUSTdENGpGVWRJWkNVZzRpc3U3Qnozb0ZKMnNCRlRnWC9VT2lRemFS?=
 =?utf-8?B?OCtvVnZjOU9jQlVxbUZvSmlyNGdMaklXcEI5MDJTcFNoeDJmZmE3MFdjTG00?=
 =?utf-8?B?WHBjc05kSG1oZCtSSVAvV3FlSDJ4czluRmtwODZKTXpwWVFBN3NEY1BNQk5p?=
 =?utf-8?B?NWxCUWpaVXJXWkZ4dGdPZWkyZHdxeWxtcGNpakV1QzhmUUg2NklIZ0NrOTVG?=
 =?utf-8?B?cms3U29DdGNtZnUyeENyb2hScmJEVjhnVWVoYW5zTlBCR3BBY0JCVmVXVDE0?=
 =?utf-8?B?WG5yWWJ2WktwNmxvMGdWM3o1K1RxeHltR1FabUJtRGlWb1FiaWhJb1VXM3lV?=
 =?utf-8?B?MnhHZTZBbHZ3L2hMY1hjbDRJNEVCSlI0Wks5aUJvdnJ5WnJDbDlTa1lTQlY3?=
 =?utf-8?B?VG9QZFRXNDFweHBwQ2dSUjFSdzRLcmgzWmlkbEhYUXZVT09sQStTcTU5TDZT?=
 =?utf-8?B?azA3UnFaYnREZkN1bUVSMnVZOWphVDI1YS9kRUd2WUNzeXpSVWR3cjV2YVRa?=
 =?utf-8?B?VndtdGJYTTZseUFRQ1d0d2I1UUc3UnNENzJKVlZOYThkcExvRy8xdDNINFNN?=
 =?utf-8?B?b2h0MlFBUk9MSm85a3FoWXVGV2dnR1RBV1EyTWpzejlKWGFHb0pBVDV2MlBi?=
 =?utf-8?B?NDZBaGRQTnZDbmRseFRFQk1Ha3lTTmprSnoxbFk5UnRSOGVzR3VPN3R4UVYv?=
 =?utf-8?B?Y1Q5WWROdkhacW1XQXV0QlFxMXlod2FuYmMzandLam5jUWlTMlA5SnJic2ow?=
 =?utf-8?B?QXpiU2JUcTRjOGRIdm0yZDR0UUpadUo5UXhHRCtiMHQ3dzlPWUphYnA0dnV3?=
 =?utf-8?B?cHN2eWk0TUNZbDcxaW53OE1rNml2SUlsUlBaSlFJQ2J6ZVpwVitnb1BtZG9U?=
 =?utf-8?B?cEdlMXQvSE5oclFTT0JWa0w4b0UzcnFadDdiUjFjUVdsZ1ozd0JnWFU0anhr?=
 =?utf-8?B?ajFyckI4b1pTZ1FCSWx5VHFubmJ4aWpVRzcyZDVyN2J2UDRWOGdJa3Jid1V6?=
 =?utf-8?B?ZEl0ejkyVzQvNm1EdmpyMkIxU1A5aXNFUk1xVnVCNE1IcjRIUGlpblpiMjBJ?=
 =?utf-8?B?UGtYbDBCWVIrZFN1TTMxNU4wS1RPVTFxWndtcW4vV3lkNElyQ3RsT3RKaUxv?=
 =?utf-8?B?QlJtY1ZrOFBFOXpQMFJuMXQ2Z0V5bk1VYmdpZ1g2a3VaY3BEMTFCSVFRRFM4?=
 =?utf-8?B?V0ZQNEEyWUJvbFpoNjVzYktIamFrR0cwcGJTYktxbjREd3h3T2E2ZklINDVJ?=
 =?utf-8?B?dmsvUWdOVDJ2M3pkTUo2MWNsUldaQ05oSXJ1SHdtOFRaOHY2dmJnTlZQbURn?=
 =?utf-8?B?Ukw5aG5tTllHcmU3ZnJiUGVSV2dGKzBGRWQ2ZGR3YklMVmVIUjBVYUdWNzk1?=
 =?utf-8?B?QmpFWEVYM2JhNkN1Rkd2SGZaOGJyOTZGSzVvdUJnN1ZUb2JCYlZ5RGdtdVIv?=
 =?utf-8?B?SGY3eU9HSDZZcGs5ckNHSTEyZTlESGRWSnB2bGFWQTNnOVBKMU1haGx4Zk12?=
 =?utf-8?B?TTFyRTJ5WnVMRVBDcVE1OStDMVVLcG5NdzVVRVlJZUdYTHllYjZiNjNGYis0?=
 =?utf-8?B?V2kwUHpKNkNxaGtBNkhtOEVVRFcrTUpZeDBvK2RkYitEQ3k2dWIvT0p5aVJL?=
 =?utf-8?Q?f8ikLZW1dBnfC/Yklq7TxfKMB?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 32be69af-0085-47cd-448e-08dc5704a443
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2024 13:14:22.6724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9bQaoCm3sdaL0JT0EVvdK39+5isZuQUTib2aYLla7qf7oQEPDROHb9OPOSwsndexmJ3cwv58AZ4kLrN2hTLoNz4++1LoV0xriIcyYrhKunc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_061439_517209_583ED0E1 
X-CRM114-Status: GOOD (  35.25  )
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

On 2024-04-05 5:28 AM, Samuel Holland wrote:
> 
> Hi Xingyu,
> 
> On 2024-04-03 2:44 AM, Xingyu Wu wrote:
> > On 03/04/2024 15:24, Krzysztof Kozlowski wrote:
> >>
> >> On 03/04/2024 09:19, Xingyu Wu wrote:
> >>> On 03/04/2024 0:18, Krzysztof Kozlowski wrote:
> >>>>
> >>>> On 02/04/2024 11:09, Xingyu Wu wrote:
> >>>>> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> >>>>> But now PLL0 rate is 1GHz and the cpu frequency loads become
> >>>>> 333/500/500/1000MHz in fact.
> >>>>>
> >>>>> So PLL0 rate should be default set to 1.5GHz. But setting the
> >>>>> PLL0 rate need certain steps:
> >>>>>
> >>>>> 1. Change the parent of cpu_root clock to OSC clock.
> >>>>> 2. Change the divider of cpu_core if PLL0 rate is higher than
> >>>>>    1.25GHz before CPUfreq boot.
> >>>>> 3. Change the parent of cpu_root clock back to PLL0 clock.
> >>>>>
> >>>>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> >>>>> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for
> >>>>> JH7110
> >>>>> SoC")
> >>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >>>>> ---
> >>>>>
> >>>>> Hi Stephen and Emil,
> >>>>>
> >>>>> This patch fixes the issue about lower rate of CPUfreq[1] by
> >>>>> setting
> >>>>> PLL0 rate to 1.5GHz.
> >>>>>
> >>>>> In order not to affect the cpu operation, setting the PLL0 rate
> >>>>> need certain steps. The cpu_root's parent clock should be changed first.
> >>>>> And the divider of the cpu_core clock should be set to 2 so they
> >>>>> won't crash when setting 1.5GHz without voltage regulation. Due to
> >>>>> PLL driver boot earlier than SYSCRG driver, cpu_core and cpu_root
> >>>>> clocks are using by ioremap().
> >>>>>
> >>>>> [1]: https://github.com/starfive-tech/VisionFive2/issues/55
> >>>>>
> >>>>> Previous patch link:
> >>>>> v2:
> >>>>> https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@star
> >>>>> fi
> >>>>> ve
> >>>>> tech.com/
> >>>>> v1:
> >>>>> https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@star
> >>>>> fi
> >>>>> ve
> >>>>> tech.com/
> >>>>>
> >>>>> Thanks,
> >>>>> Xingyu Wu
> >>>>> ---
> >>>>>  .../jh7110-starfive-visionfive-2.dtsi         |   5 +
> >>>>>  .../clk/starfive/clk-starfive-jh7110-pll.c    | 102 ++++++++++++++++++
> >>>>
> >>>> Please do not mix DTS and driver code. That's not really portable.
> >>>> DTS is being exported and used in other projects.
> >>>
> >>> OK, I will submit that in two patches.
> >>>
> >>>>
> >>>> ...
> >>>>
> >>>>>
> >>>>> @@ -458,6 +535,8 @@ static int jh7110_pll_probe(struct
> >>>>> platform_device
> >>>> *pdev)
> >>>>>  	struct jh7110_pll_priv *priv;
> >>>>>  	unsigned int idx;
> >>>>>  	int ret;
> >>>>> +	struct device_node *np;
> >>>>> +	struct resource res;
> >>>>>
> >>>>>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >>>>>  	if (!priv)
> >>>>> @@ -489,6 +568,29 @@ static int jh7110_pll_probe(struct
> >>>>> platform_device
> >>>> *pdev)
> >>>>>  			return ret;
> >>>>>  	}
> >>>>>
> >>>>> +	priv->is_first_set = true;
> >>>>> +	np = of_find_compatible_node(NULL, NULL,
> >>>>> +"starfive,jh7110-syscrg");
> >>>>
> >>>> Your drivers should not do it. It's fragile, hides true link/dependency.
> >>>> Please use phandles.
> >>>>
> >>>>
> >>>>> +	if (!np) {
> >>>>> +		ret = PTR_ERR(np);
> >>>>> +		dev_err(priv->dev, "failed to get syscrg node\n");
> >>>>> +		goto np_put;
> >>>>> +	}
> >>>>> +
> >>>>> +	ret = of_address_to_resource(np, 0, &res);
> >>>>> +	if (ret) {
> >>>>> +		dev_err(priv->dev, "failed to get syscrg resource\n");
> >>>>> +		goto np_put;
> >>>>> +	}
> >>>>> +
> >>>>> +	priv->syscrg_base = ioremap(res.start, resource_size(&res));
> >>>>> +	if (!priv->syscrg_base)
> >>>>> +		ret = -ENOMEM;
> >>>>
> >>>> Why are you mapping other device's IO? How are you going to ensure
> >>>> synced access to registers?
> >>>
> >>> Because setting PLL0 rate need specific steps and use the clocks of SYSCRG.
> >>
> >> That's not a reason to map other device's IO. That could be a reason
> >> for having syscon or some other sort of relationship, like clock or reset.
> >>
> >>> But SYSCRG driver also need PLL clock to be clock source when adding
> >>> clock providers. I tried to add SYSCRG clocks in 'clocks' property
> >>> in DT and use
> >>> clk_get() to get the clocks. But it could not run and crash. So I
> >>> use
> >>> ioremap() instead.
> >>
> >> So instead of properly model the relationship, you entangle the
> >> drivers even more.
> >>
> >> Please come with a proper design for this. I have no clue about your
> >> hardware, but that looks like you are asynchronously configuring the
> >> same hardware in two different places.
> >>
> >> Sorry, that's poor code.
> >>
> >> Best regards,
> >> Krzysztof
> >
> > Hi Krzysztof,
> >
> > If I use the old patch[1] like v2 and set the PLL0 default rate in the
> > SYSCRG driver, will it be better?
> >
> > [1]:
> > https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfive
> > tech.com/
> 
> Both reparenting cpu_root and enforcing the maximum cpu_core frequency can
> be accomplished with clk notifiers. See for example ccu_mux_notifier_register()
> in drivers/clk/sunxi-ng/ccu_mux.c.
> 

This seems like a good idea. I'll try it.

Thanks,
Xingyu Wu
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
