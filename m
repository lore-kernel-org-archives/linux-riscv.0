Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57010C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:44:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E26902388E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E26902388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=wKCCulvCAEAD72YgEeN67wG2uCXLxxjWIBpQ75txQaw=; b=w5W8aEUx71JS1YL7pNEMH3Ppv
	2xGmxTBjcV+lDRb9/gAWN6UqOWldIFVqX8AHwGlJKwYQXxlXMA+MLddGYTCzzyRkt1HoA5yBlxjVf
	W38x0AeQyUn/eWNh2tZYBo1tNrX2zKrKNbdnNDkVJnN0wp6QIFee6+4f2qUS6B547COZEQnFb1tri
	nP0v+71RAtGZmc5A5Xn9YNxt0hO4xhd+eAywb768LezpOK4CKUeld6UGv+AQ/ikiBlyZKjvMzl7ry
	ywu8hszOUiYQmDSbooWVWn2NDZFODu7S1/nlrGCkG8TeCY/VzmiRHhZuGWUCBs8BNF4BOoCq/B/m/
	qBhI3A0rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpqlM-0003XU-6e; Thu, 17 Dec 2020 10:44:00 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpqlJ-0003WX-D5
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 10:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608201960; x=1639737960;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=3+2L+WFm9JClQ7Kj3ZHfGG4JIaF6Em0Tm17cIRTConY=;
 b=AiCYwDFNwABJrtLQ7T7oaSJ0nRcLChEGujMbupy12gq8k6ZtT64qWxUt
 9Nv9rxVk3zns7T4GUWhdSIJx6H1NyL/FnR+yLSkkHIyTkZLfL0QMj87Kn
 HRQkQAD8zYTj/+XiffUJw/FqjyfltRiJt1QMTws1Th6kErk5y8+7DV8IO
 +VlU3sa9vn9j1VwXhw2Q/E7PKSQbj1k48xSO1wPA/pDeyym4CrOO91K0P
 7UNCWHFoJg79H6wmjBX5xKYy9xa+g/h7ssE5ZA7ZTDXUppKw9oExAITgo
 L12M6Qn4453p3O5XAwz8OrQqfCjj+zOniK2OuesVoopEeTKlZr/Op0pec g==;
IronPort-SDR: clAyWmEI2Vg3f+XFawsbgKWrcAeSpcUNKSJ1uOG4gb7c8YlxTlNDaOd/99VcsRqp2K6NQbjJs+
 K8QmNyRoJOltzjIHUUE/pP0VSiCjXjYbQY9qraWuEMGtsytbbc9yNOgLKniKTcRqSCFl/jie4F
 IuOOGPr+pXOZUhSwDLBia9pDQzZH7/ZWqNYLmltWY67jtqy8CusMb15Mhm3Q8U8Ui0nEFVsxJi
 HRSd12oZJBapPUx3nSsXI6iO8tWTn1MYbeByrlXAbc6V9M2kBKiBdAHTfvj7zpulpcIGLfmIgN
 6YQ=
X-IronPort-AV: E=Sophos;i="5.78,426,1599494400"; d="scan'208";a="259145332"
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 18:45:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNuvWpp+Q1CDXXy/e3i5Le5uZIdOWgORFQzS0f6PpW/SsQhwBy+ORSpoWUrZTS0X4pTEQrMgBIOSn/RlGy21J/EfWE51kOB13/3cCagYmZEfPEUniVaqCAIYBzl91yUFqH8PmwPY6ZrioR7Z9i+B0y5AQ46POFn9NvbE4XufxPKCelu5qm9tkxDCqBAGSIhhePtSbFHJHPyz5mjOZBPbIbNMLqyG1A0h87aG6phgpj/EboqH2uKicS7hF5efrwFL8+/Mb1l0XwvXquxESMaaaSSMbM+Bw8ROdFuQZH5rxgj1bz3qL/++aHJaDxdjfMOhxbWgFJC9e3QKIA2xWrqUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIjNICjk1JeaMCKTyNInsjBCAPyGZRwcrzdTU2CUlkY=;
 b=GvT6ED4jS2LB1akpD21mUlgO71qgoSyGn8MpPpewCnJ/AVRYzgpGL2CyWqBfHbf73x8Z2M01HQ9hqjgLp8KMccl6wk6sN8I7cVnSdDK6PZSehyBx+qfn2pQUMVZ2BTNgQWNZb8t+7cYsvsPoVYMkMGf+b0pJUGQMXyG3tvA8+/IxtZRgl849XxDnHkfbmHoi9iSU/MuGKTsXmzIQdPRrP2ZiZqTkv9kXbKRX+YmTHG7F0ohs9JqKZ4dt9I+V9sXiLiTLkgHHiiKcNLgS63DCzJpsbr/wRMMpmG23uGL/3wGjAahZLGMraGMqvZLefk2FnmavVOhSwYKVfyCJRcTeMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIjNICjk1JeaMCKTyNInsjBCAPyGZRwcrzdTU2CUlkY=;
 b=Fp5yOWs7M/daqLpzlCNIi6+ca8D4XhtwABv4sr4pZiu59WqHAPRL3aVJHO+TlYIYnq0ndIJN7u0rd2UGQnzjFKS+FAcMiaFgwffa4H1317SUVMQErWSabMHSRRYcSfk3B9nL7sVFxBlzQ4xjknBMLn3L4E1trOvMNtF6LWV7qU4=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7093.namprd04.prod.outlook.com (2603:10b6:610:96::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 17 Dec
 2020 10:43:50 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%6]) with mapi id 15.20.3654.026; Thu, 17 Dec 2020
 10:43:50 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk
 bindings
Thread-Topic: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk
 bindings
Thread-Index: AQHW0VcKSUc5JWucbkupBqEzxYwjig==
Date: Thu, 17 Dec 2020 10:43:50 +0000
Message-ID: <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
 <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
 <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:a1c8:1127:b41f:9459]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d91577a1-5891-4889-1e91-08d8a278a446
x-ms-traffictypediagnostic: CH2PR04MB7093:
x-microsoft-antispam-prvs: <CH2PR04MB70934DF1E1F882EB2B84581FE7C40@CH2PR04MB7093.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EYdEQarey2HbFCeOUnwGVHU9STs+YIfh8G7XrK5vf66tZS3YsEwv44YdPY+J2AUCuFR758IbhjMpJ+WenQjzO22fdfVnoToJI2JDEveRlw2RXTsHgxUf/pJiBtb+gFAc9I2IvRkPPhCBxKWBALc+U5OkpN4EA2JgIEKFKJ+deTeui/8p+ZoawrlWi8EBgJBqxuwP99fcDUKSw9baOh+ABuosAyrgXgq+NMlZA/ZXyDRMYu7NnuOsG3q9GNUVCJbNKeqOzhO3HcqWLooQIsCFufBdXWN6yPzSF7Ozau6br5Ygb4D3vQVTj5AB9/IP5J3z+shL3+H+zWvF8MiOi1FOPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(53546011)(71200400001)(186003)(6506007)(8676002)(4326008)(52536014)(478600001)(4001150100001)(7416002)(86362001)(5660300002)(64756008)(83380400001)(76116006)(33656002)(2906002)(66476007)(55016002)(7696005)(66556008)(8936002)(91956017)(66946007)(316002)(9686003)(66446008)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4vvh6DOd1DoRctY0+ILw3tXjbMhkC7ePrneeZu8Nh+yuPcCS0wBpUpC//Khi?=
 =?us-ascii?Q?E9rtIICHUFOQToY+9JQSAjxpurrYRuknDwIxsgoxHQC//LZ0deubFjqKFmi3?=
 =?us-ascii?Q?SiNW4VQ9daFfBdGMNyoJU0FqcJCwbFfuylaMJnJK61v5FEsuBXspNyja+la6?=
 =?us-ascii?Q?ZPK2LbRfiLkTxbttxOwoMhQXOppDMkJ4JNwWmWXeBeynSrRclGnwBRJ/d7vG?=
 =?us-ascii?Q?tk9tSEZmTHEQu0YAhtB1ykPajd4ghcloDldKdyvhRslEeU+SpReXFZ/AQ2ZX?=
 =?us-ascii?Q?5lnk70F9O8c7sPmcHF/46Ih7Whbdca2k2XTeI3EN1ZN/VXirI3N4Qifv8cXM?=
 =?us-ascii?Q?Uh9p6xULFwDlLCGKC3HmWAF3mDyl1W09WUaNZ/2DGvHgV1RTiuBzVkIXYY7B?=
 =?us-ascii?Q?O+zGLQrSXD72gdYicMLG4up7Y5NxQbJ5R/8pP2U+ESVdP1CblpO5BTBxKFTz?=
 =?us-ascii?Q?Wq7BgR5KgISzCg6JYn9KpZ8AQ+NHXYs8Fb+X+08RzaE/LgT1JwuPiSrILFYy?=
 =?us-ascii?Q?yTUZYyoU4nZoFMCBIFPD0HIXTLsGlIix2h0/NX0tZTUkR7XYq/1z35hMsmcD?=
 =?us-ascii?Q?Pwf2yCzkr3VHhLT4lvYT3R/Ac/sxbPGlreAPA07pRKcl38+7dac/OYq/ujnu?=
 =?us-ascii?Q?bOq5xMpS7Y6mYE6H4WvTayPv/zWv2HIn0PiXjGQTfu9ZbqptvHpDaGHDNNoe?=
 =?us-ascii?Q?HTNH473Qlcxe+pfGcoH/oklIiQstgUaOOyjpqzJgfmND9+/TMcKBe2zYAjcx?=
 =?us-ascii?Q?INzDyzO/bzN6KXr/Bwmn4J2+117tcAfa0DEd0dHsXnj/ilF0AUkWYqS3dE2C?=
 =?us-ascii?Q?sc3qLes6dHiLg0v74HyxKsyRitSbWvjii03Oq4wXliwfGn1pCRctWzhBxAFJ?=
 =?us-ascii?Q?ajR0mQl3IWjAPu2bcHx/Qp8VDxC0uyRewaRKsf5DGOq5IBx6Z1+oHEuT65wz?=
 =?us-ascii?Q?G/QhFLNcQzogzIg4IiWKordGG2ucYPErlqz6AswW/2F/eq9dBHYMWH8zHXwm?=
 =?us-ascii?Q?1i6wNyxH7hft58Gx1EsH1r+VU6/VgWAI1tllwvnsngSO6pYtZzzuX2R5PcbM?=
 =?us-ascii?Q?jOOi3b5a?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91577a1-5891-4889-1e91-08d8a278a446
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 10:43:50.8410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zz62QKZZI1YDsKPY7b6+9ZXWGncF89QqKpWpNKrDJC3OP9pPyDRr9rf4E8337DD6JDWo9qbr/VtFKNlZ9JMTuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_054358_649829_FD52EE72 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/12/17 19:17, Stephen Boyd wrote:
> Quoting Damien Le Moal (2020-12-17 00:13:57)
>> On 2020/12/17 17:10, Stephen Boyd wrote:
>>> Quoting Damien Le Moal (2020-12-13 05:50:42)
>>>> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
>>>> index 5a2fd64d1a49..b2de702cbf75 100644
>>>> --- a/include/dt-bindings/clock/k210-clk.h
>>>> +++ b/include/dt-bindings/clock/k210-clk.h
>>>> @@ -3,18 +3,51 @@
>>>>   * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>>>>   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>>>>   */
>>>> -#ifndef K210_CLK_H
>>>> -#define K210_CLK_H
>>>> +#ifndef CLOCK_K210_CLK_H
>>>> +#define CLOCK_K210_CLK_H
>>>>  
>>>>  /*
>>>> - * Arbitrary identifiers for clocks.
>>>> - * The structure is: in0 -> pll0 -> aclk -> cpu
>>>> - *
>>>> - * Since we use the hardware defaults for now, set all these to the same clock.
>>>> + * Kendryte K210 SoC clock identifiers (arbitrary values).
>>>>   */
>>>> -#define K210_CLK_PLL0   0
>>>> -#define K210_CLK_PLL1   0
>>>> -#define K210_CLK_ACLK   0
>>>> -#define K210_CLK_CPU    0
>>>
>>> This seems to open a bisection hole. I see that ACLK is used in the
>>> existing dtsi file, and that is the same as CLK_CPU, but after this
>>> patch it will change to not exist anymore. Can we leave ACLK around
>>> defined to be 0? I imagine it won't be used in the future so we can
>>> remove it later. I can then apply this for v5.11-rc1 and then merge the
>>> clk driver patch in clk tree.
>>>
>>>> +#define K210_CLK_CPU   0
>>>> +#define K210_CLK_SRAM0 1
>>>> +#define K210_CLK_SRAM1 2
>>>
>>
>> Patch 6 of the series removes the use of K210_CLK_CPU and K210_CLK_ACLK from the
>> device trees. I added that patch as the DT modification proper comes only at
>> patch 16. Maybe I should squash patch 6 into this one ?
>>
> 
> Preferably the defines are just left alone forever and then forgotten.
> The dt-bindings directory is almost ABI and so changing numbers or
> removing defines is hard to do. Usually patches in this directory are an
> additive thing.

I just did that. It works.

Ideally, patches 7, 8 and 9 need to go in together with the clk driver patch.
Since the builtin DTB patch precedes the clock driver patch that touches the
sysctl driver, I need to rework it a little, keeping the
SOC_DECLARE_BUILTIN_DTB() for now. And finally, a small DTS update patch needs
to be added too for the sysctl & sysclk nodes update. That would make it a 5
patch series for the clock driver addition. Would this work ?

Or, you just take patch 9 (clk doc) and patch 13 (clk driver), slightly modified
to move the sysctl register definitions into a common header (currently part of
patch 7). 2 patches only, without any other change, resulting in the clock
driver not being used until the rest of the series goes into 5.12. Do you prefer
that solution ?


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
