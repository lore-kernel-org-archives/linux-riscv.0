Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B806EC021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 06:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9/FTVTurmrtDsxnfeWkiuwCLWDQeyEGAwU0iNIYOqU=; b=BcYVMDqItcUbdM
	9So66BRFo0bgD56SC0grALmhhHd/Z97sb0O9WcLV0uKqgnQWKxJz9AeoQKrpPVcNAfJeQkcBHjtA3
	SrNEs68NWfwHNhnBPDwmv1x2+a2JKNai8Pnrmoty6ZIY034i7nGfvGOGJ6W2i/9vvSkvDWq7sT1zU
	0Ex1q9dOwRum3UwdwaeR5QmZ87uaIhCUbbSfHp9HEqqCnVRkyuxvAKulYMZ365KIu5TBV58DVdsCX
	iGR2YgPNQJWbhCwVe6AmUW9KUyMPSYVeY6GYSCgzat3KxmokKXOcYfEzTMatvqO+JvVkG38zBHo1u
	xNEjx1uGb/NFgyNfZ71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0Db-0000000GyVs-3Rvt;
	Thu, 20 Feb 2025 06:39:31 +0000
Received: from [2406:e500:4440:2::728] (helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0Cc-0000000GyJM-2lCN
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 06:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfncSZ6qJFheJcIs4V4/aQanKKp/wylW9JHsp9PhmAmzN//g23UmvhjpwQMnCB98GLXTkq1yhNSUF42Ybh4So6RxjZ0loau0U848cNFjeUnb4/cQwoHmErcZBlFd+QcvvnQL/QAr8srLgzF9fjb/Ryiointl8EwbhvaJ6NLDDrDwe7hq6fqO/HKK7LFPoQpeO96Y854Wj/R4fij4OXoOmMbuzoYE7jaIqJPQGFgnK1txtbJpadWMeFuTXe1p17MISfddMXkv+nPQuK2gymjUm6Tk7srcHQk4BgKxNuQ2jtwG9TbxIwThGJBmLsNL0MeRRAVDGjwNZxOAzAkInP2bnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kkjxmamdlk/xijJXFhjFXecQCFJu/T/rbk3/kSkGEQ=;
 b=RjXx4jkAoiaUOaU1FRpqKkgR+pEro7A7tQlGJKhL3dCxJokIGXEA/fwyy5WEUe4rZgxxB6k7jV08g+djOFFnJGmm6I7tKX8WSpQEurc/1SjNtwtJ2//Q0klOwKmOTDse+otnOS8RLqdocKhe9fz6DcQY8LEo0LMr1IoBaIVHZUuuz9VNE2eh0zypnM0iB6ncOaGUyv/+Z0ufo9SLqd75b60AgGS6PNuiHAbQIYTatSDn1tFyzL/IUbaxX9biTwbNLJfM/Q3IU40lTioV+dgHVafOt+jBTFK34/gsThMfTWj/vD1xfWI/PJ/krKvt2bSLpldMdm9SgP95NkLFH7kaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1321.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.11; Thu, 20 Feb
 2025 06:38:11 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.8466.009; Thu, 20 Feb 2025
 06:38:11 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Hal Feng <hal.feng@linux.starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Thread-Topic: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Thread-Index: AQHbeTq1JBGIwhC32EGc0dBPmbEEMbM/o6uAgA0JKUA=
Date: Thu, 20 Feb 2025 06:38:11 +0000
Message-ID: <ZQ2PR01MB1307DB02B26454DE62F30B24E6C4A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-2-e@freeshell.de>
 <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
 <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
 <05B9953079BA21AF+fffef577-a880-4ed6-a71b-14ec82aeea97@linux.starfivetech.com>
 <b2d579e8-3535-4d7b-b0c1-8fab5fbd937f@freeshell.de>
In-Reply-To: <b2d579e8-3535-4d7b-b0c1-8fab5fbd937f@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1321:EE_
x-ms-office365-filtering-correlation-id: 40cb0cdd-bc05-4d0c-8604-08dd51792514
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|41320700013|366016|7416014|13003099007|38070700018|921020;
x-microsoft-antispam-message-info: e2Fsm7fTmxEtZx2RTJwn06Y0CSsVfz1dVpyGpegbh2FWw4bEMs1XIlavQ61FUOZ894835uajnRMwIeWO0U6bQLtZmPLTd6BOYbIjdI4FG1ZaQQFuLw8S8nwMokgsvo9KE9WAk3i4CuLSzMT+xoYkY3UjHUeklDl5QCYze6x4vGZHv3xbjzttIQcT8R5qx0u72raat4O0AAQUHgrNP3VWEN+XL8mvSX9j+/itygc3+cwfrpEVd6ZQXCaTdgQGsvm38REkCaJamTMpZ8z8RuoyhQCy3MdQ8EQYgcEGZ9Ksh9vEHfeEzHAwTGQckwh0/cx83QHOdSmyyjRJsMVHDqKRfvfPd2KQ+qhFaakRXex3vw9W3lvScpkcydY7dIdqGgLsxQVt8o5UKoK34ikGr1BmrTtNjhiLHpatAFoLGlDp5TbvS+PutnYiOF1ux5wG/bCN5cfGiaet4XKcBLRLiUiiMgAd1iCH5+BLWO0RVZcDGP0GxIi5B0GGoSJtKwXdyOJl1nzqkd74eEgWpkq5kE+yVaJHNGXX4yDcdOgxgx2e/K0Nzhj4aAlUpyt34crF0MZ/ebjK6e24RyaEDjxQvsNeYCcmRU66xBJGkBPolI959kM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(41320700013)(366016)(7416014)(13003099007)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGRVUld6N3JldXdwQXNVcHBwYTk0YkxDRGdVNE9PMzNHZGhWOENDQ0puSW5E?=
 =?utf-8?B?VFAzSHB2bEJqdXUrV3JHWHFrcmJvV2N6Tm9aV1cxWUUwSjk3VGlzNXFpOEtq?=
 =?utf-8?B?QVlqanhLSTlyMllJYVVHK1BBb0xwV3I3MU9xcndrQlVJeG9lVnRBUEJPeHFV?=
 =?utf-8?B?QlNIZllGOWszUkw1SkJzOFhYUlZjMTlia2RvUXA3MjR0U01OVjFBK01Bd3V3?=
 =?utf-8?B?WUZmbEJIOVBGbG5TM3JkTlVSWi9veGdMZEZhai82R0RNOGkvYk5pMnJjdTVU?=
 =?utf-8?B?dnZJZTJTNjlLdVFvaFlWWGFucnRFYkwrbXgyaXVhb1FJL3BnOWNoVm9SSUVV?=
 =?utf-8?B?M1oweUxrajFSV29vbVY5UytnWmRBTllvZUxTSjQ2MlcyckhmbTFtYXRhaVRD?=
 =?utf-8?B?ckUvdmllZzdZTEduaU1SRVQyalE4YTZ4MlgwZTAxUm9yYTFhQ1EvcGtYVEVh?=
 =?utf-8?B?MjMzeTZBMDk1MTJHMFJGSnM0TWhrZCtaV3I5dE1TVHJramMzay91R0JaVWZl?=
 =?utf-8?B?RTJsTWJzNm96NXp2ckFnTUxjTjlQU0NteGlvTnVNbklOeEFwd2J1WC94Nm5M?=
 =?utf-8?B?TFZnWGZJZFl5TTVBc0JScHdWcU5nYXBtM3F4R01HY1ZyRy9SSENwYmorUWdT?=
 =?utf-8?B?YW8wS1JGY0pmVkpldG1QRHM4b2RxbTZ0WTY0dW1MVkJ5MVhKMHpsQW5WTldl?=
 =?utf-8?B?bDVtUG9DSFZLQ3prd1JqSm5peHkrQTdjempMWnpESU5mTjdXZGNXS25aT0ZD?=
 =?utf-8?B?S05nWFd6VEFlTStuMVgxYnp5SklVL2dIaWNHTW5aS2xKanIxNlhiNy95enZE?=
 =?utf-8?B?SHQweHlCOVJjTlY1dTc0NUxoRWNFNFBoa1dnWFJNZGxXcGV1ci91cWJPR1Bj?=
 =?utf-8?B?SVB1YnZ3QzVwTjhNUmJSUG96NlhKaWU1TGtXaU14ZXVoTVVHVXphcXJZWG1u?=
 =?utf-8?B?K3BXUG12bzNoNngzMU45b1lLM3g4VlhGclk2dStzOFFzRjdoa0NkYk5STEs2?=
 =?utf-8?B?a3FlTGlNMmZISTJXWlcxUENLWWJDU3V6d3lvdktyKzBWaVNaNFdEMGQyQ2ps?=
 =?utf-8?B?ekxmZXV0RWE1Q1pPRUhZbXRKNGlXeDFNWWdsUHBUMVRqUWM5TE51N3gwaWdk?=
 =?utf-8?B?WmQwdlJKcUNlWDVUWkZDMHE1RGs5NXBzUkR2UEtIdHl4ZndIcGtkWFAwcW1S?=
 =?utf-8?B?RTRxUGxDU0Q1UTY4aUVCUmRNVUVDcGpiZ3hEUXV1MUtZaGI1Q3BEMERIOHNs?=
 =?utf-8?B?TFZZUzIyZGRuajg4N2hQRmJOcG92OVhWemJHSlBzcStMUmlJZEk0QngwUEVu?=
 =?utf-8?B?aXlnWXdBMk9MWFBWcmZOY2Y5dlRYb1dya1dGSzVLWnc2aWpxdHRpelc4SFB4?=
 =?utf-8?B?VXYrSWdVWEtuc1IyK2tRK1NEU3NjcURkVHdFV202VWtEKzFVMWVCNDJrT1Nx?=
 =?utf-8?B?R0VVaWphWkxxMmF2RHp5RGJMQkZ3WUdEMjYxY3VFVWJEKzZZNkJyNEtyRkVt?=
 =?utf-8?B?MUt1MlRENUZtMWdLRHY3bE90K1orNmI3NTliYzJZbHhFS2VHK3pINGY2b0ZP?=
 =?utf-8?B?S1cyZmtrZHpoOTVLRG9BNmVJU2xsTDhJWGpZUGs2bXZyM2t6c0NVSVJNTXI0?=
 =?utf-8?B?cGdKeHpFYkxBaDduUTF5TUFZODJNbzVXdjIxalp5S2hva3lnbDRialJkMUNN?=
 =?utf-8?B?Zy83a0gyRGJobFlhL0c0WFZhQVRDZVhlN2tvU1NRUUpQV2tjZVBGVU5ZY0hN?=
 =?utf-8?B?YzMxNVlWWTRpOUJVMGhQOGFJOXhIcXk4SkF3dUVQbjg1YitkVUVkeUFBZW82?=
 =?utf-8?B?bFBOMnhJa2s1L2I5ZndUQmFINWUxcGJkREJUY24zczJsdUJFM2RzNjQwcEdS?=
 =?utf-8?B?NTR2Z2JCQWlENm9zTTkzZU9nRU5aVUxrbExoaXE3bi9VbTRTSjh2azdQc0ln?=
 =?utf-8?B?bEs0K2VXUEhBblh1Z3Biby9IUW1yeDFBWUdqcjdFK2FBZHYyT2VyVG9kSHlB?=
 =?utf-8?B?UVRhcTFLcWpHRGpQRGF4Ujdxa0R6bkMwR2x5d092MkRreDRSS0VaTmpIc2Ns?=
 =?utf-8?B?bTFCdTRIUHJZU2tBRkZuQ0N6K0JQUzF2S1UyMU81QWRBOWdnNU15YTlKRUNt?=
 =?utf-8?Q?dZNhdJgBPrqkZJoXTcNLveOwN?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cb0cdd-bc05-4d0c-8604-08dd51792514
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 06:38:11.1410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YA5YFO6aG5VmtYRKICBOkqjvmNu0TC/pKH/nfrcqJZmF77DF9d5Tbc74cZtPkrnUqvVIEkUNgn753w1SrVcIEHetNY7/D0Z9GmnMgpHstL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_223830_864198_3997499B 
X-CRM114-Status: GOOD (  26.89  )
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

> On 10.02.25 07:34, E Shattow wrote:
> On 2/7/25 00:31, Hal Feng wrote:
> > On 2/5/2025 8:52 PM, E Shattow wrote:
> >>
> >>
> >> On 2/5/25 02:16, Emil Renner Berthing wrote:
> >>> E Shattow wrote:
> >>>> Replace syscrg assignments of clocks, clock parents, and rates with
> >>>> default settings for compatibility with downstream boot loader SPL
> >>>> secondary program loader.
> >>>>
> >>>> Signed-off-by: E Shattow <e@freeshell.de>
> >>>> ---
> >>>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
> >>>>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>> index 48fb5091b817..a5661b677687 100644
> >>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {  };
> >>>>
> >>>>  &syscrg {
> >>>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> >>>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> >>>> -	assigned-clock-rates = <500000000>, <1500000000>;
> >>>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> >>>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> >>>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> >>>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> >>>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> >>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >>>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> >>>
> >>> I think Conor asked about this too, but you still don't write why
> >>> it's ok to drop the 500MHz and 1,5GHz assignments to the cpu-core
> >>> and pll0 clocks respectively. You should add this to the commit message
> itself.
> >>>
> >>> /Emil
> >>
> >> Is this a remedy for a bug in the JH7110 CPU? I'm not clear why
> >> tweaking the frequencies and increasing core voltage was ever needed.
> >>
> >> This goes back to series "clk: starfive: jh7110-sys: Fix lower rate
> >> of CPUfreq by setting PLL0 rate to 1.5GHz" [1].
> >>
> >> Since [1] I have had problems with several passively cooled Milk-V
> >> Mars CM Lite systems powering off due to thermal limits. My
> >> experience then is that the specialized 1.5GHz operation is not
> >> appropriate for all
> >> JH7110 CPU board layouts and applications.
> >>
> >> Hal says I failed to get these assignments in Linux to work in U-Boot
> >> because U-Boot doesn't have driver support to increase CPU voltage,
> >> and Hal offering to add this to a driver in U-Boot... but that's the
> >> wrong way around in my opinion, unless there's some defect in the
> >> JH7110 CPU that it won't run reliably with hardware defaults.
> >>
> >> 1:
> >> https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfive
> >> tech.com/
> >>
> >> What is the correct thing to do here?
> >>
> >> -E
> >>
> >> From mboxrd@z Thu Jan  1 00:00:00 1970
> >> Return-Path:
> >> <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.
> >> org>
> >> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
> >> 	aws-us-west-2-korg-lkml-1.web.codeaurora.org
> >> Received: from bombadil.infradead.org (bombadil.infradead.org
> [198.137.202.133])
> >> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384
> (256/256 bits))
> >> 	(No client certificate requested)
> >> 	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A24C02192
> >> 	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 13:10:59
> >> +0000 (UTC)
> >> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
> >> 	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
> >> 	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-
> Help:List-Post:
> >> 	List-Archive:List-Unsubscribe:List-Id:In-Reply-
> To:From:References:Cc:To:
> >> 	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-
> ID:Content-Description:
> >> 	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-
> Cc:Resent-Message-ID:
> >> 	List-Owner;
> bh=GY86gaXkDRjEBAUNvogHkHuyO230wjLSabDM8v7zKQQ=;
> b=Un7uhhDTAT8/9N
> >>
> 	FxyCZTIeuEf9Tz2EWguoSASPTIRzVsA8OD+zansoq7n0Em+ejnESLoVic
> WRdNflaSCojelA6mxlZr
> >>
> 	79fy10oRgiIKMOAb1fwJcsq+rGF8jSdXwi0a2zKjGYb4u4ZNy/uLBiIynsS
> H/VCYysTKQK6p7wAiC
> >>
> 	7RYsK3WfvbZKMTBmH2vKxA7ERtfZGfNAJqRjHzBM06+ZfEDf9V2UQ3p
> GUdGPoTZYkQoS8smFEx47Z
> >>
> 	U3KclAiQD6NRzOmPD/VXwUGXQEpLonSaLk7kbAdo3cWww6Wyou3
> w4XqxHQpym6FyLsKAWWSk7d4vx
> >> 	ZbYQckPNKc65NmLst1TA==;
> >> Received: from localhost ([::1] helo=bombadil.infradead.org)
> >> 	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
> >> 	id 1tffB9-00000003Lk1-2ly8;
> >> 	Wed, 05 Feb 2025 13:10:55 +0000
> >> Received: from freeshell.de ([2a01:4f8:231:482b::2])
> >> 	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
> >> 	id 1tfetw-00000003I2R-42Et
> >> 	for linux-riscv@lists.infradead.org;
> >> 	Wed, 05 Feb 2025 12:53:10 +0000
> >> Received: from [192.168.2.35] (unknown [98.97.25.24])
> >> 	(Authenticated sender: e)
> >> 	by freeshell.de (Postfix) with ESMTPSA id 7ADA8B4C01E1;
> >> 	Wed,  5 Feb 2025 13:53:01 +0100 (CET)
> >> Message-ID: <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
> >> Date: Wed, 5 Feb 2025 04:52:59 -0800
> >> MIME-Version: 1.0
> >> User-Agent: Mozilla Thunderbird
> >> Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common:
> >> replace  syscrg clock assignments
> >> To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
> >>  Conor Dooley <conor@kernel.org>, Emil Renner Berthing
> >> <kernel@esmil.dk>,  Rob Herring <robh@kernel.org>, Krzysztof
> >> Kozlowski <krzk+dt@kernel.org>,  Paul Walmsley
> >> <paul.walmsley@sifive.com>, Palmer Dabbelt  <palmer@dabbelt.com>,
> >> Albert Ou <aou@eecs.berkeley.edu>
> >> Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
> >> linux-riscv@lists.infradead.org
> >> References: <20250203013730.269558-1-e@freeshell.de>
> >>  <20250203013730.269558-2-e@freeshell.de>
> >>  <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-
> Q@mail.gmail.com>
> >> Content-Language: en-US
> >> From: E Shattow <e@freeshell.de>
> >> In-Reply-To:
> >> <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-
> Q@mail.gmail.com>
> >> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) )
> >> MR-646709E3
> >> X-CRM114-CacheID: sfid-20250205_045309_156119_468548BF
> >> X-CRM114-Status: GOOD (  16.14  )
> >> X-BeenThere: linux-riscv@lists.infradead.org
> >> X-Mailman-Version: 2.1.34
> >> Precedence: list
> >> List-Id: <linux-riscv.lists.infradead.org>
> >> List-Unsubscribe:
> >> <http://lists.infradead.org/mailman/options/linux-riscv>,
> >>  <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
> >> List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
> >> List-Post: <mailto:linux-riscv@lists.infradead.org>
> >> List-Help:
> >> <mailto:linux-riscv-request@lists.infradead.org?subject=help>
> >> List-Subscribe:
> >> <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
> >>  <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
> >> Content-Type: text/plain; charset="us-ascii"
> >> Content-Transfer-Encoding: 7bit
> >> Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
> >> Errors-To:
> >> linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.o
> >> rg
> >>
> >>
> >>
> >> On 2/5/25 02:16, Emil Renner Berthing wrote:
> >>> E Shattow wrote:
> >>>> Replace syscrg assignments of clocks, clock parents, and rates with
> >>>> default settings for compatibility with downstream boot loader SPL
> >>>> secondary program loader.
> >>>>
> >>>> Signed-off-by: E Shattow <e@freeshell.de>
> >>>> ---
> >>>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
> >>>>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>> b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>> index 48fb5091b817..a5661b677687 100644
> >>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> >>>> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {  };
> >>>>
> >>>>  &syscrg {
> >>>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> >>>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> >>>> -	assigned-clock-rates = <500000000>, <1500000000>;
> >>>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> >>>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> >>>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> >>>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> >>>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> >>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> >>>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> >>>
> >>> I think Conor asked about this too, but you still don't write why
> >>> it's ok to drop the 500MHz and 1,5GHz assignments to the cpu-core
> >>> and pll0 clocks respectively. You should add this to the commit message
> itself.
> >>>
> >>> /Emil
> >>
> >> Is this a remedy for a bug in the JH7110 CPU? I'm not clear why
> >> tweaking the frequencies and increasing core voltage was ever needed.
> >>
> >> This goes back to series "clk: starfive: jh7110-sys: Fix lower rate
> >> of CPUfreq by setting PLL0 rate to 1.5GHz" [1].
> >>
> >> Since [1] I have had problems with several passively cooled Milk-V
> >> Mars CM Lite systems powering off due to thermal limits. My
> >> experience then is that the specialized 1.5GHz operation is not
> >> appropriate for all
> >> JH7110 CPU board layouts and applications.
> >>
> >> Hal says I failed to get these assignments in Linux to work in U-Boot
> >> because U-Boot doesn't have driver support to increase CPU voltage,
> >> and Hal offering to add this to a driver in U-Boot... but that's the
> >> wrong way around in my opinion, unless there's some defect in the
> >> JH7110 CPU that it won't run reliably with hardware defaults.
> >>
> >> 1:
> >> https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfive
> >> tech.com/
> >>
> >> What is the correct thing to do here?
> >
> > Please see my reply in
> >
> https://lore.kernel.org/all/ZQ2PR01MB130736F5C893337606FD6937E6F1A@
> ZQ2
> > PR01MB1307.CHNPR01.prod.partner.outlook.cn/
> >
> > Thanks.
> >
> > Best regards,
> > Hal
> >
> 
> What is the explanation to remove the (hardware default) CPU power supply
> 0.9V operation, and remove hardware default CPU speed?
> 
> I would think you will want jh7110.dtsi similar as follows:
> 
>         cpu_opp: opp-table-0 {
>                         compatible = "operating-points-v2";
>                         opp-shared;
>                         opp-250000000 {
>                                         opp-hz = /bits/ 64 <250000000>;
>                                         opp-microvolt = <800000>;
>                         };
>                         opp-333000000 {
>                                         opp-hz = /bits/ 64 <333000000>;
>                                         opp-microvolt = <800000>;
>                         };
>                         opp-375000000 {
>                                         opp-hz = /bits/ 64 <375000000>;
>                                         opp-microvolt = <800000>;
>                         };
>                         opp-500000000 {
>                                         opp-hz = /bits/ 64 <500000000>;
>                                         opp-microvolt = <800000>;
>                         };
>                         opp-750000000 {
>                                         opp-hz = /bits/ 64 <750000000>;
>                                         opp-microvolt = <800000>;
>                         };
>                         opp-1000000000 {
>                                         opp-hz = /bits/ 64 <1000000000>;
>                                         opp-microvolt = <900000>;
>                         };
>                         opp-1500000000 {
>                                         opp-hz = /bits/ 64 <1500000000>;
>                                         opp-microvolt = <1040000>;
>                         };
>         };

This method doesn't make sense, because the division factor is an integer
and changing clock pll0 frequently may cause errors.

> 
> I guess at the voltages here, you will have to provide a correction about what
> is realistic.
> 
> Board makers are designing their board layout with opp-1000000000 default
> voltage with default clock frequency and not opp-1500000000 on an
> increased voltage and maximum clock speed yes?

No, default CPU supply voltage or frequency were never designed for the board
and JH7110 SoC. The default voltage I said in [1] means the default output voltage
of PMIC AXP15060. When the board is powered up, the CPU supply which comes
from PMIC is 0.9V, so the CPU can just run at 1.0GHz or lower. After that, the board
can run at other frequency if the CPU supply voltage, pll0 clock frequency, division
factor are set correctly. 1.5GHz is a stable frequency to run. We had done a lot of test
at this frequency. Actually, JH7110 can even run at 1.75GHz, but that is not stable.

[1] https://lore.kernel.org/all/ZQ2PR01MB130736F5C893337606FD6937E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/

> 
> We should not exceed the hardware default CPU voltage (and clock
> frequency) for all boards without some very good reason, and I do not accept
> "because more voltage and higher frequency is faster" to be a reason to do
> this.
> 
> Hal, you have not explained why it is *necessary* to have this non-default
> voltage and clock frequency table for all boards. I know that using a JH7110
> board that allows 1.5GHz operation results in thermal over-temperature and
> shutdown, where it then does no work at all and is not useful to me. I do

Really? Could you please give more detail to us? Thanks for your feedback.
We had tested 1.5GHz under large loads many times and running at 1.5GHz is
the requirement from some developers, so we upstreamed it before.

> accept that you want 1.5GHz operation, for a specific board that is no problem
> with me because I do not have that board to test if it is any problem; I have to
> trust that you have done this testing, then.
> 
> Summary of my thoughts are:
> 
> 1. Yes to support for lower and higher core voltage and clock frequency
> 
> 2. No to imposing non-default hardware profiles on all boards, unless there is
> some actual reason why it is strictly necessary (thermal performance testing,
> operational stability, power savings, ...)

If some boards can't run at 1.5GHz, we can move node opp-table-0 to the
board device tree from jh7110.dtsi. Then each board can set its own CPU
frequency.

Best regards,
Hal

> 
> Question follow-up:
> 
> 1. Can we restore 1GHz operation ?  I ask if there is a property or strategy
> here to force 1GHz maximum operation unless the user decides for exceeding
> the hardware default 0.9V ?
> 
> -E
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
