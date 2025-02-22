Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D85DC021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUmuuRz2kbmdPCd5o2aQi9Tl6kZMA95eLBmp2PqbJmA=; b=yXPV8S2+iqHc9e8xIqPAqxFng3
	Sos/qBZw5YtojlDKdAs27DuJC1OZFqeyTqACVQ8V1YDUTy10AnDtb7uF/gHe16cVBM913gqIRtYxo
	UgX4ujb7FpNSTnkhbvWgbWYF/NeFtaQIqAGVPD0l8H8Pk982dWruNVqg+v9zZv6Jb96YvCefyEgNP
	pF1k8SbxTW5LHz8cF/jLDqpw67ZxvRVlGPEuFtYPfbTDR+10Y+qaZpFMYnngtqJBaE2S8C5+LhFlO
	v5+aFk9muVo6I8R+fksX/7Ns94TTahBntbVItDNgf0yrwUapnrEqayRfyu4C2Keiqp1JS5Uyhfjp1
	liq9FYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqKE-000000088u5-3qrs;
	Sat, 22 Feb 2025 14:17:50 +0000
Received: from mail-japaneastazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqKC-000000088t0-2dDh
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 14:17:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaCJyjgiSWuCplsKiFJON0WH7n39ucICUz5NQFhRnfXftZASOhBm8J57cv9v/k+ASRRDsUdtKGizmRSMDoBKtWA4Jh+Yg1TF5hbC0JCX4EOc0tzz1KmHV6gMxLpP6fNAf6XJuqxpNUc9Mn6uI5yqG65O1eMQoFR/batmmviWJB/fDh+fXSkQoTDUc0CMEHmP6YOxZ44rs8M4bsEEBP0U3lWgfsQm+HmVCF5iiSWN8JE5KJXDpSgL1E5pfdxstrhMUc+vwcv9MRcbU5StKoZvgjO+J7ApjRaj+ZyYRXRLl04DHe7Nhhl51xBL23OPZIgC/Fi+f5eshElkim1fNAGBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/yn6vE8K9IigGIAsnWowl2Q8oXiaq+o9Dsh6vbDmZM=;
 b=kOTIQRxDDsvgSBK2Ajiia2tX3iHmrgW7CjT5BA4wnoAnDHxaJnCHWzcP3Q7YO5OugRItVZ5ftPnDc69EeP6VxdiY+VlVxtK5FfYm9N+H1a+dqd/23YjkLmqEOb0PkQl7g5W1OsSOhjf8FYtnK86raZ5g0ETV+js1WOlQ0bbhv4jsX06DaANR9ZGYS6r/vH8omYQtoiADNTHM6UnAPL+2NnZ9cAQtNpBATlSABn8PMGPvPFV9tJtu6/cYPf8l77nf8JdY7P1/rZtTC3AqLfCtFq4PQqeH86H4jFJr2PrVZqVRmzy6wsATKTZon2Owd7toHAK/mMfMcHvAAs9k4wFPmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/yn6vE8K9IigGIAsnWowl2Q8oXiaq+o9Dsh6vbDmZM=;
 b=pJ7XPNeU4fJ5pdbx7p3Paxokq5zH26duaPei7fha8bfV65shk/WeuYuo1hUPvUOA4pVslb4AjLOwyiNAJH1CI7J1oD8SgRnZ8S0BrXqjfXvRL2jol9JFY8HX2NCol1cElJDCmYK30XHXJ/3xo6DnlPOmFCQ569rR9+PFVcP+TP7AnuzMKA8WhigMYeacsRIO/EPO7MvnVpIHhp8p1mAq3NcHN4WVhmRbmld6/+BWxSqd4irWTdwvXr5qlZeGFhVd/0mN99ebNS0V1LOG0fqeNHv4XF4i3PzcpUL4J++mMjbsmwn3pUwFT3+50Qlu0NxXgAxbHwAfyTSd5z3KKIJMKw==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by TYVPR01MB10687.jpnprd01.prod.outlook.com (2603:1096:400:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Sat, 22 Feb
 2025 14:17:38 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%5]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 14:17:38 +0000
Message-ID: <TYCPR01MB84379D3E0552FD990424173C98C62@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Sat, 22 Feb 2025 22:17:34 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: starfive: jh7110-common: increase mmc0
 max-frequency
To: maud_spierings@hotmail.com, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20250222-fml13v01_emmc_speed-v2-0-3ffc5b1f5663@hotmail.com>
 <20250222-fml13v01_emmc_speed-v2-1-3ffc5b1f5663@hotmail.com>
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <20250222-fml13v01_emmc_speed-v2-1-3ffc5b1f5663@hotmail.com>
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <ef4260ee-2a30-4a19-92b1-21153025f193@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|TYVPR01MB10687:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d81b58-58a5-408c-0f76-08dd534ba836
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|8060799006|19110799003|6090799003|461199028|7092599003|15080799006|10035399004|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWc0dE9Sc2hCR1pZUkdqUlJIT1kwc1d2UkwySGp3NnhGdEs2SXNIanM4RkVU?=
 =?utf-8?B?VXhqaTFFUEJRdCtYMkdHdXVXSzlDQUdtOFBPVjR4c2lpT0IxbzJnVDRpbmVE?=
 =?utf-8?B?dTV0RFgzc280ZGIrMS9jOVpsWVJKTExjd3BCYXdaME5SS1lZVHptUml3UnZk?=
 =?utf-8?B?U0pxZjdNZHJ6Qmx1dXBXQkp2UFFSOTFBbzNhK3ZBcFJCMyszNUtSNk5HYUpz?=
 =?utf-8?B?eCtOVFpJc2NodFN3bjdwTGdKZXpTVWoydkhheFkvYmk4S2lJT3gzaTBrcU1L?=
 =?utf-8?B?RWhETThUL2JzSHBwZXcxN0lTcHZjMUNHMExaK0Y5TXJ1eHh4aFVBU3owTzNj?=
 =?utf-8?B?TVNtdEJDUmlMUmdOMytESDhWVmpNMG9XYjVJQ05oQUlLbHp4RTR3T2FzWVFj?=
 =?utf-8?B?bWl0Q1MvNnJKdm44TVFncTBTT0RSNVBodDBvM1JkazlFMVRjcDZwamFIREFN?=
 =?utf-8?B?RVIvTG9ZaG5qK2luUjdrLy9IUkhZOUViR1R2c0ZSbXRWS0NFTmppY1duQmZV?=
 =?utf-8?B?Q3BqdUFGcTFBUjlGOWRrNG5UYVZrcnNFV2Mraml0MU9MMGZvYUYxL004TW1M?=
 =?utf-8?B?dHpiMHRHZjA3RDdNRkV6VTNWdm9TZy9lRnNNTXJvWlhVeUtMTnFubVZrdnNu?=
 =?utf-8?B?QnVMZlkraEQ3WWhncEd1aWEwN2xrWmdKdHJnakFLMC8vMlJIRE5PdFZJQmRa?=
 =?utf-8?B?WEhnT2t6N1hCMTdKUTM3SmhObkNCNW9YdXJhQ1djbWNOMXVyTWJsVmpYSUFu?=
 =?utf-8?B?c1VIUHBRWmVZeXlmUVRFeDU2TVUrTGFlbXBMQ2dSbUtKRVNPZGJrWnF3QU5M?=
 =?utf-8?B?ODBoeW13Z3dxakhVRFY4dkNzV1R6L2hhQkY5VnpGN1pDSDhva1JUeDU4QzZ1?=
 =?utf-8?B?dEkrSm1PUFZrYURRWSszM1orU0NCT0M5aHBZUVhjMDA3WlQzMzlkaW02OWRz?=
 =?utf-8?B?Q084N01JV3VHb2hpcVhWZVc5N2tFWXpMV3p0Zzl0cGp2bTNwdm1pejgvdmtX?=
 =?utf-8?B?ekt1dGVBV1lvTStueGYzMFBzUjNVREhUMDN1SzhsTjlFL3A1bHArb0xsT2dL?=
 =?utf-8?B?UmhXV3ZxMllLb2FiQ2hXY3VpSlhXZHBGTnJYN2k3SEwrSEE4TXVMUWRoM0Rx?=
 =?utf-8?B?VEw0NTB0Y25idFQ3WE1EWXRZeERIR1QvSXZsUWZMNHMrRmt2UGcrelM5WGVn?=
 =?utf-8?B?UytBZUhJZWJhTnNkS3BRZkJCODVjbW9MMWpxTWpFb3pMUERRMnFRNExhdEJm?=
 =?utf-8?B?OWhUNVdPa0g5YnBGRG15M1R2dVdEMk9oZnJDOWRoc1ViS3Y4TU90dzJBSXFq?=
 =?utf-8?B?dDR3Q2NybzR2WVE5NUdweThpMW5hQ0hNMy96WGZGOU5mWWlGanJyczIvMWFG?=
 =?utf-8?B?M2EwbnFLM2VLZFhTNGdGU091VVNaV05yazBqTGRkYTFZczV5SHZkMFFrVm9w?=
 =?utf-8?B?UmE0UVArdGpyS0NYekI0cmVmeUNuYld5emNGUFZ6blQ1OEtLdFNMd1d5dnI4?=
 =?utf-8?B?NWc0bnIvUW5VUitPZG5pUVB4bGV0bHJDeU9IMG05RjhpYnd6dXZSQWZmT3V5?=
 =?utf-8?Q?oOCks3ECMmB4694DCe7uRIXQkWEf98P2c74ktrhKiYGN+5?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OERHdG9lMkltNUgzRE1xNzdoOFVhUWJzQXpzTkN6L1YwOXo0QzJXU3VHMTVn?=
 =?utf-8?B?ayttUkowQUhrczNhcG5rWmFtZFEzOTFpM0hBTHp1bkJkTkM5bEdpSW80YWZM?=
 =?utf-8?B?NHkxeTlXWHlBQitObm1yWU1US0gxYTRUTXNYQVZGRVk5Z1NpQXJqcUZBVFJJ?=
 =?utf-8?B?clNFOWV1SFZoSUllZm8yNkI3WjJmd3ZmNTF3STFyd3dUN2F3VGdBVVRRYzdr?=
 =?utf-8?B?ZjZOUWpQZU5Ta21Kd3RnUU1IMHpaRVVkcHRsRUhKVE9BamtJbndNeWxBV05l?=
 =?utf-8?B?QkhkMTZJZlQ2ZUdXWld2cWUrU0NrR3VLRTArRzlGbEwvUDR5ZHp6N0dheGcr?=
 =?utf-8?B?NE9xK24zMno5czJsbmN3VkV5Z2szSi9CUHB2aHhMU0xxeWlVQUNHeHFwQTRJ?=
 =?utf-8?B?WC9pYmdFNFJscWV4NElpU0V1aXdiVDNlU2p6RXlXQVo4bk4vYXhhWVo4enpO?=
 =?utf-8?B?eWJoNkZ0U2pQOTgvN3dyZHEybTNFSk9KOC82U1REbmNpZDNKTHl4cFQ5WkJE?=
 =?utf-8?B?ZTM4cHNJaC9WOEhxSG05b2ZyaW9qSFlpZ09QbTU4THQyZ0NOUFN4NmVVdTZk?=
 =?utf-8?B?cGRkbGZPdnhNc2lGZWJZTi9ralZtSDk3SW9GRnZzcStSdE15NEdMcVkyWGtI?=
 =?utf-8?B?ZzZHMm5ia0ZXYXQyRVl5aUgwMndXOGtuc0QzU2dHM0N2TGVHeGRkUGs2enVH?=
 =?utf-8?B?dnVzUWYxbDVDVkorUGZ2bkRxZlUvMHhCYi9wY210aXNtekF0OGxKRE1GQ3VP?=
 =?utf-8?B?SVVrSyswZmlReWNKaTZHZytCaW42NmtwZHdMLzBMWmdWUS9xTmpmbUt4L1c4?=
 =?utf-8?B?SjdxTEhqSHllY3FiKzFHaE1YNXVjZmdRUThscitBbEhGb0F1N2ZPajJjSitN?=
 =?utf-8?B?S0JsNGJvYXRPWkV3VmY0NTZ2ZGo1cnBwdUVOWXZMSWhWOWxwdTZndi9JS3Ar?=
 =?utf-8?B?NWpIajVBeWQzYjJmR1NkK2J6cHMvNWUvSDMrRVlwK0VRQmhYRVArOGRVZnp3?=
 =?utf-8?B?blo0Z0RBYmQxRDhaYnBwVlNtWlNNU1VORGRsQ04zTk9tdExXdTlkUXBuczVs?=
 =?utf-8?B?Sk1KaVdzYXBiSHpXY1Z3Q3R6OCtWVWNPaHROc3RIR3p6OFFoOGdWcGhTbTlC?=
 =?utf-8?B?ODg5UXc3YXU2NkFVemJFcmxmS09WL0NsT3U5aUR0SFhUTWF6NXRHTWtCQmZD?=
 =?utf-8?B?UEJIWWRCdGlOU2d1M1lBSE9aU29UY1BxWTRUZ3pZZ3l4U1ZFVUh2WkQwdXdR?=
 =?utf-8?B?SWFKMU5zWXh0cXovVmtWK3VWRWpQck5wU0hQby9IQW1KQkxaeGpOdWVxMS9E?=
 =?utf-8?B?MjlOY0R6YlhQZlhqNmVWbXBMc0VKcjhKRElZc3VSSG15bDMzdUp0TmFVaVZ5?=
 =?utf-8?B?VW01MDJWTkt0MzQyV2g1cHNZM2ZITTcyS1hBUnYzTmErbkZydk01bWp5YXBt?=
 =?utf-8?B?aTUrU0ZrcjdibHlQQWpCUyswa1lvaURhemExS3pISnpwZDJQRXAvUm1SRStC?=
 =?utf-8?B?SEhPbkFFQlRGWm5neGtVSUhIdXVLUXZ6OXFKVHk0RnJIUzVKa0w0TEYyL0dB?=
 =?utf-8?B?TkkxaVZ1TVI4WE1Xc2FxUFRHUEpJa0tXTGpaNGw4M3NWUnBYZmNXdDgxQkk1?=
 =?utf-8?B?ZDNsaEQwTUNPYXVvNXRUYUxWN0JnS2dKTHdySFJCK2pkVEJweGZKWUJ2R2Q2?=
 =?utf-8?B?Qjh3Y2VmdHVVc2JGa0JIdG55Q3BJaEJhNUovSVoyZkFXSVBKQ2YvOGpyaVRD?=
 =?utf-8?Q?MyzuC48ojbCe3NivEI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d81b58-58a5-408c-0f76-08dd534ba836
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 14:17:36.8033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_061748_728181_1082A30C 
X-CRM114-Status: GOOD (  13.06  )
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

SGksCgpMZXQncyBjb250aW51ZSBvdXIgZGlzY3Vzc2lvbiBoZXJlLgoKV2lsbCBFTU1DIHNwZWVk
IGluY3JlYXNlIGlmIHdlIG9ubHkgYXBwbHkgcGF0Y2ggMT8KCkFsc28sIGFib3V0IHlvdXIgY2xv
Y2stcmF0ZXMgbW9kaWZpY2F0aW9uIGluIHBhdGNoIDIsIEkgQ0NlZCBXaWxsaWFtIFFpdQpzbyB0
aGF0IHdlIG1pZ2h0IGdldCBzb21lIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhpcy4KCkJlc2lk
ZXMgSSd2ZSBkb25lIGEgc3BlZWQgdGVzdCB3aXRoIHVubGltaXRpZWQgY2xvY2stcmF0ZXMgYW5k
IGFuIGVhcmx5CnN0YXRlIG9mIFNPQyBjbG9jayBkcml2ZXIgb24gdmlzaW9uZml2ZSAyIHdoZW4g
SSB3YXMgd29ya2luZyBvbiBBWFAxNTA2MApkcml2ZXIgYmVmb3JlOiAKaHR0cDovL2ZvcnVtLnJ2
c3BhY2Uub3JnL3QvcXVlc3Rpb24tYWJvdXQtc2QtY2FyZC1zcGVlZC8xNzQxLzIxCgpCZXN0IHJl
Z2FyZHMsClNoZW5neXUKCuWcqCAyMDI1LzIvMjIgMjE6MzQsIE1hdWQgU3BpZXJpbmdzIHZpYSBC
NCBSZWxheSDlhpnpgZM6Cj4gRnJvbTogTWF1ZCBTcGllcmluZ3MgPG1hdWRfc3BpZXJpbmdzQGhv
dG1haWwuY29tPgo+IAo+IFRoaXMgc2RpbyBpbnRlcmZhY2UgaXMgY2FwYWJsZSBvZiBtb3JlIHRo
YW4gMTAwIE1IeiBhcyBhbHJlYWR5IGluZGljYXRlZAo+IGJ5IHRoZSBjYXBfaHMyMDAtMV84diBh
dHRyaWJ1dGUuIEluY3JlYXNlIHRoZSBtYXgtZnJlcXVlbmN5IHRvIDIwMCBNSHoKPiBzbyB1c2Vy
cyBvZiB0aGlzIGR0c2kgY2FuIGluY3JlYXNlIHRoZWlyIFNESU8gYnVzIHNwZWVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1hdWQgU3BpZXJpbmdzIDxtYXVkX3NwaWVyaW5nc0Bob3RtYWlsLmNvbT4K
PiAtLS0KPiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNp
IHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNv
bW1vbi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0
c2kKPiBpbmRleCBkZDJlZWZjMjk1ZTVjOGI1NjhhMDIxMDRlYzIxODllNjZiMzc4OTA0Li4xOWNh
OGRjMjQ2MTdjMmFkNTY1YTRhOWIyZDlhZjliZDk0OTFmMjJlIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4gKysrIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kKPiBAQCAtMjU4LDcgKzI1
OCw3IEBAICZpMmM2IHsKPiAgIH07Cj4gICAKPiAgICZtbWMwIHsKPiAtCW1heC1mcmVxdWVuY3kg
PSA8MTAwMDAwMDAwPjsKPiArCW1heC1mcmVxdWVuY3kgPSA8MjAwMDAwMDAwPjsKPiAgIAlhc3Np
Z25lZC1jbG9ja3MgPSA8JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX1NESU8wX1NEQ0FSRD47Cj4gICAJ
YXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8NTAwMDAwMDA+Owo+ICAgCWJ1cy13aWR0aCA9IDw4PjsK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
