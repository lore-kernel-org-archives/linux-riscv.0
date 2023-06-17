Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86520EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 05:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9wWx8RnFNxbbmTlJ3QXRafNmdfYk3S7fUFxWNYpje4=; b=xd/6mZqafXmeSz
	aW5apmG6spF0iIK7KmU0oVGHnIF8jIh3Zjdzsb4SzNNrzr0qwMlnA5UID5/29wBKmZ1YVK1x+cN5e
	kA8kYj1IgcdqLGaN5781EjkycpzoQe9wOAjeoddUcpcwF6eH55S2szAV8FNrCAUnf2oPJDJD06K+j
	gZdgvq8/lv+xvrLm/dKufrO5dpizeYGmNavpxgWJogjKwnc83Bt3cYe3NEY7hrIiGOMmnWLC7nKYG
	bMHz1cKVaGeoM3yA8YowpVczCgGL5Q5/APUK/WaKrgb2AqySBh82QdPZniaFjSnkfhgWa3ls5ECsw
	aorHcyriaDKt6GLr9/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAOxA-002pSc-0V;
	Sat, 17 Jun 2023 05:58:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAOx5-002pPz-28;
	Sat, 17 Jun 2023 05:58:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73E2760D2D;
	Sat, 17 Jun 2023 05:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA841C433C8;
	Sat, 17 Jun 2023 05:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686981501;
	bh=9SqjLlF2xzEFMDzeUI2FvZ8TQ/VYLeU5U3+d2ag6lCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9hc07/UYnnRas23n9bJwWr+pH130gxwd28u02GqPOK/3pfJBCaemAnqVGrkDZJvc
	 c1CAOIsikGJgqoHvH/7lYMCMhV6ZKfKOSUTWgFsy65h+ShXGvPeLAwohq+3h4qZEdI
	 4hdYWdRJ1+jHavy8l0eCEiP9dZuoxTKyc1UOJ6v+W6Yd8E12mVMWzVMrv38nPKgPzX
	 moqJqCymmH/VJkuy+GUQ7PHhVA13ypUE+mj0CzOEMjMShVb3ccT9eDbLaWG8SQqxxA
	 PHzQL4oLwI3nEQGSA+tdAQmm6prwylQLhbSagwZslqD3uTtetH44zVkHm5GQY4CCKg
	 LaEhwb1fWA+nA==
Date: Sat, 17 Jun 2023 08:57:35 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
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
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and
 jit_text_alloc()
Message-ID: <20230617055735.GN52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <ZIySQgafdTHk5Yet@moria.home.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZIySQgafdTHk5Yet@moria.home.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_225823_775041_A468378A 
X-CRM114-Status: GOOD (  24.24  )
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

On Fri, Jun 16, 2023 at 12:48:02PM -0400, Kent Overstreet wrote:
> On Fri, Jun 16, 2023 at 11:50:28AM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > module_alloc() is used everywhere as a mean to allocate memory for code.
> > 
> > Beside being semantically wrong, this unnecessarily ties all subsystems
> > that need to allocate code, such as ftrace, kprobes and BPF to modules
> > and puts the burden of code allocation to the modules code.
> > 
> > Several architectures override module_alloc() because of various
> > constraints where the executable memory can be located and this causes
> > additional obstacles for improvements of code allocation.
> > 
> > Start splitting code allocation from modules by introducing
> > execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free() APIs.
> > 
> > Initially, execmem_text_alloc() and jit_text_alloc() are wrappers for
> > module_alloc() and execmem_free() and jit_free() are replacements of
> > module_memfree() to allow updating all call sites to use the new APIs.
> > 
> > The intention semantics for new allocation APIs:
> > 
> > * execmem_text_alloc() should be used to allocate memory that must reside
> >   close to the kernel image, like loadable kernel modules and generated
> >   code that is restricted by relative addressing.
> > 
> > * jit_text_alloc() should be used to allocate memory for generated code
> >   when there are no restrictions for the code placement. For
> >   architectures that require that any code is within certain distance
> >   from the kernel image, jit_text_alloc() will be essentially aliased to
> >   execmem_text_alloc().
> > 
> > The names execmem_text_alloc() and jit_text_alloc() emphasize that the
> > allocated memory is for executable code, the allocations of the
> > associated data, like data sections of a module will use
> > execmem_data_alloc() interface that will be added later.
> 
> I like the API split - at the risk of further bikeshedding, perhaps
> near_text_alloc() and far_text_alloc()? Would be more explicit.

With near and far it should mention from where and that's getting too long.
I don't mind changing the names, but I couldn't think about something
better than Song's execmem and your jit.
 
> Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>

Thanks!

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
