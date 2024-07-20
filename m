Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BC0C3DA59
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XM49/2Qe7GigN71TBWvNSCxxvhKZAEnqV4HtU4lQ2Gg=; b=KhpmXg3vc2A7T/
	3Y6AI+wgPJdcrcibKSMRnw/45tjeED6nA4SupvTrq4O2gkyattxuKl4cn2r8tjZeLF103T12Cw9lo
	rcy77ErWXJAwA0npnBJVkOQ4bkLh5Qs0yoODPQ7Kz3HpF8qtryQU8ExMycYciYcF5IVACADuvX3gf
	mN0GM71yHlrohdJgAL2w5mjG4x89Ae02BpvdZ/QELZuRBq8q6BtvDp/d8Nh8SExNOYV9QvgHoisp5
	kY7NgDDSnebTYkW4hK0Q2bhDmoh6P++hBmvQll4pIbq5BmGZH8+tZ7XBXxvxQUfFHfVs2oFUgCXik
	Xhukcyn69D9rgSge225w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV9K3-000000056To-3loe;
	Sat, 20 Jul 2024 12:36:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV9JW-000000056DA-3sRN;
	Sat, 20 Jul 2024 12:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D66260BC8;
	Sat, 20 Jul 2024 12:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907FAC2BD10;
	Sat, 20 Jul 2024 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721478949;
	bh=V1Mnl7GTUOfk7ipXzRO+FVNDqKlKteMfA0VSzXpSXNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cu7ixXhdpKHX3WYl+oqtYrBp4FSGOrMfYS7JdXXFb+TW6Nk+7hUsvPSx3dhiTlklx
	 eISAI9h3FnpKkm3821iYqQYW+t5vM3j/rQSfaM2c5ZSvkOS0dtVgUTa7UFD6+6Fd+V
	 Swzw7lpBQ3cR8gtADz0+ZYCaj8cVNbhDnVWIeoGj2CAcdZJxya924itwrRRURR8D7p
	 gdO9A2rVCcGxCsCfqgN6GjXc2Q+wsd6OQeVFtI5v6JPBQOlHrsAizNhEVEwpmqQI8J
	 i+jsVT9EkWlzCyda1fYMGW9njAt5+hODmpTx/amSTJslyC8uufTXXBFDjlNyKbHrDE
	 CHtZSP6W18ryg==
Date: Sat, 20 Jul 2024 15:32:34 +0300
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 15/17] mm: make numa_memblks more self-contained
Message-ID: <ZpuuYnMCd8RRZEcH@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-16-rppt@kernel.org>
 <20240719190712.00001307@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719190712.00001307@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_053551_105492_30B5909F 
X-CRM114-Status: GOOD (  39.38  )
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

On Fri, Jul 19, 2024 at 07:07:12PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:44 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Introduce numa_memblks_init() and move some code around to avoid several
> > global variables in numa_memblks.
> 
> Hi Mike,
> 
> Adding the effectively always on memblock_force_top_down
> deserves a comment on why. I assume because you are going to do
> something with it later? 

Yes, arch_numa sets it to false. I'll add a note in the changelog.

> There also seems to be more going on in here such as the change to
> get_pfn_range_for_nid()  Perhaps break this up so each
> change can have an explanation. 
 
Ok.
 
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/mm/numa.c           | 53 ++++---------------------
> >  include/linux/numa_memblks.h |  9 +----
> >  mm/numa_memblks.c            | 77 +++++++++++++++++++++++++++---------
> >  3 files changed, 68 insertions(+), 71 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 3848e68d771a..16bc703c9272 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -115,30 +115,19 @@ void __init setup_node_to_cpumask_map(void)
> >  	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
> >  }
> >  
> > -static int __init numa_register_memblks(struct numa_meminfo *mi)
> > +static int __init numa_register_nodes(void)
> >  {
> > -	int i, nid, err;
> > -
> > -	err = numa_register_meminfo(mi);
> > -	if (err)
> > -		return err;
> > +	int nid;
> >  
> >  	if (!memblock_validate_numa_coverage(SZ_1M))
> >  		return -EINVAL;
> >  
> >  	/* Finally register nodes. */
> >  	for_each_node_mask(nid, node_possible_map) {
> > -		u64 start = PFN_PHYS(max_pfn);
> > -		u64 end = 0;
> > -
> > -		for (i = 0; i < mi->nr_blks; i++) {
> > -			if (nid != mi->blk[i].nid)
> > -				continue;
> > -			start = min(mi->blk[i].start, start);
> > -			end = max(mi->blk[i].end, end);
> > -		}
> > +		unsigned long start_pfn, end_pfn;
> >  
> > -		if (start >= end)
> > +		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
> 
> It's not immediately obvious to me that this code is equivalent so I'd
> prefer it in a separate patch with some description of why
> it is a valid change.

Will do.
 
> > +		if (start_pfn >= end_pfn)
> >  			continue;
> >  
> >  		alloc_node_data(nid);
> > @@ -178,39 +167,11 @@ static int __init numa_init(int (*init_func)(void))
> >  	for (i = 0; i < MAX_LOCAL_APIC; i++)
> >  		set_apicid_to_node(i, NUMA_NO_NODE);
> >  
> > -	nodes_clear(numa_nodes_parsed);
> > -	nodes_clear(node_possible_map);
> > -	nodes_clear(node_online_map);
> > -	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
> > -	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
> > -				  NUMA_NO_NODE));
> > -	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
> > -				  NUMA_NO_NODE));
> > -	/* In case that parsing SRAT failed. */
> > -	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
> > -	numa_reset_distance();
> > -
> > -	ret = init_func();
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	/*
> > -	 * We reset memblock back to the top-down direction
> > -	 * here because if we configured ACPI_NUMA, we have
> > -	 * parsed SRAT in init_func(). It is ok to have the
> > -	 * reset here even if we did't configure ACPI_NUMA
> > -	 * or acpi numa init fails and fallbacks to dummy
> > -	 * numa init.
> > -	 */
> > -	memblock_set_bottom_up(false);
> > -
> > -	ret = numa_cleanup_meminfo(&numa_meminfo);
> > +	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ true);
> The comment in parameter list seems unnecessary.
> Maybe add a comment above the call instead if need to call that out?

I'll drop it for now.
 
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	numa_emulation(&numa_meminfo, numa_distance_cnt);
> > -
> > -	ret = numa_register_memblks(&numa_meminfo);
> > +	ret = numa_register_nodes();
> >  	if (ret < 0)
> >  		return ret;
> >  
> 
> > diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
> > index e0039549aaac..640f3a3ce0ee 100644
> > --- a/mm/numa_memblks.c
> > +++ b/mm/numa_memblks.c
> > @@ -7,13 +7,27 @@
> >  #include <linux/numa.h>
> >  #include <linux/numa_memblks.h>
> >  
> 
> > +/*
> > + * Set nodes, which have memory in @mi, in *@nodemask.
> > + */
> > +static void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
> > +					      const struct numa_meminfo *mi)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
> > +		if (mi->blk[i].start != mi->blk[i].end &&
> > +		    mi->blk[i].nid != NUMA_NO_NODE)
> > +			node_set(mi->blk[i].nid, *nodemask);
> > +}
> 
> The code move doesn't have an obvious purpose. Maybe call that
> out in the patch description if it is needed for a future patch.
> Or do it in two goes so first just adds the static, 2nd shuffles
> the code.
 
Before the move numa_nodemask_from_meminfo() was global so it was ok to
define it after its callers.
I'll split this into a separate commit.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
