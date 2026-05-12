Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9ADCD37BE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 02:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s57p5d2eipReS8f8bp8adOTVwS/06MQHjocJSr9EmIs=; b=eQVcGP+qEYHeMV
	dtFE//DRPa7SwLypVs7A4sasKgdwaeHvQiy+h5VasGLvW/ZoS8CLsaEwasQizh9M3f52I8itxPov3
	Nycmc+W5c8nS2RikWjTAy2yQqTZoUh3qTY1ef5l/MTlTGfLaeN9eg6gvSQt3cd9PFCVP+vDFkwsbf
	oX1dEISiD6RrEN9KlRPMQsUAbOqayCxwCUNXJHaN1Kvy9fBA5TwP0cafmolpt9lWmh+66lRY3QDSR
	TTppfxDL/rFbu/Z6Ku1p6zzsWyYyvsFz85bMU8pF+6hGVMhaTUz8bONov3mbMD0pUQuQAXrthb7gY
	/G+dnmPDNrlDMUe+xZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcoN-0000000FGjH-2KmC;
	Tue, 12 May 2026 02:25:31 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcoL-0000000FGif-0O6M
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 02:25:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDQ6nx8oXHgO8rYvQeCj0ZTfFV8u7TTOw8XBKSENIOXxuwWOJdcX2ieRNLtjywCK++qmMSCqV+27SuWeZZDEBf8d/y9gPIi5za8RaVwA4MNTqTKF7AeT8ANKKWxZJsJdzLD6iD86vAFcVs6O/oa+1TazUzucCgdAP1VMhjEqOvbYFMYEi29h//CAlTWLTj8QzjuaDUbOb8WKuVrRwHVZd0FIg961LM9NPGQPg6NP7wPdOctd5p06fxAiPPkgcOaDEHsUyZ2eknH70YT/xegFAA+4a7GSi7iKEOcB9F1YbEsy+S5ruirHHJ4kRaHIW18+S90cCqT/FA0/0eAcbU9ruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ71KiQEazoDWXQkTGa3cJZ9YJ3YdunXtgLZRmyIx88=;
 b=pCIqhuRpKakl5UG+8nRpqZz6PAz7P+KwaFh7a1HyqtoO/jdUXSXmdf0XXCbPMkQC8F6edMF56pKFrRjeB8j8809+KY2qvN2dbIVH9rDf+sIPUxST/BPzv7DvBkSO6MZXXnX1qQ4W4jW/ElxeCbgha2njONSscm08AI56bL6NXHVv8NKFnXD1yZAQZIN06S05z4uUZw1oWSceQf0byEaEdQXPsmL/bX5tt/gONouRdAZQMep016WsDYzTV+3Lyx7rNfZfOu94LDfjLAx20YkxBYK8FUrQAmealPA5aEVpT/n3PBVHybNahr0p7NPkiKj5k98IIKuYSyiCNRdcquyWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ71KiQEazoDWXQkTGa3cJZ9YJ3YdunXtgLZRmyIx88=;
 b=m/4SldJoB+NFPZM2jyu8quv+5ihzIhlkhxejoRLbCGQ6ou3WFDrkzq7HAhV7pSpRjwPjjbTpQTwvkrJ8XZxFHAwPv2156P3e6iEpiUdJ/+Vo4nc7LUPrxKa8nEFS/doywCT+6gtFews91ObAnHNI6s8GAlvuvJgYwOfkXpOTnl+yXAcz1H4PQVjwNdYiZmpWmebmQR+iJw9PNlu0dWpqDSqb1qikKlCehz3e2/fWOPRY4fXZ7BECmrTTmZWbzIyu6fhKsBQ6xA3VUsrHjk0SkqFq64LI20WWc73agVbrC6QNNHlKd3NV0TQmHo4lajj0QY+1dVc+q6Kn6q7ARplS1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by PH0PR12MB999090.namprd12.prod.outlook.com (2603:10b6:510:38c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 02:25:23 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 02:25:23 +0000
Date: Mon, 11 May 2026 22:25:20 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 1/5] arch: select HAVE_ARCH_BITREVERSE conditionally
 on BITREVERSE
Message-ID: <agKPkFq6kuarikAJ@yury>
References: <20260506175207.110893-1-ynorov@nvidia.com>
 <20260506175207.110893-2-ynorov@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20260506175207.110893-2-ynorov@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|PH0PR12MB999090:EE_
X-MS-Office365-Filtering-Correlation-Id: 34efca56-1862-41d0-70d2-08deafcdb869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|56012099003|22082099003|18002099003|11063799003|921020|3023799003;
X-Microsoft-Antispam-Message-Info: XrUijItjyZUfUQjcaUx57OMs78aYfG5hRe9N2/4vhR4k4cYdLoGsCa5EIFfmSXW4kYj1OEnD+Hz7AJQWHTEg86nWp+eB9JyO9rMKUNp+0TvWgYbbfb0hSCGETzECfj1YilLQb7pMhBjZqdLWbdhGaKCxYZDk0kw0j5Zl16UGl9NCwIGX9omPAZeVB4EKOMb21ubwsjJi1yKoZuh97qP1ZbJTr8JldmJgpZRNoQCn/H9FMr7oYiyDyTh4m+w2D3946asY5MJG4gyPZj+nkG0PLjeI4UEqT1nFuCEBJEDL5ySwhfHr86Y6zLpb0N67my0NGOL8LvXwxQvfz2MaFfUPcvVjQEIUzWxoNdplXdZdxzDzHvX1WTryKzKdIvbxM8cFEQ+38R2zMoacNcattj6jinZmXAbeDIq5zWElfBqucS/Mu1heBNzZQeKU7VDPGLdo8GCdKj345R9tY6GhOvHDN4dtFpRT7TVLCoEs/m23Nzw1F6XJvQVzJrbkTA+GStLGa1wIzNfebXbngJd7DUZDM84KAFfDN2u65Pe7nHHdf2+BRhngIxZOKRJb5B0KVDzlzDlaqnKjZCZoaVglgmwvZ2MjDD8p8Spwb2Paw1ZEUufS/CZcOGsLAQxSSKghEnBVn9RLqXlqd6btbrM8KC91mgiRoTcL71W4GWo0x/rOL3c8Ekc0srQzDzPI0aGgHuxIZUn0nuKMr0uyW+ydevSN+GghxlzNXeJxCJVVCyuKqfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(56012099003)(22082099003)(18002099003)(11063799003)(921020)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vh7hKVIqPDDJ2UTFK0vr1odTxGMSYRLtzMYfmvJPBSCxzDm25LrMYk2b57YD?=
 =?us-ascii?Q?+tNZvWHQe4bf1qtVsTLk3jdh48vRC1F233Pbe5KEvpP57v2VXk7yRw/sx6q7?=
 =?us-ascii?Q?qYYeH3EfXFKgZA8mrG0w2ELFugQhdEG/iXeKL7mudWqEPRo1b9S9nQjOwq4v?=
 =?us-ascii?Q?rnmXWRZWWeoJfB4e3OWw7JM6dTAQftMgq2zrz6AvmnCXQ3kSuD0JRNJ+4TFp?=
 =?us-ascii?Q?fiiagJoRJivOrX+5ZFyuXF5lK1zvxkusMgmHLRtUCT3subfrBAYQVB6vXnv3?=
 =?us-ascii?Q?oeSMyyWH2Nsl9uVYkipAT0IVr8zR6zUxxF5CUVsz4mp4ihXZACsS+F/v/XuP?=
 =?us-ascii?Q?gRF+2eVdtkt8I793tblXwq1YN5F3bt1i+j21EG6W4Ee+1Lo7+w3wCkS9K5Jk?=
 =?us-ascii?Q?mMEhfqltYDjo9kyiAWW8c33AhRKPvl3qapSFiq8YIdeM3eWY/9t6TV6ul5b/?=
 =?us-ascii?Q?FHG49ETPajXAvXL4ikdCe680aAYgVb4sMb50ihQVUZ1y4cpJ9NcTglkmAlvm?=
 =?us-ascii?Q?BT4Pt7n/u6k2WmW9TFLhBqOhwupHYx3TTz6pM2lsp6j8iVshws+9/1ZSea7F?=
 =?us-ascii?Q?1LxePEl+/AVDVvwTb0Oo7JcgGDJyetO2D5ejht1qfbCbwTu/AefALvWbKtbc?=
 =?us-ascii?Q?VjhZQOKqYDl9Zg+vWqkIMVO61VXQOhlt9W9Vsw/KEo/WJD0SEJs3O98nmdXO?=
 =?us-ascii?Q?b74XEooJf0HXy4tBz4irkHmCSBxHimT2+0+Q0XYDkC+SQIprUYMkeQYRFzKR?=
 =?us-ascii?Q?MZt2w8WBKaQfyYjDTD2fo4s6/m0VNuegb1r2YbH4fin+vnwSUZ6s6f9gOJvD?=
 =?us-ascii?Q?McyJU4UlqB1TP5U/GHR3J2IInIN2rbLOfnFzIM7aOBLB7bep2dk7kKhPeHzQ?=
 =?us-ascii?Q?Hle+mf5x09eNchCH3HwC+0+FuDDV009rBfec4potCwhxGFesNx0dgEZwCQFH?=
 =?us-ascii?Q?PZgYSFnoyAPih+iWa1PcWS4YjruS3q09/S2w8b7ArVdePoxO55TTr50vLlau?=
 =?us-ascii?Q?zmwDoqN/CUBZjj0r7DzQbUTCOl8Y4E9OEOgI2i9L0UjpFrnr/ccFk1/6NwUR?=
 =?us-ascii?Q?kGYjQZ1LgnbkAjmLvCnV9AdULas//PONxTgaWQ1Z7Ix2gA0z3/Cr58Dnsj67?=
 =?us-ascii?Q?6V8viB22xGVztkHX9Ux7BXLbpt+JO7xCRHPnYY2zbHBOemEdx/1Bv0GtSFuE?=
 =?us-ascii?Q?UUrcimaBr/7gjOuEyJNSaMhLzOCrI+Y9gsS9wFmmUyDwysLxNj/OQdkoW03e?=
 =?us-ascii?Q?NqkUI5UKa2y/LV42OBX85Hu70fKVqm3ObIjr0nD/PaOqXM4NM4rBCkVOjQml?=
 =?us-ascii?Q?Ebc+f7Cln44LrBj8LXekVFf0LL80YuVQ4YLLhlbGWEMyfsJa06KyA3tSJakL?=
 =?us-ascii?Q?wrHzYbYK2GTDMU+H/SM3f6NQkjLumU5aEN1Bp0ylCTeBqeYzYzJzloWdPC+b?=
 =?us-ascii?Q?vIMiHblv65mAIe2yO0bonccv/KXEUBIClWC3lxaLH+uqfwcvFPlkY7zf4vCk?=
 =?us-ascii?Q?XYTRLZo93JKNwwBZwxW3Bd/IBlT9qqL2ExSSKjNybqZqipdvV8Tfnii4mWAr?=
 =?us-ascii?Q?X6HwGJD+MDbJWGmGGjHYLDzng/RWvuHOiYRvua04vfnRi6COY/Zd590Uoi13?=
 =?us-ascii?Q?0L8YR+KGfJHTlX4WSlXqoZUls+bPSbECE2dtf5wPdRm86On0PE2Aswe2IGPR?=
 =?us-ascii?Q?VwKSZeQvmlocAHG/r948nbSUafJr5nJdZ0jl6ZUh2Fgy+l73wTJbIPyGtxsy?=
 =?us-ascii?Q?fJkOWxQFPCmwsMCoWM5osJ+4gByO97luGzgeJfuXpBif/b02vEU2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34efca56-1862-41d0-70d2-08deafcdb869
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 02:25:23.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lM5Msqwp1t1p5Ww2VPSfeqv+hfWaYYEYMyeGX5QKIGwdte6Q6YuNmOqmlBtXCh/4BpTg791ZI+vcc2muYjNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_192529_149171_48200ED6 
X-CRM114-Status: GOOD (  17.10  )
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

Ping?

On Wed, May 06, 2026 at 01:52:02PM -0400, Yury Norov wrote:
> Architectures may have bit reversal instructions, but if the API not
> needed, the corresponding option should not be selected because it may
> lead to generating the unneeded code.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  arch/arm/Kconfig       | 2 +-
>  arch/arm64/Kconfig     | 2 +-
>  arch/loongarch/Kconfig | 2 +-
>  arch/mips/Kconfig      | 2 +-
>  lib/Kconfig            | 1 +
>  5 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 71fc5dd4123f..0e963e54fe06 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -83,7 +83,7 @@ config ARM
>  	select HARDIRQS_SW_RESEND
>  	select HAS_IOPORT
>  	select HAVE_ARCH_AUDITSYSCALL if AEABI && !OABI_COMPAT
> -	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
> +	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6 && BITREVERSE
>  	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU && (!PREEMPT_RT || !SMP)
>  	select HAVE_ARCH_KFENCE if MMU && !XIP_KERNEL
>  	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32 && MMU
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fe60738e5943..f5bb62c2ba9c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -150,7 +150,7 @@ config ARM64
>  	select HAVE_ACPI_APEI if (ACPI && EFI)
>  	select HAVE_ALIGNED_STRUCT_PAGE
>  	select HAVE_ARCH_AUDITSYSCALL
> -	select HAVE_ARCH_BITREVERSE
> +	select HAVE_ARCH_BITREVERSE if BITREVERSE
>  	select HAVE_ARCH_COMPILER_H
>  	select HAVE_ARCH_HUGE_VMALLOC
>  	select HAVE_ARCH_HUGE_VMAP
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 3b042dbb2c41..6c3444e31c0e 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -115,7 +115,7 @@ config LOONGARCH
>  	select HAS_IOPORT
>  	select HAVE_ALIGNED_STRUCT_PAGE if 64BIT
>  	select HAVE_ARCH_AUDITSYSCALL
> -	select HAVE_ARCH_BITREVERSE if 64BIT
> +	select HAVE_ARCH_BITREVERSE if 64BIT && BITREVERSE
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  	select HAVE_ARCH_KASAN if 64BIT
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 4364f3dba688..7e1494e0dbfa 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2026,7 +2026,7 @@ config CPU_MIPSR6
>  	default y if CPU_MIPS32_R6 || CPU_MIPS64_R6
>  	select CPU_HAS_RIXI
>  	select CPU_HAS_DIEI if !CPU_DIEI_BROKEN
> -	select HAVE_ARCH_BITREVERSE
> +	select HAVE_ARCH_BITREVERSE if BITREVERSE
>  	select MIPS_ASID_BITS_VARIABLE
>  	select MIPS_SPRAM
>  
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 00a9509636c1..d8e7e89ae320 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -58,6 +58,7 @@ config BITREVERSE
>  config HAVE_ARCH_BITREVERSE
>  	bool
>  	default n
> +	depends on BITREVERSE
>  	help
>  	  This option enables the use of hardware bit-reversal instructions on
>  	  architectures which support such operations.
> -- 
> 2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
