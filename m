Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DB6C7115D
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDMEyhcQszHSfrYFDBBOxaIuB1q4tvRd44VakD+eWZc=; b=pIQPFxeqSnk3gYDoq1oqmoqd4l
	b19NGSwf/8Ky9Gk9S16R7H9hJW66HIQYsZzqEtFQjOZEn5vNRpZpIrk6z5jjpfuMxru5+jQXGStB8
	ma081PMEkUWQC3qQgEEK4aP6uBHcQziE+cJo15vQUU6yEAf0n69wFtxyVlPogZesLU8XAvXVhYBtD
	me7A7pEU+CHmJRDX6EqAekAIkuCeHaJdjpj3g2U5Kf9z7IIxX0CK8/7E2fdpawUPJqe1A7So6U+7c
	jr2z2oPDePeS4HIEPq3eX9owzvGy8QaB4/AyhfUnjQtWTIecF2G3RrXkvsrRKt/Z09WRqNmhb+1w5
	c/kDbMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPtv-00000006Mro-3koB;
	Tue, 17 Jun 2025 06:34:32 +0000
Received: from mail-southindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d408::1] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPkw-00000006LqH-0x2l
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 06:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZvbEiRKPKN77EiMMMgZFIgvOwHI+UBqRahjBHoCCLRvtfbr2RHjNckayvRcaYdEK+hJjGn8OwftAUPyI4tW9xSS4MEI1zefR8M76rE55G7VIYXWGRS+pX4kUpNj2IgMWhhGTibhyCQzxZHzvGq1XH18UKzXqaasIBRBJPyRN+DUkqQk5dNnqsnAQJiwiPLQndIrAbyoyVZAgjO1/e9gQnhSRliSwmeYJ+rjCyKMDf7Z8GDvWoNVwMaWg8zusbWVVkghB5jd4wefL+7LVhYbR1zGUcYmS9LT5B2op1i27WqzwjmWcmIjqriaXiu45ewDMsejiZJ5u31vSp0oNnoN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jiiy4Y/qnI3fU5m9D6WhYwsZpdHZHadjJZLlsnqFk8o=;
 b=EPmuM+X9z5FAIQFlgoumrW1bWDczHjtquBNqNn3AUwrzw4hWUOGEQl0BcqRwrgdLV/bApx5QDSjuZV1k4dKjRC+tDAvQ1iinCay99X4pNQ/0ctOKx1oYCf82I0gX3Vm7+qh2PIIM1Dq3vP5yC4cf/Jw0dE71KnfUp7qN1wDj5e7mcNayXGOhIft0qAHj7ZJyarHeoMMlklSxw3ZiIcm72zvvKRcGOROCxgcv36Gx9tvLvQ4zfj/GhRMhFoYv4bfoTZFicty2lYZvHq91sUHu0biJqX4+geYVKmqbXq5bsnNNoT5vqziB72/P9rP6kEiZPCrn7OmFGbx+BdspydcmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jiiy4Y/qnI3fU5m9D6WhYwsZpdHZHadjJZLlsnqFk8o=;
 b=sXILu/4/V69m9t1JfEDe6FZ+gAao31kRlZlR3r6QWW/gUIAH8DgTy9Z3OgAugfVNdLNgKkRWzpp+v/3Rc7k2OJDLYyORhsNqw9rYEVQVHBK+V1QdMST1h8tRN7nJfrI9ycdvU5+5bIZv9y4TN87iTJabRIJFUwM/K2odpA/u5cNLTQIxMxonClBkhLCzXH5eRp3zgnnOfBwDkJUJrmZRPIgUrXbdkh3LPNXy+1xvJp5o7dHQQHOUWptWLOqPQGPu0nuQXqBtbkPX5aTHL2ORyuXQa2unGdjdiAiDj2UWA+NYftgza4kFa6kxXc0whDgMawzq8KYKb4KUjNNoNtLO2w==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN1P287MB3744.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:251::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 06:24:56 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:24:55 +0000
Message-ID: <MA0P287MB2262A3379FE97E90DE0CBAF4FE73A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 17 Jun 2025 14:24:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] reset: canaan: add Kendryte K230 reset support
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID: <6fe1575b-eeff-49b5-b8f4-a0b6c919827f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN1P287MB3744:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f9d6b2-6b4a-44db-6ff8-08ddad67ab71
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|8022599003|21061999006|19110799006|8060799009|7092599006|15080799009|5072599009|461199028|6090799003|440099028|3412199025|4302099013|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGVBNldWOGE1bFpTQmpsYkRNNHdtM3VQL29NMzM4NE1VZVZqRTg1N2ZCQTVa?=
 =?utf-8?B?Q3Z3MDEvTnJEZkkrc2k0YmpOTFRqTGRSc0tFWnZnellOZEtHN3RKcVc5UGcz?=
 =?utf-8?B?RGVoa2VWV0NwQ3NUNkl6My92N1cwUlVLQUJSVHpqUFJlcURTNlMyWnNtL0xs?=
 =?utf-8?B?dkNNZzVjZ0o1THRBUlBPYTFhTm5WVm9wU25iSUVxUWdoRXZtQjNHaG5NMGpy?=
 =?utf-8?B?bGtvV0hWdXl2ZGo2OTJCT1g1MmFnWnhybUtrWTRIeTZubzhQRmJHSGxXVzhK?=
 =?utf-8?B?MGt3cGNRUUtGTHhxNWlUbVRVbWs2RXZxeWk0Rzl5OExVdng2MU1vMzdLSVFv?=
 =?utf-8?B?OWdjZVBGckJIR1pKZTViYU84YjMwY0QzVDFRRXRUdmdqRHdhUFVIRXgvc2FY?=
 =?utf-8?B?TGRRQ2NFdHVEaVNzblFwaUl5TUdHcldYUFh6T25ETzVjUHRRS0hHR1BETW5I?=
 =?utf-8?B?eDR1WURUZXBBRlRoSmtmYXZnc3JGeXpnTVdselZCcytPZHVpMldlbHRNWEEr?=
 =?utf-8?B?WWt5YlJXZlpZZVVXRVpVU2VBZm4xQmdybE1ZYVpBVThYcWhnL2FpL09CNThP?=
 =?utf-8?B?dGorOUoyZ3FsS0JkNk4wZzdUZzRSNEk2b2pWRGxHT3RlNUkwWEhFc0V1bmtM?=
 =?utf-8?B?SWhhMlRWM1l4bitIUDk4enlXM0cxZHBWYmxEUFk2MnFEZXg0ZkxjVHlsOGlx?=
 =?utf-8?B?ZFd3QUtZZDQ2SlVwaWUySi9NUmkzUTJWTkh4cUVzbVVra3BOT2lDUjBkOXB3?=
 =?utf-8?B?S2dFclJTWWJWUzJQUlBpL2VIOW9NTFVmUEFkNnBrZHZnYUtuNUVtV1JwUFZm?=
 =?utf-8?B?U2xVbC9Xc05JMHBCdHpwanlJSmZSbzFZdlFsR21KbUJiUWJrdVRub1h1UFVE?=
 =?utf-8?B?cU9nVmIyU3hyM2pPOGFWZFptRzNZQkVZa3BXTkExQ2hCZWJBYTFYWUcyeHlz?=
 =?utf-8?B?ZUpwNHhjdXllREpvZ2gvQTFTVnBnWmVYZEZlSVQ4RGhscFV6WHNZbkpWSDB5?=
 =?utf-8?B?bG9yZlVycTZTVmlSVCtvVmgvTWVWc2YrRFR0VWg2R2VzR1B4Qzlzc1hTbVU1?=
 =?utf-8?B?eHB6aDZDa3hyaEttRTlEaEJrUFQ2cGdENllWWHNydEVRaXZpOFNXQTMzZ0xR?=
 =?utf-8?B?MWV3cVhGMTlrT1dBSStUcjQ5cHBCQTdvcXhxWjJhK1NtSW1VSW9UcFlaM3hC?=
 =?utf-8?B?aVorMCtJN2d5RVZFQi9tRjdsajN1OUMwTUt6V1luVmFTSUErYWE5YmszUm9q?=
 =?utf-8?B?b1pjWEFaODVJbnFyc0l5ZU93Njk5ZmxLL25JWi91bVU4SThnbFp6MHJGZEZY?=
 =?utf-8?B?WUhoeEJTOHN6MFlXZ3BUL1lXNXBlcENPcU9tNXF4ZE8zaDYyLy9NcmczaUg1?=
 =?utf-8?B?MHFWWHAzVnUxemFqSXphRERkeWpYNzg5c2QyUDc0NjVmK0w2QWtjd0pYUXpS?=
 =?utf-8?B?OVBjQ3Y2WDlnai9Ba1NXWlFRKzFyVUM0L1FZOVIzUGdlbGRneStXL3ZEMzN1?=
 =?utf-8?B?WEpjM2lDaXJCcHRWMGFsNUs0N2JlL1M4cnRXdkFCTTh4dDFlNzgxLzZnRVpY?=
 =?utf-8?B?bW1NMmhCR2ZMUCtQY0FBeC95T1IyT0hVMWtTMFBnK0FPcTYvQ1JZQnlhK3ds?=
 =?utf-8?B?ek9jeEk3bTd3U0pSSWRTcy9NRVBHR3hNeU1jMlVCalc0MTVYbTJtSTd3VjhL?=
 =?utf-8?B?S1pPZmpZUkZjZXNENUVsZWFnT3FNakpUM0NOKzlnR0EwMzFnT0t3a00xMXoz?=
 =?utf-8?B?bm5qaS94MTVDU3ZpQmREWE0rY0JnVjlycmhqWUJMa2xXSXZyTThlUGplMTAv?=
 =?utf-8?Q?ayYCiRA/59vrAa1vzf/lQ8RJJ3zEccJWiKfkc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxvcTdUMDF2Wk92bmpWT0ZTckE4Z3grUnZsdGoxRHdtRjNYSzJSOCtDUzhx?=
 =?utf-8?B?UDgxWi83eS93Wk95MFozL2VpZnA4aUJwRldLUUlSbTBTOC9WcUpCRFhrZXUw?=
 =?utf-8?B?aWNKelBmSlllMHlZd2hQZURGS2VWdGxrQnZFN3p3R01mZmhjRVI4YWkvTFBY?=
 =?utf-8?B?SllsQkxyZnU2NG1QWG4yb0hIWlgxTk5WNnQ4RENhazdwOVVzWVFtYy9JUVdr?=
 =?utf-8?B?aWovYkFFTVhDSWpNTGJxTlVkOExmbW1UbnZVSDB3RWZoaUkwU29nVUJqVE9i?=
 =?utf-8?B?VlFvanI1SDFmU3pHdC9aeXdIUHpVeVR3UUQ2MWQxY2RaTlRBdGtyTUJFNVdl?=
 =?utf-8?B?a3ZDZUpkWklRYm56Q3ZlenV2QWJ0YWJ5RmNodXFJWFRJcDdCMDh5cWxQZnlK?=
 =?utf-8?B?YnJHdjM1SU5oUHNkbDJjZCtUNnd0Zzg3WllWbkExcnluVTJVZkdaNStYclNS?=
 =?utf-8?B?UGVBb1krcXZGUDFQK214dkNDWGFqbGY0VC9sNi9kQWhyekZaRlNmeTZFeUJO?=
 =?utf-8?B?cGZBcU9sYmpmbm9rNjluOENkZ2RFbnVHb2xnUFRqSkNBay9LNThydmtxbGhN?=
 =?utf-8?B?QlpHdUNsUElOMnBOci95MXlnR01FV05oeDMvZlliWXNCVlJCNHdlUzkwaW1z?=
 =?utf-8?B?aERqZ1FYbGVvbVBRMlBVR0VEbFR0c3J3RXFsVWd2NjVYNjQ4Q3ltYkpCSldo?=
 =?utf-8?B?SW5GaHpPNy9TUTEzMjRxQ3o5WnNJQzBNU213M3dNcmpTWEdNK1Nlb0dRVTU5?=
 =?utf-8?B?TTBsZVE0N093aEdUQUtxdlVPUERSZ21MUVpMZUVCTUZLTjg3RGV0djNlZnRM?=
 =?utf-8?B?MVZFNGZ4UjBidVZzWmJMS2ZRQnJGWnBPZkNod21KaFRxTnlSYmlSdnUwTTBr?=
 =?utf-8?B?MzRrS1ErSU9XV2VLSVYxN09SMXpRM0hBUXNZY1NCRHFGcytzTjZab3p5QkZR?=
 =?utf-8?B?NlZNLytRUVNWeElHRmdWK1UrWUVNbDlzQ1o4YWd4ZlZoazBWMWRvMFlPN1dJ?=
 =?utf-8?B?RXgrdUtmKzhNUUpPTVV6ZUJTZkh6cU0xeUVXbUovbFdUWk5uNTVFVDQvL2xB?=
 =?utf-8?B?dVg1Z0pGYW1OWmQydW1qcmFQYk1KTEUwQnZyZDlwVEp5aDk2diszVngyYXhs?=
 =?utf-8?B?U0Fvemtsd0xPS3diajJjeWM4VTRreHI5aEVRaGZETnI0TFVtY09PQ3R2Y1kr?=
 =?utf-8?B?Q0ttQUtOcVFFYTJHbGxEaEloN0VBZFM4VDVsN0k3MHM3ZGltc09adjloWHFW?=
 =?utf-8?B?Qm5DSUpFbVJ1MmMxMkRIS1lkbDVHa0Y1a2piOFh0NG1NWGc1YUQ0bFIwYjB4?=
 =?utf-8?B?ZzBYOFprcVJoV2dQK0RuUi9Eb2ZyNVdhSGRUOEtCZUVMOSsrTjRDdzBuT0h0?=
 =?utf-8?B?ak1iYjYvWHZEVVQ4S2R2WkRZTGQ1UnZndVNOcDgzRFNvOFFWRmliY0Y4ZUJw?=
 =?utf-8?B?L00zSlpVYlo1eFE3bFUvVHVMQ2FBVXUxVjE2YVR6RHNtZGFWQkVHNFYzcFA4?=
 =?utf-8?B?aVlWWittVHJyajl4OHRoMnlobW4za0dsaDVZa3FEZXBlYVVDNjVjK0hZU01u?=
 =?utf-8?B?cXNhL3lac0lFOWhoOC9CVkpFcWhwd0lEYldscVZwUmxNcDhEWEpJTEV2eXNL?=
 =?utf-8?B?cm9HZHc1dE5OVWdxMVpDQlQ0T1JOZ3dMTDRvOTJ6RXNGMEhqM3dQTjBjTjNS?=
 =?utf-8?B?R0JDc0k2cndsc3QzeWV6Vm8vNkdnQ3NCNm1yUXVEdEJQTmpMMHZOcUlBR0VI?=
 =?utf-8?Q?KejQ+7qg3WQS3Jk7RfZ9xacPx4xXY51JLXbnoiK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f9d6b2-6b4a-44db-6ff8-08ddad67ab71
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 06:24:55.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_232514_275474_5029C213 
X-CRM114-Status: GOOD (  14.65  )
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

SGnvvIwgUGhpbGlwcO+8jAoKV2lsbCB5b3UgcGljayB0aGlzIGZvciBuZXh0KHY2LjE3KSwgSSBz
ZWUgeW91IGhhdmUgcmV2aWV3ZWQgaXQuCgpUaGFua3MsCgpDaGVuCgpPbiAyMDI1LzYvMTMgMTY6
NDksIEp1bmh1aSBMaXUgd3JvdGU6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIHJlc2V0IGNvbnRy
b2xsZXIgc3VwcG9ydCBmb3IgdGhlIENhbmFhbiBLZW5kcnl0ZQo+IEsyMzAgU29DLgo+Cj4gVGVz
dGVkIG9uIENhbk1WLUsyMzAtVjEuMSBib2FyZC4gU29tZSBvZiB0aGUgSFdfRE9ORSBhbmQgU1df
RE9ORSByZXNldAo+IHR5cGUgd2FzIHRlc3RlZCBieSByZXNldGluZyB0aGUgc3VibW9kdWxlIGFu
ZCBjaGVja2luZyB0aGUgcmVzZXQKPiByZWdpc3RlciB2YWx1ZVsxXS4gVGhlIENQVSByZXNldCB0
eXBlIHdhcyB0ZXN0ZWQgYnkgYSB0ZW1wb3JhcnkgcnByb2MKPiBkcml2ZXJbMl1bM10uCj4KPiBs
aW5rOiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9waWdtb3JhbC9jYzQ1ZGU2NzM3NzU1NzU3NTBh
YzdmZTQ5ZDQ0NTZhMiBbMV0KPiBsaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcGlnbW9yYWwvbGlu
dXgvdHJlZS9rMjMwL3Jwcm9jLWNwdTAgWzJdCj4gbGluazogaHR0cHM6Ly9naXRodWIuY29tL3Bp
Z21vcmFsL2xpbnV4L3RyZWUvazIzMC9ycHJvYy1jcHUxIFszXQo+Cj4gLS0tCj4gQ2hhbmdlcyBp
biB2NDoKPiAtIFJlYmFzZSB0byB2Ni4xNi1yYzEgYW5kIHRlc3Qgb24gQ2FuTVYtSzIzMC1WMS4x
IGJvYXJkCj4gLSBDb2xsZWN0IGFuZCB1cGRhdGUgdGFncwo+IC0gTGluayB0byB2MzogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUwNy1rMjMwLXJlc2V0LXYzLTAtYzg1MjQwNzgyZWE1
QHBpZ21vcmFsLnRlY2gKPgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBVcGRhdGUgY29weXJpZ2h0L2xp
Y2Vuc2UgaW4gZHJpdmVyIGFuZCBiaW5kaW5ncyBoZWFkZXJzCj4gLSBSZW5hbWUgSFMvTFMgdG8g
SElTWVMvTE9TWVMgaW4gRFQgYmluZGluZ3MKPiAtIEFkZCByZXNldC10aW1pbmcgbm90ZXMgYXQg
dGhlIHRvcCBvZiByZXNldC1rMjMwLmMKPiAtIFJlcGxhY2UgbG9uZyB1ZGVsYXkoMjAwKSB0byBm
c2xlZXAoMjAwKSBmb3IgSFdfRE9ORSBwYXRocwo+IC0gUmVtb3ZlIHJzdGMtPmRldiwgc3RvcmUg
ZGV2aWNlIGluIHJzdGMtPnJjZGV2LmRldgo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI1MDQyMC1rMjMwLXJlc2V0LXYyLTAtZjFiNGEwMTZlNDM4QHBpZ21vcmFs
LnRlY2gKPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBUdXJuIHRvX2syMzBfcnN0IGZyb20gbWFjcm8g
dG8gaW5saW5lIGZ1bmN0aW9uCj4gLSBVc2UgZ3VhcmQgdG8gcmVwbGFjZSBzcGluX2xvY2tfaXJx
c2F2ZSBhbmQgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZQo+IC0gUmVtb3ZlIGFzc2VydCBhbmQgZGVh
c3NlcnQgb3BlcmF0aW9ucyBmb3Igc2VsZi1jbGVhcmluZyByZXNldCB0eXBlcywKPiAgICBvbmx5
IHJlc2VydmUgdGhlIHJlc2V0IG9wZXJhdGlvbgo+IC0gQWRkIGRlbGF5IHRvIGFjY29tbW9kYXRl
IHRoZSByZXNldCB0aW1lCj4gLSBSZW1vdmUgYmxhbmsgbGluZSBpbnNpZGUgcmVhZC1tb2RpZnkt
d3JpdGUgb3BlcmF0aW9ucwo+IC0gUmVtb3ZlIHJlZHVuZGFudCBkZWZhdWx0IGNhc2UgaW4gZW51
bSBzd2l0Y2gKPiAtIFVwZGF0ZSBjb3B5cmlnaHQgZGF0ZXMgYW5kIG15IGVtYWlsIGFkZHJlc3MK
PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA5MjQtazIzMC1y
ZXNldC12MS0wLWQwY2RjMTE5ODllYkBvdXRsb29rLmNvbQo+Cj4gLS0tCj4gSnVuaHVpIExpdSAo
Mik6Cj4gICAgICAgIGR0LWJpbmRpbmdzOiByZXNldDogYWRkIHN1cHBvcnQgZm9yIGNhbmFhbixr
MjMwLXJzdAo+ICAgICAgICByZXNldDogY2FuYWFuOiBhZGQgcmVzZXQgZHJpdmVyIGZvciBLZW5k
cnl0ZSBLMjMwCj4KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2NhbmFhbixrMjMw
LXJzdC55YW1sIHwgIDM5ICsrKwo+ICAgZHJpdmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDkgKwo+ICAgZHJpdmVycy9yZXNldC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICAgZHJpdmVycy9yZXNldC9yZXNldC1r
MjMwLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAzNzEgKysrKysrKysrKysrKysrKysrKysr
Cj4gICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2NhbmFhbixrMjMwLXJzdC5oICAgICAgICB8
ICA5MCArKysrKwo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA1MTAgaW5zZXJ0aW9ucygrKQo+IC0tLQo+
IGJhc2UtY29tbWl0OiAxOTI3MmIzN2FhNGY4M2NhNTJiZGY5YzE2ZDVkODFiZGQxMzU0NDk0Cj4g
Y2hhbmdlLWlkOiAyMDI1MDQwNC1rMjMwLXJlc2V0LTMyOTg3YzZmMGVkNQo+Cj4gQmVzdCByZWdh
cmRzLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
