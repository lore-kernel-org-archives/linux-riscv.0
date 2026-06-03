Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF523CD6E64
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdfynnAJdQn90ylhy8SQ0ieloYLpBN3S8NMFRfo5oTU=; b=xgV2AcScRchYk1
	m/6urZJYWRv8Rd+yrxOeRSkNMPDitLfPzpAWy5ngEvR9JwgZ2SBEn21PXeP2FV8XzKMbLp1uYq23B
	303rrY1nQh89E2nwoTX+GBPDNUeGAoka7SOXClHOtFOy58tE3CksRBRKjO4qjty5YrKCg0QsGF2ju
	zNg1/4EuLofiX22VwDc7fLfuz1+M4Kt5cQEHrLcuykkXsdDC4Pna70DdTPEYZ4AbDPHHKx+By/AIt
	apnYEZVhA63ZrUxrGQnD8LDjQqXoQhehuHH38mn2dKHSxzDLm7+6BJke/dBPTYlEilR+7aGSQy83c
	U1U0YuWq9D06/9ut67CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUifj-0000000EnV8-3I2G;
	Wed, 03 Jun 2026 10:18:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUifi-0000000EnUy-1qJE
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 10:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ArNwJNdIhEGeBOXtnNGkvLLRSsKEIxE97T0lXuqBYi4=; b=lYkkS06Y7TjMNTHabk+7sgdIQ1
	rAkWd+2QFG2qs8XolbPi63Dwl1VjiXzSKz+e9wROeSolCTWEU8661MFIIs6uCGhuuNjSQTwpZC3I6
	t7VLiEUYzOKDHk7hev/b7Yy/gIFAkUzy7BcWbxFwcWvN4AOdL9U1NWpiMNiY6SKVs3rM6gQwbjkFL
	tsE4Ywaea9jFyyPSHVfySKcN95UfPZxBM7mUTHhze2ANoxo+TUlPRz5oY87M9XntIUyDnblr/dBpY
	8F5eI6lqEAis3y2T/PiIrIPZVo4qG7RjZjY9y/axkcmt461rPYwF2V6yUMZqNukanDtiK5XGPjMtk
	CDe6GJNQ==;
Received: from mail-bjschn02on2133.outbound.protection.partner.outlook.cn ([139.219.17.133] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUifd-0000000Boz7-3Oy4
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 10:18:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kevMRbUzKYhMv/UcgziFC2vwCrq61r8XGp/NsiO13JAM/4vIyW71/0MLYT9RKGOqCmgJd5wu6eYfnIx0jUrVNpvpJ18jzgwsR/7iqeDH5rAcu3vKqCQUro/+jRE6ihi4yFjWxLWb4PCi671iTJGgXEcL2bKypsTJDIwmyHO/8nrAJxhhi8JMDFfVZmay0Ng7aF9MU3x5x7KFk6YWzNcGyBKzi4GzB4VZbKS5oWxalh0liteC4F2+xSNn252l3Cy845/7rrtdlpSRcGr+f6/sgVMnHXOBwgy/rBaOwOc5PbhkE+C7fGwpgSW0M/SYJA0Tx+TeWTl9Z9s8TWeQwkVZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArNwJNdIhEGeBOXtnNGkvLLRSsKEIxE97T0lXuqBYi4=;
 b=OkTUvdx73WbzAbmOtWFB3c5ROGeuyJQLzn5Z5wQRHrfdH13wnYeTOQhoGp1bWJChXLqiZsKnPLwPllqf/YdN+MXRjx9Lg7zN/TuWYEY437nDgniWbl9jxPkCzEF10uDpyx62BGjFKD9wofqVbrwlFvbsirOULClGzOyL7KavsAnrJSkPCSNxIhQ0rbDVCPne72+SlD85tE72+UNJIZzblJW4xHvC8AZpDVe/wjRuHtDM2SsUnRLBUjjQe9VyksCGkluzCbpHd69dO5MHRHCJCYlFQECsbS815iBaXjj1zEDpJxGi9eoUEmBPfe15joSozr6tk1+B4hz2BTmjWrlyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:17:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 10:17:36 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Bartosz
 Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHc8x1jj1AWoBKzsESqiyGUJQ5KXbYsgz+AgAAa6qA=
Date: Wed, 3 Jun 2026 10:17:36 +0000
Message-ID: <ZQ4PR01MB1202C6EADCFEF3BDAE70BC17F2132@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
	 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
 <05c54522ba76bfc4421e6838e8ff108437f69636.camel@pengutronix.de>
In-Reply-To: <05c54522ba76bfc4421e6838e8ff108437f69636.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_
x-ms-office365-filtering-correlation-id: 1d0cc0e2-64b6-4c8c-03c4-08dec15955bd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099006|4143699003|18002099003|22082099003|921020|38070700021;
x-microsoft-antispam-message-info: hj2fNF9zfFEA9DRFakaHVS6erVGCfM9G5MeC4aVVqaX47mldRp9Wug0xab+CyZgvmcwnXEFttjGjQ6mJnV55yF37AukmXgPta/wLQgkATm5dLVtOp009owQb9xnDY3lhJZY44YHYzh+wqwoTers1aC4giWLGpETssme5xLDC6JZRKX0BtOS5obLiUfrD7A10NfoV1hBd1lAxjIhmBsHW0o9tnhJs6VTsejOtCJ8wkfx0HJ6ndj+Vno8aB04bmbex+R6V4c2O1+gnB1/jpKWTUI2cT6y3w0rgsZg+Q91s8hJmRxGna7CUYzJd7bhH3AtyV6zXdiyY3FMM6o4zeET9YgBOoBmN0paXn/mW1CiCwfNf2bQ5L5ubTS0zM3NyfOgwLA0kixN1xf9n5T66mInx9ENbkircyFNfdcFWYrsBs7VB6lM6HFYo4fhsqo3QuEk8IPSOap8cal77xAawRhGdg5e5SiRnTEAcQl9ZjsKiP7ijVcOdrdG4eJH+FMb/7UXrMNrlOlxRpIG5udAwX5Sxtw93EhvNu3tw/fjHdsfwRSpCxy1Bwv48ZNhDSFbdBfiW8btakbWJSq1fE1esT89XDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099006)(4143699003)(18002099003)(22082099003)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2RQZ2NCd05Dd0NUM3NmelhhLzF3cmM2V3hydUdLZkUrNmZqWG1KWHN4Unlv?=
 =?utf-8?B?cW8yb0ZYcFIwUmlVbTFMVFJlTitJcTFkZWQzVlAwMldORHEwZkMxWlJWMzEy?=
 =?utf-8?B?NG83dC9wMEFYUDQ4QVo5cDVQTURaU3RlTU9PT0M3N0JxbUNqNmp2eGtoMktV?=
 =?utf-8?B?My9SV1lRUHFzVVIwVVdXTXllL3dQcXY1TE0wcWdFWndEeW02TXZ6Z2h0SzVW?=
 =?utf-8?B?OUN0aDg2NHhsNTF4U1ZhWjh5RVFISnF1dW1RWnVZa3QzNkk0MWgzTXg3UFFT?=
 =?utf-8?B?SWxXeUNHS3pRYlNvUjYzLzJCRFdMQ1NjTUFzZTRvZlp5bDNnWUxuYUtXYlpP?=
 =?utf-8?B?RmdXc282VjNNcE4vM1piWTNhYy8xcE9iU2FRMlNaa2NPK3pXOGlKdUdXVHNa?=
 =?utf-8?B?L1h6dmY2NDVlRCs0RWgxL1Vlc0ZWVXFZN0lCM2VxWjBobVQxV3pmL3pqcjZr?=
 =?utf-8?B?RjNEdjdzSnQ0RnRkbmliZG9OOFFKNEE0eERhNi85aFRMMnhjd2Vuek4zdkJz?=
 =?utf-8?B?Vm1SV291T0V5NHpxUGxwdEJEMEg2RHNYOTFtTEZkcW94Tlk3c2JqSzU1eXRH?=
 =?utf-8?B?NC9HZjB3bVV6SVdyS2NDelZOSHpkVnJEUHVSVStiMFNxVjQ5OTc3ZzQrZkpX?=
 =?utf-8?B?WDJzdFM0Rkd0aEtzcGFvOTFTR29CQkJiKy8raFZZN3YvR0Rpbi9qaFB4UHo1?=
 =?utf-8?B?NFllR3puOGtwdkwyK2YvU1pJdlY4N2RmWDFXRTFCSWc0anhRNGp5YWJoWWtn?=
 =?utf-8?B?QWlMQWh1NWo2SVVVNnhxZFhFUnRUeWF4aTgyUTBBTzFjVkE0dEJNaGwrd0t5?=
 =?utf-8?B?Rmx6MHlHWG9yVk9WUXlsMDZWeWZxUURoYllZUXVuRFR6VUhNZE5WNzhCTUxM?=
 =?utf-8?B?VFhDY2NCaEVwcXpNb0RlWWN0aUxCdGZWNGNCakR4OWdKN1VRUVYrQ1VDemZ3?=
 =?utf-8?B?K1NVOXNDWWQvWlZtcWc1b3dBVWtLNE1CRWV6citENjViZnhIVzlpZ0hsY1I3?=
 =?utf-8?B?WjFrNU5BSWZyTmh5bHpqWFlnbHprZklHdnRiWUtmcjZseStvTVE2Q3JUQjBP?=
 =?utf-8?B?SGI5cTRVTklFc0lkcEtESW1wUjNuOThLZC9Mb3M0RUN2aU1kRE5Pc2txUWpj?=
 =?utf-8?B?amFhbStIYVQ2L2ZsS2V4ODJlNDBrWHF2bCsyTHNFZzBma29WMnR1TFhkKzc3?=
 =?utf-8?B?VmJsZG5ra2lOM0tnb3VUTHFNd282dnVQMXl4NVNGNlRKNkh5c0hEUUU2NTFl?=
 =?utf-8?B?dWFZalhFVWFCNTVWdW5nM0hVNWRhQmNYMVFUTHUzbHNUUmtIMXJVUmJaRTNk?=
 =?utf-8?B?bWhhaGhLcDFJK1pwRytjaUtCRWVJQkVMUFZqZjNWUjhpMHJUa09MbWJ0bEZC?=
 =?utf-8?B?ZEVtSGdpZWRYMi9FSm1qMTRac1RWd1ZGMnZENnZCUDFWcFQ4aVVCZW5zeVZn?=
 =?utf-8?B?WktKeWJkdU5qbmEzMU5aVjE1aWxQYkZPbW5oVWtyMklJNlJCUlNxWkFyd1VE?=
 =?utf-8?B?VkZSZEtZekhiZ25IT2lQS2JLckRnOUZweXo4SmllMDVuQWNMZVZjaVZ4REda?=
 =?utf-8?B?TXdhd0NCNGdiMVVtazNZUFIzMUNyUHY4YTlnTVQrVWVueWZxVm1jNUY5Wk9S?=
 =?utf-8?B?MWpkVTlRRnJzTEJBZ2dhaXVTU05abnVXUndON2Uwb25hbzJUUXpUL1FHVDRi?=
 =?utf-8?B?T0ZWTFJsVUxUVVVYN3JiWTc0YU1ZUGtKVEwwNTJuWXZDYmVhUWFyVlROSEp0?=
 =?utf-8?B?VFlUMk1vTktkME9WQldIREY3ZlZKQ3Y4bk1GNkdJQTVTS2ZHY1MyYnRwNDR6?=
 =?utf-8?B?eThiOHRyclRjVzRJMGNSaytQeFVxT0RhZHlGMDZTK1ZkVkQwRjV1TCtTbU1C?=
 =?utf-8?B?OFJzWUh3eUtEa2gzbUNjaTRnT09EbEw4RlpjS01rOTlTeTZSOXFaZ2JnZUJ4?=
 =?utf-8?B?dHNVNjNJUkFTN0w2a1JLU0t0MlM1VHVRN1hFMnVTUktRRjdkcHBNYlVZOWt2?=
 =?utf-8?B?U0RGL1dJaCsvdEdYaFRvaDgvdEtxMyt1Z1o1K2UyRWFSS2dOdVBRNTVPMkVh?=
 =?utf-8?B?aXFRNFZ3UHVSUC93aE9nM3llckJCeWZwcTlpYkl3SFUrTVkvZFdsRjY0Nll6?=
 =?utf-8?B?ODk4UkQ5TnFCNmxndnpTZklPTHV4N0ZwdHBkRnFqL1VBK3MyM1VvTC9qb3Nt?=
 =?utf-8?B?NzRmcTFEYnJVWjA4dmNTQTVZRXhmdFFpWDIrbnJuKzUvdVFxNkVTNVBjYUZo?=
 =?utf-8?B?ZG1BNmJqcHZseTR4VndnVUVOZFRPK0drYUhpbXFMOUd2anlZWDkycTlVcHZG?=
 =?utf-8?B?eVI5WWhTb2plSjY3Uk84c09SS3IvLzByQXVVNVRwK0ZNdy9VQXBNcllubWJM?=
 =?utf-8?Q?T/fvhDIVJjYeTYjA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0cc0e2-64b6-4c8c-03c4-08dec15955bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 10:17:36.7356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LBq1+o5tadmo31naSFbkv2o4rGIUK1EbA86d5lfQ+fjWGBJmIRhJmkSuEDh9wegQ3sBLrcO14BtF8DhUaypA0zehnLIRFo8USAnU+gH8BBX7bbSBB5nyp8iZulkMlCip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_111757_993681_00F78A41 
X-CRM114-Status: GOOD (  20.46  )
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

Hi, Philipp

Thanks for the review.

> On Di, 2026-06-02 at 22:53 -0700, Changhuang Liang wrote:
> > Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> > controller.
> >
> > Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> > Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> [...]
> > diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> > b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> > new file mode 100644
> > index 000000000000..52b97870b991
> > --- /dev/null
> > +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
> > @@ -0,0 +1,1607 @@
> [...]
> > +int jhb100_pinctrl_probe(struct platform_device *pdev) {
> > +	struct device *dev = &pdev->dev;
> > +	struct gpio_irq_chip *girq;
> > +	const struct jhb100_pinctrl_domain_info *info;
> > +	struct jhb100_pinctrl *sfp;
> > +	struct pinctrl_desc *jhb100_pinctrl_desc;
> > +	struct starfive_pinctrl_regs *pinctrl_regs;
> > +	struct reset_control *rst;
> > +	struct clk *clk;
> > +	int ret;
> > +	int irq;
> > +
> > +	info = of_device_get_match_data(&pdev->dev);
> > +	if (!info)
> > +		return -ENODEV;
> > +
> > +	pinctrl_regs = info->regs;
> > +
> > +	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
> > +	if (!sfp)
> > +		return -ENOMEM;
> > +
> > +	sfp->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(sfp->base))
> > +		return PTR_ERR(sfp->base);
> > +
> > +	clk = devm_clk_get_optional_enabled(dev, NULL);
> > +	if (IS_ERR(clk))
> > +		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable
> > +clock\n");
> > +
> > +	rst = devm_reset_control_array_get_optional_shared(dev);
> 
> Why is this shared? Are there multiple pinctrl controllers sharing reset lines?

ADC pinctrl has a requirement for sharing a reset line, which is currently not included 
in this series.

> > +	if (IS_ERR(rst))
> > +		return dev_err_probe(dev, PTR_ERR(rst), "could not get reset
> > +control\n");
> > +
> > +	/*
> > +	 * we don't want to assert reset and risk undoing pin muxing for the
> > +	 * early boot serial console, but let's make sure the reset line is
> > +	 * deasserted in case someone runs a really minimal bootloader.
> > +	 */
> > +	ret = reset_control_deassert(rst);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "could not deassert reset\n");
> 
> Missing reset_control_assert() in .remove will unbalance the deassertion
> counter if a pin controller with shared reset is unbound/rebound, causing the
> reset to never be asserted again.

Will fix.

Best Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
