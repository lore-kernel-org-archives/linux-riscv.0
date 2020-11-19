Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD293C6369E
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 11:22:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10F5022201
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 11:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mu00bdaC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Qxkn6mni";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="EZO8seH7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10F5022201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=D3QfYb+n7c1OtBV/2R422gWYo0xekZav+k5XjZOECUo=; b=mu00bdaCh7asCYGpuUmODXBbT
	+yds0HHHd6ovp81o8xPjyQWNVj3vFMuUtLUMrcqHT7p3xjsGb+oTH64+xcuBJgrX/7ec7fxFrD937
	tDD6/R7pvNJLdh0HlEKhv2WRLzF29Gl8psRAAnNj+te/ldmFIPQrcZIIt25tclWkCdaye3E7kMFAu
	fwgkdn7JqBuK13AWT6m6uveuE07f8SheNyEFgZzDJ2rpYAM6wls84wu+xSxaawWJWrJOKwGz4igGU
	usStLj/5IpPfs/2m8Wr2bre/YJ8HVKqWTBCYsZk39GRtqYd+uNyYVX2liWg4e6cqG/PbmCxZCzh7h
	EuYjqudqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfi1K-0006Gu-DG; Thu, 19 Nov 2020 11:22:34 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfi1H-0006G9-Mh
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 11:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605784951; x=1637320951;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Ge/pHFZW6CmfDvVtpZh+cDiAkaVqXt3bMUJWG4eusys=;
 b=Qxkn6mnibP9iGztEgMXC0oouJ5ehWMJsjO7IxQikUfEcwFtJBnsJxxSH
 MtcI7iMtIekXGnfxS1e6/bLccXfKnpcyyVHmm88beUmkWkf4xdDUNsrIk
 tvrtkVEga34kwft/9YKnWHugPWvnuwCa09JU9UQU6q+f2QJUjPSN5b0Ul
 DJruZjhYmOyKZQaGl8JL/vM9BpyEQE00WG3KxaoO07Moo/REtxiPkeB/W
 OMxLC0DMRBYGLGnc+MdYT0Hb5+jE9Nq4qy1c6njHc+OYThutQWKCZ21d/
 zkc9hT9vzg80gelMizIuKh1RXnr/8NXCYlzge+8XJSZSgeU1B0serzc9J g==;
IronPort-SDR: bckLJJlFupBQR7v/b3SA8Y5+uc437CmYLqChIx+dNpD1NzTEICTgPvhEaHxbO/UDxRuC+BJSYA
 Sz9O2I7LYVcCECTcAawEJktIj6Xk8/yVsPBlRJjrcsLWvwMHhLBk1bniXaKoQMxHQg8GkpnIdp
 R2hXtAEgXneFmeGR812j2H5bB07/IvTRAR+gh6hMZrP7S9EzTVTVqShEEyu3G73Yp0NcFjfZ7l
 JtEIVIbk0Rs9ZE5uyjURURyU9RkzVLOceGtw5Z1GyS7rahwGaNk/BX6IIBPVow7R9/hI5ztnna
 /EQ=
X-IronPort-AV: E=Sophos;i="5.77,490,1596470400"; d="scan'208";a="153062735"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 19:22:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZ3Z+5YpPeGRtQxH8zdKTJaLgFMZqFRY44fwgL5cO3cMG7O/qG6xsev5gSuAHSMKGKvQKmVprLbprwMp+KaD2e5uxjRLXb9SWTsEJ2VopVEL1GUawq+rK/KPwvSrdCx7G29QlWQUP1xsJM3YCjg//e8co/wx71EktP9y6QSvoYEAdH7Md5XnkqyPgqjgz+wo3AKBQcRVghgFFq5J0B0zNrHdwD4VLmNcNPkhFkz3E/GxemYYKbAH0WtqF9AFys7XsW6rYD4vX4G7kFJ9KSa9YcvsDcCIbYmM1bXXN7+dl0c4VI/sbDVOMhVZla1w1A8Ni40rA1bMktMjDlgTT0q2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6SgIfPUJbXPreM+cABcdMc43jWJnuJZ0/aVS+wIlAM=;
 b=bOeEpFfkwc9VNcorFIFqHwTUu9JTFuemzbfr+IV6Ai4YrJVKQYT+DhRxL9zBdF7JF9wc7/hFeIonhyPh7RRkiykJpsVD+NG8solo21d0UqWAzI/+rqQ9UdDpSLlfyFUBELj+gzhslhkoREIs0NYpDTJLLTrPe104nIiMJdUZBNogvGr18TwPakGJrEyB3Ayh1yU/0rLErFwy6EkS6TgFCvLzj4XoBv+7juZDIS6eLkFXPx0IN2vzUqF9vFhqzgp6Oxra3V/x+luv+Qd4d+/AOPXut+kKJIkE96zY5H3a0rvInf3oOFFNjps403Zn+31PIMANjBHVK2h6fioZgMY7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6SgIfPUJbXPreM+cABcdMc43jWJnuJZ0/aVS+wIlAM=;
 b=EZO8seH7wnbs2qidBAe3ju6e33iPkZnBmlW3jWw8hPF+LcV//MrHobpBeDTrQoOOJvruQA4YrzeBMu8xcOqLA3rzDuNPOTew21DLAYIRaL/minzICZAFL0Omh5zoM5KDpSpDofQZkWQWtszEBP12rb8oH9nqN4I6CeOaFDdnecU=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4532.namprd04.prod.outlook.com (2603:10b6:208:4f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 19 Nov
 2020 11:22:25 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Thu, 19 Nov 2020
 11:22:25 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Sean Anderson
 <seanga2@gmail.com>
Subject: Re: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
Thread-Topic: [PATCH 24/32] dt-bindings: Document kendryte, k210-fpioa bindings
Thread-Index: AQHWtN4pogxbCuVPg0qTFpKg863FNg==
Date: Thu, 19 Nov 2020 11:22:24 +0000
Message-ID: <BL0PR04MB65143886DECE34E61DAEE9BBE7E00@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-25-damien.lemoal@wdc.com>
 <20201109153625.GB1330401@bogus>
 <04b266c7-bba9-d847-a526-f64f76c11a50@gmail.com>
 <CAMuHMdV0GL-GoY5=cgsW5QEWPB=ySK-8EyVeKLwt=6oODV4z3A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:752d:4d55:43bb:285f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 00869975-0540-4f71-f18f-08d88c7d641c
x-ms-traffictypediagnostic: BL0PR04MB4532:
x-microsoft-antispam-prvs: <BL0PR04MB45323F90958417F013493B16E7E00@BL0PR04MB4532.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rq+ve6LCXF4g9af8TPbLbNO7PReaCXOfSATaoYMUwySmsjzpj+wE1jMZ49rQLGpw35YiT+e8mNL/Eq4MlMC9lEa46+np1Zu4tCEkuTLMkyT4GvShUSrS4Xhj1lizvO/SnqK1MhiHIXbGjm1GExJ0pS71MnVgavRYV17ovfutmc+Gym+DCM+xAJGHhduv+4SSadiB5x7GnNBnlc1KC4zxQXmpbK4FCGF9WsP/5xO8yx1VODrFTNwX22ULgOrhgVOtTFqmVN/bNCb/aGp0ptHzRaz/OVdDzEETLfoCr8ROeuQKTS+pI/f1zCnGRTXmuOZLDnu1IhK/8F9jepveiSBYUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(478600001)(110136005)(86362001)(7696005)(316002)(6506007)(53546011)(186003)(7416002)(4326008)(9686003)(55016002)(8676002)(71200400001)(8936002)(54906003)(66556008)(2906002)(52536014)(33656002)(5660300002)(64756008)(91956017)(76116006)(66946007)(66476007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FmKh0QTqnaX2zOf9cWNv2UPiJzB6nv8H6upvyzdyvNCzDo7TNzbJ+oN36msQqf51kqkyakY0rOzdJ5o7RSJwWcaEfKtY0W7EncTNSJog237k6rDPG9lemZ+LCYaej+93yZRDUuA5mQKH3Xn80lZ3uKfQBaQJZPuWM6qdYbLSE5f2PnZt6PV6iTt5P3F5+3fFfsdGdGwiJTzLLWBha1NV/whlOQDoZY1T5I+MgxKgze9o9Tavs+xvbNWYdxXNm9XPdIt+zQwT4ekzClwOs5uWrnPlzW8GSk85z6FfNoqmrHQYWXCIBKqHymfpD4DEqeoLe/cTUdFlij4WAemrq6Bit7W6dW9asUCSVsVXwYfGH5mvLnBS0fPPyY1isT/oTh3WvsLy71n9gSCpUwQ5MwoWzUVT5sB1ORVLmET1HzjRUwP0je1cJiRDnvThWcYESIfO1Jrj7LR866lO0w4f836AOm9LPYVeTWC2BIG8AEaIBOeoZaFItWottB1dYqZyq8aDkGgq6kV/yLAyr0tdnkPQ8hKqhmsTD2kJUS0KA+qMuTd5WgeWA2EMHyq3zGHaqLohIcwMI/6mtQkhO166I8kuq8TB21QW4efwED0QzQcyMVT0ZPAKdE72Gcv+6Hmk4tnXovtWnah939L6b5196uZ3IFsTk6G3aB9z+3cdFWyxYdBfo/76TBKZNjd7uUXUT49hmxNf5o4ZeH8F4l2TUVmg8Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00869975-0540-4f71-f18f-08d88c7d641c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 11:22:25.0010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2ChgSClezmhD6HYH7GBdpdRYPPYywegTC9STL1RQ4GdSMZEc/kbAFzqG0fSu47V6dBMotmbW4/pMj4EoEpSQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_062232_210410_D77791DB 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/19 19:58, Geert Uytterhoeven wrote:
> Hi Damien, Sean,
> 
> On Mon, Nov 9, 2020 at 4:46 PM Sean Anderson <seanga2@gmail.com> wrote:
>> On 11/9/20 10:36 AM, Rob Herring wrote:
>>> On Sat, Nov 07, 2020 at 05:14:12PM +0900, Damien Le Moal wrote:
>>>> Document the device tree bindings for the Kendryte K210 SoC Fully
>>>> Programmable IO Array (FPIOA) pinctrl driver in
>>>> Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
>>>>
>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> 
>>>> +  kendryte,power-offset:
>>>> +    minItems: 1
>>>> +    maxItems: 1
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: |
>>>> +      Offset of the power domain control register of the system controller.
>>>
>>> Sounds like you should be using power-domains binding.
>>
>> This is for pin power domains. E.g. pins 0-5 can be set to 1V8 or 3V3 logic levels.
> 
> Which brings to my attention the power-source property is not
> documented below...
> 
>>>> +      The value should be the macro K210_SYSCTL_POWER_SEL defined in
>>>> +      dt-bindings/mfd/k210-sysctl.h.
>>>> +
>>>> +patternProperties:
>>>> +  '^.*$':
>>>> +    if:
>>>> +      type: object
>>>> +    then:
> 
> As the driver supports e.g. bias and drive-strength, these should be
> documented here, too.

Thanks for the review. I fixed everything today and ran everything through "make
dt_binding_check". Will send a V2 series tomorrow after some more fixes and tests.

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
