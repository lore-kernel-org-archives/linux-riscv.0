Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AF5C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:52:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C99264F74
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 12:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C99264F74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tJsaCSaNYTbp67TU5ocu4fRUng9vUHCiIImdvmmNlgE=; b=CsC18CU6lMyrqtwPitIkdj/qN
	0Se3xPZjxEf9WGH+rsc/o31S4V/1j2tnc210PVJxodeMKYbqHXRXbzSOYG1GMFZOtki3HQMki9AYB
	Qb86UWOCCiJq8TFt8kQt7xAB2sOGtl+79GtBHibuPw8GUrVkuljPKE+gGt45vFO3ngNbcJ59HKC18
	pN5WGemrn+TCPiCXQfkGtg44GbofxAwaIZMu7m+IXiythcJzSnawMzKVw0wDMj7iMyrnEt1zll9Zm
	Buy5YYSWoo86WtaCVWiK/bvp2r8xUgXnHz3jXhnEkS9luU0o7pNt1HE73Ql2CT8B+66KC8mZ15eQA
	cijeXJl/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Hdu-0004VX-93; Wed, 03 Feb 2021 12:52:22 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Hdr-0004Uh-DP
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357036; x=1643893036;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=I0Zs7Mt/4P9NK3GvbU4uQYW59R+axVhnhP5g2PcB7No=;
 b=OzZsyGra6DzEu2TXCVo+ImtX+JxTiuM8Oo31yAwcl3rMguQZNmgtZ/Sz
 lOOA9SVpi4++2EEWIHnuyw8K0JOY8ESSa1Yefw98kwDBnRZ2X083ppOl7
 aBIeLgFQBaR3fSTlUBK/YRJPoQiAq63I2s+GOIHN6qZ/7fwWzmIeCaP5e
 p7ZmWzexxF0S/T43nf61HdXNzBKuL9N5LE6Gg8T9ZfWIzU37xeXCPJ30e
 lmnWkKehomDiYONtHKGvTdYr+ykoe118ga5UoeJ3EQVqSrdfgjaeb13pg
 FrLgzqC+lbTrJz2bIwJIm1PGYw7MHFR+15BbyrBrJ1jtnz/PB/g70wOBW A==;
IronPort-SDR: mG958t7pgFgSCsffddx4tmFWtB6jG7cA9eOdUJGGGn45pHHum3E57YDWqFQqTaQuIevGwLLo8W
 kAMlH2GwezikR3TOp9OA4XpAVMDhJm+4OvM3rLo9iMm54a5cz9WJ2liDx5JUK9wxo7dHLSBwKo
 6CVE3GWv0cE6egq+04CIaSksxsYTRdkA+ATvDfIUho03lnJRaqtnrgcy3qm4Bo9Rmi6dFa5ex4
 pVBFm9ISZLTwEa9bnPs+te5K8iXeUyDv7yK4y1ZA2aYpj7zGGVpZ9LyOm8a8jXERreOd3t7FC3
 C08=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="263106599"
Received: from mail-bl2nam02lp2050.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.50])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:57:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwn0p06brE+mJ0O7nvEriBvelYj0GRcvuJTacuXw9T87wAvMkmZDZ5tfZTru2gdhg6rpyLbbLZB3aLrkq5NKeFggGqYHBZROrHdR6enDgzG4XXUq7FsTGUUOoj2LjQHOgHCmoJ5UJUoFHlSgfCpsBUqxuaMdP9MniTEOxWidW/3oH2ubrKPkp6Q0d40IccAoU1HGzb40nhjIyVzAraJivRV08b8+EV0F3VwJN2Qc08ZWvtRpQ62//FNH/GUx5F4k/wG2tX4mDDbHJNW13Mw3sf9zZxScaMiCmteva1YnjLqw0tdMIYECAlB1QarE6YaXmscPn2/y9VG8ig1nCRADpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0Zs7Mt/4P9NK3GvbU4uQYW59R+axVhnhP5g2PcB7No=;
 b=UOFsemo34XhEu6+OXuTQN3Cv/gs52fSFQlJp7C71S4enAWI4ObW2PZU2A+kcoa1qwL+L6CQijNzxPssoxbs/dVXVkO+ze4uS+aj8AQ0T3zzihDqC9fwxpyxuzY0npqT5goPcoRyX2ZDJgVXmuCbAvquJsEKCDK0LQIDh1ywZMjfSoWYd3A6Cne2OyYTQXWrQlmbQu/sKl2Mf7DPLGyOW+6pZWw5YC1799b8zxYPttR6ve3kxjePfihmibkG4+hAKhF9nxYEPEb2e37nBpDiS587ECXBCWNcAOHIm/LT7tGxqxt3MzYbvQf700hGZsLJiFCreqZtSy9se8/n/9r1oXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0Zs7Mt/4P9NK3GvbU4uQYW59R+axVhnhP5g2PcB7No=;
 b=dCuLrEfrEWhxsfrA9Co3iT1z2T8oCwEdhHsSz7cHiamPf1mKvj7Y3FsfZAjH92+ynsntO59eFkdQRsZQjD3lzvKiufdWwQz/+dJfgTI9YqX4FO0QgJgOAs9YoAIE78ZILO3PnLeNBXtv0HhWgX0oYSckHF79BqJK8YO5GU+4vg8=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB7071.namprd04.prod.outlook.com (2603:10b6:208:1ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 3 Feb
 2021 12:52:16 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 12:52:16 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Topic: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Index: AQHW+U9T59FA/s8Z20mcfAvTuPFEfqpFOSgAgAErBIA=
Date: Wed, 3 Feb 2021 12:52:16 +0000
Message-ID: <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
In-Reply-To: <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: de918b55-15f6-4595-03fc-08d8c84288f3
x-ms-traffictypediagnostic: MN2PR04MB7071:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB70714EF5CF29B37332657DFDE7B49@MN2PR04MB7071.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dszRHkjUn20EvvD+xXTtdznvokhf5DCwU4rmD/PQha+h11nyQv9jyUIEYJGYKVHVfF2E3TtA/ha4aodk03q6qUPdt9u+BnQbrtIxyzwP02KSbfx0mm0wHKfpnEizs2uMiIQBGt/kagp4mYJ1SHZwK2Si8/wshFlqp7Z3S0GHM/tbT1PCy/O8pipNR2oOX2AMf6ECrVpRHeBh2vkawMOyaPB7Tl9A+doIlx3zQGj+2iiZ6hXejdNSuuqxDc/hBFJlI91Mc7qdPjkdn8hqdYvzv5nT7V06Sb4bcUctxxVRMx6kp0MlPsycROWV+hdFv+b/BvBVpoLqhzc41c2hfjspA7AE+nGutFaU9h6km6SG56aMcgGA/2dzKAA84d65hNpxlgQUJWiHmPPvuTZ2dchm95uPI3aihQEugZSJ+yVALUnryTWj5mQMAB69uyqGbt0JjyN4wRrQ9uq+do7Y5NklbPAzVeLA3z5bKw/nMdu92d6M2UAiVLtYfRYvmC/LeHkpZSct3Iw3jCTCZ0TL0IMu5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(4326008)(2906002)(6916009)(76116006)(36756003)(66946007)(5660300002)(66446008)(53546011)(478600001)(8676002)(8936002)(91956017)(6506007)(6486002)(83380400001)(316002)(71200400001)(2616005)(6512007)(66556008)(64756008)(186003)(66476007)(86362001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?elNXZzZrZGFsNU9KMHI2aDRBRHpZano4ZzZzOGEzQlVGMWhkTit3MktCS2g4?=
 =?utf-8?B?ajNCQ2F1N3RVSW1LOU4yY1ZUU3cxWWVnM2ZlVEl6TWw4Tkc3S2RNMG8reUVI?=
 =?utf-8?B?QStNK3hrU1RGSjRHMzRqaWNoR3RTREVGNS84MkFzWW00YTVvdDU5OFB2WUZM?=
 =?utf-8?B?cWRVbUJPZzVsQ0VWNWV0MWVmc1IwUXRnWndnNU5ML0tFWGJnbUlDUDR2UUh4?=
 =?utf-8?B?dFVROWVrT05vMElVQWJDVE9nWmNkOWNVUGcrOXZ5bkRQNmZkRWh6MXlFTTdx?=
 =?utf-8?B?UFV5UFREMmZjSzhTVzBJZnhtWlJJN0lOaCsxeVg2WjU2d1dNUjVEV0RKdVll?=
 =?utf-8?B?TFNIYmVWTHRwdDFqMVVrMEUzZ2J1bjhTbEgrenloaVpUWGlQdzh1ZjRtend0?=
 =?utf-8?B?cnVIL2d1cEZjS3htZENaRG1pSVlydWh2dkRab09VZ1c3NGcrOVJrcGR5M1ox?=
 =?utf-8?B?d1YzMjhHcXR0OG9EeE1ZTGhTSy9EMlk4ZWFCVVlFbTJjMURqbmo2TjNzMjlW?=
 =?utf-8?B?ZUpiQ3ZlMStIMDc1Nmkvekp2aHU5d0YrTmJJbWJ1V0ZzM2M4SXlxcDdZUEND?=
 =?utf-8?B?V3lWVmQ0b2w2dU8rZW8rOXcyS3Q5dWg3ZFV5V2pBTDhrVldxNUExdTdIcFEx?=
 =?utf-8?B?Q1BQZXVucHFNSFl0MDVFcnJTakpBUVFVem54WjIvK0dmQUpkMnI3OVoweGVB?=
 =?utf-8?B?QnozcnNwUkRoMU9NdEYydjRxNUdqVkZlRlh6NUpQSEtQMmJsWGFqeVoxNlZP?=
 =?utf-8?B?RmNvdFpUWlVlNzFGTUVyK24rbWw5RWtBdmE0dk11a1o1VDMwVkx5Z0NjV1FM?=
 =?utf-8?B?b040UllYMjgybXhKU0xpOU1HdndadnpUeWRxa2RrOFNNZTRBRDYrdWNJRytE?=
 =?utf-8?B?V1l1V3prcHFTOXVhQnBWZ3k0VzZvNC9saFcrWnFYUktTWGRBMm5ocTFNWjVD?=
 =?utf-8?B?MTdlSEJpYmg0dnlUcjZEL05SbUw3c0l2R2lwYXQvbVZhSzZpK0hVVGRBQjdx?=
 =?utf-8?B?aG0zSUZvZTBYY05CRGRIcmI0Qnk0anI1U2JhUG5MaVhyR09pVzZwTE8rZ29I?=
 =?utf-8?B?Qmwybk1aWVZxZmJ0bFZuaU5PcjRaZEYxMDdiMmc3OVZzUFg5TEd4NkNwcC9t?=
 =?utf-8?B?MWRseHZHZy91M0VjUDhQalY3UGgrL2lHRFNBSW9XS3FnTjlyNVZDMEJONVJB?=
 =?utf-8?B?Y1dsaTg1YytYamZNWFAwZGtBUnZVem05RUgvNW1RQ1FLSmdGNStwY2E1Yjlx?=
 =?utf-8?B?WWtaMWh4WUEwaWtCVDQyN2gzeGFEcXphRXAyUTh0S0J3WWJuMFhHcEU4SjBQ?=
 =?utf-8?B?NW1LR291SEx2UmJ4ZUFldlE3dGN1MkttRzZtOEw4VStYS1VFOHRxbGxEZWlJ?=
 =?utf-8?B?ZjZFWGNienFjaHdBczFUcnBWNUhwQ2dPVk1LZmdoQzZQaStKbW5mQmhCQTBM?=
 =?utf-8?B?cTA1MUszdGQzQlJ6RHF5N1hXN2F5RWdBMFhEMDRjS0g5Uy81M056VVVMRFFX?=
 =?utf-8?B?Z1NBQk5HY01IOUllZmJOWndGSEZuTFpSbnVkNFZ6RFMzZkNvRUVabG0vZ1lZ?=
 =?utf-8?B?czdEdzluaDhiM3FXcmZ5Vm9HWFR4SWFlVkYwNlRIRWpJNmVrdUtscEJ2dmxO?=
 =?utf-8?B?S0M4R2l2cDNZOEkwQmJxekRnNDc5MWN0eEM1TUgxWVBKN0RqUndGc05yYVZL?=
 =?utf-8?B?TzJtZ2xXSEM1R2tQYjlnQTQzZHZzckduMk1OUEdkbUhkcGYwSStOQ1NEM3lr?=
 =?utf-8?B?bzdWTVY0MGVSRkJ0YjRGTG1GT3ZlWHY1dFN5eFpaK1luTnNGSi84bjBobThm?=
 =?utf-8?B?RmZKM1RGWENSaDZFOUswMjRBTzg5dnFUZ3hHbWx4Qkc0VDFhS29OQnpIT1lF?=
 =?utf-8?B?eVFySS95RksyOGhBdm13RE9NUkVoNEFra012cWJtVi95d3c9PQ==?=
Content-ID: <DC13B063437D31448C2C475C051FB180@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de918b55-15f6-4595-03fc-08d8c84288f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 12:52:16.2625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZF728wiwvcNnyragLMV0LJ1XhrnxTXTADU05a0r+Tt0PJrxJ91ysepS3PvY4wAfgDJYgVTHwuoiUpkCFv0TrGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_075219_591252_6BDB849C 
X-CRM114-Status: GOOD (  27.38  )
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
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIxLTAyLTAyIGF0IDEzOjAyIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVHVlLCBGZWIgMiwgMjAyMSBhdCA0OjM2IEFNIERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVt
b2FsQHdkYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IFRoZSBzaWZpdmUgZ3BpbyBJUCBibG9jayBz
dXBwb3J0cyB1cCB0byAzMiBHUElPcy4gUmVmbGVjdCB0aGF0IGluIHRoZQ0KPiA+IGludGVycnVw
dHMgcHJvcGVydHkgZGVzY3JpcHRpb24gYW5kIG1heEl0ZW1zLiBBbHNvIGFkZCB0aGUgc3RhbmRh
cmQNCj4gPiBuZ3Bpb3MgcHJvcGVydHkgdG8gZGVzY3JpYmUgdGhlIG51bWJlciBvZiBHUElPcyBh
dmFpbGFibGUgb24gdGhlDQo+ID4gaW1wbGVtZW50YXRpb24uDQo+ID4gDQo+ID4gQWxzbyBhZGQg
dGhlICJjYW5hYW4sazIxMC1ncGlvaHMiIGNvbXBhdGlibGUgc3RyaW5nIHRvIGluZGljYXRlIHRo
ZSB1c2UNCj4gPiBvZiB0aGlzIGdwaW8gY29udHJvbGxlciBpbiB0aGUgQ2FuYWFuIEtlbmRyeXRl
IEsyMTAgU29DLiBJZiB0aGlzDQo+ID4gY29tcGF0aWJsZSBzdHJpbmcgaXMgdXNlZCwgZG8gbm90
IGRlZmluZSB0aGUgY2xvY2tzIHByb3BlcnR5IGFzDQo+ID4gcmVxdWlyZWQgYXMgdGhlIEsyMTAg
U29DIGRvZXMgbm90IGhhdmUgYSBzb2Z0d2FyZSBjb250cm9sbGFibGUgY2xvY2sNCj4gPiBmb3Ig
dGhlIFNpZml2ZSBncGlvIElQIGJsb2NrLg0KPiA+IA0KPiA+IENjOiBQYXVsIFdhbG1zbGV5IDxw
YXVsLndhbG1zbGV5QHNpZml2ZS5jb20+DQo+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+DQo+ID4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9m
Zi1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4NCj4gPiAtLS0NCj4g
PiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc2lmaXZlLGdwaW8ueWFtbCB8IDIxICsr
KysrKysrKysrKysrKystLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUsZ3Bpby55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc2lmaXZlLGdwaW8ueWFtbA0KPiA+IGluZGV4IGFiMjIw
NTZmOGI0NC4uMmNlZjE4Y2E3MzdjIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxncGlvLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUsZ3Bpby55YW1sDQo+ID4gQEAg
LTE2LDYgKzE2LDcgQEAgcHJvcGVydGllczoNCj4gPiDCoMKgwqDCoMKgwqDCoC0gZW51bToNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLSBzaWZpdmUsZnU1NDAtYzAwMC1ncGlvDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC0gc2lmaXZlLGZ1NzQwLWMwMDAtZ3Bpbw0KPiA+ICsgICAgICAg
ICAgLSBjYW5hYW4sazIxMC1ncGlvaHMNCj4gPiDCoMKgwqDCoMKgwqDCoC0gY29uc3Q6IHNpZml2
ZSxncGlvMA0KPiA+IA0KPiA+IMKgwqDCoHJlZzoNCj4gPiBAQCAtMjMsOSArMjQsOSBAQCBwcm9w
ZXJ0aWVzOg0KPiA+IA0KPiA+IMKgwqDCoGludGVycnVwdHM6DQo+ID4gwqDCoMKgwqDCoGRlc2Ny
aXB0aW9uOg0KPiA+IC0gICAgICBpbnRlcnJ1cHQgbWFwcGluZyBvbmUgcGVyIEdQSU8uIE1heGlt
dW0gMTYgR1BJT3MuDQo+ID4gKyAgICAgIGludGVycnVwdCBtYXBwaW5nIG9uZSBwZXIgR1BJTy4g
TWF4aW11bSAzMiBHUElPcy4NCj4gPiDCoMKgwqDCoMKgbWluSXRlbXM6IDENCj4gPiAtICAgIG1h
eEl0ZW1zOiAxNg0KPiA+ICsgICAgbWF4SXRlbXM6IDMyDQo+ID4gDQo+ID4gwqDCoMKgaW50ZXJy
dXB0LWNvbnRyb2xsZXI6IHRydWUNCj4gPiANCj4gPiBAQCAtMzgsNiArMzksMTAgQEAgcHJvcGVy
dGllczoNCj4gPiDCoMKgwqAiI2dwaW8tY2VsbHMiOg0KPiA+IMKgwqDCoMKgwqBjb25zdDogMg0K
PiA+IA0KPiA+ICsgIG5ncGlvczoNCj4gPiArICAgIG1pbmltdW06IDENCj4gPiArICAgIG1heGlt
dW06IDMyDQo+IA0KPiBXaGF0J3MgdGhlIGRlZmF1bHQgYXMgb2J2aW91c2x5IGRyaXZlcnMgYWxy
ZWFkeSBhc3N1bWUgc29tZXRoaW5nLg0KPiANCj4gRG9lcyBhIGRyaXZlciBhY3R1YWxseSBuZWVk
IHRvIGtub3cgdGhpcz8gRm9yIGV4YW1wbGUsIGRvZXMgdGhlDQo+IHJlZ2lzdGVyIHN0cmlkZSBj
aGFuZ2Ugb3Igc29tZXRoaW5nPw0KPiANCj4gUGxlYXNlIGRvbid0IGFkZCBpdCBpZiB0aGUgb25s
eSBwdXJwb3NlIGlzIGVycm9yIGNoZWNrIHlvdXIgRFQgKElPVywNCj4gaWYgaXQganVzdCBjaGVj
a3MgdGhlIG1heCBjZWxsIHZhbHVlIGluIGdwaW9zIHBoYW5kbGVzKS4NCg0KSWYgSSByZW1vdmUg
dGhhdCwgbWFrZSBkdGJzX2NoZWNrIGNvbXBsYWlucy4gTG9va2luZyBhdCBvdGhlIGdwaW8gY29u
dHJvbGxlcg0KYmluZGluZ3MsIHRoZXkgYWxsIGhhdmUgaXQuIFNvIGlzbid0IGl0IGJldHRlciB0
byBiZSBjb25zaXN0ZW50LCBhbmQgYXZvaWQgbWFrZQ0KZHRic19jaGVjayBlcnJvcnMgPw0KDQoN
Cj4gDQo+IFJvYg0KDQotLSANCkRhbWllbiBMZSBNb2FsDQpXZXN0ZXJuIERpZ2l0YWwgUmVzZWFy
Y2gNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
