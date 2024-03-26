Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539A0C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 17:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpzBIBC/PAv4E4TfwFdPceneSl+ZQb6XTyO0WIcKA3c=; b=q8YS+udpjn3YX+
	IDNmm7aTqJvJnsx2ykpj/VsNfFWzomp99YvIaC7qvpygc5CQcb6Lv8VKfRTIwADWK5ulQ7hmVmGM5
	qxoHxEyWQyfiIKg9OcT+pHZ8mv/KvLe7xNOhpYyIU6Q+j1NRHuAjYUFg0FumVx9nWG4A3nho1657h
	h4hP8TTd82XVvKbpW5p2ifsZkHchdEOV6fQZ4dGgKJUlahjfCB5Lppuq5TVz2+VkB5IubP/+Pi+I8
	V45540mF3UT406R7PdCK0ejHPjkPb1/r8pYODkUiPi1i4JtdVzOwuFYTIRB6mC+sTcFI/ZU/8C/wU
	sz9uw9CRtWTcU5Te/Ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAL8-00000005fOW-14xS;
	Tue, 26 Mar 2024 17:11:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAL1-00000005fKj-47dO
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 17:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CB70612C9;
	Tue, 26 Mar 2024 17:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68446C43399;
	Tue, 26 Mar 2024 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711473110;
	bh=SHSbPddnUrZNJUnZQETz0axiiuHhU56cJ/TyjxOm3LE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=k9DczX69FvUQ6wdICAIJXiq1qaqYzNybKX/V+0hbSEhTZO6Q/IDyUfO+T0mZbLFoU
	 2JHkuWbGZdLCAZSmiLl89L9xs/BUDMV+wis1wiXB9+tw6CMioewzz6Xxg7iHfyIeer
	 MV7OmEh/I3M8FcPpapn0tWIkyR9n0nE1+sudyLFMOdzX9z4KNEqDFHBYHa4chU9MtF
	 ooPpKMvpI0iVPfvhZ1Gx4+7AAnNvVhp2bxMgj5z5687GC8kmpz2DOnm3nPo8qHH++t
	 Jo5FPJqDXtzFwnMxVzuIkhqAzH9pIgUsca/G/irikJZYMdpRStUUUmdmw9PYHR3rkB
	 SfVjRo212/Ptg==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 19:11:46 +0200
Message-Id: <D03UKZ3OIEXX.2PCKOX8NOLMKT@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Naveen N .
 Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 <linux-trace-kernel@vger.kernel.org>, "Calvin Owens"
 <jcalvinowens@gmail.com>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Mark Rutland" <mark.rutland@arm.com>, "Masami Hiramatsu"
 <mhiramat@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240323232908.13261-1-jarkko@kernel.org>
 <20240325115632.04e37297491cadfbbf382767@kernel.org>
 <ZgLfsvbCZj2S6fRE@FVFF77S0Q05N.cambridge.arm.com>
 <20240327002403.62649aee45508b7a16caedba@kernel.org>
 <ZgL5779MIS61GpV6@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZgL5779MIS61GpV6@FVFF77S0Q05N.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_101152_290909_DA3F238C 
X-CRM114-Status: GOOD (  26.86  )
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

On Tue Mar 26, 2024 at 6:38 PM EET, Mark Rutland wrote:
> On Wed, Mar 27, 2024 at 12:24:03AM +0900, Masami Hiramatsu wrote:
> > On Tue, 26 Mar 2024 14:46:10 +0000
> > Mark Rutland <mark.rutland@arm.com> wrote:
> > > 
> > > On Mon, Mar 25, 2024 at 11:56:32AM +0900, Masami Hiramatsu wrote:
> > > > I think, we'd better to introduce `alloc_execmem()`,
> > > > CONFIG_HAVE_ALLOC_EXECMEM and CONFIG_ALLOC_EXECMEM at first
> > > > 
> > > >   config HAVE_ALLOC_EXECMEM
> > > > 	bool
> > > > 
> > > >   config ALLOC_EXECMEM
> > > > 	bool "Executable trampline memory allocation"
> > > > 	depends on MODULES || HAVE_ALLOC_EXECMEM
> > > > 
> > > > And define fallback macro to module_alloc() like this.
> > > > 
> > > > #ifndef CONFIG_HAVE_ALLOC_EXECMEM
> > > > #define alloc_execmem(size, gfp)	module_alloc(size)
> > > > #endif
> > > 
> > > Please can we *not* do this? I think this is abstracting at the wrong level (as
> > > I mentioned on the prior execmem proposals).
> > > 
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
> > 
> > OK, as far as I can read the code, this method also works and neat! 
> > (and minimum intrusion). I actually found that exposing CONFIG_ALLOC_EXECMEM
> > to user does not help, it should be an internal change. So hiding this change
> > from user is better choice. Then there is no reason to introduce the new
> > alloc_execmem, but just expand kprobe_alloc_insn_page() is reasonable.
> > 
> > Mark, can you send this series here, so that others can review/test it?
>
> I've written up a cover letter and sent that out:
>   
>   https://lore.kernel.org/lkml/20240326163624.3253157-1-mark.rutland@arm.com/
>
> Mark.

Ya, saw it thanks!

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
