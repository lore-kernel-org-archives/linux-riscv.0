Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3198C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 22:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/A1NFQfOrmHv9TJLmrRsCd8m/84psCwr6F9em4byo3M=; b=mTzFqlEaaXLUmD
	SwIYBudNr+14pIwqy7BvsZ53FMU/hjOPyvjRFWcoPB2g3Kuii8Sf7IjhiM6t8AX/QEj47xLFqDmsK
	ZSZf4eaGi9yr5f1/dgeC3j50MHHm3EjdgTMkii3ZWWR0p3f5skC4KopxPcVLf3xC78/Knkc2wB/jl
	1zGjDcyDoOCz3fyWNKtkX2oY0zjirQAMedv3lwTPuqkMqn7zm3tLPZYsuT0hDmH3iSs/cApa5pYND
	/Ir9Xf3pBLISJmX2BLx29zURXnSLqTtmrDqiI7MTC8jybzDLdixqkcQ+uJw4HZeWEiUIU++8s7AD4
	cUJv1KP27qYP1FLHXNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZI8E-00000002kiA-3Ka7;
	Wed, 31 Jul 2024 22:49:18 +0000
Received: from mail-bn8nam04olkn20824.outbound.protection.outlook.com ([2a01:111:f403:2c08::824] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZI8B-00000002kgY-1hpr
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 22:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nz6f5UPzaXm7I7myeJnT1WrI9QnHFblD8YpBjG1S1FZVihmpIbEgkqlOM8SP2pxRWC+s+Ow6fH3mCjAXtmzkmEUNjqpd9lZjS20MQ4vPL50I7gt7k71OS9NthG+95ZWIqe3S3qj3zKo+iq8mCJtaEk3W1B5tsC2zgy4RJOhhYIeBr1bl0+bV8MHzyeCammX79Fy1l2cq6YHhLjbPAjIHJXc3lRPQx7wabQQiu5E6w3/3mPGDBzY06bPcSBBNgAkBYvFxFzWilEaqnFbGCf4ZJD15KmxZzp/dLQa+xiJis7l5kZsu3ebEN+OyS0VEtq7Y2Z6nbWm+/JHJUc/aEtQWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ9tNXQtc/tu+bixljgPBdbPuWSl8dx/zWKtVLEI4YQ=;
 b=JsEk+ZPXlb3tAnKhkSIUzbdmXL7hEZpV9crFAHz7y8RicFoFNat/jTpewRGKr0Ee4QTO6RM4D3W5vXOFoDOgBOzhuxvvpzO3O8e1h0pYeG486sOb3SnTBkr9c2+dl3++kmAXabH3Zq0++arin9/Iw9XwL2cfRS0KfWJcDtmNAKx2FbQX9pii9NY/0U0YbxYeR6tySj9vww6XiEWQqha3Ivq9bY8i1MQ5z/b3/b3HvweHZF7QROsXlUlqEHEv7vjuOcudrh0nt7dj13XIpjUSN6XIptPsTj/Irm03tayFcIlCg0ldsUW2PY+ontaRGYvEXpD57AxQ8Vbb+OAwA4LWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ9tNXQtc/tu+bixljgPBdbPuWSl8dx/zWKtVLEI4YQ=;
 b=MJDu9oJNAIxlVpvq9iGTcXWfoURZCsQwGY+N9+TdhSIocOkioDTjHaJhvHOdzBHNNFUDgWREug4dkHBWl7QsvcnOvRig/wvIGPlz5mU8dQt2pEZyZWPp1ITBijc++wLHKMYKt4dh2vJ9KeEZpAUl8/WG94IRFLPptcX3FRWyUXrgGkV/gSpYzR/vQkbz/Zog0/vLmlUaaBLYqcgPpwdQcCCLaReLioXzqV+JLCTNoBJ68nH9mloWtIMabdfrPQOAA32NdVedBd8CnmhstKTu/yzpk1zS8bKDBbxxBm4lg4osSCP6LTX5kP/KY0d8LXzbyrMbBDtL8AThX6Zt88hmGg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5714.namprd20.prod.outlook.com (2603:10b6:930:9d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 22:49:07 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 22:49:07 +0000
Date: Thu, 1 Aug 2024 06:48:34 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Guenter Roeck <linux@roeck-us.net>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Jinyu Tang <tangjinyu@tinylab.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, chunzhi.lin@sophgo.com, haijiao.liu@sophgo.com, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 2/4] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
Message-ID: <IA1PR20MB49535B0E8AB827FD5672580BBBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538C09E94D90F07B7B2562BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953DE89C56AB3F328954131BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822D0C770667CFE484EBC95FEB12@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB49534944E268A0A71AA3D5D1BBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
 <75f6f910-43ff-4d98-b39f-b4b0629a56a1@roeck-us.net>
Content-Disposition: inline
In-Reply-To: <75f6f910-43ff-4d98-b39f-b4b0629a56a1@roeck-us.net>
X-TMN: [eUgIcC8ZM1dTn+Kdhqp9Oyc8fWmuiFhd6z51yM5zVAI=]
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <rkkokpahtbojln4bd3pxmzqyi6hproyiwdfszb7a4vtustzbf3@ik3u2lxozmet>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 2016eca2-b822-4f65-5d9d-08dcb1b2fbd7
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|19110799003|461199028|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: Kl166dRwMhs1Xx8baaiiHOFwpM+FAU5/8BTTKztJXot26bVD8wJwlMG17Yb5N2ZHtNYq8LYSJarp0RIJnXgvK+8H1Thz4+HgZnj5hNkToO3xaL+JhWlw0pKRt6ZCmlDoLcMyZO0uBk8zlzzTVhYMs33M963cPbHU7qAPXCqOy+07nCUh6+mEoyRft5F8XgwBUtAK40J/DHdj6YUz9Wz4c2gq6v+0/m2k9h8HLoZ8xuh3vESyeQnjFFYmYMTZEjIGOi8+xuOy1lfZYcRUZwQ9T2WRjnt7WGFujmDoKvJX3aCko4GiuA7PcJrqjQmxz2Zcy6FNVxTx1N4qWZBaRCNxkETwiUYvB01UnpcrmWX9ZIwFMzgL8jcowYrM8Ka4qTUDfOSZlHLWka29VItZXyJXdwTk/H0PZJLTZ0eB7iq64tfS71E3zlyfpY3LxaYI3BZRd6M/1xjbBkfhL17d0rfsUikQGOhep2+eHs7nMr5LzCCNLAsZcAMNiYQB8UZzr5WRmmjhskhYvRyC+nNYn/C4cs5L8dlxnNa0mbBLqLANDeN++kYoupPP5qxIX6DFJyP0wnBOn2+fff4vuhDb18FDZSTICB7w2G7Qp4eZ5peqcYhRWAvdXIoDLgcq5OqcXoznh/l/6eWns9hcYiKck5yZY80L4S5/vUzDoFBoGU+sydUGZRINFVNZlaRvMO+im9h/wEdefroywJI0ypGB1uRtHQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ZBNjJvZzJMc1hBbUIxL2ZUNGp2ZXZHMHhmUkc3UDh3MDdtaytIWm9ZZ0JG?=
 =?utf-8?B?aTFpYnNNRG1nSDhrbDllMUxFY1VyV25HeWs5a1ZkRjZlWXdmMmZGNlB4NFJt?=
 =?utf-8?B?c3Y5Qnk1STgwb2JuRnl2UysvRnEwTWhiSWtrT05SaEFRUE01R2NlQjk4R2ZJ?=
 =?utf-8?B?clhQUjBaVy9SNVZwMUFWSTBIbUJCUHdpWXU2S0hwTXVDcTNYcldleUhycGZD?=
 =?utf-8?B?KzdXRXRXMXdBWTBYanVhUGFBSXVFcU5VVEk1SE5ucWlJdDlmTmxyOEhkYlNC?=
 =?utf-8?B?SXdaQUd5cG1TYnk0VTdLVXVId01nRTgzL1M5U1RxcnlROVFHWDR0RDdUVkU4?=
 =?utf-8?B?alpGOTF5KzJneENpbFo2SGhvWXBwN0Mxb2swYitjOXRNcW5KSlFlL1JZVlg2?=
 =?utf-8?B?RGVSeTkxMStvNnBNM09QcWkwbTI0ZHdjUHBpWEg2d1NqZHRNTEdiNnZDZWZz?=
 =?utf-8?B?VmtBdERnSkljTlMrQ0lDVFo1ekZZdk4wcXN6WUxSVk56dlkzbGxpSkhyRnFm?=
 =?utf-8?B?czVYTGFZY2lhdzE1bmlOL0ljbWJUczVmMmIwaHFFcTNzdzRUN2tEMnM2UG5t?=
 =?utf-8?B?TW1Jck0vaXJnQmNwOFZjektLblNqM0dPaVRWYkIwZTludWE0MkFmbktrSFN5?=
 =?utf-8?B?a0xSWjhBK2FnZDltZVlrQk5xT2ZQSlVZVnpDMFF1YlExZG9YV3diWG4zZWhF?=
 =?utf-8?B?eEZUT0RRUGZ1QzdpcFAvSFdzOVlvRW4vM0tkV3VzMjZMd0lJR003Sno5dEpz?=
 =?utf-8?B?bFVLUkFSUHV2VVY3Zm1sUkNJaXVvM29zWStQeFZ5TE4wS21JcW1QSGpmWk1R?=
 =?utf-8?B?NUwwRXpvR21INTJsbkRZcnh3dGo1VGR2MXpDa3RPQzNnVk5Ec3piZWt2S2NQ?=
 =?utf-8?B?SmxSd0FCMnpZampqaWx1c2k1d2lWa21JMEVMTjVlOVkrNlpZdFlNSGF2eUxq?=
 =?utf-8?B?SzhMODZWVFdsOFZjS3ZpeGcxYmtVejdQTXVjZkRSSnIvOTNQMDNTSzd4Ris2?=
 =?utf-8?B?bVZGTjhkM0ZTVzYxY0F5NzUxMEd2WmlUb25nNWx2ZkNFN2VpUmpVUG5SWkxt?=
 =?utf-8?B?WnpnZ0w0bDNSaklMY2RRTEY0NlZkMG9UYlluUFFqcVd3NW1vUU9IQlczSFMw?=
 =?utf-8?B?TUNtaXQvWit4VnIwbGhRYm5vRVc2YWtubDdKMW83cXYxYTRoY2wya2h5ZFZ6?=
 =?utf-8?B?aHJ4elgzV0tlWFFvWC9MRFBLcnNEV21QMjFYNHdLVTJvQkFjUjNPZUNwSVVB?=
 =?utf-8?B?eW5VaUNCODFqVFFUZ1RFdG9oVHUzR0hQLzVKVitia052blYwTVFvVDZSS2Zw?=
 =?utf-8?B?SzhVYWpSd1RnRlRPUitiVGVxbzVpK1UwMlg1ckVsMDlQZHdtd09kQmtqRXZ0?=
 =?utf-8?B?SVkyVW92QmhxTDdGM3g1bHZvUUhzdjZxN0tyRzlSTVNsVG8ra3lPYkxVN1By?=
 =?utf-8?B?amdkTXhCM2U5S2xhZnJzbXZaVVRacjF3R1ExZkRaaE9PTWI1YmdKbjc3eExr?=
 =?utf-8?B?SC9hRmFhV2phcVZVN1orWVlpZ3VESExDUzlhWHpzcEVud2s1Wjk4T3YxZFVT?=
 =?utf-8?B?Y1pROEF3SkF2TWR1aTJadTBTb25EMGx4L1JUbkFqZUpIK2Qvd0FmNjNjNS9B?=
 =?utf-8?B?dm1xSzVvR3Mva2RZclVWLzNaUENKLzhsVHorWXl3T1luODZUMzZOZnFtMGk1?=
 =?utf-8?Q?c9QRT253DvC0D3BkJxk/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2016eca2-b822-4f65-5d9d-08dcb1b2fbd7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 22:49:07.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_154915_483352_121AEE4D 
X-CRM114-Status: GOOD (  38.16  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMDg6MDI6MzZBTSBHTVQsIEd1ZW50ZXIgUm9lY2sgd3Jv
dGU6Cj4gT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMDM6MTc6NTdQTSArMDgwMCwgSW5vY2hpIEFt
YW90byB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDMxLCAyMDI0IGF0IDAyOjEzOjIwUE0gR01ULCBD
aGVuIFdhbmcgd3JvdGU6Cj4gPiA+IAo+ID4gPiBPbiAyMDI0LzcvMzAgMTU6NTAsIElub2NoaSBB
bWFvdG8gd3JvdGU6Cj4gPiA+IFsuLi4uLi5dCj4gPiA+ID4gKyNkZWZpbmUgUkVHX0NSSVRJQ0FM
X0FDVElPTlMJCQkweDY1Cj4gPiA+IFRoZSBuYW1lICJSRUdfQ1JJVElDQUxfQUNUSU9OUyIgaXMg
YW1iaWd1b3VzLiBJIGhhdmUgY29uZmlybWVkIHdpdGggc29waGdvCj4gPiA+IGVuZ2luZWVycyB0
aGF0IHRoZSBjb21wbGV0ZSBwcm9jZXNzIGlzOiB3aGVuIHRoZSBtZWFzdXJlZCB0ZW1wZXJhdHVy
ZQo+ID4gPiBleGNlZWRzIHRoZSB0ZW1wZXJhdHVyZSBzZXQgYnkgUkVHX0NSSVRJQ0FMX1RFTVAs
IHRoZSBwcm9jZXNzb3IgaXMgcG93ZXJlZAo+ID4gPiBvZmYgYW5kIHNodXQgZG93biwgYW5kIHRo
ZW4gYWZ0ZXIgdGhlIHRlbXBlcmF0dXJlIHJldHVybnMgdG8gdGhlIHRlbXBlcmF0dXJlCj4gPiA+
IHNldCBieSBSRUdfUkVQT1dFUl9URU1QLCBpdCBpcyBkZWNpZGVkIHdoZXRoZXIgdG8gcG93ZXIg
b24gYWdhaW4gb3IgcmVtYWluCj4gPiA+IGluIHRoZSBzaHV0ZG93biBzdGF0ZSBiYXNlZCBvbiB0
aGUgYWN0aW9uIHNldCBieSBSRUdfQ1JJVElDQUxfQUNUSU9OUywKPiA+ID4gd2hldGhlciBpdCBp
cyByZWJvb3Qgb3IgcG93ZXJvZmYuCj4gPiA+IAo+ID4gPiBTbyBiYXNlZCBvbiB0aGUgYWJvdmUg
ZGVzY3JpcHRpb24sIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvCj4gPiA+IGNhbGzCoCJS
RUdfQ1JJVElDQUxfQUNUSU9OUyIgYXMgIlJFR19SRVBPV0VSX0FDVElPTlMiLiAiUkVHX0NSSVRJ
Q0FMX0FDVElPTlMiCj4gPiA+IGdpdmVzIHBlb3BsZSB0aGUgZmlyc3QgaW1wcmVzc2lvbiB0aGF0
IGl0IGlzIHVzZWQgdG8gc2V0IGFjdGlvbnMgcmVsYXRlZCB0bwo+ID4gPiBSRUdfQ1JJVElDQUxf
VEVNUC4KPiA+ID4gCj4gPiA+IEl0IGlzIGFsc28gcmVjb21tZW5kZWQgdG8gYWRkIHRoZSBhYm92
ZSBkZXNjcmlwdGlvbiBvZiB0ZW1wZXJhdHVyZSBjb250cm9sCj4gPiA+IGFuZCBhY3Rpb24gc2V0
dGluZ3MgaW4gdGhlIGNvZGUuIEN1cnJlbnRseSwgc29waGdvIGRvZXMgbm90IGhhdmUgYSBjbGVh
cgo+ID4gPiBkb2N1bWVudCBkZXNjcmlwdGlvbiBmb3IgdGhpcyBwYXJ0LCBhbmQgYWRkaW5nIGl0
IHdpbGwgaGVscCB1cyB1bmRlcnN0YW5kCj4gPiA+IGl0cyBmdW5jdGlvbnMuCj4gPiA+IAo+ID4g
PiBBZGRpbmcgc29waGdvIGVuZ2luZWVycyBDaHVuemhpIGFuZCBIYWlqaWFvLCBGWUkuCj4gPiA+
IAo+ID4gPiA+ICsjZGVmaW5lIFJFR19DUklUSUNBTF9URU1QCQkJMHg2Ngo+ID4gPiA+ICsjZGVm
aW5lIFJFR19SRVBPV0VSX1RFTVAJCQkweDY3Cj4gPiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIENS
SVRJQ0FMX0FDVElPTl9SRUJPT1QJCQkxCj4gPiA+ID4gKyNkZWZpbmUgQ1JJVElDQUxfQUNUSU9O
X1BPV0VST0ZGCQkyCj4gPiA+IAo+ID4gPiBBcyBJIHNhaWQgdXBvbiwgYWN0aW9ucyBhcmUgbm90
IHJlbGF0ZWQgdG8gY3JpdGljYWwsIGJ1dCBpcyBmb3IgcmVzdG9yaW5nCj4gPiA+IGZyb20gY3Jp
dGljYWwsIHN1Z2dlc3QgdG8gZ2l2ZSBhIGJldHRlciBuYW1lLgo+ID4gPiAKPiA+ID4gWy4uLi4u
Ll0KPiA+ID4gCj4gPiA+ID4gK3N0YXRpYyBzc2l6ZV90IGNyaXRpY2FsX2FjdGlvbl9zaG93KHN0
cnVjdCBkZXZpY2UgKmRldiwKPiA+ID4gWy4uLi4uLl0KPiA+ID4gPiArc3RhdGljIHNzaXplX3Qg
Y3JpdGljYWxfYWN0aW9uX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ID4gCj4gPiA+IFsu
Li4uLi5dCj4gPiA+IAo+ID4gPiBUaGUgc2FtZSByZWFzb24gYXMgdXBvbiwgImNyaXRpY2FsX2Fj
dGlvbl94eHgiIGlzIG1pc2xlYWRpbmcuCj4gPiA+IAo+ID4gPiBbLi4uLi4uXQo+ID4gPiAKPiA+
IAo+ID4gVGhhbmtzIGZvciBleHBsYW5hdGlvbiwgSSBqdXN0IGdldCB0aGUgbmFtZSBmcm9tIHRo
ZSBkcml2ZXIgb2YgU0cyMDQyLgo+ID4gVGhpcyBpcyBvdXQgb2YgbXkga25vd2xlZGdlLgo+ID4g
Cj4gPiA+ID4gK3N0YXRpYyBpbnQgc2cyMDQyX21jdV9yZWFkX3RlbXAoc3RydWN0IGRldmljZSAq
ZGV2LAo+ID4gPiA+ICsJCQkJdTMyIGF0dHIsIGludCBjaGFubmVsLAo+ID4gPiA+ICsJCQkJbG9u
ZyAqdmFsKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKwlzdHJ1Y3Qgc2cyMDQyX21jdV9kYXRhICptY3Ug
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+ID4gPiArCWludCB0bXA7Cj4gPiA+ID4gKwl1OCBy
ZWc7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJc3dpdGNoIChhdHRyKSB7Cj4gPiA+ID4gKwljYXNlIGh3
bW9uX3RlbXBfaW5wdXQ6Cj4gPiA+ID4gKwkJcmVnID0gY2hhbm5lbCA/IFJFR19CT0FSRF9URU1Q
IDogUkVHX1NPQ19URU1QOwo+ID4gPiA+ICsJCWJyZWFrOwo+ID4gPiA+ICsJY2FzZSBod21vbl90
ZW1wX2NyaXQ6Cj4gPiA+ID4gKwkJcmVnID0gUkVHX0NSSVRJQ0FMX1RFTVA7Cj4gPiA+ID4gKwkJ
YnJlYWs7Cj4gPiA+ID4gKwljYXNlIGh3bW9uX3RlbXBfY3JpdF9oeXN0Ogo+ID4gPiA+ICsJCXJl
ZyA9IFJFR19SRVBPV0VSX1RFTVA7Cj4gPiA+ID4gKwkJYnJlYWs7Cj4gPiA+ID4gKwlkZWZhdWx0
Ogo+ID4gPiA+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsKPiA+ID4gPiArCX0KPiA+ID4gPiArCj4g
PiA+ID4gKwl0bXAgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEobWN1LT5jbGllbnQsIHJlZyk7
Cj4gPiA+ID4gKwlpZiAodG1wIDwgMCkKPiA+ID4gPiArCQlyZXR1cm4gdG1wOwo+ID4gPiA+ICsJ
KnZhbCA9IHRtcCAqIDEwMDA7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJcmV0dXJuIDA7Cj4gPiA+ID4g
K30KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBpbnQgc2cyMDQyX21jdV9yZWFkKHN0cnVjdCBk
ZXZpY2UgKmRldiwKPiA+ID4gPiArCQkJICAgZW51bSBod21vbl9zZW5zb3JfdHlwZXMgdHlwZSwK
PiA+ID4gPiArCQkJICAgdTMyIGF0dHIsIGludCBjaGFubmVsLCBsb25nICp2YWwpCj4gPiA+ID4g
K3sKPiA+ID4gPiArCXJldHVybiBzZzIwNDJfbWN1X3JlYWRfdGVtcChkZXYsIGF0dHIsIGNoYW5u
ZWwsIHZhbCk7Cj4gPiA+ID4gK30KPiA+ID4gQ2FuIHdlIG1lcmdlIHNnMjA0Ml9tY3VfcmVhZCBh
bmQgc2cyMDQyX21jdV9yZWFkX3RlbXDvvJ8KPiA+IAo+ID4gWWVzLCBpdCBjYW4gYmUgbWVyZ2Vk
LiBidXQgSSB0aGluayB1c2luZyB0aGlzIG5lc3RlZCBmdW5jdGlvbiAKPiA+IGlzIG1vcmUgY2xl
YXIuIEFuZCBnY2MgY2FuIGF1dG8gaW5saW5lIHRoaXMgZnVuY3Rpb24gc28gd2UKPiA+IGdvdCBu
byBwZXJmb3JtYW5jZSBwZW5hbHR5Lgo+ID4gCj4gCj4gRldJVywgSSB0aGluayB0aGF0IGlzIHBv
aW50bGVzcy4gVGUgb25seSBkaWZmZXJlbmNlIGlzIHVudXNlZAo+IHBhcmFtZXRlcnMuCj4gCgpP
SywgSSB3aWxsIG1lcmdlIHRoZXNlIGZ1bmN0aW9uLgoKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRp
YyBpbnQgc2cyMDQyX21jdV93cml0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ID4gKwkJCSAg
ICBlbnVtIGh3bW9uX3NlbnNvcl90eXBlcyB0eXBlLAo+ID4gPiA+ICsJCQkgICAgdTMyIGF0dHIs
IGludCBjaGFubmVsLCBsb25nIHZhbCkKPiA+ID4gPiArewo+ID4gPiA+ICsJc3RydWN0IHNnMjA0
Ml9tY3VfZGF0YSAqbWN1ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPiA+ID4gKwlpbnQgdGVt
cCA9IHZhbCAvIDEwMDA7Cj4gPiA+ID4gKwlpbnQgaHlzdF90ZW1wLCBjcml0X3RlbXA7Cj4gPiA+
ID4gKwlpbnQgcmV0Owo+ID4gPiA+ICsJdTggcmVnOwo+ID4gPiA+ICsKPiA+ID4gPiArCWlmICh0
ZW1wID4gTUNVX1BPV0VSX01BWCkKPiA+ID4gPiArCQl0ZW1wID0gTUNVX1BPV0VSX01BWDsKPiAK
PiBObyBsb3dlciBsaW1pdCA/IC0xMDAwMDAwIGlzIG9rID8KPiAKCk15IGZhdWx0LCBpdCBzaG91
bGQgYWx3YXlzID4gMC4KCj4gPiA+ID4gKwo+ID4gPiA+ICsJbXV0ZXhfbG9jaygmbWN1LT5tdXRl
eCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJc3dpdGNoIChhdHRyKSB7Cj4gPiA+ID4gKwljYXNlIGh3
bW9uX3RlbXBfY3JpdDoKPiA+ID4gPiArCQloeXN0X3RlbXAgPSBpMmNfc21idXNfcmVhZF9ieXRl
X2RhdGEobWN1LT5jbGllbnQsCj4gPiA+ID4gKwkJCQkJCSAgICAgUkVHX1JFUE9XRVJfVEVNUCk7
Cj4gPiA+ID4gKwkJaWYgKGh5c3RfdGVtcCA8IDApIHsKPiA+ID4gPiArCQkJcmV0ID0gLUVOT0RF
VjsKPiA+ID4gPiArCQkJZ290byBmYWlsZWQ7Cj4gCj4gRG8gbm90IG92ZXJ3cml0ZSBlcnJvciBj
b2Rlcy4KPiAKPiA+ID4gPiArCQl9Cj4gPiA+ID4gKwo+ID4gPiA+ICsJCWNyaXRfdGVtcCA9IHRl
bXA7Cj4gPiA+ID4gKwkJcmVnID0gUkVHX0NSSVRJQ0FMX1RFTVA7Cj4gPiA+ID4gKwkJYnJlYWs7
Cj4gPiA+ID4gKwljYXNlIGh3bW9uX3RlbXBfY3JpdF9oeXN0Ogo+ID4gPiA+ICsJCWNyaXRfdGVt
cCA9IGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YShtY3UtPmNsaWVudCwKPiA+ID4gPiArCQkJCQkJ
ICAgICBSRUdfQ1JJVElDQUxfVEVNUCk7Cj4gPiA+ID4gKwkJaWYgKGNyaXRfdGVtcCA8IDApIHsK
PiA+ID4gPiArCQkJcmV0ID0gLUVOT0RFVjsKPiA+ID4gPiArCQkJZ290byBmYWlsZWQ7Cj4gCj4g
RG8gbm90IG92ZXJ3cml0ZSBlcnJvciBjb2Rlcy4KPiAKPiA+ID4gPiArCQl9Cj4gPiA+ID4gKwo+
ID4gPiA+ICsJCWh5c3RfdGVtcCA9IHRlbXA7Cj4gPiA+ID4gKwkJcmVnID0gUkVHX1JFUE9XRVJf
VEVNUDsKPiA+ID4gPiArCQlicmVhazsKPiA+ID4gPiArCWRlZmF1bHQ6Cj4gPiA+ID4gKwkJbXV0
ZXhfdW5sb2NrKCZtY3UtPm11dGV4KTsKPiA+ID4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4g
Cj4gVGhpcyBpcyBpbmNvbnNpc3RlbnQuCj4gCgpUaGFua3MsIEkgd2lsbCBoYW5kbGUgdGhlIHJl
dHVybiBwcm9wZXJseS4KCj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwo+ID4gPiBJdCBpcyByZWNvbW1l
bmRlZCB0byBhZGQgc29tZSBjb21tZW50cyB0byBleHBsYWluIHdoeSB3ZSBuZWVkIHRvIGVuc3Vy
ZSB0aGF0Cj4gPiA+IGNyaXRfdGVtcCBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gaHlzdF90
ZW1wLiBUaGlzIGlzIGVudGlyZWx5IGJlY2F1c2UKPiA+ID4gdGhlIGN1cnJlbnQgTUNVIGRvZXMg
bm90IGxpbWl0IHRoZSBpbnB1dCwgd2hpY2ggbWF5IGNhdXNlIHVzZXIgdG8gc2V0Cj4gPiA+IGlu
Y29ycmVjdCBjcml0X3RlbXAgYW5kIGh5c3RfdGVtcC4KPiA+IAo+ID4gWWVhaCwgdGhpcyBpcyBn
b29kIGlkZWEuCj4gPiAKPiA+ID4gPiArCWlmIChjcml0X3RlbXAgPCBoeXN0X3RlbXApIHsKPiA+
ID4gPiArCQlyZXQgPSAtRUlOVkFMOwo+ID4gPiA+ICsJCWdvdG8gZmFpbGVkOwo+ID4gPiA+ICsJ
fQo+ID4gPiA+ICsKPiA+ID4gPiArCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEobWN1
LT5jbGllbnQsIHJlZywgdGVtcCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICtmYWlsZWQ6Cj4gPiA+ID4g
KwltdXRleF91bmxvY2soJm1jdS0+bXV0ZXgpOwo+ID4gPiA+ICsJcmV0dXJuIHJldDsKPiA+ID4g
PiArfQo+ID4gPiA+ICsKPiA+ID4gWy4uLi4uLl0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
