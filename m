Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02253C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 23:22:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F7AB610FA
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 23:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F7AB610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=C/vnW9ihs8WBxhddVdUj2Xi1ZJI5ikxNfWYxxjwZLVw=; b=MbBwMv1T5X9jRRzKetP3pWYD+
	A475rIZYeUEZoYtRlhLS9iAaIlU4Pa2Aup6f1/fNYGvUsFpj/hgCBnfKxSxr83DIWaAmvTA/k1QQ+
	uTl/ksxSdtHfkLrqjUkoDaynP2TB1nvYcsqvDGbNB3L25EDyAsd1z1AQABRCz4wdG/8rzWbhaRzux
	3abXchG7e3saT+KXKoyBvP1IZ0cc24PoGVJ/Pf0/Anaeyoi1q7uskqmG4PRQapXWcRgmSZcFNLeTY
	MQ6hfNTyA1YBawHaOVO1Y5Km8UvUNF1wyzl99hvfZBxc5tLV1niIfB5MRvGRdDCB08CHexS70YORT
	dUugcdmhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXBJU-00049J-Al; Thu, 15 Apr 2021 23:22:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXBJL-00047Y-Pe
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 23:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
 bh=Ep6ifwEIIDQcEfOUM8rwAxmITsAXM2zkdW4+aKWg5EQ=; b=4QLs5FiESU8s8Ta2bk4YcQyeHj
 u9MIJChWU39jjDN5v4SoYlSi39qAnl4PFsJiyxMEt8UIB+X9s1w83pg8V9TYG/yYowZUDcR20mDpQ
 uXKgWWqjTPFz2dHTDs0sDGrW4yjKRbFiJL1ison6Ls65Nqf/Wjh4OuQkbvcvDih1ZveJjtMKebk13
 os8/bDJG/eH0SMqNiGaZGw6AivdbYcN7YYKtGGBhkRsqdh+sxIEby9JOwwiqqzMyn4R2AzOUpwSJ0
 MTYvSsnmcmITiHLeEEmg374l9+EKrC4i2nMNUOgMrzuYWkAUuoIPOCoouqdh7DPMe7OCrjqpGLqt5
 h6zlFc1Q==;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXBJI-008yGS-Kc
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 23:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618528928; x=1650064928;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=yAROk7jArod9m2aZ9ZS2QwsszOal9UgOxl2Ftk4+k8Q=;
 b=hxdS+7LyI8PiG/4jtztH1mDV4/meBagbRc1/+wCBqqoNdxxqXnCNMsId
 fFnwTpzNl71TSDFHdn77lK8j2EDTwfyRXPQ9TYk+WcTQXaL6QdxdChdsy
 WmFvJ6yNOjCC6irv17rNV4OYtH4JmfuoLssLdOqlWXNjHp0/vb/pKGEth
 I6qrU7MH3w2Z1mo631z5VFTq+oWJRYQyvxMzCTyQOlhrACWdcLyVBf/59
 +Su8PQBPcACPTD2ohMc1Fa0jHZWWIq0omNiP4+KLhWQNwWbNEtU8D8INj
 LFoPvBKOBqt8VgCAjtZqSJuZ78O326KS58H1b8nujU1XaWwJmqRMM0L46 A==;
IronPort-SDR: d35N0lk8nGiQYTfChzo9vYRbAiqA2SXxNODMdAdTzTwxEuvope2JVJP++kM0k0S4N77+1VZk9e
 nlLQt2LpLKClIsmhdZZaPneC9OoCdHXRIyUO8GRDV1VXkxN5/F8ol3AInU+lrOipRdVWC2jL9R
 XNF6GPr1z5A5KeJ+4453RG1C+loh96BzZgQwsaMg32T7MixpoiVZYIMVo1DwkokME2K1QKYizA
 3BBYcJhHLA0Bld8TlyUI+sNm9KRt5jiX/eGK6nV7h+bVtdVsJnFv82ZJnxZyHXik+gZs+X5/0N
 kHs=
X-IronPort-AV: E=Sophos;i="5.82,226,1613404800"; d="scan'208";a="169527945"
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hgst.iphmx.com with ESMTP; 16 Apr 2021 07:22:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mC3GNkllqt6TcumjNvI7tPyU+i3NKb+/wleozmbjh25pPJ4k7UbV8pyQrMadIJxlFvBePN/N4FzhCW2XMUVEkESQsDjLYLz8LUxARFnmo7imgTDCah3VP4XeuWEb1A6Duu40l/AAf2aPNwjA2vyxX4T60N76M3Qn3vYV6ZAQ6QYAD933NZL5sFpevFMfTuIOY37B/IVbnPQ107JS/gWTX2esKt+JPww0UF2Ico92Ri+gvgGAUMvRIqgRMui3FMhUArxjx7cI7DLA4TBTebt1BLB90osR3px0+vdjFsEPwxVAAhJ8bVhclmYGIlv1KM4+YIHccJEWkLNBfwtZzkggLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep6ifwEIIDQcEfOUM8rwAxmITsAXM2zkdW4+aKWg5EQ=;
 b=PZyL+X8npkbNYQPfp6b11X4KxD9tPynpIyOlfFtJoZGnADkg4ge8anpzXAu2aML3rVt9VrHAFBaiqZgNef2f9Iwjl9FY+xxZPBQjrlteGhs/3ajPNXQddFEwsP9Nz6ILyW+dUOUV5VX/f34IAW12DKzdt42G+52kPMsRec9kBWcrzmt/B+H2V4ddOlH0SqPePxnesRG6BxzOUmOaQg+GpnM3bEVVH/HuUtAmv5wdUmNulYqmtiZloYe+sUhiEse3ZCGyeBAm/7pmJFQ0Rca+X9blTzqYNwyXwyt/puzxp5Oo55GiAPIYBYh62sZF6MTgg2bdGUo+SiFGHCylcwMxvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep6ifwEIIDQcEfOUM8rwAxmITsAXM2zkdW4+aKWg5EQ=;
 b=bjtWeuvgqiUDognVA9HqgHpa0WRBtq21m51/7hEjzuI7pFydIEPtSUkzfwtHc/bnQbKDJN1w/Virk6mFChsgiNzHU1NEt8aw3xYM3phyOm/vZx14CXoOoJ24crd34M+jvg5J1KuQZPxC4qrwh4BoWj/MCnx2dgl0jwnwTOpJ74w=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4916.namprd04.prod.outlook.com (2603:10b6:208:58::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 15 Apr
 2021 23:22:02 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78%3]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 23:22:02 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Greg Ungerer <gerg@linux-m68k.org>, "uclinux-dev@uclinux.org"
 <uclinux-dev@uclinux.org>, "ugerg@linux-m68k.org" <ugerg@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Max Filippov <jcmvbkbc@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 1/2] binfmt_flat: allow not offsetting data start
Thread-Topic: [PATCH v3 1/2] binfmt_flat: allow not offsetting data start
Thread-Index: AQHXMb61DCVMbvZIeUC4C2ar1xW5kg==
Date: Thu, 15 Apr 2021 23:22:02 +0000
Message-ID: <BL0PR04MB6514D6C35731EA1CA581095EE74D9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210415061502.7248-1-damien.lemoal@wdc.com>
 <20210415061502.7248-2-damien.lemoal@wdc.com>
 <8ff801ad-6e17-fdd2-6186-5443540947a9@linux-m68k.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:c420:851d:e64f:2199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfa1a36b-bdc0-428a-e616-08d9006546af
x-ms-traffictypediagnostic: BL0PR04MB4916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB4916D4BE41A3116F8453DDCFE74D9@BL0PR04MB4916.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FEyMIMEZ99ElGAezxoBg5h3wtQ24mjWYNXGuUEh0FPEmJmNb9vKfTgIO0D0F67JFpTGgxj/8RWFYWtj/6KPhEGEvm0ct8QjmEiLksbWRXgiJBWDXauAaRdvA4PbjZFmbGwUUiHL4amYGLk882XLEVJ/IipcMfSRGYcLW+SFbudm8f37uZbumxTYqd0EUI2rrEcNRdZSmG/rtuJcqyrDd58avfxJMCE73kIhAyKQj4NNfeGEzQp7VMlucrk4Tj2gju1cUU0DQTTh39E1B5/7KE7GaBF0PQd9qJu1cnEBPlqGBj+G5ng1nTz6mgOdZpbwgzltNAIVirb549C9v+69BS5In6YBXM44BUAVFKPoIrKdQ58CJlUV7wlwsoXYMN4wdO3VSsvWdJF94s6jNK7VGde3rdj8KzFFC/YVP+dimyCEG4I0ZQ5tDxbs1q8MbKf4XzNq0L65991O3ByTWD+W7TXECCeM7hh/GynjGdKAR1WvP4fTIT/YUMERAP4K4Y5mFnnkejhFs+oS+2ihljUCmxnAvPPMC4dVbzYCrkTwd9Zks/2qxZNqDmy5pcRRLFkxwkRrf34yv+MsdD04dlF0k/LAQyKmWo5JZ0im+MXlnJW0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(52536014)(9686003)(2906002)(55016002)(54906003)(122000001)(71200400001)(8676002)(64756008)(66556008)(66476007)(91956017)(76116006)(478600001)(66446008)(66946007)(110136005)(316002)(8936002)(53546011)(83380400001)(5660300002)(6506007)(33656002)(86362001)(4326008)(7696005)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NPeGZcfu1RwFyjNtVNCs7yPvD46AFh0t/qcEcOS+fHbvmj1VLKWAP5Vjf4qk?=
 =?us-ascii?Q?ChLee9JDQRZsxn9N4zm9gnykKo58UaFWVgvhkgkehQcAHY78e3akdH4WDt/B?=
 =?us-ascii?Q?5FI37BikMvflnPTBqqTf1aFmRMFYlgyDotk1MiyoSA3GSJaS+JNUsXr3dw6s?=
 =?us-ascii?Q?b34rShLEtgGbdsxPBFmn3bdOAq5gHlx13TDdLTC5pBengh1yz7HLNqqv9NmB?=
 =?us-ascii?Q?VqTGfujyb8+g+9IQ7TT6kzHNnLDmBMrDWORSssfXY6uxwq138EER/ti0jKJL?=
 =?us-ascii?Q?Y4oMNoHtP6uIGhyCexlqbwVVzI9XNFEBw5BFjLnAd29FqIPwfAAP/n6BzLwR?=
 =?us-ascii?Q?ieVQqK0J3YSTRkw2JaQfOYa4zbddU85dPHteiEVyaELTF/DZTQ5BfDo+l0NE?=
 =?us-ascii?Q?VBkqvcHDRHLXGkGi1QioA8Kp/r18NyzcAQ3Rm451oLGgMWNHd4x2nlx+XTgs?=
 =?us-ascii?Q?/ENe9SKRGTgXpURr/0KDtld9+2PdItQOGqhPbfBbbfY8sfTz9GUYPc4LqHzH?=
 =?us-ascii?Q?goBMQes371Pns5QKeWlBCwWOntgeSReyiYD6+wO2ruQvLitn/PuWEnBxPd90?=
 =?us-ascii?Q?A//JuMkyTnl894E/5so2Lg+iMwsxClxKiy3bY3jBnNxrvFFXN9CogB/9ey2s?=
 =?us-ascii?Q?LCrQvsGQvuqFhi8F50FPyJQSesNSNI9icwJusow2ZFMA0dzKcuy2lqB6NXLX?=
 =?us-ascii?Q?PlE+JDeoCbMd82lfe6tGIA9QgCPfQIRk0g9N8HaRAwht0Ex92Xj5Bg+7uDlJ?=
 =?us-ascii?Q?KgIG1AUENCe8eudDLailHTxm5PGfbM6haFaX+GYdSFW1sXcd753wxJ0wYj7m?=
 =?us-ascii?Q?XLcAABrdxJzbZXGWeKrkrSSpsNLvCE/uHnLYiXlFhOygVnyjwE35fPyVVFaY?=
 =?us-ascii?Q?1LygSYcYzuchXwL0ds395wFs6eQrJL8KUjYH/scddmPEXuiWzv5pp/+egIkS?=
 =?us-ascii?Q?0h1Ph9SMLRF0rCdMESGyhDMXGlywVTnQoa4JF/h4iF+DVXJ4OCrXw0mWYv7m?=
 =?us-ascii?Q?cQJYwbtH9OJPJ/XsUMBU1QJPS31B8r+ytqthU2s06q0I7TZsw0Vutu2BePo7?=
 =?us-ascii?Q?v5om87qD59DsGc1aAL4u1kKfDynN7MXViAZ23F6boN9dlSZZoJsfGYOgNxPO?=
 =?us-ascii?Q?j7lyiVsiReI74GlqkvuT4NV3o9Cg2lPyCmSicl+KWv0gIN/81XkZvZ0U04ND?=
 =?us-ascii?Q?J6W0aFCpDUxgfNen9SGoQuI2XDMjM9R+aargH4WiZIT3nftipyUYbdWWZblX?=
 =?us-ascii?Q?m1Jc8+kNwcxXcugj4SxeCsjZoOPGOYkS/zlmZhKJJgtiOHR/OS5VIuXptIjn?=
 =?us-ascii?Q?ViXC7zo/RQhl0eH6b309fDRBWbxdJ+4x2nZJ1FeqhDm2wFFSSTB+NKO2b38b?=
 =?us-ascii?Q?G4UKtmsMylPkfDwD9oczqOxQAgI7EbyMnEQIk1DzM4M8nVpQeg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa1a36b-bdc0-428a-e616-08d9006546af
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 23:22:02.5025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gxHg3st7nz6UXuNjlaWUWwA7kaVQXPwQCwSAn7tCr2uUGPFTWX6NHOsaikY80QRU+wavks2XjOcnuwMpw44klg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_162208_805723_B65496EC 
X-CRM114-Status: GOOD (  29.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/04/15 23:04, Greg Ungerer wrote:
> Hi Damien,
> 
> On 15/4/21 4:15 pm, Damien Le Moal wrote:
>> Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
>> the data start"") restored offsetting the start of the data section by
>> a number of words defined by MAX_SHARED_LIBS. As a result, since
>> MAX_SHARED_LIBS is never 0, a gap between the text and data sections
>> always exists. For architectures which cannot support a such gap
>> between the text and data sections (e.g. riscv nommu), flat binary
>> programs cannot be executed.
>>
>> To allow an architecture to request contiguous text and data sections,
>> introduce the config option CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP.
>> Using this new option, the macro DATA_GAP_WORDS is conditionally
>> defined in binfmt_flat.c to MAX_SHARED_LIBS for architectures
>> tolerating the text-to-data gap (CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP
>> disabled case) and to 0 when CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP is
>> enabled. DATA_GAP_WORDS is used in load_flat_file() to calculate the
>> data section length and start position.
>>
>> An architecture enabling CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP also
>> prevents the use of the separate text/data load case (when the flat file
>> header flags FLAT_FLAG_RAM and FLAT_FLAG_GZIP are not set with NOMMU
>> kernels) and forces the use of a single RAM region for loading
>> (equivalent to FLAT_FLAG_RAM being set).
> 
> So is it the case that a flat format file on RISC-V will never have
> relocations?

No, it does have relocations. But there is no entry for the global pointer
(__global_pointer$) location. This is because the loading of that value in the
gp register in the C-library crt1.S is done using a PC-relative instruction. The
value for it is resolved at compile time and does not get a relocation table
entry. Other functions calls and symbol references do have relocation table
entries, so the binary can be loaded anywhere. The missing relocation for the
global pointer mandates that text and data be loaded at the same positions
relative to each other that the linker file defines. Otherwise, loading of
__global_pointer$ into the gp register (first thing that C libraries crt1.S do)
result in a garbage value being loaded.

I tried some tricks with the linker file and changing uclibc crt1.S to have the
gp loading done using a symbol address instead of a PC-relative offset. I could
then see a relocation table entry for that symbol. That still did not work as I
was probably doing something wrong. Anyway, such solution requires changing a
lot of things in C libraries loading assembler that is common between NOMMU and
MMU code. Changing it would break MMU enabled programs.


>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>>   fs/Kconfig.binfmt |  3 +++
>>   fs/binfmt_flat.c  | 21 +++++++++++++++------
>>   2 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
>> index c6f1c8c1934e..c6df931d5d45 100644
>> --- a/fs/Kconfig.binfmt
>> +++ b/fs/Kconfig.binfmt
>> @@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>>   config BINFMT_FLAT_OLD_ALWAYS_RAM
>>   	bool
>>   
>> +config BINFMT_FLAT_NO_TEXT_DATA_GAP
>> +	bool
>> +
>>   config BINFMT_FLAT_OLD
>>   	bool "Enable support for very old legacy flat binaries"
>>   	depends on BINFMT_FLAT
>> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
>> index b9c658e0548e..2be29bb964b8 100644
>> --- a/fs/binfmt_flat.c
>> +++ b/fs/binfmt_flat.c
>> @@ -74,6 +74,12 @@
>>   #define	MAX_SHARED_LIBS			(1)
>>   #endif
>>   
>> +#ifdef CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP
>> +#define DATA_GAP_WORDS			(0)
>> +#else
>> +#define DATA_GAP_WORDS			(MAX_SHARED_LIBS)
>> +#endif
>> +>   struct lib_info {
>>   	struct {
>>   		unsigned long start_code;		/* Start of text segment */
>> @@ -559,7 +565,10 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   	 * case,  and then the fully copied to RAM case which lumps
>>   	 * it all together.
>>   	 */
>> -	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
>> +	if (!IS_ENABLED(CONFIG_MMU) &&
>> +	    !IS_ENABLED(CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP) &&
> 
> If RISC-V flat format files must always be loaded to RAM then why don't
> they set the FLAT_FLAG_RAM when compiled/generated?

That is done. The patch I have for elf2flt sets it. Coding it like this here is
I think safer (whatever the userspace toolchain did, the kernel assumes
FLAT_FLAG_RAM). And it also has the nice side effect to suppress the first part
of the if () in the final binary. Smaller code size :)

> 
> Regards
> Greg
> 
> 
>> +	    !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
>> +
>>   		/*
>>   		 * this should give us a ROM ptr,  but if it doesn't we don't
>>   		 * really care
>> @@ -576,7 +585,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   			goto err;
>>   		}
>>   
>> -		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
>> +		len = data_len + extra + DATA_GAP_WORDS * sizeof(unsigned long);
>>   		len = PAGE_ALIGN(len);
>>   		realdatastart = vm_mmap(NULL, 0, len,
>>   			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
>> @@ -591,7 +600,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   			goto err;
>>   		}
>>   		datapos = ALIGN(realdatastart +
>> -				MAX_SHARED_LIBS * sizeof(unsigned long),
>> +				DATA_GAP_WORDS * sizeof(unsigned long),
>>   				FLAT_DATA_ALIGN);
>>   
>>   		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
>> @@ -622,7 +631,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   		memp_size = len;
>>   	} else {
>>   
>> -		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
>> +		len = text_len + data_len + extra + DATA_GAP_WORDS * sizeof(u32);
>>   		len = PAGE_ALIGN(len);
>>   		textpos = vm_mmap(NULL, 0, len,
>>   			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
>> @@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   
>>   		realdatastart = textpos + ntohl(hdr->data_start);
>>   		datapos = ALIGN(realdatastart +
>> -				MAX_SHARED_LIBS * sizeof(u32),
>> +				DATA_GAP_WORDS * sizeof(u32),
>>   				FLAT_DATA_ALIGN);
>>   
>>   		reloc = (__be32 __user *)
>> @@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>   			ret = result;
>>   			pr_err("Unable to read code+data+bss, errno %d\n", ret);
>>   			vm_munmap(textpos, text_len + data_len + extra +
>> -				MAX_SHARED_LIBS * sizeof(u32));
>> +				  DATA_GAP_WORDS * sizeof(u32));
>>   			goto err;
>>   		}
>>   	}
>>
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
