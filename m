Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97422C54E68
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 00:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLfxbxM/EGA/ireEkFYIiJfTmAuCC4SPbd9IgwUnxK8=; b=HHaWQ1vK+72ORcnDBpDLVbseQP
	zsEmHkN5iynk8IBFUPDJdpKzPEBGcSDZZLySH4Epn+FbdtMRVbfnfQih22rXn2yNKDHEWQuCP8zB0
	JX2wR3ir1BcoQii4Gf2ua/8Pe0LIqJi+RNt4lMhYJyG6MhkTX7MEW8+IJk2GB7JOsUfe9RV+S+7yt
	OmhnZBebHzWd4Q/8s4bYBucmxUi7RGvsAAh3yDgyaVrofjVeAu/LAfSJ/3TGyhz/SAglAQ2elHaRL
	w9jjAxp/4NviP0UO5AdIu2bWMeT0UELhQrhaH4NLJIRUgw9BYSOfjtL28BXhLTq16WzQ/AK6aAaMu
	6M+6iZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmjha-0000000EkAC-4BQz;
	Wed, 20 Mar 2024 00:21:07 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmjhX-0000000Ek8h-1gc5
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 00:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlxQSDoEAfArJ+eWDqCP/lxVCOWBzfSTcE1D4V9W15Dk69ayH97GwPA/VtbW6ByL4PlmVKadN661hTRoTtZ53FH6X8vLhil0+Xbq8NYSmBuD+JK1L1SMXtkZh7MCx7u6sZDW+93dddQK6TpsEShKeNtIN62xJJfb6n2CrVZEDGIUzgfOZQAiCROnh4ESN9t7edqWSrxtKGC7aOfeWGSV5tXHRJSbxCXg8mjR0Mlgl74wHSsFn8IlxQGMy3qsuN9XBmfmXTaw91rrxo2t6GZ8gxyjr+AxpjnoONuOV8MduFxCkA+2FGLjVXEuTx4Kxrf38OyGjMdb/bbE2VUEwFLEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGcEnkPudbXO1UE8KGEJRwVGIHCngp38DpNNfXHf+iQ=;
 b=dSmnc/6gJRtD2v5Pe1F3UaC06UT4My3DulLtmwvwGaLB7/gOBVPJjjjoz6/3mGHBH+kaHW88qZ3bL5prZ7kN7BkRvcfPW060c4PeQ8o2RxN0f/IEvcLJGIqQ2AQVMLDIDfr88cCaTsJT3hAer2lihJ2Bv5642Ynb7TD/XzHrz9Q7WQ4w/av+5iQQapM04rINVBTUIjjagJhKAzYfLp4fyETfsK29FvbX8G3IzVLOb+J5tB6PkRMIN96YgLnqt1Gy+I8/tVivdTKvs4urlKDUx3e+FeUJLQ4EPH7ziexU4n8eNeEzSA1zokap7SS3l1mfHbC0KTLTEFeBKVG+5xS3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGcEnkPudbXO1UE8KGEJRwVGIHCngp38DpNNfXHf+iQ=;
 b=RbE8lCNMm2Ns2ZJSOaXo9/XjE+nVeHShHZRjUBY6N4zF7jS2cn6BnqwDkJ+jAvvGZKCV6/+D6GgS4hVtb3gc0v+nil2+yb4gyjDZMopVZHXyygJe+GQ9mPmJpBMhRkkmO4sgaJ8N+oPFSuBgrXlXddz+5Jjv31sXw2+w1uH7TedeYDRbJe/qhfDRl/Noq0VpOemDoOq2y6IFODIrNshxgIt5T5TvQKl38nQx0ctPUjym6F1XutEPaGTQzt7mrBhULkv6C0P9D+V4AgWK1bUMMwhqBG49+j03epuhe9aInXuGcKve3BJD3NccAAyObT4nbjy2zK8Cp0kT/nHmNtBkmg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1526.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:186::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Wed, 20 Mar
 2024 00:20:46 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::1bd4:64d4:daf5:ae42]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::1bd4:64d4:daf5:ae42%3]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 00:20:46 +0000
Message-ID: <MA0P287MB28226312B98C83517CD0D7D1FE332@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 20 Mar 2024 08:20:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: support SG2042
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: unicornxw@gmail.com, inochiama@outlook.com, arnd@kernel.org,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, Conor Dooley <conor@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
 p.zabel@pengutronix.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski@linaro.org
References: <mhng-76918908-fb82-4312-9320-959318b98b5f@palmer-ri-x1c9a>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <mhng-76918908-fb82-4312-9320-959318b98b5f@palmer-ri-x1c9a>
X-TMN: [TRwMbo3r5377wlRQVEglJ0jODw2wYNKJ]
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <e78e6cb0-6572-479f-a100-7fb676829b0a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1526:EE_
X-MS-Office365-Filtering-Correlation-Id: a29e5305-6190-4cd3-b6dd-08dc487395ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAnaMvpuoB5sq6f/OmYZpdFuoCKa9BMz3ArAZuSjiPHKhzM664gxdO3vI3Pn3EvMz//nGT4r6+Lnx+0fZtz3F/trCXZDXHaFn4RuOumiLcWkDvICoIDioWCV97A/qbVc0WQ+hSErCbBNeE8gHzmDPnK6jNLTgnghFlPxoOx68gFeyrdfAkIEaEZhDzlp1CLNxTaiqPKGsdXDiXKcKoM3ElFNenurh+jxq8qG7IrRRFOpwpPjtFTmQFDBcc9Lqn6Ep3+A5vZXhfvhAHTnIE2OUp3CINmVKV5y/Xw47Ay2B3lZYULpUd8dBFZQaNFVG1Wow1xk3ZFVffBnVTHx2cllced13iurxxxg7VH31GJstrokfzyS1+doNONPcDXxutdoXDEY/1OBqjbHWJ07hmHC94CkcSjfmerj1sYVvz6w8hwSEE3JDRXYBQVnadm3s9OisyRRX0zXR7GUMtUnESbiwK3jAe48eoe196RsM3bsihxyg8plcxutHw2uvl3FteaFqJD1gfS5cWtUZ+GN8KZKwU2Wqlljvhb7Bh3l3RGrJqeWUQxCfw6poPb5UXuMtVB7zwr/tBZy8KyAdx+YVpdg3dWjnk4WuMboepvrFDSJyKi766LiB8V5Xg8FwnjFew0EEV9CgVh5NFA/GVLqzXV369MgxwzGhI1FoTE9+un9g8E=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2VHSElwdnFBY2crVTRCeHdhblpDN0ZkczdvRlJ2TjBKdHNnRWUwWXlZNGZ0?=
 =?utf-8?B?TkhSRmJwZWRyUXZKbmxVcHJvclRtMmlITG83RCtLenJIOUVWMEY4Wjg2dFJu?=
 =?utf-8?B?KzNOcVVKcVA1RUQ5OHNDZ1l1MFNEa2xWdUtUcU1taHdFZW1pWnJLZlM4K1cr?=
 =?utf-8?B?aU9TWlk3ZXhmc3psMysvakRSUTVPZVprZVdMSWFBV0dUdnV2OERjN1B3NzBN?=
 =?utf-8?B?OUcxMTVocnZLNDVGeVErQ0czYTk0ODZHeVZ4V3FUejF6WEJmWmJoaUtFeG9B?=
 =?utf-8?B?cUZmMUJiYnFNbGtHdWkrVkRKUVhTTnhHUmVqcFlJRlZMRzgvOUNBa3QxQ1cz?=
 =?utf-8?B?eXZBeEhoOWJFOFFmM3dBbkVBQ2E1WCs0ZHZvVmdzdVdHNmVTMFhPSVkyclFo?=
 =?utf-8?B?S2w5aS93RmJIK1oxTGVibHpKT01MYU9VMTlTZ0l2OUdhOStFZmFnUUV5ZlMv?=
 =?utf-8?B?dVVrTzE1S3I4MXkxMVM5dTJkV0FpRW1idHlENVJNNEROZ0k5RVBrTnkwYTM2?=
 =?utf-8?B?alVXbDVleFJOcVh2T2l4MitmNytNVEg4dFp5K2ROQ01UTEQxZ3BtUlhDK2cz?=
 =?utf-8?B?UWFRbkVxZXB4aDM1TmxhSTBQcjNVL2RZbGFHclZNczVVWEJBQlFTZkx0VFpO?=
 =?utf-8?B?RkR3VktPZXVnYmVQOEFzQmFhcEhtUFJOWU5MZG10bTZna3dOajhQM3JkcDBY?=
 =?utf-8?B?RVFVdklrUE11S2hPR0l2Tk43ZlNGdG05ODI4cVowNmFqYTlRNVRCaDdFR3NF?=
 =?utf-8?B?N1lmNExXU1hhZE43ZVQwN0dRWGMyb3dpMGEyWStmL2ZuUm10MExYdFpxVjAv?=
 =?utf-8?B?bEFHejlDVXBCUGNZUDRTODlhUTN6MDByd2VnTGNuOFVJQ3NiTnlnbkVXMnM1?=
 =?utf-8?B?cVROWXU1UXpNZmN2WFBrbUlSQU1hTURKellOcVJtZ2daQ1BGNGloR1hLNFhD?=
 =?utf-8?B?Y0VYWVpLYWlacVRSVHo3U2liUytlZTF5cWhDVTE1eW9rcGlLODZ5S3RhQk9D?=
 =?utf-8?B?ZGN1YWErMnl5YS84SlFGOWZ2RitEaHFPMHdWUjZlUkgrcUlPODliSTkyT2E5?=
 =?utf-8?B?aGdERmIybDgxV2g4NklhY1lQeG1LTUR5N0x3cnFJamphWnIyZVRoaExmQ3ZU?=
 =?utf-8?B?ZThzYytmVGkzbWNlWHh1VG5WanV3aDlaOUhlSU1uUWVJL3cyVDRwL3lMUkd5?=
 =?utf-8?B?dUxUOGt0UjFVYm8vS3h5QWhEUTBNTUpxVk9CcWtYR2ZGdTd4ZnE5NFkrMnVa?=
 =?utf-8?B?ZVFudU1wb3EyMy8xUEVkMDdNaTQ1RU85TFpraWt5MVQxZ1UxVVlSVElLclBH?=
 =?utf-8?B?VDRBdE5nbVd5bmpXYTFGOGFXZGlrK0JJT1dNa1ZZUStnVUIvSVVoYmZkTGdz?=
 =?utf-8?B?VUNldHZSYlpPSkh2M1JBQjc1c3I4UThmK3VIdHVnd3Foeml0YzlhdnVuaFky?=
 =?utf-8?B?NG1SYlFYWGNpWllVMTZ5S1VNUXV3b3pSdUp0LzN2bXJwYkhzYUxOaHM5VEZa?=
 =?utf-8?B?aWFhUjhaOW5iMXNpV2x4Sjk1Q2hIb3lYakZUYlVDRzVqSDJVbGMyREdnVVBG?=
 =?utf-8?B?ZUVXRU1hTGRnSkhTaHRRL2VWaFNJdm85ci8yVVcwbGMyd094dEpVVitvZExh?=
 =?utf-8?B?QjhudTJvWnFlNERna3N3dzNJbGhKbUZ4N0hmVlZYdHpIc0dQZGJmMFhqcitq?=
 =?utf-8?Q?hvAgLqIVl+/S8Kf0g0/w?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29e5305-6190-4cd3-b6dd-08dc487395ca
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 00:20:46.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_172103_467824_EA587ABA 
X-CRM114-Status: GOOD (  11.70  )
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

Ck9uIDIwMjQvMy8xNiAxOjIxLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBbLi4uXQo+Pj4KPj4+
IFRoaXMgaXMgbm93Cj4+Pgo+Pj4gRml4ZXM6IDFjZTc1ODdlNTA3ZSAoInJpc2N2OiBkdHM6IGFk
ZCByZXNldCBnZW5lcmF0b3IgZm9yIFNvcGhnbwo+Pj4gU0cyMDQyIFNvQyIpCj4+Pgo+Pj4gd2hp
Y2ggbGFuZGVkIGluIExpbnVzJyB0cmVlLsKgIExvb2tzIGxpa2UgdGhhdCB3ZW50IHVwIHZpYSBJ
bm9jaGkgYW5kCj4+PiBBcm5kLsKgIEkgZG9uJ3QgaGF2ZSB0aGF0IGluIG15IGZvci1uZXh0IHll
dCwgc28gSSdtIGp1c3Qgc3Rhc2hpbmcgYXdheQo+Pj4gdGhpcyBwYXRjaCBmb3IgbXkgdGVzdGVy
Lgo+Pj4KPj4+IEknbSBoYXBweSB0byBwaWNrIHRoaXMgdXAgaWYgZm9sa3Mgd2FudCwgYnV0IGl0
J2xsIHByb2JhYmx5IGJlIGNsZWFuZXIKPj4+IHNvbWV3aGVyZSBlbHNlLgo+Pgo+PiBIaSwgUGFs
bWVyLAo+Pgo+PiBJIHNlZSBBcm5kIGhhcyBwcmVwYXJlZCBhIHRhZwo+PiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zb2Mvc29jLmdpdC90YWcvP2g9c29j
LWxhdGUtNi45IAo+Pgo+PiB3aGljaCBjb250YWlucyB0aGUgYmluZGluZ3MgcGFydCBjaGFuZ2Vz
IGZvciBzZzIwNDIgcmVzZXQgZHJpdmVyLgo+Pgo+PiBMZXQncyB3YWl0IGZvciBBcm5kIHRvIHN1
Ym1pdCwgYWx0aG91Z2ggSSBoYXZlbid0IHNlZW4gdGhpcyBpbiBMaW51cydzCj4+IHRyZWUgYW5k
IG5vdCBzdXJlIGlmIEFybmQgaGF2ZSBzdWJtaXR0ZWQgdGhpcy4KPgo+IE9LLCBzb3VuZHMgZ29v
ZC7CoCBJIHJlYWxpemVkIEkgZHJvcHBlZCB0aGUgYmFsbCBvbiBhIGZpeCwgc28gSSdtIG5vdCAK
PiBzZW5kaW5nIGEgUFIgdGhpcyBtb3JuaW5nIGVpdGhlciB3YXkgKEkgaGFkbid0IHBpY2tlZCB0
aGlzIHVwIHlldCwgCj4gdGhvdWdoLCBzbyBzaG91bGRuJ3QgbWFrZSBtdWNoIG9mIGEgZGlmZmVy
ZW5jZSkuCj4KPiBJJ2xsIGp1c3QgbGVhdmUgdGhpcyBpbiBteSBub3QtZm9yLW5leHQgdW50aWwg
aXQgZ2V0cyBzb3J0ZWQgb3V0LgoKRllJLCBJIHNlZSBzb2MtbGF0ZS02LjkgaGFzIGJlZW4gb24g
dGhlIG1hc3RlciBvZiBMaW51cydzIHRyZWUuCgo+Cj4gVGhhbmtzIQo+Cj4+Cj4+IFRoYW5rcywK
Pj4KPj4gQ2hlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
