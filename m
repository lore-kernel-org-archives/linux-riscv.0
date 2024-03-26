Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA31C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1tXvTXmXcjc63XyBDHhE5z/5MJ0baCRBPOBS4Bh+jI=; b=UdR2J3H0MSLmLl
	kL8ci8D7OpHBSwnjYVlJWWHeSZOJN/M+UTCWqBc6yx7ZdpZHUDbIg8PLlxYJL2AV+0n44PaQ3nJzh
	4DU4yr0LHyCCbQO0PImsbDWx4Zs7/ACH5DSg9bClURSPkwBTabOzjqbMoSjsgoJUWGPHB2wKF5C4K
	70sFqpEVnOKvdoYQkO0CUzAabkB7W7QH9Z8aqatoa2I9V2tQcBzGeSZo9Rg+KT0cD4aECZz+zyhk/
	7OQCIhZVyhUTlv6s8ydjY3HUUmeDe+76U4HDjaRLznH0zOavLBL8qkW7YRDIKVCzeyyQd2l8sWhIB
	/W+T9hmVCa2ASJM1tv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9vV-00000005XDE-0s7i;
	Tue, 26 Mar 2024 16:45:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9vS-00000005XCT-0HaU
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 16:45:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8D5F2F4;
	Tue, 26 Mar 2024 09:45:58 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.35.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B7D93F694;
	Tue, 26 Mar 2024 09:45:23 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:45:20 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Calvin Owens <jcalvinowens@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Message-ID: <ZgL7oG5EfLGYDGRS@FVFF77S0Q05N.cambridge.arm.com>
References: <20240323232908.13261-1-jarkko@kernel.org>
 <20240325115632.04e37297491cadfbbf382767@kernel.org>
 <ZgLfsvbCZj2S6fRE@FVFF77S0Q05N.cambridge.arm.com>
 <20240327002403.62649aee45508b7a16caedba@kernel.org>
 <ZgL0ks5gikCG7NBN@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZgL0ks5gikCG7NBN@debian-BULLSEYE-live-builder-AMD64>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_094526_387951_18D48B95 
X-CRM114-Status: GOOD (  29.37  )
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

On Tue, Mar 26, 2024 at 09:15:14AM -0700, Calvin Owens wrote:
> On Wednesday 03/27 at 00:24 +0900, Masami Hiramatsu wrote:
> > On Tue, 26 Mar 2024 14:46:10 +0000
> > Mark Rutland <mark.rutland@arm.com> wrote:
> > > Different exectuable allocations can have different requirements. For example,
> > > on arm64 modules need to be within 2G of the kernel image, but the kprobes XOL
> > > areas can be anywhere in the kernel VA space.
> > > 
> > > Forcing those behind the same interface makes things *harder* for architectures
> > > and/or makes the common code more complicated (if that ends up having to track
> > > all those different requirements). From my PoV it'd be much better to have
> > > separate kprobes_alloc_*() functions for kprobes which an architecture can then
> > > choose to implement using a common library if it wants to.
> > > 
> > > I took a look at doing that using the core ifdeffery fixups from Jarkko's v6,
> > > and it looks pretty clean to me (and works in testing on arm64):
> > > 
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=kprobes/without-modules
> > > 
> > > Could we please start with that approach, with kprobe-specific alloc/free code
> > > provided by the architecture?
> 
> Heh, I also noticed that dead !RWX branch in arm64 patch_map(), I was
> about to send a patch to remove it.
> 
> > OK, as far as I can read the code, this method also works and neat! 
> > (and minimum intrusion). I actually found that exposing CONFIG_ALLOC_EXECMEM
> > to user does not help, it should be an internal change. So hiding this change
> > from user is better choice. Then there is no reason to introduce the new
> > alloc_execmem, but just expand kprobe_alloc_insn_page() is reasonable.
> 
> I'm happy with this, it solves the first half of my problem. But I want
> eBPF to work in the !MODULES case too.
> 
> I think Mark's approach can work for bpf as well, without needing to
> touch module_alloc() at all? So I might be able to drop that first patch
> entirely.

I'd be very happy with eBPF following the same approach, with BPF-specific
alloc/free functions that we can implement in arch code.

IIUC eBPF code *does* want to be within range of the core kernel image, so for
arm64 we'd want to factor some common logic out of module_alloc() and into
something that module_alloc() and "bpf_alloc()" (or whatever it would be
called) could use. So I don't think we'd necessarily save on touching
module_alloc(), but I think the resulting split would be better.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
