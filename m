Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C15DC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpn9WQ3zpKt2CQNgz9ZKg/pyVIYrICITMd4tHvdXjFw=; b=HcFw04nVeEjDSZ
	95GXzeyDRiLijV80TcBoIjcsSoJTa77CMcDTqEhvBhiMuGR0eFKiaKIWBH38UA1snG6NET+5Jmwd/
	BROBMY7MBoCSriRvWklt2/f3ohmcSMPdLnL9x2DOePPxtPOkr9ux3Iyvby2BNQhuV0G/xgR29Cn0y
	7Fyw7rlDtcPbJIHHMPhbofvDPoqqaLgCUvRk8xkSvWnjrWdC6wrH0dupkKpkv3Q8ZGv6glscP3kfj
	uKVDMI8Qe62pBG/J4pFvbHiEFv/KjUyi1qKPGBZ1BPieGXuHhfD+20V5xCBYptGSBhvp3B6lxcVjY
	v9JhLsGwUrsUKCZg2uTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnt0-00000008mMN-1GsL;
	Mon, 22 Jul 2024 07:55:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnsT-00000008mCg-03yt;
	Mon, 22 Jul 2024 07:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E9936027F;
	Mon, 22 Jul 2024 07:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDAAC116B1;
	Mon, 22 Jul 2024 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721634874;
	bh=OYRHdXxfKMdclKQlgCt5VIPfcSGA+/ROfi++yX8letM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oG5YJpR0vvG3aK5NTi3fHWDP8/wPCXQEHPpVI03jXrmGjAqE/3ek11pgDez93GupD
	 MYY5cht8NtUour0LZG0EOmrqfl/+OGAQSwhfArqnV9dkDfvXzt+BYN0GoRqQLdf0w8
	 YDUR98pajEJ8JNfue+NyDcAaZ9Iwtukzez1OaHeCmGruaLhg9UE9Wgr4pPcIvv5uiw
	 dIFU4pKtQYikq/zjd4jZhqdwQH73y8o8PB2Iwv4e6pw08hibJoHxG/W9t5i5ZVahkj
	 dZ6r/bQd4gp9OtjoJH+9/yH+xOhOU700mNl2aycElgfDFiCdhzErMhj4jiW1C3Hzxx
	 qgTOP+LBC9IQQ==
Date: Mon, 22 Jul 2024 10:51:25 +0300
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
Subject: Re: [PATCH 06/17] x86/numa: simplify numa_distance allocation
Message-ID: <Zp4PfVZKAg3djFOu@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-7-rppt@kernel.org>
 <20240719172849.000019a0@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719172849.000019a0@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_005437_145009_DAE410B3 
X-CRM114-Status: GOOD (  32.35  )
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

On Fri, Jul 19, 2024 at 05:28:49PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:35 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Allocation of numa_distance uses memblock_phys_alloc_range() to limit
> > allocation to be below the last mapped page.
> > 
> > But NUMA initializaition runs after the direct map is populated and
> 
> initialization (one too many 'i's)

Thanks.
 
> > there is also code in setup_arch() that adjusts memblock limit to
> > reflect how much memory is already mapped in the direct map.
> > 
> > Simplify the allocation of numa_distance and use plain memblock_alloc().
> > This makes the code clearer and ensures that when numa_distance is not
> > allocated it is always NULL.
> Doesn't this break the comment in numa_set_distance() kernel-doc?
> "
>  * If such table cannot be allocated, a warning is printed and further
>  * calls are ignored until the distance table is reset with
>  * numa_reset_distance().
> "
> 
> Superficially that looks to be to avoid repeatedly hitting the
> singleton bit at the top of numa_set_distance() as SRAT or similar
> parsing occurs.

I believe it's there to avoid allocation of numa_distance in the middle of
distance parsing (SLIT or DT numa-distance-map).

If the allocation fails for the first element in the table, the
numa_distance and numa_distance_cnt remain zero and node_distance() falls
back to

	return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;

It's different from arch_numa that always tries to allocate MAX_NUMNODES *
MAX_NUMNODES for numa_distance and treats the allocation failure as a
failure to initialize NUMA.

I like the general approach x86 uses more, i.e. in case distance parsing
fails in some way NUMA is still initialized with probably suboptimal
distances between nodes.

I'm going to restore that "singleton" behavior for now and will look into
making this all less cumbersome later.
 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/mm/numa.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 5e1dde26674b..ab2d4ecef786 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -319,8 +319,7 @@ void __init numa_reset_distance(void)
> >  {
> >  	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
> >  
> > -	/* numa_distance could be 1LU marking allocation failure, test cnt */
> > -	if (numa_distance_cnt)
> > +	if (numa_distance)
> >  		memblock_free(numa_distance, size);
> >  	numa_distance_cnt = 0;
> >  	numa_distance = NULL;	/* enable table creation */
> > @@ -331,7 +330,6 @@ static int __init numa_alloc_distance(void)
> >  	nodemask_t nodes_parsed;
> >  	size_t size;
> >  	int i, j, cnt = 0;
> > -	u64 phys;
> >  
> >  	/* size the new table and allocate it */
> >  	nodes_parsed = numa_nodes_parsed;
> > @@ -342,16 +340,12 @@ static int __init numa_alloc_distance(void)
> >  	cnt++;
> >  	size = cnt * cnt * sizeof(numa_distance[0]);
> >  
> > -	phys = memblock_phys_alloc_range(size, PAGE_SIZE, 0,
> > -					 PFN_PHYS(max_pfn_mapped));
> > -	if (!phys) {
> > +	numa_distance = memblock_alloc(size, PAGE_SIZE);
> > +	if (!numa_distance) {
> >  		pr_warn("Warning: can't allocate distance table!\n");
> > -		/* don't retry until explicitly reset */
> > -		numa_distance = (void *)1LU;
> >  		return -ENOMEM;
> >  	}
> >  
> > -	numa_distance = __va(phys);
> >  	numa_distance_cnt = cnt;
> >  
> >  	/* fill with the default distances */
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
