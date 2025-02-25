Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAD0C021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 00:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLB3UbMKjC3LEbIteRrm1zZX7a4Yc654Wfml87cu+UY=; b=v6vmRGwjLavT6GCCZKHwBMPNgh
	ZAQzTsOBwiyFqLEXeQDs+PLxJrPnwhw+qVL7FGRKo2Zm8ilQERg+O3uT4bfNdR8pzRaJNRqbD3YOZ
	8d1pXvFcz3aalNPEk68KiTnDccXLdwKtYtrjCtf7KU+TDrMoWwJlu6lXBavKhMAPxT45XeXYcXpkO
	Yuu6trpxEZm5rQ1LuVvOvErXVsvmw0umjYqFLOElezhi6spAIrJXNxFMkkrnSGKEPFVRd75R3vM6R
	GfxZxY39jkWkIBsfsMk4VRTWfv3lvxSoHWrsB9rvG/iDLN+PBXXHmdZZXpDku6UWnQsq0hqt7Ps0n
	q6hF/Esg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmijr-0000000Fc8y-0XIQ;
	Tue, 25 Feb 2025 00:23:55 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmijp-0000000Fc8T-1uua
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 00:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXrtreHhKJNvwfWSr7wYf21ytIYSWY73fE0ANIsCCGw7OMeaxQNW2uaWnhG4DpwjR2jOxlCj9yXCCw95wSYvtp6mJBiFXamR3NdJ+9dJ0jX+3RUgM+F0wBIWobnIMOjYyElaxhchXP/CX9yq6Jq8aHyurkPHnUOJ6M/m42GXcnTKCeYKWBcCNinlnB9K8Hav9VjZa3uxUc8V8fmdB2Tdole/wHEXGj6MK9c7GZ8kfDd93ZAQOOeeYQO6Lvin1IO13p8kZYikYxl5cXbEStCN1yqUkPza9KG3tNldb+xQseTimOsSSSsp/l9KIGvVieqWyfRx2PqtmD0xiHARiMoeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGNmRurzYFn8Il0+W0XXcmqN/Y/zGMLXPFZ8z6fCkU0=;
 b=p5YKpbWzbWIINh3ibMKitpBi5b9UEzwYDcIt5zI64mYTmtMSgVZWdO1++rav/km+rgoDqvbGD5TAsvo/rEOpJ2RxAjD9s21Kf7J2crl7pwD57aqq1YJfYnoCCuIq2cS73VV5s7uMXqEFv4lC2+rPkyWLwwQdqT3w4rFwTMe/n4+O/cCIwHLSquzqjI1VrlmmNTD/Sh/8ayJvrMU7PCaLnW1S4M6AkoyVI47il8dk+x/2ATAqgaF8VmiCIF0/EhY04dt62DZ00ToaLRMlIdUStICMKF2YYMV3JdrhKxhz317/ydM3YYl1dg+3A3szATyD5E5BqjtDkaOAerayLNH8YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGNmRurzYFn8Il0+W0XXcmqN/Y/zGMLXPFZ8z6fCkU0=;
 b=aVC59k+lcO2jKnGu51A19ZV6GJZNgeIqROZcE3+qYCHRT4AbyIvsx+XkLxtU5bfx6FIC53tRlXATCQh2wpq3dxRadWbyVwEmnPe9TnNQ0XIWE5KdMIMW1pgbWVRTMLFsmDNXEg28t6y/8stxkPdpv4xrOXhLsPO7jrTtZ/F7NcW+YUj5BDapz/nAbBiHL0Ow/hwuMstEag7dkEQcqFr/44Z7k7Vmvegp5N3rMSwkH75RhQXHu36kCVqAIgYfan/BDLECs7zcCMaT+g4nCRcvG4ArHBAHsAh2Hu2DgEVfilW06wayjOp4NWSouPjx8n2gaPMzNdureETavK7Esp5vog==
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:165::9)
 by MA0PR01MB5725.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Tue, 25 Feb
 2025 00:23:40 +0000
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e]) by PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 00:23:40 +0000
Message-ID: <PN0PR01MB91662EB902D8B337A0526458FEC32@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 25 Feb 2025 08:23:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: add Sophgo SPI NOR controller
 driver
To: Longbin Li <looong.bin@gmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250224101213.26003-1-looong.bin@gmail.com>
 <20250224101213.26003-4-looong.bin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250224101213.26003-4-looong.bin@gmail.com>
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:165::9)
X-Microsoft-Original-Message-ID: <9bfe0d73-ff52-4333-b9cc-3f6d61923f67@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9166:EE_|MA0PR01MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 01df010d-7ee3-4f48-4a63-08dd5532a7a0
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|7092599003|461199028|5072599009|8060799006|6090799003|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXdNZDMxeURIMGJwKzc1WW5xOEpnVHc2N1BTb21ta3dlN013MUg0NnJUMG1K?=
 =?utf-8?B?QnkyK0Y0SktGMmYzdTNzM1JWMjRIVkFJUFlvRUx6WlFTYmZseWtPNkJTK3E1?=
 =?utf-8?B?UWYwM3J6Smo5WStNSys4b3FCVjNqd2prbGlaUWJYc1kyd3VnajhHS2VGbjVp?=
 =?utf-8?B?SlpUQUZMRW83VC9wKzBYV1FFTjZWSVJSMWNKamJGZk1sSUpERms5Zlk1WmFS?=
 =?utf-8?B?V0Zhd2hMSGlPcytCS2V0ckxvVXMzeExHMndZWnJrRFpMeWhUcFArTFRGc1g3?=
 =?utf-8?B?TUIzKzRIbXZEaFdScld5TWVJUGgrWExLcHkxYnRNNytqNklUanR5enFFTElH?=
 =?utf-8?B?aTN3aVUxS3p5MUxXVlcxUVQzdENubFQ5enR6UmNUOGkyMHBydHB2Wi9uOHNa?=
 =?utf-8?B?T0xVRnBsNjV2NXRmbjdqQlQxNjdDbDJsajBhVklnSFZGUGhpYXAxOXhrZ2U2?=
 =?utf-8?B?NGdxV3ZMbzhQYmhnTitBT28rQUlMTXgyNmdsSEJpeWdYVXgrMVJwQm83eWU4?=
 =?utf-8?B?UExtTjQzS3RQQnNkYklUK05zekVNVzZQeVUremlWbWJtSm4zWmFYaWpnWFJt?=
 =?utf-8?B?L09QZ3ZaM3ZTR2VBSmVvS0Q1MFo3b3h0cVFKYVZTb1B6aG94Mk1ONDFTazZ4?=
 =?utf-8?B?azcwc0VERWtTaFgrdkIyaGJMNm1YeU1VWlllb2kwbUUvSThHNUZvbUZScmRC?=
 =?utf-8?B?MFIxT1FheXhNYWVzRmlONzBKSTY4WDhCV042dkticFJhRlVEcFpqOHViOVRx?=
 =?utf-8?B?VzYvYitPUnNDQlFrVVZqcXFIWWsxY2MrRlhpRmYvajYyVjhkWk82R0RjUXRG?=
 =?utf-8?B?VldQdTQ4ODJneVQwZzI4VENkb2lYZ0lLQVZyTERWSnlWUW5zaU9tME14M0xi?=
 =?utf-8?B?NnNPSEFiaCt1OWhpNjB1eUU5a2o1UlJPZkpIUWhhZWo1VXJVcnpHVVhrbzBa?=
 =?utf-8?B?YlAvN3d0V1NvTGg0ZG9sN1FVcEhxMEZHYkh6WS9ZVlUwaGxwc0ZrN0E4aTB6?=
 =?utf-8?B?eGpVZ1o3ZDhpb21NbnRyaFRIS25HdkNpdEpmQmR2VHZ0N2wzckgvbks5bEpi?=
 =?utf-8?B?aFREeDlqVHVhYldia0JnSkVha25QRDd0TlluNzU4WTFROTF6UklFSjZGR3VN?=
 =?utf-8?B?VzFWM3JSTkxJZjY1c0dVdXkwS0pZRCtCQlBwWlFnUjB5MVUxOU9hS050Y29w?=
 =?utf-8?B?b3NpbEZzLytGUzZIZldhUzIwbjlhL20vdVYwYVJ1TG42dDAzOG52SEU3K1R5?=
 =?utf-8?B?NTB0RVQvKzVpd3I5ME9HWkpGQW15UHh3ODQxRC9OWXRSamNXK3V5UE45akV1?=
 =?utf-8?B?VzE5eG1aMnJRdTZjajM0OWYwMGIrU1NVY1lhelZMNUpEcys4OUE3aUJwNWdn?=
 =?utf-8?B?NGJ4WWxMNGRlc05qMTFUb001L1RwUGRQR3pDWWhxVnAyemN4T20rRGZPSEw4?=
 =?utf-8?B?eHBwS1NRcEdVb1lxbE13YjZ5QTRDeU1DMUNwZkNOQWVhbmtUK0pSdHRvWkFJ?=
 =?utf-8?Q?37bOso=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzVyR2F5cytBUzJvMVc4RC9oaHp5cUNIVUNhakw5NHUvM2xxRkI0OVkzMHhE?=
 =?utf-8?B?NFJ2ZVNMRkZDYnhhWnV5cW42WXZtaHRRSHVoZFlFNjArS0JFb1hEdnhsZDVO?=
 =?utf-8?B?NlRMVHFvbWc3SjFRYU5iNjNveEM0ai9UdVZ5SDNMNEJHSUtLUU45TkdnVUZG?=
 =?utf-8?B?VEV0NDdUOEswc0x5WXZqVXEydi9ZVFZqYTVzVHVnMzZLTUJjRFZKeVd1akhL?=
 =?utf-8?B?T0FuOFFhQWEyZnZUOEtBakZYOEoxU1JWUVFabkkrU3hpckR4djFCZythc2c2?=
 =?utf-8?B?TVNzcW1wNTlmaXRxVmNyMmw2N1RaMHVicWdEQVZmY2JDNzQ3VE1XTkRWUXB2?=
 =?utf-8?B?R3FPdDVlN0UxdHpTckZMZzdTMndYN2Rtb1ZzakZncGxVTmVCUEdDRis0YTFJ?=
 =?utf-8?B?QTlyNHgwcmYzd0dHcjRQWkFVdWlydW9ucjhENklSYk12VHh1TXpVWFJwdDE1?=
 =?utf-8?B?ZHQ3dWFtVkhDRFFVaHhLbTJ6amJ1VVJKR0Nna3g3Qjh4WnFCdFhaOFR4Nzcr?=
 =?utf-8?B?S2NoKzE3bzNPNkR5a2hwZElVMnkyVGtzNU14THRPeHNzK3dIN21Hb0ROQklV?=
 =?utf-8?B?UDhzajQ5V1FydjlLbzIvK0RBRTl2c29sUkI0ZEZTTktSQXpPcGVTRXcxaXVr?=
 =?utf-8?B?bjdwdGRnUnFmSmtXaTBwWCtMU1NtemdSd0hPdGhRaTAzVjJ1SXBReGUwMXVF?=
 =?utf-8?B?UnM5eUlDa1V1ekdsTDJEbjB1Y1FXMENESmZORVludFd6d2ZvbWU3cERYb1BC?=
 =?utf-8?B?ODlhcm91OTc0bllVNXZWMmNMRlRFZDQyYXc5NVRzVGhsdjFwdExwaUZCVG9L?=
 =?utf-8?B?d1dhMGt0NjBlS21hZlZmVzNRZC81Rk9pWmVyTlN6cFUyWERqVGt6VGtiQUZY?=
 =?utf-8?B?dnBuNHVJRFJmcTdkSUpBWURVUmZ5bkxxZTR4dlJWdGExQ3lIY0xtekdjT3NV?=
 =?utf-8?B?cE9wWlUvMFVZd0RMR0xkZXpaM1hsVDhRdks4N0RiZVVJeVdEc1JPUWMwdTdD?=
 =?utf-8?B?M094RlFMczBBby80N0dRMEpvdE9ISTJ5Z2ZOcVhhdmluYWdNVVJoOVROejdR?=
 =?utf-8?B?L2ltQmRvelBnNnhsRVRHQUs3YmpDRlFCaE5MWitNZlJOeWVkWUpTSmZudTU0?=
 =?utf-8?B?a1I0aGFmWURVak9KdVN5YUdleEJzWU5UR0t1TjdFd0tPVitMMENYVFUwdU5p?=
 =?utf-8?B?dEFnZmI0QXFMZUkyb1dSTFRVQ2VlcEhrZkdPR3dQdXYxZ2xuT1FOaC9nRnIr?=
 =?utf-8?B?dTFoVkQ4eGlWUHZ0dWpMREFNcm9VdkcxSUQ1RG02cjlPVjdaL2dJYjJxamx0?=
 =?utf-8?B?NTRVUGtRb1Y1bG90ZGJTT0Z4UjJDN296ai9ZcTY5Mm9vTHhGVEI1OWpWMkJm?=
 =?utf-8?B?Z0xJWmo5YmJLY0xmK1NuYWVJamFnOFYyOTlFZld3SUh6Wk0wUUhJNXJoWGFZ?=
 =?utf-8?B?cEw5Vis5cFg0ak1UcnBMMXMvaC9MREJRaVJIeHptUGF4TVZmZzc3K0tBVkJL?=
 =?utf-8?B?bFhTenQ3ayt2SW45WXpZcnFac1IxOWtRU2dWbkp4ZnpBZ0hDcUZpaTdrNTgv?=
 =?utf-8?B?YWZDMFdweW9tKzVjVXVYTlRaRnlOR1pNcG0vdUpwdkNnVm13bVRJcE9RVElo?=
 =?utf-8?B?MVVjK1lpaVFsNjEyUmc4aWdiSDY3SkZobDhER25hNHl2TlZncngrTXMwbmFp?=
 =?utf-8?B?NUhZamQydTlBSHY3Y2VOM3pHSVplenFnSTRiUDE5Q0pzMHpQanpGc29nNndu?=
 =?utf-8?Q?6x8vJ/bETqBS8eAufXcJmMALCdkvGNO/RrqfR9o?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01df010d-7ee3-4f48-4a63-08dd5532a7a0
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 00:23:40.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_162353_507406_972F9C75 
X-CRM114-Status: GOOD (  11.79  )
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

Ck9uIDIwMjUvMi8yNCAxODoxMiwgTG9uZ2JpbiBMaSB3cm90ZToKPiBBZGQgU1BJIE5PUiBkZXZp
Y2Ugbm9kZSBmb3IgU29waGdvLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9uZ2JpbiBMaSA8bG9vb25n
LmJpbkBnbWFpbC5jb20+Cj4gLS0tCj4gICAuLi4vYm9vdC9kdHMvc29waGdvL3NnMjA0NC1zb3Bo
Z28tc2QzLTEwLmR0cyAgfCAxOCArKysrKysrKysrKysrKwo+ICAgYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vc2cyMDQ0LmR0c2kgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKwo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQ0LXNvcGhnby1zZDMtMTAuZHRzIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vc2cyMDQ0LXNvcGhnby1zZDMtMTAuZHRzCj4gaW5kZXggYzUwZTYx
YTUwMDEzLi45YzYzNDkyMGYzN2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
b3BoZ28vc2cyMDQ0LXNvcGhnby1zZDMtMTAuZHRzCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vc2cyMDQ0LXNvcGhnby1zZDMtMTAuZHRzCj4gQEAgLTgwLDYgKzgwLDI0IEBAICZz
ZCB7Cj4gICAJc3RhdHVzID0gIm9rYXkiOwo+ICAgfTsKPgo+ICsmc3BpZm1jMCB7Cj4gKwlzdGF0
dXMgPSAib2theSI7Cj4gKwo+ICsJZmxhc2hAMCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJqZWRlYyxz
cGktbm9yIjsKPiArCQlyZWcgPSA8MD47Cj4gKwl9Owo+ICt9Owo+ICsKPiArJnNwaWZtYzEgewo+
ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsKPiArCWZsYXNoQDAgewo+ICsJCWNvbXBhdGlibGUgPSAi
amVkZWMsc3BpLW5vciI7Cj4gKwkJcmVnID0gPDA+Owo+ICsJfTsKPiArfTsKPiArCj4gICAmdWFy
dDEgewo+ICAgCXN0YXR1cyA9ICJva2F5IjsKPiAgIH07CgpXaGF0IGlzIHlvdXIgYmFzZWxpbmU/
IEkgY2FuJ3Qgc2VlICJzZzIwNDQtc29waGdvLXNkMy0xMC5kdHMgIiBvbiB0aGUgCmxhdGVzdCBt
YWlubGluZSB5ZXQuCgpCVFcswqAgdGhlIG5hbWUgInNnMjA0NC1zb3BoZ28tc2QzLTEwIiBzZWVt
cyBhIGJpdCByZWR1bmRhbnQuIFdvdWxkbid0IAoic2cyMDQ0LXNkMy0xMCIgYmUgYmV0dGVyPwoK
Wy4uLi4uLl0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
