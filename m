Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89A1C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIQ31AbGOugvoHYijmpZ/wfFyhcjfsIwihgcPqwcmQY=; b=GbIxjIMK658zfA
	qnxIzgNUem7uI/An2Rd+n1/CVQWzQhzkPOk9wQFR3m7p76VcVxnqiP4hUdVYHp1r1MWw3UwDz7Td4
	XQSv6oLQfaM0UUmR6tTRqwzlkHTDiPchHCNKbPQ4b+aoyfZjadU9W6JMvrLHEQJFIowtiYfD/UpKI
	gANRo7DERQXP+7XDz1RB0Eb3yN1HNem6IVjVNFaruI4nsviOh/nNFjfrVGZfruMWIftsfYhuYWYAo
	A6BWDE36jAD2Rk6S/btNfkO8tCfMleBq6v+zNI4CyCtB4shx2BJlTC4B7kMf1S1i2VaKZZ1tfcjgN
	VaZQjSA8EIVkdZnYvmBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4mpI-004XTQ-32;
	Thu, 01 Jun 2023 18:15:08 +0000
Received: from out-1.mta1.migadu.com ([2001:41d0:203:375::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4mpF-004XQr-39
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 18:15:07 +0000
Date: Thu, 1 Jun 2023 14:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685643302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJB8Y+qWnzDFm68SRo4Caqik2FMGAG+Lwf+CLh2n8l8=;
	b=heVebVByNmhUMsJ2WAULJ9HLAPC6refckfCUJY0WXx4hRhZsbaomDSDugjYWaWQ6LEkWdP
	Jvcs9tQIzXZc+0yCsv5NbHMBQcwZQ1wXx/fNbx6WxFVHuREaPuDV58w3hONj9KdJXnaniY
	jN/vCOKQCwHm3op0QMHWhM09SJgJWkM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <ZHjgIH3aX9dCvVZc@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_111506_426092_08635F13 
X-CRM114-Status: GOOD (  24.42  )
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

On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> For a while I have wanted to give kprobes its own allocator so that it can work
> even with CONFIG_MODULES=n, and so that it doesn't have to waste VA space in
> the modules area.
> 
> Given that, I think these should have their own allocator functions that can be
> provided independently, even if those happen to use common infrastructure.

How much memory can kprobes conceivably use? I think we also want to try
to push back on combinatorial new allocators, if we can.

> > Several architectures override module_alloc() because of various
> > constraints where the executable memory can be located and this causes
> > additional obstacles for improvements of code allocation.
> > 
> > This set splits code allocation from modules by introducing
> > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
> > sites of module_alloc() and module_memfree() with the new APIs and
> > implements core text and related allocation in a central place.
> > 
> > Instead of architecture specific overrides for module_alloc(), the
> > architectures that require non-default behaviour for text allocation must
> > fill jit_alloc_params structure and implement jit_alloc_arch_params() that
> > returns a pointer to that structure. If an architecture does not implement
> > jit_alloc_arch_params(), the defaults compatible with the current
> > modules::module_alloc() are used.
> 
> As above, I suspect that each of the callsites should probably be using common
> infrastructure, but I don't think that a single jit_alloc_arch_params() makes
> sense, since the parameters for each case may need to be distinct.

I don't see how that follows. The whole point of function parameters is
that they may be different :)

Can you give more detail on what parameters you need? If the only extra
parameter is just "does this allocation need to live close to kernel
text", that's not that big of a deal.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
