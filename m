Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F833C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:06:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E121A22D6F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E121A22D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DPA4yCYX9JvE+iKduhsp6n+M120dFF8P8E6Kr3Bh0R0=; b=RPBxYpqeNw2B8OydOFmJIK3jf
	cB9tcOpLswBbAJCJrJXhAsm6w7hABAac8PrEFP+QnP2OQP3+F6z10pNPpq0rGB2Du68aYFSftcnxU
	bKQFCVzBa4j3v7rQzjQXK7SJHK9INyrQW0EsrBG5A94slISDG6nvk1doMzgTBL1pGMeJj/9niHqNz
	io88O1F9F3vv2PPBe82Qm5hUoBRf8+H4Yd7xJo0hnxtQ/Zv/KPJc0yblHldBPGrorsDCiejj9+Led
	MZjKSz3e39xX5Nh7S55yik/VkfHQ9iOsnve9mr/CwzpIrnhtTX6EzkOMyAZXWoeMW4oQRDH+0hrl0
	aVsEAc1Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMOp-0002ML-NG; Sun, 13 Dec 2020 08:06:35 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMOj-0002Lo-LX
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607846789; x=1639382789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sSDFlHD6H4InA7Wd0Ym4wxySXjhK2Y37e/lvk4Amo7c=;
 b=ST4flfnO1ZoJt1bOMNMSLpwjm5kcSJ+Ex61wHtLtOhET0HA5YY5AucOe
 YJOyQMtec710UciW69YZm/pUMr4AUUwsuevnHeXfY+4SyQmwL0/1JDwcd
 znyLluQqDyZdjOEyI59x9ck31fXMNNESFmSdHJZp/Jh6MXLJBAAvnEonM
 TISVbv1OZmIxI37t/tzYGx8Sr7hkSQama2MK6BbpL3w3oSwpjNhfwAjRL
 c+uW216sLM816L/FZKJze3yMfxirMq3eYHjltTCPjGvyVi3vkjRIJYjrU
 w6t7eVdofQPzNSU18xVx9QksatqdcUjc1nnqLqlZJElOQRJXcPVL1NiEx g==;
IronPort-SDR: 8cLPGae0JAj163bW41WhsHFzmTvJ5P0Sm4+XefdGpfjCB7lz0u2K4PcrbINgNrI+dqBoTab5QT
 Xw1GvYM8awqEMF6wh4uS5rdn4apO/MoIxoFHQPAxAbDEanfNGO3Arq4evPG9wR1gxmFpcGhl8L
 hYqwblo0t9ZtYV09uCudkC062iWk9EtU3pyJDGWjDbq1YplZwp+6cbOzo/cVrVuAbOiIl/Wf6G
 epYGo7qCb5iL6E/bgRTU08fT5gWeR7lvgIcPznv6e7sfBkCqSabg4PITFEG44Vt5DpQrarI/72
 X/0=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="155068993"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:06:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmF4QXQd/tNJ/F3Aemwdv1WVwNfBMSYfpjxiUjKXTfXKE5a31h0ACOTFo+3apG4nceFUKbq1GgLE6lGp684MDqea8U1XJxWgr5hn9LTdfkwhcyNTFuT8xW3Ru9U/D7F0W6xHHiMKuV9Ad+RrHDSj14sMze9xaZvfI7bx7kMWA/n+ISTYZQ4xCyVeehoYRqVj2p3dC2P9pqTd+glWAWTT6kYCITmzi4mJ2EjkcFs5XmXZ66wO/FlZ4P7EOEXN6Xkzm7ucP7ZODCEvVv3EM8g2hpBA3m3Oz85gCDvfh1SCNYgKVw5G0cjYwN/4yAiTm9eoJtBnCcO6Dri6Ykeerg4Zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSDFlHD6H4InA7Wd0Ym4wxySXjhK2Y37e/lvk4Amo7c=;
 b=iirVNSulVgATDxbNlvX4yNQafjShyd+GLFd1u8k19W+o+zLyn5vo5SeGt8Nq/fU4LQnK1GnJWsWKLnsTmOpVJukwyXmWQFo0ZZZNUmWPlmByMF9Sqz92Fy1UJnKbX21mMG4jcyCmfMmiwMBUzFwl1NzcA+isGAn4QjRVdSCfVPKJkOhx9W+sHGsUPMOikNj52dev/uJ6M/wZ8nGITlEoF6QdjB0Z6YNeR5ljeOg39aiSfTqtHmwBPgUnJrwq4oUew8OWcyarHZ5bA8mF/g2A2LBVSpLMJD8PqcbXBSQ6bqlACwCUwgI01Qq/66u1MeLM9sgVgpFtyfF8OyBNDfjYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSDFlHD6H4InA7Wd0Ym4wxySXjhK2Y37e/lvk4Amo7c=;
 b=asf0GBtNYQnL50XecwMcbzFTb/+Zj2b3XI8FhymtRtTfXagEeJGWQ46szkV6FmQ+ZVnKNx/naan+K22mLdoAMEZD7Ufmv9zmqZe2a6RSXLOM7+9yYzh37mMd1Va9/O/TQS2i++3hVVZpjP/gseQms/oPx1uySUDXebUSdDRLP6I=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7127.namprd04.prod.outlook.com (2603:10b6:610:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Sun, 13 Dec
 2020 08:06:23 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3632.023; Sun, 13 Dec 2020
 08:06:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 00/22] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v8 00/22] RISC-V Kendryte K210 support improvements
Thread-Index: AQHWzv0+AkP/QAM3bkK0BMKIxWgl6an0jaWAgAAiD4A=
Date: Sun, 13 Dec 2020 08:06:22 +0000
Message-ID: <f47e089de657073d09ee5407af690e8f97bc6e95.camel@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
 <160783946780.1580929.13355022541956430021@swboyd.mtv.corp.google.com>
In-Reply-To: <160783946780.1580929.13355022541956430021@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bf2b4f3a-d1f8-4e04-0062-08d89f3dfaff
x-ms-traffictypediagnostic: CH2PR04MB7127:
x-microsoft-antispam-prvs: <CH2PR04MB7127567B93646D6A5D0AE278E7C80@CH2PR04MB7127.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7H0oMFSd0+3v0NvL0YfxLRybZ65lxkx+BT2A7Wy43qTf2CMsTAKbvvFtYn0vVj4LjQNewARn4KH4ilx2aEH1eTqgWwdM6FOF4ryue+O4TOf2dVeir7adoFfxiAAybFVqoJ9Jews1Lo3BquuarZLQc6rEY4pZ1/zp3dy9iKk9P2H0IEsPi6V+LRzgohKlqNjxNv7wHkDEVj/ZCPksHNKa4WAfFXT23pyV02rZ+6RkoL0dtft58PrggrzIXGcfPK8tdLEP39k8XO+wRk7nVNhRlS0E4ehhFW7hKn4tSrsPoBPNJ8NV/Hbp9Dy2hkaXiayT8ICJMRUHCYu5ZYT7JSRvZaz+q0FiUoe6hEXKGW8tj+7xO5uqIpWdCJ5/x5lTl5gVVqWnCj4Nxksi4IDSvG2Awg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(5660300002)(2906002)(76116006)(186003)(91956017)(4326008)(966005)(64756008)(508600001)(86362001)(66556008)(66946007)(6506007)(66476007)(36756003)(66446008)(6512007)(6486002)(83380400001)(8676002)(110136005)(7416002)(71200400001)(8936002)(4001150100001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q1lnNEJVNEpmOUNsbjhRUXpwQkVlcFJuMVh0V280NXBERlN1ZGxhclBuZnd1?=
 =?utf-8?B?Ky9JSk9xSFZvbFV5dC8yWSsvNm10eWxkU0pSQVMrOVpGcDRFdU1XSitpWVY2?=
 =?utf-8?B?Y2dlU1RBMnBkZzhyNjBMSU5HaThwc1NQck1YU2dYWkhhTVZpWGJ5TFhpbFZ0?=
 =?utf-8?B?OXdGMnowRjJ2d0JtOGZQUHFzVDNISU5BVkVNbXNrOTJTQ2l0cE5iQmQvZWFu?=
 =?utf-8?B?eHRmQktObXZBZ3JrbTVNWm5jUk80dzRjMjE1SFc3STNYT3hIelZUYjN3WDVl?=
 =?utf-8?B?NjBia3BRTzZxV0ZCSktOUWdNWFBQZ0Y5bWJub05ocWxPSFJYNnlQdUk2TEdG?=
 =?utf-8?B?Z081T3VMS1d2T0ozNWN4dEhLUEkzWCtiZTM0ZkZQYWY5WXRxbXh1R1JtQzlq?=
 =?utf-8?B?OXpVWTMwSXFyQ1hSUGVKbjNqQm42bHQ3VjJsVzlGUHBqUm1VUzdhQTJJSk5h?=
 =?utf-8?B?TExlMGVjT1hQNGx6eXhSM3JXUitXdWViY091UmpaeXQ1a2h5MVd6aVhFb3FE?=
 =?utf-8?B?ZURWVHkyRzlPNWFrZk04S3lpOHhYUnkzMjNBWDNOWUN2b2pnRUtDR0F1TUor?=
 =?utf-8?B?a2d6RU1xd01FdWxSSVQrZHo1WEVlQWY3bmhYS0I2QWpPV01YSmxYMk9Iamp3?=
 =?utf-8?B?WE5iWVo2UENpRFAzVnUyTXl2RFFWMnMycWd3QzBScVl3S1dQT3ZSZEFoMi9t?=
 =?utf-8?B?YmQyNUZQcVlza0ZqaDVJRDllWTd6Y1BuQkRvQ3RVb0c2QlY1THMvN25EQ0FC?=
 =?utf-8?B?RlY2TFZlUkhvQ281aTlYbzVqOHpaaTFhYW9scy9XSmxRUlMyMnExWGJJVG5y?=
 =?utf-8?B?Qzk5cUJ3Q2c0TGVja0UrMC9QSTZUK05nZlQxV3RFcGlYYnYyeFJIaENIQ0NV?=
 =?utf-8?B?WTNGVGZlR21BWDBBelBFczRSSEtDZTRaQzdTTXdqalAxL2lsaXdyZWdabG9G?=
 =?utf-8?B?SGFNSXdzVlpLT2c1UTdsdHpSQ0ZUeU9raUlIbFVrQWlzK0Y5K2dMWTM3VU01?=
 =?utf-8?B?TENSVk9hTUJ6R29OcmtNU2Y5dHZMUEw4Y2ZmNjBHbDJId3QwV2RYNGNFa200?=
 =?utf-8?B?TmQxYlhlamFieXpROFRHVjhLd1QyRFBxTEV5RExQL0FNamxPamN2Q3AxODJr?=
 =?utf-8?B?UWs3UVk3c1phTDZmc3N4aWF3c3picHF6cFVpeG9jN0kwQVJkRUhITXBZbENi?=
 =?utf-8?B?YUhWUG9OcFdiQ29EZ0ZnQ0NGbUFmaGZVdzJwZlp2TEFpQTlNV0U5cm83QkxD?=
 =?utf-8?B?RUJWQk9lTmpsSG5UMVZMVFRHTTYzVXNwbzdNejZIa2oxc1o3eFFKWlA0Vm9E?=
 =?utf-8?B?aGNWK3U2ZlJpZld0aUVIUllxZzdUR1o1TTNVWE96Q2hxNmdKZ2V0Nmk0aFJP?=
 =?utf-8?B?RnQ4WmhUV1JlMjQ5WlBwQSs0RkZpdGRjcEZHUUVFOWhiZUZUdkZFenlCQ01h?=
 =?utf-8?Q?i6U8rKqd?=
x-ms-exchange-transport-forked: True
Content-ID: <F78C1E0FF2CA1F4DA4B461A9A5121D03@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2b4f3a-d1f8-4e04-0062-08d89f3dfaff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2020 08:06:22.4945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2IaFZpWGM3ZA8uZa1rwAFYT0cmm6LslYhjv2UnLpNPNBM7QKwX1aQCFSirrB1yYwq8MaBsoD+GIvNr++tSeBVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_030630_085866_D94AC065 
X-CRM114-Status: GOOD (  21.92  )
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
Cc: "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2020-12-12 at 22:04 -0800, Stephen Boyd wrote:
> Quoting Damien Le Moal (2020-12-10 06:02:51)
> > 
> > Finally the last two patches updates the k210 nommu defconfig to include
> > the newly implemented drivers and provide a new default configuration
> > file enabling SD card support.
> > 
> > A lot of the work on the device tree and on the K210 drivers come from
> > the work by Sean Anderson for the U-Boot project support of the K210
> > SoC. Sean also helped with debugging many aspects of this series.
> > 
> > A tree with all patches applied is available here:
> > https://github.com/damien-lemoal/linux, k210-sysctl-v20 branch.
> > A demonstration of this series used on a SiPeed MAIX Dock
> > board together with an I2C servo controller can be seen here:
> > https://damien-lemoal.github.io/linux-robot-arm/#example
> > 
> > This tree was used to build userspace busybox environment image that is
> > then copied onto an SD card formatted with ext2:
> > https://github.com/damien-lemoal/buildroot
> > Of note is that running this userspace environment requires a revert of
> > commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
> > 5.9 development cycle. Without this revert, execution of the init
> > process fails. A problem with the riscv port of elf2flt is suspected but
> > not confirmed. I am now starting to investigate this problem.
> > 
> > Reviews and comments are as always much welcome.
> 
> What's the merge plan for this series? I'd like to apply the clk patches
> but they're combined with the sysctl driver so I guess I can't?

Not sure. Palmer ? What is your plan for this series ? Can you queue the
riscv/DT pieces for 5.11 ?

I will post a v9 to address Rob's comment on the sysctl and fpioa drivers
binding doc, not other with v8 changes beside that.

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
