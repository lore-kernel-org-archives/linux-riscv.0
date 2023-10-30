Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ABDC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 07:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6epdFVFCqBA/REZQepiqFGlDU6MreC4ufjE1B4BXJd8=; b=YE7DV4Ll2s8dPY
	B5+92XXsxsX7RSyn3HzbZmOqTJzqmyg/xl5tyZIwoHmNJUnWdX6FB/pj14Ao521cArQRPKJvQeAPx
	8c/gvyV9aubo8ipg5NGeSB9QHiLDGVdra7SyF/DpwSBVvFa1Melp7OlrJ1uMdlK7prbaV7LqgiUwe
	j1NAtoH44QvweN7f/SpV4g8l8I8VjxGnyHzwSWSVW/6e7QPkjTwtYFEv8YOp+WvTvmo77pt6CXFtH
	7ptkf27vdTLTFQoG4fLFhZN2o5did5vY31iZITwT8AHpXY67lFm32yh+eGroniMjreXba+iCjvNcJ
	CQVbSS7KVpLxlOS1DlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxMH7-002i3X-0T;
	Mon, 30 Oct 2023 07:01:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxMH0-002i0V-20;
	Mon, 30 Oct 2023 07:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E4CE8CE12E4;
	Mon, 30 Oct 2023 07:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B1CC433C7;
	Mon, 30 Oct 2023 07:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698649274;
	bh=EmJn7V2xcCxlebppxaDAhU12OFutDZWRBy0vMaSrWuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyer+0uyv1jhu2jxdwK+n1O2/sIgGI7ezOwxQC871hHJ3Cd/JKl9lBlO3pXltUpO2
	 tybWUbFkw8nG3yYnKj5NWsk/KsMeh5cYt2Zf06cFoE4cK0SwwSOQ0meQsCZJmwrLES
	 ZjfIwnoeXu/25/54cCJrG0ThSOL/VsSYVOr1W/9QTaMgDvrgblTvcHPZrDSbxEy8fw
	 AT95UrDI+b348FRlIe6JpCkizTZtGaE3kNe+nAOZWv5ZyGWJevSARlVxf0OsNjI/Uk
	 BM7kNTKVl9T3dS3d/hE9ctd5XEbBUeRh4TuIA6DuyqF/4ni+SgBncpCAAQy/vXTAcB
	 87xr+yc2RIXWg==
Date: Mon, 30 Oct 2023 09:00:53 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
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
	Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20231030070053.GL2824@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
 <20231023171420.GA4041@willie-the-truck>
 <20231026085800.GK2824@kernel.org>
 <20231026102438.GA6924@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026102438.GA6924@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_000119_026913_C347BC33 
X-CRM114-Status: GOOD (  24.20  )
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

On Thu, Oct 26, 2023 at 11:24:39AM +0100, Will Deacon wrote:
> On Thu, Oct 26, 2023 at 11:58:00AM +0300, Mike Rapoport wrote:
> > On Mon, Oct 23, 2023 at 06:14:20PM +0100, Will Deacon wrote:
> > > On Mon, Sep 18, 2023 at 10:29:46AM +0300, Mike Rapoport wrote:
> > > > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > > > index dd851297596e..cd6320de1c54 100644
> > > > --- a/arch/arm64/kernel/module.c
> > > > +++ b/arch/arm64/kernel/module.c

...

> > > > -	if (module_direct_base) {
> > > > -		p = __vmalloc_node_range(size, MODULE_ALIGN,
> > > > -					 module_direct_base,
> > > > -					 module_direct_base + SZ_128M,
> > > > -					 GFP_KERNEL | __GFP_NOWARN,
> > > > -					 PAGE_KERNEL, 0, NUMA_NO_NODE,
> > > > -					 __builtin_return_address(0));
> > > > -	}
> > > > +	module_init_limits();
> > > 
> > > Hmm, this used to be run from subsys_initcall(), but now you're running
> > > it _really_ early, before random_init(), so randomization of the module
> > > space is no longer going to be very random if we don't have early entropy
> > > from the firmware or the CPU, which is likely to be the case on most SoCs.
> > 
> > Well, it will be as random as KASLR. Won't that be enough?
> 
> I don't think that's true -- we have the 'kaslr-seed' property for KASLR,
> but I'm not seeing anything like that for the module randomisation and I
> also don't see why we need to set these limits so early.

x86 needs execmem initialized before ftrace_init() so I thought it would be
best to setup execmem along with most of MM in mm_core_init().

I'll move execmem initialization for !x86 to a later point, say
core_initcall.
 
> Will

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
