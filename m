Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D66C10F04
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o8rLcDA7I+OONUW49kWCUprq1xak7sembxV7+rNhTM=; b=GMr6T3eq8DRoSi4XXlygFIWjMa
	MV4uxyANBq0lMN2FVOmbxk+OxwMg5QZ5gZNbzloR3gYB9X82GUMcolpLSF7hJKwC8ztedrOSUdROC
	JtEkroxxeZRB6ZEOmJ6hiiV7uHFIXxf0mZwe9k2/YBEUdu4pVv8+eUQTAccrJ9V6z+l2fcTD+fwhB
	EjuMJbtrDazsmXpBQNQuRIFRXfKZ6ma6mdS8xYxh5a9Xgg9uHjHoemoPaiGGOyHs8lrifFuh1GJgD
	SmyOGaA7898GB2eb36SVduQDTgbs5ix8oDh6/o4FYQj9ct0/968fyDtkVnMnLBXVHlAn2/YwPzmpr
	rCk02Z0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWCw-007Zej-0D;
	Tue, 05 Dec 2023 14:15:30 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWCt-007Ze5-0O
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 14:15:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx3sGq8IPwkydSA2FdSe7I3h3v+JsmiR5MFNHCE0i8qa8ALc3Pbk7QDpICLtYzx3UOszGPMatu+RYquKTXe6WP18pIR1DmL08wsyIDixCoRXfJ6LOXa3gBjYmmT1kOD/zFXjyTCBB8Agy2u1hAGJLOsPHmbt4HV0FuQfxYNsK6O2zY5DkCyKaqfKO6hgaved6GrQWT7WW1Q+VvSvFlk5yjCns56gqWmnhcXwFRr/tDPfVMihyvqO5JeVIAB6vOVdG+RkVlg6tVn/+ZrEtSRJtVM0PBcO5dLDCDpJRNit4rzWMKYpG8fYfBZy1Huj3aA2s9EKOdRn/UjuxZgsGFdtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNRZ+ELRXVW3NXJAzYcXU6HnhsRjgq9NamXsBvgMYPo=;
 b=KgG8I7w8hf2XsylQ+8lxw8w3Hs0LvRWhyDKhZoPMupZetpguxcbHIDdB81OslG/5A3FbmC6pEZLEmv9pNDrODl0PS9oQFw7Tif2p5o5EbA+WKEvDPaFFAFyalOzX0l2qHSEXZ64fwwKSUe9Mxbhs59wE5jc4mlXCGg4ftNzEl/KfFZkirrrQoIur2jzDFfhcErgrNWcMoDaS9ib/z/2/rGK6N71fLlA4quPfnSFPYHyQzLoSChSsLJWZNaFmqinmmCfC4iNmak3YczpOjfvWchTJbKpBrBz3jeZedLTKv6D8DvNtnAO0q4H61PWkWRGmC0Yk0v8KAD5lyYA+gHhXcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNRZ+ELRXVW3NXJAzYcXU6HnhsRjgq9NamXsBvgMYPo=;
 b=nXag0CwyMSi44TsQCw96KSRzJXNHGGFDHmY9jSJMiAA1EL9jAgUqxB6YwxPVnNsvJI4dp+5Io7L7yWYl/q4gyJGTtBMcwwnztCjMG0F3NlRB6GL4o8PddBiiameq8tMKwjqMeOBEK7AtJ/BEokWBXxGyNvqcgV6OC+RzhyJ9FtEdpdn1SQ/P3VzZDfKNaajJSP0+BFyBT9L6sazHvginj9saRlWPgxqJIpWhO4yo94ClLunPXrsaJCzJqH2nNagRbbmHbJxKcAHrOViwX86xUOfvqiK6JkURy+gkdas7KjL4CqhhqeuVJcA2Pf77J0mDcSwLQTPTKis+cJj/qPA+/g==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN0P287MB0426.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:11b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Tue, 5 Dec 2023 14:15:08 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 14:15:08 +0000
Message-ID: <MA0P287MB0332E148B9F8922E01758A5CFE85A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 5 Dec 2023 22:15:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: sophgo: Add SG2042 bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1701734442.git.unicorn_wang@outlook.com>
 <188cd5e99394f358c0d103b8b95377f32c010161.1701734442.git.unicorn_wang@outlook.com>
 <5412a9a2-38cd-4321-9ee6-b50dd060a08f@linaro.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <5412a9a2-38cd-4321-9ee6-b50dd060a08f@linaro.org>
X-TMN: [e3bAgTdJYd4P/oTmavykzuHWwXkkq8tn]
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <9c5deb44-5c48-45ce-af9b-951678cb3056@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN0P287MB0426:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b0a493-7290-41e5-8ad4-08dbf59c95e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yqFA0yiry2JvJHOctcRXBxSv4x+B2Nsl25342Ar3i/4pq7RWmnIvC/0mkqXp5bXGx8Kt4+igLdSnqTMTExm83gik9KhaXvcgosJ20Mb9qV3jWZ3YS8g6Qi0DtCGjHO7LB3srD5IrClRAIN9ISpSCLG32fovkdHkhmcY2DUV8BHxaciFH59qGPm3j2sJPOtMEKDg1TDXL1YPV1nP2rK00S1SVEr7eoQqweRwu2qTcnXTVITERUZ0TNMcYOXF0l4Qro880y/BTRA/0HHE3viVnTyGH63HLSkz06rBrODKm5L9w7YmpPbkIHFQHjpkrLxGm7Mz4hKMrEN12J+adp2esY64ssSNANTgCtf/CVTDwrI6Q03NIKyect4tsSr8pJQtZM5cjaYz7W+zIEvS1Idc2bxZF/vSuTkVb4PBtlZ45jiLH1cpYSMWnZ9aBe7I4aO+Lkwwh7ei7iG6FHlJUBF/zlDakkiFRuewdiCAqly+4BaeomJRtXwJf0qlbWU7SiwezAvNndHmbyS8cQp9u3Nq8/Igf+m/Cs/8X85HQgmfvSEMy5BaHGVY/Yo7DbVWPlgop
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVJCVHgrbXJjQVhmQk9pTnZHcSs3d255ODNLWDV6SHFDc2toNkkvNUEvSEJi?=
 =?utf-8?B?dGdDNThydm1wWHJUMTdGa0VOdWRabTlJNzA0NmFOSWlGVEhLd0NxbHBHa2R6?=
 =?utf-8?B?VnoyYVhjUlN2a3g2OUw3YnN1WnQrK21KL2Z2NTVNTG5OS2hmbWYvOEYxbFV1?=
 =?utf-8?B?TDE5N0EzUWR3MVoveHZDSjNpdWFrbEh1aGZKVEh6YkxqQ3BWU0dtdnZVb2Fa?=
 =?utf-8?B?S0hhM0wvYzAxa3JPMlU3L3c5WENEaGljS0w3VWV0MFJhUHRodmhIaFlVUWRC?=
 =?utf-8?B?WTEya21GTU1wbTVObXcvR1gxZEJkc1h5Z1hzNWFHNE5BKzBVaFY1aVJ3bU5K?=
 =?utf-8?B?R0FWQXpLVUJhbzY0Zk1BcXBRQXNIeFdMVUwvSFpQMkRyTjM1WmQ4ekdDZ3pL?=
 =?utf-8?B?QVZVdTZCS1BIOENZTmlUZ01JKzYyRk9iZFNVRHlzVVZaemlBbVFtdlpzaWhB?=
 =?utf-8?B?MVRpZkFoTzVIVHJaRFhLc1pMZXd0QWg3OFpqdUZDeWtlcEFUeTB1TVpUdDd0?=
 =?utf-8?B?WVVLSk1qcEhoS2dyNEwwTVA3TEx4T1FmNkZwcUx6N0ZCVEh6UWJ6L21BTWQr?=
 =?utf-8?B?VmhJUlFxbTZ2dzR5SWZQU1NxaEI0ck1kbVV3cTVoY2dybk0zZTg0ck9FYXZh?=
 =?utf-8?B?dGtZcFVMQmV5QnRFbi9lWlR5L3I3QkkyQ1NYbXJ5VWVaRWdOUDNLa0ZFN1NQ?=
 =?utf-8?B?SkRVWStrRkxORUtJRGtoL21xWCs4eTJDb05BRWRWL0VweEl1c2FQSFZmb3M5?=
 =?utf-8?B?akxoejByLzlYbEg1cUNjRHJBS281Rm1RVldtOVJLUjlITjVEeGovNU11NjZz?=
 =?utf-8?B?K0FQQ2lTNUlLOVB4YTNkRHBNNHBuRnliaVJBYzVZSDFCRWpNZ2JTNTZwWDN3?=
 =?utf-8?B?bEUwemlzWFpjK3Z0eWxTOTBVQzNIYVJ2bWJHakF2L2NtYXdUdlhpdGNNUjdB?=
 =?utf-8?B?Slc4MWM0ZE5BYk85S05iOTMyTFg1M0R4Nk5nc3lrK0dsTEtNcDhON1RtS3Rr?=
 =?utf-8?B?ODdrTzRvVjNNKzRrSEpzTG5zSlhjTzFpNENSaEVYUzlEYkp6c096ajlad3k2?=
 =?utf-8?B?MWpIQ0JyUmV1eUgxbTBzN2JYa0ZLL2RLYnIyOXVHQXVZYlRNd3B5cXZwSnZl?=
 =?utf-8?B?c1I4VkZHM00yMHVOeFFrWVVQeHVIRGJ1aGkyU2VyWkl4WGNKWTQ2T1dNNWl0?=
 =?utf-8?B?N2Q3d2FyWDdCR0hQWVRlSVlMVytBM0VPT2JJaVM3OHdLbjgrcGt1M20waVBL?=
 =?utf-8?B?RmZlTnYxQmxrRUVBU3gyVVJmc3I1TDQ4d3RYVkhhbkthTSsxWklycEgxdFo0?=
 =?utf-8?B?ZzZKN0lCclNlT2Y5NEkxT1o0OXBia2pHZnp4OUZzT0tqTDNoM01EZ0c2cDRh?=
 =?utf-8?B?Y0poY1BtK3dFWXVFc20vRlFyajZncFBoKy9qcDF5Smh3eDJIUUJOTFZSVFVI?=
 =?utf-8?B?Y3cyV2s0NEZyY0EvSkV3TFQ3c0ljWDZtd3NSRllBRmtQVXVpVGl4cTIwajNO?=
 =?utf-8?B?ZzhkV3V5SllVcm5QeUFjNUpkeWl5WG5MMVJhSXdVN3B2MzJXVlcrT1lhZEJ4?=
 =?utf-8?B?OHU2cWNWaDJjUkxXK3d3YXo4OUZwWUtDS3Z5aWQyRFJPclpSVlBDM3BNRVJB?=
 =?utf-8?Q?OtDfrlevNBU5fjXt3bEAJORYHAYIuij5wFmXRa+LwdQs=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b0a493-7290-41e5-8ad4-08dbf59c95e1
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 14:15:08.6041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_061527_185078_B24D35F0 
X-CRM114-Status: UNSURE (   5.09  )
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


On 2023/12/5 16:08, Krzysztof Kozlowski wrote:
> On 05/12/2023 01:23, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> Add bindings for the clock generator on the SG2042 RISC-V SoC.
> ......
>> +      - const: sophgo,sg2042-clkgen
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  system-ctrl:
> Missing vendor prefix.

hi, Krzysztof,

One question: under what circumstances is it necessary to add the vendor 
prefix when defining a property?

Thanks,

Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
