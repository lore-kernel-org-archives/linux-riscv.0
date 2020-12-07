Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC5BC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 09:55:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 999E32310B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 09:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 999E32310B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=G79bbJKcsv+Eeg7TqmcCHmnvnX8i6BK/KQmF3nywiTY=; b=mp0GsBr4ZYdT6wLikK4ysR73+
	JPO5/iDJGEqap/bN9ySSf2Q6tIOBzEGrsFFJHvihVtMUnCKtPtCaYdrOZFjsS0jd2kno9EyIm301r
	PfXFIyzrmQDTaHyAjy3cF+Rax/eW+a/PYYyA9qI23lpbZTYp94r7kmBz3QVAXsYldRciuThbTHFpO
	QgocG8L2k+CkYx/2fQ5A/KSnVyau7j6ivKVxRsOkvfGTPlCBCE2cNrq7PNe9kzX9hu+AqxrmrVhql
	Fcsz1ghzRhScPcQQzm9BqBe7ndKeADQP22UUuiWgmySiAITdqkiHXSnzjrzqyECyDDDkNvEUZ7kBn
	RjFT/VCIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDEi-0001rB-S3; Mon, 07 Dec 2020 09:55:16 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDEf-0001qM-KM
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 09:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607334913; x=1638870913;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=tkPcl1LWYOb/eN3w+vUvPt3dNGN04JC+Gpzxzjdb5Zk=;
 b=Nql6rwZqdx5NpCzWWSJt6Pn+yMQcZzVYxoFxNFIHNAtuoJKzjT/LR5lu
 YdoHTnxC+PE8xF4lp17iIIksPRXUXNIUQcv/yd9hPeRCZtHZoKygLnhoa
 9PZoxJg2qSOQozYsZgBbcA/brLeVNS0tPOgVQviWMyO6ywmnO7yER9P7T
 TbAXGDaWZRGUPZ8g7VvUIEfJ/EtFlhxd91g4NJWYt/jxdAYIZQgS/gNfU
 QsJBeLdHn6dFTXH1CH8G48o7zKiG+kjh8ftPB593oM2etcQQm/2u7hXny
 Fsj5PkUDdTGvBC1LE5JQZX+A5cRNKKDVi+W8dsZozTo8NO6E3WiL4qRqU Q==;
IronPort-SDR: v+xQNgb5Ikt3hVmprjRBD3oaubN9jzxjF79JgEHk4h2vKUBu8Auq8tYGWj121Gc9uSngrxMMP8
 wRjS34zif4krdryyTYOtsoifgK7qA/r67yIpiquVfwT3zZ3zPDOxO1UxhqMmHMjQISdFdeK671
 bXkc9OlslsW23l+HBgnO1FX3GSPXlKxZFQezBfG8j3E8GfAGiGGtRVmZ0Aqu6PwGTWpBcZrDwX
 wip+8YbSMN5EUbYz1raOJvJiDwwhWBlJnyeT2RtAHamgIiFc1GcIqWGnkxbAY3F6u8tQrno8Qy
 lW8=
X-IronPort-AV: E=Sophos;i="5.78,399,1599494400"; d="scan'208";a="154559295"
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hgst.iphmx.com with ESMTP; 07 Dec 2020 17:55:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQubJdm8UZUVSeEiKFJu3c7a/oQ6PwPrn2Q8DyW+pgTjbbGAfJtc2oGgcQ+fpOKFemmQYWCiK9g4/F80+FxjvIH+8tTk43oNc/uGGmov0/Qu75GCygxmnojkIc73UFG+Cn48UI0taHF+r3vrPE6q2u5LkzsezUSo4jiRLSfHihhzXOEVaAxWDuVg8gp9X4BsDp6RTXcak1Z+6y5pHAzBkgMP3+KaCqFOIyqYAm1+SJxWvlZDxn8MC+ddFlEjnZmjid1qeGCuHOH7oUf0nfapzknWRrLlLDyFmyVGWkR5lSPQIOb3QusxahmDzlPpkNHC75BKOZ/jvOmxOKgJHrtiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deWfXJN65LhcEZomlvy3s6QiXUEEIQNE1ThA9p7AlFU=;
 b=SWWpk4q/UFpMIhXkd4+EVuDyYfUhWsz15iE2AqnVlLkkcIL4FwS8Hu4gF8AQKE8L8+rbmdgFVJ6h9cG/ZV/43qBAvXT4tzZ28uGTd0f5M9DSgGt539qtiGji1dqcKjyrZUg7+xlhZqhXRg1HQHavh4uq7JXsp0eW6FMVy06o9DENGIoH9KOVqnFdAZ6i3Y8g2pxkILkZENevehkgfGBa0Qvgyk3vi5bKMjnOasqDP2i6aA+WQSzivNk5BooP3yqDb2Y0Bwxy6n4cvOtoo+/fgZESqn4HFrTCkKAeQBo8BBLp5o54k9sAYaUrAX83CnGgursKHbvCW11bcw0TcUcvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deWfXJN65LhcEZomlvy3s6QiXUEEIQNE1ThA9p7AlFU=;
 b=pHfi/W0nFyjAe+j63EZf2FCCPt07xp/mmJS7G7cgVRc0jFAzo9hw0P6m5vGrFdEdXPUu1rOrAi86CFArl5HF9bsCxVaQcYhb8gnLJq0raUSrl1CKxZy4NWiTbLPly+ZFhRRhn3yEfUtrPfHJniDGe9XoBLwxOXiy+ihAZvfdIjY=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6901.namprd04.prod.outlook.com (2603:10b6:610:a2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 09:55:08 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 09:55:08 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Topic: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
Thread-Index: AQHWyFrJ31Bqsdz07kaNo2YIn/vMLQ==
Date: Mon, 7 Dec 2020 09:55:07 +0000
Message-ID: <CH2PR04MB652207D253E79755D87F55DAE7CE0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <b5eb9c289fe58119185550bff7228501d95b730e.camel@wdc.com>
 <CAMuHMdX+grQf=naU76Edvhbjap3BEayjDs_Rhkoy4FFfOZcTZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7744e798-48a4-446f-86d5-08d89a962e02
x-ms-traffictypediagnostic: CH2PR04MB6901:
x-microsoft-antispam-prvs: <CH2PR04MB6901BA8832A948F3CE333121E7CE0@CH2PR04MB6901.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MidacgOkQhns4a6RTwxJD+mZHCQJl2lMLV0XqE9BKHpBxR7Y1/b6AAMfl12yf5wHncsYCe+Yi29KAfZetOviqRf9xs64JuWiJ+e2/CliFBk550EWzQONOgArzRiQByDaaE6XFXa/A7iR4WBN3tEzX/Tc8WKgI4n8pIZT2y5XHpmahv8xEV4Ean5OPCglSXhmaA4uHs6PJ8PgYbAzpjmNwPQzuU/uGKadD8oksP5Bq4u9ZGT7+5aObJzScnbcodK8qw8nr53idy16KEbSNjiU8AALTKh4de5mZ8QD7i6WD9XlM06jqUzo1uJr5nFwlXeuXNuNLlpuYPBs81fmpNsVxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(7696005)(33656002)(54906003)(86362001)(66476007)(9686003)(66556008)(83380400001)(478600001)(2906002)(64756008)(8676002)(55016002)(4326008)(8936002)(76116006)(91956017)(66446008)(71200400001)(5660300002)(186003)(7416002)(6506007)(66946007)(53546011)(6916009)(52536014)(26005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ITAW5HnUXiwltb/Ea0ed3yHq7LS7q9Vd1cm8Vil5bDpLi39svmD40WHOofpc?=
 =?us-ascii?Q?rm+Uzw8MtNOH6TCKkoI7CCKFmVeCqvbZ5eYYoi8Na1O4GJWqTULxJTFOcq6T?=
 =?us-ascii?Q?ZGcqFA5y0vFP2JvDa6PkPAOc0k9GJu7gPqna86SQDhXuuKSbE6vOU8XSRfgw?=
 =?us-ascii?Q?nu4PkkacazJ1rl3iWkF/IVqvnfqLpmGy9i9IO0LQK0JogOsEFPO5AjR02ADy?=
 =?us-ascii?Q?6imqcdcw65CRfQ9WaMp4AiDYycAoSovrwUEt4H+idEgcat34+cu9c3CQMHG4?=
 =?us-ascii?Q?Nr3RTDRBnGpkNLSxuYKeRjab2W4xJL4YZobODc0kWevPiPXNlktx6n1bCuh4?=
 =?us-ascii?Q?4ovpNqpSrHc+jgyxGkTlLs2enFwD2DyK5c7SnMlh4UG4MO7WAKk8+SN5ugKU?=
 =?us-ascii?Q?bhRj4PfUJp1aGyYF0eklnx8o7BNAjo9dJkHyiPchn078lHOdUE9CbHuh6C/c?=
 =?us-ascii?Q?GYKbZSoOJaya4iTl3QikJJdR/w1qvTV4ipASAhNpN++3zqlL3aQ4PhKlUusY?=
 =?us-ascii?Q?Mcevcz4T2vzOn89nCMma5NUzOo0GP8k/kKeUus3wzYwZ8B2PQeJwTYrrhw3c?=
 =?us-ascii?Q?iUChXoNQoa61VGf3DKcpRRtXvYpEaDa+5r0jQZ+ADGVg1FQUh/2Fre6boE/c?=
 =?us-ascii?Q?MxBCXvavxBvyMhM04MF5wzFcR2CPTUh3EH6u19A0AUzuIbdIFDRn8AFMRr1H?=
 =?us-ascii?Q?ewygpKKCyLTgChXge00BBDfdaDQgFpuUlBmE8bBF55gl72Nf6Z6+6Cyns5N+?=
 =?us-ascii?Q?DqJmoBGbF8vEJnN/BNu/JiTluW9eETq1sIZdP3bXQMjlMl8VoKbSXBp/BrB8?=
 =?us-ascii?Q?ZztOWylb/clCNwWk6ieXW/N3W+0PWfEfVN6ocvf3oHXjoHQXV9QR+0l+4O6I?=
 =?us-ascii?Q?8R734XlNNJqoNZ9APQ6/BrjzUBOH0uf0ZyBWj6x4Oe1cLlWd9/PzLjaBlcvU?=
 =?us-ascii?Q?O9t0gCw4wzmhXe3K7rB+WjM7vRpvzJgSEYUBVuOEiWnJwcOY4Dv4OAEbMqZc?=
 =?us-ascii?Q?sjGu?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7744e798-48a4-446f-86d5-08d89a962e02
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 09:55:08.0086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nkq9Fb1pUblPTGjy0jN0rr/defKuJo/KUFIwwnj79hp2zTHZoDlueH2RdkApOJYdzI7OjfKTvvFHvn7bv0QiwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_045513_858272_77523431 
X-CRM114-Status: GOOD (  17.99  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/12/07 17:44, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Mon, Dec 7, 2020 at 4:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>> I prepared a v5 series addressing your comments (and other comments).
>> I will post that later today after some more tests.
> 
> Thanks, already looking at k210-sysctl-v18...
> 
>> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
>>>> --- /dev/null
>>>> +++ b/drivers/clk/clk-k210.c
> 
>>>> +       in0_clk = of_clk_get(np, 0);
>>>> +       if (IS_ERR(in0_clk)) {
>>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
>>>> +               hws[K210_CLK_IN0] =
>>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
>>>> +                                                  0, K210_IN0_RATE);
>>>> +       } else {
>>>> +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
>>>> +       }
>>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {
>>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);
>>>> +               goto err;
>>>> +       }
>>>> +
>>>> +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
>>>> +       aclk_parents[0] = in0;
>>>> +       pll_parents[0] = in0;
>>>> +       mux_parents[0] = in0;
>>>
>>> Can we use the new way of specifying clk parents so that we don't have
>>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
>>> the core can handl that all instead of this driver.
>>
>> I removed all this by adding:
>>
>> clock-output-names = "in0";
>>
>> to the DT fixed-rate oscillator clock node (and documented that too). Doing so,
>> clk_hw_get_name(), __clk_get_hw() and of_clk_get() are not needed anymore and
>> the parents clock names arrays do not need run-time update.
> 
> "clock-output-names" is deprecated for clocks with a single output:
> the clock name will be taken from the node name.

Arg. I missed that.

> However, relying on a clock name like this is fragile.
> Instead, your driver should use the phandle from the clocks property,
> using of_clk_get_by_name() or of_clk_get().

That is what all versions before V5 used. But Stephen mentioned that the driver
should not, if possible, use of_clk_get()/__clk_get_name(). Hence the change.
Easy to revert back.

> 
> Stephen: I'm a bit puzzled, as you suggest _not_ using of_clk_get()?

Another solution to this would be to simply remove the fixed-rate clock node
from the DT and have the k210 clock driver unconditionally create that clock
(that is one line !). That actually may be even more simple than the previous
version, albeit at the cost of having the DT not being a perfect description of
the hardware. I am fine with that though.

Thoughts ?

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
