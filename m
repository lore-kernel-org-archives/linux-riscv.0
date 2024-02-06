Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0123BC48297
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VljsmGK5mpT2imUTe6G43JikTIq7NoUnBFDzQPyALYk=; b=nBYFbm0BJEsW2DUNKehCtF9Opj
	AQqzkDPHpd/7/WFkRNvaqxcK81LEL0vuS7IQg/4HRb5Rikilejgtx5OmOD0nPazOCYivdWzeRFpcs
	mQuOjlUsjmmM+WWgjZBy2ir+Wjvb7Eqst133dbFUYVINKuTk4+pvEWaI53hJZgpSTsBzgmitm/7KE
	RNbMVCEdbyZSaQhufOymGBtcpJPaIekuVTuJAaSitoVDjIZcV31lrgYWMLGi6zb4ss2+hJaRSM59O
	PLv1pxPSe/088uq2e8UZP8tXbHC+XOEhfEkys4qGI4GS5wQVrGMtTp8BjCSTH2HDv421KmG+FPoAJ
	+4ZmY24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXL1J-00000007dWk-2vNZ;
	Tue, 06 Feb 2024 12:57:49 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXL1G-00000007dV1-1CBh
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 12:57:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a46fauodscHKahpMF6uIX7wxoFLikDGVlrX8tXwl6CWElAAzwU/cVDOEjByX96pTBWK5HqwB0YilFsa9aJWzto1t9cFEhtSQiM+7wcU/cB9GgSkYKUK5HZVAhHV1V9tSy0mtWGmgarqfUiHX48ZHUG3VoeexnjDTLgfCgK6iQtQvy6GoeGrl4LM76SnBI3UM2P/HIWWX5vLQBUe+M4uooSYDozziZrNAzjE0anGhJkLqDez6LQYgQzyDH/G5wbGv+STYPsKHhCCPHuCp3oUB0VNFncjN/zhYdVcz2/g+KnuFMe0s3kdPhxOGLJfqBr2aKxY/MzKlC9F2PoB2CuWtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFTgli0Q06M8692lRLpQ/22uCcJPhpbPT5ZI82wtybc=;
 b=foQ7mhv/r2CsKQxwzuXexfAhHa10CrX8FTIu9FfFLuZ4Q1ajP5ZiOOuyazGLNbNoICOTu0KLjdEEajI9b8xcusxLdHUSwjAuevWURXkdRSIyII0fnejdYZwvnygnyoaB53vJTqDboAcLYyn8cCxPKnAIkVAUD8gxHMmNjJXMT1DNwWSyw4UEy3wiFaGEhrcYTrj1XPj49wlA/JhyRgEOnoazI8jd0UjDEADjuivqlrXCbLkwMhAtp6Vj4qBLFvOwJhscc3+r1QphHyP3mMTNzjZo3hNle9RdFJcQidXNBYPPdqIvFYDk8GsXwx+Ha3rAj8RpCk0T6jInzVnXSar6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFTgli0Q06M8692lRLpQ/22uCcJPhpbPT5ZI82wtybc=;
 b=bEBBMD7rHC5ZAieIF5jWaCFKHzkIvLj4aZRVTyu2gIY18LGMya8qYyZovhd8BTb01GoFVgSwEKTRnVn0Qwe3O69yvfE4V4Xirwi4fooGXlmQNgmXDvW8Dh8/SdE+4xcEFDqZ4gyVmE/lb/tRhxwSC6UNpbXr82dtAcAGlkmT41T9KR/pcUPIUT/ggQw4g8pDyS7xxAIUYYI81Ymg+w99qo28+phNmhKDnc6JpU0jMp9UZxqBfKiWACW767q32oqYpXxJWnT0Mql2s4HNhaiQURKOgmv+S1NJCU8wHnyPN2lQW0Y6ap+8oj5vhrhA78UzgIfcHSIm3uTK+GODS7vs5w==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB2086.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Tue, 6 Feb
 2024 12:57:32 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7270.016; Tue, 6 Feb 2024
 12:57:32 +0000
Message-ID: <MA0P287MB2822C8930916B90A9C1BAA49FE462@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 6 Feb 2024 20:57:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] dt-bindings: clock: sophgo: add RP gate clocks for
 SG2042
To: Rob Herring <robh@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 sboyd@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1706854074.git.unicorn_wang@outlook.com>
 <fcdd83addcd9af159a0bebf2a14543168bd59a07.1706854074.git.unicorn_wang@outlook.com>
 <20240205172422.GA3643653-robh@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240205172422.GA3643653-robh@kernel.org>
X-TMN: [q9PRw6FclFsW5rl+vuv4cnHs1xWmWZul]
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <0c5ada0e-5433-4f82-af53-1eab6a3c9e5f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB2086:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a4a3f6-2850-4eed-6ce7-08dc27132ec2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cE4UKiZwy8Tv09dcvIyZqZR6/DiCESy9IVduffq5M31rVYI31seivlzS2C9Ay9cdbiGQGeiNbLR40WSbz5qks2zQb94MPVCBnWjD3BG5JlDvFNXxIA5vCmmNplBfj/73/IuVZVc3NBbfJ7sgRjJLvCSjmbNfvthWDZJ06aGtAd9Rgi7DDcgepBa1bjhy/bO6sR2NFppg1RhD5X8wRbBaBRJH2Erv4UBKb4S+liy/md3F8bdIMISygtD58Kj5ssnWoQQZGCLPIJDBtJcnw+CNVU7vfBdzpJ4BWwjLDJ7e8pmfJTSF9cPcTmDvaWeptPMyZYXNQ4/MlsUduMiDuzWI7kTED6iLUKCREoQJcL5O9sg20pXwKZHMe6BNjGj+9FCeS2ZKaJMquBk5AD1w3hfEfljJSeftXefyAbPMvbcTofgIx2w0iLOIzmOWd2/aJJ2xyClOCDwNpvZp8q1pGbihPtI7vSVoaISrXOZKv8yxo6kdTit1dBRELShvE0RJoVNTqKiuFKwTXV2ra59FRDX9mCjihySLKjqeo5xvR/aBjG8k4wOHN6MpZsvYR6K6AtAhHG0l1ImQvwtBn7dUi16o2Gk+449bhjqFmG/t20/SsEQ=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZqUTF3MitPeVFxMGd0MjZzR2lpd2pHd0EyTkNaaFBnWFQrQlBCck1la1hR?=
 =?utf-8?B?enBaa0UyYmFqU2RYM1cvNVR1UmpIdkdhY0dVditBMiszamFNWGU1c2x6MFFT?=
 =?utf-8?B?dEdjSWFzNVk3UjhBYit1bU1ZZEJNditpbzk3TWVQRUFvVmZZSThsNFhGeHJJ?=
 =?utf-8?B?ME9la0xzN01MY2laWmJJeERsejRYc0JyOVRSUGhyRDFrWHNNWHl1WXRsV0lU?=
 =?utf-8?B?aS9UZlFka0FJRUNBcUVmaTg3aDY1aUNsS1VIRXJ1M3RiL0lUUGRZS3hmcDh3?=
 =?utf-8?B?VUc3TWlVUlNyUUg3QjhVRjVaTnUzMWIvV3hYZzVJSEVOQmlDSDBqVXQ3eGVH?=
 =?utf-8?B?OVFqa3FCK1NwK2Z4eS8rK1VDWE4vWitlUDJ4L3lHMVUyZjNWS2orK1V5ODUw?=
 =?utf-8?B?dlZYamhZV3owQU9HZHlBS3hWYWliZkg5YlQyREhWd2RFV0l5TzkrVVQvbEh5?=
 =?utf-8?B?SnU3L1lDOSs2bllwN0dZTWhuellyVHNKOGR1WnIvdDZHdzVacVVhMDJ0eXdN?=
 =?utf-8?B?czFGY3Q0YWFTNVRvZFRIUHBzRzVad1Z5N21oT0tVTEhUTlBpNDhTT3o2Ty9I?=
 =?utf-8?B?YkxwN29NRGltWWFHaWZyb2JqNzl0ZERTbEMweFhtYnc5eEplTjhOdXpiNjR3?=
 =?utf-8?B?ZUdiMmVDclB1djdSNDNKVTdlSW52cFdpOHV3c3dPMGdLNVl2c0RvME51OVNW?=
 =?utf-8?B?NmNRTjZUbW1ScG1mTG04M0RmZDZEWWEzc0Jtb1dyejd4MTZSR0QvVFJHeXM3?=
 =?utf-8?B?OGNwSFYrVG83RFJ1NGpZc2F1RDIzek9kNkVuSDZvc3B4d1lKMkZhZU82Sk9J?=
 =?utf-8?B?UFRFbTZPeWlPNWlVQWZxZ0J4VndwbE9OT1N5NFRML09GZEQ4T2dMRjdIT3hZ?=
 =?utf-8?B?S0JLTmNkQ2wwa2w0ak9Uam5MVlNrUE50ZldYZDNFall5aDdJWWU4YUIxSVBj?=
 =?utf-8?B?dS90c0s1TEp0MDVvczVzWlh6bURQTmFDaGpWMzVJa2NMRjZ6N3hSK1A5Skd0?=
 =?utf-8?B?eFdZakkzbWlPU1RmbWIrVnJoamcycHBCNDloaTQ3TTFxbG05bzRUbnRYVGZ5?=
 =?utf-8?B?aFNDbllYMWNqcFlORjdqb0orZDlkWUNIV2NyVjV1R0JWSGZsbEdvUGF2blhC?=
 =?utf-8?B?aUJqTzE3SHYzbzk3MnZ5ZEpWb29ZUHptUjRRZU1uQ2MwQUJZRStmWEFQenJU?=
 =?utf-8?B?UWxxK2pKRXNJMjdNNUFVRldhMjRSaUUwZzdZSjVDRy8wdlN1c3YwWEtRazJ2?=
 =?utf-8?B?Q0oyY2tMY3ZYTW1CK1N6c2VUaWovNE1NcTlER2ZOVXJuWTlyVzdhczc4TTA5?=
 =?utf-8?B?NExOSWkwSHMzbjFJNWZ1QlBxMGN5dkNreXA1U3N2eVc4V1RzYWRFYjdQMUh6?=
 =?utf-8?B?Ty9DWlBsL3k5NUE1MTIrVCsvZkZOUXNhN0R0MWxzVUsySjhRT0R2WkF0THpK?=
 =?utf-8?B?K1hpc0VVa08vdDdpK24xUmdaMCs4bGZOcG1XMXRpS082bXl4ZGRhMDF5dno1?=
 =?utf-8?B?OGlKMi9iOU5nNHNTMXZ0dStKYWNTYXFYY3hkeEQ2WnR3MitJV3ErYXhKS2Rw?=
 =?utf-8?B?WnR1RXVGdFVVVk1NNjVRQ1hHamJValBkNEVrdUJuV0FVeXRUYlhJM0l5eklS?=
 =?utf-8?Q?zOBrcy+7/Spdq7TZfIXfhSX0upuStvWZt8ehU1uf6UCw=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a4a3f6-2850-4eed-6ce7-08dc27132ec2
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 12:57:32.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_045746_358078_D9925124 
X-CRM114-Status: GOOD (  13.03  )
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

Ck9uIDIwMjQvMi82IDE6MjQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIEZyaSwgRmViIDAyLCAy
MDI0IGF0IDAyOjQyOjAyUE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4gRnJvbTogQ2hlbiBX
YW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Cj4+IEFkZCBiaW5kaW5ncyBmb3IgdGhl
IGdhdGUgY2xvY2tzIG9mIFJQIHN1YnN5c3RlbSBmb3IgU29waGdvIFNHMjA0Mi4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+IC0tLQo+
PiAgIC4uLi9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS55YW1sICB8IDM3ICsr
KysrKysrKysrKwo+PiAgIC4uLi9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0
ZS5oICB8IDU4ICsrKysrKysrKysrKysrKysrKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDk1IGlu
c2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItcnBnYXRlLnlhbWwKPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0
ZS5oCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svc29waGdvLHNnMjA0Mi1ycGdhdGUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS55YW1sCj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNjljZTNhNjRmNjZjCj4+IC0tLSAvZGV2
L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3Nv
cGhnbyxzZzIwNDItcnBnYXRlLnlhbWwKPj4gQEAgLTAsMCArMSwzNyBAQAo+PiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4y
Cj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvY2xvY2svc29w
aGdvLHNnMjA0Mi1ycGdhdGUueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogU29waGdvIFNHMjA0MiBH
YXRlIENsb2NrIEdlbmVyYXRvciBmb3IgUlAocmlzY3YgcHJvY2Vzc29ycykgc3Vic3lzdGVtCj4+
ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxv
b2suY29tPgo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGNv
bnN0OiBzb3BoZ28sc2cyMDQyLXJwZ2F0ZQo+PiArCj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVt
czogMQo+PiArCj4+ICsgICcjY2xvY2stY2VsbHMnOgo+PiArICAgIGNvbnN0OiAxCj4+ICsgICAg
ZGVzY3JpcHRpb246Cj4+ICsgICAgICBTZWUgPGR0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIw
NDItcnBnYXRlLmg+IGZvciB2YWxpZCBpbmRpY2VzLgo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAg
LSBjb21wYXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsgIC0gJyNjbG9jay1jZWxscycKPj4gKwo+PiAr
YWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwK
Pj4gKyAgICBjbG9jay1jb250cm9sbGVyQDEwMDAwMDAwIHsKPj4gKyAgICAgIGNvbXBhdGlibGUg
PSAic29waGdvLHNnMjA0Mi1ycGdhdGUiOwo+PiArICAgICAgcmVnID0gPDB4MTAwMDAwMDAgMHgx
MDAwMD47Cj4+ICsgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4gTm8gaW5wdXQgY2xvY2tzPwoK
SSB0aGluayBpdCBzaG91bGQgaGF2ZSBzb21lIGlucHV0LCBJIHdpbGwgYWRkIGl0LCB0aGFua3Mu
CgpCVFcswqAgY2FuIHdlIGlnbm9yZSB0aGlzIHByb3BlcnR5IGlmIGRyaXZlciBkb2Vzbid0IHVz
ZSBpdO+8nyBJbiBvdGhlciAKd29yZHMsIGRvIHdlIGhhdmUgdG8gYWRkIHRoaXMgY2xvY2tzIHBy
b3BlcnR5IGp1c3QgdG8gaW5kaWNhdGUgdGhhdCB0aGlzIApub2RlIHJlcXVpcmVzIHNvbWUgY2xv
Y2tzIGFzIGlucHV0IGZyb20gYSBoYXJkd2FyZSBwZXJzcGVjdGl2ZT8KCj4KPj4gKyAgICB9Owo+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJw
Z2F0ZS5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS5o
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uOGI0NTIyZDVm
NTU5Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9z
b3BoZ28sc2cyMDQyLXJwZ2F0ZS5oCj4+IEBAIC0wLDAgKzEsNTggQEAKPj4gKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSAqLwo+PiArLyoKPj4gKyAq
IENvcHlyaWdodCAoQykgMjAyMyBTb3BoZ28gVGVjaG5vbG9neSBJbmMuIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuCj4+ICsgKi8KPj4gKwo+PiArI2lmbmRlZiBfX0RUX0JJTkRJTkdTX1NPUEhHT19TRzIw
NDJfUlBHQVRFX0hfXwo+PiArI2RlZmluZSBfX0RUX0JJTkRJTkdTX1NPUEhHT19TRzIwNDJfUlBH
QVRFX0hfXwo+PiArCj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTAJCQkwCj4+ICsjZGVmaW5lIEdB
VEVfQ0xLX1JYVTEJCQkxCj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTIJCQkyCj4+ICsjZGVmaW5l
IEdBVEVfQ0xLX1JYVTMJCQkzCj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTQJCQk0Cj4+ICsjZGVm
aW5lIEdBVEVfQ0xLX1JYVTUJCQk1Cj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTYJCQk2Cj4+ICsj
ZGVmaW5lIEdBVEVfQ0xLX1JYVTcJCQk3Cj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTgJCQk4Cj4+
ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTkJCQk5Cj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTEwCQkJ
MTAKPj4gKyNkZWZpbmUgR0FURV9DTEtfUlhVMTEJCQkxMQo+PiArI2RlZmluZSBHQVRFX0NMS19S
WFUxMgkJCTEyCj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTEzCQkJMTMKPj4gKyNkZWZpbmUgR0FU
RV9DTEtfUlhVMTQJCQkxNAo+PiArI2RlZmluZSBHQVRFX0NMS19SWFUxNQkJCTE1Cj4+ICsjZGVm
aW5lIEdBVEVfQ0xLX1JYVTE2CQkJMTYKPj4gKyNkZWZpbmUgR0FURV9DTEtfUlhVMTcJCQkxNwo+
PiArI2RlZmluZSBHQVRFX0NMS19SWFUxOAkJCTE4Cj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTE5
CQkJMTkKPj4gKyNkZWZpbmUgR0FURV9DTEtfUlhVMjAJCQkyMAo+PiArI2RlZmluZSBHQVRFX0NM
S19SWFUyMQkJCTIxCj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTIyCQkJMjIKPj4gKyNkZWZpbmUg
R0FURV9DTEtfUlhVMjMJCQkyMwo+PiArI2RlZmluZSBHQVRFX0NMS19SWFUyNAkJCTI0Cj4+ICsj
ZGVmaW5lIEdBVEVfQ0xLX1JYVTI1CQkJMjUKPj4gKyNkZWZpbmUgR0FURV9DTEtfUlhVMjYJCQky
Ngo+PiArI2RlZmluZSBHQVRFX0NMS19SWFUyNwkJCTI3Cj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JY
VTI4CQkJMjgKPj4gKyNkZWZpbmUgR0FURV9DTEtfUlhVMjkJCQkyOQo+PiArI2RlZmluZSBHQVRF
X0NMS19SWFUzMAkJCTMwCj4+ICsjZGVmaW5lIEdBVEVfQ0xLX1JYVTMxCQkJMzEKPj4gKyNkZWZp
bmUgR0FURV9DTEtfTVAwCQkJMzIKPj4gKyNkZWZpbmUgR0FURV9DTEtfTVAxCQkJMzMKPj4gKyNk
ZWZpbmUgR0FURV9DTEtfTVAyCQkJMzQKPj4gKyNkZWZpbmUgR0FURV9DTEtfTVAzCQkJMzUKPj4g
KyNkZWZpbmUgR0FURV9DTEtfTVA0CQkJMzYKPj4gKyNkZWZpbmUgR0FURV9DTEtfTVA1CQkJMzcK
Pj4gKyNkZWZpbmUgR0FURV9DTEtfTVA2CQkJMzgKPj4gKyNkZWZpbmUgR0FURV9DTEtfTVA3CQkJ
MzkKPj4gKyNkZWZpbmUgR0FURV9DTEtfTVA4CQkJNDAKPj4gKyNkZWZpbmUgR0FURV9DTEtfTVA5
CQkJNDEKPj4gKyNkZWZpbmUgR0FURV9DTEtfTVAxMAkJCTQyCj4+ICsjZGVmaW5lIEdBVEVfQ0xL
X01QMTEJCQk0Mwo+PiArI2RlZmluZSBHQVRFX0NMS19NUDEyCQkJNDQKPj4gKyNkZWZpbmUgR0FU
RV9DTEtfTVAxMwkJCTQ1Cj4+ICsjZGVmaW5lIEdBVEVfQ0xLX01QMTQJCQk0Ngo+PiArI2RlZmlu
ZSBHQVRFX0NMS19NUDE1CQkJNDcKPj4gKwo+PiArI2VuZGlmIC8qIF9fRFRfQklORElOR1NfU09Q
SEdPX1NHMjA0Ml9SUEdBVEVfSF9fICovCj4+IC0tIAo+PiAyLjI1LjEKPj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
