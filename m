Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E91C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 18:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y9RtjLeDU1lYDe+Ye58mjd4146QSzqYrQoN+4YPXlQ=; b=FIqAK2eMfEIh3V
	sjw1tjk9/qogJ/RV+p3G8TboIMfSyl55xNt7sB6Ics8RoVJt0G7YnmPKLbufRlqJbWgNZypuZNsZ6
	14uyLnFhGq708aVIlpNcZPLc8IgSH000hesI43RZqx3xJJ70HcE4zTwGrdcrtZtrQRztfYyzfM7FT
	i/aKTUR+lcHuaci/zkscmWYkJ0RjnTOYtaeuu6LrE11a1eNxEztB9gEj2VkWGBx27GQtH9YERnT0e
	SUSwWfA7an1/V3TxJ90IIKa3mJ7VuR/xLkPZQXXrUgq9PyO4IrEv56q0/fPegRkZkZtG2dtpsciYA
	CIKZ8hFUvrnFxiPsf5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropCv-00000001OUG-2TaW;
	Mon, 25 Mar 2024 18:38:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropCr-00000001OSq-3iZ0
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 18:38:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E29A6113A;
	Mon, 25 Mar 2024 18:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0425C433F1;
	Mon, 25 Mar 2024 18:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711391880;
	bh=NZ8ILajyJZp/6r5YApASYz0CQF3HAtXJb6AdZAZRbOo=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=UGOCOCHpMLkpa5Zvpv7VOcuZ7OqMfLSKGY85IkyeCkgXdaBN3pemZspl5hbiqRYa2
	 OEFMiZh8+aPVRnzje21rJKhYJMuQY/z8vSI7LaqDQUbcaOgh+eH5JHGnJ0reer69nn
	 y58IyiOAX423nM+ROQA2AN4TBX0pokhb/Q3dtsiHXpb5NfMfqrvX1wakxqwkOCfHdU
	 hE3a+bXeXfcEvGI8z/luv61oCEO/e2U9/A8i0zTz/QAAAxnaq0e/iKEynVu+AAdG1E
	 mu416QkmS6HZ2+VYNv5kWqg5RXCmfxR375M2l3DPWLjoL8U/t7H8XpTqynCN7iVeAu
	 oKX2/6VvQK8Xw==
Mime-Version: 1.0
Date: Mon, 25 Mar 2024 20:37:55 +0200
Message-Id: <D031SE4QN1CG.18GY6AS20QF1J@kernel.org>
To: "Masami Hiramatsu" <mhiramat@kernel.org>
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
In-Reply-To: <20240325115632.04e37297491cadfbbf382767@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_113802_090303_DD423B19 
X-CRM114-Status: GOOD (  24.03  )
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

On Mon Mar 25, 2024 at 4:56 AM EET, Masami Hiramatsu (Google) wrote:
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

Nope, has not been in my radar but for sure will check it.

I don't mind making this more generic. The  point of this version was to
put focus on single architecture and do as little as possible how the
code works right now so that it is easier to give feedback on direction.

> I think, we'd better to introduce `alloc_execmem()`,
> CONFIG_HAVE_ALLOC_EXECMEM and CONFIG_ALLOC_EXECMEM at first
>
>   config HAVE_ALLOC_EXECMEM
> 	bool
>
>   config ALLOC_EXECMEM
> 	bool "Executable trampline memory allocation"
> 	depends on MODULES || HAVE_ALLOC_EXECMEM

Right so this is logically the same as I have just with ALLOC_EXECMEM
added to cover both MODULES and HAVE_ALLOC_EXECMEM (which is essentially
the same as HAVE_ALLOC_KPROBES just with a different name).

Not at all against this. I think this factor more understandable
structuring, just "peer checking" that I understand what I'm reading :-)

> And define fallback macro to module_alloc() like this.
>
> #ifndef CONFIG_HAVE_ALLOC_EXECMEM
> #define alloc_execmem(size, gfp)	module_alloc(size)
> #endif
>
> Then, introduce a new dependency to kprobes
>
>   config KPROBES
>   	bool "Kprobes"
> 	select ALLOC_EXECMEM


OK I think this is good but now I see actually two logical chunks of
work becuse this select changes how KPROBES kconfig option works. It
has previously required to manually select MODULES first.

So I'll "select MODULES" as separate patch to keep all logical changes
transparent...

>
> and update kprobes to use alloc_execmem and remove module related
> code from it.
>
> You also should consider using IS_ENABLED(CONFIG_MODULE) in the code to
> avoid using #ifdefs.
>
> Finally, you can add RISCV implementation patch of HAVE_ALLOC_EXECMEM in the
> next patch.

OK, I think the suggestions are sane and not that much drift what I have
now so works for me.

> Thank you,

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
