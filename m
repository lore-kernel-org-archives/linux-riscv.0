Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD8DEB64D7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 23:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkaefMdQbBh2jrL0D9QvWuw/pTqsMF0gP+ovqg4CWTE=; b=BwPnk977wCX+ct
	k1ahXroqv+fo3WPcjcxu8ZWtVT1gdG1o1Jvs8/RxzMM8BUOlxY8iMrILRTjSHqJx+Ypb46sEJsJJY
	VQJAdd19880zurqja1eoEistlSKVEkIhbQkZPnis5wDqTHVZGPOSU32MXreQuMhWyM3cL9JxONnNe
	aMfjvLdHuVMlpQb93jboXoPqqGOQKdzweqTGSJmZAMDXWCK3au7pHGSXjXhrikPHVqd4wTgUp+1Fl
	Do8nnwSWtbBvCRD/UKsGujuJLxfM0HgRZ2jKlS4vIfg7Z+Qcoyunf7lgWnKwt1JnFH7nRZgXCX3Fv
	00B66JLy33nOoFInoP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB1be-006uzi-2B;
	Sun, 18 Jun 2023 23:14:50 +0000
Received: from out-40.mta0.migadu.com ([2001:41d0:1004:224b::28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB1ba-006uwm-1z
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jun 2023 23:14:48 +0000
Date: Sun, 18 Jun 2023 19:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1687130080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KNV5zwl+hLzM43CrYb9nr/b3a6OyCWH6RWURaog0Xso=;
	b=n8muyYIFu4NWn2jUrxuhNWtbUM5+mIauth+1Pc71A47mzFzPENac7CXSnCthrLOM9Mp8Vp
	ZC85r5mgKM1Z6DbUVT6Cjqrw0askzvY2hRQW+Cy+BiYrMDlad4Bi9in+atwC+gux88leWU
	Lsl3kE3f4XQNXRl/yeFL9WdFeIa4tAE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230618231431.4aj3k5ujye22sqai@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <87jzw0qu3s.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jzw0qu3s.ffs@tglx>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_161447_107316_F4B22B0A 
X-CRM114-Status: GOOD (  26.01  )
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

On Mon, Jun 19, 2023 at 12:32:55AM +0200, Thomas Gleixner wrote:
> Mike!
> 
> Sorry for being late on this ...
> 
> On Fri, Jun 16 2023 at 11:50, Mike Rapoport wrote:
> >  
> > +void *execmem_data_alloc(size_t size)
> > +{
> > +	unsigned long start = execmem_params.modules.data.start;
> > +	unsigned long end = execmem_params.modules.data.end;
> > +	pgprot_t pgprot = execmem_params.modules.data.pgprot;
> > +	unsigned int align = execmem_params.modules.data.alignment;
> > +	unsigned long fallback_start = execmem_params.modules.data.fallback_start;
> > +	unsigned long fallback_end = execmem_params.modules.data.fallback_end;
> > +	bool kasan = execmem_params.modules.flags & EXECMEM_KASAN_SHADOW;
> 
> While I know for sure that you read up on the discussion I had with Song
> about data structures, it seems you completely failed to understand it.
> 
> > +	return execmem_alloc(size, start, end, align, pgprot,
> > +			     fallback_start, fallback_end, kasan);
> 
> Having _seven_ intermediate variables to fill _eight_ arguments of a
> function instead of handing in @size and a proper struct pointer is
> tasteless and disgusting at best.
> 
> Six out of those seven parameters are from:
> 
>     execmem_params.module.data
> 
> while the KASAN shadow part is retrieved from
> 
>     execmem_params.module.flags
> 
> So what prevents you from having a uniform data structure, which is
> extensible and decribes _all_ types of allocations?
> 
> Absolutely nothing. The flags part can either be in the type dependend
> part or you make the type configs an array as I had suggested originally
> and then execmem_alloc() becomes:
> 
> void *execmem_alloc(type, size)
> 
> and
> 
> static inline void *execmem_data_alloc(size_t size)
> {
>         return execmem_alloc(EXECMEM_TYPE_DATA, size);
> }
> 
> which gets the type independent parts from @execmem_param.
> 
> Just read through your own series and watch the evolution of
> execmem_alloc():
> 
>   static void *execmem_alloc(size_t size)
> 
>   static void *execmem_alloc(size_t size, unsigned long start,
>                              unsigned long end, unsigned int align,
>                              pgprot_t pgprot)
> 
>   static void *execmem_alloc(size_t len, unsigned long start,
>                              unsigned long end, unsigned int align,
>                              pgprot_t pgprot,
>                              unsigned long fallback_start,
>                              unsigned long fallback_end,
>                              bool kasan)
> 
> In a month from now this function will have _ten_ parameters and tons of
> horrible wrappers which convert an already existing data structure into
> individual function arguments.
> 
> Seriously?
> 
> If you want this function to be [ab]used outside of the exec_param
> configuration space for whatever non-sensical reasons then this still
> can be either:
> 
> void *execmem_alloc(params, type, size)
> 
> static inline void *execmem_data_alloc(size_t size)
> {
>         return execmem_alloc(&exec_param, EXECMEM_TYPE_DATA, size);
> }
> 
> or
> 
> void *execmem_alloc(type_params, size);
> 
> static inline void *execmem_data_alloc(size_t size)
> {
>         return execmem_alloc(&exec_param.data, size);
> }
> 
> which both allows you to provide alternative params, right?
> 
> Coming back to my conversation with Song:
> 
>    "Bad programmers worry about the code. Good programmers worry about
>     data structures and their relationships."

Thomas, you're confusing an internal interface with external, I made the
same mistake reviewing Song's patchset...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
