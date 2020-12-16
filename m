Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6E7C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 05:25:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C485B23331
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 05:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C485B23331
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pMZ7n6NFoYxa8+UyaqHeWgaitUz3YRtvelHTIdoF7HQ=; b=tqMRsIGJnxUQ7VQCwmFEERLVv
	DR25c2vCIshGab50KMeDbbyFwDEX7Mcg3CUW1nBw2xta/ICVQVWCdXT4/yqXrabxEEH43tgldKWT5
	jy66yYjwYzuh0kdRyF8w4HY41k5ksBqtGoSwa/6Jax1TtQdt4zq/0hDY87aD2QFrbaVoK1c4qswQM
	k/2VvCmnz8ZMrmvEkv1IFUh4ISS6cffDnbz3VsNDF7VljiB5D5dCSAsyWUIpnd6KNeRI2DNTL+LRX
	NUFwBIc0zx+mHfeb0bSyfPHGWc3LBuFsbVBLU8wFqyILN2YGttsyqoN7yODK2xk1U+3AfHosR+W8M
	14MNg24pQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpPIy-0007bA-Vu; Wed, 16 Dec 2020 05:24:53 +0000
Received: from mail-mw2nam10on2069.outbound.protection.outlook.com
 ([40.107.94.69] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpPIv-0007ae-SX
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 05:24:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmIERudXlfnvUIs5N5bkxl/PlKb4PCPk1qnTIWFP52cWkwx42yAYk7Yvz4LEgGOBqFJckDUQ7te3uPhic5RmFmayjaVlXaIhOUP9Hfzn04LkM92bxfWpR10nMpcPYDaHR6SnF2HqIFn8QjnD05lA/IcWx8VwdQkFvXprsMiYueZsYA/6411K89qNUsoav1CoFW1NKEg6w5ml5Mz75wNnHt/X8w1gD86eLKjr+eETSuP1ljv5hgpq7oEhzIGteKdiuWjik+wKARFpHOv5ZXW2SMEMjSVyUl7S4MUu5Re0g8FYlPVirVKYoGLXTbNkSlBwUm8nBNuYjoENA4DdfkgBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lSHyvUV2qzlSRHiYEb0GMLRXElAm4OM1SaM93lMUFw=;
 b=MR6d8H5aYNKaiMwncyVuTOOkrZaO6D6oIk5K8054L0ya4GI37YaJuZEEtnkx2YTv1IJGY5Wxak5VveQm1m1QI423uTpVe1r0dqKcEiOIuDiUvFCZ/HytdMyyr625ipF7qBgykndxuf/xGIwOxzDRHCQ7DDBsB5x/CIMuXdeLgUo8OVw/+RRTF09bSpee9cpw2DO0K6N7XSf2t72tfrGLCsDhNu4HQWU7n6lch04WKczHpgF4F/loDwRjP5vZMv0awpAE7lyu/BZuAs3xzkof92Y5zWvt6gMAEE0xS3jYKI5jW0oag1dgKXpAldJ40XxZiCsNm+RD9Jvq0YUWI/41jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lSHyvUV2qzlSRHiYEb0GMLRXElAm4OM1SaM93lMUFw=;
 b=ELrN9HHqe3XVYVPzAPKsfh9NS57RQQHI/EgRbzHpcoBJnES0R4X4vVUQ9H0k2h4xCqHxdSdApalsiggVCEEjJXPCuIPskR5BpAYy0H0DvUGmR1ZpUsWy6surnq24J+eLWBtBkEAXIdtedqGylYOLcxqUOITrjl/WGMPX7Z8coVs=
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB3617.namprd13.prod.outlook.com (2603:10b6:a03:21b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.10; Wed, 16 Dec
 2020 05:24:42 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%6]) with mapi id 15.20.3676.016; Wed, 16 Dec 2020
 05:24:41 +0000
From: Yash Shah <yash.shah@openfive.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: RE: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
Thread-Topic: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
Thread-Index: AQHWzR6JqEv/BdKn8Eapft4N/qmyd6nwWDeAgAD9P4A=
Date: Wed, 16 Dec 2020 05:24:41 +0000
Message-ID: <BY5PR13MB44539E6CDB009EFA6AB7CAFA82C50@BY5PR13MB4453.namprd13.prod.outlook.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
 <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
In-Reply-To: <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [210.16.112.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29bf9f61-d1e4-41a6-f20f-08d8a182e439
x-ms-traffictypediagnostic: BY5PR13MB3617:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR13MB3617423047955F0F0ADB806182C50@BY5PR13MB3617.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v46q1aiGwjGe1NAAsMQgFeSVNVsiQ8kU80u7v/9275yHf0KGpKTqktA6R0MMksPRVnDuuNiNujFye8Dw/KvmimoToKZvs5kGmVs6Hw7zbF94KLC62vGVK7qp7YIyPjfTksiFcFVAb448xowj49BxQw3M4lnl40OwephJ2IrNcY1S0rdEDbNaVF1VNWWgxcragy7sD/A8QhP2K1nDhZLHUjJOhsTVZ4H7hMgNnnScbkx7bw1WZZYnHC4YKxI0tpBDQfDnJznhihqTZWCrxj5e3bVVrzQzCYCXqcbndKy+8bI9AquzhKg9LxEr+NTgsvENcFfM1Ol9EItTKldqlyENsktr2ePDHyh+eRp0nW0a+9I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(396003)(376002)(366004)(39840400004)(136003)(346002)(5660300002)(33656002)(66556008)(64756008)(7696005)(6506007)(66446008)(66476007)(8676002)(83380400001)(26005)(8936002)(2906002)(478600001)(86362001)(186003)(7416002)(9686003)(6916009)(66946007)(52536014)(316002)(55016002)(54906003)(4326008)(76116006)(53546011)(71200400001)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?alBRdGtsTlI4RzIwYVZ6dmJZc3A4SkJiempFWGxieDZIZlZ5NEprSEk3UEhu?=
 =?utf-8?B?OWNkZzBHcnJhVDVzVDBIZUZQWndiUE0vSG1HNVdPUzZFQVpxdHZWRzBFUXFl?=
 =?utf-8?B?bCtNQU1IVHA1S09aRUZJMjhPbUR4T0RycUNjVWhWWkVWVmhUVk5VdGs5b1RB?=
 =?utf-8?B?L1hxS094Y2xCRU9WRHcvNlJJUW5EZXFnQU03NmlwSDV3czgrcDlVbWg2Q2ZS?=
 =?utf-8?B?cVB4R2gzMjhMdlRlTzVnMTBwTU55T2JUS2ZjdmdQUkJQdktOWkh4VEZkZ2RY?=
 =?utf-8?B?bEdtYjdIU0ptdnRXUGI4NloxNXJ1NEVPbk1nNDcxL29QdE1LbWM0YXE5NUw3?=
 =?utf-8?B?L3kyVTRCK1BNeG90azZLS0V4ZG1XNjQvdlV3WXBqZHNuT2RyVXRNWXZnQlQ4?=
 =?utf-8?B?RlJOYTdtRzIvL01rZE5FM3FiTDJFWTlkeEdyUzZlaitjcVpnb2ZSY0NKNVpi?=
 =?utf-8?B?NEprOGdBa0ZBMG14aC9vMWsyN1RsT1A0ZVMzZ1FIaGdEaXZSL2ZKb0tzaEEz?=
 =?utf-8?B?T0dueHI2WTVydWpFTlhNd2p5akpnVkhBaUpmQjRmTnlQU1dvOGhBRVFFd21O?=
 =?utf-8?B?N1I1MnF0Q3ArVHhXUnplMldKY1V5ODRCRi9OVmJuM01kbVJOUjFYWDREQkxx?=
 =?utf-8?B?ZDBtZUhCeEVkbmM3S0pDUkE1ZS85M2hVSzBrbW1sNFBBTmJXdTRNVXdveldL?=
 =?utf-8?B?VnUxMlFIbjRmcFRlbTNwRWFTblFFL2ZCRFNRZ052V0FyR2FLTmI4VW9QS2dq?=
 =?utf-8?B?VEp5ckNTeXYrWi9lbGs1Q29FSkEwUyt6bGVwM1l0SDhPMGx2VndMaENvdFp0?=
 =?utf-8?B?VVpSVjRVMm5rN1Z3SUFma2R0YkJWYzZIY3NkZGJVN2dxNmlCdXJvWVVtL3lr?=
 =?utf-8?B?N3VhOWk1TTJLTUhnQU0yN3cva0I5RlZHdDl6Rk1VMWhPanJNQjBoRmtwelQy?=
 =?utf-8?B?cHh6V0VJZzNCbktucVVUWENickdIUE5IQ3BxeWxhbTBhYUZ2TFVaclF0bFd2?=
 =?utf-8?B?S2RaOE9KWVJncFVaVVdoandIQzBJNWRIdHVkZisvVG5KbEl0NStVcjVUYWJB?=
 =?utf-8?B?S2Zub3g5dDlnVUpDU21OamZxblVNN1FWaEF3L3ZMaE5NcVQ1MUlrbXJwSHJC?=
 =?utf-8?B?QVQ2Nm9HcDQ5Y1JmRWhiTXowK0pSRU9KQ0tpR3hLenVkanJlSm1aRHZGYlVP?=
 =?utf-8?B?RmhiYTRNTGhtY1dHMVpiZW1DSGlOcFJrOFp1RllSSllkUmwySzErcGNuRDlD?=
 =?utf-8?B?UTNOcFhXK29RRC90V3VnQ01DYkV3M0haNnhWdlFBTWNKVHRGdXUyS0oxZmoz?=
 =?utf-8?Q?4lrXcAwteIA1Y=3D?=
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bf9f61-d1e4-41a6-f20f-08d8a182e439
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 05:24:41.8254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtHNmWdDg5r/zSsqCbcITxKQAk853Q5GWsFcuO6cunHnRlH/jJUK1sXUQIXPK5kR26oBg59fHX5fdz96Zdnc8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_002450_278107_C99E4AB4 
X-CRM114-Status: GOOD (  21.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Peter Korsgaard <peter@korsgaard.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Bin Meng <bmeng.cn@gmail.com>
> Sent: 10 December 2020 19:05
> To: Yash Shah <yash.shah@openfive.com>
> Cc: linux-spi@vger.kernel.org; linux-serial@vger.kernel.org; linux-
> pwm@vger.kernel.org; linux-i2c@vger.kernel.org; linux-kernel <linux-
> kernel@vger.kernel.org>; linux-riscv <linux-riscv@lists.infradead.org>;
> devicetree <devicetree@vger.kernel.org>; open list:GPIO SUBSYSTEM <linux-
> gpio@vger.kernel.org>; broonie@kernel.org; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Albert Ou <aou@eecs.berkeley.edu>;
> lee.jones@linaro.org; u.kleine-koenig@pengutronix.de; Thierry Reding
> <thierry.reding@gmail.com>; andrew@lunn.ch; Peter Korsgaard
> <peter@korsgaard.com>; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>; Rob
> Herring <robh+dt@kernel.org>; Bartosz Golaszewski
> <bgolaszewski@baylibre.com>; Linus Walleij <linus.walleij@linaro.org>
> Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive FU740-
> C000 SoC
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
> >
> > Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built
> 
> FU740-C000 Soc
> 
> > around the SiFIve U7 Core Complex and a TileLink interconnect.
> >
> > This file is expected to grow as more device drivers are added to the
> > kernel.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 293
> > +++++++++++++++++++++++++++++
> >  1 file changed, 293 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > new file mode 100644
> > index 0000000..eeb4f8c3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > @@ -0,0 +1,293 @@

...

> > +               plic0: interrupt-controller@c000000 {
> > +                       #interrupt-cells = <1>;
> > +                       #address-cells = <0>;
> > +                       compatible = "sifive,fu540-c000-plic",
> > + "sifive,plic-1.0.0";
> 
> I don't see bindings updated for FU740 PLIC, like "sifive,fu740-c000-plic"?

That's because it is not required. There won't be any difference in driver code for FU740 plic.

... 

> > +               eth0: ethernet@10090000 {
> > +                       compatible = "sifive,fu540-c000-gem";
> 
> "sifive,fu740-c000-gem"?
> 

Same reason as above.

Thanks for your review.

- Yash

> > +                       interrupt-parent = <&plic0>;
> > +                       interrupts = <55>;
> > +                       reg = <0x0 0x10090000 0x0 0x2000>,
> > +                             <0x0 0x100a0000 0x0 0x1000>;
> > +                       local-mac-address = [00 00 00 00 00 00];
> > +                       clock-names = "pclk", "hclk";
> > +                       clocks = <&prci PRCI_CLK_GEMGXLPLL>,
> > +                                <&prci PRCI_CLK_GEMGXLPLL>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       status = "disabled";
> > +               };
> > +               pwm0: pwm@10020000 {
> > +                       compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
> > +                       reg = <0x0 0x10020000 0x0 0x1000>;
> > +                       interrupt-parent = <&plic0>;
> > +                       interrupts = <44>, <45>, <46>, <47>;
> > +                       clocks = <&prci PRCI_CLK_PCLK>;
> > +                       #pwm-cells = <3>;
> > +                       status = "disabled";
> > +               };
> > +               pwm1: pwm@10021000 {
> > +                       compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
> > +                       reg = <0x0 0x10021000 0x0 0x1000>;
> > +                       interrupt-parent = <&plic0>;
> > +                       interrupts = <48>, <49>, <50>, <51>;
> > +                       clocks = <&prci PRCI_CLK_PCLK>;
> > +                       #pwm-cells = <3>;
> > +                       status = "disabled";
> > +               };
> > +               ccache: cache-controller@2010000 {
> > +                       compatible = "sifive,fu740-c000-ccache", "cache";
> > +                       cache-block-size = <64>;
> > +                       cache-level = <2>;
> > +                       cache-sets = <2048>;
> > +                       cache-size = <2097152>;
> > +                       cache-unified;
> > +                       interrupt-parent = <&plic0>;
> > +                       interrupts = <19 20 21 22>;
> > +                       reg = <0x0 0x2010000 0x0 0x1000>;
> > +               };
> > +               gpio: gpio@10060000 {
> > +                       compatible = "sifive,fu740-c000-gpio", "sifive,gpio0";
> > +                       interrupt-parent = <&plic0>;
> > +                       interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
> > +                                    <30>, <31>, <32>, <33>, <34>, <35>, <36>,
> > +                                    <37>, <38>;
> > +                       reg = <0x0 0x10060000 0x0 0x1000>;
> > +                       gpio-controller;
> > +                       #gpio-cells = <2>;
> > +                       interrupt-controller;
> > +                       #interrupt-cells = <2>;
> > +                       clocks = <&prci PRCI_CLK_PCLK>;
> > +                       status = "disabled";
> > +               };
> > +       };
> > +};
> 
> Regards,
> Bin
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
