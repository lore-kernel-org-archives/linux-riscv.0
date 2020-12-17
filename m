Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB058C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:54:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 582382389B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 582382389B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=cUS3MmqAZi/667uKDmQgJ1KfE6M1AJpAvvgn/XFyCYc=; b=vHRd/Yk87evyO3qeoHZYxbWD2
	Y1qBL0mDLjnYnNq41ZzVxZF2PpAc24yiknrrRPYCPH2KFUvPiUOvJ/LEsbvXlPTDajXjKvL8jwSwb
	gZ4CbybcpsMg+ovMSSHef+qdhuM1LZt3mUCKb/gFWqDmQ6t4VMXUYS43bMrC+F9sql0tfsQ6vD/Ic
	KQgEjvN3+Wy/au+WNS3WY6Gm+eiqh5v2tz8Uz23uaiVXOAo2Ws5Sc3LURrZs1YUh2Ieh8ZByZZZxX
	dg2mVB31kwGDmVj2FxS4KJBn5CpelnMwC/HrsqSJHcTCqm6tjDUtBG3aSxr5Mtw6eR1T4Te6S5IUo
	v+BCaUBrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpqvL-0004fP-Fm; Thu, 17 Dec 2020 10:54:19 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpqvJ-0004ei-3y
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 10:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608202458; x=1639738458;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=wrslA5yGzniNN2fioiYF4K7f0Js6DOHlCYn+nv5EhS0=;
 b=OFi4CgMQ2NwAdAi1SNdG1HtX8uTE4MoTs35BC0VyCMKmbYTITMCH1BvD
 3uSd0Onx6ZGZoIuLMo3U4qG/pu5Y6+9aVr/MQzXr+XhhpS7r/Ur2Pr5Sq
 Ie3s2HZrKZMUfsh61HUKr4cb4tJhjvF3QHpxLq5tYzcyfMoGKUee1lEgu
 47vIe+Y0wd9IyvnMCrUiRH7K5FqaIbX/AUYhN4BXwQNoMJjXDMynBF7Th
 0Cx8ciMtU8DYFr0xYvgz7VH6f4c9OddvSu6guXSh8VbZaCu57ZdxyXjp9
 TaSDb/U+YON9H+0YPB/eon44wKlJw7uW36sgzYd6kwweBzT0bYMqqp2OP g==;
IronPort-SDR: YNK5mEuetaAmYhER9RHHcF/gWgB95H+88nnXXcl25eMhM04SLQVvvt1JmZBbwA8yRICtfwJ97J
 AaDDQLtxRbqNDvnsN1fhc2A2lFdLD8cwCnZo2Pvfx3JTZkVEE/RkDn4akiZ1ivHPTUGHnD5Xxd
 GFXKgTI93Sv+h3hnfXbejy39318012rfAxLfLEZgnxl2Rnzm0phizNOCea5vF+u+1zFr9MS3GB
 7dHR96kp4ZuUp0C6Uv1EAcxYleRJT7rQA8AnP8KLDPrMJ7eCbp3mzpShFje234v5yhd3vtJsWF
 slo=
X-IronPort-AV: E=Sophos;i="5.78,426,1599494400"; d="scan'208";a="156572802"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 18:54:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl05Xji2e6CKR9RfIrHx/hwo3Cq8nNRY+o/0MxtY2u1IpXP1BzyWF/eohW9Dt4BztBShTArG0FogjjYW+1Yrnn3ERofPmiVdhe9smLwn7KTDGyoE2WFtvsUFnvBYFdvw4Bvc+i0LEMyC0khCs8czfomYHzqqU4dfgeMZqsEzj4Og7wG2+NwCqJ7Qft16gVY85LJdNFNgExrkb2y/yvX5l1drdorRdocC1muoJJZbzepQxuk/2sEtmkYavdqio0Yj0NbhtFR0GS07S/v8E9nANxgiay/E2Y6RpPhWaeJYYNVPxv8RfYlh4OCW3jk4UIBbv4zaJtC8murrglefeHgMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrslA5yGzniNN2fioiYF4K7f0Js6DOHlCYn+nv5EhS0=;
 b=Wci8Sm5ZfFU8f3+Mlx+l+HX5ED0ngPG7CwsBu6qvY4gqCHNQqnXSsu6ihthkbqk19usJgEtmiciMdlmASdbtrZgLKjWTsxp3ziZ/OqOifnKAZmVZBvtCcKiP3f6CpCgXcLY/BynexZQX4nnflq8bv2Mn9cbI8KOaVVl+y2NLCOk6b/afn/8I+EcZm8bHh0WR7aVgYOTxKQydtAlNO4jwBqZCmA0Z/S9z+T3rR2hJ+XzRol6YMwq9kjCjbKrtZGEZd4m4u8JPZRrWwLqdsDWKTFvU5GldTJrezuTtFdkWuvZLIe4cTgU/QHq24HJv445ZlN2U65qvHhHMgcRJWIzUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrslA5yGzniNN2fioiYF4K7f0Js6DOHlCYn+nv5EhS0=;
 b=afUuSWlRZK3nZY45MY4h2Z2TzigDebN4SwZ6B/jXQYLZbnGe00PPVdH3MwEdyjFya5LII2s1tapY5eKtVSar4bM3jpug6lqXSkR8kFJrCrhsH0KeKhyZZrD4YmNsOQFd/JTlPj6lbo6hadWnOONJ7a/8nACaYNYDP81Xo6DVKGg=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6492.namprd04.prod.outlook.com (2603:10b6:610:6e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 17 Dec
 2020 10:54:14 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%6]) with mapi id 15.20.3654.026; Thu, 17 Dec 2020
 10:54:14 +0000
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
Date: Thu, 17 Dec 2020 10:54:14 +0000
Message-ID: <CH2PR04MB6522CB93958F090C1075A9CBE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 6bd9b7e3-4faa-45ec-49d1-08d8a27a17f4
x-ms-traffictypediagnostic: CH2PR04MB6492:
x-microsoft-antispam-prvs: <CH2PR04MB64925535031F0ABAC29F57C3E7C40@CH2PR04MB6492.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Fyf2Wt5Tj/VEfmsIkg3v4SOhHsJ4sSPt44JGavkfKIG0fQ3urx0UyB4ff4ff/bXr5PXlvOkh/erj2P+AqHWG1AYIbReq5rjwrHiLS+WjXFQjRyuOhudj4v+qRCK6q7zp4r6SVCmWlUAlQf1WRZ32BUwQHJfyOHoL5Mw1uqORDT4VoOuS8c0Y/VN6etEk5mPzbXRoOyJF1OtJVZrTBh0Do+Co01b442Lhg1Zb8TgdPLHJvjAvnjd5hZuUKC1CfNL6rdWHmAATaYsJLPV7mEO91lAp2Iz+/kjtFE1zqO1BlqBr/R8YAhxDDK6xSDK3p0CQ6B1fRjnECZSLRo8uVMntA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(66556008)(52536014)(86362001)(66946007)(76116006)(110136005)(478600001)(8936002)(71200400001)(64756008)(4001150100001)(7696005)(53546011)(8676002)(7416002)(9686003)(6506007)(186003)(66446008)(2906002)(83380400001)(316002)(5660300002)(66476007)(91956017)(55016002)(33656002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eb65U630cM13PsL3whdeajfA6/w1TUnWXW4gHOfnJAJdZtdLTiRIUPM59xnS?=
 =?us-ascii?Q?G/M3B3WEW3AUrryDkSdRBkcPMknwHQe0+4oViZpcesBzjM1ptV7dRg/ZYjVY?=
 =?us-ascii?Q?33JZTAUDzcT+poASTRKDNpvoP/NDhofeu70a9n7UuXl7mG86ACAAsc0AxsnR?=
 =?us-ascii?Q?VtkoStiD3ccHOzy+wmRf4TPR2tvslRddd9p9Fnt7ZNYGMzHKsOiCZtuJOThf?=
 =?us-ascii?Q?JrghV6YrJKnIJGl7sS+JkjB2D9eWU9ilLy4utmrDtJtPJo7MU248AN5XtC6g?=
 =?us-ascii?Q?48am19I38mJGitpqT2pOuAyDNjQqEPGTuCEOLwwGWFgSUSkKcAuKwMQRx94G?=
 =?us-ascii?Q?ucLjFuBdi8olyaDPsWHRgEqj53qzDvEh4CEPol7b9J+q+qTANXQVCmvpz4I+?=
 =?us-ascii?Q?RtySiLjU+j0udmiQj+awFUKRpnQBbZHbu7QC/lxP0fNknytjFXLKjk1LzREi?=
 =?us-ascii?Q?hFeNyOJ3h3o0hPKOl7XuCiLkRxUDMAgLq8ue5pCH5b9yrxG8eg7Zo7bIDASS?=
 =?us-ascii?Q?IJHUVNJSh4TEe4lziUbKK8ZNYESzk9iTR7w7qQ/ZutKqNS6b4Mkrsgfs1MaN?=
 =?us-ascii?Q?B8LwXoU/b2Qqec9xVVWcbPTKNUdBhNNswHPU42jcsjp4/6Qj9B0NiQj+XHSY?=
 =?us-ascii?Q?A3HaRKpxXX92vbH4DlpaWR1y2BCS1aArqB2/qaOPZIBuynCSlATS01jvLKDh?=
 =?us-ascii?Q?NgE83XL0q0/i7br1D2lcA74y6pi2Ce/iOACoteHDwSlCHc2dVNDOxPv+fHUt?=
 =?us-ascii?Q?JqxJHLapHINFP6QeMtqwsdEHRORQ5z2zj8nFEIa4OAFYASK/bNiZSxKl808l?=
 =?us-ascii?Q?cn2p7pdDi+0xmqZFAM829Q3tlwECOXUmgLYD3XW5bv0wMVEmSQuxWHf7ZTbD?=
 =?us-ascii?Q?Gmo2hPmWuixCN5vqARpnxN+CClFkOYSpOj0AFweO925/As/KQ0r/5r9ZVFzL?=
 =?us-ascii?Q?Pu0N5cz6H4q/jkBxCC4wO1ujw3uhammW5cIENwv8uFEOISX5NdVVfrw0Q/SN?=
 =?us-ascii?Q?EEoaSIWlAjUyFNnKN0+MpqNsm8jE2F5NJ6axd/d6+j2aFAZXuQZYBVDwKhlx?=
 =?us-ascii?Q?4dAgR/zb?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd9b7e3-4faa-45ec-49d1-08d8a27a17f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 10:54:14.3833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aeyTd4UdZYfOd5eAgCA2j2X82uCIj/nDb7AK4p+CrSfgXNTtlQJafdC0UbME3ynjaxobydSBgP+jHK1lI3NPRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_055417_377306_6B56F2CD 
X-CRM114-Status: GOOD (  17.86  )
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
> 

One more thing: to avoid dt-binding checks error for this patch, can you also
take patch 8 that adds "canaan" as a vendor name ?

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
