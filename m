Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29520C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OV212cnlFyEYzE9pvOVJKLgXUiUGWnJJaWKkPjOFFvY=; b=4HhCuyjdqMpvIr4dqD/FOkPnJZ
	o3DSon6bOclsLJ2oZCxTiRbSGw8mgFihlN9BAd/s2maLddMxU/CwBYrLzzLpYtv+LVpn3Xh4OnZ2L
	AXxTVyAkrfi5/oGrwt3rp8CAb0/oA/OXZw+DWbjkPO9wbypPHXwXVe6KlDOZsZOvyYkdDYGtqouN7
	/KTbE+I3HSYcYThiHT3iDNdq2l0ZuzY5bhJbvuROO0ozBLSnOOH711xATtL8tGyWRER4eQ96QPh/G
	vitUNGRk4Z5fHe3sXvyg0kY8N+PYw2LlIQlkcRbOVrkdANmZitTdVqpttcPK/VDsi/ufsoK1607ub
	4BGsR9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA53n-003O17-1B;
	Mon, 04 Dec 2023 09:16:15 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA53f-003NzS-0z
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 09:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERnxQShAXRJqx0kOzw/WidRn4dPuyduuUSX2rC9EYFe6/DyfBl0Lpt7slMnB+tCqTUSPtnjR/TyFQppaFosK7Aw7zcc5LmTMtLPoJLwxpvUEhoYaSHP82z2Jl/f68Han5K8EwPOumHTnHSN3OVdIh6KCXc8OHFmg594q6j66Ef8qVvjdR6wZ0+xtlhdq/YigSD/xo+PTTH52qwdFGWXkD9z1MOIOrKCB5doarrkGeYOok+8GZKpL+y4tiz7LB/1jCQA3WqV0rFFUny6LH50ZdTN0n/sTS3LmS51BDni3PVrwPzxQ9AXcMur9mdSlB0tQ+y5sqe5SelD4LY05h3bvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67YqCCpwKj1GVNAUrUFJXiBqTP+nDEZwq9PU94Dk1ms=;
 b=GzLa6aY7QVM9rKJlteioOUnsEASE+/HETsbhtoSi9sTo/A0zSSaOKB6dO9qxkHjEEd7FrQlCQZrdbvFMjK51bOUmTVqOpXCVZo9tGXZtnt0Ml5ZFzTukbVa8wHFl0NWbxuu+z/24UOJbTGC3lWSjnm224RnsjLDN0fjs0VgOTkQlvG+O9k46g5WeyJW+th20TdtZX/a6CGMfXt2N4KjaYL+yl/4SKTWFEA6unxlathusuYTZWPUvoLpMNiZ9TCslPKapd7oLRZsbHWSeO/STtkQICdeOB8Xv1Iqryp3blSq3/WZNflWKCUsfZWnqskQC23xfMJM2R7m+tEv0iZKIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67YqCCpwKj1GVNAUrUFJXiBqTP+nDEZwq9PU94Dk1ms=;
 b=YwB/wyBWAiKt6m06UtSGTOsbDdcgyIRbcnPL6MXcSywgSK8LbrHT89GFejeSJMs9WVx1n+p4h65BfanVva9PEjEWFpEbMxtM5iE2N8GX1a5JSgcbd8WyTJ5GR2xnV1Oql+lvmfX/LlN6BTDAU7JjEMbB0HFAXTa9Lok8finPFajN1JIeLwEKhzRJ+mOSc9EEdLEIhbaJLOcLXppTK3J7gp3QTIl5urtswmekQXtqezLq7OtT5YSfQyqiPmCJQM/J7881JtT7PC4aYyIFaZr6NqgpdIVQeWjO4Lh0Pa8EdOU+uqjI4HnVoQZcJzjhTtXU6zc1L5ULNWAyjzxOg6eQ4w==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB0163.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d1::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.33; Mon, 4 Dec 2023 09:15:43 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 09:15:43 +0000
Message-ID: <MA0P287MB0332AE2378D633B8A2DCFB77FE86A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 4 Dec 2023 17:15:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add Huashan Pi board support
To: Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>
Cc: Chao Wei <chao.wei@sophgo.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel
 <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <MA0P287MB033290A6C8B15202E31E43CCFE80A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB49537B177B6F3614D8D1E3E6BB87A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB49537B177B6F3614D8D1E3E6BB87A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [3NQ4qCTD5c8H0nvts66tRE9vGUVMm4U2]
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <7c146af6-081f-4aed-b950-3397c3da7b90@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB0163:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7e9b34-52d3-4251-e3bd-08dbf4a99683
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qp43GjkL5MAdtdb2tBq+A3sSbdpOA7R/Uy8t5lPjt9p7WsNxUXy3dLNjnA79Gc+E2MiBP0VY1h0QqsL3twrjSzyXZfqcvINMgX0LhO0MxtdTX+Y0n5xcqezYbMZpB6SHyYtbHA9NEqc0vH7CLuwhmuBYuXTsPXqfEsUcCaZJqdWYXZcmEZB76saHCB5SwbVXnxwB1fNuf6aWahagQDG6MSCZx3zhCIUS6wzEN7fUY/lKESpxPoTMUJumK6zxHNkTPvuwf8lcFPEtLkfp7pIzsBsOBEpLqK8Ue1WlwqSo7Lv0W5OFJdpjXay9VByQzhJOTi9rNl7gRTrr6YKgimNM+bkQXWqasOUauvzONMQh7o6wUIINH+ePOAmxGmMveQef3hy2dSac88wiJXMEXlfjxhiCdLTaEmWDiWhse3Ipak22jnrrZbqFlpP6YVJhkwK1csJ8ztPVd7WYAx4VHWQERRDxHrbw+dbQL2U4pdt9mNWbokrITKd0dJH3cxTYnOPVH7c+Aon4cNXaC2d5KZlMPACk6nZ0HSh7kI9UASKN9IfUtjjJ2TUqsA2A1jXw2UfskmHcBtzsrmL9UZrcvJXkIsREH1ph7DB/mdFzupdEFoggOmyIF7E1idnoZed651oH
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2dkay82OGcyWjBvSDdyL0JwdVFSWFRXYmFUak9kUHJQU211d3NlTnI0WXUw?=
 =?utf-8?B?V1NuTWRqMm8vRWNZRFlXQkQ3Y3JKRVZpMXF3WE1FYVp3QXRlUkt1emhEMm5l?=
 =?utf-8?B?d0RnZ2svY2Ftb1RCWVVpQ0YwdFl1SVY0K0VPMVptbTk2Mnp5MEt1OXNiZ2N5?=
 =?utf-8?B?RmlzWUFjaDRYNEFINTFaNm9jWjExWE85NjdadWFwYXBwbmJrM2RDTGNIM0hW?=
 =?utf-8?B?dldrcEcxT3U1ZnMxL1p3aVFNOFNTeGZYYzdPL1lYQzl1cXF3WGxiWkhZVW43?=
 =?utf-8?B?QlFEek9SQXM3NDhvN0xBVUlOZXpvcW10b3RNWG1DTThPMzJxQ1hpWEltZHRq?=
 =?utf-8?B?YWFBTnNwSnJvT054U0pGeTRLQi9NdmlicTZSMGtGTHMyWE9lVk5wNDdlb1Rs?=
 =?utf-8?B?cmFxTnpXNFpEZ25id2E4UFU1QVF1MlcxV0szZVdhODBPNlM5UzNPcjVuWEVJ?=
 =?utf-8?B?YndRVkxKZ0JWREpDQzV5UUorNkdzUkY2bWdZL2hTckpaZEIwMy9OOG55d3pN?=
 =?utf-8?B?YW5RRVg1Wm93eDBxbjQ5cUhwbFdQT3VXbS9NZTNMcjd6aWhTNktENkMyWlI0?=
 =?utf-8?B?di9jbksvTWVOb2Ric2k0MEx0bFRIc1FpeU9pcEdoR0U0N3l4UzIwZVE4cW5w?=
 =?utf-8?B?RmFDeHFJdkdsT3p6a3gzL0ZDYmZudkd3bThOdXdWaHhzQkVuWlJhQzMzcUQy?=
 =?utf-8?B?Z3lWdjFYbzBqSG1nM0ZPMFJHdW9XYU1rRkxwZm9XY3ByaXlUWnNicHA3aC9H?=
 =?utf-8?B?dXRLNHAwTjNjOVNjTVE0ZzBjR2Y3YVdJamc2Vk5TMGgzbncrWEp4QVp6cWtB?=
 =?utf-8?B?c3BEL0JhMm9Ma0NFOUhyZHkvV0ZoL0szbXpZTjJIQ21vdW9QaENQRG9kdzZ1?=
 =?utf-8?B?aDVkK2RIcXpUNlV6aUFpUzZMdnFuWkJRbDFMWXpGUWRJaUNpZ2FhSTAxMTNQ?=
 =?utf-8?B?WjBJZWsyZDN0Y05qNkcxS1RNeC9QT1FTK1FzaURleVhNand4Ymt2c2lIY1ZC?=
 =?utf-8?B?ZFJwTGhjUUZTTW8rQTZMSytGSEp3WkJITGpJT2w2Y0dneFVuZk01VThZdVdq?=
 =?utf-8?B?MWFCV1hZbjJ1bS9QeW53ZkhjSTdrRHNyUUtCd1BGbGpBeEVOV08vaG95enRV?=
 =?utf-8?B?U2dad3h3Tkd6emlXQ1BDR2FNYk1RdkdBaXBNVk9Lejl5dWhEUHlUZVJKL2l5?=
 =?utf-8?B?ajN2QWY3T3pNbXNjQ2tmKytTT0cwZVprWXEyK25pOTR0QmxiampzeDdKVGJq?=
 =?utf-8?B?eTF3TmJTQjRmYSt2MldaTk5KNExKc3R6Z2trSko1cHZ6WjZsM1VGcUthcS9n?=
 =?utf-8?B?cmU5WHpkNk8rL0hTM2diZHNhdHpIQnAxUjc1Y1lzMW4yTFNvL1Bkc0RXR3Jr?=
 =?utf-8?B?R2xYOU5qcEgzcmsvOUxXakJBWFkyVFUwSUQxM2dTbFJwby9BRnNUQzQ1UCsz?=
 =?utf-8?B?bEtBa1FkVUF6bnFBNkE3QTNVdXg5ZU0yQW81RzZIa2hXcERDazZSNzlUMCto?=
 =?utf-8?B?cGlnWlp0b3hWRU9wOUpMVW9uVGFQYU5PdHkvVzRjV0FHdk5kN1lieXRVMXdu?=
 =?utf-8?B?Z0xlRjdqOEIzaE00Zy9sZ1J5QkV3dVI1eXViYTFTNzRRYWtZZHZTUTZYV2k4?=
 =?utf-8?Q?Q8I/Id9H2Ey4m4E1QSypUz4lwIbsULUFd0QvSEaBlyvc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7e9b34-52d3-4251-e3bd-08dbf4a99683
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:15:43.1305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_011607_364477_4CDBA1B7 
X-CRM114-Status: GOOD (  27.19  )
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


On 2023/12/4 7:32, Inochi Amaoto wrote:
>> On 2023/12/2 0:21, Conor Dooley wrote:
>>> On Fri, Dec 01, 2023 at 04:31:38PM +0800, Inochi Amaoto wrote:
>>>>> On Fri, Dec 01, 2023 at 09:02:59AM +0800, Inochi Amaoto wrote:
>>>>>>> On Fri, Dec 01, 2023 at 07:21:29AM +0800, Inochi Amaoto wrote:
>>>>>>>>> On Thu, 19 Oct 2023 07:18:00 +0800, Inochi Amaoto wrote:
>>>>>>>>>> Huashan Pi board is an embedded development platform based on the
>>>>>>>>>> CV1812H chip. Add minimal device tree files for this board.
>>>>>>>>>> Currently, it can boot to a basic shell.
>>>>>>>>>>
>>>>>>>>>> NOTE: this series is based on the Jisheng's Milk-V Duo patch.
>>>>>>>>>>
>>>>>>>>>> Link: https://en.sophgo.com/product/introduce/huashan.html
>>>>>>>>>> Link: https://en.sophgo.com/product/introduce/cv181xH.html
>>>>>>>>>> Link: https://lore.kernel.org/linux-riscv/20231006121449.721-1-jszhang@kernel.org/
>>>>>>>>>>
>>>>>>>>>> [...]
>>>>>>>>> Applied to riscv-dt-for-next, thanks! LMK if something looks not as
>>>>>>>>> expected.
>>>>>>>>>
>>>>>>>>> [1/7] dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
>>>>>>>>>        https://git.kernel.org/conor/c/21a34e63afcc
>>>>>>>>> [2/7] dt-bindings: timer: Add SOPHGO CV1812H clint
>>>>>>>>>        https://git.kernel.org/conor/c/06ea2a1968a9
>>>>>>>>> [3/7] dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
>>>>>>>>>        https://git.kernel.org/conor/c/d7b92027834e
>>>>>>>>> [4/7] riscv: dts: sophgo: Separate compatible specific for CV1800B soc
>>>>>>>>>        https://git.kernel.org/conor/c/5b5dce3951b2
>>>>>>>>> [5/7] riscv: dts: sophgo: cv18xx: Add gpio devices
>>>>>>>>>        https://git.kernel.org/conor/c/dd791b45c866
>>>>>>>>> [6/7] riscv: dts: sophgo: add initial CV1812H SoC device tree
>>>>>>>>>        https://git.kernel.org/conor/c/681ec684a741
>>>>>>>>> [7/7] riscv: dts: sophgo: add Huashan Pi board device tree
>>>>>>>>>        https://git.kernel.org/conor/c/2c36b0cfb408
>>>>>>>> Thanks for the confirmation. But I suggest to revert these patches.
>>>>>>>> Several days ago, Sophgo informed me that CV1810 series will be
>>>>>>>> renamed. And the Huashan Pi will switch to the chip with new name.
>>>>>>>> To avoid unnecessary conflict, please drop these patch and I will
>>>>>>>> prepare a new patch once the renamed chip is launched.
>>>>>>> This is a board that exists, that you (and possibly others) have, right?
>>>>>>>
>>>>>> Yes, of course.
>>>>> I dunno then. It sounds from your message that this is purely a rebrand
>>>>> of the SoCs,
>>>> IIRC, it is.
>>>> FYI, Chen and Chao. Maybe you know something more.
>>>>
>>>>> so since people already have these boards, I'd rather not.
>>>>> We should be able to support both since it's just a naming change,
>>>>> right?
>>>> I agree with this. If the above is true, we can just reuse the exists code
>>>> with a different compatible name, right?
>>> I think so? I'm not sure what the precedent really is for pure
>>> rebrandings of an SoC.
>>> I say for now, assume we can do that, and we can discuss it with Rob and
>>> Krzysztof when the time comes if there is no difference between the SoCs
>>> and boards.
>>>
>>> Cheers,
>>> Conor.
>> As far as I know, sophgo's SoC product names all start with "sg", while products starting with "cv" come from CVITEK (another chip company). CVITEK was acquired by sophgo a year ago, so now many SOC product names that originally started with "cv" are being repackaged and changed to start with "sg".
>>
>> For the cv1800b adopted by Duo, Sophgo has made it clear that it will not change its codename.
>>
>> But I heard that for other products, such as the cv1812h used by Huashanpi, sophgo may change their names in the future, but sophgo has not officially confirmed it yet. Looks like sophgo themselves are still in the process of digesting cv's products, ;)
>>
>> Since we have just started to support cv1812h and have not done much work yet, I suggest not to merge this patch into the mainline, and wait until there is clear news before doing this to avoid introducing unnecessary modifications later.
>>
> Hi Chen,
>
> There is a update for you. The cv1812h does not have the A53 core as the
> sg200x does. Maybe we should treat cv1812h as a trim of sg200x, not just
> a reband.
>
> According to this information, I suggest to preserve these code for
> cv1812h, it can make upstream the new soc eaiser. Also, adding a new
> compatible is not too hard, and it is necessary if we have new soc.
> Otherwise, the one with Huashan Pi now may be confused because it have
> a old version.

Thanks Inochi for your info, let's just preserve these code for huashan 
pi now and keep watching on what's going on then.

Regards,

Chen

>
>> Thanks,
>>
>> Chen
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
