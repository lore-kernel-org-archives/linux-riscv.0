Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0693C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JPB4fMNmWGgTaM4WbJAD5HbiIGAKR7vUlNnEOblANY=; b=KeLCtXbr2wVUHf
	bDoag+JNj2qrHOimXa90tJhk+AZoLCaaFixqDoP/ZNQUmdfa75gKNS2hf13uTa3GFTneezG2tvFrO
	wNqlaG392VHYUHDUvIygLkYDksNqrIMN22HpYQ/lBCwtyNCoYT6LzZRmpkgySJwSJmAniOUV7XQ8K
	A5ph3kFGdoV5Ey3XpmrdMqae5AN7T9SbnGonBRipxDncWu0Wz8MtSWdjEFPFGw5sPEpW7aWm9wfSm
	hX6d+/mqFwdLd3VIcSqx8ZTKX2g4W/eapsoRyDhrkDTXVja5xB492UyYbVfMDL7z5Of50jSi12/l9
	VGpurfjG59jKxJrOgzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8g4y-00Aq3r-1z;
	Thu, 30 Nov 2023 12:23:40 +0000
Received: from mail-dm6nam11olkn20816.outbound.protection.outlook.com ([2a01:111:f400:7eaa::816] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8g4w-00Aq2g-0b
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 12:23:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLS5LThpD/4Dx267jd76BLT9UpfVKIbtHrmB3WIKgrlp5VEqge/VmCtQA6UhTAF6EGNxaj2RIAjmqbfRhn7s7cCMveDJ/NSESAptx1sx4f5iMr6mrvUe3VCfYXs6Zjx80ellDw54b+mQ+uCGIGOt1XbwEN1viJXFbtG5dDmplT+stU82VdrJWOC/8escm3bZOipulcHhA+yhNr5VjfDPpOI2KX0kWgYsm+czuep0WTRW4yQVxRYZLAXdTw2tSMslXII6kMKOPFITuUcz/BBx+fAvWJb1TBaNuzNvheXRrfKABg0A53pTqk5V142bkPnyh0BjvgD5xVhj6Zj9b9hGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTueDx6x3QAXcukJ6Z6H1X34mDdEtjpNgKxru8qmG9Y=;
 b=feY07/BKrgt4z2ZxhAF+m4j3bX9ktjv9Tk2HuD60pSyEVnngvYBLh0W/9VxckQc1UV+LnjLHWXY4ZhuqD2rBcSla8dg6r+t2rcUokmuyV9920Jr43IVDBZwQ38Ap7yCE6Y27d8ycHU4S+01qIq9kjT1u11ptU0OvJ86IM/9+t4UyOHIbRNFGGRFLV00zboezbEYPPeuWs/k+xVMs7nX/9Zfw+cp2vPAi30rdMnLH+8IguD6PlY9TH4tOOGkV/d/ajtiwYNqKbxDHTOaQQLPABXpjKQD8fShfjZIjnrdB+f5VXP4XExcnbpAPZHQ3VaQNKvyst6cFZsKnn1tTqKpvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTueDx6x3QAXcukJ6Z6H1X34mDdEtjpNgKxru8qmG9Y=;
 b=bKHqmD3y0OKCHsL7TxWncqCOWC/E9Xjq+nAJkhA0BWIbBhReDmy9i7ABAH1kSBTdrdQ0Fp5ISh5vtm0UtEEfBwPf14b6HUKpzlzVHe5j87MVLToWOM+sL6jAppmeDfevqO/FxbWyswxyIO/umcUI1RqcAzP2dNwZ1ESGSwkHxhQOla2U5knrcOhNNd6G4hUMtmWCtPNI7kxlJMUgRlkRCFqGVoHBOSmJLHEXYOlg/gnJr2SEcrxA4Kc4og8ISMhZFx7JqHUT2Qi0ksootiZLaiip5FgXP5wr/sTkQsiwXd7qQRMGwtehLq3Ak59MicW6jgvdbf9jhbsxTr+wG1w73w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB6196.namprd20.prod.outlook.com (2603:10b6:806:33e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 12:23:32 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 12:23:32 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and mtimecmp regs
Date: Thu, 30 Nov 2023 20:23:25 +0800
Message-ID: <IA1PR20MB49535AD6FEEDD9FB76AFF5A0BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130-shower-award-3cd5f1bba5db@spud>
References: <20231130-shower-award-3cd5f1bba5db@spud>
X-TMN: [GBe5sAesTPhQ1/MDBHk1OebHxvF/D2bNgMiSlRc1Uwo=]
X-ClientProxiedBy: BYAPR06CA0039.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231130122326.374105-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a57a56e-795f-456b-283e-08dbf19f2aca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wyb3D8mAOhSTsmnD/Zkz5ELHzqa+9kFQYnLNybA/xJbEcDCTgHQYsnG0BtiX3360oEHMEkdXTTNzVE6UOmk6Mp8Ipdai00yKBY+b0ldsQUZb92NzU5ljiUf5ZNCJ+wFw7fGGLtjENjB2BFgmlPViXhELZMMIyRHZWVlxVjVb+CY5LN7ZdT3hYv2rconLLEq8o8lLzUdMWdkPaCfMuBeCGACiuH9qETNEOFRXXf5Cy9XrdVn02m2sG5fXJoNjOcBLHRICcqO1+sVjt62WdvoC8GNGkYHoXZAGPmjJUdtDH8iX5+J13zrbhcJU4tCs2OyXTjjUcvCqPBN1lYq+Hkov5P2gBmZtsGH1VzWBQFdBA0xbZqSQGKVzsQgYf6peKi2L75iJhK0vREE3+VH9IwcTB9tGCjaAZPDZByOYo94gTVt2atF57SrNZPKCu8BOCMnBJLFAR2VCDnJoJ/w/kCpw5xVLZB+WEDi/VoLncC7iKrEFfCGiklhOEcoLKSihdz30+q1Mean7IrvQFCwROYVNr215V37PEbBkWDQ17Z/aIuYAyrkRipm9PuDTfi4rMKF2VB7epgjtSLgJieUFh0XsZpzieDFKvo8EOfILLJLxRDmroX70BKm2QpOB1hPDwIPyWAkATEcbkYBI2pQTLIaKxxr6gsylp1gK4zhFXXZGtpk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T05yNWdOTk93NzZxK1hHaCtoZGpEVlJLNUxxcWJGTjUyWmZkV2dsRDc5bUVP?=
 =?utf-8?B?cUZSVHNHa0F5ay9UUDNBVmtpOWtXeXBvWlNjVmM2aXd0cmpESS9ZWHQ4amNr?=
 =?utf-8?B?Rko4WXpSSi9yRnQrWjZML3hIWXIvcWR2d000OVZHQ2JHS3ZUb2kzRjRZTnd6?=
 =?utf-8?B?Nkkvalo1Q3lub3BNMnhZSFhyZytnL21CTmZQNENTdmoyZjN3SCsySGlMS1JU?=
 =?utf-8?B?OXRZazg5VytlaUt0ZUdLdm1OZXREVGpqaDczYWdtQ05QWGV5UTZFQTVoclFW?=
 =?utf-8?B?MmNwaHdCdC94NnBqdER4YmpkNnFZR3JBSFhnakVaSmxuYlVQdHJXL3kzTkxP?=
 =?utf-8?B?SW5FdnpzbEpNN0NucktkbkUyNmhuTjRFSllOOUVaaUp1aloxN0psNW9GdmEy?=
 =?utf-8?B?WVJlRzNLWE8weGRYSUhyZ1NmYWlKRG42b1daUUdXM1hhb0JadXJWQ1ZMVmtO?=
 =?utf-8?B?OWU2N2Q4d2QrV21rb3lMZXkrZlk5amN2QVVIM0V1RXNqejYycFJia0dqSkRD?=
 =?utf-8?B?YlZIaHhSS0JFZzVSRDFIcWhKOVkzeXBFc09oak1YYm45TU1EcThQNWFkb0Qx?=
 =?utf-8?B?NDhtWjRkVEZoMVRWbUdPMEJpR2VobEszcFNuM3EvQVVWckFjR0d5MkFmVzRj?=
 =?utf-8?B?Um9ERlZYRzRXakd1QTVNVGVTaTlhNVNOYXlYVUlQZzdabUZUTU1mKy91b0VX?=
 =?utf-8?B?Vjl5Y2hqYWxJa2ZZaW5SdlVBUWtraGxBR3hOVHB0V0FVU0dJNEpiWC85UFJN?=
 =?utf-8?B?MjN3UWkrbytpeFE3QUM3VFFGeUdZd0lUdHM2WXJYYmgxMy9zcFdObkhwdTVJ?=
 =?utf-8?B?cmdsYVhqMkE4YWkzT1QwL3VaR0NHUnY0Q2xtWWV5ZlJWQlhVVGRPWThQU3lR?=
 =?utf-8?B?R3gwYWtsUFZpVUdyNVVTRGw1UTljOEt6YWNranA2MDVFYU5HR1d2dC9xSENJ?=
 =?utf-8?B?MkpKQ0IveUpoTHJCK2tSWXFGRS9NZXZXY21UTnJHNU9Kc3VIOTlnV2hISFlj?=
 =?utf-8?B?WU1tV1hEK2RQcXh4NTA1SXFHd3I0ZGRTc0krUlFWK1Z4RmhiSmZpWUZqRVIy?=
 =?utf-8?B?TU9xQkdqSDcyaE1aTE1lVmFnZStkUWlScG9vc3NUSGtyenJYZ1N0K0JmNk1s?=
 =?utf-8?B?dDNDY3hxVHhGdURoeEpzbjNVNG1XRTI0VEQ0M3BKN2l3UnJnL0NnOVQ5Tkhn?=
 =?utf-8?B?K1Y5bTZocUc1OHZVT2c0KzA0amd5RU9DNUlDWmpvUGdsd2NQL0RqTHRDTFRQ?=
 =?utf-8?B?T2FaN0pBK0I1MW5CcWVqakZJVzVWM1EvOGt5TjFJdHF0RWxCTHpINk9aSTBn?=
 =?utf-8?B?NTNPam5HbnVjeDBDRW85dHJybmNHUitVR1hDM0dkK3BTa1hiMjJtc1RCYll6?=
 =?utf-8?B?Z0V3MkIrTTZacHVZcFdWRzZOQWx2dFcvbHNicTVzbnN2SDhFS2dpa3h4NGRy?=
 =?utf-8?B?R0FPTVdZem5iVURZVWp3eUxiNUZtVC9rSmRGUEp6TFJBMzVISXNoNElFajlp?=
 =?utf-8?B?V2hnNFhxeUNLYnpnR0cwWGhkU0tWUTBGTURnZ2xKOWFkYjIvcERxL0FHN21D?=
 =?utf-8?B?ejluSnd0MGJGRlNFNU8vbWZKU3NRVWk4Rm5wR0FCKzlQSkk5d09HZFBvWWtr?=
 =?utf-8?Q?6Pda/5iHCxCxt1VKNxMvNcrEG3ir9WzsGGougdjfVfKs=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a57a56e-795f-456b-283e-08dbf19f2aca
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 12:23:32.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB6196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_042338_235494_2ABA46DA 
X-CRM114-Status: GOOD (  27.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Pgo+T24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMDQ6NTE6MzJQTSArMDUzMCwgQW51cCBQYXRlbCB3
cm90ZToKPj4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMzoyN+KAr1BNIENvbm9yIERvb2xleSA8
Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQg
MDM6MDE6MjRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPj4+PiBPbiBTYXQsIE5vdiAxOCwg
MjAyMyBhdCAxMjozOeKAr1BNIElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4g
d3JvdGU6Cj4+Pj4+Cj4+Pj4+IFRoZSB0aW1lciByZWdpc3RlcnMgb2YgYWNsaW50IGRvbid0IGZv
bGxvdyB0aGUgY2xpbnQgbGF5b3V0IGFuZCBjYW4KPj4+Pj4gYmUgbWFwcGVkIG9uIGFueSBkaWZm
ZXJlbnQgb2Zmc2V0LiBBcyBzZzIwNDIgdXNlcyBzZXBhcmF0ZWQgdGltZXIKPj4+Pj4gYW5kIG1z
d2kgZm9yIGl0cyBjbGludCwgaXQgc2hvdWxkIGZvbGxvdyB0aGUgYWNsaW50IHNwZWMgYW5kIGhh
dmUKPj4+Pj4gc2VwYXJhdGVkIHJlZ2lzdGVycy4KPj4+Pj4KPj4+Pj4gVGhlIHByZXZpb3VzIHBh
dGNoIGludHJvZHVjZWQgYSBuZXcgdHlwZSBvZiBULUhFQUQgYWNsaW50IHRpbWVyIHdoaWNoCj4+
Pj4+IGhhcyBjbGludCB0aW1lciBsYXlvdXQuIEFsdGhvdWdoIGl0IGhhcyB0aGUgY2xpbnQgdGlt
ZXIgbGF5b3V0LCBpdAo+Pj4+PiBzaG91bGQgZm9sbG93IHRoZSBhY2xpbnQgc3BlYyBhbmQgdXNl
cyB0aGUgc2VwYXJhdGVkIG10aW1lIGFuZCBtdGltZWNtcAo+Pj4+PiByZWdzLiBTbyBhIEFCSSBj
aGFuZ2UgaXMgbmVlZGVkIHRvIG1ha2UgdGhlIHRpbWVyIGZpdCB0aGUgYWNsaW50IHNwZWMuCj4+
Pj4+Cj4+Pj4+IFRvIG1ha2UgVC1IRUFEIGFjbGludCB0aW1lciBtb3JlIGNsb3NlciB0byB0aGUg
YWNsaW50IHNwZWMsIHVzZQo+Pj4+PiByZWdzLW5hbWVzIHRvIHJlcHJlc2VudCB0aGUgbXRpbWVj
bXAgcmVnaXN0ZXIsIHdoaWNoIGNhbiBhdm9pZCBoYWNrCj4+Pj4+IGZvciB1bnN1cHBvcnQgbXRp
bWUgcmVnaXN0ZXIgb2YgVC1IRUFEIGFjbGludCB0aW1lci4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQG91dGxvb2suY29tPgo+Pj4+PiBGaXhlczog
NDczNDQ0OWY3MzExICgiZHQtYmluZGluZ3M6IHRpbWVyOiBBZGQgU29waGdvIHNnMjA0MiBDTElO
VCB0aW1lciIpCj4+Pj4+IExpbms6IGh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1h
aWwvb3BlbnNiaS8yMDIzLU9jdG9iZXIvMDA1NjkzLmh0bWwKPj4+Pj4gTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFjbGludC9ibG9iL21haW4vcmlzY3YtYWNsaW50LmFkb2MK
Pj4+Pgo+Pj4+IFRoZSByYXRpZmllZCBQcml2IHYxLjEyIHNwZWNpZmljYXRpb24gZGVmaW5lcyBw
bGF0Zm9ybSBzcGVjaWZpYyBNLW1vZGUgdGltZXIKPj4+PiByZWdpc3RlcnMgd2l0aG91dCBkZWZp
bmluZyBhbnkgbGF5b3V0IG9mIG10aW1lIGFuZCBtdGltZWNtcCByZWdpc3RlcnMuCj4+Pj4gKFJl
ZmVyLCAiMy4yLjEgTWFjaGluZSBUaW1lciBSZWdpc3RlcnMgKG10aW1lIGFuZCBtdGltZWNtcCki
KQo+Pj4+Cj4+Pj4gVGhlICJ0aGVhZCxjOTAwLWFjbGludC1tdGltZXIiIGNhbiBiZSB0aG91Z2h0
IG9mIGFzIGlzIG9uZSBwb3NzaWJsZQo+Pj4+IGltcGxlbWVudGF0aW9uIG9mICJyaXNjdixtdGlt
ZXIiIGRlZmluZWQgYnkgdGhlIFByaXYgdjEuMTIgc3BlY2lmaWNhaXRvbi4KPj4+Pgo+Pj4+IElm
IGl0IGlzIG5vdCB0b28gbGF0ZSB0aGVuIEkgc3VnZ2VzdCBtYWtpbmcgdGhpcyBiaW5kaW5nIGlu
dG8gZ2VuZXJpYwo+Pj4+ICJyaXNjdixtdGltZXIiIGJpbmRpbmcuCj4+Pgo+Pj4gV2UgY291bGQg
ZGVmaW5pdGVseSByZW9yZ2FuaXNlIHRoaW5ncywgaXQncyBub3QgdG9vIGxhdGUgZm9yIHRoYXQg
YXMKPj4+IGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGNvbXBhdGlibGVzIHdvdWxkIGJlIG5lZWRl
ZCByZWdhcmRsZXNzLCBzbwo+Pj4gc29mdHdhcmUgdGhhdCB3b3VsZCd2ZSBtYXRjaGVkIG9uIHRo
b3NlIHdpbGwgY29udGludWUgdG8gZG8gc28uCj4+Pgo+Pj4gVGhhdCBzYWlkLCBkb2VzIHRoaXMg
cGxhdGZvcm0gYWN0dWFsbHkgaW1wbGVtZW50IHRoZSAxLjEyIHByaXYgc3BlYyBpZgo+Pj4gdGhl
cmUgaXMgbm8gbXRpbWUgcmVnaXN0ZXI/IFRoZSBzZWN0aW9uIHlvdSByZWZlcmVuY2Ugc2F5czoK
Pj4+ICJQbGF0Zm9ybXMgcHJvdmlkZSBhIHJlYWwtdGltZSBjb3VudGVyLCBleHBvc2VkIGFzIGEg
bWVtb3J5LW1hcHBlZAo+Pj4gbWFjaGluZS1tb2RlIHJlYWQtd3JpdGUgcmVnaXN0ZXIsIG10aW1l
LiIgSXQgc2VlbXMgdG8gbWUgbGlrZSB0aGlzCj4+PiBoYXJkd2FyZSBpcyBub3Qgc3VpdGFibGUg
Zm9yIGEgZ2VuZXJpYyAicmlzY3YsbXRpbWVyIiBmYWxsYmFjay4KPj4KPj4gWWVzLCB0aGUgVC1I
ZWFkIG10aW1lciBkb2VzIG5vdCBpbXBsZW1lbnQgYm90aCBtdGltZSBhbmQgbXRpbWVjbXAKPj4g
c28gdGVjaG5pY2FsbHkgaXQgb25seSBpbXBsZW1lbnRzIGEgcG9ydGlvbiBvZiB0aGUgcmF0aWZp
ZWQgUklTQy1WIG10aW1lcgo+PiBjaGFwdGVyLgo+Pgo+Pj4KPj4+IEFtIEkgbWlzc2luZyBzb21l
dGhpbmcgdGhlcmUgQW51cD8KPj4+Cj4+PiBJdCBkb2Vzbid0IGV2ZW4gaW1wbGVtZW50IHRoZSBk
cmFmdCBhY2xpbnQgc3BlYywgZ2l2ZW4gdGhhdCB0aGF0IHNheXM6Cj4+PiAiVGhlIE1USU1FUiBk
ZXZpY2UgcHJvdmlkZXMgbWFjaGluZS1sZXZlbCB0aW1lciBmdW5jdGlvbmFsaXR5IGZvciBhIHNl
dAo+Pj4gb2YgSEFSVHMgb24gYSBSSVNDLVYgcGxhdGZvcm0uIEl0IGhhcyBhIHNpbmdsZSBmaXhl
ZC1mcmVxdWVuY3kgbW9ub3RvbmljCj4+PiB0aW1lIGNvdW50ZXIgKE1USU1FKSByZWdpc3RlciBh
bmQgYSB0aW1lIGNvbXBhcmUgcmVnaXN0ZXIgKE1USU1FQ01QKSBmb3IKPj4+IGVhY2ggSEFSVCBj
b25uZWN0ZWQgdG8gdGhlIE1USU1FUiBkZXZpY2UuIgo+Pj4KPj4+IEJ1dCBJIGFscmVhZHkgc2Fp
ZCBubyB0byBoYXZpbmcgYSBnZW5lcmljLCAicmlzY3YiIHByZWZpeGVkLCBjb21wYXRpYmxlCj4+
PiBmb3IgdGhhdCwgZ2l2ZW4gaXQgaXMgaW4gZHJhZnQgZm9ybS4KPj4KPj4gSSBhbSBub3Qgc3Vn
Z2VzdGluZyBULUhlYWQgdGltZXIgaW1wbGVtZW50cyBhY2xpbnQgc3BlYy4gQWxzbywKPj4gc2lu
Y2UgYWNsaW50IHNwZWMgaXMgaW4gZHJhZnQgc3RhdGUgaXQgaXMgb3V0IG9mIHRoZSBxdWVzdGlv
bi4KPgo+SSBkaWQgbm90IGludGVuZCB0byBpbXBseSB0aGF0IHlvdSB3ZXJlIHN1Z2dlc3Rpbmcg
dGhhdCB0aGVyZSBzaG91bGQgYmUKPm9uZS4gSSB3YXMganVzdCB0cnlpbmcgdG8gY2xhcmlmeSB0
aGF0IEkgd2FzIG5vdCB0cnlpbmcgdG8gYnJpbmcgYmFjawo+dGhlIHRvcGljIG9mIGEgZ2VuZXJp
YyBhY2xpbnQgYmluZGluZyBhcHBseWluZyBoZXJlLgo+Cj4+IE15IHN1Z2dlc3Rpb24gaXMgdG8g
dHJlYXQgIjMuMi4xIE1hY2hpbmUgVGltZXIgUmVnaXN0ZXJzIChtdGltZQo+PiBhbmQgbXRpbWVj
bXApIiBhcyBSSVNDLVYgbXRpbWVyIGRlZmluZWQgYnkgdGhlIFJJU0MtViBwcml2aWxlZ2VkCj4+
IHNwZWNpZmljYXRpb24gYW5kIGRlZmluZSAicmlzY3YiIHByZWZpeGVkIERUIGJpbmRpbmcgZm9y
IHRoaXMuCj4KPkknbSBub3QgYWdhaW5zdCBhIGJpbmRpbmcgZm9yIHRoYXQgYXQgYWxsLgo+Cj4+
IFRoaXMgYmluZGluZyBkZWZpbmVzIHR3byBwb3NzaWJsZSB2YWx1ZXMgZm9yICJyZWciIHByb3Bl
cnR5Ogo+PiAxKSBjb250YWlucyB0d28gaXRlbXM6IGEpIG10aW1lIHJlZ2lzdGVyIGFkZHJlc3Mg
YW5kLAo+PiAgICAgIGIpIGJhc2UgYWRkcmVzcyBvZiBtdGltZWNtcCByZWdpc3RlcnMKPj4gMikg
Y29udGFpbiBvbmUgaXRlbTogYSkgYmFzZSBhZGRyZXNzIG9mIG10aW1lY21wIHJlZ2lzdGVycwo+
Pgo+PiBUaGUgdC1oZWFkIG10aW1lciBzZWVtcyB0byBpbXBsZW1lbnQgIzIgd2hlcmVhcyB0aGUg
UklTQy1WCj4+IG10aW1lciAoUHJpdiBzcGVjKSBhbGlnbnMgd2l0aCAjMS4KPj4KPj4gSWYgd2Ug
d2FudCB0byBrZWVwIHRoaXMgRFQgYmluZGluZyB0LWhlYWQgc3BlY2lmaWMgdGhlbgo+PiB3ZSBz
aG91bGQgcmVtb3ZlIG9wdGlvbiAjMSAoYWJvdmUpIGZyb20gdGhpcyBEVCBiaW5kaW5nCj4KPlRo
aXMgcGFydCBpcyBhbHJlYWR5IHRoZSBjb25jbHVzaW9uIG9mIG9uZSBvZiB0aGUgb3RoZXIgImJy
YW5jaGVzIiBvZgo+dGhpcyB0aHJlYWQgYW5kIGlzIChBRkFJVSkgSW5vY2hpJ3MgcGxhbiBmb3Ig
dGhlIG5leHQgdmVyc2lvbi4KPgoKWWVzLCBJIGhhdmUgYWxyZWFkeSBtYWRlIGEgbmV3IHZlcnNp
b24gZm9yIHRoaXMuCkJ1dCBpbiBmYWN0LCB0aGF0IGlzIGp1c3QgdGhlIFYzIHZlcnNpb24gb2Yg
dGhpcyBwYXRjaC4gVGhpcyBpcyB3aHkgbm93IEkKc3RpbGwgd2FpdCBmb3Igc29tZSBhZHZpY2Uu
CgpUaGUgVjMgdmVyc2lvbiBpcyBqdXN0IFQtSEVBRCBzcGVjaWZpYzoKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL0lBMVBSMjBNQjQ5NTNCOEFDNUNCOEY4MTY1QTA5RDExOEJCQjdBQElBMVBS
MjBNQjQ5NTMubmFtcHJkMjAucHJvZC5vdXRsb29rLmNvbS8KCj4+IGFuZCBhZGQgc2VwYXJhdGUg
InJpc2N2IiBwcmVmaXhlZCBEVCBiaW5kaW5nIGZvciBSSVNDLVYgbXRpbWVyLgo+Cj5EbyB5b3Ug
a25vdyBvZiBhbnkgdXNlcnMgZm9yIGEgInJpc2N2LG10aW1lciIgYmluZGluZyB0aGF0IGFyZSBu
b3QKPmNvdmVyZWQgYnkgZXhpc3RpbmcgYmluZGluZ3MgZm9yIHRoZSBjbGludD8KPgo+Q2hlZXJz
LAo+Q29ub3IuCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
