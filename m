Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBA1D11704
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 07:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qPUI68Zy/Lr50uef9DGOu6nwOfdZO9iGG4giZGF0eo=; b=4Dyan+awuUUDcz9A4R6QFJV3Yp
	f8+sigaNZBEAm4KYoRsENipJJBoy0YEDouHOHh8B5TMmPusToBtaR0/TXOf/ZXkBHx8hgPT+JtWLY
	04GMBJAhr3CmXLGSWlASKb4aj+LOgqdAaaU6p+eH+RkLAL4LgZXYMUTFlugk/3bs7gtauquJ3ZjWv
	aiu8ghx6EW8jcYDUBerFoFw+aIaaNbC2SdGUvrh42r41e2eI0GSOZ2ypgN5bYdGkrL9wlli6JV9hM
	uJuYOrAP2Tda2yiusTiWx0XdAnHKtkCn2MSInJ73t86LC8GTRQS3qL3DC2EFejbNwmnuC6ZBb65SL
	375UAX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EOg-00000002lCi-2A6x;
	Fri, 25 Oct 2024 07:06:10 +0000
Received: from mail-maxind01olkn20824.outbound.protection.outlook.com ([2a01:111:f403:281b::824] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4EOZ-00000002l9c-48sb
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 07:06:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUPORLoACdeeLFLxeYXTVEdR4eaDIqU4WBUdSN1/ZMwr7KQ3W8dXsVarhkHBuKKn5+BJgBMxmPFg2YduImxwCt5wu7aX0hwzQvkgCKmnmt0EbPlAxo/tVfj9ld5ImxJ9o4wxqkQ1JWbZq2RTBI15dA0oA9tTFwUB9/129SDDhjsUslUwDkhgRjiI8ZaUoesj3odnZJYQSrqF6lJuGhVUQxares1c+AYRDGG2oycruC33G6rrq4aTSt2XYZ0/HvwX7Gxx9OEZwUt2LTNykTejFpxh0vx4WPq1/9uojpRipVxXhjjB6BvSwyLNiUYkxPfGq61QXGiWCeiJvBGJGkQGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPWpXgTj+wJeE1WiMq3QqQyHrTo7hbys6bDBoe8hLYU=;
 b=lEM/LdDz8mxb10MhYpVUkUG6PACZLbY+2dGQVZCGqRYtMvn8fQfP99MvLs2H6az2JaW8KJCOemRSeR1Yemnc3bJjIp3yBk/MRm9+rw7hnYCWYYl4unFxZ+9qbRIURJoNgaOXjz84kbpNblyE4d1v0R7orNoZ9Oip8RahFu7F/NTlwpbQMBLC/1KQhRmyMdHlp2j5NnOmRN6/HUCrYZDUxySymPKb5vt07PbpM2FpBt37LLt/Qk34GLv+QNURSUrhW1/2Pah8ior7naizzaruaLCqi4/StSifjw7nh211ASCvV5pZiMzxZrdGzpEJGwMQRkcAVevVqvM7cnfIgug1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPWpXgTj+wJeE1WiMq3QqQyHrTo7hbys6bDBoe8hLYU=;
 b=aD9uhcJIb5WsxRVXvZIM00ckBna6khuLsiCC4uIywjAIKVgGymu48w0fh2T0QJrOGtDWP0TT8++UovJEMf3HPq9wa8407VdkAUtPmvel4tls0aFGXAIN6yHH5iD5bVk+YCzehawNEYicYXT8bY8Dz8Ouptf27HFpyzndIUKnbmhbjRgPqXcCcoG7iJhEv1OYzVPQweIayh/KoMkOrhtRY3ToKRPeazNWTpQbYm4czX6RJpgHe13aL13KRlmyzIXNxJAZutl+kPukKV9dOv543ri7hQwgePw1FL8ec/0UPz8rWHaYElJlDVh5Cqpkzl3ybMslwH+epRYbME75a5KY6g==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2PPFA5476DC6D.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::140) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 07:05:44 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 07:05:44 +0000
Message-ID: <MA0P287MB28228FA7990371369CEEDD96FE4F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 25 Oct 2024 15:05:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 SG2042
To: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicornxw@gmail.com>,
 ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <cover.1729037302.git.unicorn_wang@outlook.com>
 <fec7163144d7f7b615695b5fd22a182ed7f1e7e9.1729037302.git.unicorn_wang@outlook.com>
 <2mwkqy7xqj6bydwutwjmyeq4swnqfmljr45rl474uqciglmpt4@2kgwci2oxyp2>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <2mwkqy7xqj6bydwutwjmyeq4swnqfmljr45rl474uqciglmpt4@2kgwci2oxyp2>
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <ddae7dd6-6379-4180-abd9-ee7eb1ad3ba1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2PPFA5476DC6D:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1995fa-9f39-4298-b2e8-08dcf4c3716b
X-Microsoft-Antispam: BCL:0;ARA:14566002|7092599003|15080799006|461199028|5072599009|19110799003|6090799003|8060799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 0znf/XoyMpnewvp9ObNJno2OY/vXNBkYt6D0znRvJPf5/OQto0Feovxcw08jVZi8t59u3qs2gxqmCohhSo4tyoac/7uxsZmNHwTdGi7yXH1B7V89eTTbwkmDbYakpUP493skpUTJj0pPHBbEx9NCWSGSnJgnNFNio7218buwHr4c6vLKdDTPM2dnMPjob2l7qF2MPHgAOg7pEOkuxA8VWYcNZVa6mb5J75Ncfl2PLlmXcE9JoMUHZ37+UrvW5ABHnojIT8xXWMRieYEoaEHhnWhni9N1CoeMcsECzOLUhnzNS5WOfJiZsqEeUbeYzzREIVvBwoad52MVMqk1S13od9GaJFNlrbf91CaABrfJTPOPCgmyJ3JAWtpiYX/zWPDjpQoLaB2pg3myc2Yvbc5oqIQl5wuGF51KjTxPWD7J1EI+ga6Z2gJhabcD1eL9SPbC4odSj/RB9d+9Swe5Hb9T3YjFWhQDqR0ubFTkCfaT+bwzTD96O3YZLgzWLjr816y8erUWkVelVkkVyUWHHjrspge52ClzLBbiry108SyknHMn5ZpROgRHIv8bbDL3R4vfaloAxSbxW9A193x0P1gN9xwm76JglXVp6CJjV3ym0lCUachWLMoLBZps9GywTpYF11gw404mDxfrNskeQK2ndfGSJ82f8dCv+iFXZkWIQGLvk8r4czlJGWuhTF79xjTe2NgJo8knCUfQ0eR/YAge3QxDaYC2dXbi38NW41n3UssdO8eOZbokGPyFCqNypR3VOFc7NuvIzC0VzT1OUCt2EQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3pUelhCRVZYT0NIcHhOUHhJUTV5UzJBd0EwRi8yQVhpa3NpTTNoR1cyT3Rz?=
 =?utf-8?B?R1ExWVAxZGR5VjQwckNBYmlnSkg4QjlYVFpueks4dmZDK3VrQnNHVlhqVndO?=
 =?utf-8?B?THdOT3Jjb1M4Y3dPVWJCR01PTy85NFN6R0J5eENqSUdmS29XWkZ4THlpT3pp?=
 =?utf-8?B?U3pINGw3TzdkVE5oWDdUck1uczRnZWZZQk1NTnJJZy9WVmZBaXowVVlZL2pI?=
 =?utf-8?B?Zk9RdUhBWXZrS3ZZYmJqK2pjYjZsWUo0NTRyTm9tN0Y5Tm94RXNCUEQ1YlNV?=
 =?utf-8?B?c1ArWWVRVzRBOXRKMVZDdm9VZkFtSVgzQWxRaC9wNk1YUEpGTEFtbTFmTWdD?=
 =?utf-8?B?MGptRU9OcXJQSjdRc0xyd3FIVW1Way9zakxYekZXVU5tMFhvL2RmYms5d3lZ?=
 =?utf-8?B?R1BsWDlzRFZyaG41d0FOTnljM0FVV0taRmNBNkNGQXlrY1hISXJxSDJZaCs0?=
 =?utf-8?B?Z3lENU03SGxhelpPbTU0Y2c5MlFLdUVUUUVRb09laDZSWTZiTnBFMFJvNlZD?=
 =?utf-8?B?V3FhQ0kwNWxWL3A0NmxDQ3dBL2ZVb0xHbnRuYlY2K0J0c2hadHlGVXJUUHl3?=
 =?utf-8?B?bkFIMjFaVHpEZzdRUmVZRk9jaTlFa1RXK3czN21nMEo2UEszU2MzZWtFaVVi?=
 =?utf-8?B?YmxWcmdSTFI3Vy9NRkNqMVZEMHFxYVVtb1NnSllFcGRLa3ZiWDNUQzdBeXVN?=
 =?utf-8?B?emtuK0RsN284ckNBKzVqWEsxUWJTSlprZFpFUEpYbTNuUHM5d3NsYnBwMThH?=
 =?utf-8?B?QzNOUXZ4ODJqQnpkMXMzUE9xeWJBMWw0clNsa1RvQXNxQjh2K21WMU90bTFR?=
 =?utf-8?B?ZnBWTkt5U1BJSEpoMWFPUXdBaU9IcVV3N2JBVGZ3R01YbFFsNWE2c0tqRXZx?=
 =?utf-8?B?NzJBMWJCRER4ZFQwekpxUWU3SGMxZzZyYzNwb2FXNGFrbjhiTzV2Z2xQTUZT?=
 =?utf-8?B?ZkZ1MDNxdEI2eklQN1pSM1RIYk9UcWNWM25wWjVlTWtVd1hrdGpXbnRaSGFa?=
 =?utf-8?B?THRhTjJhRGM5dFl1T1YrZ0dyMFlnWUtaOXV4OUFpTk1USklrUElYZ1ppb1No?=
 =?utf-8?B?eGdYamZJQ05qUFhMdzhCZDBRSVhQNnVBZzUvR0lTc2VKeStUQXhGMTU2blM5?=
 =?utf-8?B?OFVuOUxiWFh5N3NxOFVZU3lBNFZDSGdFUEs2SzJ3QnJOQWRhWVljcFJDUzhs?=
 =?utf-8?B?ajZXRHFUUVlMYktRejN6UkNFQ0RYUm1PZ2RRenFVQ1dmc1lEYUpXaDhuSTRB?=
 =?utf-8?B?a09NOVVxbFlTKzlmNk83cjFOQ1p0U1QxZkpRWFZJWUl0a3VJaDg3bnJPTUd6?=
 =?utf-8?B?NVkrT29qNk54WUZhdWFHN21nMXZienpSa2w3Wkx0U0JMNUdnRndXcjdsRUxZ?=
 =?utf-8?B?R1pGRW9pd3RMQU1pcHcwbGx3eTBCV3V6UGdGZG5XNWFWZ0NmeGRPQ3JvSTlT?=
 =?utf-8?B?OFNmc21acnlRdjJ4ZlZVRVNvNWZQeDRoVVROeUk2bjY2VUh0Qkt6RG1vZ1dW?=
 =?utf-8?B?WTA2QW1ZL1phbXlUd0pPcVNjQldBSFdOaTVOUFdHdjErRlMvTndpN1hzTmk1?=
 =?utf-8?B?M3dUc2NQS29Dc05UeDhOVDJPTGZkUEU4Y3h5cHlPNVlGQ1BueGI2L3VLOXhm?=
 =?utf-8?B?S1lzZzNjM2F0d0phRlR2QnhLbk9YT3ViaWlHOENYQ1ZsaFdIYm1kSHlSM0sz?=
 =?utf-8?Q?BhFvJXdtDwJY/UxTb63Z?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1995fa-9f39-4298-b2e8-08dcf4c3716b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 07:05:44.1620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFA5476DC6D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_000607_499508_4579785C 
X-CRM114-Status: UNSURE (   7.59  )
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


On 2024/10/25 11:28, Inochi Amaoto wrote:
> On Wed, Oct 16, 2024 at 08:19:22AM +0800, Chen Wang wrote:
[......]
> Does this ip need a reset? I see a RST_PWM in the reset bindings.
> If so, please add reset support for the whole patch.

Yes, we need it, I will provide a fix patch quickly.

Thanks,

Chen

>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    pwm@7f006000 {
>> +        compatible = "sophgo,sg2042-pwm";
>> +        reg = <0x7f006000 0x1000>;
>> +        #pwm-cells = <2>;
>> +        clocks = <&clock 67>;
>> +        clock-names = "apb";
>> +    };
>> -- 
>> 2.34.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
