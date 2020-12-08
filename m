Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A921C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:48:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1FF23A3C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC1FF23A3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=o7O82Bo/+GAScuQIE5019xvXDHP+2uaIKJ9d1yy07WI=; b=HjGDXXw/LUGIk5UGJDmAv0k4I
	OME4bjxFveWEyVhlVFjFzHvvG8YV8u5o0FHW8c/f4hy8MeOT7t/G/MqoajaMJZNh9h2PO3xJ9E2aw
	9Knfh1THjO9biqWmQdoemp+Jd3f1uqUACaJWO9ycmBOTBW5zGjENmkfLGxwJps5Xi6gKTH7v/96LH
	unmblA8NpLUa4+DNc2jKEtmVeVc5BnSE35L1+1lUtNNag9mojPRVWAPN94G87nC2UHjTRm40cCkcg
	N2i/UTh77wGIBH89ObN9VTXOKrKPW+6ccc9tGVtvRrLt38/A9S2wbKZMTINxkTEUfyy13hnZDIqz+
	8pr3aaT5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXjd-0001i8-Vf; Tue, 08 Dec 2020 07:48:34 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXja-0001ho-F2
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607413710; x=1638949710;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=JijVjlT+wmn691kvw6dKiFPRly79I7iZrQBrb/430FU=;
 b=pcKMsPUUH04BJXlQrcGFHfpwTt+wXOUFylPwj5/uYoUVdpbtAldIpoFW
 H2tLViPocxKiYdm9/vrzmxGFe7JNibdf/nF6Mc0wHhkrfK/NukQpJ81Cs
 h63DRIdzDfwzHEU7aio5S91+SadoFRZApEOvRUOZ6PmzxLjAOojImOGH5
 SULToKHUQnntMI52GlQgReJdXAnNf/RrjW02YkUO/aoTYxZl1XsVs8VfU
 zyDjObTSFnOU+RVl0/waZQ9PQ+GZtuuyMJjJcZhIs8UljO8/Q/NCCgwyG
 gBVfFB5aUVd/PVNpnvhGnZCR/8SX2fC1JGIblU1UTqS3IgvEb0sRMnWna A==;
IronPort-SDR: M8qdSyUOGIgc8ZE5bASayDV4IBc7Xr4izFRVkVYJqCilloiPLb0EDQfbrbmtfLq/d2EHwOXY6N
 SbXHV1PM2h91sOjQ7KOIsmCJtKwIRgANrnvrLxywkiNtpRPRMACyKXH/22sM7m2F6mTA0a7hOE
 kL07b3oBxXPyH+MIRfCJWdyZTceKHtLGpNQw4dqiVt7Nx5jZu3cgMpOL167nXyExYgw/X+/j5l
 gjtYhdIaFwNrO3O7TZQtmqw5zTBUpCJyuzg5tNRkjQHoYSXSQkvogWk//MZAo6WIoDIXOYfuMZ
 rrg=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; d="scan'208";a="159125907"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:48:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WABishG//mfq3x7wDtxIUgRLpkGh1VgB6/Meg5+oRf339yJfMZBy/kCM2khAQ/62C7Oy7hVmPt9Xo1nTm095fWXyXi0P02gZpGgoxof/Jowoi4mF5T8p2D6NJZUjUsFK1yidJkKiu8RZsFs++/HOgiZCDCq0NALe2bWC1WVryaWF4g0czlPWP6ocIu7afK+gCpYovN1GzSVVS453+uyHIeX7fH3QSq1EOcpTjP5PCiDVc2fGKp8K1Ejv+tnjzMNPgQI6QlDbxf8LsgA472m09QeOUmLryEIr5jU8YUILhe8Lu3GTT0VVDc2TXb6keW+3n8b77P3OGR8pbJdAvCExiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioBzt6s4hrIFoz8M5QkOKTvmNmIFjd5phHfTgMrFcIE=;
 b=GXmOZI7JclTgqixOYIvtD6Sv3kGCiwZhAZ//Uj1bPE0z0vgEvJFBAIBLft85kSd80MNdAWLKL2h29VIFDq5GOB/62WKAUkriljU3p4h9fu5oLpoEErQnsfd9xjqcvWp0c2IhadwiQsuf+y9eP3lz2LHkFj+zDZN+1y4loS8Bk0t6ERwIf9uJgJrKbZ/mkkN1VetGPGxxmPH0+Un7xx14jz+GeYqowHACfsy53ek/F+PWYpicfAb+G9/I0G/65Lngy9b3GmG1zdEzRM942Lijoz2wgbhrPu18mXNb5L7/3doN86b6ecwSMdlSf56F/I0OMW1Uf5BIgzUVM3AxPlOZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioBzt6s4hrIFoz8M5QkOKTvmNmIFjd5phHfTgMrFcIE=;
 b=rMlD2R2njoJ6udF0d3JRYEUqYeK7AKLBkm3ouEoZI5dmXZ58dn7/bQj2KKlCx8SdYf9f89zCA7Bt2gZTI83JAWiHAh9EeqnJxZyplC65F1USmdfnyVxhFAsvDo4Pt97s9gP8EgvyNiQ2/aDh6avJQLCLVx49frMHxyueWqV+hV4=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6886.namprd04.prod.outlook.com (2603:10b6:610:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 07:48:26 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 07:48:26 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Topic: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Index: AQHWyFrJ31Bqsdz07kaNo2YIn/vMLQ==
Date: Tue, 8 Dec 2020 07:48:26 +0000
Message-ID: <CH2PR04MB65226B954871D20537655AE2E7CD0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <d9aec92299e5f427aaf5c5e892194e27006f8bbc.camel@wdc.com>
 <160736612827.1580929.7802371235304556600@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1cf3:4043:c21d:e871]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d070cd64-2cf9-467f-9c16-08d89b4da57c
x-ms-traffictypediagnostic: CH2PR04MB6886:
x-microsoft-antispam-prvs: <CH2PR04MB688697C170D990A148456EA6E7CD0@CH2PR04MB6886.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MTleQuf4DjxgUwfZAkUtFuP5yUNB7EwAba7cdXZCboNjdh3m0awPPDhiwMCOETWlMt/aH4iTm+jp8BtmFRUC6Jr60+IKdd/MVaEQFUIzBuCzd4gJWDc+wdtatN4SVAuImJAretHAksh9GLEAV6zB3Eu7GcmjrfIbDDH6R178kO29wl5x0fdVOyaY77r62uXDXO4pHRjsqpvHvNRRoxQS3cEn/JiIxmBss2cMSXU8ZfxJ7pKyd5gO2BLr7GEGO+5pxluI+37l655438xKEbuNjzryENriVMkczsMNUywkSlUtnMUVmShFwNN0D4DwwCCtlouFYyyoB+1LeX/YydE62NhpS7qWuWyX8xfOBBRhQXMZep3eK0YVRNzp89dGHm6y6T6j2JVLmEoLMT2cDzWekw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(9686003)(66476007)(66556008)(53546011)(71200400001)(4326008)(7416002)(66946007)(76116006)(66446008)(64756008)(8676002)(2906002)(186003)(966005)(55016002)(5660300002)(478600001)(83380400001)(8936002)(33656002)(7696005)(6506007)(91956017)(52536014)(316002)(110136005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?78WamEh1CefEaA0e7pxp2kAhmW+pswPstQ0AAGwmy6ljGi6L4RKiatZtuy?=
 =?iso-8859-1?Q?SAsdQeP7UiCFkLLGwZ9+tfVG+8Ls3G5hiOj68msflwJxPECzrleQBi4n2r?=
 =?iso-8859-1?Q?qsQ0SFcvYnW8g4wFLggj0yj20f1Hp55pqbrUnKGnv4q9xooT/cqhtY/llZ?=
 =?iso-8859-1?Q?NITRvnr1sUv6nW3TXPlhZHUbYyDSQgYu5mq9pIeBD9eZV9j8PEBdhEHHnQ?=
 =?iso-8859-1?Q?fWCkxAvaXtWMGMdN2CB1vjn24RlRgeSNWPOb0c3Wg/KzvJ08RXvStKJ5tZ?=
 =?iso-8859-1?Q?A3pUKc4Vg4KS5yq9brBHyTpOfy/L0Yil0VgCqMbUOi01/wbTWSXmnPc+s9?=
 =?iso-8859-1?Q?DTOtbLJiB78cW63eGi0UsXTIdio5gIgCpmQHvEJEjKDsXwTPss+sFHeip2?=
 =?iso-8859-1?Q?a7T5Eb7Q60AVOk7vXlZ1J88PI2mvPTXjeFgXontocS7OnQUY4JrthZf7G2?=
 =?iso-8859-1?Q?C2RfPz+l/tBRo6S+CWDIFXe10ka9l7yvMEQd07KY6Fe+ZXuLgMCmWIM8zR?=
 =?iso-8859-1?Q?Pku6k2e9EC7gfBdBLjz+ZxlN0GGEemQJKefxokt8VhU2VEq/cKfRYKl9lP?=
 =?iso-8859-1?Q?dlNMx+ergetIEmqT18SN7hPGOyO15cjowQQC8NzuTustsDaixWDuOSFLzX?=
 =?iso-8859-1?Q?L2zfmK/yEVUw7Ul5wPqWhd75s4zNUkMHD+CbloNMDQGiFbinjwyGOccc4x?=
 =?iso-8859-1?Q?m1/ztEj24WU9Lxiq8ndB6jTfTDBkBPFiFpDlnzJs/wz0m/L77t0gInn6ln?=
 =?iso-8859-1?Q?r8hgRnnuf9ePPbN7Nn3h8y4rHaeQM66L4CODAr/WT9a7iQNqBXhIOkPsZ3?=
 =?iso-8859-1?Q?KldEWMex3CeBR2p/1IZ1Lyw2BHFRQzsdCNJ6eBS/WPJVEPnZTOb0lzqtht?=
 =?iso-8859-1?Q?bSFHAukU6DxC31QSYqfPJusyEaxU14J+VErt1g2flDGjaWytLkijklp6Ds?=
 =?iso-8859-1?Q?swH6CWWV05FPJTCMuzz1SXnklLnn4Yx+Zdxro1QbBozqv+FcUaHWh0pTwl?=
 =?iso-8859-1?Q?63qws91A3BwfjFoz57MFMrw9eedD97Dm6JuLbNNLL6ZwMfBhW8Bk3FXvrk?=
 =?iso-8859-1?Q?vE6YyLlW3USJlEmhTrYQU5H+hyPzFDB2sx86QoivrbX+?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d070cd64-2cf9-467f-9c16-08d89b4da57c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 07:48:26.3402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZ6Cw7pzLzZ5aGqiY+QQmohUNQkZS7VZZe3DjnMShVUGdYylSaNAittvMupw2r4hbrJ9d20isUi8xq9Kr9cQmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_024830_794245_FF5677EF 
X-CRM114-Status: GOOD (  26.88  )
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
Cc: "seanga2@" <"gmail.com seanga2"@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/12/08 3:35, Stephen Boyd wrote:
> Quoting Damien Le Moal (2020-12-04 23:43:14)
>> Hi Stephen,
>>
>> Thank you for the review. I will address all your comments.
>> I just have a few questions below.
>>
>> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
>>> Quoting Damien Le Moal (2020-12-01 19:24:50)
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 2daa6ee673f7..3da9a7a02f61 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -3822,6 +3822,22 @@ W:       https://github.com/Cascoda/ca8210-linu=
x.git
>>>> =A0F:     Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
>>>> =A0F:     drivers/net/ieee802154/ca8210.c
>>>> =A0
>>>>
>>>>
>>>>
>>>> +CANAAN/KENDRYTE K210 SOC CLOCK DRIVER
>>>> +M:     Damien Le Moal <damien.lemoal@wdc.com>
>>>> +L:     linux-riscv@lists.infradead.org
>>>> +L:     linux-clk@vger.kernel.org (clock driver)
>>>
>>> Is this needed? I think we cover all of drivers/clk/ and bindings/clock
>>> already.
>>
>> I was not sure about that so I added the entry. Will remove it.
>>
>>>
>>>> +S:     Maintained
>>>> +F:     Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
>>>> +F:     drivers/clk/clk-k210.c
>>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>>> index 88ac0d1a5da4..f2f9633087d1 100644
>>>> --- a/arch/riscv/Kconfig.socs
>>>> +++ b/arch/riscv/Kconfig.socs
>>>> @@ -29,6 +29,8 @@ config SOC_CANAAN
>>>> =A0=A0=A0=A0=A0=A0=A0=A0select SERIAL_SIFIVE if TTY
>>>> =A0=A0=A0=A0=A0=A0=A0=A0select SERIAL_SIFIVE_CONSOLE if TTY
>>>> =A0=A0=A0=A0=A0=A0=A0=A0select SIFIVE_PLIC
>>>> +       select SOC_K210_SYSCTL
>>>> +       select CLK_K210
>>>
>>> Any reason to do this vs. just make it the default?
>>
>> I do not understand here... Just selecting the drivers needed for the So=
C here.
>> Is there any other way of doing this ?
> =

> Could use the 'default CONFIG_FOO' on the CLK_K210 symbol instead.

Got it. I made this change for the clk driver and for other drivers too.

> =

>>>> +       writel(reg, pll->reg);
>>>> +       reg |=3D K210_PLL_RESET;
>>>> +       writel(reg, pll->reg);
>>>> +       nop();
>>>> +       nop();
>>>
>>> Are these nops needed for some reason? Any comment to add here? It's
>>> basically non-portable code and hopefully nothing is inserted into that
>>> writel function that shouldn't be there.
>>
>> No clue... They are "magic" nops that are present in the K210 SDK from
>> Kendryte. I copied that, but do not actually know if they are really nee=
ded. I
>> am working without any specs for the hardware: the Kendryte SDK is my ma=
in
>> source of information here. I will try to remove them or just replace th=
is with
>> a delay() call a nd see what happens.
> =

> Ok.

As mentioned in previous email, I kept the nop() calls as using delay()
functions does not work due to the early execution of this code.

> =

>>>> +        */
>>>> +       in0_clk =3D of_clk_get(np, 0);
>>>> +       if (IS_ERR(in0_clk)) {
>>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
>>>> +               hws[K210_CLK_IN0] =3D
>>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
>>>> +                                                  0, K210_IN0_RATE);
>>>> +       } else {
>>>> +               hws[K210_CLK_IN0] =3D __clk_get_hw(in0_clk);
>>>> +       }
>>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {
>>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);
>>>> +               goto err;
>>>> +       }
>>>> +
>>>> +       in0 =3D clk_hw_get_name(hws[K210_CLK_IN0]);
>>>> +       aclk_parents[0] =3D in0;
>>>> +       pll_parents[0] =3D in0;
>>>> +       mux_parents[0] =3D in0;
>>>
>>> Can we use the new way of specifying clk parents so that we don't have
>>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
>>> the core can handl that all instead of this driver.
>>
>> Not sure what new way of specifying the parent you are referring to here.
>> clk_hw_set_parent() ?
> =

> Use struct clk_parent_data please.

I ended up using parent_hws instead of parent_names in the init structure. =
Using
parent_hws was simpler than using parent_data. That nicely cleaned up the c=
ode I
think.

>>>> +
>>>> +       /* PLLs */
>>>> +       hws[K210_CLK_PLL0] =3D
>>>> +               k210_register_pll(K210_PLL0, "pll0", pll_parents, 1, 0=
);
>>>> +       hws[K210_CLK_PLL1] =3D
>>>> +               k210_register_pll(K210_PLL1, "pll1", pll_parents, 1, 0=
);
>>>> +       hws[K210_CLK_PLL2] =3D
>>>> +               k210_register_pll(K210_PLL2, "pll2", pll_parents, 3, 0=
);
>>>> +
>>>> +       /* aclk: muxed of in0 and pll0_d, no gate */
>>>> +       hws[K210_CLK_ACLK] =3D k210_register_aclk();
>>>> +
>>>> +       /*
>>>> +        * Clocks with aclk as source: the CPU clock is obviously crit=
ical.
>>>> +        * So is the CLINT clock as the scheduler clocksource.
>>>> +        */
>>>> +       hws[K210_CLK_CPU] =3D
>>>> +               k210_register_clk(K210_CLK_CPU, "cpu", "aclk", CLK_IS_=
CRITICAL);
>>>> +       hws[K210_CLK_CLINT] =3D
>>>> +               clk_hw_register_fixed_factor(NULL, "clint", "aclk",
>>>> +                                            CLK_IS_CRITICAL, 1, 50);
>>>
>>> Is anyone getting these clks? It's nice and all to model things in the
>>> clk framework but if they never have a consumer then it is sort of
>>> useless and just wastes memory and causes more overhead.
>>
>> The CPU and SRAM clocks do not have any consumer, so I could remove them=
 (just
>> enable the HW but not represent them as clocks in the driver). There is =
no
>> direct consumer of ACLK but it is the parent of multiple clocks, includi=
ng the
>> SRAM clocks. So it needs to be represented as a clock and kept alive eve=
n if
>> all the peripheral drivers needing it are disabled. Otherwise, the syste=
m just
>> stops (SRAM accesses hang).
> =

> Ok it seems like these could just be enabled once at probe and then
> ignored? I prefer that as it's simpler.

I removed the CLINT clock as it is completely unused. I kept the CPU clock =
as it
is referenced by the uarths device node. The 3 SRAM clocks are not referenc=
ed,
but I kept them as is as switching to special code for these instead of usi=
ng
the clock infrastructure would have just generated more code for not much g=
ains
(beside a tiny memory saving maybe).

>>>> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl-=
>clk_data);
>>>> +       if (ret)
>>>> +               pr_err("%pOFP: add clock provider failed %d\n", np, re=
t);
>>>> +       else
>>>> +               pr_info("%pOFP: CPU running at %lu MHz\n",
>>>
>>> Is this important? Is there a CPUfreq driver that runs and tells us the
>>> boot CPU frequency instead? Doesn't feel like we care in the clk driver
>>> about this.
>>
>> There is no CPU freq driver that gives this frequency that I know of. Th=
at is
>> why I added the message since the driver basically just comes up using t=
he
>> default HW settings for the SoC. CPU freq speed can be changed though by
>> increasing the PLL freq. Just not supporting this for now as it is trick=
y to
>> do: the SRAM clocks depend on aclk and PLL1 and if these are not the same
>> value, the system hangs (most likely because we end up with the sram ban=
ks
>> running at different speeds, which the SoC cache does not like). =

> =

> It would be visible in sysfs if there was a cpufreq driver. Can we use
> that?

I checked and there is no cpufreq information is sysfs. So unless you insis=
t, I
would like to keep this message for information to the user.

> =

>>
>> [...]
>>>> +CLK_OF_DECLARE_DRIVER(k210_clk, "canaan,k210-clk", k210_clk_init);
>>>
>>> Is this needed or can this just be a plain platform driver? If something
>>> is needed early for a clocksource or clockevent then the driver can be
>>> split to register those few clks early from this hook and then register
>>> the rest later when the platform device probes. That's what
>>> CLK_OF_DECLARE_DRIVER is for. A DECLARE_DRIVER without a platform driver
>>> is incorrect.
>>
>> I think I can clean this up: aclk and clint clocks are needed early but =
others
>> can likely be deferred. Will fix this up.
>>
> =

> Ok. Thanks!

I tried hard with this one, but as mentioned in a previous email, there is a
circular dependency with the sysctl driver which prevents anything from bei=
ng
initialized if I use a platform driver. So I switched to declaring the clock
driver using CLK_OF_DECLARE().

Note: I posted v5 but the clk driver patch 11/21 is "held until the list
moderator can review it for approval". The reason is the patch size:
    Message body is too big: 41706 bytes with a limit of 40 KB

Palmer: Who is the list moderator ? Is it you ?

Thanks for all your comments !


-- =

Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
