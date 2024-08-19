Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1717CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 23:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycCdPzc60joDn7kSnaHOW8oD20GUphruNNInuV+Jk0k=; b=BhdnOKUlsKKUg8DGK4xUn2Ts4Q
	z6Dsibo2uvnTyd6Cip657wvXZOc/VKFpj8Xj4hwPFtzQ/Pw0RsA+azOFUbaCBt9IGULr5fmJPdidr
	rp4sQcsn2/OZjOufAfkYCtTUB02kxzhqLSAPmN/kOGCTWI6QQChpu8Ny1hWGjqrssvG2IH/v3TSkT
	a+qijMTjJxVqE7FS/oEtQ1jdGEg2+VkLbaQcdOvvejD4nSPSi+hunZ6ZdveLXlBYYgS3l2EmEpr8j
	a7ckc6JJM+3R+CyCsYx0/JYhA4ZIOtVSDmR9S9cGYlZzUBfSARGqy4+bvqfNcQv30WFoq4vwVK//5
	+TORMJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgC8v-00000003G8h-2Zsa;
	Mon, 19 Aug 2024 23:50:33 +0000
Received: from mail-bmxind01olkn20810.outbound.protection.outlook.com ([2a01:111:f403:281c::810] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgC8s-00000003G6u-0ayX
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 23:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8mBXgkfMRSSzSjy1t/mKlLH3AIBlflWcLVFMvkiBDi+vVvgsTVgtzuLZqNJMyrIT1xFSbskHJxHopNz4FHEskfBYe5XxQXWIcuJho735kuLzhwjrmGyhVVEX5ZJMCF6ky++FaQFzuR9kKts2tVgR4OE4ny5yAkZADCdpBaGJBwFJDB1pJLiaxR6n/mm9gUIjAPaCOwjtN71JOm/RnqNh1VUGDljinv1ZKRvX9v8doH+CyXpvt0X38mSNOdar+TCPWWUiCEUuHl3VYfvULCD2N9jm/s3451tVH7WUU7DeeEQfrbBwcS461R693K9IcxEdime6Ce1fwzO72pc1lCoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5qrA+GnOaxGkabKOLo/cA5LkK2otrGP/iSIgXWm6GA=;
 b=m4N6TlG2l6A7424kCHy7Mm9KG7QLnn+zbj4lmwRkcpGwltSfbVytHYnpG5oqZkA+v25QpzUdacR2WM76iRHlNBeBULTcRp9kQg1Cf6im9H+n0jo/rwAAIoLs+wBiUZTO4t/xzYkHC6Fl4Wv73uO6589ZXl7KEQwvuWk/C6iguf2FTrU0CieM13lBkhrFdyDo9OcfIMVgmOSaLEmIAjXvd1TsfpwMo63BvUCFCC4zwjZX+IP42IkRqIIvBHW4wBL+n/vWIV2AA0sVioMVKh0nA3aakyHPVQHlBcFL3/1NOMYpOGVhS/N36SVu0GLtXVyn9Y4nEaw48krBE4vFcjX/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5qrA+GnOaxGkabKOLo/cA5LkK2otrGP/iSIgXWm6GA=;
 b=eEkAMu8syLidX5CYlT1oMgyeztDgCijiLI8PLF4vQ64gb6yfIUTi31n5TR22WaMEaI0Jddv6ASvobEcP7HdUyVfaFQOZjvwbMrq5jJepygZx32fTjTfAaoT8a+lvrCt7/pR8KbFlYBbfoqHnpfZxMu3hCzvD9xIE7xG3zNh1OpiNjts+k59ddi56xEU3IZVeNckfGO46jTQUFTigO9VfEaprFG9n1E1MuZyMdTzYZ+0+/R7RBu6x7iK9g0xRkq0i4+jVNvVSoWd76AQeG8+29+mNp+rq60oKgb9q2BWHEZtZY4BERuPLagqFXTUytYrZZbbwdTf+ytThZMuDWRucAg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0577.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 23:50:00 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7875.016; Mon, 19 Aug 2024
 23:50:00 +0000
Message-ID: <MA0P287MB2822F987452856719294DCC4FE8C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 20 Aug 2024 07:49:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: sophgo: enable clks for sg2042
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, inochiama@outlook.com,
 guoren@kernel.org, emil.renner.berthing@canonical.com,
 apatel@ventanamicro.com, hal.feng@starfivetech.com, dfustini@baylibre.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, Chen Wang <unicornxw@gmail.com>
References: <20240805023320.1287061-1-unicornxw@gmail.com>
 <20240819-calibrate-playpen-964bfa720a3b@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240819-calibrate-playpen-964bfa720a3b@spud>
X-TMN: [DzXk1ByL5yxxynx9gVg4ffIWqhC7BBMs]
X-ClientProxiedBy: TYCP301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::10) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <c933427f-90ef-495e-9998-989cbc91b87a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0577:EE_
X-MS-Office365-Filtering-Correlation-Id: 806ce5f5-7915-4369-9332-08dcc0a9a37e
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|5072599009|15080799003|8060799006|461199028|1602099012|4302099013|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: ar8ykYgxpJy8Of/gpBqB4znouFTmXu0s/D7EGOxYA41KkUxKpfA7ZnKHt/XBt+YPGCnUSBFcFMlQet7EsUFncOAjOAAN96DuZhDmia4cbxPJo9mCE5yTYmrPtbMdjGWheDxByacsnzDdstyCPxFarssfrTXfWGcXJN7nDD7G17jkkv0eDbbMt6QSfE3kWaCxiqtKFitfgnd+XrpfDJWa9JJtxrYxbvoc7pHNS3ABVt5DbKRmTTSPTIyQ9sIV7wDrEAnl1bEOL8AC10x5Ql4Ubi4lH8RuCgHOK0Msz/Me0/uP48EOxz8cqFL/PtZu70G88IELLbo0CJnBSusQVfC4S/RCTAm7hnaPHYjlObsIX+yxe8nka6LmH/66EU5UnoVwKcJfq3yq63ZgmbRHfivwzmSWZMWR7/7IQ2a9Ux6NNfoa3GFqtyNWijdLaLmfDETmJBak7PW0zUVv7bx/t5hXm+SmS28RCYcVC+gkLhvs4KCtVKHsToFs3z7zDfHS++fcVcAMgST4aWewGoPxLvQKoTfX2G3GKO8CBxRGY/QjaWAsgIQwR2Id9hxlhTC0Hkn4u/C5XuPcfomynURxLx81m2Nn1YIJOaGh2AEpRFyYtW//sw1FEg2w7/mzzCMBfipJk6Ya62NpoJ6fDME6jDIEzJX5Vl7t2x6YNEBm9OVCsil1cWntvr7jZ9z7Ey1O//eZA0tYJ/VMh2Ov0tJNETHJtvZIfhyWxCkZhZY+oNxzbbFFNY1SF0hYVufhhMOXe397D8XRDRonSSrHwePtbmiQSIqfcvR7MXrxtiiKUwP+Dyo5HdbKNAVkrrPj1lM6bzq7rBXf89XX91hedRUMm/VxMmCPPgay/3BHMA1ixouzrqnZP0E7zA3m4yyuwTl5ah/y
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXJpLzVSdVFPemJvclFwMTNVd01Zblo4UGtxeDNRbXB6L2Z0SHJFK2VUS243?=
 =?utf-8?B?TGllNzlmQWhIQjUxcGxpNkpGb0FteVRidjU2VWZNNUc0RWN0Z3d6WnZUVnM2?=
 =?utf-8?B?bmdzMkJ6bU92c0VZWkI2ZEpZWTFrak5aV2hpR0xuNjNqalV0ZURhYzlRUElR?=
 =?utf-8?B?bVRVcnZCcFdrUjExZ0Y0N2VRdkFoVmgwaFlteXp5MTAzVjI1Mmk3L1ZwTEhv?=
 =?utf-8?B?RzBBa2xMek0xWGhQN1VwVFBKNU90YTgzMWNOZ1IwRzVGL3g0aHpLNCthUzcv?=
 =?utf-8?B?cndOME5lcWFXVmZiWlM2eGtwRUZ4NkJDQ1UvM0dpY2tHblY4azRiU0NXWEI5?=
 =?utf-8?B?YjIyVTBTeHJTakRYaXd3RXVSRm5xeXc2SVpCbk5CMzlleDlWNzJ1SkxjcmlN?=
 =?utf-8?B?RXErS1ZCRXpJcWswMXYzNXdTS0kwQTk0SXFmTDhjcmVHMkd1SUlhbVo0UXli?=
 =?utf-8?B?dVRFY216NVdBV0d3RFk4TzdsWHU3bGI3V3plR20yNFpSa25jMVlhazlXQmNj?=
 =?utf-8?B?WWRGeVp6TElYVVJwdGl0bGt0RFoxS1UybTJxTkZNVmNEU1RsV0VBdjhjRVNr?=
 =?utf-8?B?N0tvVXhZS1BVdjVySmUxTFpFZ3ZGVzhEcWRDQkpqSE44Tzg1dTRTRDV0bVU0?=
 =?utf-8?B?eHEzTFdac0U4Q3BqR1hLbFdtRndIN3JXRFRyRDIrZWpweFZvSmxFTEIzTE00?=
 =?utf-8?B?ZEYzMEltU2NXVHJOR29tQlNHbVEzWUlGUmRXWWJZdUJiL2pTeVBhcUxJYzkw?=
 =?utf-8?B?UlErWFhRMWljNk5lMmxOZDFCaG53cFl3SHhnR1A0V1kzWWpoMytrMTdsL3Fl?=
 =?utf-8?B?UFdJcDlNcE9aSUUzV2lxZGlCRW1aeUN3ekg5SDQ5b3V0YjREbndQcStQOW1t?=
 =?utf-8?B?MGFkS0RhazVWc25TeXJocWd3U1ZQYzFSaktESDVOZ2xzRjAvQ1FFKy9qN0NS?=
 =?utf-8?B?Ni9xV0EyeENsODRQNXJIaHlZQTdLV09xYkdaTkE5SklGcDRNMmlEYXNFdGlS?=
 =?utf-8?B?cU9NSGx1TGdtR3VwbG81dHJWV0J6cnloSS81Zkt3b2xxbVhwRXdoTWFyMG9F?=
 =?utf-8?B?bVpkaVdaZzhkQ0xMUXJyS2h1RVh2NHVvcWM2T3JKZ0Q3UU5tOWdTUW9kRk5M?=
 =?utf-8?B?K3JrYXJ6RkRlU3hqSDBFTHEzemtKWThJRXdIRFVCbVlDUzdNKzFKTmJmU2Ir?=
 =?utf-8?B?TkdqZS8rem1ROUNnYWs5UzgxTUtMR21oeFBzb2ZTQ2taL0xjeGZYWmZONlVZ?=
 =?utf-8?B?WUlIb3ZQUng4NEZEVE5Gc01zeXc4YkwrczNqZ3JmbzFqaDV3WHRVeW1UMkRE?=
 =?utf-8?B?cGpvSktOaGcxUXFrQ3BOZ0xTSzlQOXVVZGNtWUc4Y0xOOGIrNmFOcVczS042?=
 =?utf-8?B?ZUgwZ0RsS0VGelhPaWJwZzRaVjVtYXJnbUlTOVd1Q0Q4MC9qdVhEdkJ5Wnlw?=
 =?utf-8?B?bXVyUStQbDE0YTRCNkgzalp2Ui9wdHYrM1d0U2VjWmJaQnhhNENCbEpMQlFV?=
 =?utf-8?B?TXR1aFBocTR6K2hHaTUybXRySVE1QXhzRkw5a0thVllIZkduSjU1cEh4MGho?=
 =?utf-8?B?c2I2V1pVZFQ5My9FcEtTUDQyQXhUNHk3SVQ3dFdoVTRTWFg0T1l4VmY2c0Zq?=
 =?utf-8?B?bVRvTDN0bTdZajlYdGU0aTdON1RxeHBEeHNQbkxzV3R0eENlY3BLV3BQa3dj?=
 =?utf-8?Q?lNPFAZ2fxPqT/pnilDrp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806ce5f5-7915-4369-9332-08dcc0a9a37e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:50:00.7175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_165030_190338_B0B3CB9B 
X-CRM114-Status: UNSURE (   6.51  )
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


On 2024/8/20 1:02, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Mon, 05 Aug 2024 10:33:20 +0800, Chen Wang wrote:
>> Enable clk generators for sg2042 due to many peripherals rely on
>> these clocks.
>>
>>
> Applied to riscv-config-for-next, thanks!
>
> [1/1] riscv: defconfig: sophgo: enable clks for sg2042
>        https://git.kernel.org/conor/c/3ccedd259cc3
>
> Thanks,
> Conor.

Thanks a lot.

Regards,

Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
