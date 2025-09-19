Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8951CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPI7yX/gMz8bfU81PQF/zGC4ohaJ+WeonpaKiBBHgOo=; b=eDkusayrw7P5cO
	KikEk2Ajg0GLo4d+9TSYefu5sLBlStyDX9e/Vq+6OIoAo/4fQiBs6D1NCEHUqR13XwOz5+UwGgtOE
	1t8H3j+Hye40NR4t52b6UHM/3oIVPkM23bjTMaou/kh1dFQoCBDr+K5J7DIqA5XnAGYWrV9uR4Flo
	jPTK7XkI9OP/SVIRjco/bVclrs16PkNI7Nm0jDv1xx3SFpJyQYaXro0g8woM0mTBDYNUv19aKkbHB
	3nOHwhN+3rK+6OieVb23F4dnZvqJWXpd5rvCulQD/FvyT7A23elRTybwXOASHTZcU7ZwJ0RKbm/oD
	yXb1hSDMekzJDdrBI+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzali-00000002vX7-1VlC;
	Fri, 19 Sep 2025 13:03:18 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzalf-00000002vV6-2bQ2
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 13:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A017FxAYRYTRPnEJvjL3NjDTfznr68tiMmj8GNgKgh9xA6m7SA0hZQKEMN1jtlwh/wyw5C8LYd5E40bXUH6fmryWGeLRQVoXuQTsff71OtipI9AXcUHIISrVNbDMD8HfpvsVzwF0R8safs6FCUHQtYrLpvz1PgAhCpMgyleFEht4947BhrIdysZiUJWzqljZmScwN2BtyBTP85+64pS8qgK7xEU2AbsxBv1jBVlSsdJtL2MNNXLcAO/uUBPRHeWhTVa3DGzGy7wicpeB41iOEVI7Rqyf5bCMMh2cQVDt86qFWil5VfaeI7VqxDfFSEkjClB00FAJ25uOT+6S+zc06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLGtjyFyeNdD50Y2E8GZZ7HmKwLvawmWV3xoZ81Aqo0=;
 b=nzg8GNOB85GjSfuVIzuicIogrMQ3eF0glL5O4Wt+EXbtm68ZCCBSdYIGzPhXpEsf27fBG7vsd71cSoHohdI6V/7V6Qhb3qNsNfxkGS4hpnt1/GvFQ/SiVIqQ905qg21O7yJz1MJX4Ujn8msRfBLOS+5yAdFcAVJnrhh6x6Hbt/vuwg8iyqxbyDIBj0wXCywYYEcxBH3Qjbz1UWqA1SneNr+k2btlY7MCJQ+bE+KODSGG6aMmvdzUOGCRUNi0ybFkmxodDqBNTpFsdiAbiP8XDug+aJyUIO3clXjbh0EGd1RPMlps8Wbh0DPhhsskIt85PnMSrdOkyvZVjbXeh4DhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLGtjyFyeNdD50Y2E8GZZ7HmKwLvawmWV3xoZ81Aqo0=;
 b=FTU+AriMKSRuV7mwpwKuU3Kf4x1TE7lLfsdAsubW6ksWltRZKqgkGR7tKar16MnSqj88B/wRjO0cgdV7zU3GaSbeVcL2QMMXkYVN93DP/urIz2W49KHX18cMwv8RJklWlpnCXIB9yAxE/lYmC74N3ZHt68zepBQ3Dw22/zDv4clXvJc7S+Fp3oAeYdArkh1ViZOeMjLkauFZZCAoVmaMuwawhaVwx9pJdKylsq/YJoQ7WcQPKLZ7A+NWouJJZuE6w8m4e+e4KKELcO4k7sd6nQZMyD+GKW3MH1P6DsMePpm99GWfbTVkbbtVs1mxSRx9bwTZYCJWTQbyFXn7//oQaA==
Received: from AM0PR09MB4323.eurprd09.prod.outlook.com (2603:10a6:20b:167::7)
 by DB8PR09MB4233.eurprd09.prod.outlook.com (2603:10a6:10:12d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:03:06 +0000
Received: from AM0PR09MB4323.eurprd09.prod.outlook.com
 ([fe80::4848:df8e:2001:b7ee]) by AM0PR09MB4323.eurprd09.prod.outlook.com
 ([fe80::4848:df8e:2001:b7ee%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:03:05 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "devnull+aleksa.paunovic.htecgroup.com@kernel.org"
	<devnull+aleksa.paunovic.htecgroup.com@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"arikalo@gmail.com" <arikalo@gmail.com>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "cfu@mips.com" <cfu@mips.com>, "charlie@rivosinc.com"
	<charlie@rivosinc.com>, "conor@kernel.org" <conor@kernel.org>, Djordje
 Todorovic <Djordje.Todorovic@htecgroup.com>, "jrtc27@jrtc27.com"
	<jrtc27@jrtc27.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux@rasmusvillemoes.dk"
	<linux@rasmusvillemoes.dk>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>, "will@kernel.org"
	<will@kernel.org>, "yury.norov@gmail.com" <yury.norov@gmail.com>
Subject: Re: [PATCH v3] riscv: Use Zalrsc extension to implement atomic
 functions
Thread-Topic: [PATCH v3] riscv: Use Zalrsc extension to implement atomic
 functions
Thread-Index: AQHcGyyolP1obCCZ7U2/zE+FjPM0RrSalRoA
Date: Fri, 19 Sep 2025 13:03:05 +0000
Message-ID: <27b23b18-1e69-458c-9874-f704553d4bab@htecgroup.com>
References: <20250901-p8700-zalrsc-v3-1-ec64fabbe093@htecgroup.com>
In-Reply-To: <20250901-p8700-zalrsc-v3-1-ec64fabbe093@htecgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR09MB4323:EE_|DB8PR09MB4233:EE_
x-ms-office365-filtering-correlation-id: 9b742cc9-9789-44ff-3c9d-08ddf77cdfa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cXUwOXNoRWZ0OGVSV055MnQxdlFLOU9mbktWVnQ2ZGJQeVJ0dTZPdytQRGYv?=
 =?utf-8?B?bEp2SUVqbnlPSHFxMEtTKzlZdk9aN2NvcmJCRlRQRDZnb0lPRWdOVWZRTVhR?=
 =?utf-8?B?ZmlkcFVqOU53dnBROVd6cmFYMXJvSnJ5c3l6L0xpN2lDZUtrR0hwVTQwdk1Y?=
 =?utf-8?B?WWFldUsxZ2N5TlY3YzB3ZkdMNGtQQ05Qb09oQzBORzJIYU10QWJlQTl6d0Zs?=
 =?utf-8?B?RjZ3ajNsRkpVUUwvVU1wNHhqRUQrRGxhZFFTcUhFZkptVXNHRnhlTEVqOGt6?=
 =?utf-8?B?LzJjcWp2S2JoOU5DRUxaZWdLZmtsWFBLQ2xUNlF3REtwNXhDenVWempLOHdY?=
 =?utf-8?B?dndEZGYrN3dVSjVXRlVlaHZZRUxmcVJpNGE5QzdsM291cTM3emtaRTBXREJ2?=
 =?utf-8?B?ZTBkWXlkUFdlUVVIOHVUaXIvOVcrbzBFV2hoVzBhN3NHTm8xSUVWcnpNUkpL?=
 =?utf-8?B?TUg5aUZraFVnUlJISW44WlcrZXdUb0dWd2lYVCtkK0Joc3VvYmx0UWd0V3h1?=
 =?utf-8?B?ZGJ0Y0lsS1RTSDhyMytKQndWbmo4bDNNTTh1c3R4MWY5YmhaUDJzckQyeHVr?=
 =?utf-8?B?dmU2ZVZpdkhlTzR1U1Y5eHY4elJ5VEVXZGd5RzdkUWdwYXZiOU5JWnZmVlY5?=
 =?utf-8?B?QlpZUGE1MXRGblBrVUpwTTdzcThiQ3dRdGd3cm1aVGRzVHNBUFgzVjRkUml1?=
 =?utf-8?B?UGZDNWdmWEltbWFYdVM1TEtKVDllREZwakNWbXQ0SGdNcmk1UENOOUpCWDkr?=
 =?utf-8?B?ang2QVg4eUhJalRrc25tc3hpcjYxdThKNjVPUHdoaUFmbFMxSWplZmpxY01S?=
 =?utf-8?B?MjZJVXRreXB6bXgzTmZUc1lFZm5STXEvcVdKUkVoU3N6KzFzNUl3SzlzMncv?=
 =?utf-8?B?Z1JyWnhzeHVVN3JTbnVoRVIwTU14bk11R1dtN1pMbEhsWUxPQit2aG5jeEM3?=
 =?utf-8?B?VlAyMUxoc2JkM1FrV08zTlJiVGdWaUxlcHpCUGlXdEl6SWdYTGhBZUFOZ004?=
 =?utf-8?B?aHJCQmhTZXFiRkg2NUE5cW11aU0veFg3UWhHN0NnWDh5aHovY2x5b1lyWmxR?=
 =?utf-8?B?WndxZWdpcW9nTXhmTHBKbWtBaS91WlFaSnhJMVRhZGF6TTBud0pER25mM3A2?=
 =?utf-8?B?L1puWjJXMzBxb1RhRUsxbi9lMytQNmZpT3VyczVGNnZscFdJNHRhdzlsNHZY?=
 =?utf-8?B?TXNmMWdBelpVeEswWUhiQUpBOWFrZXBtMjVFN3J6N1pEekttemNZYjFqUlJt?=
 =?utf-8?B?VWJHSHFxN3VjNGlmS1RHNDFudWNlNVRwVzhQQW1oRDgvSlJTVlA3MzB5ZnVa?=
 =?utf-8?B?djdVOWVDdk1FLzR4cGRVTkx6VFNuQVBJRmRyWmJvZk9UTVZNQ2hKSC9Cd0oy?=
 =?utf-8?B?a0p5Qkp6WmNkOEVMNEdSS1ZZUjZ6SWNndzJmRHB6T2RIZmF1NmV0NVBCMFJP?=
 =?utf-8?B?VHJXN3RwUmdseTdQdFdJRTNYMFB5UEN6TkJlcVdpb1lGTERUTHJJbHJwWHUr?=
 =?utf-8?B?NFVPckxOY1VEV3VtNUJwTUFqUC9QUnJXYjFvM3JEU1BuVHZTMnBnN01ldUpv?=
 =?utf-8?B?aVdhNU9LQ2g3T3dhU3VTcHRNQmpMUzFnMytpelVYNWZyU28zWG40ZDNuYzcy?=
 =?utf-8?B?eG5uMHBwbzdkOTEwcnhSZnBQTlRTYldEbmhIaDlCK05HRDZwNEQ2ODQ1TFJB?=
 =?utf-8?B?UndXUFRQdnNCOVAxbWZYZ2hsY2ZRSGZUbC90UkJGQVF2TVozU00wWUdiMnZq?=
 =?utf-8?B?SVFER0RXbEtEM1paKzhianBMUE1zOEN6NXdTdVNDK0JQblF0bjkyOStyRHFI?=
 =?utf-8?B?STBWZDJTNGJ6RFhCaFl2OFRhZTR3T3NXM21wSjJFWVRqeWxrT0FvNHVVS0h1?=
 =?utf-8?B?MVRHRFdvTXdZWXhrWENZSDg0N3M4Y2s2Vm1FaEgrK25mdVRya3ZCYVlwZjVi?=
 =?utf-8?B?RCtZZWw5dEhBUjc3ZmhWcXJVUzN4dU90WU5GUkwrVWIvRmNWWGxlbkhRMGti?=
 =?utf-8?Q?+1KHeM1HGoopjNNdaVv8mvA76HylHE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR09MB4323.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWJtZ3dESndreXRjYzBzbGxTQXcweVc1K1ZVTm9McldEbzNVY25tVGs5cGpz?=
 =?utf-8?B?ZTlPVVhMVnhneTNDSDJ6WVRmb2s5SWNQaUFMbUQwb1lnN1Q5M01WcFZNSk9U?=
 =?utf-8?B?dVh1ejRMT0QxWXpIUStvYjQ0MHVwN2hIcG05U3A5WnNxTzJUcGVVMzlYcG1I?=
 =?utf-8?B?VTI2eVlWUDZ6VDNDVE9jZ2tCbk5yWFNSdUxYaFZGcTJpQkVBOW9LTzAvSVhR?=
 =?utf-8?B?WmoySFIwZ3FIWlNsYVFUeEw1U3J2NkJJZzdKa3V2Sis0aFJHOGVERHlNRnVw?=
 =?utf-8?B?a1lRQVRBcCtzQWg3ZU5McXhoUEswVndYOUpJeWlJQ3FlOGd5YUdnVXAybHpN?=
 =?utf-8?B?QzBqaDllTG53R0xYb3QxV1NSUVlPSlNQOWRnTjFSa1hSWm81a3dVZUZnbklS?=
 =?utf-8?B?Q3l5R255Zm9vbDRCWmMvVkhaaXh6M1JYWndqYlp6YU5MaXNkOU1iQ2ptenNE?=
 =?utf-8?B?Y2IyZzJGb3NPNWdwYkNackt4WW5ISGFlamZ4VkJQRlRvRnpibGx0RE9DWUFF?=
 =?utf-8?B?MlMvNWVXM1kyN3ZUK2Q1U3N0WmNPVGY1ckpCdEk0UmErQmtwdExYSkg2amtV?=
 =?utf-8?B?dC9mMUdwTmJEVEpyanJzRmlNSC9Tdi9HWWtySitIMVZNMDNVRkEwdDk0eU95?=
 =?utf-8?B?Tm9vbWw2NG1Gazcrd3k0YSthM2w3QmNHNlRPbVY2UnZib3pBbVlkK1pqU0lT?=
 =?utf-8?B?TG8xT3FxUXo1VW1ib3lmMVZvYmRnMUhwYkV2dVdSZ3E2Z0ViSTlBR0puZVBD?=
 =?utf-8?B?SlllS1BMcExvNm9GSjBzTHI4TWZVMGNvT0J2ZTZUb2xPazhWLytjNnZiSnNm?=
 =?utf-8?B?blllN2NDSXVsVjZPbkZBcFZsTXoxajk3R3FqaHkrVnpOVURyakxQNGtaQndl?=
 =?utf-8?B?aWZhWHh1RkNFREdjRWY1Um1qY3JrZ2luNE9DM0pRSE1pTm1iMEN3Nlh1UmFv?=
 =?utf-8?B?R1BFNWNRK3FhbmNpK1lvNGdUZVpYYnZPWmtsVDI0d2FxNk50YnJnTmhBTTFU?=
 =?utf-8?B?K250WGhVbkd1U21Hd05IV0l4T2lzNGRPT1R3TlFGdyt1WW5reUs3RFAwa0Vx?=
 =?utf-8?B?ZnNvTUhtQ2FBVG1XVFpXcG10MTJ2YmdVeDA0Mnk4N09NY1I0UFIzZ2lyd0la?=
 =?utf-8?B?Q3FJUlBESGFBdXQvTFNjaUdWZ2xjWHJVK1RkSEJYUHdyUjhrR2kyVGxzRmpE?=
 =?utf-8?B?Z2pma0hGRkRsWHFxd3NYYjNrc3JaSE9RUzFhVlNOdDVKM3Q1Y1FYZDFLN0Vm?=
 =?utf-8?B?QTVzTzBFQlY2ck8xMVlaSzdmc2xtU0VRaG9hMnE2bTRjRG5vbnJnTEFVRTZr?=
 =?utf-8?B?YlE1ZHEyTkV2Ymg4YzA4TjVqY2NGRGhONjVHeHFXSTN6bWJYd1NCYUFiRlN6?=
 =?utf-8?B?ZDE4aS95OVZ4T1NNOU5wSGhkaVptNVpROGxDTzZWaFhWZzR0bW0zaXRnaFF0?=
 =?utf-8?B?SGE0OXphWTVqZUN1Q2JaZWhDV3c2QTlUN0Z5YTVsbVRhZWVsT09wTFc1Rmk4?=
 =?utf-8?B?K2ZpVGlPWTNTcGJtVnZ0YkVQSDgxZlVGL0lvdXFlY1pQYzM0c2R1Ym9oKzVR?=
 =?utf-8?B?OFFPdENRY1VpOWpqL3FESmN2UFpKUkc4by94aW5JYVA2ZkVvcXQ1NDhYa21O?=
 =?utf-8?B?cVBIYzdGNXh6RFBMeFVFald5SWc3VjF4ODk3WERNeUR3NHNseG5wRlRZa3V5?=
 =?utf-8?B?V0duR1hNVEpYUnlaSGpjVkxqQW9COG8xNUE0amdDSSt6U283QUVncVJRZEZw?=
 =?utf-8?B?RjVXcVZVaDAzSjdPMzZFYVRBRG5JaDBHZEFUeVFadmEzcVJROXI3YUFtWHV2?=
 =?utf-8?B?T3hIbmN2OVMwYWVoMTFoV3VLbmpFelMwc1FlMlhwREFGQjlKTE42Q3lGbFNj?=
 =?utf-8?B?eFZDUm40cTVZVFdnM0g4U0g5VXZ3T1lWQ3U4WFBjUXErYUFqTXVFa0VwNTFi?=
 =?utf-8?B?Y0gzWUJZZ1JnVDQ2bDd2aU50Sm8zZUJKY3d2ekE4REUyTlpXZXVsTW9RVWU1?=
 =?utf-8?B?bmNiSlR6WU5NMHFWd3dkNklJTkNXeEd2NllrWmYycUdWYTFLOVZRdUxUUWZy?=
 =?utf-8?B?TXJ5bC9CUTVOcGdCRXVlb1I5bFdYclJyY29SMW43ZytaK2RraC9nRFNRQ2Fp?=
 =?utf-8?B?NzRubFlXWGIySGh3aXZaOG02bDNhV0FyZkpRd2dLZVlyREhGSStjTE5oNkJV?=
 =?utf-8?Q?praL4eVhXOFEVK4O+T3TyDU=3D?=
Content-ID: <162556459DD290478F5408A8510CF0A7@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR09MB4323.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b742cc9-9789-44ff-3c9d-08ddf77cdfa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 13:03:05.6205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2e7YCIsCzV+z122jlEfbd6jeYy2dI1sTpiJXvQteddqP/y/mzo5oPtoQbq8hnv1nmHMv8BJa+brzgEucFcY5vBUIfem8bbQQlsqGWDsV/+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_060315_677115_1D01D880 
X-CRM114-Status: GOOD (  14.08  )
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

T24gOS8xLzI1IDEyOjM4LCBBbGVrc2EgUGF1bm92aWMgdmlhIEI0IFJlbGF5IHdyb3RlOg0KDQo+
IEZyb206IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29tPg0KPg0KPiBVc2Ugb25seSBMUi9TQyBp
bnN0cnVjdGlvbnMgdG8gaW1wbGVtZW50IGF0b21pYyBmdW5jdGlvbnMuDQo+DQo+IEFkZCBjb25m
aWcgRVJSQVRBX01JUFNfUDg3MDBfQU1PX1pBTFJTQy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hh
by15aW5nIEZ1IDxjZnVAbWlwcy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzYW5kYXIgUmlr
YWxvIDxhcmlrYWxvQGdtYWlsLmNvbT4NCj4gQ28tZGV2ZWxvcGVkLWJ5OiBBbGVrc2EgUGF1bm92
aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGVr
c2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPiAtLS0NCj4gVGhp
cyBwYXRjaCBkZXBlbmRzIG9uIFsxXSwgd2hpY2ggaW1wbGVtZW50cyBlcnJhdGEgc3VwcG9ydCBm
b3IgdGhlIE1JUFMgcDg3MDAuDQo+DQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gVXNlIGFsdGVybmF0
aXZlcyB0byByZXBsYWNlIEFNTyBpbnN0cnVjdGlvbnMgd2l0aCBMUi9TQw0KPiAtIFJlYmFzZSBv
biBBbGV4YW5kcmUgR2hpdGkncyAiZm9yLW5leHQiIGJyYW5jaC4NCj4gLSBMaW5rIHRvIHYyOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MTIyNTA4MjQxMi4zNjcyNy0x
LWFyaWthbG9AZ21haWwuY29tLw0KPg0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvMjAyNTA3MjQtcDg3MDAtcGF1c2UtdjUtMC1hNmNiYmUxYzM0MTJAaHRlY2dyb3Vw
LmNvbS8NCj4gLS0tDQo+ICBhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhICAgICAgICAgICAgICAg
ICAgICB8ICAxMSArKw0KPiAgYXJjaC9yaXNjdi9lcnJhdGEvbWlwcy9lcnJhdGEuYyAgICAgICAg
ICAgICAgfCAgMTMgKy0NCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmggICAgICAg
ICAgICAgIHwgIDI5ICsrLS0NCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3BzLmggICAg
ICAgICAgICAgIHwgIDI4ICsrLS0NCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5o
ICAgICAgICAgICAgIHwgICA5ICstDQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9s
aXN0LmggICAgICAgICB8IDIxNSArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3RfdmVuZG9ycy5oIHwgICAzICstDQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2Z1dGV4LmggICAgICAgICAgICAgICB8ICA0MSArKy0tLQ0KPiAg
YXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAgICAgICAgICAgfCAgMTAgKy0NCj4g
IDkgZmlsZXMgY2hhbmdlZCwgMjkxIGluc2VydGlvbnMoKyksIDY4IGRlbGV0aW9ucygtKQ0KDQpH
ZW50bGUgcGluZy4NCg0KV2Ugd291bGQgYXBwcmVjaWF0ZSBhbnkgY29tbWVudHMgb24gdGhlc2Ug
Y2hhbmdlcy7CoCBJIGNvdWxkIHNwbGl0IHRoaXMgaW50byBtdWx0aXBsZSBwYXRjaGVzIGlmIHRo
YXQgd291bGQgbWFrZSBpdCBlYXNpZXIgdG8gcmVhZC4NCg0KQmVzdCByZWdhcmRzLA0KQWxla3Nh
wqANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
