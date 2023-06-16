Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A536FEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3sqhAvqzL2tJQN7Ht9/4CcbyAOxRx4rZYtlo3sqGC4=; b=CMuivm6+5JIFM1
	dir31QjKCpbsn0Mft2ro2lkra9Fv/nHCLzUicfnnKifFN81JVGj09HUFz05BezL4eHsmJZ7C4GgSD
	j9K1aANCPEwLuQQWqp/ZPKszL7qcrf9CKkRy7OQm9suFwOqGC/hJvkbQdN9eaOdcJuUxn6xM1y+2/
	3gioD8yh//w1IUkmV7CEA0CoJvrvNvxYBpo/VKxr0mPYH1s7K3FKFGOHgszb0dBNS6Jg+uUc5Ob3g
	31zUx5POddoEmCRdEbJUA/CMiq6Tx8BRk7u1NKWzK6Ye4yiHZsDRioKDHM6oQWxQ+XWqBkrCUm9Ua
	PW+836kasGF3MaX0OyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qACcR-001AZI-27;
	Fri, 16 Jun 2023 16:48:15 +0000
Received: from out-47.mta0.migadu.com ([91.218.175.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qACcN-001AWl-1o
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 16:48:13 +0000
Date: Fri, 16 Jun 2023 12:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1686934088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfKIglpY59qnffneasZzBrgWBI/BVVKcO3nvK+88q6Q=;
	b=f7uDVOP+LriTx1GPKpO/iGQAeI7fAgmRpvVnoi5jo3ti6yVsQ9wInwSxipV6MgfOy574mI
	FDCFPj1N9Nd5bgTFZS6HIo1mpnuNsg8Mx89vQT9KdcpGA0IcSmQVrnh8mL+CQCqd9x3abe
	jZmmh6fZtZim0+prcqCTRKU0uIKCYhg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <ZIySQgafdTHk5Yet@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230616085038.4121892-3-rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_094812_041962_5E35C78D 
X-CRM114-Status: GOOD (  19.01  )
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

On Fri, Jun 16, 2023 at 11:50:28AM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> module_alloc() is used everywhere as a mean to allocate memory for code.
> 
> Beside being semantically wrong, this unnecessarily ties all subsystems
> that need to allocate code, such as ftrace, kprobes and BPF to modules
> and puts the burden of code allocation to the modules code.
> 
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
> 
> Start splitting code allocation from modules by introducing
> execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free() APIs.
> 
> Initially, execmem_text_alloc() and jit_text_alloc() are wrappers for
> module_alloc() and execmem_free() and jit_free() are replacements of
> module_memfree() to allow updating all call sites to use the new APIs.
> 
> The intention semantics for new allocation APIs:
> 
> * execmem_text_alloc() should be used to allocate memory that must reside
>   close to the kernel image, like loadable kernel modules and generated
>   code that is restricted by relative addressing.
> 
> * jit_text_alloc() should be used to allocate memory for generated code
>   when there are no restrictions for the code placement. For
>   architectures that require that any code is within certain distance
>   from the kernel image, jit_text_alloc() will be essentially aliased to
>   execmem_text_alloc().
> 
> The names execmem_text_alloc() and jit_text_alloc() emphasize that the
> allocated memory is for executable code, the allocations of the
> associated data, like data sections of a module will use
> execmem_data_alloc() interface that will be added later.

I like the API split - at the risk of further bikeshedding, perhaps
near_text_alloc() and far_text_alloc()? Would be more explicit.

Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
