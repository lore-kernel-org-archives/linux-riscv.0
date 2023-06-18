Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB28EB64D7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 22:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=As6/uJfCEj7a/LaMVts4sw8+Q4pGzX+dC/EYuShZMK8=; b=3jlvohtfGiGMnM
	Y7TuDue+I1g37ZyKtSz4JtFdBmNtAyrr3unlKs5mi8QgZ7ErRmv1XYs3cwb51ak0Ncm1TD4AsZkE+
	0eL1Cl9QThO/D9LmzWYy9c23RYmpUkNZg1ikPERR55RYK9HlWHkKOCLodWArYqT9SUFcAUunYE2np
	zFYPCmkofD8Y8ZjqdijjamKYPHdU/58ih9801iKrDT5FSJbna3bOfk+nzwOuapypXjc2A5NP4L9o3
	t30OgHk9shMMyKJ95CrQU4vjLN8QQiQOxv9NEn9qChYl47GsJMXgHtGP+OhtVEsKAaBOAiKa/zaIe
	ud+MRcGwDPLs3iOSRzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB0xN-006qul-04;
	Sun, 18 Jun 2023 22:33:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB0xH-006qqa-0B;
	Sun, 18 Jun 2023 22:33:10 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1687127575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eocF6oVYznFl/DEwITHqQ7TMn26EFf0pZbwEDCTK84=;
	b=bdpHhvr9Hn5s8M8pBt6h0RlUGOZ1Lo4/y28rwu0yVR7JZSlAq39/46BcKsilIUinfOPogU
	qmKwez+jgzyMGsHhHmUjh9dF2vQKfcfzUpnC430yDZMMldnMWI1vYw06jpKeElXhmTcntG
	yypvYR4iRqVpOziVhZdqJC7qgQJw5KA81XnRrk5f520jV+sacnO/fQhXBIQnrLmfO/2M+r
	YFxwYhKBguqFcAkoCz4x6FEz5SiwhD5VV9/U1fv8TVeo3fA0XlwfdM8MGzqwB21MFiONgp
	HFCCVB4X260bSKBTYLft5JXmqXu6l7oYYyLOqT0toHcgXAbIR5XTU+7H5xAo3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1687127575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eocF6oVYznFl/DEwITHqQ7TMn26EFf0pZbwEDCTK84=;
	b=ZuJVVOhsCR9WDQQO84QX2oPc5VTYDEn0agA6nGmpVtt6s52bacZEJ4aPLDh/ary7zlNGrA
	JmqYVkKOO6bt5CBA==
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen
 <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller
 <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Kent Overstreet
 <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@kernel.org>, Nadav Amit <nadav.amit@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>, Russell King
 <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
In-Reply-To: <20230616085038.4121892-7-rppt@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
Date: Mon, 19 Jun 2023 00:32:55 +0200
Message-ID: <87jzw0qu3s.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_153307_404166_E62A494E 
X-CRM114-Status: GOOD (  16.69  )
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

Mike!

Sorry for being late on this ...

On Fri, Jun 16 2023 at 11:50, Mike Rapoport wrote:
>  
> +void *execmem_data_alloc(size_t size)
> +{
> +	unsigned long start = execmem_params.modules.data.start;
> +	unsigned long end = execmem_params.modules.data.end;
> +	pgprot_t pgprot = execmem_params.modules.data.pgprot;
> +	unsigned int align = execmem_params.modules.data.alignment;
> +	unsigned long fallback_start = execmem_params.modules.data.fallback_start;
> +	unsigned long fallback_end = execmem_params.modules.data.fallback_end;
> +	bool kasan = execmem_params.modules.flags & EXECMEM_KASAN_SHADOW;

While I know for sure that you read up on the discussion I had with Song
about data structures, it seems you completely failed to understand it.

> +	return execmem_alloc(size, start, end, align, pgprot,
> +			     fallback_start, fallback_end, kasan);

Having _seven_ intermediate variables to fill _eight_ arguments of a
function instead of handing in @size and a proper struct pointer is
tasteless and disgusting at best.

Six out of those seven parameters are from:

    execmem_params.module.data

while the KASAN shadow part is retrieved from

    execmem_params.module.flags

So what prevents you from having a uniform data structure, which is
extensible and decribes _all_ types of allocations?

Absolutely nothing. The flags part can either be in the type dependend
part or you make the type configs an array as I had suggested originally
and then execmem_alloc() becomes:

void *execmem_alloc(type, size)

and

static inline void *execmem_data_alloc(size_t size)
{
        return execmem_alloc(EXECMEM_TYPE_DATA, size);
}

which gets the type independent parts from @execmem_param.

Just read through your own series and watch the evolution of
execmem_alloc():

  static void *execmem_alloc(size_t size)

  static void *execmem_alloc(size_t size, unsigned long start,
                             unsigned long end, unsigned int align,
                             pgprot_t pgprot)

  static void *execmem_alloc(size_t len, unsigned long start,
                             unsigned long end, unsigned int align,
                             pgprot_t pgprot,
                             unsigned long fallback_start,
                             unsigned long fallback_end,
                             bool kasan)

In a month from now this function will have _ten_ parameters and tons of
horrible wrappers which convert an already existing data structure into
individual function arguments.

Seriously?

If you want this function to be [ab]used outside of the exec_param
configuration space for whatever non-sensical reasons then this still
can be either:

void *execmem_alloc(params, type, size)

static inline void *execmem_data_alloc(size_t size)
{
        return execmem_alloc(&exec_param, EXECMEM_TYPE_DATA, size);
}

or

void *execmem_alloc(type_params, size);

static inline void *execmem_data_alloc(size_t size)
{
        return execmem_alloc(&exec_param.data, size);
}

which both allows you to provide alternative params, right?

Coming back to my conversation with Song:

   "Bad programmers worry about the code. Good programmers worry about
    data structures and their relationships."

You might want to reread:

    https://lore.kernel.org/r/87lenuukj0.ffs@tglx

and the subsequent thread.

The fact that my suggestions had a 'mod_' namespace prefix does not make
any of my points moot.

Song did an extremly good job in abstracting things out, but you decided
to ditch his ground work instead of building on it and keeping the good
parts. That's beyond sad.

Worse, you went the full 'not invented here' path with an outcome which is
even worse than the original hackery from Song which started the above
referenced thread.

I don't know what caused you to decide that ad hoc hackery is better
than proper data structure based design patterns. I actually don't want
to know.

As much as my voice counts:

  NAK-ed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
