Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748CBCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmFt7wZ92muk+qP6/usAdi4ldWhanc9D5PK7CYFLeS0=; b=tGI9PyIJMqi9Ux
	CGpBO3TfNUeRjt5B7cx9M7Dmh6BH5r1e6YpS2iJ5COIHcQ5eXO4bUmLh9FyramhydnBr1p3cIqcJ4
	LmonvWQKDAbKMwN9WFFPqvJw3xIG4wRIP529+FMeQ16wlVKnWhXM0ovrF6R8OpEOSJZSgb5+/8FHI
	ZyyH3AZdn3Fn/WarcnPDBAiLwRfwu52ubeBtPUg84waSyvbVqNFm4Prx7zeL3ve5iiAL6jwY7gClG
	9WaSvZUG2AQVzsyAJDERTHYK0kGkD0nbG6lZan2a0KhITTqVidgb7n0qlJiZrHyh3I/Oz+LUyd6En
	7ljjk/gP8S6Y4LxDo/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qitCV-002PsX-2V;
	Wed, 20 Sep 2023 09:08:51 +0000
Received: from mail-bn8nam12olkn2082e.outbound.protection.outlook.com ([2a01:111:f400:fe5b::82e] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitCS-002PrQ-2g
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 09:08:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLdflFnR+HPuoBI2nCvJ7yB2qrBpdolWECdNw7Omay0+JDj66ilP/wRbgKGPNP4VbjBFO1Q0hREIAKEFC/rK3bS03PDzvhP3puGeV00+kfJpyCVK+GIbZ5ZEathtnH4+BgbUVy8ZhGyamvrFJX8r7ctmcOHxpCeqtOWPUeTTWSqwgBJBgeYxf82DjEPSZvBh2sKsmPOANTAXh9LmPlJ6IpIt5aDj38V9l2HCRzAu7R+IAnqrMSvs8C96dblHzQLISkkxgoHBFQ2qU8X0n1evJj6Gdkout1DWpGE3rIP5+fqcX3y9L9xUFRy+vtR6Qbh/yV1MY8vYmy/Gl32dJ40pzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2004DzGeC6coQZs3AHp6ktsDp/xDwNg1yLk1bVQjHc=;
 b=J5THhALUK+3hBuAVeyGwY5Eiws8kGLBnGj899aezYhnYJlnqw6S0fMLnIJJEbAPcl+zOKEsOnTDTbnJoXpzuO2a5vf2orIy1vo+2uvtG3zas/Tw7bMofe+aYLQGIrfZL/DP7V8ESbAU2MKIgXQV5OLMyfzXCzLaonFAekHCxWsMlcWNtTZVZomsemNqqHV4c5G/7nqZQHewKqqbdUmj343csDYW2iyGXvGy/xT/Z8/dUBBfTiQE4FG2aokdlRbgOKznuxgNJN41MFODpAMgwLgMHCJ48YtctHEfsrkpenOwGOac/E+Ivplr6Dvb6ezXhxmLc3GCAMMrqxJuhSyHfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2004DzGeC6coQZs3AHp6ktsDp/xDwNg1yLk1bVQjHc=;
 b=cU3VD3KRgbVFaClwgkNZ6m+BuIusaZN79NpOktKajMMaDGKy1jVoeH/hFFtYHDK2tAjCeJSmw5YGyGOR2n+J0pA5w2+mIUik278gz0hdIHEFHLQ/GTb6+j3qJ4IEwHG2pS2Lqnk5WsVLkVR4KOMCGy0kmMq0rx3lXc2wIrGi9d84JAl4beQ8i/rgPw+3Q6UR5ZRRbA49Riz+Zifx6RmENZgkKivXQDCINNRxucQ6PkxQWwM6PeOlnDkxqmskH8roP14vX0mfKSwzG5RGS4EIDoI6UEviUDoorYuNQqpm8V6s7lD16Xzdt32c8Xibs0XwBjSW3N2WjiPv1Gbz1RPHlw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MN0PR20MB4569.namprd20.prod.outlook.com (2603:10b6:208:370::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 09:08:44 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 09:08:44 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	evicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	Chen Wang <wangchen20@iscas.ac.cn>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Date: Wed, 20 Sep 2023 17:08:41 +0800
Message-ID: <IA1PR20MB4953F5FB42B8CAE4BEAC924CBBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920-recount-chili-f80d5dc125e8@wendy>
References: <20230920-recount-chili-f80d5dc125e8@wendy>
X-TMN: [6Q2zstPR51trXKoDeA1bqLlhs5D990e5INgqLupg+as=]
X-ClientProxiedBy: TYCPR01CA0103.jpnprd01.prod.outlook.com
 (2603:1096:405:4::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20230920090841.143561-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MN0PR20MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: f51d9027-db6d-4f0a-a739-08dbb9b930e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6yhcb6RxKGB3nOhZH6MnC8Ji6TxBs/E/vArEtdK60Y4WnnENKfXgeiefJBsFsRiDOXzlUF41kOj/tteZex2qcWuU8ufSbO36zUTLvxMBtPbG0HTEVUjM9ZjQgvXazkKmi1W5EyAC2ZPCfsCdl9mCCTpV7FjMgAWuucopk/jWUfMORVQ79dIJphSLYg476UpsaJ6cvTsQ8IlQzsVy2GKYNti8Hb1BsHi0nJ3NAheOkk2Sou5xQYxaV+XmNvpZe4dqMX0bs9uScHDzYV+Tmi+eI7Ajh3QaKJCanQWL0M/P0S5tcUkDnoFZwmsJlHYM4d+xPVybaepUo8iaa579rw/LzepApTcHm/kbUYmeZK+LVeu3/pTRxVBz7KE4OoqLoQkJwqzwh6VdFkty8Fzm6hDynmtdOKZxe16bWDVSCHbF1YkfKTXfAhCMSMyjz2aMGMmSd6coSZA6tXnz0rTWkxYsrOMxLrxIpZmBTEcPvcFVPkfIQFEh3rD2MiN0YeDsPKcgJWwlwgUsyak9r5ruCtcXarp+bouDpGR/7BLfVgC4bztZUFxReEW23YwESSO7g1HheB48XXxgMQSWTI5DoXd3YHa6Y15kilgA7TSyB0QXrvqG4U6gbrQxbY2dAxjm1dkj
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oz/xRaV5x3cRVUMBsUb6edIWVN9cqvsncslYM0ttP2XWVdjS4f3T6kmwFpAj?=
 =?us-ascii?Q?sofRhxWKeGeoNwf+82HyX2sePIu8IwIuaGRF4NY17wuqqcVGyO7DVOdPzQ1B?=
 =?us-ascii?Q?d8ErIV/1ert8GfKzT89OyZUo9Qvws3Llf40v4veJwTcmwlrR6RAqnymaZ+13?=
 =?us-ascii?Q?Jic+MyHgkOu4vhrdvj/khLR0HI8AwjW+3PzHPOXgu3FIJl909ikDxqYhsTyT?=
 =?us-ascii?Q?SSx8DWQqWtdRU12VFiUDThnuO7vPk7o8ELyMQByo1585LVeBV/52VS+EcGK7?=
 =?us-ascii?Q?KikBeuTmpTAmrqlka+SastOqWi7FjO3OpbrE0MEvImCs9aVpEBXBnyL2/kip?=
 =?us-ascii?Q?5TFRLU4s74cfObXe17rqU/t8sDEaOJUXcl4mwuQk0BCb5SO6QoyOElEyXsQ6?=
 =?us-ascii?Q?o80ALpcG4pxLqqpXKsPkcOgHS7x2+OUbqVSUL+GUWxaTHONG+tF91WRCYeUe?=
 =?us-ascii?Q?PxwYBcipxTuj2EBNlFHVvWxa/2Fmqac04qLg1P0F7QNnI3xEJwAohTeikejO?=
 =?us-ascii?Q?sUBK53GWOblrh12ezTsEoEbpDO0bxta49nfbfh5+1f7QoStxhLZ2gKFh1axb?=
 =?us-ascii?Q?RMxPPIT7DuzIX4mo9v9tDR5nJDRGh3J/dwOcM6PcIZ3MPUNg921cQYTTKLZI?=
 =?us-ascii?Q?srx25C67L1S++SQyUffQ1c+D0YrkGbBaInb203WJ2rQbezPHvtNOGBdTv7IX?=
 =?us-ascii?Q?CdImhKm7ZNJwFeydk/8NRrN4eteE7UIPhnx5Xbb7QUJYielJyCB29p+ngu3m?=
 =?us-ascii?Q?7nmqwFlkzDD9hZP8MpoFWG39wMHoTsWoxIXyqj6LjVbB7zdZsY0nWqNqDd4x?=
 =?us-ascii?Q?vl7r3yNHse+Sxm29qUS3iXU8muOiSsrDj4VJ8op4urlf5Ih/4IHhlTwS2RLM?=
 =?us-ascii?Q?20eqMwQaBQQRLsQEHwJuMZS/ie0C5NQXW+GYhxQVfY9vdRVnwe9aezPSzXFf?=
 =?us-ascii?Q?3XSZ8mmS0ncA0VhXr6pmhDDDv5p9EXSKqLU1jc8noS0IK1cRJUKu34syRwSb?=
 =?us-ascii?Q?O1yHWwve+dCuGkSMpztqIA45Xqv/seraLV1XYEgAvZdxuy49iofBd8D9+nQ/?=
 =?us-ascii?Q?aYklf4A2Jy0jF+wNEg8D6S+F+30Bjw+lnQp3ZYTjW+WPpbGjfq2hzcnqPNhI?=
 =?us-ascii?Q?pUtGa+gXxxghrggUtwieN3H6X9eNxscZ2vguYFohaaaE8YhOK3yPrHli+vGW?=
 =?us-ascii?Q?0NmgbddKph4nPWJUC3Lo0RHBKmPzC2LeAZkqGHIkkU0HoZpqwCJHDfHhdtk?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f51d9027-db6d-4f0a-a739-08dbb9b930e9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 09:08:44.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_020848_880597_30C94CAB 
X-CRM114-Status: GOOD (  17.12  )
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

>On Wed, Sep 20, 2023 at 02:39:39PM +0800, Chen Wang wrote:
>> From: Inochi Amaoto <inochiama@outlook.com>
>>
>> Add two new compatible string formatted like `C9xx-clint-xxx` to identify
>> the timer and ipi device separately, and do not allow c900-clint as the
>> fallback to avoid conflict.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
>
>Have you ignored Krzysztof's comments on this? I don't see a response or
>a reaction to his comments about the compatibles on the last version.
>Additionally, where is the user for these? I don't see any drivers that
>actually make use of these.
>

Sorry for late reply and wrong message-id.

The clint is parsed by sbi. As use the same compatible, the opensbi will
parse the device twice. This will cause a fault.

>Why do you need to have 2 compatibles (and therefore 2 devices) for the
>clint? I thought the clint was a single device, of which the mtimer and
>mswi bits were just "features"? Having split register ranges isn't a
>reason to have two compatibles, so I must be missing something here...
>
>Thanks,
>Conor.
>

Sorry for late reply, The clint consists of mtimer and ipi devices, which
is defined in [1]. This standard shows clint(or the aclint) has two device,
but not one. In another word, there is no need to defined mtimer and ipi
device on the same base address. So we need two compatibles to allow sbi
to identify them correctly.

[1] https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

>> ---
>>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> index a0185e15a42f..ae69696c5c75 100644
>> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> @@ -39,6 +39,14 @@ properties:
>>                - allwinner,sun20i-d1-clint
>>                - thead,th1520-clint
>>            - const: thead,c900-clint
>> +      - items:
>> +          - enum:
>> +              - sophgo,sg2042-clint-mtimer
>> +          - const: thead,c900-clint-mtimer
>> +      - items:
>> +          - enum:
>> +              - sophgo,sg2042-clint-mswi
>> +          - const: thead,c900-clint-mswi
>>        - items:
>>            - const: sifive,clint0
>>            - const: riscv,clint0
>> --
>> 2.25.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
