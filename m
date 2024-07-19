Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E83EC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 12:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2HBZldvSR51wGn48/Nb7wd9lCSy620tsq14hGaXqQQ=; b=COxflMQ4YQUtyM
	6C1YvvSrBBVKftxhRYv9oKR/Pr9UlxqSz7e6muB4ouUqW+hDgh8y6p/WqjMywynadrkJVsa1DaedK
	wBjvL9MCIlbVOt8hm7K4hHnpn/4nFHb9Or4wtjWRgpxiYaHnCLpJF2UmuYDz1Dm40Q6WWMw1fbvi+
	e+QPOsdRYyNsGxoGvUqfzScEIfIWyiNy7DmmF/IFTTSI+/0aL6FS2WA1wBxFBlwRNbKZAMwT7/0qC
	6bt9Zl06gH0pSBdTyY5bt0Hq7BndOkfyodXJuMmkMqZ2cCtItzSHJkfz7DXRe7y9/hS/5FVN7MlGA
	btgT/jl4sWmrm/ML2kvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUmdJ-00000002cay-0Zz7;
	Fri, 19 Jul 2024 12:22:45 +0000
Received: from mail-mw2nam10olkn20805.outbound.protection.outlook.com ([2a01:111:f403:2c12::805] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUmdF-00000002cYo-0k0R
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 12:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju1yvQpGrxHaUDnderReAglkPnmreDVS8T43eitazyaaiaEGL1zItN1O0R+dd2ouOw39rI1UhZN/Ld3QkNRI4NM9vvBYnKMratLT+/DBWWAhhdFY17+xA+ncKcjlt4MSbeGWN5ihHFBOHkPsr06Og8d3rUoIAdaJvLzMDQ3ARzT9EPjPQ+kbaPbPK2qEJlPVtJaKMYHycaF4/Ke6IWYgOt9yMaz9UEhe+hvbE3DZ16W29h1uV7OZpa/khvkfwdtedtfVcAKMG7NouNT5wSMokEyu31PAsuZsgsT7yY6JALQFmuwqYn/28fGAP0i9liLIwr5x1HPAAco09WRCh86xmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMGqgYhvHltlUVUnzmwbazIApXexStSj6SqD7zmkKKM=;
 b=PzYq6krQaYDTsAeM4qMI2MSBvQhEzPlOb3zIEYuSAnX8wSQBD/gsm9LneSiSJqMr+R41RzyLAOywuB/OmJ1r3puLGrKvZW8ZF6FGeqmUHeR9byej/zow4KshP1BfabMOgASesJpbH7vq0HHTs+2TYsAYfzl0ZxYx0hVfncKAmtySkaGw4/sQX+8kM7KZ2+WyMKeqkfVDkx63yunWoEapqgEYjNB/VpIVdQ7ATWkThhlJDyTk0ObL4PRHLkebp0/p9f8YLpSKgrcCrbDYJzLK8TLwv5Hrc2EyzVagyWq6vkBS0ub+uliWMK1+FESrZIPrdwbaT+XpLTSWwStzUbdfFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMGqgYhvHltlUVUnzmwbazIApXexStSj6SqD7zmkKKM=;
 b=TL0ljs0rnmM1gL9RTS5WVyycIZ4/1dUBCZ/6Z1NKkcD4XzncDgzb/pi2oBHxA1cwjSOTFEt23asZFY6p9jjjeyFWNYDUM/Kv17UDnqjOx+XSykmq6dO5kzm84BICygOeYgeKGwBAs0vmrsoob/+JFIfwQPX2qBVlmPYlOa+c+FNvHV14F3kPo0fMYa2EXj1VmbwfB8OYZ5xm0UiPUW/XOvbdbeLgv9TbLPO4bStH+sRE7NuIkNWJmt0RP6jlttRu27oMMuutG7ZEucuVGL6Q7IbTSHb7XG8RqluEwQWDR1CWlWYag1H2YCU/Uy3mgWp/Ikm9ojdoE8OXGuT1EPeKKA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MN0PR20MB4644.namprd20.prod.outlook.com (2603:10b6:208:377::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 12:22:32 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 12:22:32 +0000
Date: Fri, 19 Jul 2024 20:22:15 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Eric Lin <eric.lin@sifive.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	peterlin@andestech.com, dminus@andestech.com, locus84@andestech.com, 
	jisheng.teoh@starfivetech.com, inochiama@outlook.com, n.shubin@yadro.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] perf arch events: Fix duplicate RISC-V SBI firmware
 event name
Message-ID: <IA1PR20MB4953B8E9BD61EA93BEF12260BBAD2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240719115018.27356-1-eric.lin@sifive.com>
Content-Disposition: inline
In-Reply-To: <20240719115018.27356-1-eric.lin@sifive.com>
X-TMN: [EdNaG5ekcXQ3nr1+6NvaANlfjv9y+TkizoomRT1Yx5o=]
X-ClientProxiedBy: OS0P286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <yqq6tvgie7adluvlbwx3t55lhv5qgjnthsx3wfayot36f46dtu@irledx2mdhlo>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MN0PR20MB4644:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b8283b-5c17-429a-1478-08dca7ed7711
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|19110799003|3412199025|4302099013|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: ZJzzwLe4ITMf3P4ZsglgqctzB4XFwRLkNiTfNOaHtJtT/wsiK1p12yZEbF3C9ra/fkcBTswXVRTowNmyfJDr2V5nGITi7Fu36xJ4T8Ka15orf3BoR/iNk1WGN3Yxk/JmPbw2zVatacWBplEwr6StQ6zEHfTiCz683umGg/3kyvLpZO6LL4Ck+OSYf5BXR1EE5d9rVrTPwzeJVWyols0GWMKUHN+7/RTOAOadR0SX6usunii3K9Dtj9TEcQmxII2DZvODKsht+cpNC6j0GijCkvhqpYKS5vdM9NVRUMVPKYiEskFt+AvN/GfI/CK8Q8ZXJ9njvTwQi7tshQ+7piEnGdezRhM3qHhrEUGzUvSLBO24JopkvJneSzqfbQi1cjNA/mKQkzkUH1q7R5MpVOPD4JNr18U1McQhHfKqlyqC9+RYFfWd7Cod7mwX+vGLyxX5QCLTQwE8lkWXYpfjixLWH25ltlbCVcojI8rtTNQeR3g/g9iarGb2HJPUkuhNLi7hN9aN+uv/Lf0HY4gJp9STyod2/zUoGB+L5X2/2YpY0rfO/MtFMuvcppbICJrVwdb47Dbuz+JHsyS1trQ/BegPcL2+n068oPnALnRYxWsfDhx8M6NnGpMZtyBxslQzgHvyb0/PyBlvzBuU4DdBRPEXPnnXrD3f+mh3fOI1pKclFwxB3YAoib+4ZdcppVykFwKKtcOZX71wNR8yI5ihn4G2tGKFLZFRVoT3Z/YWoSjxFv/arjwmhWdNX1OoDuQhMF6kOD/oCj7J+Fp/jzLstPgAjrzTftuxg6GAg2FqD3WuMKg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mWHM8y0alOSNOVJEazfUCHEdgDt3zcjid1EXtvphI0wG+zJC0+Ts2gsYlW2M?=
 =?us-ascii?Q?vc6T1tmFO/0AqamUagro6sxe8suUz7UOCr6jf2zWVpe3UJhbXG3itkhHcMa1?=
 =?us-ascii?Q?gJNHUtqiyK5Y25CIwePNP8NemSxYV0vEV5dLXukHLuAUooPKipA+MYi0Z9Ah?=
 =?us-ascii?Q?T5dYFTzrn5glGlftZYFBBymcb3/W/+Rk11W9gFLghKKkN8+/foVjDzczsKty?=
 =?us-ascii?Q?CJ8spQMNiXc0SQX9a10SykybdYgcYyJ2SKAMJTwuHEaDS9dQFN8qXuQCfoOA?=
 =?us-ascii?Q?yNtq+Ycn0dkRQtlF6yazH0v1imc9T1XXWhmeYf95ooIFIt4wYW1+IEmVTaFp?=
 =?us-ascii?Q?yxuwS359Gkn8ePSHBP2FcJiPGef0Zj2ZEpt7XZeYcT1HzKc8v4tIdX23XE+2?=
 =?us-ascii?Q?1OiXLbqqjgvH9lSVyAf2rvesUXRObyqjjAYfSzu+Pnl2v6ajfnzMy0G+9RfA?=
 =?us-ascii?Q?NUCyiVF5GDWqvzMIFrUzclsOO7YzOhXeOg0Gg9D2QnWIzF/mM+nXDPZujI20?=
 =?us-ascii?Q?/Z4TioGWmSh94aB83kwCcbjtYjehH36CnEzj41pmREOHet3FgCKBf0ooMonB?=
 =?us-ascii?Q?Xdz4dXv9X0YxdyRKHH4zM61+qHHNMB4RyOPF44LvsE+3BmRk/5ahrwGy9Fwy?=
 =?us-ascii?Q?Dn89qN+zbMzsTOIjP5lj/lhGLfJjLZ9+fOwiRbFnByPUXQBuBjjfs37ZwfIt?=
 =?us-ascii?Q?y2EsKQJvyAmFa4b7MKxaz3efEQ7eSIR/5HwZyGA3pZQYSvRnVGTWg0tCQ9Vh?=
 =?us-ascii?Q?WxZOSTTrUVupmdJ5g/vFK2nOB6T6Ix/HaDgrwhp6VdWxexHPes7/FCSSAZX/?=
 =?us-ascii?Q?lHuG63NEvno7Aliv/AX+IvyUm+/FosLmrHg1gb1zRqHC35W2YTsIfxHXGfTC?=
 =?us-ascii?Q?/jVsnftJKqQaxUg5GKn0vcxjNtnpPlqnJ5Jl1dVp8JRIrHVszXxOfMoYbzUm?=
 =?us-ascii?Q?OOQDS43q6zTkiFvReiFCjKiaX7QjIET37u+mltefJ8mFQNCPp0Cf+e+ZIxEu?=
 =?us-ascii?Q?eDD0ZEmg11gkpe7VmAuma6YnK58ra2zkUTSPpF+VX4m2Kgs2NmI2K+DjcINL?=
 =?us-ascii?Q?JzuD2/o+HYUpDAUMWSzj8AQQons2DynuzrcU9uZrNWPvo/iXODDg6vlhpzVv?=
 =?us-ascii?Q?E1NsExB2VZniSu+2y5e5DvI48fKODvDxJfvpfh2u2an9pEvVsEjVi6byoRCT?=
 =?us-ascii?Q?HU0a6+v914xFskbkQwsEDjC0t9oeXQioVB+gBSy7Hw/ByHQwgfhmhtxAkLtC?=
 =?us-ascii?Q?Gne6JKThixcCf2afUN/N?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b8283b-5c17-429a-1478-08dca7ed7711
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 12:22:32.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4644
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_052241_244758_F7AFCE07 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, Jul 19, 2024 at 07:50:18PM GMT, Eric Lin wrote:
> Currently, the RISC-V firmware JSON file has duplicate event name
> "FW_SFENCE_VMA_RECEIVED". According to the RISC-V SBI PMU extension[1],
> the event name should be "FW_SFENCE_VMA_ASID_SENT".
> 
> Before this patch:
> $ perf list
> 
> firmware:
>   fw_access_load
>        [Load access trap event. Unit: cpu]
>   fw_access_store
>        [Store access trap event. Unit: cpu]
> ....
>  fw_set_timer
>        [Set timer event. Unit: cpu]
>   fw_sfence_vma_asid_received
>        [Received SFENCE.VMA with ASID request from other HART event. Unit: cpu]
>   fw_sfence_vma_received
>        [Sent SFENCE.VMA with ASID request to other HART event. Unit: cpu]
> 
> After this patch:
> $ perf list
> 
> firmware:
>   fw_access_load
>        [Load access trap event. Unit: cpu]
>   fw_access_store
>        [Store access trap event. Unit: cpu]
> .....
>   fw_set_timer
>        [Set timer event. Unit: cpu]
>   fw_sfence_vma_asid_received
>        [Received SFENCE.VMA with ASID request from other HART event. Unit: cpu]
>   fw_sfence_vma_asid_sent
>        [Sent SFENCE.VMA with ASID request to other HART event. Unit: cpu]
>   fw_sfence_vma_received
>        [Received SFENCE.VMA request from other HART event. Unit: cpu]
> 
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-pmu.adoc#event-firmware-events-type-15 [1]
> Fixes: 8f0dcb4e7364 ("perf arch events: riscv sbi firmware std event files")
> Fixes: c4f769d4093d ("perf vendor events riscv: add Sifive U74 JSON file")
> Fixes: acbf6de674ef ("perf vendor events riscv: Add StarFive Dubhe-80 JSON file")
> Fixes: 7340c6df49df ("perf vendor events riscv: add T-HEAD C9xx JSON file")
> Fixes: f5102e31c209 ("riscv: andes: Support specifying symbolic firmware and hardware raw event")
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Nikita Shubin <n.shubin@yadro.com>
> ---

Thanks for the fix.

Reviewed-by: Inochi Amaoto <inochiama@outlook.com>

> Changes since V1:
>  - Add "Fixes:" tag for every patch that copied firmware.json
> ---
>  tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json       | 2 +-
>  tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json        | 2 +-
>  tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json       | 2 +-
>  .../perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json  | 2 +-
>  .../perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json  | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> index 9b4a032186a7..7149caec4f80 100644
> --- a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> @@ -36,7 +36,7 @@
>      "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
>    },
>    {
> -    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
>    },
>    {
>      "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> diff --git a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> index a9939823b14b..0c9b9a2d2958 100644
> --- a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
> @@ -74,7 +74,7 @@
>    {
>      "PublicDescription": "Sent SFENCE.VMA with ASID request to other HART event",
>      "ConfigCode": "0x800000000000000c",
> -    "EventName": "FW_SFENCE_VMA_RECEIVED",
> +    "EventName": "FW_SFENCE_VMA_ASID_SENT",
>      "BriefDescription": "Sent SFENCE.VMA with ASID request to other HART event"
>    },
>    {
> diff --git a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
> index 9b4a032186a7..7149caec4f80 100644
> --- a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
> @@ -36,7 +36,7 @@
>      "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
>    },
>    {
> -    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
>    },
>    {
>      "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> diff --git a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
> index 9b4a032186a7..7149caec4f80 100644
> --- a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
> @@ -36,7 +36,7 @@
>      "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
>    },
>    {
> -    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
>    },
>    {
>      "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> diff --git a/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json b/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
> index 9b4a032186a7..7149caec4f80 100644
> --- a/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
> +++ b/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
> @@ -36,7 +36,7 @@
>      "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
>    },
>    {
> -    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
> +    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
>    },
>    {
>      "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
> -- 
> 2.43.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
