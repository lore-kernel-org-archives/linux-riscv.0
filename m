Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F55C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i4mfXV7zBv9LwQEQIHsrNa79A+j+MCf3uXvlCBs45s=; b=YYY4z9w5KQXwvPn9xE80igVuj9
	ugQErBAbxt7WNXakqPPuTfZP2nS0+0kuTyYV/gQsyqSuoFI2QaXmF1uvm0gLd5gbp5W3diyQeTUcx
	jQ7l3sWaZBxGB+XGI9Wy7qrePDUMnnCwzDg2gfbeh0tDpJbbOaAeSYA68Xq3cOpy9RL4gj+yRbq6j
	4QERtDk/UMrnEF4iA1OpkgsiISlqDG2krUbxdC2N0xVUytzfuFcIAVOjYInwxiOmsMOiHoY6LV/L/
	K7mMfHwQoQhkZGJ1roufiHEfblRTA+EqKRJ22CF3KtHC9M1OaPThdJaWuvdy6eXUkiw+h2eMLDRQ4
	N9Rm07dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMmy-0000000AD0S-3iTM;
	Wed, 11 Jun 2025 14:50:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPISR-00000009aOo-3MQj
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Bc5GnLQvKshopR5BhyFce7Km7Niua8YcZnpMMU7naj4=; b=HXeDqIxSj3lKGHxaQTKfFez/HF
	XY2cjncKwW2/quFpzJzomHmKhakWSD/WiPVdkn+n9R4xbbvGvI9+sTnccifpsV79O0uw++eXHOHRx
	zywtrMhQrt1K2mTIUC3lSvXjTseesVaPaVm1LVmoLOGJFtFtW9JtNN8bK/AvrtBW5k0w7h7gm5wT/
	1SIo8E/PrXb2Xj6u+hZec/tLDzF6jfDKI4034uOPUv9egplTRme9zsvFGqi3NgDjmgn35qX5uRWQV
	B4zrjXGQs9Rcn42zO7uQrHYSEghmpOGaiSXEGHrE9mmqLgy3AOXNuA95ctrcYQqwCM9HAJXTre3Y/
	d1syHrGg==;
Received: from mail-southindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d408::1] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPISP-00000002GE0-2fPS
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 10:13:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEERgXS/iybr/trzFxn/yFOthaDTPdrs9U2tH+a2w8wCbLk13ZvIzKzao2aVXDIWyFQ7Sj8AS9h96TxRqdli4KhdyRT1RnoteAKtuSPf0XP07Iv38l4kaeq3iMdHC6kTt9NTQDUfj09q6eYg+c8RyYSequI/s5o9zhCk187ojeG0VYPYTdyNTNYSWJ5wQTZC4n5pE/Z6/q6vi/wjpanPYs+4jWAzpxQa4CttatOMXD6MQtK+KZkHThpeV7bAFkN/k7f5unhFN84MgKs9XHmRc1e1WzATmMJwNBrnTXQFR71zND7TN+46MZcAK13t1u8OUk5O1BL6snlemMAi4+1ttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc5GnLQvKshopR5BhyFce7Km7Niua8YcZnpMMU7naj4=;
 b=BMI3ca39DrNAjDeB3zlzP1TDwIrWcqkstfr1DQelex9VYFR00x3a821+ejhzjeiyDrkq9zQ+zS/w4bXcT1HF2JqiYYGPX4uvdQkyVMMUEHC/kPMDmwGZRSQPuhwTmouA3M92Rdblb+XFUc/W56s39cYHToe+HNAnf+uIawUpuWngfenwkTS2tP6pJhsxxqtk6O+y/6DAX4X9vk7uVwcGPlScKIiectfRKEECr1sUDn1H54Qd832q6IQJya7ixEwimBK3DP6sfTHymzcKYh9IwLLuHly44cCvvhHEdN0MhJKUVd+vTKZd9cQwNI0/A5s4SqaINbIpWgfeplpYuIug3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bc5GnLQvKshopR5BhyFce7Km7Niua8YcZnpMMU7naj4=;
 b=iJv/4jh+4VoLi1W/gC+m/8pa2woUtGqkO0SWx+NtYrfzSbEyKMOYRB8hVMcW6NKCjp8eUeQnIEZTznR1dAiev5X4hKnio+2oVJSC3d+N2ZOJP4bwBV1xmjGK50PVNE1EKJewcC2qC+21oF0XMkwR0gweJRC20NE6M8uAkLk5UN4EnoU+iztM1qE7kh5Vn232wUYzqnB7ddcjQREVcCtB8qJKLFcQrQz34MmcauR76UuA+VGKQMn0wFXZWn3u5SAhTiMvQOHH02Q4bLAmilGRrH2YtX3WsDdjQvocMZA+hL+0WxVDBCG3zEIUhHYmhs7wOjpRnHD8k03Bwmz4SqhzJw==
Received: from PN0P287MB2258.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c0::8)
 by PN3P287MB0227.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Wed, 11 Jun
 2025 10:13:01 +0000
Received: from PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 ([fe80::b63f:e256:4db1:2e9f]) by PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 ([fe80::b63f:e256:4db1:2e9f%6]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 10:13:01 +0000
Message-ID: <PN0P287MB225839D83F1A65D65D3EA6B9FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 11 Jun 2025 18:12:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet support
 for cv18xx
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Yixun Lan <dlan@gentoo.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1c0::8)
X-Microsoft-Original-Message-ID: <1f0798cc-84bb-4e40-a78b-bf2c12c0d29a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2258:EE_|PN3P287MB0227:EE_
X-MS-Office365-Filtering-Correlation-Id: 719a302a-0fea-41fe-55d5-08dda8d08c15
X-MS-Exchange-SLBlob-MailProps: iS5pQZgsAQCkRkOLrFZHmNZlYAGaqKxl89Ofu0p+FfuD2rIBIAZasrask3DPwC07pxo1elotNgvvCtlr7zWNf23SpIPgztfvtny2lT2hpyUt8lWCyoeTpNyqCHs9NxH7w5km2LMjHDMnguA78xElEtgElNpcFMDcMeWF30W64xdhIbIGu12jLKvecZ8PlyBf+2q1/GYC4PJxeErkWp8sKWKo5ft9QzNEVOtWjumSYA+2KVWBy6YAMY7hlHMvLYvipJrQEceycu6pUeg7ZF8bv3Gbwh6MZrdapC8oJNFIzXLoawaKjbd0kSVB1FOJ4fr+2CwTPTN0mPUmWQHwa9pQtwqtmfVkparM0lruockwyN1gqx7UmTOwaHgWuB8qPYCAuGhfm4QA/lxduIp4JgMEH1fgC51PDUh5lLtMmARIEWg8VmuvK8wKEabLtcYhwqkYJytP5wbQ7JVELwMuqK4sBG6aybq9Qq2/aUlqIRye5rNkQmvxkKcO2jU8S6x8FqBxAUwGo4rS1aww1wSjEIWE5mHzZ0aLQvU9CRyOH3AwByTOLgHtx9oi8KhtbKrU+VZl2Yjwba96cBL2b7RJ7G3Tvu1dp4zU+Zmb6C1Qv7K5wPB2tB+Ufbj5srOTYQ/evibGCN6ooq1GGpQemnf/mABaLaATpHuvnTOOFijmaihhR1vRY2nV10+36Qh38i1sWlkCLurRYtZSay5bYi5UvC902fXMm8MQJNGxT/GB5T1r9027CHN9zbpju/6Xjd8JhfKz6aUNlDQr1Yw+J9rtzO12XLtEqi/G/C9DtPc+bBhboyJF/mQSa9m1thTuZi8JWJJ1
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799009|19110799006|8060799009|5072599009|7092599006|461199028|6090799003|1602099012|440099028|3412199025|4302099013|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEtMMVU3U2tXQnEyT2dpcGY3b011ZkdMTmI3SGxrMlZ4RnVPdHhJZFVLWUx4?=
 =?utf-8?B?MFFIQTlaM2tJNHJLOXdONksrYjJmaVQzNisyaW5aRDhSbXQ5SVNFTGFLKytT?=
 =?utf-8?B?WXhqQ2RQRi9HR3l3akorT1VWd2ZoUFVyQTFXcTNMekpmZ3J2MGZ2ekY4c2wv?=
 =?utf-8?B?cTd5TEdldjhFeW5abnN6K3g5YitQNi85MEVVSXZpQ2ZjWElyRS8zbWNwNVFO?=
 =?utf-8?B?QzBrd0FpNHFEbU1HTmIxckZzeE56ZDNlOGc0QmNJS1hrTWN1OUlkVEl3U0g4?=
 =?utf-8?B?a25NWHdtelEzMVZOWTdCOTZWMklHRWhITmZ4aWdzeS9qaHR0MHF5Uk9QMUJa?=
 =?utf-8?B?dGpMUkhoak5WNERFU2c4YW9UemExTnZGcFA1WTBkbU11VVRDTmtwVUk0ekpV?=
 =?utf-8?B?bW1jWWs1bkFpVVNpVzErTG9aNjc2bzZuMkYySWNyb3hMczE2ekFtajBzYWow?=
 =?utf-8?B?QTVZNDdTdFFYdmExS0dONE45clJFYkV2SDBwMmFIRUZmSWhMTmZ3WkJpbExL?=
 =?utf-8?B?R2N4N2ZtMk0yMnJZV2d4anl6YUU0ZTZwRkJPVWlwNHg1RkRSR2MvS0JBUjZM?=
 =?utf-8?B?dTNha2JEa1o3VlVKZlNpcS9nZ1FxWi9tNnQxK0hIZllWSE5GWk9KSHFPTWtr?=
 =?utf-8?B?aEdKWXpYTFpweWlYbHNHRjVRbmwreEZBdUxMeVdCcEN5ZmdGenFqbmlFY2NV?=
 =?utf-8?B?N094TEhnYjcvMXI1em94QnQ2WmhQdkpKUXcwa2JEQ1dQTldWcHp3V2J3MUZr?=
 =?utf-8?B?aFF4YW1HcWp3S1Bud05Cd1F0eUtMUUNVdzRXWXF4OVQycFVPdG4zaFhZUitP?=
 =?utf-8?B?SHJPNloyUGNaWFI1MVE4Y1lDcjlpUC9rbTJLdXk5YkNCRk5mQ2swRjVabmlW?=
 =?utf-8?B?YWxleVNoeFBlQ3htWUoyK2xGU0RPcEhPeHp2aDJCVTNWQzZXVy9UMEJXVmYr?=
 =?utf-8?B?WW5IUTNmVTM3ei9lVGhwQTlCSUxEN3RLT3RxcWxPUzUwQmw2aEYyTU9uUW5v?=
 =?utf-8?B?ZkllTXQxU0REZm5LNnh5TXB0QkV0Sm1RbTdHMnU4Q0RPL2IyOGV2NW0zN1JN?=
 =?utf-8?B?NEE3RUhaNm9DRk84UG5HaXdnY2pPQkhLSWVEMzF6K0x4N3lGeEZRZVNUZnQw?=
 =?utf-8?B?VHdUUGJrcjBVb1d0RUw5U0huTTQ5WUhlWjlJTXlnaG9XTWYxMlVrdEd5d2tV?=
 =?utf-8?B?dnJzN2h1NFlIaTFLcHk2OHhja2R6cGdyUXJLQUptazU2aGZnNWlBb3VyM3RC?=
 =?utf-8?B?YmNGRWxLb1dIOGZZTkMydm01a0FBTU9qNnNmdVRBdm5ZejE1MnNsS0VRaDI2?=
 =?utf-8?B?UHZURXZCWklsYUJTUUZ6NU5yVVdScWs5V1U3SXVzdThjaERRQlVpSjNCSklR?=
 =?utf-8?B?ZjJES1h0ZERWcnd5NUVpV1RrWERQQldvd3JHbW5pUCtzWGtwbmRZYXlpVTNE?=
 =?utf-8?B?R1N3Qmd2b0pjNkV5SmVpYzRFTzZaaWNUU3lYTGNtS2FDTE9NMi9IZ0NtN2pS?=
 =?utf-8?B?VG4vUnhBVnRHT3ZWWlE1RDJjTXlza3hqbVZNS1VhOU1haURuZkZjSDNCZ0Y4?=
 =?utf-8?B?QWRnZDFLbUtvcWlJVW9RNHJ4Ym5Na3VONzN6VHZnR1pnVmlDVEhLWmpUbWpX?=
 =?utf-8?B?WHVEVGw5TmxXbzJJU3JBTkNMdTNNTmZIVUVZMnAyV3VXMnUyc3hxQ3FQc3VH?=
 =?utf-8?B?ODVzcjA1N3k1ZUhjK2FkSmVMb3dHeVZvNEd6UFd5TndabXYvTGpQaTEzSUY1?=
 =?utf-8?Q?qJeOhJtYX5dWrY2TZcFo7/1bfszaX5YLsaUElL1?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmQzbUNnaFhFNU5FcjNNWGticzRIdDMzdG9GemFsTnlvc0tob0FRYmNHaklE?=
 =?utf-8?B?b3FNYmk1ZTJaMFY3TTdvbU5hMVZzaVNiRGRMOVNJelBNV1o5UXlMVjNIWVor?=
 =?utf-8?B?a2lzdzVjbnZ3eWRGS2Y0RklVekJpL3JKNU5VYTFHdG1LeTRrcHU3RFJwOWZq?=
 =?utf-8?B?MCsrbFFHV0VqSXRjVFNxbGxWM1p5eWxaZ1hSSzR2dTZ3c3JFOUJxK3hDM1RD?=
 =?utf-8?B?V0ROeXdzenFIeUNJV292NTQyMWxtd2U0alhmM0t2aEJDT0tFVWpTUFdCVDlV?=
 =?utf-8?B?ZGFPVGdDSjNmZHpyRXQzVlAvVE1NRDRUQ2d4ZU44d24rSTdkMWJkN0JhRW9F?=
 =?utf-8?B?STFKTTlYL1d1WFBFQytac3I5cnN0M0lmdGpVWGtPeE9VZWE4bEdnZXduK1JX?=
 =?utf-8?B?Zk1OZm5SS01HbnpWMSswT3FJRkZ4bWZFY3k1RSs0YzQrTEdvVG1abXl4VjFB?=
 =?utf-8?B?Y00vY3lzZmp4R3FXZlk1dzN0YWo5MUFPcXo4bjhFSkdLMm5tQzhXZUFqWDFQ?=
 =?utf-8?B?aUx0M05WN3R2ZTBOWE1acWVHMjhHSGtUQVdaWEx2OXZVNlRSVUc2bjJncEdK?=
 =?utf-8?B?bFFSb08rMEpKbVRJTFF3c2xOU0FIZVRldVhvMXkrMjBJdy9XZThMbVA2OWx5?=
 =?utf-8?B?RFJ1ZkpObWVzMDRkaUtYdlVqdnFJVjY5eGs4bytJVm9sYnNFcURpK3JoQVpI?=
 =?utf-8?B?aldoVnRldUVyK1JwVXNuNk0vL3hnQ3VJZVVrc0p0VWdHN1VTNnhDM1Fqa3BV?=
 =?utf-8?B?ZHluckpuTVIyaXhwNkFSTXd3RGdKU0tSWmNaUmFoTFhnNElrbnJNM29SbTZo?=
 =?utf-8?B?TVdkTDk3bDZGVG1sckRwbm5KckdjWStRSTBOaTFjTGFrZ3NtMFlRL2I4YUFh?=
 =?utf-8?B?YThEbFh0VVJoaHcyQVlPZUxZY1hPeEhsc2hFSkpSbkREajdkNVNoaUNRSXZW?=
 =?utf-8?B?cytIVU4yQjhpenpvdGhTdDNEK0RGRlpaUFpoYVJFb1YzZVpLcE9RWkdVdFVp?=
 =?utf-8?B?K2pKbTBnb0JSQSt3enJ4Q1k4NDBxQzErVnQ3c3dMWlVrRFIzMXk0V0l3N3ZB?=
 =?utf-8?B?dnUxMWxvNXFZRG1WcFhMZVhJUk1MTU52d2FIaUdqRml6Y2NLUUp3UThGaStE?=
 =?utf-8?B?T3JPWmxBUlI3RXpBZVVNbnIvL0JibmtrdzEwMzYxNzlCaXRBNnFocElVblAz?=
 =?utf-8?B?a0IrdUxobjN5VlJOWWZ5T29TVzNSc0NiWmJvNVUzSVByVmJTSnRuL0xBYWtS?=
 =?utf-8?B?NmZQVXl1cHQrdTFzMTFTNEZRdnZ4RWxpQWZwaVdubGdlZWo0ZUZzNm1SVnVv?=
 =?utf-8?B?Nzcvc2xjeEc5MjVqYXRtemZqYzZqTXNDMm1HOXQwczRUQmM1Y2UycmNBbUVE?=
 =?utf-8?B?dTk1RFBZNC8wS3RzZTZwN2d5ZlprUis3TmdJN2VpUnB4a2F3YjlSdGdFbS9u?=
 =?utf-8?B?M0pTRGsreHFNUHNIT0E1M1lMai9xRW5ZVTNtOWJQT2RMbGNQTzR6aSt4WTRR?=
 =?utf-8?B?RGxLc2wyNk1RZExjQjJSN3czVlhLeXgwZFJGK1VDcFB6MjFpa0I0Zi91ZUpp?=
 =?utf-8?B?UWk3dTFIekJGcTlMQ3Z6SUJBR3Bza2wrWTdPWHpjck5TaXlra1FvS1R1d2hv?=
 =?utf-8?B?aHV5SVhCb3NKV3hRMm1vZDBWQTQzcjNVSno1YitMcTVobUxsRFNrc0E4YzBp?=
 =?utf-8?B?ZDJRbW5pY1Z3UEJPbmdlVkQwNlhXdXQxcS85NlN2bXBMZW5LOXlmdzBXYVVT?=
 =?utf-8?Q?PMIgMICtQAoKhNXRhwrZ/gM7yPrfeEQ0Xge6lCf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719a302a-0fea-41fe-55d5-08dda8d08c15
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:13:01.7326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_111321_827323_C27112C5 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Is it should be v2? I see an old one 
https://lore.kernel.org/linux-riscv/20241028011312.274938-1-inochiama@gmail.com/.


On 2025/6/11 16:07, Inochi Amaoto wrote:
> Add device binding and dts for CV18XX series SoC, this dts change series
> require both the mdio patch [1] and the reset patch [2].
>
> [1] https://lore.kernel.org/all/20250611080228.1166090-1-inochiama@gmail.com
> [2] https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
>
> Inochi Amaoto (3):
>    dt-bindings: net: Add support for Sophgo CV1800 dwmac
>    riscv: dts: sophgo: Add ethernet device for cv18xx
>    riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
>
>   .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
>   arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  70 +++++++++++
>   2 files changed, 183 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
>
>
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> prerequisite-patch-id: d5162144180458b11587ebd4ad24e5e3f62b0caf
> prerequisite-patch-id: 9e1992d2ec3c81fbcc463ff7397168fc2acbbf1b
> prerequisite-patch-id: ab3ca8c9cda888f429945fb0283145122975b734
> prerequisite-patch-id: bd94f8bd3d4ce4f3b153cbb36a3896c5dc143c17
> prerequisite-patch-id: 1b73196566058718471def62bc215d2f319513c3
> prerequisite-patch-id: 54157303203826ccf91e985458c4ae7bcdd9b2ba
> --
> 2.49.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
