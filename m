Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E61C56201
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 10:05:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11062206FA
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 10:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XV8XwauJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Vt7GQwgv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="pK/I5+3L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11062206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=uDVtLBhkw6hGq/+inrmEQeewh1g4ZdtmSbUXymb2Ld8=; b=XV8XwauJfBLAh/OdGbjSTuRv2
	PxIb7HeIdkjZr6YYLyvikuB43x//YAr5tbFFXWr1UHZplGz1QB0JgyhSM5gxkIZ9ZiSQ+xk+4iv0i
	+6G9NTkVDRClBZooDL5sl26dLmHa8MClsi2vdX49AhgSiNdsDSqEDNQvxwRuor1AoTEDkt9MlSvhS
	KRmuXkrSjPR1AHj83Yw0VZX1fdcbd7gna1aZkMs1LQjtLN9Ux1pIl2gMez3EhN1oxxGl1PRVtUAG/
	poMErvG+bDHhoIUVvvTz++xFppkzBQFXYBURf4v91Ch9SD2Ktdc6BwZzE8kyhSKjjaKhkUjNi8ld4
	r7/MysdlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khVCX-0004fR-Uk; Tue, 24 Nov 2020 10:05:33 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khVCV-0004el-1w
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 10:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606212330; x=1637748330;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=e9l8e++pF/+TPdH+k7RyD/7T1jcZRcFhUKgVyMnPLNs=;
 b=Vt7GQwgvDMC5YG+cZW/auMgoAYg/4WP5eCcvZHI6HElsA50g8mB9PQ7w
 BtG+sbuJqakHpEc0WPA0YbbzM5OvpizfgEr3tOAe6McTEs/ENfX+W5CUR
 XyWT8uaHVlBWzS7EL+4piPPpa7rph5ko1Ayz3TN+kkUozDcZDcmxRPkfw
 /fnCh0sittsospJE224dOwZvSXEzYKXO4MvtJY0UkLsE0J/4mlRPNuUi4
 BJkDQXrSgAIQ4ED1ba+ywEJZrjBENXC+mYYgeZg5KytvPURSTn6IQDVAO
 1zd6RXVrxzxu67Z2rfUJ8siUs7j+nD8w2coZH6A5n5XJ2Q5oOXJa4qV7i A==;
IronPort-SDR: S9lG7gYF/fuNpudSBwHZD5+0rf1N57FXBBfG2l9wWqdso320jiMcQCi2U3WzYNpYHiHcGsEqRl
 RpOKq7xokqcjEyogu1LLWgm1eMp1vB6SSRaRRrHUnmik7sUN4kcScIURde+00IHkro1idgtpvQ
 IIVixoLUxU2ayW24YdOBgWQUTaMNKbDhG+qSH8b+IGtXKK/cSwJ3/6IIFPxh0BocXV8T03mvU7
 QtjN9kpj15QdcYWnj3Yq0pTtF8I0c0di2Fkzzr1m167tagpi3TvZ4FBtuVfCyYJFW61U1PBc9S
 42g=
X-IronPort-AV: E=Sophos;i="5.78,366,1599494400"; d="scan'208";a="153248338"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 18:05:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U61omKiXvucSPLzGA67fLwu/UHPWY0F57OdVQelvJzO1EE7nGHCDduX1vOJ8K6GZmAAqCu8dVQsCf4Ev/1JmFttNieAymVTntxZ5BRYIs/5q9W/rQa4+/M4ibkwMeLY/BfqUCWrOPaLdgwcfMIQSTB24ZvpCcbaAQIwIwJjha5H0M5MHsJR2gMM6PobkIjCclwn4GkrpHXYh+lU5QugWzAnF9QWffm8NsNKzcuSy5/hIKIM7rgfZjLhIUoZ0vJn1BxzHyLoOfM3rBnIsHBm62ThhQfUu2XoZ1M+xx+LWvNFb3jD2KB5hiYOwf3G9sYrt0eHvM3dTsdOm6SAFXCtFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU2qmvbV8wge+LjfgGsNeEMo8AKtCeuVRgfvH9NEunM=;
 b=dE3E2H953ogF0qFgg1NGvhY0vm3ucHhhIc22T9BXuzqIIJpsoooEt4pZZT+ZKBrgU4CSThzXev+owLDahDfF+EvBNcGLGFn20TgD4g0LW9ZU/5ogyFx8ZVOorwqgixZn5KkF++InR5M8xDtAwfoF/0co3yw9q9Rtse4UoBrJNVHY8IhOwy2qzxuyjb0dv69VmJk45kqB9i5dLiVvIEvSVHzzMZtvmTZqt3ItcCxQjWYSixKM15/u0SH/ClspTuabPaSmgK21cMqR5IDV0yghkfyIwI5g9J+jFV8anUtasyMu4uB2Og+5gY21uAVVPINPpTzHK2uNfA+snHlbO2KR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU2qmvbV8wge+LjfgGsNeEMo8AKtCeuVRgfvH9NEunM=;
 b=pK/I5+3LJIh2H/mfYlmkL/lSpshAQyORD38E/rLv/h64sAEXxGbgiyT47ZbBC7XHxzg8bBtqSzq1xD9WIQNcjHpHFS1WQvkVZfGmeCLs0krx5cCAdX8+WPs+lATTqOBIHYzWAu3R2AQn8zxSIcicBxDRYOA+4nqmbwS44ahlJ3c=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6871.namprd04.prod.outlook.com (2603:10b6:610:a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 10:05:25 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 10:05:25 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan, k210-fpioa bindings
Thread-Topic: [PATCH v2 09/21] dt-bindings: Document canaan,k210-fpioa bindings
Thread-Index: AQHWwhuTTl+n9RngRUi4SREztTsSrg==
Date: Tue, 24 Nov 2020 10:05:25 +0000
Message-ID: <CH2PR04MB6522F476C51D4C65F116BE9EE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-10-damien.lemoal@wdc.com>
 <CAMuHMdXov3Dr7EmAeE7yrKRmtu_L3539u9cjeiGiaRu32YVPQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:ccb9:9212:86f5:6af]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1a6edb0-737d-4e7b-aa8f-08d89060767d
x-ms-traffictypediagnostic: CH2PR04MB6871:
x-microsoft-antispam-prvs: <CH2PR04MB6871AA4F7C18E3587358A105E7FB0@CH2PR04MB6871.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3iWVproal6e0zlwDoujtfRSZym4VKuYcLFgDctOoXMmOVi1H6vC4eitNjFf2QniHCFnlRzeVvqlssAt6v58eTxnFIZ/Kwfi/oJgoWkgCWzl0wzQOhS7A4mRytFaOUuRapPkIl1V05AS7njcg7Y9c1VQtLEpznfCyNXDd/xVroThjNFdKPDZfea8he7/vnR3H9RSQUKxv2xk1DKw77wWAXnOgWe6l8tkvxUUdxIjyqR5yQmRJqDj5aZ980FSlQQ2dRqkcpFb67FcGBd69ouHPQVawsjo8uPQgxejbg0jcvpruNOgS5ALm/lZOXojhHCaeyBGJf7knIyfEpC2zWPWSuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(86362001)(8936002)(66446008)(7696005)(66946007)(64756008)(52536014)(76116006)(91956017)(66476007)(66556008)(2906002)(71200400001)(7416002)(186003)(8676002)(53546011)(478600001)(33656002)(4326008)(55016002)(9686003)(54906003)(6916009)(6506007)(83380400001)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fxN1S4osD4z7mDUA7H5ctzMFuFw/yPmbLrj/ic++rV3cIhVoWTUF+fmY9bZo?=
 =?us-ascii?Q?G/2e545qLi698qf2wJUTRvtfCAG+ieW0ftyfftGIpB+VzCglrnwdztg0S47F?=
 =?us-ascii?Q?922QdN9xzknpt009e9ENlS4wJyj0ltI0h4rEYMaCMTI8QFr4PqhRFEZvjFdq?=
 =?us-ascii?Q?k9gCbBjg6IkBQhtbKFYCdIK1jlApiBOHsxjTz234v4h4uRTnkYKyMif3KAhH?=
 =?us-ascii?Q?1+JE8B+utMrMxKdy7RvmmZpDvcQGDCWigvCKHAMkaj4UYv8R2vezokCxIyV0?=
 =?us-ascii?Q?1Sks6iGbWsk3IE9gLGBs5hif+7O8O/8lYqR+ROWqxygnK2trYH3gf4di/VGq?=
 =?us-ascii?Q?CuAz+6n6ah6oxrjUakN8HYPKyI5rwKdm1QO71JYP6wYNczgiKCxwxlE2qaZd?=
 =?us-ascii?Q?mQ8ZtpMg/1Fo27eg+rp6+VQzU2Kvgx4UmTPQmhG7+qwB6B/Pxzxc+4vBxO4w?=
 =?us-ascii?Q?RBqeM+D+V8b/8ZTZ7lsHP6zgGsfkT0adC0cXiS375UjwA3imkwPBnQwMq67O?=
 =?us-ascii?Q?hpeFDiTuCIZpfgz1gDsctjidH9MhvQPmX5rWCotshJBWQNHb+hAagb6aFtMZ?=
 =?us-ascii?Q?okYE3lwejfD7Kp7qa5LVZX6BXDameVgFKNk6ZC6UGp9+dusymGZN5IB8PWbI?=
 =?us-ascii?Q?GumVx3t+TW2duPZIHfo9rvhvqFdBNmxG5+O0LEI+vwEHm4SNvp3Zibl/QaIp?=
 =?us-ascii?Q?na5Xwh+naT2yHr1nTeJOm+1pvia0+hGOaxGOwECDWhSZmrcthPGcT1HYoKU3?=
 =?us-ascii?Q?OgrhejkEerWZswErkCFSr5e7+ASFyaBeZ3bVA8F/M73otEBnXiYplJbvzfW2?=
 =?us-ascii?Q?v+39B+g75E16HYe144UmoPorxmCLTBEtnIr9t7X8vyn5CCTG9nuGHu+0pJk/?=
 =?us-ascii?Q?uAHB3TS1uaavFIvLAZI4I6NwbcOrgGd2ZFL82nwOlmUmh2zo/1aHAeTBqB7x?=
 =?us-ascii?Q?zBCZq/9mRKPgXjUizE/ZhQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a6edb0-737d-4e7b-aa8f-08d89060767d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 10:05:25.1316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vk9snIOLBnSYs2nA2+i6rtqu/9fBRhJBB8KHNZpNj2yrd1CYu9l76vljG7gLmei+JfpcOZTjnyuYO1HZvb3yCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6871
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_050531_403645_C8CA3A22 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/24 18:49, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Tue, Nov 24, 2020 at 5:40 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>> Document the device tree bindings for the Canaan Kendryte K210 SoC
>> Fully Programmable IO Array (FPIOA) pinctrl driver in
>> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
>> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
>> define all 256 possible pin functions of the SoC IO pins, as well as
>> macros simplifying the definition of pin functions in a device tree.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
> 
>> +  canaan,k210-sysctl-power:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      phandle of the K210 system controller node and offset of the its
> 
> of its
> 
>> +      power domain control register.
> 
> Your k210-sysctl-v15 branch has a bogus trailing space here.

Oops. Forgot to push the fixed up patches. Just did it now (forced update
k210-sysctl-v15).

> 
>> +
>> +patternProperties:
> 
>> +  '-pins$':
>> +    type: object
>> +    $ref: /schemas/pinctrl/pincfg-node.yaml
>> +    description:
>> +      FPIOA client devices use sub-nodes to define the desired
>> +      configuration of pins. Client device sub-nodes use the
>> +      properties below.
>> +
>> +    properties:
> 
>> +      input-schmitt: true
>> +
>> +      input-schmitt-enable: true
> 
> Do you need both?
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml documents
> input-schmitt-enable and input-schmitt-disable, but not input-schmitt.

Ah. Yes. My bad. Will correct that.

> 
>> +
>> +      intput-polarity-invert:
> 
> input-polarity-invert
> 
>> +        description:
>> +          Enable or disable pin input polarity inversion.
> 
> Still, this is a non-standard property.  Do you need it, or can this be
> handled by the software GPIO_ACTIVE_LOW flag?

For GPIO, yes, that would work. But not all pin functions are GPIOs on this SoC,
and the hardware supports this. Strictly speaking, this is not really necessary
as pins that needs inversion have that coded in the function code given by the
pinmux node. So we could remove this. But that is not a lot of code at all in
the driver to support it and the hardware allows that to be set per pin,
regardless of the pin function assigned in the pinmux node.

> 
>> +      output-polarity-invert:
>> +        description:
>> +          Enable or disable pin output polarity inversion.
> 
> Same comment as for input.

Same answer :)

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
