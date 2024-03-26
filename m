Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E22C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Om9x0GuCvsFbu3Njv1Tx8a6A/JP+Vkj6KHnGeKdKDnk=; b=HZ40W3kK+WLw2r
	a38QyZ4Y27zCVlN+5rmwSs5wWilka4lJD3MolS6Ciz5Cov5ZPhIgaY4q45SLRbQVTWHxgunVpYLs3
	E92BjVtGOAIw9IDCeLPpfMneVtU7SshhmSAUf98TQOM4Msf0UKtAqUr/+7DD6+EtI3bi1pPDJN3mU
	8AzbOmt+ophW6519oJljLBxE9IR8U0F2KEUwF07fkMMD2yV1/B+SDALzBJhiJKzgEJnLw+6cF7jjF
	MeF386GdWRVQqYrL4kjulGwLOAqzYmhVJRfjOvIbTh3ZwWGfI0aE6IaogR/8rLEbcb+V5p5C3B1Os
	hxWV0ySMANt4sMmNNIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAI6-00000005eFp-0tv1;
	Tue, 26 Mar 2024 17:08:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAI2-00000005eFJ-3quk
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 17:08:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60DE7612B1;
	Tue, 26 Mar 2024 17:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB519C433C7;
	Tue, 26 Mar 2024 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711472926;
	bh=dN0gSZu3c0pxIjenuKrXn6qbTPv74OtuYtIXmx816Hs=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=GCgKlokxyRXixrqHZzn8I1AIoBJ0ecd+jM/ZVJN9PAucXybFzeAI6IsH/VxWnfi7S
	 u7BDQlPUMMRksvVb4pBamsY7npGn3aKwiY6IvAdyJQ4JGRbyGPkXUxCaQWIKNH1jjO
	 Wtt1BTn3CnbvVBt/bNgQ1xXcFDOjrI8lLI0rtclaHmrpQsnELcA4K3sKo548YpgDPk
	 uWjF7tJKgZjdgIMR9QsNtqaUGxFiG5Qs1Q+HwHNt8nduqYvkwV42MhPh5pPxCa+rEk
	 SHLOYxccQ+2Nr9UC+kjK+YooUmSWyB9TV0NY8GnPiTvoBRfocCFOPCQM+ocTzg8uj4
	 CHq+M4LEplw/g==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 19:08:41 +0200
Message-Id: <D03UIM5QZUZ8.2G6OHP1IM17OU@kernel.org>
To: "Masami Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland"
 <mark.rutland@arm.com>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Naveen N .
 Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 <linux-trace-kernel@vger.kernel.org>, "Calvin Owens"
 <jcalvinowens@gmail.com>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240323232908.13261-1-jarkko@kernel.org>
 <20240325115632.04e37297491cadfbbf382767@kernel.org>
 <ZgLfsvbCZj2S6fRE@FVFF77S0Q05N.cambridge.arm.com>
 <20240327002403.62649aee45508b7a16caedba@kernel.org>
In-Reply-To: <20240327002403.62649aee45508b7a16caedba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_100847_061900_9F04EA0F 
X-CRM114-Status: GOOD (  28.34  )
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

On Tue Mar 26, 2024 at 5:24 PM EET, Masami Hiramatsu (Google) wrote:
> On Tue, 26 Mar 2024 14:46:10 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
>
> > Hi Masami,
> > 
> > On Mon, Mar 25, 2024 at 11:56:32AM +0900, Masami Hiramatsu wrote:
> > > Hi Jarkko,
> > > 
> > > On Sun, 24 Mar 2024 01:29:08 +0200
> > > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > 
> > > > Tracing with kprobes while running a monolithic kernel is currently
> > > > impossible due the kernel module allocator dependency.
> > > > 
> > > > Address the issue by allowing architectures to implement module_alloc()
> > > > and module_memfree() independent of the module subsystem. An arch tree
> > > > can signal this by setting HAVE_KPROBES_ALLOC in its Kconfig file.
> > > > 
> > > > Realize the feature on RISC-V by separating allocator to module_alloc.c
> > > > and implementing module_memfree().
> > > 
> > > Even though, this involves changes in arch-independent part. So it should
> > > be solved by generic way. Did you checked Calvin's thread?
> > > 
> > > https://lore.kernel.org/all/cover.1709676663.git.jcalvinowens@gmail.com/
> > > 
> > > I think, we'd better to introduce `alloc_execmem()`,
> > > CONFIG_HAVE_ALLOC_EXECMEM and CONFIG_ALLOC_EXECMEM at first
> > > 
> > >   config HAVE_ALLOC_EXECMEM
> > > 	bool
> > > 
> > >   config ALLOC_EXECMEM
> > > 	bool "Executable trampline memory allocation"
> > > 	depends on MODULES || HAVE_ALLOC_EXECMEM
> > > 
> > > And define fallback macro to module_alloc() like this.
> > > 
> > > #ifndef CONFIG_HAVE_ALLOC_EXECMEM
> > > #define alloc_execmem(size, gfp)	module_alloc(size)
> > > #endif
> > 
> > Please can we *not* do this? I think this is abstracting at the wrong level (as
> > I mentioned on the prior execmem proposals).
> > 
> > Different exectuable allocations can have different requirements. For example,
> > on arm64 modules need to be within 2G of the kernel image, but the kprobes XOL
> > areas can be anywhere in the kernel VA space.
> > 
> > Forcing those behind the same interface makes things *harder* for architectures
> > and/or makes the common code more complicated (if that ends up having to track
> > all those different requirements). From my PoV it'd be much better to have
> > separate kprobes_alloc_*() functions for kprobes which an architecture can then
> > choose to implement using a common library if it wants to.
> > 
> > I took a look at doing that using the core ifdeffery fixups from Jarkko's v6,
> > and it looks pretty clean to me (and works in testing on arm64):
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=kprobes/without-modules
> > 
> > Could we please start with that approach, with kprobe-specific alloc/free code
> > provided by the architecture?
>
> OK, as far as I can read the code, this method also works and neat! 
> (and minimum intrusion). I actually found that exposing CONFIG_ALLOC_EXECMEM
> to user does not help, it should be an internal change. So hiding this change
> from user is better choice. Then there is no reason to introduce the new
> alloc_execmem, but just expand kprobe_alloc_insn_page() is reasonable.
>
> Mark, can you send this series here, so that others can review/test it?

I'm totally fine with this but yeah best would be if it could carry
the riscv part. Mark, even if you have only possibility to compile
test that part I can check that it works.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
