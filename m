Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40872C52D6F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Aug 2024 18:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSJPXZCi0gH7oI4jLaW0eUsLGcbivpiRS1kzxeFC05I=; b=VsbD6Px8/w1EqX
	mtwCUhG24t7VKu0ZBu8Qe4PYWaD1SO0F0FVE/EzpVHciMx+CFvrxLryrxobRhePoeITyWPYmv+Koo
	7hmc3Saj9OY2rA7jk/CBQb/Z+y74QuhoM/XkLA3/w/ASDqYswlHUTRodlUrOXyn4qpv8775sdEs43
	7/jqXX4/rdIFJs0I4r9MwewHJPx3j2XcOpomTNpRbcgk9SXDwkl2xBafjOsET+6B5CUsQgDZ6G2Dz
	2qm/LoGf41nke313r5PZhnJdlrvLnvTOtnBjPjZWFRXGIGrX6Op+OHiGfEyrv5iG93oo4/EpIy1K5
	1RzMYmb7Gz6bg7IsckIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saJxq-0000000Bvcq-3W4w;
	Sat, 03 Aug 2024 18:58:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saJxI-0000000BvQ1-1hrs;
	Sat, 03 Aug 2024 18:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45FFA614E5;
	Sat,  3 Aug 2024 18:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93706C116B1;
	Sat,  3 Aug 2024 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1722711495;
	bh=Tpqmomamf68VJd3BX6Aa+aldBw76MPQW/c629qHRnbg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o5Y2RmaxDgbz57iITn10F1azWivNnKphArt1mFz2o1k24QgUghcLPFcCl4Skc3J7n
	 2U6mfRYJicjGnJ/Lcha0tyWotwjt/73kHML1EvfQheasAaHT4z+JnEhKa6yfFin34R
	 FpUPzEcCObDFHQbrY87xJxqJmIAHp6RYNOzd/x7s=
Date: Sat, 3 Aug 2024 11:58:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Mike Rapoport <rppt@kernel.org>, <linux-kernel@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson
 <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, "Borislav Petkov"
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand
 <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Davidlohr
 Bueso <dave@stgolabs.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, Heiko Carstens <hca@linux.ibm.com>, Huacai
 Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, "John Paul Adrian Glaubitz"
 <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, Michael
 Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>,
 "Vasily Gorbik" <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zi Yan
 <ziy@nvidia.com>, <devicetree@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-cxl@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <loongarch@lists.linux.dev>,
 <nvdimm@lists.linux.dev>, <sparclinux@vger.kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH v3 07/26] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Message-Id: <20240803115813.809f808f1afbe9f9feaae129@linux-foundation.org>
In-Reply-To: <20240802104922.000051a0@Huawei.com>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-8-rppt@kernel.org>
	<20240802104922.000051a0@Huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240803_115816_572701_5AE746C2 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, 2 Aug 2024 10:49:22 +0100 Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -1838,11 +1838,10 @@ void __init free_area_init(unsigned long *max_zone_pfn)
> >  
> >  		if (!node_online(nid)) {
> >  			/* Allocator not initialized yet */
> > -			pgdat = arch_alloc_nodedata(nid);
> > +			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
> >  			if (!pgdat)
> >  				panic("Cannot allocate %zuB for node %d.\n",
> >  				       sizeof(*pgdat), nid);
> > -			arch_refresh_nodedata(nid, pgdat);
> 
> This allocates pgdat but never sets node_data[nid] to it
> and promptly leaks it on the line below. 
> 
> Just to sanity check this I spun up a qemu machine with no memory
> initially present on some nodes and it went boom as you'd expect.
> 
> I tested with addition of
> 			NODE_DATA(nid) = pgdat;
> and it all seems to work as expected.

Thanks, I added that.  It blew up on x86_64 allnoconfig because
node_data[] (and hence NODE_DATA()) isn't an lvalue when CONFIG_NUMA=n.

I'll put some #ifdef CONFIG_NUMAs in there for now but

a) NODE_DATA() is upper-case. Implies "constant".  Shouldn't be assigned to.

b) NODE_DATA() should be non-lvalue when CONFIG_NUMA=y also.  But no,
   we insist on implementing things in cpp instead of in C.

c) In fact assigning to anything which ends in "()" is nuts.  Please
   clean up my tempfix.

c) Mike, generally I'm wondering if there's a bunch of code here
   which isn't needed on CONFIG_NUMA=n.  Please check all of this for
   unneeded bloatiness.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
