Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5617BC25B6F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 10:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmMDqP8NElEQhio/2DuMwn1LHOzoc1zwkr7XdGIEBW0=; b=GIjugIzXoWiClF
	EGMil2kBPhnLLNHa8JV9NyWyEK0EL8JyV9gjNpwdayj2DZIxNJp4ZhYeNphUK/lttzuPxpptn+kmX
	eF6/88EctMxniKWrovXc0WeoEkE/bejBHm1O3N8f1Nq5mfO/kPhbFBP5Z7jqgjM+bCTVD3mX9WM02
	aPSL9HQIqIoIQerVARX3LjVddLd5s8ktIQDFWxcm4C9cyU5m8dJAgzDAjZ/EtQ0qLZzTLq/20fGYV
	h9N3HSLDdPLCYP1KyLU4j7Q4XFk2qVRZl1zbWJ69uDa6UO3+B5MEaNd7nxs2zNpAWRpvk8oTsJYpn
	z49ranbnlBLkWLqUCq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxXt-00EAXX-2J;
	Thu, 26 Oct 2023 10:24:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvxXo-00EAU0-0m;
	Thu, 26 Oct 2023 10:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 17FABB8077C;
	Thu, 26 Oct 2023 10:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DD8C433C8;
	Thu, 26 Oct 2023 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698315889;
	bh=WN2YIA4Ghusd7FbmcNZrWw/oKLuywPkap4tOfxaAQ4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZyX3dsziPkRUXG2UWwCRe9pQvhY4J8EKCi1UMJicG8n+1K8kuqLhkCHInfodKwhzx
	 IGdZJx3E0WGYfJuhn5slU+daxFVHZfLRqURf8zRCQM4mPgPcJg6TqmPoqs/pWtOypa
	 aGTSZPjPNBzHwtWONSwhXj/25YMcitUcojHP1kRQ49c14Z4eV6Kpw2ampGhmL7G6Sm
	 v7J3Ia4FdxDhFLmdhSb20AH9mufPj5bcJmpVjmk+yiUwvbVfd/gsYS5NT3Ej9E93W4
	 br849v8H22PcC0TOPiwgXMZFArfvyVNNVM97V2kwDBdHjqJI1bEYt3iRHEo7Tm6Bk9
	 Y3kn5Rw8Exupg==
Date: Thu, 26 Oct 2023 11:24:39 +0100
From: Will Deacon <will@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <20231026102438.GA6924@willie-the-truck>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
 <20231023171420.GA4041@willie-the-truck>
 <20231026085800.GK2824@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026085800.GK2824@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_032452_582932_AE0933BB 
X-CRM114-Status: GOOD (  29.07  )
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

On Thu, Oct 26, 2023 at 11:58:00AM +0300, Mike Rapoport wrote:
> On Mon, Oct 23, 2023 at 06:14:20PM +0100, Will Deacon wrote:
> > On Mon, Sep 18, 2023 at 10:29:46AM +0300, Mike Rapoport wrote:
> > > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > > index dd851297596e..cd6320de1c54 100644
> > > --- a/arch/arm64/kernel/module.c
> > > +++ b/arch/arm64/kernel/module.c
> > > @@ -20,6 +20,7 @@
> > >  #include <linux/random.h>
> > >  #include <linux/scs.h>
> > >  #include <linux/vmalloc.h>
> > > +#include <linux/execmem.h>
> > >  
> > >  #include <asm/alternative.h>
> > >  #include <asm/insn.h>
> > > @@ -108,46 +109,38 @@ static int __init module_init_limits(void)
> > >  
> > >  	return 0;
> > >  }
> > > -subsys_initcall(module_init_limits);
> > >  
> > > -void *module_alloc(unsigned long size)
> > > +static struct execmem_params execmem_params __ro_after_init = {
> > > +	.ranges = {
> > > +		[EXECMEM_DEFAULT] = {
> > > +			.flags = EXECMEM_KASAN_SHADOW,
> > > +			.alignment = MODULE_ALIGN,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +struct execmem_params __init *execmem_arch_params(void)
> > >  {
> > > -	void *p = NULL;
> > > +	struct execmem_range *r = &execmem_params.ranges[EXECMEM_DEFAULT];
> > >  
> > > -	/*
> > > -	 * Where possible, prefer to allocate within direct branch range of the
> > > -	 * kernel such that no PLTs are necessary.
> > > -	 */
> > 
> > Why are you removing this comment? I think you could just move it next
> > to the part where we set a 128MiB range.
>  
> Oops, my bad. Will add it back.

Thanks.

> > > -	if (module_direct_base) {
> > > -		p = __vmalloc_node_range(size, MODULE_ALIGN,
> > > -					 module_direct_base,
> > > -					 module_direct_base + SZ_128M,
> > > -					 GFP_KERNEL | __GFP_NOWARN,
> > > -					 PAGE_KERNEL, 0, NUMA_NO_NODE,
> > > -					 __builtin_return_address(0));
> > > -	}
> > > +	module_init_limits();
> > 
> > Hmm, this used to be run from subsys_initcall(), but now you're running
> > it _really_ early, before random_init(), so randomization of the module
> > space is no longer going to be very random if we don't have early entropy
> > from the firmware or the CPU, which is likely to be the case on most SoCs.
> 
> Well, it will be as random as KASLR. Won't that be enough?

I don't think that's true -- we have the 'kaslr-seed' property for KASLR,
but I'm not seeing anything like that for the module randomisation and I
also don't see why we need to set these limits so early.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
