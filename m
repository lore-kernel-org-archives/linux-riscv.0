Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5C4C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 01:57:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBDE72253A
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 01:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBDE72253A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/6UFjCeRVfKx/Pumux2fYNTW5I1cpjAjsYgYuMwE3Kg=; b=S/fb0mBI9dguQmggA/ZOJ47rM
	hIK451wHAWVt/b5gKjtXirMEmKkqhMe5xCD1dZ09z8psg8CeteYneD7+yL5UZhyA+E31lv0KyK5r5
	cOSj5RnY5O1SlWsvmvOwa6JnWHavgBREwb6sME4krTOHC2xE4fYQxewzVCvkLr8zBr7IlOry+zgS2
	1u+B+Jl76BAD/o4d8Y1Wu/5ZDLmjc49RcBDAKJGkcMJgQUzQ4kVBTgWVibihDgY+Cl2igS9pvmGNi
	Hz+phOLluXh++6bRtL86PjOOkEh8WyLFW5fmWxqSAyVxz9CaRp/GzsCIDmDXlxnY7RE9RdySfxDvG
	zyPVg7EfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kymS5-0001wq-IL; Mon, 11 Jan 2021 01:57:01 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kymRz-0001ub-Ls
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 01:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610330885; x=1641866885;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=f0rPh6Pd9jRXtjlqWo9vX6T4minD5LjxUw3tpOChkMI=;
 b=LCKKj9lKB6Lx48WdsmIedkMz2mW5LGLB18Yu5WgMjCDILckddyIVrJf/
 TElGcXQ06p67HCWjxRTd8dswGLW9r6pE63IJLyUXL0xF1EwsIadmdcR2p
 Yd93RrOeAOa6AJClFTNaDNcJXUU3DfZ9opmEnew+o7jKo44qYEYsPYvw7
 X3wxQB4DLWup5m7kVghz5kodcYV+RpDjTAd5WxX7ZA/SeN7YIBwJZ+1Pp
 uTAiuHEzzwVHKfyv8B6Cn5OAX0kTgOnn0DdFVpaDSQgissI6z8mRaYN8E
 07YTNfljRvI0bHTTJkre95zcpg9mSzcQRXINlqNnQJOaVE5Ltw8+8irgu Q==;
IronPort-SDR: fh9O0W+mqQw3xsDISlAHy6gNckxLCYQxMoJm8vjzMlyG61bLaBy5Dnyhg3QQPmxRAx097/5Xzt
 0lp3HlV3qNWv7BRb2EB+FS2sdMKqNUEXJOCBX4baH3jIUgImlbsY8+Mg/n/1lUO2MzWvh3udwk
 szo8ao2sYUka1iW23CHCnwLkSSYAu0fyl75eZoBb3f7vfE5GgK9RJcDK7lwwNtZa4bhpiyGfj1
 /9Br7iQ/afke14POixhLIHC8bi5JZHwoz7IVdDWaA/w5U2BXuFuMXAfX6IEE/agO33+rkltkb2
 yPI=
X-IronPort-AV: E=Sophos;i="5.79,337,1602518400"; d="scan'208";a="260991677"
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2021 10:07:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuiWksjs68by85LpjnZTHIL5sRnFSO/z1Y/T4UkfhXiV8RsxZ4drbCLnRmpLTrQIaE9zWj0A97EOOM6DKc6zjfwo66RPD36SwC15BdSa2Uyoq/9rrfInbvdglYVuCMJVwanWWJs/k41SryKdaSX4vmk9MCNEk4JQuKWsTeCy87NTlymkNG54Y3/rQqGbyhQRraOmnzhGsCw+AHB0H2cSiR1gewUex09XAMLr+qrgNWMS3AxlCQvy4iNjhJCr7RcvDX4vGyL2/UIqFGDJY6y2KmPbx2nl302i66otMAeYLIRahi4xmsPUl7PQUr/jK+Jb2LEjYoVdEnqvczoKaQTsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0rPh6Pd9jRXtjlqWo9vX6T4minD5LjxUw3tpOChkMI=;
 b=Au2C771Swylff38SGKaoZ24C1ZYZq2jpurUaHihJyB4/Ob0aTlJWRNeMDy7ToQ3MjxllYcM2EUotqR5TtnL58XhnIFpvWm4wqp9AdL9hr8OQGHSMWEApjUTdex/ONqh1nyZwo3hZzZ21XPZDipfZMpS3fEGTJflZ8LLACBBlYlQ1XiZxCAFR4tB8ZJiVhl/K5Qiq/SkFILMqXaCxwk1kklI6VTszYWUX4EdU/njUggf3GVn+MR7s5xUfhLBVtquRpjc2NUMeA94aHLFhmqiGsDjCdcajO+fLVKyzJf5isAp0lO4bfPY82uuEpBskkafdQ4t4mTMXn66Oi76dfgzrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0rPh6Pd9jRXtjlqWo9vX6T4minD5LjxUw3tpOChkMI=;
 b=h4drj8DakahnJQqGw6GgQK9//LxD5VNQZRXclcjIxJr6biuebiLda8Y+NG+2uMZ9hon19jO+k60pl7DbNjmK3icMvo+zJjEnGuBMbjKwtzTQUbPt8ExSiAtwJb/A0pIxVoCeIquTzPcTLyb6T2mu4+4FrotrmBZR7DxTK7zqqok=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4979.namprd04.prod.outlook.com (2603:10b6:208:5e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Mon, 11 Jan
 2021 01:56:46 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::2dbb:7e01:f076:eca0]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::2dbb:7e01:f076:eca0%9]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 01:56:46 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: Re: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW0VcBx/1WqOKLiUuqE6/7D5Ba7qofuA2AgAIfSwA=
Date: Mon, 11 Jan 2021 01:56:45 +0000
Message-ID: <7e0b4efd305d2c5deeff7dd263234a32aa093f58.camel@wdc.com>
References: <mhng-a7443f7f-42ff-4835-9b25-be8f91884e04@palmerdabbelt-glaptop>
In-Reply-To: <mhng-a7443f7f-42ff-4835-9b25-be8f91884e04@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 (3.38.2-1.fc33) 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c52a4ad5-0dd5-42ff-3918-08d8b5d426b8
x-ms-traffictypediagnostic: BL0PR04MB4979:
x-microsoft-antispam-prvs: <BL0PR04MB4979FD0A95E90F02743882C4E7AB0@BL0PR04MB4979.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kt9V5y3K9Sj0/s6NcbVcYpxGs1wZg4nj5ijMTqDZDIMAVrYQUEQPaiQt/9/8CKEF9UQJ0dpFoxD6fE4Qk9dkF5/5GZXdcFrCm8LS0mRrRdz+TqbnO8Jtfd3rUE0ZN4dfNEYnL8UaGWBw/WbW3pTubP4YBlier3jN2v6njM6ToKqnJMyHGWkf1PACr/icHw5RyQ807ZYigd4xRuGoupOLr3gg7W2cPrAaiwpiGQvsu9gdkPOQbeFQAIXl7FThtYqKpbBsXyJZZGT6WaLurhBO6OY1Tt+dJpqUXC5thTY+/r7vTZaeq/8UF1NAVzMavUu2vjMkbml/JLoPatOf2xPorWsGOEUJC1gk3PFoLteW/Lqe3AHc2fNE2oJN4YT89RWZ7WVAwQ9J7V0I9so02znIWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(66446008)(2616005)(64756008)(5660300002)(8676002)(66556008)(86362001)(6916009)(66946007)(4326008)(66476007)(71200400001)(54906003)(316002)(6512007)(8936002)(83380400001)(76116006)(91956017)(6486002)(36756003)(2906002)(6506007)(186003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UUE1bEtCRDZDSWNYUC9UYkJENkNWMXlFODFEZkIwYnlmZTRHaWNMUk1BOXNr?=
 =?utf-8?B?SzZVd0k5c0h3Um5WZFpxR2JUcHZMSHRuOFBsQUNzMVhSN2JlUTB3OTdnYW1t?=
 =?utf-8?B?cVhJWlFqNEJhYmVxQWZOR3pyWVVCYlFrT21VMVZYcE1vOEhaMzlGODNqZjh5?=
 =?utf-8?B?QmltVzdBT3ozYlNBTk1hbkFVZG1ER1hrbnYrb2RQN0lyMkFYbFEzTWN5N1RR?=
 =?utf-8?B?RnJYVDRxdy9majAzMGlNK0tFeC9YdU5veWZrSzMxemZhajE4Mm9OV2J4OXFQ?=
 =?utf-8?B?bW4rTE5HL21ybjFKaUgrenVuZ3IxSm5Obi9URzUxT3doQWZScHlzZXdLQkRY?=
 =?utf-8?B?ekd4blJuMnZzZ3JacGtURWIxL3ZLWWFEblBJcEJLaXZXTDRVTVlHelNLeHFD?=
 =?utf-8?B?MTVVN2tFbW1SY2N6dWJ3LzJPZ2NnMjdYVFc1bVBZWnI1ZEFYa2RIYitXSWg3?=
 =?utf-8?B?c3M3Y0gwU1BuMWJaN05iOUZIeSswNTB3NmU4djdMc0Jab2lBWkJ3L1ZtRlA3?=
 =?utf-8?B?aFIxK2J2MHFFL0ZuU0xpdk9QZnhDSkJwcnYwUEFhR2FRakhqSW9wYi9zRVg3?=
 =?utf-8?B?Y3ZnTEgwNVptVlBxeFh3RGtveFhkUTRnZGxDVWo1MFRHbXdGeGxsaVJTa1Vo?=
 =?utf-8?B?T1dPYmVabW9YSmtQMWNtdTNWaFoxMGZaTCtQSk9od2d0djN2VDBsZWc4bWND?=
 =?utf-8?B?L205OGFaZ3BKWnErdy9NaXQyd1lRVFZpQldPSUpIOTlBR1RwK3htVkVaTHV3?=
 =?utf-8?B?dDZpbE80Q2gvUnBnR2xuR2EyYWVyN00xUmF2QlBMaVlraDhJcEU3NUdPeWU1?=
 =?utf-8?B?MGxUU3Izak1wZE5HU1lzYzZvejI4QURTK1Bmc3FXdCtBNFhRblZMRVlpWTBG?=
 =?utf-8?B?VmdXc2xRYVA2NHAvTW0wcmVZTWxUMktYT3AxZXh1eFlpUXA0NGZWdU82MkE4?=
 =?utf-8?B?ZU5VbkZ3bVk0THVhVEFIb0hpcVpxdEpTQThGODU2eGVlREdYa003UVBzTlhP?=
 =?utf-8?B?SXU1ZkRWVk5iUVViYlJ6N2w3NmV4ZW9pSFE1VmRwNlpFY2dDaEFBb2xnZVpU?=
 =?utf-8?B?cFZwMXpodHZKVFFEMmh4Tmw5Yjc1d0pOT3VEMzhhamZxQTR6UmVkWUdzWXBQ?=
 =?utf-8?B?MnVKSkd3N0xrOTVHTVF5N2dsUjVaNG84QXpheEZkVXphcU03a1VQcFIxMW1s?=
 =?utf-8?B?a1ZjMjdhbE1IVTZoYm1OQXRFWFE2WTk4SjZQTjg2bWFhWCtsSzlKU21PVGdz?=
 =?utf-8?B?RlBKNG8wSStUdmdoL0hjZG9JVCtJc2IrS1JBYkl4NUFuMmVvM3cra2dXMmtw?=
 =?utf-8?B?cHNSMGZ3d3VScVgzVHJzRmF5WVdSeUN6cEF3ampPVmtpTTNuaDFBb2VnUmFZ?=
 =?utf-8?B?c1hRMXhjUEl6c1o3SHFqTFFiN2F4VWozam0vY1dwMk5lTVVKZnRzUk9lNnBZ?=
 =?utf-8?Q?duExwech?=
x-ms-exchange-transport-forked: True
Content-ID: <3BE20E3766420C4A934C78CD1FEE4B6C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52a4ad5-0dd5-42ff-3918-08d8b5d426b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 01:56:45.9012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+ho4B7nj/lK1In3NI4OMRTr2iFc3NbCwfZiB27PtaAdg2UIPbaSLP/iwuK74fG75ls67mTJWnukvIuiSnniFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_205656_106793_52E4ED11 
X-CRM114-Status: GOOD (  43.34  )
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
Cc: "sboyd@kernel.org" <sboyd@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2021-01-09 at 09:32 -0800, Palmer Dabbelt wrote:
> On Sun, 13 Dec 2020 05:50:33 PST (-0800), Damien Le Moal wrote:
> > This series of patches improves support for boards based on the Canaan
> > Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
> > already included in the kernel. These patches complete it, enabling
> > support for most peripherals present on the SoC as well as introducing
> > device trees for the various K210 boards available on the market today
> > from SiPeed and Kendryte.
> 
> Putting everything together like this makes it overly difficult to get things
> merged: there's some actual fixes, some new arch/riscv stuff, and a handful of
> drivers.  I know we've been kind of mixing up the SiFive and RISC-V trees, but
> that's largely because things have been pretty quiet and it's the same people
> working on everything.  That'll probably change at some point, but it doesn't
> mean we can just start mixing up everything in here -- even for the SiFive
> stuff, we usulaly try to do it in the relevant subsystem tree.

I know that, but for some drivers (e.g. clock), there is overlap that would
prevent compiling if not all patches go to the same tree. And for people to
test, if not all drivers are in the same tree, nothing will work (e.g. without
the pinctrl driver, nothing device will work, even booting will fail). That is
why I kept sending everything together.

With what you applied, only the clock driver and the fpioa driver do not really
belong to the riscv tree. But since you queued the dt-bindings doc patches
which add the headers for these drivers, it may be necessary to keep them in
the riscv tree to avoid compilation failures.

Stephen, Linus, is that OK ?

> > Pathes 1 to 4 are various fixes for riscv arch code and riscv
> > dependent devices. Of note here is patch 3 which fix system calls
> > execution in the no MMU case, and patch 4 which simplifies DTB builtin
> > handling.
> 
> The first three are on fixes, but the fourth isn't a fix: it's a fairly
> significant change to how portable our kernels can be.  The old scheme allows
> vendors the option of building systems with M-mode compatibility, this new one
> doesn't.  That said, I don't think anyone is actually going to build systems
> this way -- we really should have had some sort of mboardid, but that was shot
> down in favor of some sort of platform thing and it's unlikely we get that far
> over there.
> 
> I'm not really sure I'm ready to throw in the towel on binary compatibility
> between vendors yet, at least in general.  In this specific case it seems fine,
> though -- accross the board we're just spending way too much time worrying
> about the small things while we have way bigger problems to deal with.
> Obviously it would be better if we had some scheme to handle this here, but I'd
> much rather focus on the basics.
> 
> I still hope we get to the point where we can have binary compatibility between
> systems from various vendors, while still having reasonably useful systems.
> Unfortunately we're quite far away from anything like that, so I'm fine taking
> this sort of thing as that's as good as we can do for the forseeable future.

Yes, I agree that working on improving binary portability is very important.
However, I am not convinced at all that trying to do so using a device-tree
based environment is viable, or even desired. I think that true portability can
only be achieved using something like ACPI or equivalent allowing run-time
device discovery. But that is a discussion for another thread.

> This is on for-next.

Thanks.

> > The following patches 7 to 11 document device tree bindings for the SoC
> > drivers. The implementation of these drivers is provided in patches 12,
> > 13 and 14, respectively implementing the SoC clock driver, reset
> > controller and SOC pin function control.
> 
> The numbering is off a bit here.  The clock stuff has gone in through that tree
> and I'm fine  taking the reset controller as that's been reviewed, but I don't
> see any review on the pinctl driver so I haven't taken that yet.
> 
> I'm happy to re-send that patch (likely with a more appropriate subject line,
> as it's a pinctl driver not a riscv patch).

I rebased the series on the riscv tree fixes+for-next branches and changed the
subject line of these 2 patches. I am testing that now and will resend soon.
But so far so good. All is working fine.

> > Patches 15 to 20 update the existing K210 device tree and add new
> > device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
> > MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
> > board from Canaan.
> 
> There are tons of checkpatch warnings in these, mostly related to compat
> strings that don't have binding definitions.  It looks like there's just a lot
> of stuff in there that doesn't have any support on the Linux side, my guess
> would be that the best thing to do is to drop those until they're defined.

Yes, I am aware of these warnings. Despite that, I kept the undocumented and
unsupported DT nodes as having the complete device-trees (soc k210.dtsi part
and boards dts) constitute the best documentation ever for the SoC and the
boards. Most of this work come from Sean (with some corrections from me) and
extracted all this information from the almost non-existent documentation
(basically only board layout doc is available) using mostly only the Kendryte
SDK is really hard. So despite the warning, I would really prefer that we keep
the DTs as complete as they are now. This would also allow us to point to
specific nodes that need support for new developers that want to get involved
with riscv (mentoring program of the foundation). These boards being extremely
cheap are the perfect platform for students and hobbyist to get involved.

So unless you insist, I am going to resend the DTs as-is.

> 
> > Finally the last two patches updates the k210 nommu defconfig to include
> > the newly implemented drivers and provide a new default configuration
> > file enabling SD card support.
> 
> I'm also going to just leave these out for now, until we sort out the above
> issues.  Let me know if you're going to send another patch set, or 

Thanks.

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
