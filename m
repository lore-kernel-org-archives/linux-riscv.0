Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92B0D637A7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 00:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oukpztW3PJ9xryFVVBm71tc7+Ezdj+O0cI9H11l05YE=; b=lj3N8tdrTnE+8J8xuqDXk6U4nP
	dVRsZaPaBIO8En7QSWy7nGSLBfUV/zLNqtsvO3SRzP26GJlEpG5ug3JE1Op35Y1zJo2pU4bbBzZhV
	FbImKWNynTMSIDZW/s6ObYwPfrEk7x/z2fjhlWDHyIsEbYStqXcjPfWsUmseygz1jbPm8lZbamO9e
	eJ88dcfi4mURkZwseUbmdzP3+IXnYN3SgPhO44c+NQUTK9qwOjrGN0cxulqMzzhlyuHnx0rLz958+
	gu2nVOjOKE2Z/TQetUE8+vNevrR7S+RLqGMMBeW1JNBJi4ifRXmThXPPnkhPnW4Bl5LEU7xA3oGnm
	3d6qVKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBNbI-00000008L9E-3gmh;
	Thu, 14 Nov 2024 00:20:44 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBNbG-00000008L8D-0nRi
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 00:20:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQBC7A/Jv91XNgv0A2YETLSFU3UFo3LrDRHd9Y//c8qR2GnPzu/4+GAE2vLPJfcQZYQab1s8FWzpsU/FwoYH1Cl2tweMw8MdBw9DbJQeMOZiyBcCRYHBmi2tIRm87EsMIXJe2JeZI2ZSS0Lf/dkP4P+o2k5vbb2H8jb0mZ19WmisS4et9GQvr/DP1lmqMbfwsvzVw7RMDqIwXoJ0BcaJuOJMBKaH9HHSBNKrgbo0SgHm5Ueko+gxV9ZqKgYILo2EWug5kk4yfLUKX2cFt0YfGBuodFbKqU4+S33Ppb5aOUJZ7PvNLfnHwJAV3XfLY/l1O7h36WtJQim3BJQeXR+LSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/BkUPvSyrplt8lfkKG6NAeenLW0g0tWCPgMHWDXbZk=;
 b=U/05X9FVkAulZtXyT3sRs1BV/ecnJNoEbUN184BvX73dDRQZ9f3xmhDiYb31pi1AAd7eN482kzNhHdJQYVDEkKwfe86qBPQxAdwmmCgZQtTwFf3LY28GAUBzJXAF3ZfhdH++1lHr6zWgiwlQHBc3Xxm1BD1CHaJQvpA970jNPfPvA9c9ZvIaa2P6GxOaeB8thVK6yR/gzqPQUZkJ469tgpayYLSmsxsk+362oZETcWjzat4QJXGM78vNuwbpfl9w5yKlB6kOIQllj+HQbUY5JSS9VF314aAlvXiQAgNAoW/4bQF61ts9gJrgcXLqtuBFMn1ZgKrzVfw6NpscazwjpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/BkUPvSyrplt8lfkKG6NAeenLW0g0tWCPgMHWDXbZk=;
 b=IxtMUofi07Ug00xKHL3HHy3kvoBZSMte8puEnn/Q8HQdfOn8u6o7wENJBxLJTogP2YTeNpstwd1o6ePOO8/S07cZpYEiwwL4LbLP/f2K0+kmifb6OxRCWjGT4WR+M06l8LSXCVfCPxcL8Sw+PX5CJZ0gMln2ln+6rr5GWQDL6Z94+DxeeP3+yE0vBkLfDVk50zvqEYpy0pje3q3aKN0X9josWIhXLEhpP/VvPl9vhyKPMCVmQIufIiDfbfH90Y5W8DBPYlL2nWedLBgmwBn+L+G2Yy4NR4YDrfzc7J5ZougtORaFvS1C9IvOCs6izBfto2QVD2RiKwwJY2gd9RFkMQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1096.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:142::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 00:20:27 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 00:20:27 +0000
Message-ID: <MA0P287MB2822B7CFC338C7AED1F0A549FE5B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 14 Nov 2024 08:20:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
To: Thomas Gleixner <tglx@linutronix.de>, Chen Wang <unicornxw@gmail.com>,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1731296803.git.unicorn_wang@outlook.com>
 <8076fe2af9f2b007a42c986ed193ba50ff674bfa.1731296803.git.unicorn_wang@outlook.com>
 <87cyizmzhf.ffs@tglx>
 <PN1P287MB28185C9DA26A773775BDC4C6FE5A2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
 <87v7wrkv4v.ffs@tglx>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <87v7wrkv4v.ffs@tglx>
X-ClientProxiedBy: SG2PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::30) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <2496a1b0-b13d-4757-bbd3-a39f2726e933@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1096:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e0cd67-7aad-4838-e417-08dd0442239a
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|7092599003|6090799003|5072599009|19110799003|461199028|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3RpMGlWa25wQTZ3eFhrNFpsZk43YTdLQW5YSUUwcDFOZzF3anZHa2RSMDRy?=
 =?utf-8?B?Zm9QMUtQaERFVGppMDRQZEN5S1BMbTFzRTgzcVlHWU1mWGlhcnlTY2FPMEdM?=
 =?utf-8?B?eWRzVW5NNmR4MllFbnVndFBGOGNVd2RWcHhxRkE2ZFZWNWlTczBVbnlMaW55?=
 =?utf-8?B?RG1sRk4wWTREa1Y2bXRpRyt1UTUyMWJtdmFpMEVWT3dlcEoycm9BMlhuTGQ5?=
 =?utf-8?B?cDB3WmdkTzBYZld1OUsydlRXL3E4cElFTFVGYmpOWXBvRi91bFFIZHJzNS9p?=
 =?utf-8?B?SGRSNDl2RnF5MHhFbDJNV1g3R29KQzZYbmMzTGhVakN1U3NyZ0p1MjU1bnJC?=
 =?utf-8?B?L0h6ZjV2OWRCOG1SZGkyT1d4RE5CQ0FROFQyNE9adnlnUko0RXprTEFUb2d5?=
 =?utf-8?B?Z0ROYnRNZnpwcDZZNytheDZKTmhHaGVOY0QwVmp3NVlYUzl0VWVzZ0NQRGZR?=
 =?utf-8?B?Y1d4UFJTejBpNUFyZVFJQ0RaWS92QUgyb2ZZN3RscDhtZHc2c0JxKzNxZTBq?=
 =?utf-8?B?UG1VWEdXWjJxNGRCTDBkaVZIWWVLOXdFcjQ3VXJFUmFyZldPc00xNU5kcWJj?=
 =?utf-8?B?ci84L1EvazIzb1hkb0JKSTVwbnBrNVQrT3Z2RGszQ29xc3A4QnA4YWdyS3pG?=
 =?utf-8?B?d0dMV04xaHd0Y2ZvYnNyYU9MRVNWZXRyaHBJR0xhb3lmQ3UzQ1I0L2hZMnlT?=
 =?utf-8?B?ek5qN3BjME9OMVZKampBTlAvSllMZGVuWVAyVTVoSHVyRVNXblFXQjRsaVdu?=
 =?utf-8?B?ck85RllSam1OUE5JdDE2dlRXQ3B6WGFrOGRIUlp6WWpKRUNuQnR0cVRmR2c5?=
 =?utf-8?B?Q0thU0FOMWZ4SFBhSkgvSzZLODNYVVlBVFpGWmpLRHdTS3BqWGpNTm5UVmtZ?=
 =?utf-8?B?MkQyODJiV3FUc1hiYkNMemh5SXVKRTJ6RThpQ1ExZFBJdzJGV214NW9tZGM5?=
 =?utf-8?B?SWNGM3QyVkZ0cnBBeXNERHV3WUxRTFUwV2RaMTZ6YmV4TG8yTnNYTmpxVzl0?=
 =?utf-8?B?TEtWTGNYL09oR2lkcHNNZ3p4WFRlQkx2VERlNkVIZE1HVkZ3TCtqb2xKRXFY?=
 =?utf-8?B?SnFnRi9pV2k5UFFjbnlBc3MweWJwK042QzBBUmJxMkJtZE1OY0wxbG5Qekhu?=
 =?utf-8?B?SmF5Z2FXcmZGMDFKV0Q2WTlJRGF6ZUw1QVVIdTFhTUhsblM5T2xxcHR1N2I2?=
 =?utf-8?B?ekFkcG96UlY4OG1RV2MvcHVBRml1RmZ6SXo0VWg3ZHkxajRlK25EU3diOEhF?=
 =?utf-8?B?Rm1xRWUwS3VDS1FudHNiS2dPOUlpQTBKMUZ2YUJxYmd1MTk3WWxpaTBVT09Z?=
 =?utf-8?B?d3lzQTQyMkZEeTdaRUVhak9xZFM4M1lTczdkUlBvdktvWHNuTXpINXBCUWps?=
 =?utf-8?B?WTIva0MwNFFSZU14cFM4V0VKSmx6NDRRZzhNTU1Oam1TV01CTWdKYzVjM1Nq?=
 =?utf-8?Q?L3SwemHV?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVpVQXI1a2dXS0lUVnozSVp0aXlyb0JCUm1Yc0hJSVg0MUc4S1JXMTFQSERO?=
 =?utf-8?B?MnlVa1VpVDVYRHljdVk3V21GWmN0N1g1cTBSRWFGeXk1eHVROU4xemJDTmpM?=
 =?utf-8?B?YnJrcSt2NUprU1llZng4cTVqZkJPM0pqenNPT2hQK3V3ZWhZSW9kanVDNkth?=
 =?utf-8?B?dXRsRnArL1JRVG5oUUdmOVRiUkMyTjd5eVU2eHQrR1JWTG5GZTEzUSs4R1Br?=
 =?utf-8?B?dktOZjJxS3VIZkZhV3hPUC95Mml0SE5sWms2eTl0dWI5MzF3aEx4RjBiRE12?=
 =?utf-8?B?TG9uQzZVeW1WRFJ1V25FUUg2enowaDhXMzVxREM4c2sxcFpYOXdpVkVSazAr?=
 =?utf-8?B?UmpTK09UNVp5cDV4RUFqZmw4VUYraEk3VXBBWUd5STZpTFJONzZWN1pMNytW?=
 =?utf-8?B?TnhoYytTSDUvaktJOHVFcnlUMUd3NmdURVd0V1IxTHBPbXU0eERBQXdhait5?=
 =?utf-8?B?NjJsdlNSYU5RQlVSZWJybFdvRkZOcGVtd1FsZUpMbVZ4aHJ2dElwUk9BS2px?=
 =?utf-8?B?WTNNckRXWVpLWGthWHE5QjhTd0RPR21aRDk4alUrQ3BRSUpJQzdHbkhSQ0ZW?=
 =?utf-8?B?YUhyWk0vZ2xQbmNwSjB4Tk00bmZTc2VSWU02SExXTHBnZUNoREUrQ3k2SWI2?=
 =?utf-8?B?RTZIb09GUnRrT2ZXeG1TZTJXWjRwVU1BVHRXMU1zRWJ4NGF4QU04WnlQM1NH?=
 =?utf-8?B?cFdpZ0JTYWt6TGlPVGVHUzh3S2NialV4OFhLM0ZsalZXdFRqUTVoUnYySEdE?=
 =?utf-8?B?WHdQTWJoYlJnSEF4YXFvWVJ2WnNTV1VMUmxERXBHMkhhejRmZUJGMWxFaHY1?=
 =?utf-8?B?VVFEaVVNalVvSUhicTljNzBaQWN6L3phajFNWVk2TlZ6UTl6U3kxcy8vRE9O?=
 =?utf-8?B?YlNUREcyOERhR2hCZE00Q1hKM0lia3Q5NXU3NnlWMWg0LzRpOWhMa2lHejkx?=
 =?utf-8?B?L0w2Q1hSMkJtRkpMc2hORFVuQktEVkR2NzFrcCsrOUtuZFdoQUpXR3dYSzNp?=
 =?utf-8?B?amdzU1RuRW42WDhEM25aZnVIdGg0NklHSWdFN3I0VEl3NDJhUzR2SXdrWHhm?=
 =?utf-8?B?dzg2SVI1TUtsMWNVclhCVUF2d0NkL2doenBOZnppRkxiUjdIWVhXOHE1MzQz?=
 =?utf-8?B?ejBqTVRtT0xkb291MytsOWh4ZkF6eXZHaGNnbENsNzZ4NVhUbkthS2svemZL?=
 =?utf-8?B?cUZVcUl4NUcvQWlvcklRWVZmZzUvZytDSzIrVjAzSmFhMHBRVUExeVJTVkd2?=
 =?utf-8?B?d29uWDVLRFBKSi9qd3ZKdTNEK2g5dmhkbFdzT3NJaHVOM0tsNFh4Ujc2NWNo?=
 =?utf-8?B?QVg5VzNxNUtvL2tKUnl0cVBnSVFlbmZnSnJ5bm1KZjJlL1I2UmFEZjB2K0hH?=
 =?utf-8?B?eDc0K2oybjRVUjRUR2ZUUVpIbklyYjlISHBCSXFUMWMzRFZwekxrS2dsNXJB?=
 =?utf-8?B?QUdMbjRBYzFHdmViQW0rU3ovaVo1ZGFyWmlzeDJ6RWVxV3hsVWdnZDBxYmNW?=
 =?utf-8?B?T09ibU15SituL1Z6WUlIcTdScGxhdHBEQkpZNGVieWlSM1U5T1MxbGVabHFI?=
 =?utf-8?B?UXNMVy80Z1czem9GbHFsOUNVUnRqRVBLanhhakJ1Y0pOSHBkN1JYSmx4Wnpk?=
 =?utf-8?B?WmxPWXROMDhUQ2l2TjlXcU9DbFRMV3ZkR1VZUTlOYW1ZY1hHcWR3TVlGOFZ5?=
 =?utf-8?Q?K2HNwNXyU8nUQD42/PAu?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e0cd67-7aad-4838-e417-08dd0442239a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 00:20:27.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_162042_266363_8998E12B 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjQvMTEvMTMgMjM6MzEsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBPbiBXZWQsIE5v
diAxMyAyMDI0IGF0IDE0OjQzLCBDaGVuIFdhbmcgd3JvdGU6Cj4+IE9uIDIwMjQvMTEvMTMgMTQ6
MTQsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4+PiArCj4+Pj4gKwltaWRkbGVfZG9tYWluID0g
aXJxX2RvbWFpbl9jcmVhdGVfaGllcmFyY2h5KHBsaWNfZG9tYWluLCAwLCBwcml2LT5udW1faXJx
cywKPj4+PiArCQkJCQkJICAgIGZ3bm9kZSwKPj4+PiArCQkJCQkJICAgICZwY2hfbXNpX21pZGRs
ZV9kb21haW5fb3BzLAo+Pj4+ICsJCQkJCQkgICAgcHJpdik7Cj4+PiBTbyBub3cgeW91IGhhdmUg
Y3JlYXRlZCBhIGRvbWFpbi4gSG93IGlzIHRoYXQgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSB0aGUK
Pj4+IFBDSSBsYXllcj8KPj4gSGVyZSBJIGNyZWF0ZSB0aGUgZG9tYWluIGFuZCBhdHRhY2hlZCBp
dCB0byB0aGUgZndub2RlLiBJbiBQQ0kgZHJpdmVyLAo+PiBpdCBjYW4gc2V0IHRoaXMgbXNpIGNv
bnRyb2xsZXIgYXMgaXRzICIiaW50ZXJydXB0LXBhcmVudCIgYW5kIGZpbmQgdGhlCj4+IGRvbWFp
biBhdHRhY2hlZCBhcyBiZWxvdzoKPj4KPj4gc3RhdGljIGludCBwY2llX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IHsKPj4gICDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsKPj4gICDCoMKgwqAgcGFyZW50X25vZGUgPSBvZl9pcnFfZmluZF9wYXJl
bnQoZGV2LT5vZl9ub2RlKTsKPj4gICDCoMKgwqAgcGFyZW50X2RvbWFpbiA9IGlycV9maW5kX2hv
c3QocGFyZW50X25vZGUpOwo+PiAgIMKgwqDCoCAuLi4KPj4gfQo+IEkgYXNzdW1lIHlvdSB0aGVu
IHdhbnQgdG8gY3JlYXRlIGEgZ2xvYmFsIFBDSS9NU0kgZG9tYWluIHZpYQo+IHBjaV9tc2lfY3Jl
YXRlX2lycV9kb21haW4oKSwgcmlnaHQ/ClllcywgSSBhbSB3cml0aW5nIGFub3RoZXIgcGNpZSBk
cml2ZXIsIHdoaWNoIHdpbGwgY2FsbCAKcGNpX21zaV9jcmVhdGVfaXJxX2RvbWFpbigpIHRvIGNy
ZWF0ZSBhIGNoaWxkIGRvbWFpbiBvZiB0aGlzIG1pZGRsZV9kb21haW4uCj4KPiBUaGF0J3Mgbm90
IHRoZSBwcmVmZXJyZWQgd2F5IHRvIGRvIHRoYXQuIEFueSBuZXcgaW1wbGVtZW50YXRpb24gc2hv
dWxkCj4gdXNlIHRoZSBNU0kgcGFyZW50IG1vZGVsLCB3aGVyZSBlYWNoIFBDSSBkZXZpY2UgY3Jl
YXRlcyBpdCdzIG93biBwZXIKPiBkZXZpY2UgTVNJIGRvbWFpbiB3aXRoIHRoZSBNU0kgaW50ZXJy
dXB0IGNvbnRyb2xsZXIgYXMgcGFyZW50Cj4gZG9tYWluLgo+Cj4gVGhlcmUgaXMgYSBsaWJyYXJ5
IHdpdGggaGVscGVyIGZ1bmN0aW9ucywgaXJxLW1zaS1saWIuW2NoXS4gU2VlCj4gZ2ljdjJtX2Fs
bG9jYXRlX2RvbWFpbnMoKSBvciBwY2hfbXNpX2luaXRfZG9tYWlucygpIGZvciByZWZlcmVuY2Uu
CgpUaGFua3MsIEkgd2lsbCBjaGVjayB0aGlzIG91dC4KClJlZ2FyZHMsCgpDaGVuCgo+Cj4gVGhh
bmtzCj4KPiAgICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
