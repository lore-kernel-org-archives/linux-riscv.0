Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E6C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 18:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rh5sD6+aGHTLGm2HdBCVn62wmUO5xh4iQdICrk+FL1g=; b=ozerXF8/BBt5h5
	haX2UgjXFPGNzyTIx7QIdbadzqov4fO6DAGkz/YB9WChl0geyPVH/04I4vWWCMQxo2BGUe/xz2r94
	HKcw/jmx+p6a5PIADmZHTW9gxGN5iF2UgGE4k5aMJhlE2UZSgh67f7KzffVQGmM0RSAIys93siJTO
	rBlPhaGn4b64aeMq4b1Y7oYXyjWnJRhr1Hb1zaZHoMveyrDIvYqe+Q14mldeuoLtA5OOxHIoLkACe
	wtjoBX3Romsbv97Rtoze5EWNJHxXY2MWSuOtyMnimOamE/k7hbGuhpyfNITbvR0UXiSov6ucN8WcW
	4quobqeqZaMq15TBwrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUs9g-00000003Ufl-3Jx9;
	Fri, 19 Jul 2024 18:16:32 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUs9K-00000003UYc-0wtS;
	Fri, 19 Jul 2024 18:16:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQd9q016gz6JBkF;
	Sat, 20 Jul 2024 02:14:39 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F7D11408FE;
	Sat, 20 Jul 2024 02:16:04 +0800 (CST)
Received: from localhost (10.48.157.16) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 19:16:03 +0100
Date: Fri, 19 Jul 2024 19:16:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, "Borislav
 Petkov" <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand
	<david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Carstens
	<hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "John Paul Adrian
 Glaubitz" <glaubitz@physik.fu-berlin.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon
	<will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>
Subject: Re: [PATCH 16/17] arch_numa: switch over to numa_memblks
Message-ID: <20240719191602.000075d2@Huawei.com>
In-Reply-To: <20240716111346.3676969-17-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-17-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.157.16]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_111610_563994_188EE6A0 
X-CRM114-Status: GOOD (  18.34  )
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

On Tue, 16 Jul 2024 14:13:45 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Until now arch_numa was directly translating firmware NUMA information
> to memblock.
> 
> Using numa_memblks as an intermediate step has a few advantages:
> * alignment with more battle tested x86 implementation
> * availability of NUMA emulation
> * maintaining node information for not yet populated memory
> 
> Replace current functionality related to numa_add_memblk() and
> __node_distance() with the implementation based on numa_memblks and add
> functions required by numa_emulation.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

One trivial comment inline,

Jonathan
>  /*
>   * Initialize NODE_DATA for a node on the local memory
>   */
> @@ -226,116 +204,9 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>  	NODE_DATA(nid)->node_spanned_pages = end_pfn - start_pfn;
>  }

>  
> @@ -454,3 +321,54 @@ void __init arch_numa_init(void)
>  
>  	numa_init(dummy_numa_init);
>  }
> +
> +#ifdef CONFIG_NUMA_EMU
> +void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
> +					unsigned int nr_emu_nids)
> +{
> +	int i, j;
> +
> +	/*
> +	 * Transform __apicid_to_node table to use emulated nids by

Comment needs an update seeing as there is no __apicid_to_node table
here.

> +	 * reverse-mapping phys_nid.  The maps should always exist but fall
> +	 * back to zero just in case.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(cpu_to_node_map); i++) {
> +		if (cpu_to_node_map[i] == NUMA_NO_NODE)
> +			continue;
> +		for (j = 0; j < nr_emu_nids; j++)
> +			if (cpu_to_node_map[i] == emu_nid_to_phys[j])
> +				break;
> +		cpu_to_node_map[i] = j < nr_emu_nids ? j : 0;
> +	}
> +}
> +
> +u64 __init numa_emu_dma_end(void)
> +{
> +	return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
