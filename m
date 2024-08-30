Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CEFCA0EF9
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47wOD3LpszNRDEnPGFWwhsGRmwfljyQdpD0OcZPutTI=; b=eCp3FpNcy1ub9jLrE/uebkjG1u
	MZ1e3wUDf5W3bG/wE4H6GX/ieFF/rtDmyJBMkv69jh00/Lx50ll1kQjNPvx2nzzLwW76hJYswcNyM
	k2FB/+SUcYyibo+9GTVZSQL+wgYpE3PV46qBAaYFxFU038yDoL/mdTl7NVHl2FFcKDloNFFff9VIV
	S3/+whKx9Uk7sIOMJZpfvdjXJYRkDvwOvJ9EyKTg8KOpWvNrfgxRPItTG3C/9T9vqgQn10qR3WEfK
	r23FLNF3qSomF+4dE2Af9GffduIv+Oo+qIZ7Qe0LZCZmOU2HDlNBoT6dgIeVvy5zZSfqPonXa/4qM
	er3ZfoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxq6-00000005WHf-17zI;
	Fri, 30 Aug 2024 09:22:42 +0000
Received: from mail-bmxind01olkn2081d.outbound.protection.outlook.com ([2a01:111:f403:281c::81d] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxq2-00000005WFX-3pE3
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 09:22:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRzGtmQqSGkQuxwbrITJjCyjQm2MRi1+NeTea282jLTu/DwVpfZCMZYMouaTv5dXHIZxlCbh31d5qSsCL4QU+0rYBwrZC6+kPR+wHf0jUWCnjwuAhOPw4usa4YfVhsiyB6pL9s7hU9XdqkJppfIEozw0ldXt/MPTVG7qyL4PFtHQDGjn6kokEHD7sYLp0SWm4qKRLnkiXWhHLBFMd+Lsbh8HvqXo0mBIuFFdr3LaE7l0mIOojLncZpN4b8Ma/BxhoVm+5XCdGGuG2hEnJ34TTNFf5sb02ztpnteARuF+X3nw62U/QcQY2C5l+O20uwC5a+R+wxeAaJCHseUkIRngnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npiffF0hWFrgm8MozfhJ+1kSAcTV+i+0C1q7G4xT9qE=;
 b=vwKdOA/5Z8pLqwd3jqULQpvP7u0R+K+tMmOxjqW2hO8OaCOxNL67DstMtHlT+YZA7CB6JHLIpLhIRNYT2ucqcl9GwVtPPw00BLj26FQ9AREjhgg6wSdvgA6wdAEyPmHBulUgJA1VkYDjjZcLZddfhFnNhQ5OiOJV5Kp2P5QYpqKzxRDVwmLO0JV2G1wFWwNdSV2mSO7hkbgCs61QLauCsH4pFukbWBGuwkMIqorD3i1pV/gspR4rNOL1IZnVIEsT2SA1E2dPUvAeZWqG2pJ/22IsdOpAW3Ko17n7vW2XDSmkuggtBhJYzLnl2AYbzyUfvV3KoSi33oYq5A1KsH/joQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npiffF0hWFrgm8MozfhJ+1kSAcTV+i+0C1q7G4xT9qE=;
 b=j0SYs6ZJK+bRz4/M0qxb3oRg+IvWkaclo9l0PDmFzDTqQo42vQwJwUuFRWOZmPrc9VWXhd0JHGyNwztCm3W06rs/kgkGZzQImSEf7H91YzPl0jom7bdK5JzQ/301mh/3kNpgmdq1VXDrQW3K31IKeJWhpjS9QE90Dz62IaGwOrj6waMqdBIUn8PB/HNHsJEt0J1p/ke1WMrwnLKATpycBwLQXtzXwMWGjEBUWrKnkgeqztBmW8QIDgVqIvjOb6swgoNkvqT6XCMn3rxQ4liO+kafz/kWn6qlwQtFS+jQEGls/QU3gC50T6vEatdfFjeQvFEhee9KEBkl+HXXiP5N4A==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0722.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 09:22:13 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%7]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 09:22:13 +0000
Message-ID: <MA0P287MB2822919DFEBDA9B9663F8333FE972@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 30 Aug 2024 17:22:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] riscv: dts: sophgo: Add LicheeRV Nano board device
 tree
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
 <20240711-sg2002-v4-4-d97ec2367095@bootlin.com>
 <IA1PR20MB4953612773890B94FFD0C9EABB962@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822AC58BC43FDE03802E773FE972@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <1b202582-0487-483c-ba80-47125551eb5d@bootlin.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <1b202582-0487-483c-ba80-47125551eb5d@bootlin.com>
X-TMN: [vyBi7WWVjZZvLUQo/o/t37iBEe2jmFm4]
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <a6fcb025-5781-44aa-a297-8ac6e27fa7e2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0722:EE_
X-MS-Office365-Filtering-Correlation-Id: 598fcaef-cd43-4013-40b6-08dcc8d53a84
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|5072599009|6090799003|15080799006|19110799003|8022599003|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: /01JoDbh6dT6avYDcg92v+9j7i5LMxa83GAhWFSznuOQKPMlFEj9kwF4XD9veGfDRWdS0AjOJpzj6QilJMJliVJRby3x/5HkSwKLvwVwGC0tvKyuhpuR+jimZm764rsPfWifYaYbvlfo5ZNtstAVFZOX535zG4cgWJ0GCBuiXJcs3NOKqi9rO8tKst5333npFTCmuFeAbqYu/peOAbKmaXmwrpQYPcMvcHc9GCLcJilAM4eqF2XIXvNNa1zBn+dr7m/quUJdEUMjk+XGXSmNQlmTQXbWsQU+Rqt3D9E41EkoQ8/+UEmJnlQ0CCPyaNV7ZVAbZHFmc7418D5QCEMaTbBGVnmisAd0WM9B96v1nyDxrlwjZIX5DiQm71tt6lh8rlJFd5UcPD5Noxa69fevt4oV5YYLb6sDowqevQqxoKRE43nM6xwZISaHO0UOtwEvd1fHWGcoVH8AOKZvTBVv+yKrEKSLGrJ7aGGqIDYL0Vd1FFwcQRQXjKiNQF0dE0dsUrJOfnr5z9+1ZNRMidYZB25BJw4WGYfYb9XuhM1PTBZufQyNBQfBhu3RN194XlFHfGvUDZz0dVDqOWWJFdKsALFYOuxGJi5O9if5BUAEhD+ww63wmBi7bTuvaG6Yy+H6doweS52RDSTzGCVkLFMr6YyrRoOk0L9wrYP6JU34B3MNS6orS311TxJkmZQjiLdeBMIIMqsmeNVWhsPrYqlRHs7g7vZOWuR3GZdJMCJGsrUNvWpbr8ALsSs4GiaSk2IjECdm113mynWhSGQesh1h5g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU45bXVzREF6RDVycS9BTXZHcGZlMWxSTWhTWkRUWkM0UzNrWWR6YWFvTVNx?=
 =?utf-8?B?bWdEMysxQnY1TnVKSm9ydytrR21WazRxWVdKMGwvODVEWjI2WVBMSjd0U01u?=
 =?utf-8?B?YkJZMkNVUzZ2TkxJOVl2ak80NzJMTnVoRXUvQ2k4YVl2TDN6enVzems1ZHE0?=
 =?utf-8?B?UCtDcWpBT1hxM1lmUm4yTDN0ekNxSC9kSlpJM2NmRjBydFZEclJWZDIyRk5R?=
 =?utf-8?B?cHA2ZmxmaTJ2aTduMWFhOHR2c0h5U0JJWXV3VThuK05yWDRqNUM1SnBaTHhN?=
 =?utf-8?B?RHZUSWZFSkxxWHZyZ2lFbHBXaW9JcTRTWndHblMrbHFNaFVObnp0ODdManUr?=
 =?utf-8?B?MWlVRXFPUHYzY0JYNkN6TjZ6ZlJ6Z1NNRDh6bUJjWWRhRVNBTE9OZlprS2Qz?=
 =?utf-8?B?SExmZGNtNGlYdldxazNPc2d4eVpkQ2g0VGlNR0dkcmUrVlBwa2dWTEovNUJr?=
 =?utf-8?B?YnEyeVNIYWVRSDVXM3ZlYXlxWHRic1pHd0ZaSm1hZ3RWWFZTN1BqODNrRW5z?=
 =?utf-8?B?ZHFPYkVhRlBJZmRQS3h5TkdHK3V3b2UrNlVaZ2dmaHV1cjA2WjFwYjV1TFQ1?=
 =?utf-8?B?cUhENU9uandRbzlaSFV2TDJVc2hFWU1ULzAraUx2TlorM2diY3hBYkZjMTdX?=
 =?utf-8?B?WWRlZ3lQaWFPcGdhdmhsMU9rb0FBVEt1OXFzdmVnWWZOYmlDNEZjVzlpY0Nu?=
 =?utf-8?B?K2lqUHBzQXhXei8vSFcvTDR1akdGbzVqWFM2TGVtcWhuYWlXRDNldTB5bkRP?=
 =?utf-8?B?UzFWV1pyMklOUkFIang3dXNUcWVHbHdLbGVubHNGOWw0aThMcTQzWjA2TTds?=
 =?utf-8?B?Umt3eDllUDhpbkdXTlFoNk9aVEUyaStqMmNaOEYzT0ROczhjS21DaW8vczJ1?=
 =?utf-8?B?U2NpS1JDRjdzODFGWmFCZU45WVRvU3RxVEdPNGN3dUJSU1FsNDRhZTQ3NXVt?=
 =?utf-8?B?dU0vWWRDTmswMk9SQjlKMVo3YkhlYTJZTTljZXV5aWM2VWNtQnJ3eENWbnFX?=
 =?utf-8?B?Y1ZIOER4QUhPZ294cWNjQlhZVi9PN2sxWnNqT2hISXB0ZXplUW1BN2NxOWQx?=
 =?utf-8?B?S3NGSUNhK01vZ2tlVlFqWi80bGVhNjl6cnZtNGJLZnFsaXAwVmtVMmd0cWc4?=
 =?utf-8?B?STBaTkhtMHhKZGV4NmlDd2RvSEdrTkZVWTJOSW9Jc2FTRXdvRDVDbEYyNnYr?=
 =?utf-8?B?MHhRbmdWeERTYTRRcEwxMUExeEdNSEZHOVB5SGhmV0F3dUJ4WDMzMmhnLzRz?=
 =?utf-8?B?a0VFQ2NPenBCSlpVMmlPT0M2emo3S3UyUWRiWG44ZGJDejhZajZoVjBZWHpL?=
 =?utf-8?B?d3p6VVFtM0o3VEN1bVUwcVlQVmVIOFVSY0lER0l5TzVWcGtzdk9na3dUY2c2?=
 =?utf-8?B?eVhBdlFnVktqaUczb09JZjJ1MWVWYUwzYjc0SzRKZ0dwYnBPWHo4Z3FRTGsy?=
 =?utf-8?B?R2hDVTdQa0VEYyt5YkJzbGc4WWxFVndGVlJvNklJa3VFS0Fselg2bWJKUTVQ?=
 =?utf-8?B?VkhUMEtmclBYMGwvOGdzK01aU1cwYTlYYVdiRU1uYlY4OGFUZ3NhV2V1b0ox?=
 =?utf-8?B?VUYxekdDSmljSHFkVlRGT2pIRGdaOHFKWGpCcHZVYnhrQ3ptR28xbGwwZ0xa?=
 =?utf-8?B?QjBOeTY1VVhXKzhLL1piWEFOdktiU200NmhYUWZXZk1NMnc0U2phMXRMOFJF?=
 =?utf-8?Q?m8EgNQJgoVjYOk6Yeffh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598fcaef-cd43-4013-40b6-08dcc8d53a84
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 09:22:13.0491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_022238_960953_9AFB9988 
X-CRM114-Status: GOOD (  11.62  )
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

Ck9uIDIwMjQvOC8zMCAxNjowNiwgVGhvbWFzIEJvbm5lZmlsbGUgd3JvdGU6Cj4+Pj4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCj4+Pj4gKy8qCj4+Pj4gKyAq
IENvcHlyaWdodCAoQykgMjAyNCBUaG9tYXMgQm9ubmVmaWxsZSAKPj4+PiA8dGhvbWFzLmJvbm5l
ZmlsbGVAYm9vdGxpbi5jb20+Cj4+Pj4gKyAqLwo+Pj4+ICsKPj4+PiArL2R0cy12MS87Cj4+Pj4g
Kwo+Pj4+ICsjaW5jbHVkZSAic2cyMDAyLmR0c2kiCj4+Pj4gKwo+Pj4+ICsvIHsKPj4+PiArwqDC
oMKgIG1vZGVsID0gIkxpY2hlZVJWIE5hbm8gQiI7Cj4+Pj4gK8KgwqDCoCBjb21wYXRpYmxlID0g
InNpcGVlZCxsaWNoZWVydi1uYW5vLWIiLCAic2lwZWVkLGxpY2hlZXJ2LW5hbm8iLCAKPj4+PiAi
c29waGdvLHNnMjAwMiI7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgYWxpYXNlcyB7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGdwaW8wID0gJmdwaW8wOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBncGlvMSA9ICZn
cGlvMTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZ3BpbzIgPSAmZ3BpbzI7Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGdwaW8zID0gJmdwaW8zOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZXJpYWwwID0gJnVh
cnQwOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZXJpYWwxID0gJnVhcnQxOwo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBzZXJpYWwyID0gJnVhcnQyOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZXJpYWwzID0g
JnVhcnQzOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZXJpYWw0ID0gJnVhcnQ0Owo+Pj4+ICvCoMKg
wqAgfTsKPj4+PiArCj4+Pj4gK8KgwqDCoCBjaG9zZW4gewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBz
dGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsKPj4+PiArwqDCoMKgIH07Cj4+Pj4gK307
Cj4+Pj4gKwo+Pj4+ICsmb3NjIHsKPj4+PiArwqDCoMKgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAw
MDAwMD47Cj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICsmc2RoY2kwIHsKPj4+PiArwqDCoMKgIHN0YXR1
cyA9ICJva2F5IjsKPj4+PiArwqDCoMKgIGJ1cy13aWR0aCA9IDw0PjsKPj4+PiArwqDCoMKgIG5v
LTEtOC12Owo+Pj4+ICvCoMKgwqAgbm8tbW1jOwo+Pj4+ICvCoMKgwqAgbm8tc2RpbzsKPj4+PiAr
wqDCoMKgIGRpc2FibGUtd3A7Cj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICsmdWFydDAgewo+Pj4+ICvC
oMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiArJnVhcnQxIHsKPj4+
PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+PiArfTsKPj4+PiArCj4+Pj4gKyZpMmMwIHsK
Pj4+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+PiArfTsKPj4+Pgo+Pj4+IC0tIAo+Pj4+
IDIuNDUuMgo+Pj4+Cj4+PiBIYXZlIHlvdSB0ZXN0IHlvdSBwYXRjaCB3aXRoIGEgcmVhbCBib2Fy
ZD8gRXNwZWNpYWxseQo+Pj4gZm9yIGRldmljZSAidWFydDEiIGFuZCAiaTJjMCIsIEkgc3VzcGVj
dCB5b3VyCj4+PiBjb25maWd1YXJ0aW9uIGRvZXMgbm90IHdvcmsgYnkgZGVmYXVsdC4KPj4KPj4g
SGksIFRob21hcyBCb25uZWZpbGxlLAo+Pgo+PiBDYW4geW91IHBsZWFzZSBkb3VibGUgY2hlY2sg
YW5kIGZlZWRiYWNrLCBJIHdhbnQgdG8gY29uZmlybSB0aGlzIAo+PiBiZWZvcmUgYWNraW5nIHRo
aXMgY2hhbmdlLgo+Pgo+PiBBcyB5b3Uga25vdywgcmM2IHdpbGwgY29tZSBuZXh0IHdlZWsgYW5k
IEknbSBwbGFubmluZyBhIHByIG5leHQgd2Vlay4KPj4KPj4gUmVnYXJkcywKPj4KPj4gQ2hlbgo+
Pgo+IEhlbGxvIENoZW4gYW5kIElub2NoaSwKPgo+IEknbSByZWFsbHkgc29ycnksIGluZGVlZCwg
dGhvc2Ugbm9kZXMgY2VydGFpbmx5IGRvbid0IHdvcmssIGl0IHdhcyBhIAo+IG1pc3Rha2Ugb24g
bXkgc2lkZSBpbnRyb2R1Y2VkIGJldHdlZW4gdjEgYW5kIHYyLgo+IEhvd2V2ZXIsIEkgY2FuIGVu
c3VyZSB0aGF0ICJ1YXJ0MCIgYW5kICJzZGhjaTAiIGFyZSB3b3JraW5nIGZpbmUuCj4gTWF5IEkg
c3VnZ2VzdCB0byByZW1vdmUgdGhvc2UgdHdvIG5vZGVzPyBJIGNhbiBzZW5kIGEgbmV3IGl0ZXJh
dGlvbiBpZiAKPiBpdCdzIGVhc2llciBmb3IgeW91IHRvIGhhbmRsZT8KCkknbSBmaW5lIHdpdGgg
dGhpcywganVzdCBnbyBhaGVhZCBwbGVhc2UuCgpUaGFua3MsCgpDaGVuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
