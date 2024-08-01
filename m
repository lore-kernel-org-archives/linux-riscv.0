Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A92C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 19:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJ5k/xSsVJW4lI5FjCzTMJoAct4vGiU1DwWrAeONhi4=; b=Bq1NqpEwAEtzrz
	EOvtxbWbmDZsncHLDJiRkNhGmZXr4dGTNZ5mBBE9KvyMl9UU50aHuD/FicONipW0cBq1CtTNjWy8M
	STFtedHiF1KWir0kMlzvnJd+WtHEARv82vIgrQLp9Rx016CPshHbPJfAZ0zfVBN0tPSv553sckvkG
	gqf24JbZsBsVV/BytADEskJetKN1Yk2qTJjrtM57JsZ81srEcwJ+C7E3qdGRYIDGaYxM+WCUzF/Oe
	FTr3qXRvCR3pcYBXdtxNefdn1nzE6/OEbRYMPxkZN8QQ5tkGhG6h7gxNuvnu+heOMeDLRbwDDweCi
	zlWMJ/rblSG95wSxCZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZb39-00000006TUc-20JH;
	Thu, 01 Aug 2024 19:01:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZu0-00000006I6O-2Tp9;
	Thu, 01 Aug 2024 17:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A/pGB8CPFMxkatBosLBj4Yyq2m9GZhAMAQ3JjJn7/ng=; b=HvI3wCc8bLBWrS2R+QxQpRjGnS
	PvCMIuMeQ413mtcuQ2/PftmkcTjqqZNI/x6noE8JdPaBnnaCLM38mHOqKrZFdhh1hl766jT41AvLe
	Nt7U1rDCJeD27h6A1V8DmooofHe/CDw8G/bn4UDBXoh+7YTfJzDhVd6dyMiT/Vb2hd3iHaZOtfp13
	89tr/tFm67j0QdngLmZ+iXw7u6dd2YXgSSj1p8a4zIfQhhqZ25sItqe2UdlCYf9lV4DrxSLZljTkT
	nmurmpNXAEAYq71Iq01EjYIjBM8tJgPleHyBjuvDTwT+bmO6AMeFjffn3F41Tb53jNzch5/sDkmh9
	VjpoGfew==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZtx-00000005XkO-1qOU;
	Thu, 01 Aug 2024 17:47:47 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZbvg4GP6z6K91N;
	Fri,  2 Aug 2024 01:45:03 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id DD56C140B55;
	Fri,  2 Aug 2024 01:47:39 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 18:47:38 +0100
Date: Thu, 1 Aug 2024 18:47:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, "Borislav
 Petkov" <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand
	<david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Davidlohr Bueso
	<dave@stgolabs.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, Heiko
 Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, Jonathan Corbet
	<corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt
	<palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring
	<robh@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, "Vasily Gorbik" <gor@linux.ibm.com>, Will Deacon
	<will@kernel.org>, Zi Yan <ziy@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-cxl@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <loongarch@lists.linux.dev>,
	<nvdimm@lists.linux.dev>, <sparclinux@vger.kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH v3 06/26] MIPS: loongson64: drop
 HAVE_ARCH_NODEDATA_EXTENSION
Message-ID: <20240801184738.00003e6e@Huawei.com>
In-Reply-To: <20240801060826.559858-7-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-7-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_184745_610378_A4005FFE 
X-CRM114-Status: GOOD (  17.98  )
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

On Thu,  1 Aug 2024 09:08:06 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Commit f8f9f21c7848 ("MIPS: Fix build error for loongson64 and
> sgi-ip27") added HAVE_ARCH_NODEDATA_EXTENSION to loongson64 to silence a
> compilation error that happened because loongson64 didn't define array
> of pg_data_t as node_data like most other architectures did.
> 
> After rename of __node_data to node_data arch_alloc_nodedata() and
> HAVE_ARCH_NODEDATA_EXTENSION can be dropped from loongson64.
> 
> Since it was the only user of HAVE_ARCH_NODEDATA_EXTENSION config option
> also remove this option from arch/mips/Kconfig.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

These are as you say now identical to the generic form, so
don't need a special version for any reason I can see.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> ---
>  arch/mips/Kconfig           |  4 ----
>  arch/mips/loongson64/numa.c | 10 ----------
>  2 files changed, 14 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ea5f3c3c31f6..43da6d596e2b 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -502,7 +502,6 @@ config MACH_LOONGSON64
>  	select USE_OF
>  	select BUILTIN_DTB
>  	select PCI_HOST_GENERIC
> -	select HAVE_ARCH_NODEDATA_EXTENSION if NUMA
>  	help
>  	  This enables the support of Loongson-2/3 family of machines.
>  
> @@ -2612,9 +2611,6 @@ config NUMA
>  config SYS_SUPPORTS_NUMA
>  	bool
>  
> -config HAVE_ARCH_NODEDATA_EXTENSION
> -	bool
> -
>  config RELOCATABLE
>  	bool "Relocatable kernel"
>  	depends on SYS_SUPPORTS_RELOCATABLE
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index b50ce28d2741..64fcfaa885b6 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -198,13 +198,3 @@ void __init prom_init_numa_memory(void)
>  	pr_info("CP0_PageGrain: CP0 5.1 (0x%x)\n", read_c0_pagegrain());
>  	prom_meminit();
>  }
> -
> -pg_data_t * __init arch_alloc_nodedata(int nid)
> -{
> -	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
> -}
> -
> -void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
> -{
> -	node_data[nid] = pgdat;
> -}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
