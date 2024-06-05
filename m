Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DA7C27C55
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 03:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrk1bSwJhbaUlhj5MuzcvF5DUqKYnzXLWeTGL83ATvs=; b=jcf8JWv0u572F3
	Yo0Y098S26xTfNB9q6aXhHehS8GZ5M/v7E8mdXT98+NNDEQ/jjZpougR/moeaN0Nss2toyDhsqmVz
	Fl6KuxElcHglhMl7VhsWg+O94z7PvHwr7G1o3nN1oWjhH2ue0ALtYt7cV14tBHFIRxjHDpRx6D1Of
	wPRZSxc+i78difTLB7XNQkEUJNZwT8mqGOfRQjZ409wlHvvn0hok36hTpY5CI7nX565CTb9AQ9XbA
	S73E0pD7dInD5Wrww4Hx/K0HIcQVMXVUdhOgfY9An6+O2FDx6c7kqsxfsshOtxsQDxIy6wh0ykASP
	Ze/Muk0Z4sFtR+3IEMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEhWN-00000004YOT-2CG1;
	Wed, 05 Jun 2024 03:41:07 +0000
Received: from mail-bn7nam10olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2804::800] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEhWJ-00000004YNW-2JMv
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 03:41:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ2cmhgH8EVPcoqqKQAXkf7rZ5RTzKuUt7AvrVAOV8LLyrq953D5y8nBpWZ1At5MvncoS5O+Kxiq/603Hg6fPOx1uVDjemYCwBwhnkWsLpE/Amiqp8rCr9fSgIpCH40O59N+Hf6TekPgIEEIlM2vChJB3IRvvNbX2e8b/aGeg399ejRrpKU+YEn7OqfzUAkrp1gsPRJRvWmR/6OtEqnloaq/N6YZN+9h2SbEgoPipDJkjx9QjVzeznUBOHzQeNpDpTG6Wsw7Eue3rGCxYzubmre7Pzpe+67wE27/iOVh9XaIu2cz+fYD7CmW+Y5qwhjOKMafIRXUIceKYcOeP1lhtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13h8JSv8C+aryVss/0R1vLSvXBCAiRRR5+4CaHK7GIw=;
 b=E+Tr6kk5WqcopE7imSzvaPYtxEpk0F/bLkPC/qLpBL+wIpjErz+XYUItjLuQOhhd4UxOGCP9YXedAoJWKIlT+IMnGkFyatHAEfc8TOCdUcKijV3BJZSVwS/N3Ok/2yWoOnwD0/keZC6Px+f8PGXPMHrIIfyKmnQ/hBxxQTykSz6D9S37fuMdzyYLaYZE1rfhcfY2keUi6N1rxJyLjkO8AbL/i9ORXonEZtXZXtt0QKcdFfoIMmihhF3fbQOjP4sk66cJNhUCwvp1N3Z0SFYiDb/odZgq/A3UxwVcv2VDVYXPBCCPSNSfhyX1YBeR51KrImd/vglquy5D7IXcfG9i1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13h8JSv8C+aryVss/0R1vLSvXBCAiRRR5+4CaHK7GIw=;
 b=Wc+ugUzKVfSPFQeEjpVx0o0q6GPX6QOI6HP+vkT9UNXwi+hiw5h+10b73r1v209no2La6f3fpbYz77AYX4G8aKMmZpiRckWsT28w8z+Wk9ydrX2vrgc2UJTIOUXW0f2CreAHczYMW9ANkyYZ4/kTnhVHdcCrcLJGv4PlnHKkOhtoKgpaLqckODGCzwe3xGrrOJ4NPuuVCDN/9lfBvAUMgiET998tb084kUIYNLg9UH4Uyx+jQ8beFabhiH9obtYPOM84GzvtBZzelGCVfBdMSeqm6yyRCM0TyKSx/OfZhbO0A+uhmUFIiU6K94zspF/gqf+ba0jrznTEyk8LqPvUiQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ2PR20MB7106.namprd20.prod.outlook.com (2603:10b6:a03:568::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 03:40:55 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 03:40:55 +0000
Date: Wed, 5 Jun 2024 11:40:32 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Haylen Chu <heylenay@outlook.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: sophgo,cv180x-thermal: Add
 Sophgo CV180x thermal
Message-ID: <IA1PR20MB49531F55C8D7DC5D0050CAF9BBF92@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <SG2PR01MB4218013241B3EED779D3BAE8D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
 <SG2PR01MB42189977B4172405F5704CC4D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
Content-Disposition: inline
In-Reply-To: <SG2PR01MB42189977B4172405F5704CC4D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
X-TMN: [8ekmFjTTmlPllXHjrSEc46WFV6AEi36InaF0FevdR+I=]
X-ClientProxiedBy: PU1PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:803:2a::26) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <3jrgrutu53rpi56nxjjxwd2uyqxht7u3t6razcellfqupjfpnl@doo6nmag2qcs>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ2PR20MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: a3031572-d67b-4530-6684-08dc85114e0f
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|1602099003|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info: osITZA57Ve2iY89ytYx8uu3dq1KlurkoU4ZmAOrsvXzbdXUnKIi+2B5k5NCcGY45OMj9EXGn334e2GcRfaQsQlDKxdwmzU+Jl1fEIKWOpzGbJUjffriGbB4Kdw81CgFuQmu9Wll7N8szF4MqJRuzsaDsE9rz9ZRo+a7n34w9wzNSD+0bcmLyhJvFhmWjm43AOvGmHPuyde2tl7t+9F0NByxyZro1oV5MxDRNrjRnJVG2fUkC70EPtRpi2IOiMQQDZ+2KHoiYAMM6J0RJZwrJBbtrPh5C50LPvHMgiVAtRr2uwIIgTY42bdF79qY2qeLgrNWs4xkghnlV7Si+NMmCU4CHry5nzNj7PfUec6sGaTCYyEH9nP0/rVU8JXBMmn8TWRZiVMqVOpJjCaHCnmz3eF9GzEj6B4wmO+YymL/jJ6VeidUpbjV3FRpJ8ZqPPkSkvfWx2+6aCLohEg+C7Inw2vwNJdUzlpj4/f1KcmHq1S9yJJ16Fz1kNW5RgfuYnUDC1tX+/OVTjmwEP+DhBZRixcFPp1f9uPVt079DgyEPr3ABrTzRC0hfXO8jWoVRAIV8Lrpbio5XgWwEWUh9NK5CcSeeX9IJejIKcJOot7J4htYG0j1oe4EdrOWOFZX07qR6+/mKTJS7LIEGlMQ3QV8K0BVP2kjvLA2xewpkiT3YpUzoJWbjtK0ZozNVI11svYX4EKVgMWKi+r5oN4KhClPNYQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZvYCtHjqq8m8rNIXHzcHrg4XYmup3MMcUwySpBrihuWSaj4S3nE+/oDta1gS?=
 =?us-ascii?Q?9fxvDTIZ/7YknnJ9+z/PgzDJOIPjkLaWOH9VIDbrdfRIovTqDy3OAw1NpUnH?=
 =?us-ascii?Q?syFlVst3i2hi3wdBm68A1rqPRrXtpvhpS7vM0+x3yqW+9jlubNqRemQTW8xR?=
 =?us-ascii?Q?gBd/fILaacj7GXHTGJ3TUS00IFtun0c9acJL5ftGT3ErhYY+K0JRlIh6D/+B?=
 =?us-ascii?Q?tR9jp3waVTON+3XKNtALdRW7+Ecj5YaLicJ3YeUaZIfQocxWotAH1jOfvG2E?=
 =?us-ascii?Q?XehYdh22PIio2BY3KMQssT68QV8x2l557wl9VWSSS3w6HXMhwAMhZlfTTOLs?=
 =?us-ascii?Q?MBGVxjDt2k6QQYCUJkRAfldu85TIbJyKbVadCU3BmcCPhJ0vdwclccvcOezG?=
 =?us-ascii?Q?gp2wBpA3TgP1YwrE2F/6bel1OR1w7vUff8ipDZvvIStbfGQSYbxllNGfL+NL?=
 =?us-ascii?Q?xQrzp+PnlQJusPloswGq1oO5tP1fU7fHQepuebjR8DXUEy3YxvoyQmuKtq/D?=
 =?us-ascii?Q?Lh8h8Ctnh7+80MCGKHRsh9GloBRwhU0aYkqiiRgRnj6/xH+ebSHSDIy0ivqA?=
 =?us-ascii?Q?kX5bjORMXwU/y5pp+53DrdXFYySs+3/0mCOHoyGqB77U3YIUuQgJcEEUI5A5?=
 =?us-ascii?Q?ju2LZxdMiSmXGqZHKlYA+4/G7xuhJ5EBbqGECTECDjyZ4aWTzUZ1bCG+wAEm?=
 =?us-ascii?Q?8nTs8owfjF8ILXxPytzmrGpNu9ZHVHSFRB5q7i4O5Dn6r8GLvmUN9YPdRUYd?=
 =?us-ascii?Q?zGv13tSV2FWn7Od2cgt47M7lTDyFaNpjZxzx6XvKCmkK25oRd1Po/LUtOKd+?=
 =?us-ascii?Q?x+lIBk4Pb5a6zbPiLNjfrOA5wHrz5XtnhsFeA4bVK7iM48GWCnIJEACdNW8t?=
 =?us-ascii?Q?RSTJboOWI3anVvPeDxffV3vpk6exPSOF5K5YzTLccqEefvc6AzAmOgbosNuJ?=
 =?us-ascii?Q?jt0QiN7rjxdGExhrKaP745SlGktwMzNB1hJUKXz51bRPRtkJl+/2DY3m7PuV?=
 =?us-ascii?Q?ebhZVqgY3ufipNBYx2qxoizmWDD97yepU7whdDwfwd3weLDA050u6S5zkD+j?=
 =?us-ascii?Q?mHzp3JIhiKHise/7ln5IyxQ0ykey4CNlh6rCaCPmTrVH1uRUPW5ddfF9QET4?=
 =?us-ascii?Q?4l44hs7HKAE9IcZ0+ix/KCEOO/AEhFjYSNExzmBo3XttAw3Xn7PEGkk16x1k?=
 =?us-ascii?Q?RkfmqNYw5loTotWsQJJal1Lo53xmhhJ5CQw06GP/QVzkHLZZxlNlaa8A/uhr?=
 =?us-ascii?Q?ftm/HdJCbSH3LcFPkkcq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3031572-d67b-4530-6684-08dc85114e0f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 03:40:55.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB7106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_204103_628084_6758BC3A 
X-CRM114-Status: GOOD (  16.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 04, 2024 at 12:54:19PM GMT, Haylen Chu wrote:
> Add devicetree binding documentation for thermal sensors integrated in
> Sophgo CV180X SoCs.
> 
> Signed-off-by: Haylen Chu <heylenay@outlook.com>
> ---
>  .../thermal/sophgo,cv180x-thermal.yaml        | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml
> new file mode 100644
> index 000000000000..1c3a6f74ff1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/sophgo,cv180x-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV180x on-SoC Thermal Sensor
> +
> +maintainers:
> +  - Haylen Chu <heylenay@outlook.com>
> +
> +description: Binding for Sophgo CV180x on-SoC thermal sensor
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800-thermal
> +      - sophgo,cv180x-thermal
> +

Is this necessary? I don't find any change between the sensor of these.

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: The thermal sensor clock
> +
> +  clock-names:
> +    const: clk_tempsen
> +
> +  accumulation-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Accumulation period for a sample
> +    oneOf:
> +      - const: 0
> +        description: 512 ticks
> +      - const: 1
> +        description: 1024 ticks
> +      - const: 2
> +        description: 2048 ticks
> +      - const: 3
> +        description: 4096 ticks
> +    default: 2
> +
> +  chop-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ADC chop period
> +    oneOf:
> +      - const: 0
> +        description: 128 ticks
> +      - const: 1
> +        description: 256 ticks
> +      - const: 2
> +        description: 512 ticks
> +      - const: 3
> +        description: 1024 ticks
> +    default: 3
> +
> +  sample-cycle-us:
> +    description: Period between samples
> +    default: 1000000
> +
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/clock/sophgo,cv1800.h>
> +        thermal-sensor@30e0000 {
> +            compatible = "sophgo,cv180x-thermal";
> +            reg = <0x30e0000 0x100>;
> +            clocks = <&clk CLK_TEMPSEN>;
> +            clock-names = "clk_tempsen";
> +            #thermal-sensor-cells = <0>;
> +        };
> +...

Where is the interrupt number? The sensors does support the interrupt,
but I don't see you describe it in the binding.

> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
