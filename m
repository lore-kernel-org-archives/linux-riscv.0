Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13935C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/ulQt0ddhN1/cT+timoPQp3HYNCVs2k8SYKL3P+SoM=; b=4sCTHiQwVEf2Gc
	NusZ6YmhNAizDjtnKugDIINM3TBzuR4dH3+i4LdMV6/18d/kxxaYfcmzo0pBM3DVqwZivzwDkeuvF
	kRaHW6q6T5vJhb5YItjn3t7B6oNU1ZWjO9wOlKYIvAtUDW6P/RjqAZm0Mt9TUYs8R8S5ooqlxpVHQ
	eD/tTovUwFzEVuY7nokc8ci8pTGzDwLJQ9unePVxeDF8R1gRhrC1sxtAd7hr/FsfF870TmONqU3Gf
	gRsmQJgFDputNMllobqVC2OkjgmwCMQuVHjeDZJiO0JeCPf87dTh34As1iq3aNFACY+ZWrt3VEasb
	dsLheVDZTxW8KZaPu1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q51Bw-006Oyx-1D;
	Fri, 02 Jun 2023 09:35:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q51Br-006OwF-31;
	Fri, 02 Jun 2023 09:35:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ACE41063;
	Fri,  2 Jun 2023 02:36:05 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.24.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF4863F7BD;
	Fri,  2 Jun 2023 02:35:14 -0700 (PDT)
Date: Fri, 2 Jun 2023 10:35:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHjgIH3aX9dCvVZc@moria.home.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_023524_089115_900A6996 
X-CRM114-Status: GOOD (  32.42  )
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

On Thu, Jun 01, 2023 at 02:14:56PM -0400, Kent Overstreet wrote:
> On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> > For a while I have wanted to give kprobes its own allocator so that it can work
> > even with CONFIG_MODULES=n, and so that it doesn't have to waste VA space in
> > the modules area.
> > 
> > Given that, I think these should have their own allocator functions that can be
> > provided independently, even if those happen to use common infrastructure.
> 
> How much memory can kprobes conceivably use? I think we also want to try
> to push back on combinatorial new allocators, if we can.

That depends on who's using it, and how (e.g. via BPF).

To be clear, I'm not necessarily asking for entirely different allocators, but
I do thinkg that we want wrappers that can at least pass distinct start+end
parameters to a common allocator, and for arm64's modules code I'd expect that
we'd keep the range falblack logic out of the common allcoator, and just call
it twice.

> > > Several architectures override module_alloc() because of various
> > > constraints where the executable memory can be located and this causes
> > > additional obstacles for improvements of code allocation.
> > > 
> > > This set splits code allocation from modules by introducing
> > > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
> > > sites of module_alloc() and module_memfree() with the new APIs and
> > > implements core text and related allocation in a central place.
> > > 
> > > Instead of architecture specific overrides for module_alloc(), the
> > > architectures that require non-default behaviour for text allocation must
> > > fill jit_alloc_params structure and implement jit_alloc_arch_params() that
> > > returns a pointer to that structure. If an architecture does not implement
> > > jit_alloc_arch_params(), the defaults compatible with the current
> > > modules::module_alloc() are used.
> > 
> > As above, I suspect that each of the callsites should probably be using common
> > infrastructure, but I don't think that a single jit_alloc_arch_params() makes
> > sense, since the parameters for each case may need to be distinct.
> 
> I don't see how that follows. The whole point of function parameters is
> that they may be different :)

What I mean is that jit_alloc_arch_params() tries to aggregate common
parameters, but they aren't actually common (e.g. the actual start+end range
for allocation).

> Can you give more detail on what parameters you need? If the only extra
> parameter is just "does this allocation need to live close to kernel
> text", that's not that big of a deal.

My thinking was that we at least need the start + end for each caller. That
might be it, tbh.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
