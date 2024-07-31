Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4070EC3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iu9dRPdJ7mZC3DvByQr3zTspLXjFowy+BHL+m9QC2w=; b=JiyojFhY/5ox3X
	0R4B5iYxxLncHTbn22moC4HzhcTPKGOu3jFyMpy12vY/u8pwriDqiW0di30W7lGRfYWq2DV4aocnw
	ajcgxjgsaKTcDyso0g9E0yunQ1eslptO6TEi4pYFUuZxM6oEmRJ9nmRJpIVJyM6z9oYHraFMyvP0s
	hlYFhSxnwMg9m0pT18P/Tvdrq7tBJn+NUETgcvyYCaNLTiW6XZwDyrMhkpGJbKH58ptiGawFl+4ij
	OGQvJ1G7YvjV/egmg2argo61QA8FE0AofXvy7MGSxjkTN+dmyA3RGla9Jv5ZEdu/UjRKeEhVcouJL
	JPfCBYTpVUgYRowux7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4ew-00000000JHU-2SSE;
	Wed, 31 Jul 2024 08:26:10 +0000
Received: from mail-dm6nam10olkn20820.outbound.protection.outlook.com ([2a01:111:f400:7e88::820] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4eu-00000000JGk-0vYm
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 08:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Irqx44JPTxBBisZYh7NH5C4cDX/hwKqMcozbIm8jpzKxMk2cZdOwqckOwkMFN1ft9gZSI7ziEYusIHNnhGy5B2p/7ktEvU7zJQr0ccC5eYpngiqMSM3H3tfVI9Z5JXMX8TCaYTgv3x2/tW+whddz1LpYNFJ2K/po86+rR/0Gb85lCAy2Rp3ZlHNLUJ6nvg/NQqD/VzuM0PH0ICPErSbuaNiYupsuLz7NrDVy1rx9VHkkQfSuoXO+ovQLReXawNaxUlKwsjv9xcJn2ZsT4toP1Ga40QvReY+BM/PlcSAwH5mcHEH+ra+lbtE9ynIWhdDnl2MNeW/EL5MKumDgK5FLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOsqWFYHwCWn56MmdASr3l6GomngTyhJKQc8sDelms8=;
 b=LPk+MEtVD82mhoX/xcTzPVAhhhoV82Dfz3K8eibXSMNZDBGNkhdPZ0wOAl6iwLtFyaeeYCGo+9jeLUXp/9oWbH74Ydjd1fdOPTQjG1NPI8Mu+S753sbpf5NEsSF924kCIv7nVHCnbraLIk+CGAdjdxbd70M5zbtnXCuKs5A+kkJFdES6ZSyyIIYJ4Qxav0t/+JpSHA7rxHLoH/l+ubWCXT14N/YM4OCEUbnc0YUAhXGcMg/xc9k48+P1KxPf+Ykf7atDxR4Get0KE5pc3NBhtq7WZnGJQp0po7PCmsPSFx25wnTelXGKFEV3CFyGdNTJtGwRM4CO2KCChAiJ0CpNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOsqWFYHwCWn56MmdASr3l6GomngTyhJKQc8sDelms8=;
 b=OPUnwLv0emc/PXJyXukjl2okT0ce9R2GSIFtrea4yT8krWWO5wkD9Exs2ZTfYWd8RlGFY55xzkuO4zy9j5tMTp3h8q/3jQgEKOyAm9vx/zGkG3rrikJuJxNKjIfTeX1YEGlVCZQd2fI3eeCTbqj3vraQV7Fjp06UGvJCyiKImo7oYco/jvxofV96ts+jRJqA/p7zd+BdiDdMugNT9p8BdwcBCEYTDAB8Di5xPnNvx9R8yeYoIad/WNtk8IT3IJyrkbN2DVlopEVcVf1uLEoRhh1z+J9xzdQZvv1ZCdUJ2CpCOZAbqHtpuo2W7ohqVUCNjJbdPlNqBzwAn0FGbXwpWw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH3PR20MB6537.namprd20.prod.outlook.com (2603:10b6:610:154::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 08:26:00 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 08:26:00 +0000
Date: Wed, 31 Jul 2024 16:25:30 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Markus Elfring <Markus.Elfring@web.de>, 
	Inochi Amaoto <inochiama@outlook.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [v8 3/3] dmaengine: add driver for Sophgo CV18XX/SG200X dmamux
Message-ID: <IA1PR20MB4953C5726433FCA55131FEF7BBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953438ED600110E71F9D092BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
 <633f5f40-481f-4063-ab5d-f383e981b0fe@web.de>
 <IA1PR20MB4953FE2F603D5D23175D724BBBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
 <b42db5e1-102c-4ab7-b439-75301c8c27de@web.de>
Content-Disposition: inline
In-Reply-To: <b42db5e1-102c-4ab7-b439-75301c8c27de@web.de>
X-TMN: [SeML4dawydhrw537SsRf/jZm4mvNl+JwFTQ9kjDBsBg=]
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <ylnddgpn2jqxyjgcg2az6zge7xumgff37q3sgeg7jyn3wy4bzl@hiddrlj2uynw>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH3PR20MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cda6472-3819-4f80-06a6-08dcb13a6824
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|5072599009|19110799003|4302099013|3412199025|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: 5GWZDVAUobwl1mOM8cx0TbZ+eXdk0pHTWpzWllR872/jg1Cu6NlptZg3JreUlhjUBi4V2dqyNROtOb64j/Ssp1vxacxeQnzTwv+o3y26ReckERUiM+/DmEBtvmwKS+TrV8lHkWHuFblKhRGks4EzQLmvtKgAfRHlVX5u78MIIHzcr8Bq6uvUGGcNkD7mZTHra3tay8gERcc/pkuKqeKd34EmyRiMe2X8ViREpClbYcPRtdhjhPhxgPzrEefBgjvneZp28gBKTTuRnadNp7sahnpbGdX3Mm+RdvRQ/ZezmoeNpAny8LnFlFBs6LveiqCepDNPgNYSzJs955jEifP65OSTYlnGHbPq8iG0jTXvONGbUIIEpiAX/yYDeQbyzw6t/lvQ8nTtpRtgOXeZyHXo0reJ9YxzO2HLFib/CRowBnyk/V3qs8+n1AhpT/KBxLVtTPc2DY+Wr62DeEkgVL1wPxsWqvStljMtOL2+29XN2IUe/SEzw+4wrimPv67FP1fj28iFxyWqskWkjsX6yRVDSaXCsl2sd8B/GMEMzRMXEq1KZTy1ChTSphzYIO3xjTgF0r+XMVOn8SNc3QEFvjtG6rDl9lUAg7PV2L5Ymt9rcTYTR76eSY80ZiMnHZscWhlyXM8n2zC7E6fS2x/lPHftUaUlFiSZOZ6CeZ94Q4yEf+8ZF5OVVGGWRqikBh7T6ZB2T9VDM6TFDroVNRaZJbpcIfaOua5lteTHO9ZUsTDVCav7ibDwx+TL2yMrEfk6h5kGZH/OEBjFiD+LUJdHnJSq1cdVBOHOIt7aNyPRtFgdKwiwwXEVRhJnVz7hQ9g4IU7M
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkRNaWNvUEFVZmNtT3F5R0pMZnBibzIrVHVzd3grVmlEMjh0NlVmOGVMcGMy?=
 =?utf-8?B?UzVybld2Q25wMDdEUnh1YlhYNmp3ZGFnTzI5V2xmaUI5Yzd1M1B5Lyt1STcr?=
 =?utf-8?B?aGxxMW5JMkIyd05BeXY0bStGaE9TVGV0ZG5OVWNjQlVnQWJtUllkbmtiN25H?=
 =?utf-8?B?YUUwcHBkU21obnFORm9SV1IxUG1ETDlVRFpZeDVnWW1DN0NRRmVUMC9JTFJF?=
 =?utf-8?B?OHd6Qk5uelRNN25NcmhvejQ3Y1ZSWXNiVkM3Sms0cXREQTl4eUNjaDI2WEsr?=
 =?utf-8?B?NlRLNUowY0FpbUdBVHZaTWx4SEgwd0x0RmE5ZFJGSjJwejJMaG00emsxVzdM?=
 =?utf-8?B?S0JBMHR1aVdSQ1oxdmd1QzJxR2U3a0FZTEdzNGREaStjVDh0Umt4ZENxZXBU?=
 =?utf-8?B?NHJoM25Jd29vMDJxUDlOUVRuZldoTmtaUHdYS0RvWTJWQXFHbFRwSVNMNVdP?=
 =?utf-8?B?dGhPeGpLa0xKOTlYSmpNaG9BRkZGNWtDQVlIRStsdnByZG4wek82eU1ERit2?=
 =?utf-8?B?Nnc0Q0p5TW5obTZjczcrNzVkaDhSMEZIblFmdy9pUzUrTDB0VDZjeUJzN0Ja?=
 =?utf-8?B?YUtkUC92eE1Ya3NKWmtNWHlTdUY0c2FYNW1QUGY2eXJjUnNkR3hkYXl6UVZL?=
 =?utf-8?B?dnZqK2VRMUQvcmpZeUdyV1hXdWQwaGpObWVVSmg5YnFOcXZmL3JwUW1SRUxV?=
 =?utf-8?B?Um0yVXdzdVhmTGswUnRjZVRodTR5WkowaUpmcysvaS9tMmRRNmZpVHYyaFZP?=
 =?utf-8?B?RmRQeGlDSlQzcEJCUFJYZXRXUTFwMzZJV3JNdFBQeUxOSTN1ZGhXTEJDWEhF?=
 =?utf-8?B?TS9CeXR4Vlh0cmVrRW9tSmZkaWpodDFVTk11Z2tuZ3hWdmJyK1JsdW1lc0F5?=
 =?utf-8?B?SnZqUjJrbTRJMnpDd2pWOFNkZ3ZvL0RHd0pDcUxRV2tmMVRXOWJoOVhWVVNj?=
 =?utf-8?B?VnNsN2dmN2lmZ09GdngrZWZrcjJWYjZXUmFwWHdvR0RZbzlaZmttYnBXM3lT?=
 =?utf-8?B?K0k2Z2w5d2dXSkg2eGxhWlg1U01SQ0VyUVd6ejhkSTZrZzNkNzRXV2xsRUZR?=
 =?utf-8?B?a0t6S1FiQ2hGUmJuUHhVT1d0RFdpSjlEejBvNXRMNHF4cGpRNGJ2Q2UxVWNv?=
 =?utf-8?B?VzdSSTgrNEpPeXd1MWx5OXQxR1pvdm1ibHVHUytDUzhaNS92MVU2T3NFRitm?=
 =?utf-8?B?eVpFUXEraGlvWTU5Tm9hSWd2NGQ0dmFibXh1Z3RWUVNENFBWUE82djZ3L0lL?=
 =?utf-8?B?UmNWTFdlYmxZR2JrZWFsaEZUV2s0MEFBd0tyNDFIekRCWnlQM29XcSszTm1p?=
 =?utf-8?B?OGx1cXpOQUN5OC9kNFFMQzVoVGFZcDJoOTVlRDQwekoxV3l0RUZlTkZWNlJR?=
 =?utf-8?B?cENwZVI0NVB3Q1k1OWd5Q0o5UkdCeCtHY0VHRElCYlR2aWIySThNeTJsdmFy?=
 =?utf-8?B?NTlsZEFnNGF6RDRFMnFqUFdWd1hZRUNVajUzWjN0RlVtc0NoZ2FJVENlSytm?=
 =?utf-8?B?a0x2MDd3ck85b1Z3R3o4VEtYRS9wOTVzMzVTZnFiVkc5UjBrY3lORkdxUS9i?=
 =?utf-8?B?TExIZys3RGh6WkZTWG9ISlM2TlJsWloyR0RuUEh5NXd4cnJIaTJlTVYxTEVE?=
 =?utf-8?B?N2UzV1JzamxiQjRZZUwveEgzTE1kbTFjM1FpU2lQbjc5bzY2QWQ4dVRVbFVQ?=
 =?utf-8?Q?Z1NntFIeL4ha+a25TY+7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cda6472-3819-4f80-06a6-08dcb13a6824
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 08:25:59.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR20MB6537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_012608_290747_1CCC584D 
X-CRM114-Status: GOOD (  11.46  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMTA6MjA6NThBTSBHTVQsIE1hcmt1cyBFbGZyaW5nIHdy
b3RlOgo+IOKApgo+ID4+IFVuZGVyIHdoaWNoIGNpcmN1bXN0YW5jZXMgd291bGQgeW91IGJlY29t
ZSBpbnRlcmVzdGVkIHRvIGFwcGx5IGEgc3RhdGVtZW50Cj4gPj4gbGlrZSDigJxndWFyZChzcGlu
bG9ja19pcnFzYXZlKSgmZG1hbXV4LT5sb2NrKTvigJ0/Cj4gPj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuMTAuMi9zb3VyY2UvaW5jbHVkZS9saW51eC9zcGlubG9jay5oI0w1
NzQKPiDigKYKPiA+IFRoaXMgaXMgdmVyeSB1c2VmdWwgYW5kIEkgYW0gcHJldHR5IGludGVyc3Rl
ZCwgYnV0IEkgYW0gbm90IHN1cmUgaXQKPiA+IGlzIHN1aXRhYmxlLiBDb3VsZCB5b3Ugc2hhcmUg
c29tZSB0ZWNobmljYWwgZGV0YWlsIChvciBzb21lIGRvY3VtZW50cykKPiA+IGFib3V0IHRoaXMg
bWV0aG9kPwo+IAo+IEZ1cnRoZXIgYXBwbGljYXRpb25zIG9mIHNjb3BlLWJhc2VkIHJlc291cmNl
IG1hbmFnZW1lbnQgY2FuIGJlY29tZSBtb3JlIGhlbHBmdWwsCj4gY2FuJ3QgdGhleT8KPiAKPiBX
b3VsZCB5b3UgbGlrZSB0byB0YWtlIGFub3RoZXIgbG9vayBhdCBjb3JyZXNwb25kaW5nIGluZm9y
bWF0aW9uIHNvdXJjZXM/Cj4gCj4gRXhhbXBsZToKPiBBcnRpY2xlcyBieSBKYXZpZXIgQ2FycmFz
Y28gQ3J1ego+IExpbnV4IEtlcm5lbCBEZXZlbG9wbWVudCAtIEF1dG9tYXRpYyBDbGVhbnVwCj4g
aHR0cHM6Ly9qYXZpZXJjYXJyYXNjb2NydXouZ2l0aHViLmlvL2tlcm5lbC1hdXRvLWNsZWFudXAt
MQo+IEp1bmUgMjAyNAo+IAo+IFJlZ2FyZHMsCj4gTWFya3VzCgpUaGFua3MsIEkgd2lsbCB0YWtl
IGEgbG9vay4KClJlZ2FyZHMsCklub2NoaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
