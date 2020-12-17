Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F663C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:51:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADA123899
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CADA123899
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=NI/p3iWnoqQ+ncV0huJbK1b0VGdT1Fgp0nX5KqAyJCg=; b=NIl2YEHR0y4xUDenBbg/+/5o8
	XvxlNDjFdg2lxVmxxZjIGEtcaTxl+BrjgXenECwDHRDBbDAWBXmkLYHgX9vAXtXm5t/58x+p6u8z5
	zITZinY4Sb8IQeCtQfBQ/TluB5ozzX3nw8BJ9VhTJJcrI9A+sHxMunKCEosz/0HfLsWPgJ7FYyUyr
	l7xHmWzomwi62bKPHLdp5j9oAqsTx7nuE2eJtP/NAh3R7l/4zoNmLZiJu5ab7pdcuJK/C1HZ8uF7z
	VusI0b0SCmgSifshplrQGytg06BIjZPlmcW4D1EB1E2XrnsFGSCH+cyLBD92MwKlFPZrcNt7TqA8r
	nFGhKPOMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpqsY-0004CT-Dj; Thu, 17 Dec 2020 10:51:26 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpqsW-0004BU-1W
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 10:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608202284; x=1639738284;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Mea6mi2Qjl1ntkTbEoSzSsFIfsvwQiOUBfIAECLKn6U=;
 b=eiJrxVcI0BYPfnoNgFNw2ne+N+ZkNioVnBqEJrZ93WGcOA24mYE+NY0+
 N3UOmiDgFl6YdlcIr64Kd9oi7gi8pKtdVt9JqEMSoJHjnhZfkeuf9EtJJ
 kuTvQyJCaSpGNxDKiq+05I/59HuiJbEVeCKDE4medfseR4fpKgm1NYa0r
 mOOVb4BF+WVdKpnlGjDveXtR2y3cwFOKVVTXfUgDu+xyOvQYZT0v/Ac/c
 5ODIk1Bm0JoEnnpT9Ta6+3RHNEMNaty/9e/tHOIRgDl86RFDo9rRntfby
 MeliszhusmLVM3A12x4m1ltOaX5U+8vtU+6ojzuU76GFr7tfntMqm9NAB A==;
IronPort-SDR: PEkhZ1XdACEp4QxVbKXH5mE76NG6BEXRwyGeDNvWixkJELn6OUJG7mYlTNBloBBdhzBnqaOkCd
 9mhz+cENKkj4Q/Xembg4c0MlUdPvWSjvHB3lAPw0DGzxBFcF1Ci30E8GHNKPKuvlAZsYjGLNOB
 LT1d5fQMp0CNxIRoDT4cvXHttrs89cssl25eQn0C9JKU8WwpZRrbpYVJ+OIS92NMa9Zs4maYts
 4sM6ZCpERNEgTJZeRST5ucSig1gRVlzCeFYwTe0ip0KBDjIkr28QVo0JxHBNTlCyrZROCw0W+i
 cdA=
X-IronPort-AV: E=Sophos;i="5.78,426,1599494400"; d="scan'208";a="155390685"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 18:51:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Acps/0yA2UKW1fkXcqxdQhwJC5UlCBcfy9yb4KQX3gyFau9I6Gyg14OCD/MfJhE4PhknGF53Kr89Sxh7nL2eJZMlpdctkCfNYsI0go9+bHvnr1QhYOto6ovUdq+ohdoMaipCsK6NNvMAQL99iW+Q/P8WbXf3a6K7i7crmGkrQQGLhqt1s9bceB+gDAr95ymFxgrUi4CKM1WI8BlOudVsT83VBXvlx5N2Caxat3jiin1sUiDBoNvM2dqt8XcYySmE1FCXkDo5oXYAlcmfVEIVD+WVAQ9IFHOuZ/GzQSIbv0fK0EOm6+xXxt/Wi1KYgchrd2+f/JF5qZHs4oiLmwgdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mea6mi2Qjl1ntkTbEoSzSsFIfsvwQiOUBfIAECLKn6U=;
 b=H+XPF0DrPDdnZjMOocYsS0wELNYva2biZ8DNjGfschRTgX5ZV6L71okGBSKddLStrp3LiMQYFSJPMcXjhZORUs971LdbYE0dOgCXlNBNWeygsDUZgAqHENDmM91UxIF/x9AmWMegn7od9ll2IuEAOW5Zd0Is3ph21glsjdtTM0v7eqLHOzETMJlsDEBybJRO084U7iONEiQe2xqAR06CJ7AoWarV3GdChY0IVlGjtssVEfzRNPfOGwqLVLt94kKu8b1/lM4ERN88W9Dvq09OaxD32IwZCt93xndgBMX6DdhSktwshcKjlb7JswszlTYaGYr2dgyjzF8/me3Cm6Sl+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mea6mi2Qjl1ntkTbEoSzSsFIfsvwQiOUBfIAECLKn6U=;
 b=eCmGj/SXsEx2uarpX5WFEsO4loJEUXT1bGpKhSROR/mg+om2c3Grd1R9vsivQoF9Pw6asGzpOWNTPvnrWu9f2mhB9VcTmvoD82NVjuIm9KheP/cRyoPlYm3mDwq+pxexYEhpdtSp9M5LaGGq2kFicnNwkeiarfIl+IdDVtYHFfo=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6492.namprd04.prod.outlook.com (2603:10b6:610:6e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 17 Dec
 2020 10:51:20 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%6]) with mapi id 15.20.3654.026; Thu, 17 Dec 2020
 10:51:20 +0000
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
Date: Thu, 17 Dec 2020 10:51:20 +0000
Message-ID: <CH2PR04MB652284F1607FD2A29275693CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
 <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
 <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
 <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
 <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:a1c8:1127:b41f:9459]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 26f73fb1-957a-4e50-ffd8-08d8a279b07d
x-ms-traffictypediagnostic: CH2PR04MB6492:
x-microsoft-antispam-prvs: <CH2PR04MB6492A812DE52DD4DDC7F091FE7C40@CH2PR04MB6492.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9M8wJiHt2eL1HzeTDwZ3oRpBBDRug9G+EqyMI/r8fls8f4AM+ViBfEZtvqIX5GeDbjVc/V7Ik8MmUYilgXm90L+y66+aidxu/GMlEC7BfqZJwlHLZfQhqkcv/X6AghD1Rcr0/Z/AAGMqBIBjtbpbpLlmMWcXKhLX+U68vbcxE9WpiNAls1GSRvJ/OXeO/g9Q/o9sjFH2Njp14Gk4Y114/eGQRo6KiRgBgOiR8NswFunjhs9zy8pDqy2vyNl65H/PHlgFnGDBbB0jLwc0IILK41Us5vOPGQZ2/OvGM87V5CFePwgsYt/x6ymo1zsObxYGaAaOCOeiDwKy49mAkggRwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(66556008)(52536014)(86362001)(66946007)(76116006)(110136005)(478600001)(8936002)(71200400001)(64756008)(4001150100001)(7696005)(53546011)(8676002)(7416002)(9686003)(6506007)(186003)(66446008)(2906002)(83380400001)(316002)(5660300002)(66476007)(91956017)(55016002)(33656002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?g4VJt7iaiIUZXukOo76kKD8Vo/QpEKVJybsgm2pNE6dYRUZVhyZKAsmqucoO?=
 =?us-ascii?Q?nRuzVA8s12Xp+DeAju4niAVftRZJNDXnfQdh8B0cTZqyjr/Pk7gKWs6/BMRa?=
 =?us-ascii?Q?7DMENZzTJkbGDsMCSyzMHmP7dNpBwbgkArFOAK1c4+gI5zX7j7LDGnzq9qhK?=
 =?us-ascii?Q?DduRLNLsjM8ooOR5XBH8On9iUFpWVqTQ04XGgusqK9aR9iQJigMYzx20RIEP?=
 =?us-ascii?Q?Rxlap9NgahW6LU9/3LosxLKoeXsSpD6qroW5maHPf7yC/OK5fyUqrZbpxoq/?=
 =?us-ascii?Q?XaNmF8i6A6bCk7ZHxurVkuiLCDivvXJIkKnqEf9zOnvxZ6iE2TkAOg6yHMm7?=
 =?us-ascii?Q?LsBMKIfHPS1v0SDWXGRp6HmHR985Ica6WXO6A0zqKfnNe83ReKWYTjn9tOl4?=
 =?us-ascii?Q?vvsg2N3yPY126yz9rT2JVQnMoflt/6J0NYcQqjs3mfypC/Ge9TTfCge0qUpX?=
 =?us-ascii?Q?Mj1U4ZGV/rnp7qLbh8zzfx6q8/G4hewLhPSSDd4p+oCivcRHdHnAu4+8wdix?=
 =?us-ascii?Q?cchE2xHbMC4zxpEV+Wds8KnkZqVg00P2YpeZySdSwFkoh1wlL7tXkRn5QomI?=
 =?us-ascii?Q?RICHTrfFW2sEIO84JuY6kO/Fj00YD7ht1h4sSClsyaK5Af0VCraokIgjI3AC?=
 =?us-ascii?Q?IxWtRunAOnybc9gWZCOWx3/T7bdqBXfN2wwkCyv3QdCBEnhQSUsCNhVx+DZU?=
 =?us-ascii?Q?hPE3nZm3ipNR5WYZa6cbAz/fsy8C5/USLKPIjMwhyzGgTkWIIh0xDZPK7eo0?=
 =?us-ascii?Q?d2gw35zH+S1xT3zeT8/P0wY1bjfTuah30Acp1o4ZvZb8HeBaekXIKdVmrksP?=
 =?us-ascii?Q?P6VILGyAmlLntHYaNwhL0PY75LgS046HMdNOHM63agjAseGo6U+AUx9mH1Qc?=
 =?us-ascii?Q?Ps8HjDq/RmazygMW5BZHvl0mBlGryR7iHmURIHYJgpw3b5JXuEYaWTCyxezI?=
 =?us-ascii?Q?djIiqhcBnqu+mFFHaDrQsq1hEFzJNOQmvVN7ZZkfT5aRuyDqYsNDE9Og3BZp?=
 =?us-ascii?Q?c0BLEkfqhOONjWdZ1N+KGqlCoYe3yJZIumH6KHMS7Ydp2EGXtRd/+sIaPwUc?=
 =?us-ascii?Q?z1JGyf7E?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f73fb1-957a-4e50-ffd8-08d8a279b07d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 10:51:20.7948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoUc0bzXdJhX4GKHG33bGrctguS0l2MRgtB3objsspWdF0fJoujoHT6kGabE9A4c2l9zbWUpEEXzJdsdvslR9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_055124_264536_FB51E896 
X-CRM114-Status: GOOD (  16.41  )
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

On 2020/12/17 19:49, Stephen Boyd wrote:
> Quoting Damien Le Moal (2020-12-17 02:43:50)
>>
>> I just did that. It works.
>>
>> Ideally, patches 7, 8 and 9 need to go in together with the clk driver patch.
>> Since the builtin DTB patch precedes the clock driver patch that touches the
>> sysctl driver, I need to rework it a little, keeping the
>> SOC_DECLARE_BUILTIN_DTB() for now. And finally, a small DTS update patch needs
>> to be added too for the sysctl & sysclk nodes update. That would make it a 5
>> patch series for the clock driver addition. Would this work ?
>>
>> Or, you just take patch 9 (clk doc) and patch 13 (clk driver), slightly modified
>> to move the sysctl register definitions into a common header (currently part of
>> patch 7). 2 patches only, without any other change, resulting in the clock
>> driver not being used until the rest of the series goes into 5.12. Do you prefer
>> that solution ?
>>
> 
> I was thinking of just applying this DT binding patch now so it gets
> merged into the next -rc1. Then anyone can use the defines because
> they're in Linus' tree and wherever the dts file ends up can just base
> on -rc1. I probably won't merge the clk driver until v5.12 given that
> the merge window is open.

OK. Makes sense. Sending just the clk binding patch then, with the K210_CLK_ACLK
clock definition left in.

Thanks !

> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
