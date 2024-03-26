Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFBCC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbWhYSK+RpMMnUq8HkqgMKS3vNSHUenPDksMVs/NL9c=; b=duTZ486mIJ9i/2
	R90nwQ/PpTHXtJRKFJKoyUDUw72mBG9DhGmEUnohN74Xu4qjz+qg3HPEulULsNMdSTZY5BWj6fKqA
	fj0rINEStvUd+8kjtD7Ur892InqmeMYTwMBMYyJrvPdF4zpg12tkoa6CIXbE0UQij685fNCU3qaIN
	D8sBuQLbkWnmkq+ohZW5OUZwDhGwXNxUsS+yuyOyPSaV9G/NJbAB32c6N+9xGuEEQzoc4Kv+oFFkE
	ktidAhs8R6Qkmvq1IJxlzDjP1odgUUhgR+F7CARX3xMizUqMht2I5Hm2VFUCh+78i79nohiu3jJS8
	0e1IKEiKN2tmVvmoGK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp84O-00000004y6k-2HhI;
	Tue, 26 Mar 2024 14:46:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp84I-00000004y4p-1qdG
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 14:46:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DB30339;
	Tue, 26 Mar 2024 07:46:55 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.35.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F2EC3F694;
	Tue, 26 Mar 2024 07:46:20 -0700 (PDT)
Date: Tue, 26 Mar 2024 14:46:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-trace-kernel@vger.kernel.org,
	Calvin Owens <jcalvinowens@gmail.com>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Message-ID: <ZgLfsvbCZj2S6fRE@FVFF77S0Q05N.cambridge.arm.com>
References: <20240323232908.13261-1-jarkko@kernel.org>
 <20240325115632.04e37297491cadfbbf382767@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325115632.04e37297491cadfbbf382767@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_074626_559627_FCC13D77 
X-CRM114-Status: GOOD (  19.05  )
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

Hi Masami,

On Mon, Mar 25, 2024 at 11:56:32AM +0900, Masami Hiramatsu wrote:
> Hi Jarkko,
> 
> On Sun, 24 Mar 2024 01:29:08 +0200
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > Tracing with kprobes while running a monolithic kernel is currently
> > impossible due the kernel module allocator dependency.
> > 
> > Address the issue by allowing architectures to implement module_alloc()
> > and module_memfree() independent of the module subsystem. An arch tree
> > can signal this by setting HAVE_KPROBES_ALLOC in its Kconfig file.
> > 
> > Realize the feature on RISC-V by separating allocator to module_alloc.c
> > and implementing module_memfree().
> 
> Even though, this involves changes in arch-independent part. So it should
> be solved by generic way. Did you checked Calvin's thread?
> 
> https://lore.kernel.org/all/cover.1709676663.git.jcalvinowens@gmail.com/
> 
> I think, we'd better to introduce `alloc_execmem()`,
> CONFIG_HAVE_ALLOC_EXECMEM and CONFIG_ALLOC_EXECMEM at first
> 
>   config HAVE_ALLOC_EXECMEM
> 	bool
> 
>   config ALLOC_EXECMEM
> 	bool "Executable trampline memory allocation"
> 	depends on MODULES || HAVE_ALLOC_EXECMEM
> 
> And define fallback macro to module_alloc() like this.
> 
> #ifndef CONFIG_HAVE_ALLOC_EXECMEM
> #define alloc_execmem(size, gfp)	module_alloc(size)
> #endif

Please can we *not* do this? I think this is abstracting at the wrong level (as
I mentioned on the prior execmem proposals).

Different exectuable allocations can have different requirements. For example,
on arm64 modules need to be within 2G of the kernel image, but the kprobes XOL
areas can be anywhere in the kernel VA space.

Forcing those behind the same interface makes things *harder* for architectures
and/or makes the common code more complicated (if that ends up having to track
all those different requirements). From my PoV it'd be much better to have
separate kprobes_alloc_*() functions for kprobes which an architecture can then
choose to implement using a common library if it wants to.

I took a look at doing that using the core ifdeffery fixups from Jarkko's v6,
and it looks pretty clean to me (and works in testing on arm64):

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=kprobes/without-modules

Could we please start with that approach, with kprobe-specific alloc/free code
provided by the architecture?

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
