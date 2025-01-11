Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA64DE77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 02:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Cc:From:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCRRrsTte388wwySgxBahvoqHKFr9qwJWRjjpSdHTyY=; b=D6WVEOMArB3vo+Z9d1tfErZdc0
	TptCpuUwfVgSSiZijNAnMpT37Hkl6o1O/N/5LIMGO2h7X5dLhATBUzkTpSM07iTGGwX4+zPyL9Izb
	GH2u6GaWI2eP64IhKjuhBdrjaNbJw0NJFPBF53Ul4BRdZKFCaBgYsIjBKJqNyyWQDjz9+IaRB0c2C
	xt1z7OvIw3Or+7WZ25Z4lXF0BWeXPInq498qFq8LBKFBEgkh6ehQ8lWHcP8auqtezFzmnHPRshF0U
	bSjjFmA0XIUMCKyaP59pjHEPV8avEEn8a9j+urwshUr63kyaUSLexefY+AeSbBoiYR4iO4C1SVa8m
	+278pcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWRNf-0000000Hae3-2si6;
	Sat, 11 Jan 2025 02:37:43 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQKL-0000000HVLi-1WIl
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 01:30:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D10SkW6oJiwBNOu9Php4JmtzC01YQPPY6MkBdDke3HlFDuQUqtg8rI5ldpbJMatwUqxORmrbYdqzWhJAPoNDbmgzPD7RDUtIscfIFIm1oPkF9bypJvC0em15wek3HLYCfAtUhj4kc2Szs7B7rUd7bMGBzBf+fkJjx+JlBz6ewwHqVkfQgJM7EDWj3EusueaJiT6iw3P6tvfh1ys/4HBR88TdtlhTUI+YH2IFsxMj92RolKO/sW3J0AfMeF2YgU6B6qdaQHgupRkLZ91XyZEp7dVg8TXt6IRUjXj+gJga04N1EzqjQdhkuBeB3mRTqdYeNbMEdjPtYD+DF4BVqCgumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAG4uvINM9tmVwgpEQlsNqftdKhA9SNF7TnEfLd1D4E=;
 b=aN70ZCwMv6ZEhum6tvdjSr0bRuBFomSZxGYgTOhPYItFvlhv1fg4VRZIVjBvbjJBxivjrLUUoYsqYXAE6w7qNCBr3bnvO4YJELrfyrdAaHcufJ4F/RWgcGhStRxffygv71SqOZyQVapweAp7hddpMFpy36rDuMNHye89dshq5rN58AN+fR1L7WXnJZNzboYil7Fl0/EXDQ/NUrVu5HK1oy881BsPYpXvjUgKv+IQmtXeHlOz3qT+vWYqG4ZJFr8WndJJlXn8g5MUXa9Vd+Ixb1awmCQVhBYUzTuTN5UuXn1Tz0EZbwhQF7fw9xmZiL/Plvt7zFMW+gclzzhULrFjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAG4uvINM9tmVwgpEQlsNqftdKhA9SNF7TnEfLd1D4E=;
 b=jYQrkj+upovl7oGsdDISJE97fiWf4ZPnizVnAxbYvr0boDzjCzxT3B//aKxlQye2iigDp+Lxo9AfPwxAGYeVpzHMyZ9+g0MVZPZmxlyT2mvM547wtAKjA+Gzq7sUtSjorVFzbAaKSN57Rh46E1pyjeBXp12y3UcSqg4vpEwxAiQnwB+S5nyV8miyZ212ZB/dfUmmkKerixZEcZp0QbIyX7oJA5omQkFtdXygl7KJSzY3ZdJyGODylEnqdQ/Ln5SVObxN43atTncEeNhX93mCt3r4DSObJYXoPRryYEzseldfK41B6RKVRw8N+GeC9/o8R3YvyDYwARRHqKc/hr7Zfg==
Received: from MAXPR01MB2573.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:53::13)
 by MA0PR01MB10070.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.15; Sat, 11 Jan
 2025 01:29:58 +0000
Received: from MAXPR01MB2573.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d7dc:746b:56e5:ac9]) by MAXPR01MB2573.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d7dc:746b:56e5:ac9%5]) with mapi id 15.20.8335.014; Sat, 11 Jan 2025
 01:29:58 +0000
Message-ID: <MAXPR01MB2573036E3F64491864493EC1FE1D2@MAXPR01MB2573.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 11 Jan 2025 09:29:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
To: Inochi Amaoto <inochiama@gmail.com>
References: <cover.1733726057.git.unicorn_wang@outlook.com>
 <c882fe329932409131be76ce47b81a6155595ce4.1733726057.git.unicorn_wang@outlook.com>
 <hdkdszyt44eqh5y4zdyp7j42kem4cvbyerkk4i3ty2wavk3lma@ksbcfkr7xwl3>
From: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, arnd@arndb.de, conor+dt@kernel.org,
 guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org,
 tglx@linutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
In-Reply-To: <hdkdszyt44eqh5y4zdyp7j42kem4cvbyerkk4i3ty2wavk3lma@ksbcfkr7xwl3>
X-ClientProxiedBy: SGAP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::24)
 To MAXPR01MB2573.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:53::13)
X-Microsoft-Original-Message-ID: <495fce3a-dac0-4127-a4cc-ea35060ecc87@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB2573:EE_|MA0PR01MB10070:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f4c03c-1e31-4051-4349-08dd31df755a
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|8060799006|7092599003|5072599009|461199028|19110799003|6090799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFNOQzRLVnhGdWF1Yi9BTTBXU01RMWJGOFE2Q2tGbXgyVWtiWXcweklobXIr?=
 =?utf-8?B?MHQvVWh3RjVRQnc1cS9Gb0s3NEtOanQrU1AxNmFQUHhTWFJlN0FOUlkwN2JK?=
 =?utf-8?B?Zmh3OXlScVRVbzlieENhSDgza2R2S3hybjBnb0RRL2pRL3kvMjdtQnNxbWQy?=
 =?utf-8?B?L040TkNmQmVVc0FtTFNjZVcvTU9yUTdGVFpuZEZBL2tRTFZPemJzd1d6Wmc4?=
 =?utf-8?B?Z2xFOE9LRkJ4R2R5MFdjNG10T04relU2bW9CSndJVktpSHdQcVJaa3ZXcWxt?=
 =?utf-8?B?T3RpRGl4RTBwaVZhRmVYS0gxRTlscTJZT0x3UXVwaDBhYmFyQ2R1VXV4WHZi?=
 =?utf-8?B?c2xjaU1NK2dXQVJ1a1cwUUpmM1hGVXA5VWkxcEVlQ1FZM3dpNkpaZjVncTE2?=
 =?utf-8?B?RVNRYkkrU3hCMGEzZkpDRVNIcFVoeDBjeWxXWmZKc3JrYnhLcWhRRW5uTnVS?=
 =?utf-8?B?WGIraFpWVS9qYzRQd3NpQUxyK2p2eG5yRk96dHNiNnJ4OWJBRlRpWmhTNW10?=
 =?utf-8?B?engwYzFveTdFOE80OXVMS2FLUERESVlIRFRwWEN6allqcUhhaU1EZTIrZEh4?=
 =?utf-8?B?YTcrcjl4NTNxa2lsMHZ0TW9CNzZsVGl0akZnd0p0dGtSTGZ4Z0szV2M2blc1?=
 =?utf-8?B?SnFMb29zQ0Fjd0pkVC9LZGliNnc1VE5oby96ZVIxMzUxSkhYUEFiMHBuR25O?=
 =?utf-8?B?N3Vsd0RaY1RTWGwrSWRWajJ6NUFMc0JQQTRXZXZOZkF4OWhoeU5oRklTWGlX?=
 =?utf-8?B?cVdNNHFUL2pnVVZKR2cydlo3QVZwZjllRjQ0SnJMRGNlMG9xbFFZTTZZWE5W?=
 =?utf-8?B?dWtRckZPZ0NhUW5VRmZWQkNSYW9IU3hRdTRwbU83WjhGaWVyaHRMTkVoNWYr?=
 =?utf-8?B?RTN6bjRpTExDRzgvYXF2eVg2SCswQ2RnOFZkZ3hKbjF0Y2tiZnVmN1FqbzhC?=
 =?utf-8?B?OE1jVTZpNUJIMUVzOVdZSE1vV1ZTK2RqWm5RZE1kZmtrK3g2YjN2NHVtcUFm?=
 =?utf-8?B?WmlUclhaZnpFc3Q4b1JBeU5VdHc2VWEzTWpEMHAzSGp5NFIzbE9sRnN4cS9R?=
 =?utf-8?B?Qzd4OUM3Y1FzZmwrajAyeHlVVTFZSHEvUXU4aDlHTzRFS0Fpby92RnQ3MzdX?=
 =?utf-8?B?UFBFVDVveCtuZlJ1M0swN0lSS2loT1ljbjNKZ0ZoRWZ4WkRCWnNuRWNRaWpm?=
 =?utf-8?B?enZVNHliNWdRcDRtaDM2Z1VKUlZsODdVVEovdFY1eGpZZjlJWnUyZ0dIVG5F?=
 =?utf-8?B?MzhJNUFMTld6b2VYTzRsa0RScFRBRnVTQ1JHWE9kU3FuRUhsK3luMHlXK3N2?=
 =?utf-8?B?M3RQTkRJVUZ5TDFKUHpVdGQ2eFdRaEFDeWtLNkY0MUNLN2tjbkN5QVBjTTVX?=
 =?utf-8?B?aUVZOS9Ha0xBb2R3T1kzdFVaT09BdGE2QWZpTjhVRWk0dnNJVytBdHMyRDB0?=
 =?utf-8?B?eXFwYzhqNm1ackRHQlpCZk4rTjNLRFVxL1RnVHJDaElhOFBob0g1WW9MTXp0?=
 =?utf-8?Q?8yhCXA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K01obEVxVURueENkVGJHeTNldFptZUxkZHl3QkdZcFE0K01VRStuYjhSTzh3?=
 =?utf-8?B?KzFCUCt5Vk0wUkFWa1h4SkZ3cmZWNzBtVHdmaktrbUpWaHhheUJ6d3dTelcz?=
 =?utf-8?B?QWtBME9XQTBmbVZjTmRRNnJDUGgveXIvOSt1YmJJWDRFOE5wMVBuRElLZGRh?=
 =?utf-8?B?dDU2RzY4aUhFb1FZNW1PTWNzTjB6bm1VM09vZC9NZldqN1VjMXlMRDlseS9z?=
 =?utf-8?B?d2hhdU1FV3czU3MzdndZdG9HV1N2dm9GNnVyZE5yZHgrSmduZW5Obk5HMW5P?=
 =?utf-8?B?Nm1LM2RuYTQ1TnAydVZOaW9jNzZwQzhhZXdjbTRDVkdlb1NMeFl3SDEzZ2ZN?=
 =?utf-8?B?ZmU3YXpZR1JnQm1SN1YyNlpVYXhLZG1GOHVZZitNTU9Ud1BNZGVxV3Q4Vm5Y?=
 =?utf-8?B?eDF0M1dUaXRTcVBQcHdVYzl6a1RIblozQlRSaVVNekYvVVl0cjIwNFlKbGo5?=
 =?utf-8?B?d29mWGhiUkpNOWVBNXo0c0JYVkx2V3k2OHFiNkZqaWR2disyYk52djFQZC9z?=
 =?utf-8?B?MlFmQnZSVUpSMkdwTkEvUmMvZThGWWF1WWJhZFVNNk1kT0wzcmNpb3Zzc0c5?=
 =?utf-8?B?VmVhTENRV2FRK3ArNUlaN3RLdllNMXRVZnh0dVEvb3JMR0FQTmZHRGVhZGE5?=
 =?utf-8?B?aDdFMER0b2w4QkFuTlFRMFBmejEvL2p0M1VUSlpMVDFtQko1SWNzdVdIQks3?=
 =?utf-8?B?eVpLdDNUUmJiUThaZjAxUlhCQjMrdGY2UXY1MHpVN3BoZmlNS0w4ZWZGNGx2?=
 =?utf-8?B?OWlHTHZ6TjBpL3hMQnk3UVNKRjVraTJQUTRMc1I1bTE1QWJQTC8yMUlsNFQ2?=
 =?utf-8?B?bVQ0ZXQxaDVoYk9OT005ZmpjNjAwY0pydnRNUTZIc1Vsc1hvdWdRQUxiR216?=
 =?utf-8?B?VVVLcUh0cjgySkdCejlqUDVMV05XaUM1elZkQlZENk8xMlYwKzNQVHdOWW9v?=
 =?utf-8?B?YUZNYWEyeUZwZzI5WE45ZFNucEg3a3Z3SmVkNHJVcEVCVWFoQ3NMYTVjK0N6?=
 =?utf-8?B?Uk8zakZEL3IwR2wxVzVNTStuVS9vZkJ6RUV1a2prZ0h0SWQweWRTemdkWU00?=
 =?utf-8?B?NEhnelc2VFBGUHZVbis5T21od1lubHRqR3NIRzhwc2lzemV5QlJPNUMxZGJO?=
 =?utf-8?B?WXFiUDdlVlNhVnVibDNjSml5NFpEQ1dDZEJDNjdaR2RaYnJaWkRMZHNlYWIx?=
 =?utf-8?B?ckhpdmxWNFFwQlZJMDA5ZVptTGJUT0tWMm5oWVR5eWNNbXRKcFlaNTF0b2RD?=
 =?utf-8?B?Mnh4SlVjSGJNZ2doWWFvVWlTVHlQaDNRd25TdjVHbHhUTjc4S3JoWkdHR1pB?=
 =?utf-8?B?NFJWYkk3VGtwMVQ5a1J4UHZ3S1o3U1BjVlBndm1ncEYzTlVEK2poQ1lFd3Q1?=
 =?utf-8?B?WExacFFzMzZKU1ozTDhmQ25HdE50NmZUWElJZ3FDK0dHNE83aEhOZkNNeWdP?=
 =?utf-8?B?SDFXQUttZDJxUVdzNGh3bUJIU2VPUUJIT3RFdTN0Z0pweGpnanhFT3dUTFRC?=
 =?utf-8?B?MFltcURENTJzNjI3bVVpdXdzOHp3UXJ5YWF3d1NLcjQ2NmVJVXRnSStIOWlN?=
 =?utf-8?B?RkJ6WDZndGR2TnNkb1g4U0g2QjAzWjc2RkROV2xSWVJZZC9ualpiSTM4VjBF?=
 =?utf-8?B?M3crWU1DYUZnVXBJVWpObENSY0FFS1dieURqckY5WHZqanByYWlYV0ZiS3hB?=
 =?utf-8?B?MFBEc3FDd3lqRm9FY2N3ZW1uZVVJM2VCUmJ3azNQY0U0b2djVy9FRjFpeWE4?=
 =?utf-8?Q?IsmagjwJGFySOPrHyKoLqClu1ZDOGkN/hS8j1ap?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f4c03c-1e31-4051-4349-08dd31df755a
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB2573.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2025 01:29:57.7187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_173013_420931_47422904 
X-CRM114-Status: GOOD (  10.14  )
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


On 2025/1/11 8:45, Inochi Amaoto wrote:
> On Mon, Dec 09, 2024 at 03:12:00PM +0800, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
[......]
>> +
>> +struct sg2042_msi_data {
> suggestions: sg2042_msi_chipdata

ok

[......]

>> +static void sg2042_msi_irq_compose_msi_msg(struct irq_data *data,
>> +					   struct msi_msg *msg)
>> +{
>> +	struct sg2042_msi_data *priv = irq_data_get_irq_chip_data(data);
> It will be better to unify the variable name, it is confused for me.

ok, I will unify this from "priv" to "data" as other functions.

[......]

>> +	if (data->irq_first < SG2042_VECTOR_MIN ||
>> +	    (data->irq_first + data->num_irqs - 1) > SG2042_VECTOR_MAX) {
>> +		dev_err(&pdev->dev, "msi-ranges is incorrect!\n");
>> +		return -EINVAL;
>> +	}
> This check is fine, but I think it is kind of useless. Take the
> configuration for devicetree and process it as is, which also makes
> supporting new platform simple.

Sure, I will drop this check.

[......]

Thanks,

Chen



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
