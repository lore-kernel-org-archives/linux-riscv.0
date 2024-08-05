Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A70C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oizS4ZR0TSiHs8Wn24VnZE1j8iUbmybD28omCOI42c0=; b=RS+CtGpWG1XWOe
	TmX2qW5sE7eKAOcHQhYhidE4BgtnEk4cg8eQ2bLGwd25/JLqwYqAcJSp8+UoBwY6sEdJrJgzmD3Qy
	vSzNkdJO2wqyGp0798ZKDsocRSg0JHDoayyQAcPSO9kGrUIp/w7sO3hj6OK6nKiXqCloYV8hdPSMu
	X94Reqkm6mHYLypfRjxRTcFvDBJ0X0kDAjiwBAKIQmr6nwAiwMdrdoSi+nkbYsSUR4mFagmQKXTQ6
	Ohqw5xqj6jjJFT5P25zSuXZQwO4t30YVSXTzhJEtqiW5E3732e6P6U+aVSoVVhs2G7E5D2vu76TLR
	pASUYE7US2DhDOIqlvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1La-0000000GezA-2IYf;
	Mon, 05 Aug 2024 17:18:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1L2-0000000Geof-3wrZ;
	Mon, 05 Aug 2024 17:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CBA960C67;
	Mon,  5 Aug 2024 17:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A951C32782;
	Mon,  5 Aug 2024 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722878259;
	bh=xUiHKiiFB+eGRf4/0vdH6U+v/YkOQHoLKaT521lWFxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7q/lW639aowtINXwVebTG+OLoxrXof+zBNSeR/8WY86B+624ZIuqcPJ12uz6WAq3
	 TOktvjQuFO3Psh/zSZk6bupzno8UjNgzGdjWYsGzuDHPa53tI5UwJrFUIiEWAMkla2
	 aZhopzXWwqHlnm+KETHsoZ8cxcOCV/ES/RMeaNClV0U/lI74zaSa7QLz8oGGmPM5b+
	 WVRXAQQqToAOAcGGygHFeY2KPxgU/pB39IDAe0i7d4FyqehFfReXcy3JQ8TWWNvwl/
	 YnEvZ6i15oUR+XxxozKV+u9zlrKVedpz+W1ReJtnBjYdPuNzzekfqSWqwV+cKpPHX5
	 XzWc8YkjVKQSQ==
Date: Mon, 5 Aug 2024 20:15:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 09/26] arch, mm: pull out allocation of NODE_DATA to
 generic code
Message-ID: <ZrEIqogZ4UJJY0c2@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-10-rppt@kernel.org>
 <20240802105527.00005240@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802105527.00005240@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_101741_090246_29DC7B12 
X-CRM114-Status: GOOD (  24.08  )
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

On Fri, Aug 02, 2024 at 10:55:27AM +0100, Jonathan Cameron wrote:
> On Thu,  1 Aug 2024 09:08:09 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Architectures that support NUMA duplicate the code that allocates
> > NODE_DATA on the node-local memory with slight variations in reporting
> > of the addresses where the memory was allocated.
> > 
> > Use x86 version as the basis for the generic alloc_node_data() function
> > and call this function in architecture specific numa initialization.
> > 
> > Round up node data size to SMP_CACHE_BYTES rather than to PAGE_SIZE like
> > x86 used to do since the bootmem era when allocation granularity was
> > PAGE_SIZE anyway.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> 
> One comment unrelated to this patch set as such, just made
> more obvious by it.
> 
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index 0744a9a2944b..3c1da08304d0 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -1093,27 +1093,9 @@ void __init dump_numa_cpu_topology(void)
> >  static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
> >  {
> >  	u64 spanned_pages = end_pfn - start_pfn;
> 
> Trivial, but might as well squash this local variable into the
> single place it's used.
 

> > -	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);

...

> > +
> > +	alloc_node_data(nid);
> > +
> >  	NODE_DATA(nid)->node_id = nid;
> >  	NODE_DATA(nid)->node_start_pfn = start_pfn;
> >  	NODE_DATA(nid)->node_spanned_pages = spanned_pages;

These are actually overridden later in free_area_init(), it would make
sense to audit all arch-specific node setup functions and clean them up a
bit.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
