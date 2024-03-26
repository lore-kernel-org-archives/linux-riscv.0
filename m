Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FECC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 15:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6KohdqECHaggUQId4zWflV+RB09YckbxYmkrELHyjw=; b=ZtRzUqcc0BZF+I
	Ij4yskSNr5awszLDzHyMQfnytO7j5TOorxPqTNX4G3fjoyb6c+itEPpiSlPT0m30WOHHJ+Hq00FIg
	YJEh32rRLCTJDv/deklYT/IvzSQ55g3hVXWEQpndpG45Whe3W6sWYVs9Zl5+V1IWQVan7rxE2q4E+
	I7ksm3g3Ajf4GXwHQJLYLFyJDxhNssdoTJgJe6x37ocnmpbtagbImj38e+ar4OhFy7Opv9O4FwrcJ
	/zTNFNmyXtir5NwxQddiu955hss4NyqDSm4mLkyfd7ZKAxqjcSDxml1jcRSfqO1gaHTjQ/lRdf9Ie
	uxxE1zEOLEOK6ISCej7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8et-000000058au-0mTC;
	Tue, 26 Mar 2024 15:24:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8ep-000000058Yx-3T9R
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 15:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1CFACE222D;
	Tue, 26 Mar 2024 15:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F539C433C7;
	Tue, 26 Mar 2024 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466649;
	bh=ujR0rPXLZBsE/QY8uXI1pDCWebcjJRNm9iHPbJUo0Ss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZM51zYNl1VjBdBbarCQPT4o8P7JTUjymm1ldrFKsskdIQUDl75XGY0h3MFLabpNf2
	 9zL2Bu9qLsM8u54povk/MhiUucL53tjN5IS7Fq82hnjo7gJxZHI8EDJleWKsf60eNn
	 qGlxpvC1VxhVsR2dgvcNLy1NNI77sjwxejRMFx2J6Y0g39I+Ng9ZkV0j38Zq3cEmlr
	 RfN9BDIAOTeD7Yy3Jxn4aVxkCw8WdesRqiLw9nsypvJLPkVzgEggqnlwGugr8n3ZWV
	 XUxSbVBtahoDBvjZASK0h5m/5ZIwZHI6FHIPEFqFXvbgRLpJGDi2JrmX80Dtl6rZr+
	 7/0qXV7dIPJaA==
Date: Wed, 27 Mar 2024 00:24:03 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 linux-trace-kernel@vger.kernel.org, Calvin Owens <jcalvinowens@gmail.com>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Message-Id: <20240327002403.62649aee45508b7a16caedba@kernel.org>
In-Reply-To: <ZgLfsvbCZj2S6fRE@FVFF77S0Q05N.cambridge.arm.com>
References: <20240323232908.13261-1-jarkko@kernel.org>
	<20240325115632.04e37297491cadfbbf382767@kernel.org>
	<ZgLfsvbCZj2S6fRE@FVFF77S0Q05N.cambridge.arm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_082412_351197_A52C682C 
X-CRM114-Status: GOOD (  28.21  )
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

On Tue, 26 Mar 2024 14:46:10 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> Hi Masami,
> 
> On Mon, Mar 25, 2024 at 11:56:32AM +0900, Masami Hiramatsu wrote:
> > Hi Jarkko,
> > 
> > On Sun, 24 Mar 2024 01:29:08 +0200
> > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > 
> > > Tracing with kprobes while running a monolithic kernel is currently
> > > impossible due the kernel module allocator dependency.
> > > 
> > > Address the issue by allowing architectures to implement module_alloc()
> > > and module_memfree() independent of the module subsystem. An arch tree
> > > can signal this by setting HAVE_KPROBES_ALLOC in its Kconfig file.
> > > 
> > > Realize the feature on RISC-V by separating allocator to module_alloc.c
> > > and implementing module_memfree().
> > 
> > Even though, this involves changes in arch-independent part. So it should
> > be solved by generic way. Did you checked Calvin's thread?
> > 
> > https://lore.kernel.org/all/cover.1709676663.git.jcalvinowens@gmail.com/
> > 
> > I think, we'd better to introduce `alloc_execmem()`,
> > CONFIG_HAVE_ALLOC_EXECMEM and CONFIG_ALLOC_EXECMEM at first
> > 
> >   config HAVE_ALLOC_EXECMEM
> > 	bool
> > 
> >   config ALLOC_EXECMEM
> > 	bool "Executable trampline memory allocation"
> > 	depends on MODULES || HAVE_ALLOC_EXECMEM
> > 
> > And define fallback macro to module_alloc() like this.
> > 
> > #ifndef CONFIG_HAVE_ALLOC_EXECMEM
> > #define alloc_execmem(size, gfp)	module_alloc(size)
> > #endif
> 
> Please can we *not* do this? I think this is abstracting at the wrong level (as
> I mentioned on the prior execmem proposals).
> 
> Different exectuable allocations can have different requirements. For example,
> on arm64 modules need to be within 2G of the kernel image, but the kprobes XOL
> areas can be anywhere in the kernel VA space.
> 
> Forcing those behind the same interface makes things *harder* for architectures
> and/or makes the common code more complicated (if that ends up having to track
> all those different requirements). From my PoV it'd be much better to have
> separate kprobes_alloc_*() functions for kprobes which an architecture can then
> choose to implement using a common library if it wants to.
> 
> I took a look at doing that using the core ifdeffery fixups from Jarkko's v6,
> and it looks pretty clean to me (and works in testing on arm64):
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=kprobes/without-modules
> 
> Could we please start with that approach, with kprobe-specific alloc/free code
> provided by the architecture?

OK, as far as I can read the code, this method also works and neat! 
(and minimum intrusion). I actually found that exposing CONFIG_ALLOC_EXECMEM
to user does not help, it should be an internal change. So hiding this change
from user is better choice. Then there is no reason to introduce the new
alloc_execmem, but just expand kprobe_alloc_insn_page() is reasonable.

Mark, can you send this series here, so that others can review/test it?

Thank you!


> 
> Thanks,
> Mark.


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
