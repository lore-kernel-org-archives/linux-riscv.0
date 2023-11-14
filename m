Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71360C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 01:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYA0YZLYzhAv6OzXOsbFM/i82rPn0NKbPj2rQNGt1Tc=; b=YVp6PTritx5nid
	va27/Wx6179dMQBCKBL/iFO5rzXlqaGuTj0XCSD67VEMDIg3mElPQs/vKK6h4rCdsf2qDSMw3a+hi
	Zpd4K5QWvSiDedBFwAJ4Pl8KwNwgp4TZ2F55EsVa63jQScsoPDoo+F2iocXCLf37OtO2GOWuwvEh/
	maMXST3eA/IiYtNRlIv02/HS8mMkxpKZbR4qtqNtNAOSJdDP0PdoAKwNjzxjJHs9MNqf0dA+UDvqv
	x9CzHqMnGU75TCfHbqpoERBpYdn2k/yNtrnC4DNic3vJSBPNSubyhaHLPeYtXwJ7gmgEhD0wBeFYp
	sp24G9MioPYj8SMdMBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2iUQ-00F1Oz-2J;
	Tue, 14 Nov 2023 01:45:18 +0000
Received: from mail-mw2nam10olkn20812.outbound.protection.outlook.com ([2a01:111:f400:7e89::812] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2iUM-00F1Nl-2L
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 01:45:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUX7ZqQVQyAMLouds+alBOUXtXi1DPdr89WTQqFroFWsTzcuD4B+70DUg6YKNeVHXzAcpKuBf7zG/TFR4LfpKd1q6uu4JplNLxcCeiZsoLHXkyXZnDiBxauzi/K/NoXN9nYtUeZ6mSW1qfWdBSs0V5Zk3lhWPVSg4isJGbALy49FDEhVDZdjCaQINSJLZ8Jp0ze/VvP5jerAUjmDxbRKjiLvsJvTLe93hH0CD78sZccw1L26dgzioxsznsPyD14s1WP8xqWRoPUN70+SQ4wjhMLwsYDBYPzX4CZC4DGHqbKpP9ILudckhJenaHaOAHB9TnrnOJMaVQCb5ttpa+aVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w55uGHYAiXPyE2WciqceQNTFuT5ytx+sDK/NNdoyhVw=;
 b=ix5GC4RFiNDUt5ameNxfIvVMwOY1au0/SeA53S3mCGf1ErAmS5q4uvhdfeyY6SkFxlPfiqxKzcWsZ8Ii26UaQZKywHRUo7x/oa1/kUAvOOkWHoQ/4+d1YXTToCbssuLoG2SMRBb03ADE2pfmjIoYzC37lgT9DA7GYPWJSE1olfJ4BhxGKQKlS1nimiGVwFglxV+Avu4lhgMnbJjZ76TLWKVG41Q5U8SxkIR22Zc0psNjgPBFnbtcCwc42c8RJ2ngBhquc8diUDKSVuUDuLNWN/iuVnzoTo8wYbILWmLaRabYvPKE7ptojkTD5UyKjK+NwGrenxDqtb4Hle6zmMXLYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w55uGHYAiXPyE2WciqceQNTFuT5ytx+sDK/NNdoyhVw=;
 b=iChFUhSbrC/i37uTjzYbMtL1ELPWQh6ltqHI0hWOlWoeebfpOQd9kUEbtop0owH7yxVHPPc8YaX15Y+J9KYiwlu5sj9fAkHm4bzEeE2RvhignMCHQ+qcgMKRgnSH/itphuUARSlIRiO9gGqZ8Nz9Q5pv99e2Hs+DBH/MrZ3Hqip+Aw9wHbhxgGtBG99DkkhLs2TA8GLi1sViKQ/XPm0Ubc55WjI30HUsuJ3okO+tBWvs8ue8+bRFVQ3drprHOzh3RkqnZcabVEhyE0B/B5kQ7VKv2PpmjgOmjDFPfuYS4yAh1ePZueFCZyOKHIztXwvPfzjwKZpXLO4+rTxVYihiBQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS0PR20MB5894.namprd20.prod.outlook.com (2603:10b6:8:14c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 01:45:03 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 01:45:03 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and mtimecmp regs
Date: Tue, 14 Nov 2023 09:45:33 +0800
Message-ID: <IA1PR20MB4953EBB4DA58A7170D865B0CBBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <MA0P287MB03326F420E96FE3198C81C21FEB2A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB03326F420E96FE3198C81C21FEB2A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-TMN: [14V6GTMZK3kth1r3/4lzfeAFY3jxbNQPNYYCugxXz/k=]
X-ClientProxiedBy: TYCPR01CA0023.jpnprd01.prod.outlook.com (2603:1096:405::35)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231114014535.54585-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS0PR20MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca5a701-e052-438d-6d21-08dbe4b3526b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVZZ5ObqbowdWHTRqtpw8vN+RYGgj7akjK+/rIuFQ53LvedTijVQIZNvT0MMAKyqqsokZhk2Udek3D60HA0MYWYWjXrngGdRhqLlKg2mf6h3QzmQ9A88Y0KB0pbt224J552fXFFD+I+tDcnydflKRgXwjYd8mYbqd9WGLXBVHvJB+5Zl62TVnS5O/UtzhJ8szy+aWtywqShmqFe42uplVwfqxfpY06TLY4pdjgtusMabfgu83rf9uiOYB738dZ+LNloS5VkNAYepIYqEf48YD7Aj+RjXSyQk14RV8e8jyS2Lo4WEFoy30ErruAInmEMPmI8xz04EapojQ8MiuO1kLhSRjM7yZYUgXZdv2uBRfElsVW7lgUcSPiZk5NubYTaSFzidtc4R4N9YRbbNnGAqlF0Ljaey1wy+spHn4Ynuami49xvgdNO9o/vgi3bjI9XPex1Yq9NlN7GRiZTf1Zd+xSsimbsIY6A1nPT6SGw6gL8WfWAo2r1Qp3G2g4AVf52Am7STpzERnLARU1xmlK/LvpW1aBCBIvd8NhuYwxSxauIvMfani6UwfKx4vcAhP416oZwQAxN5CwNWfrbnUY019EqtdLRrTBDHH8XmN38YYoHYqo4YiDMQhJotB8xPUcnQ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3XjcRCNnH4DTNwFoK0h/HNXn6MW/YyU8VT6iCXGW6xP1dokv9gtHvUG4kU6B?=
 =?us-ascii?Q?idAnTWlmDTM42lSrOpLpF0wjUBBDP9e82fzyjKy5z15K15kaeDmWH+8vD6zf?=
 =?us-ascii?Q?NA9ABqCevBeZDcMlssstDXMYsK+kIY9Gyse603b0fXJOwfSPtyOipXFmdjlJ?=
 =?us-ascii?Q?1X2ulDUPcaT3u+N6y8KFQc729aP4n+1yjPLV2DLYdGwaMOahrefooc6rHa9A?=
 =?us-ascii?Q?Wmo4+TGQYrwtoP6nPuTI+JBj0GeUiZPTeWLuFPjZ6/qZsxvw1d8/xcUqSAPj?=
 =?us-ascii?Q?6gBZU0AB+ua9Y5TaCEdfe9FbzWK0a9YyUPbjRmPluu4beqbo2ktpi4jBSY4H?=
 =?us-ascii?Q?KbtYVbz0LlbSkUnw61FujnrSj4JqZ7LsJDdsMyhnDbVAusaWgheW8SzuDnL1?=
 =?us-ascii?Q?GA3oDIvO3cAw5tvtZD42kzg93QJY/ow8XxdRDfttYqsJU7axi/v+iWNgopJ1?=
 =?us-ascii?Q?Nx4Z0Bly21iWcirbFRXASFvTY9uAuYqlNNg7UZ3PmcTYpcu9/PGbDN4PgTDB?=
 =?us-ascii?Q?35zsxpXlkBGmXtlmnSsbA8jNi5TIAx+6r9kmUgqHGaSm20lOkO5M17N53GVW?=
 =?us-ascii?Q?/RdjcaUcB2MS7OGpcR/YA9ojmw5D07R389VK7tGsOOAYGbF9aIJA0LO3exR3?=
 =?us-ascii?Q?6kQmul/Yg/4fOIfJvW2qth/enbAaaXxoPs5E07mDS74W1F8RWJkM+O/mcvFa?=
 =?us-ascii?Q?9+vVUOOwnyN+7w/LYT9JBNeKqFQ+J7S4rCfozZWqV+dtD6WK0gguYOqe5A3j?=
 =?us-ascii?Q?28hbK+BFHXrcJRcCXrukjvN4cxjjK3FRdsV2fd67iJBQulp9xghh0qjPpwsk?=
 =?us-ascii?Q?6fb6yPLl5wags0HEuaga9QNRCKJhUrUj227fOozkZxcXDrxwuidjXaYaERP8?=
 =?us-ascii?Q?awuuF8jJ+YTi/oBx3XIxYLBm8fJvQe1C3DULRPnsd4T+xpyhyVa1KPVnFNYX?=
 =?us-ascii?Q?uXf57AVGFBqyERWGvBsLByYrlDtOo5GGTz8jKLfsbLmqR5qNJ3WuTrwPHlcf?=
 =?us-ascii?Q?YkdGvI/m8IwS81lox5QDYz0JmFs+++CUOXeHkH7dBXCad7ShTiwmDAfeyEAr?=
 =?us-ascii?Q?Qsfmu9tkncJ8iSoMCeulce1R5C76Q9LWE6aLVcpGCKGqC50FrENbJybaXTSG?=
 =?us-ascii?Q?DFF86Kh/3w+7/JR6cuUyDvvIPjPJ2g8736PdWY86R08N02g0g1kNsRj2ba+s?=
 =?us-ascii?Q?KvL8a0JnOBjisJyMcIdPraDWmf+Muojfw0TGFMBya+YEAq+R14bY/Ts1q6g?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca5a701-e052-438d-6d21-08dbe4b3526b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 01:45:03.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB5894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_174514_767606_C13AEEC4 
X-CRM114-Status: GOOD (  15.72  )
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

>On 2023/11/14 8:45, Inochi Amaoto wrote:
>> The timer registers of aclint don't follow the clint layout and can
>> be mapped on any different offset. As sg2042 uses separated timer
>> and mswi for its clint, it should follow the aclint spec and have
>> separated registers.
>>
>> The previous patch introduces a new type of T-HEAD aclint timer which
>> has clint timer layout. Although the timer has the clint layout, it
>> should follow the aclint spec and uses the separated mtime and mtimecmp
>> regs. So a ABI change is needed to make the timer fit the aclint spec.
>>
>> To make T-HEAD aclint timer more closer to the aclint spec, use two regs
>> to represent the mtime and mtimecmp.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT timer")
>> Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005693.html
>> Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
>> ---
>>   .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml  | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
>> index fbd235650e52..c3080962d902 100644
>> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
>> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
>> @@ -17,7 +17,7 @@ properties:
>>         - const: thead,c900-aclint-mtimer
>>
>>     reg:
>> -    maxItems: 1
>> +    maxItems: 2
>
>The first one is for mtime and the second one is for mtimecmp, right?

Yes, that is right.

>Recommend to add some comment in binding file to make it clear.
>

Thanks for your advice.

>Chen
>
>>
>>     interrupts-extended:
>>       minItems: 1
>> @@ -38,6 +38,7 @@ examples:
>>                               <&cpu2intc 7>,
>>                               <&cpu3intc 7>,
>>                               <&cpu4intc 7>;
>> -      reg = <0xac000000 0x00010000>;
>> +      reg = <0xac000000 0x00000000>,
>> +            <0xac000000 0x0000c000>;
>>       };
>>   ...
>> --
>> 2.42.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
