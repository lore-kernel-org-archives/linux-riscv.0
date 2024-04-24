Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5075AC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75tJiq6Z0wfhhmu/ZCzCvki6k7aop4O9/dCN7Dpa/gs=; b=uhM82eYvMEuU6a
	K1cgFVPquqnG2J1wveemPMsDmh1xLCfTNDZgD27QOKZNTR+QFdYqsUSxLzB2hRIDdsYhV8fdEmli8
	NbPq5SeSB33sJNwe+nx5TIwcUlLM+SKUL+U1e9Tghv6Wme1IrUdZBDBjsqlB5NyffO1mdoOb/kgt+
	sGCAyz/KCRP0rP4TLiH3inVdMryUD4B+mOhcwIqNsX0Y6byH1z4V2gVLJc+c3sUtSeYB+AOv1n/PA
	f3SWuStzc7+d8SuH2vSjzDO6x74gAk54jx0iyvSzsieHOgMrnX3YvrnRzRAFKXCKUyDc1O+gb5Glh
	7mzszLFuPPrABKv/jT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcwI-00000004KlK-15Cx;
	Wed, 24 Apr 2024 13:45:34 +0000
Received: from mail-bjschn02on2070a.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::70a] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzcwE-00000004Ki9-3HON
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 13:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcjDBezAVTjCHI30gjuT2y5zJxGcILCnMtDaeAgVD2Np+fK9qfWLftW7G+xw7d5i5aApJJoLIHitzCaqMKWLOX8uL20AwDguYq5/m+u3jSxACEY8R2iO3cHV12lrZV841uJ/44SARZhXaUJJiFci29Z/nXQlDiQMXb30hjnxqmAeTYUMEzyKe+qowFl8QPXO7mOE1Ds62pjPH55zC6CmbRZ5TV1btewjbfSG29D9tSQUHnYUtcwN36Q+sMInP8KV5Lt0xThK8lAVvkR8w3EkVaAOj4eQSFAGkKaVHiA62JxichNFpIFFA2Y7zf5eBG7ChcvLWtZtquCsMiY2Kq6rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sb0lJv1v6SgSykNtK0JoYbbslX1An6zjL8VRmNNBaDU=;
 b=OAPqUpsa/pLCJX6GBtOYwXLNwl9LwZ5pXUvGzGb+4IV44+A0stenJi0/gEOjaINCaSjIEW9iAHBrB+D9Zg1Ob/SoaUnZaV8SN3Gi55eH1pdQDT6F01veCPreo3URPiC5BHLn/JQFYaHsHCHmE+1CEvwqtbCix9rgQQpiI5jiB2nQyr2k46YcaQJXgp2900JZgeRA9Mhfi2YBXkt9td2/6tlXthOjD5ABdqw4HkGs904a7M/gu6VQSa/+7QqGv9GLLLis28hEwBu45qlAB4TriqB/8MUEpCqvzpH5cOvQ50vcxoZ5mIGPf9BNoelJK50M175aBfOujq2Rmt3LpvJXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0732.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:23::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 24 Apr
 2024 13:45:02 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::e0a:f88a:cad1:dc1c]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::e0a:f88a:cad1:dc1c%7]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 13:45:02 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"conor@kernel.org" <conor@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>,
	Joshua Yeong <joshua.yeong@starfivetech.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v3 0/2] Add StarFive's JH8100 StarLink Cache Controller
Thread-Topic: [PATCH v3 0/2] Add StarFive's JH8100 StarLink Cache Controller
Thread-Index: AQHalh1L5wyUsS8uPEy7rWDMd1lKELF3MBQAgAA8cqA=
Date: Wed, 24 Apr 2024 13:45:02 +0000
Message-ID: <SH0PR01MB0841043563C57D877E0D682FF910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20240424075856.145850-1-joshua.yeong@starfivetech.com>
 <CAJM55Z9hObw7T=Z92w_5pYVcuR3UDW-Mas5YpCoGv4Y5s5M9xg@mail.gmail.com>
In-Reply-To: <CAJM55Z9hObw7T=Z92w_5pYVcuR3UDW-Mas5YpCoGv4Y5s5M9xg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0732:EE_
x-ms-office365-filtering-correlation-id: 35535004-2d49-4e8a-430f-08dc6464bdad
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zJuYqVJQ+ig2zJz7/IAIou1do3RiZZvoet3vw86JFZ7PnKOHNdph416KPWgvvmOGHYcgcOdkMicQc0AKjrsBvspa/ONukLrRs96k8b/UBkKDEfT/NJLKLjXZ7HW8qaLq4fqxAgaoSJo87JEUSL0uLiB4KkQH8ozsDu35YrJQi7g2YoDDKTzxTsfij3PoYRuQefkpjGQcGamP0Hqag9nUcTqKZcuY4hkWOpREmViXXAT0NwGD0NFA0i6uOvsrCWDrPAhHxLikJFc6bpfhKEqbprwS4krNL1fHkIx3KKMM3rpZaB656WvHj7XFz5pDdiPzqmi3qBPapY5u1bzS+qUgxxtg8vu5tk0H1Imn3KVohJ7YdVM391NY+JR7Mu0AC7oEVjuXB87w8LQfPgZrcKO577/ipemUXUUUjupQzfxArnC3JZ16nMWyHg2Rq5pjopO2wKM+2F27Pyj3ZhvhdQpzPycwrqfCF0EslSgIwyTIW/YgleSb05q0H4JQpcxm/F/pvOQs2GMYXAg8nSRCL5rRZDetchDTg89U9WOxSXjhAHS5l5Ml3cW8A4V4p7W3YASUzr+EV+S15vHLo7DLez8gMg8K4IoiNd2NUwVjgXgGwDpB7H6UAZHtGXa2amgdlMv75QsSa7QbXVE3k+kbaT4XMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(1800799015)(366007)(38070700009)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDJwdm5VK3FnTnR2MXpsZ1FDR3pwdzBydVBTNFVsMXN0MDRMbkZBTTA4Mi90?=
 =?utf-8?B?Z3cvWXdXMC93eE5wcEp5Wk5OSVpsQ0RiMWRYU1lHaUdHU28raDAranpXNHE2?=
 =?utf-8?B?bzRiaUIyMjRCRGllcWF5QlRCY2ZpZW8vTnpLQjJTblBLbGJ5ZlpXTlM4djBB?=
 =?utf-8?B?VnF4SVkvbVVIbk1lR21vSnhmbGViaWdWVlJZblRzK0lnVDdJYlhndTVFYUdv?=
 =?utf-8?B?UlhnMk41RlMyb1JqcFVQYnh6cDVlRXhBZW9yZExzWkszZ0ZOdlQvVENnSDVY?=
 =?utf-8?B?bmQ3ejMrVG1vcFRPUG9lNHFYcUdTRW9kdWRScmM0V0oyd2dSNTdHMlRwamdo?=
 =?utf-8?B?UVJzTkphOUlnSUxHMWlMVzBmM1puVm5nMUtrU0tJQ3BMV3dFT0NXU1M2NXph?=
 =?utf-8?B?ajFtbWxqdmFZb0pZaTZtYU5wNzVYcEwzdXJDZUxsOERERE1xZTVyelUzL1Zt?=
 =?utf-8?B?K2hkbXQydEIyV1RkR0c4WklKSzV3SEljNURmYitUSGRESWlQeG5Yb2tvbHo3?=
 =?utf-8?B?NVYxTmNmSFVWZUxQaVBXVWJQMThzNlAyUHNDblVNM2NGbnZ6Ui9BYlhUL05Q?=
 =?utf-8?B?b3J1TXgvNGUxRTd4VXVCREJ2QVZ6cU5ZdFVGOEg4b1B5SGRNYmtKV0Z0aHZm?=
 =?utf-8?B?dHpBR08vZzQ0ZjdBeVFCVG03R3pkM2pSSm5kTXo1SUNCcXVVemdXOGVPbWpz?=
 =?utf-8?B?VUgwbXl6dFRWZm1yMEQ1eTcva2RkM2VGWlRKTHhWaEJqdk5IalNHc3hNQkJ5?=
 =?utf-8?B?MVdndDllbG5tVTcybjdWU3ovd1FhNE1BT3JZTUltNVR5TklldVBNdXV4b0h6?=
 =?utf-8?B?SzV0M1ZqTEowd2JLODZMQTVsVUNmT2ZwVUhxVTJGdjhCNk1DWkJJeHVNV0lh?=
 =?utf-8?B?UGZkOUVvVmh0TmJ1WSt4NExSbkhaREs1di9zWC9qOXVyRTl3WkUveTdheHEz?=
 =?utf-8?B?NWs4MmtjRlRNMmk0U1ltZEVUYU9ORmJOQVdENEY2RjdVcHgvN3NMWWRMbzhl?=
 =?utf-8?B?T1ByR2x0N1NCZ2VEZ09Mb2I0SEtlZkR6RWNheGRqNTAxY0hrRFhHQUhvYysy?=
 =?utf-8?B?MnE4Wmw3VWNPUlJ6REdDRmVtMkZYNU9KS2FEbHJKV1kyMW01c0pRT3JPcG5Y?=
 =?utf-8?B?dzYvWC9vQndGSmpnZ0VHdHo3TTRaTkNtY3M2RlZCajRWZVZqYlVVYitPbGhV?=
 =?utf-8?B?MUlYcVdtclRZQVZmUk1sT3U5UW9GMWNIbXRDTGswN21YbmZPN2srci85cnJP?=
 =?utf-8?B?R1hhd2pEbUg1Tm55YnBRV3BBZmFnODE0UkpndEt6UWsrY0JBNEovT2xXQVZp?=
 =?utf-8?B?VEpURTlBWDlMNmxIcnpXeWw2c1lIZHNXcFV0ZmxaNnNWVGhpN04zNzVnOGQr?=
 =?utf-8?B?QWhXYjZ4Y3R5Y3BKcVRDUFFHcWRHOTd5WmFMM1JBZVc4ZmY2R3FLQ253cklx?=
 =?utf-8?B?V3Fuako5aFcrS2Z3S0M1cFh3TmswNW5RejJIc1VERWY3VG5VVXlvVkpybmhN?=
 =?utf-8?B?MWpERGNBMmVMT3YxazdyYlhya3RpL1BpZE9MTUJHVk4yL2VhejM5Q3Y4a0s4?=
 =?utf-8?B?OUVDZSsvMTBNc2NYZXdhbGRUdFh6NXBWd3c2UnI2emxsMlhZcW93MVNuU3h0?=
 =?utf-8?B?eXkwRDdDaVQwSE1TbkRKU3BNUkpNdlpKeTlTNTZJUFB0R20yczAwdEZmK0J5?=
 =?utf-8?B?NHlyWDl2UHRxd3dKWTRpNUZ6c1NvOFJKeFYyMFMxOGdJSzRKbkxpYlNxUnBY?=
 =?utf-8?B?Y3NaQXVKV2VWK3FoQXJBcmpNSGtEejVYakFZcTF4WkNjMzlnOGZaOTNrNjVr?=
 =?utf-8?B?WXl2OElXM2hCZ2JuUnkrVFcvYW1ob29OOVJDMldGSkFYRkMycU5ocm5NcnAr?=
 =?utf-8?B?dHJLOVRlcG9BZytXcHVuSmdhcVU2WEpEZ3RSdnROc3ZQS01MU3B6ZWZRZEt0?=
 =?utf-8?B?WTM3UHV1WGQwZjZTRUJ2V0VSQXcxVkJSa2E0N3V4RHNVUHJVdTRFSm82U0dM?=
 =?utf-8?B?VDZ6WGFEUzJ5eVExVTJUQlhZSDBDOUlZTDJYTzY2VnJkOGU2VjlzRHplZndp?=
 =?utf-8?B?Z08vL0NuYUxoSHdISlVjTDJKZHk2RERIWnk5d1Zja0RPRjdxeFlRVVZORXVF?=
 =?utf-8?B?YTNjMDdZNDZ3bFNtbE5renhOM2lQNGdPRGZmQys5RlRlK0RxTWlIdE5nYi93?=
 =?utf-8?B?V1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 35535004-2d49-4e8a-430f-08dc6464bdad
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 13:45:02.1334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1duhJ8cwLTPhQGd25AjdPvhsIa0OVAAcVnztGbaB0KDawENKWZ7tTg1SRJxPl96MXAOMSYjIQH2mml/KjWi3Vw01Wf37oxToKD3PDq/DFNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_064530_849755_E801CCC0 
X-CRM114-Status: GOOD (  18.83  )
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

Emil Renner Berthing :
> Joshua Yeong wrote:
> > StarFive's JH8100 StarLink Cache Controller flush/invalidates cache
> > using non- conventional RISC-V Zicbom extension instructions. This
> > driver provides the cache handling on StarFive RISC-V SoC.
> 
> Hi Joshua,
> 
> As far as I know you didn't tape out the JH8100 yet, and you seem to have
> replaced the SiFive cache controller with your own implementation. Can you
> exlain a bit more about why you didn't implement the perfectly good Zicbom
> standard instead of adding yet another non-standard work-around like this?
> 
> /Emil

Hi Emil,

I agree that the Zicbom standard is an important extension and future-
designed SoC should have this. In the V1 patch, I mentioned that the CPU core
used in JH8100 is matured, but unfortunately, it did not support the Zicbom
extension. JH8100 integrates 'Starlink-500' IP (more information homepage),
an in-house designed interconnect between peripherals and CPU to handle
cache management operations.

Regards,
Joshua

>
> > Changes in v3:
> > - Fix code syntax
> > - Link to v2:
> > https://lore.kernel.org/all/20240423072639.143450-1-
> joshua.yeong@starf
> > ivetech.com/
> >
> > Changes in v2:
> > - Change patch title from 'Add StarFive's StarLink-500 Cache Controller'
> > - Remove StarFive alternative from errata framework
> > - Fixes warning from
> > https://lore.kernel.org/oe-kbuild-all/202403151625.boKDjHGr-lkp@intel.
> > com/
> > - Flush completion through atomic timeout function
> > - Link to v1:
> > https://lore.kernel.org/lkml/20240314061205.26143-1-
> joshua.yeong@starf
> > ivetech.com/
> >
> > Joshua Yeong (2):
> >   cache: Add StarFive StarLink cache management for StarFive JH8100
> >   dt-bindings: cache: Add docs for StarFive Starlink cache controller
> >
> >  .../cache/starfive,jh8100-starlink-cache.yaml |  66 +++++++++
> >  drivers/cache/Kconfig                         |   9 ++
> >  drivers/cache/Makefile                        |   5 +-
> >  drivers/cache/starfive_starlink_cache.c       | 135 ++++++++++++++++++
> >  4 files changed, 213 insertions(+), 2 deletions(-)  create mode
> > 100644
> > Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache
> > .yaml  create mode 100644 drivers/cache/starfive_starlink_cache.c
> >
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
