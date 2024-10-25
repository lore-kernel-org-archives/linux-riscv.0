Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D48D1171E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIx/p25yinJQmtj3GFHtDmgP8/2L3Ep3qtKjnYEDTn8=; b=0kATVAYwMLAV0QElpFRIcK9Jxr
	xOQeLD4TW8HtrpZgHqRNDPTzPzZScwWvNCuGX8mb/lgFRSOlYSoPYONXN8YKJTTz8UyVlqRS/IH0u
	UTUXEo5DD8mQoSBy31FtezY6vuNslWjQ5u1gMURm8koQStOrNbtHwiBP/jpIGf7k2tPswOEPGG+XY
	dguHiWewJB+ht0FruJhjvt2PpgRhFdwXHM/mXKnfJtJ4YpESvpj8pqvgrr6O9icNB6fASvewTz/VG
	F1GGvEtNHK9i65UCXEEWpaUNQqgPaCA2uUT1mCcVl+6zJa3c59I/n1tydaNTuJ6GjeyMgc/7SxmIA
	DgbY/Krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FUT-00000002x6E-49LU;
	Fri, 25 Oct 2024 08:16:13 +0000
Received: from mail-bmxind01olkn2042.outbound.protection.outlook.com ([40.92.103.42] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FQo-00000002wTy-2vKP
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 08:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcTy3cyDXhcOJ7fYe4yb0DtIgema2FVPGOrXOukBgqvm1UvOfmXqkR4Ig3BKc777ebYjix/ZFh1tS5dIc3eNCUZfX1DMoDwiHyJYeauh5J66mP6rLsmR9+ha0YYTfWiKoYvwyrCUOSQ6QBFHsg+75tPNgh7UsngnJPlsYodwugUx8P1AJcNlOH+EQWfupcPT+s6oTclEXeH0e01AKdRuNmM8+6uvNkHH145a/QDQBcrKXnFznp5xHdnEvfD92bt+zXu4cvGqdWT6SqbiSGrgR+qG2tRUop+GQ57L80w8o7hO/GoRjDP/ja+wWLH/PNDTrgSEtL1QMCntkzCO/80FnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X/OXF6+qrnaSno78nqFrndVT+kkqeZgUMF2pExK7xY=;
 b=tvILoz79qXxvCccaQQIEvkTwH7oB/QQTGEolaahPru9Y2z0z6WzBZSbWk10cIVfexeSHE1iIiAT1n5+6zPE4G7rIIcK9WkRppZlgrB3o5CNaj2VuxA6DJCyx3z35mEsnLxZwZO2DJswkiSjFFer1ZsESRiLWLXwPQPzu9uCwjXVfxOM5wopvuL17zNXFaaep3GHl7m5fq+PFGbYLNlKtHgKeWgl8QjcRl8sGhWD8pez54bfk6P0SspzwwRPiEQGeSKbV4ZGyx8MjGuQZdQ39b8q1Dj7hOdeHHCuvS/c4pR+3t47m98y73RmxUZjLmMVZqz8IEGvEwm4CqzD6fNGetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9X/OXF6+qrnaSno78nqFrndVT+kkqeZgUMF2pExK7xY=;
 b=oL9hv7Wy62QfaJ7iGjE+9fRgS9xa8Aj4foBJub715DJDGqKkPs4xaAX62HhgnH2YdWGUPEwtcZsgtLdO2Q8uW2Cd3NAbXsZgGq85jHbiTzyc/7Qbij7f69ciNn1KuwMF+qlABJywfTmqTKWoh2k4ahd7aTfupHxyXA7BKCxcVbTDtH7JhTbMDHhGrvld6oMuSZQCKzepPAHVPjBXMnv1vjSmtT7NlhfSBGV/0iOspA6Xz2K9Qfo2Rg1U85iFHH2ykg5xnZmpFMwbz7T7zfialibIsEksQIouuPxrAPRzTe4Lwy7Y7XnsIKz6xKw9gQ/Mqzb4kLVpfZCCt3K7gkbC1g==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0712.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 08:11:23 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 08:11:23 +0000
Message-ID: <MA0P287MB2822127FBFCCE72631154EE6FE4F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 25 Oct 2024 16:11:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 SG2042
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chen Wang <unicornxw@gmail.com>, ukleinek@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 chunzhi.lin@sophgo.com
References: <cover.1729843087.git.unicorn_wang@outlook.com>
 <9f9a31a2a19c2743aea36c479b0dc32da0fec629.1729843087.git.unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <9f9a31a2a19c2743aea36c479b0dc32da0fec629.1729843087.git.unicorn_wang@outlook.com>
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <5f336803-5f98-4990-a51c-9e37550b8e73@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0712:EE_
X-MS-Office365-Filtering-Correlation-Id: d927b394-9cb4-4024-eb91-08dcf4cc9d52
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|19110799003|6090799003|8060799006|15080799006|461199028|7092599003|4302099013|3412199025|440099028|10035399004|1602099012;
X-Microsoft-Antispam-Message-Info: Oly0We03izczNXRR3k/+rlpsdh3vTMx8tcf5awmbi0aXUhBIrzw9tuV4gXNuONgMEc9q5woKEcxECl8L9nmr2bxzBUzjdvC+a3uRDx+ojQ47DBMjMm1NgYk2oySrg9qLyZ4d4ZKRrtQCNAG/nGj4OChg90krDUjJRxlaXS4LTH9cCwfz12A97h6ObZ9lTchTAKqafZFICBix7dwND9jVvapqcz36aZv3Iez1rXU9BGQgfzhbwEbR7FLSGaqQICF74Vt9A0Ly+FVirx7GR4OsvfcwaZkaNXP/EoLfW/aEh/1Ubt+PmZmLywyQxodiLjKRCgf8fvL/HucdLY6VbnwxtnNRsx+fPiyvjijKwlK3vOPEo6RjgVzSwP/z7Y92BznOKhJcNuwMlOA8GZq08zruVODDF0uG3BSj4lqxovqC5ihbhamt5PIPS45705fzav5nySdUi8umkgQCKIfPql7geTg4zEGACAdg44BXlhVWn0+1lnYilKUyzLsadIKF4WvwPclC/QV8yWiFWFv03pfvLNpc3F55QU59oxC1UK2uEWSc2ta69rgSnKNf1w/PI17DATOYenwzjBZCKxLZ0I3G6QU8dJFk4s6FhhUTHelQd/1ijgnt5b1D5o2boqRKE26NCyjAwqs0V5DoE2IGlLoMBCacEUrJuAW7/A9b+3OgA4euxGndmB5Z4c0mWFrszumhbiL1ivsQksliEiEWtkIsWE7dQ9LAYKC1PFFSxwhb7pF9TxHQMV1PMUFibpIYYKqSK0DCSY6Ukr8IIKpOPGYfupCMCjVdUFo1ULqGhMBZ7lrfw/E1dDsfSPBwWAQlhe9JgPoQaj2TgNabyefpQFoRw7q+2QVZ2Z+iRxzJXw6mVfaX+OxhXJgUPSK0JK8d6sQ2yAxOi81zGwYIELfoTjHwtCkZ1h390jEWttN0pkYlLU8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdKck5PTGdlSTRoMDJXNjFvbXdWZ2xpMVdHcWpxdVFtQStnWGNkK3NpeXNm?=
 =?utf-8?B?Y3d0UDN0aDlCV2RxRTBkTkdzSU1sRzM0WnFJOUIrM1hSZmZRc0tDOWlwWTZR?=
 =?utf-8?B?YkV2WlFPS21OdTRBZktuajZZZlBNa1VIdDZXRDNkY2o2bWtpREJsVGEzMExy?=
 =?utf-8?B?NjgxcTZiRjk5NnVvSVRrRGVyRFZoZkVPR0RaU3VNSU9hTUNlUm5LVWp2VGs0?=
 =?utf-8?B?OVpOQUZFNkxZNmNrZmpEdmQxNlRNMTlLY1c2QTRQd2JwNk94WkNocG40T3dE?=
 =?utf-8?B?NWR1TGY2LzJWZEpvLzdESFNEU2hFTUdxNXZFVW1sNFpibnJPc2MzVGJLQlBX?=
 =?utf-8?B?NHErSEdsYWc2V0tkWU5WcmVUUlp1NFlpS3NySlVSV29pN2s5V2RDcjhMRXZk?=
 =?utf-8?B?OWxjNXpCZWJtN3RudjEwTjJqOHdFMUs5cU5lb1VzTVo3T3JZS010SmVSdE8y?=
 =?utf-8?B?OEFob1k2MTJmWjVEQ3pXbHhFeUpTTHNlaFhjaUEweE1WTHRsQ3cwYmJLdjJv?=
 =?utf-8?B?NnMvUksyWmxQNkd3ZUVDTnN6T1l5M2NqUXNFUWNzZGhEeG55aUFlbHp6dXhu?=
 =?utf-8?B?YjhZTlk4U25teFhMRVo4UGd0QTVhNWxvYURBdkFpS2hMdm5GWFdlWHNnS3NF?=
 =?utf-8?B?KzR2cnJCSCt3d1h5WnNFekY1S2xGZE4xeHdRaHRUZ3U1TDJkMHB5SUh1M25w?=
 =?utf-8?B?ZHhtNUV6a3FtNW1JWWV1aGthMmpCWExRdi9wa1ZRa1ExYmFhR25BazMyeVVo?=
 =?utf-8?B?blhQRFB3eUJTWEZ5S1hON3FtOG02YWYzUzVweEx0ZG1tdWJNQ3AxQTU1emRv?=
 =?utf-8?B?cEVwUERYc1N2d2xrYzg0NmNCcVNOem95K3U3OWk0S2J3OC9Bd2pXSFVuRk1o?=
 =?utf-8?B?M1NIQU1BNGlMVElRMkx1U3FOYTFVdkdFUXBIRGdQOUJIRzlacjZOS1JKMEtn?=
 =?utf-8?B?TDRHRmpqbWhqQ1VUNytHOEJwU0tqWHU2aUxuRGFVSmtFL0ptOFpQUDNRZHRN?=
 =?utf-8?B?ejdCSGwvelg0VEtUOFFCZXBTT3lrR1QvaS9ENU84YmNPem8yeE5QbXpNaUYx?=
 =?utf-8?B?WlpLZytPRTVTV2diZ2ExMk95aGxxcGtha04yOWpPQXZrMHNxZ1RHUW9TcGJU?=
 =?utf-8?B?WEtISFI1ekR2QmZYZGtjSFVDbGN1Z2ExMnVoZW9LT3lYNE9Id084SkdSWDFL?=
 =?utf-8?B?dVV5WkN1QUNyZUtOY0lMQUtIa21ZaVhJVm8yRjJZSkoweWZLNG42VUovOXpH?=
 =?utf-8?B?MWc4TTdmbWJtQlMwSmVkTTg4enp2VFhUVlFYTThnOWdRaGZzdUkxOUx4TVVY?=
 =?utf-8?B?eGdxaHlyQzljR0UyUkdVT2NiMG9FcUdDQkNSMHNBN2NJNFQ1RjlOSFg4dmZY?=
 =?utf-8?B?eVpEYkdQUTYzZGt4SllhdWhsM3pYOFJZS0lNMkhMYVlzUkROYXBmeittQjhL?=
 =?utf-8?B?SElwbzhqQkh1OXFtKzRqZ1ZybmNBeEpsZlJuSmxoRXdMNDRwRVZIRTFCU3k0?=
 =?utf-8?B?RVRRaDZFRWZ4TTd6bC9jelZ4VzhqNmlXaG5HYmdLUFhGN0xhWnJ2MnVmQlh1?=
 =?utf-8?B?R29LU013T0pibEVrZVgwYW1hd291NkZ6eVZqeGFXRnIxaHU0KzRqb2padVBV?=
 =?utf-8?B?K05pME81MWg0b042dm5WZ09wSVdtVDA1c05XMGJURVk0MTdMZFJBRGxrSlU0?=
 =?utf-8?Q?UnDoH/Gqfh3kIqtkWQ2f?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d927b394-9cb4-4024-eb91-08dcf4cc9d52
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 08:11:23.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_011226_764591_4C5968A4 
X-CRM114-Status: GOOD (  12.83  )
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

Hi, Krzysztof,

Since the changes are minor compared to v4, I have kept your signature. 
If you find any problem, please let me know.

Thanks,

Chen

On 2024/10/25 16:07, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>
> Sophgo SG2042 contains a PWM controller, which has 4 channels and
> can generate PWM waveforms output.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 58 +++++++++++++++++++
>   1 file changed, 58 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
>
> diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> new file mode 100644
> index 000000000000..5dea41fa4c44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 PWM controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description:
> +  This controller contains 4 channels which can generate PWM waveforms.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/sophgo,sg2042-reset.h>
> +
> +    pwm@7f006000 {
> +        compatible = "sophgo,sg2042-pwm";
> +        reg = <0x7f006000 0x1000>;
> +        #pwm-cells = <2>;
> +        clocks = <&clock 67>;
> +        clock-names = "apb";
> +        resets = <&rstgen RST_PWM>;
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
