Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09411C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TX4sO3edbhWPEDjJ/sZjoBsedwlFc5/gr4eSEGUC7o=; b=GEiSUMBZLrstLI
	yy6gipTs1+dxm95OjRJkwQEzacjs12gKUHful6I2qE8jyB6BRb76tFSOZFM8zPTiX9b9sxr21Ykj7
	VGsbJLkck/wCrVr4K0lTpTpaZFahLMrrLFMjg5a009UPyxnmH9ub8NO65Z6wELHB4kXswb/BlwgQJ
	xvGS6v41RxgAa65acG+dVmf6vF0uMMkDnZfkiib6b+y2kI7akttxDj5Vz2Ki06RkNxG9ZbhP0bCwD
	vWkJBKfUZ/zDliZMOrl0Jku2KmQQ1GD9766w3vTOwvCh6jlNzd0EljO5EBwrs+WIO04tBqcCpHchQ
	KRsQYN5LCiihal3CkEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8yyg-00Cz5x-2V;
	Fri, 01 Dec 2023 08:34:26 +0000
Received: from mail-dm6nam11olkn2080d.outbound.protection.outlook.com ([2a01:111:f400:7eaa::80d] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8yye-00Cyre-2B
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 08:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ew+g3yd5ekM/NArticq15n2/72aH2zx8GZG3ayIAMOMrQAbhbeXe5lJ6W6tNayaLK3jvP5uTfLvVP5VnNMETystHjflzlxoabZEjxfVXfE48Plysepepppa9Uwv8tWaXtgkCOcInuRiZMiarbg27Bp/irFKml76FflqyBqNvfVy8+FKFjrEWiFlj01T7zIbNucX/dS2uFStSjTDq16Q6+1uaHwOkPilJIMas9fFGCnQ6Y0TOJGjODCGYqflQr+O+J1K1NByUUsuASeVnncUVieglZLypLfLL1OilaqY4hFWWId65szXoVXp5m9MfyCqXIQJfAQmXz+azAPPlNQZkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7IMed8XxXHYhrMMn7rs1+6xHwhrmX5iOI6DWwVDKYg=;
 b=H3AyakWsFicV69YTUDxLKlI15dsdjxdDX+7Bsw6aOLEPv0oIeXtCV4Jwb7Z1iUzHAzzSWhzb7k9MYXwngJn91Etu6hu9ZqqTNV4pinklrbPY4qg9F3kMdGp1NGGDJQ/4oCFTb4zV3aH+Jz2vYYOXYZet6FtgiuUmzFarGQDE+ZYf/vXRJlPc0UgRkznqx9HhBwN8vhJwg2MSlaVqN/HFWFzxku9m4Y6CaVdZS+dYI0R1C3L96+BbDyauPOy0/aDXziiiPGbYp8GW6kIsJuJOnCwygA7QCPtRyrLr4E1/x2c0izj5UpNt4mMeAMa5hfD3nhw2lsS3bE9Ii+MPL4noNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7IMed8XxXHYhrMMn7rs1+6xHwhrmX5iOI6DWwVDKYg=;
 b=IGnAs5+FYpraYDiUyZOUFGGJNfKEPL4xw20q8RoEpQBxhvnfvXI3Oabx+vQx473TNLKrkAYCopE6g5H2zNZwhtR7sPDL4+dJNBE7MkinQAh5Gw97iJHt86DK9bGUN55R2Iy0n6kVCrZqXxTGiKhX7+Eavp6zF7xvnTWEYKw0pklJBjDNuHuji9wOndrozhdhjKf1C65z3h6byTk7giCFEAOAEo3T7m+SeKBsCIwWPTY3lWiFVTmW0llDim37BPsD8yIk2fGb+to3cvF+L9sUUbZT06JqsbMGjmzs9q6LYRCHtvov8k7CuiEbRtgG0iCg5GsA8v6TcF4QK7V/TsnIpw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB4602.namprd20.prod.outlook.com (2603:10b6:8:5d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.29; Fri, 1 Dec
 2023 08:32:10 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 08:32:10 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/7] Add Huashan Pi board support
Date: Fri,  1 Dec 2023 16:31:38 +0800
Message-ID: <IA1PR20MB49539E82E5C0B5CBFD889F39BB81A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201-strung-mandarin-110a322468c9@wendy>
References: <20231201-strung-mandarin-110a322468c9@wendy>
X-TMN: [V0d4m5/FiGmYxPLPSz160oEi47rzH6uKUKr3nl1jqVg=]
X-ClientProxiedBy: TY2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:404:56::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231201083139.444291-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: 5acb4de9-1e71-4e5c-fa4a-08dbf24802f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KzzG5qeJC59QYEs4GdbDd/vG0hR5AfVrJnyvzo47K7kTJfHOOQL+q+vd+RILaWTEeMvFLu77xke05GfbGAL/Aj80Gj8FNT/7MtrQg4alS04QH7Clvy1ciHOg59e1eorypQnuAEe2amgYo6Yyvh/EXkyEKhX4JS9rULHWdxPrl7EdMNKrpAaqfBnE3ucFiGUnbrjZLDrC+shuWBUC4Dqn/jVdBlo1r3TdlvTDw+abz4quN9FvVfpao9K+2ngINOppma3OD29/vyl77ho4V73EaFB/sxoXkddVNWAjBQhBVronLZ0nXrxrmiFiVEMDwdrNUBHHIUGFZpYeVsZUTdGxStalIDapwZmpi4ClsrQkcflYHCmDTZkA5hZWjmUXY4ZJqHZKYoUKIejLZbkDLBpqJOT41j4m2712gmbCwZPNE+fawUrMOjh1UNRzrushlrHh0MRREJe8FicNT1r7h0GupG5Gi0qSpGTuttGlbUtCOom+r4Xvhq9qJbCAgigqVijU4MhSMhhiyvyBxQ5S76UG5LRJcqm2hFxneP79TOXS/70iO2KUQasNM70SdNnkJI2im8E47OlQ+jWDA+YHYuF1guO4qder6K/9B/RCUaVIW2Enzm+XE5DwzBJGABp7O16r
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8t/snYar45oGelKv1qQ/l+WgtsQWdESLeOUNrEIAztx16yEqE2KVgo2lhJc?=
 =?us-ascii?Q?xxs0n1JbdSz0pG+XJ+ZF/zM+eNkNgWv9C7dslLFkCONd1/A/G5KjiPEfFTXA?=
 =?us-ascii?Q?uJAnFq8Tvdv+BahiS2q7iz16/brUObl7LGbZbz11veXxQzEVO9Wcj1WYsbzd?=
 =?us-ascii?Q?BsOsJhInSjPUi2MqU+Rbb+/IzlmwChyCDgIWiJrnZ19R7yW2lYUuxvfYyn9/?=
 =?us-ascii?Q?2gO0ks1VR7niDeL4E7PfT7K/7ecYdZ9tbgiP5rGvCfMPFqwn18VNEWp2ApOB?=
 =?us-ascii?Q?49wW4hxO+10LahAvQk7DOJlYFUuVTOJIKuHhusQPcZWEPvEGx5/DTjRNdykz?=
 =?us-ascii?Q?zgLDjoh7MhgHToRZBYR879lyBpg3eHPp0TpTP8uvpSbkugFydEBXfQMImdqm?=
 =?us-ascii?Q?je5ETy/fPMyRxMuJKRVyDQcCLcuRstXvs8YUxo+Z5h6C5UvY4+DmBcPmyogh?=
 =?us-ascii?Q?48Ws8saZlP/YlnBzdmG8gU4IFmTxv5i/5fn+z1drh/e5OvFm0fib8fgz21vf?=
 =?us-ascii?Q?2KTK20iYsB3J5GY8YXOS/l3OicMWwQfyHnikT4W/2h98cADw5/ptAVy6AEm8?=
 =?us-ascii?Q?EAZ70rYBlzdhksnFUwsX6rs4rJ7iExzzOl+B3+Rn1btlbljVrKiVwWaB2eeA?=
 =?us-ascii?Q?TO9inERZtothNsy21brPARm6sY1Km+V9jttnWbXtTwcAlSKnYopuJhtQ/Rno?=
 =?us-ascii?Q?9n6u1Z4KE7eeKNy4KShP1RrptvOK6QlDdaKfXVHlC2WBxs4l0nNCmRT8N2eh?=
 =?us-ascii?Q?888o9RODM0EURdXAR0j7fF3TroknNk/Tq/D3qnB80xEJ2+0z/WBMRAR0u46X?=
 =?us-ascii?Q?R26f2mkmxsprE0Tmz4xNLGPdoe9wmCI7/9AEJX6UYadsyc3kAz9m6Js/QxFO?=
 =?us-ascii?Q?UNJCRlIy6Q+WaLxJpiMJmFfO4a0X8pewJHQxPIpECIJkA0VSvSaFvgCdhwJt?=
 =?us-ascii?Q?mXMIR/LLiSc2KEtctjZSFZ2lVEF9TCdGIrqTp1w9ZhuJJg+TbuJa+uLQoYW9?=
 =?us-ascii?Q?QNfTaNztXj3bWk/qbonsXARsOY2BzfLXNAV1gSHOVkBvHsrAhN6IreOaJvoc?=
 =?us-ascii?Q?6wzuNqX0jB9LmqV6n/y8fQqrq/zR4v+99SyspQVYY4LiNvhljDDMVAQmcmBP?=
 =?us-ascii?Q?LcLvHTdVe2v1v2tLlaJTO27mEx8a95uUrveNwQpiRoqnxTFjnHaRY9BThdS1?=
 =?us-ascii?Q?v2UPY9DGhpHigQsJhAgrd6OTsPxfheM6jEA8I5v+eCzR1Tb+S9RZdgrW3Wc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acb4de9-1e71-4e5c-fa4a-08dbf24802f9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 08:32:10.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB4602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_003424_736951_D61E2ADF 
X-CRM114-Status: GOOD (  12.09  )
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

>
>On Fri, Dec 01, 2023 at 09:02:59AM +0800, Inochi Amaoto wrote:
>>>
>>> On Fri, Dec 01, 2023 at 07:21:29AM +0800, Inochi Amaoto wrote:
>>>>>
>>>>> On Thu, 19 Oct 2023 07:18:00 +0800, Inochi Amaoto wrote:
>>>>>> Huashan Pi board is an embedded development platform based on the
>>>>>> CV1812H chip. Add minimal device tree files for this board.
>>>>>> Currently, it can boot to a basic shell.
>>>>>>
>>>>>> NOTE: this series is based on the Jisheng's Milk-V Duo patch.
>>>>>>
>>>>>> Link: https://en.sophgo.com/product/introduce/huashan.html
>>>>>> Link: https://en.sophgo.com/product/introduce/cv181xH.html
>>>>>> Link: https://lore.kernel.org/linux-riscv/20231006121449.721-1-jszhang@kernel.org/
>>>>>>
>>>>>> [...]
>>>>>
>>>>> Applied to riscv-dt-for-next, thanks! LMK if something looks not as
>>>>> expected.
>>>>>
>>>>> [1/7] dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
>>>>>      https://git.kernel.org/conor/c/21a34e63afcc
>>>>> [2/7] dt-bindings: timer: Add SOPHGO CV1812H clint
>>>>>      https://git.kernel.org/conor/c/06ea2a1968a9
>>>>> [3/7] dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
>>>>>      https://git.kernel.org/conor/c/d7b92027834e
>>>>> [4/7] riscv: dts: sophgo: Separate compatible specific for CV1800B soc
>>>>>      https://git.kernel.org/conor/c/5b5dce3951b2
>>>>> [5/7] riscv: dts: sophgo: cv18xx: Add gpio devices
>>>>>      https://git.kernel.org/conor/c/dd791b45c866
>>>>> [6/7] riscv: dts: sophgo: add initial CV1812H SoC device tree
>>>>>      https://git.kernel.org/conor/c/681ec684a741
>>>>> [7/7] riscv: dts: sophgo: add Huashan Pi board device tree
>>>>>      https://git.kernel.org/conor/c/2c36b0cfb408
>
>>>> Thanks for the confirmation. But I suggest to revert these patches.
>>>> Several days ago, Sophgo informed me that CV1810 series will be
>>>> renamed. And the Huashan Pi will switch to the chip with new name.
>>>> To avoid unnecessary conflict, please drop these patch and I will
>>>> prepare a new patch once the renamed chip is launched.
>>>
>>> This is a board that exists, that you (and possibly others) have, right?
>>>
>>
>> Yes, of course.
>
>I dunno then. It sounds from your message that this is purely a rebrand
>of the SoCs,

IIRC, it is.
FYI, Chen and Chao. Maybe you know something more.

>so since people already have these boards, I'd rather not.
>We should be able to support both since it's just a naming change,
>right?

I agree with this. If the above is true, we can just reuse the exists code
with a different compatible name, right?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
