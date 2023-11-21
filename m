Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C0DC54FB9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 05:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTdJAzIca1uf2x2fjbKPiES6aLFo9nA6OXoM3DwFlnQ=; b=N8+zemG/bzPpyCPjPnBZ9WRMfl
	LJTh+ydrjhKG8CWe8K8/JV9zCgG731yFWerMOjXLXkBwYGF9ntiBXG8K0R1kVBYCEaRxil7SLbLlM
	5uUWsu/j61YkLG7qRvdOnbA1uDyKSixhcCMt8CuGGT/swol6kZqt+/2xf3EfpoGYrrwSihL3inteu
	CkPzh2o1rRu1UautixX6vDBJseVVkuwWB38enKN7D0qZ5xuJbLbsyTYSYrsSDuQhylORpd343Ikba
	HgsU/lTozp7ePqFm0LS8XWUyIOI2IrkdNEV5Mcwz86PCc9gVYycBiSe6mlQUKL52GlAKozvtde1xt
	ymS+Sb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5JRf-00FhPr-0P;
	Tue, 21 Nov 2023 05:37:11 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5JRc-00FhP9-24
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 05:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTEYwPOQbrrmFF8D9TWX7AqS5BuTEk+8dXDgWmj0KwAXbXxTjmXEaz593yjRP+KuPgfOLzvOxJgKDM42ltaBSKOed6FnTHWXKcublt+KIM8FNdYOz+R0iQPToyI5QoXjF8M3N5gR/umRnXo1ZsKKM0TZC0JHH0sZ0fhSJNd6iFyaiGE/tSE1ymStwsNU8jYRUQ18d4dWjb8xHUgWOZ45UyyJ7Q12zXvH6vcwmEVk+EaDO5oWTxtqpZJy7xw1EIosJU63ep7hJZMLORENAjFxorOUn4MpIf9N4fWrwmO2OEb8pZkvoN+hkrBfo2shwS0P+97eem29J1QiC2rvQXjZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DCCkKvHvaH6ays5/2qMEgzlp2MMmXrTnh0zfZIwIGU=;
 b=PciXcvpFBCCf3joTvl1hnUK4Bdx14kTUr2m4RxD9dw0SZl44NvD+tAb31CgPEFzFgu8fVBOwQ5Rf6jBusXSQ6fZ000V0zkMuXoLXkBbh+gd0uKOh97sz1b1nzgowv8uiSxowS1RMnOp6GyDjseZ8vHKe1RuVkq9JEY1xFFdn0gcabOXIMsZAKQxLMItc4m9ty+5X42Q5eznautjkCgnbZOoQFcfsJmjbKZ85w8OZ70BPS+PPP6bA6uAcyOHC9V+tI60C91X9CJxsUyQakJM/deOqlNGpmdaTrr9GC2mYocjWokJDmfbgWqkRlzkhv3hKFQ2WIn5oXFArO9qVgZhP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DCCkKvHvaH6ays5/2qMEgzlp2MMmXrTnh0zfZIwIGU=;
 b=CUD/F7aATTKUbdQgzg2CHacIi7ZGgrbBsmPqnZkBVpQFyWd48bRyGvDLsq4KVraNIJ2Bt12cc2TYzxasWwehrGLR83Fc/BRzB0+uy/t3IKOz9Tkj8Wsgcxzheq310dJ2Tuo3nFuhPR3wsSw14ox6aBL/p2SbyIMFhrr50IU7nf+J5y4xR/kvNUQMTnjriD2C5VH9cXfniOTRGeLscn1BQCnyyQMzlH6tTTq1dZKToiRHdZ7ZbLTR4hUzaBZxqTFITNjWme5ljsCq/+RXIn6kZI/mfeNNmQmwtkPpEsnGdFmMtMa6fZKK036cWwxiM6Zt9Mg8j/dzB1EQTX8/w+TLog==
Received: from PN3P287MB0324.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d6::7) by
 MA0P287MB1708.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fe::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.28; Tue, 21 Nov 2023 05:22:28 +0000
Received: from PN3P287MB0324.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a24:3fd5:dd38:3ecd]) by PN3P287MB0324.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a24:3fd5:dd38:3ecd%4]) with mapi id 15.20.7002.026; Tue, 21 Nov 2023
 05:22:28 +0000
Message-ID: <PN3P287MB03244245A89689589995099FFEBBA@PN3P287MB0324.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 21 Nov 2023 13:22:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
To: Inochi Amaoto <inochiama@outlook.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup@brainfault.org>,
 Samuel Holland <samuel.holland@sifive.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [bmKQOqNJmyeenlMY9E6QKWpNWSoFhZ4P]
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To PN3P287MB0324.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:d6::7)
X-Microsoft-Original-Message-ID: <5a817899-3d86-4ff1-ac66-60d13ba095f3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB0324:EE_|MA0P287MB1708:EE_
X-MS-Office365-Filtering-Correlation-Id: d39f376f-617b-4f2a-1d72-08dbea51da19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UE4pyIOWDZagaLIeSfq7n1EqvkFwhlx4YvqYZU29B/Ay4edvMWTUsjDIvCusK/elee8S04lkeTPYda65mMV0IlZaV0PkPSDcqt78xT4dQsWt19nBZHmWF85cmd9C2ZPTe5M48IinzyNXAreLJQ8oXwiuqoTRQ/O8pEievr6mG/mPjX7Tp/4bPI2ayLrlyo/xAYXZ/rVq0f6BbAMC3rQp7FSodEqrwTfWtXYvXnDWQboYkrRfcEdbSq/gSB6i0wuTQ9LB4YpiQ/GTHXAUfLX8dtQd258JA7eE0eUFoKgFKQnXzKeWC4GwlSKQI1fzVWgKAwsM1cU07ASdhVfbdrXs5iYDvEFh1dyineMBl8JMNvkon6ofLqNi7Bwe10EWbE0rODriNLW9GPHhjKcV5aQljh+6UvT/FqZYcFDxnMMur3JT/F04m7uXtBUYq6gGcr+oLGWTz8UH44HZWpF87Iup9dxXHLz7dMIsZSf7K+t1QUK0orMvQUWQ1KfxyntT+fRcHxeQbliIdZZVh2BN67XruM3oR5LI1WyvBfB6t6IljlHR4P79VCIPp2xBvQl/V+vY0TC9y6D9QsXSVa2F6OkuTmCJCk8QhSCCUYdFMiR5u5lU1X9DGI6PfMmQxg2CrsCUhNCTjxCRH5rD+88IZdR8GQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S05QRVpGVk5zMDN6VWVTbHhKcHF3OTNOYlEraGtWN1loTXQvNTR0ellWV2pR?=
 =?utf-8?B?WWZodk91bFg3TXJrTU5uY2JjWFNRay9CWURya0NTUkZKVlZvaHJVVjhZQ2Ry?=
 =?utf-8?B?U1E4WWR4K0pQR05xZHRmOCszdXgwR0N5Skwxdnh6RmJVOWYvZC9SNDZhQVZs?=
 =?utf-8?B?bjJhUGFFbWwyR2xiYkNSczd0S3lFOHBTUFY3eU9GRi9JZkJ1cVpWeUhyNENE?=
 =?utf-8?B?Wkx4NFRFSk9sbitBMGJ0SnVwU1dLNTdtZG1WekRkYWRSUnVXY1ljd3NQV3pu?=
 =?utf-8?B?Ym56aVdRTStzdVBpSHN1KzUrTS9DeUxPUUI1OUF3Qm1uOFNXR011K1NvUE1V?=
 =?utf-8?B?VTJFV3NFbTNUb2FVR1VTb3B4OG10N01DSDZmTmc3d1dNa0tGN01lMkNOU21C?=
 =?utf-8?B?ckRSVllNWFR6MjZxWkNYWHhNOWhhUmh0R1FMVUZjZGpyMjY2V1ZTOFFma080?=
 =?utf-8?B?Yk5LNDdPSUszWnpHUy9UY1FEeGQrUUIvdDY3bUxXNm9TOUZpeGZwTmNMUTdT?=
 =?utf-8?B?cFVwemxxU1o5UmFCU3hSSVdpMnVwRkJEU1YvS1JqQ3pXVXAzL0x3b0VmYWcz?=
 =?utf-8?B?NEdGcWk0QzRIT1RxWk5YK1kybTA4dko1bFpPYzIrTUJsVjYrazhyUW5CTkZ5?=
 =?utf-8?B?N1VUS2s4UGVNOTFSRXdJT1lQRUVyNFJGSzRqazBaVEtQVGExUFE2RjA1RFF3?=
 =?utf-8?B?UzBvUTVicUZyeWNENkVqQW0rQnpYYk1EME5DaE43NnhydDBlVGh6S01KeTFZ?=
 =?utf-8?B?dHpIQkp2c1J6ZmFHanFlaFM4eGxGM2l5aVFqNUFxM1hISVhWZVhtR2NQWjlu?=
 =?utf-8?B?K0cyODIzNVlCMkduamZOQkt1ZTZ4enNpaGYvY3FwOWhPNk1KdWQxSE50ZzNU?=
 =?utf-8?B?bVptQWliM2R1eWgzby9qYXJRSzF6bHEwNm5OTFFDSzNtTXVLY3hFamlSNnRS?=
 =?utf-8?B?Qm5lOFZ4bkxXMVBOYTc5QllDWUpib1JjQS9Nbm5Ub0d4MnRpV3RONVU2TkFa?=
 =?utf-8?B?ai9vdksxSnYvR3IxN0hnUVZMZ1JaeFdsQ3lodm9TWi9PYU05ZUtzamlVdWVs?=
 =?utf-8?B?QytOcFVqdVZlR1ZRTUJEcElSKy84NjdxRE8xclpiNm4xUmtFcXk0SDdqcHBt?=
 =?utf-8?B?cXlibmdsOUxpS3RqbFdvam1KR2E4VmhHTms1ZndBazNaaWJtVnQ4cVdlRTN4?=
 =?utf-8?B?NE9uMEszUGJBdk9zSDNTNjZaa0xMWEMwY2N0VlFyYjdPLzU4ZnpvZmFaTUlD?=
 =?utf-8?B?S29DSWplYkp4c1VCdVpNZ1hXdzV2R3FSZVk0NTl3NXVlZ2Z1cmJ1bFlCTG55?=
 =?utf-8?B?U2poelB2S3VHc3VLQWtKbU1JTTh4ZXVQRTVGNElaY0lKKzBWVHdHMlhCLzBZ?=
 =?utf-8?B?VE1MTGdNYWJsMjFxNkcvS0xHd0pHcHA1SDBja2hyd2VKVjdLbnNmbjJ6YjRz?=
 =?utf-8?B?aU5jd2xIU3RNWDV3N2dkbkxSRDlrTFBsTFR6TmVXTXRkNWN4eXRsMGtkUzlN?=
 =?utf-8?B?VUh4THlJcTNTek4vd0hDNXQ3dThDTjRlMkxGYnduVHgrbW43dXFBNW1aSURv?=
 =?utf-8?B?OFFDMkpWd1AzeU9UWFlneXZDWlR1cnYraHlZaE9HUThDTUlXRXM4cGt3YVNU?=
 =?utf-8?Q?HuyqGKs7YgbOH6vJx3fXYMX3brgAAVXETeCqGuIaPoEo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39f376f-617b-4f2a-1d72-08dbea51da19
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB0324.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 05:22:28.0741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1708
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_213708_693729_195CE35B 
X-CRM114-Status: GOOD (  18.09  )
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


On 2023/11/18 15:10, Inochi Amaoto wrote:
> The timer registers of aclint don't follow the clint layout and can
> be mapped on any different offset. As sg2042 uses separated timer
> and mswi for its clint, it should follow the aclint spec and have
> separated registers.
>
> The previous patch introduced a new type of T-HEAD aclint timer which
> has clint timer layout. Although it has the clint timer layout, it
> should follow the aclint spec and uses the separated mtime and mtimecmp
> regs. So a ABI change is needed to make the timer fit the aclint spec.
>
> To make T-HEAD aclint timer more closer to the aclint spec, use
> regs-names to represent the mtimecmp register, which can avoid hack
> for unsupport mtime register of T-HEAD aclint timer.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT timer")
> Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005693.html
> Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
> ---
>   .../timer/thead,c900-aclint-mtimer.yaml       | 42 ++++++++++++++++++-
>   1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> index fbd235650e52..053488fb1286 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> @@ -17,7 +17,20 @@ properties:
>         - const: thead,c900-aclint-mtimer
>
>     reg:
> -    maxItems: 1
> +    oneOf:
> +      - items:
> +          - description: MTIME Registers
> +          - description: MTIMECMP Registers
> +      - items:
> +          - description: MTIMECMP Registers
> +
> +  reg-names:
> +    oneOf:
> +      - items:
> +          - const: mtime
> +          - const: mtimecmp
> +      - items:
> +          - const: mtimecmp
>
>     interrupts-extended:
>       minItems: 1
> @@ -28,8 +41,34 @@ additionalProperties: false
>   required:
>     - compatible
>     - reg
> +  - reg-names
>     - interrupts-extended
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: thead,c900-aclint-mtimer
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: MTIMECMP Registers
> +        reg-names:
> +          items:
> +            - const: mtimecmp
> +    else:
> +      properties:
> +        reg:
> +          items:
> +            - description: MTIME Registers
> +            - description: MTIMECMP Registers
> +        reg-names:
> +          items:
> +            - const: mtime
> +            - const: mtimecmp
> +
>   examples:
>     - |
>       timer@ac000000 {
> @@ -39,5 +78,6 @@ examples:
>                               <&cpu3intc 7>,
>                               <&cpu4intc 7>;
>         reg = <0xac000000 0x00010000>;
> +      reg-names = "mtimecmp";
>       };
>   ...
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> --
> 2.42.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
