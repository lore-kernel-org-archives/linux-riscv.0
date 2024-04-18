Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985E7C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 10:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6N6Fom0YnEl7MOtKWgnrRDLmSAYwKx6H+GGdfDPK5Ro=; b=gx8hZ/my5nGSGQ
	uR0reuucblAkzrX9IRXzjOOnQXKpXQEd6w5LSIGP3xM8j7joRvGld4mO2KXo6ZBv/i+EUeZ88huIg
	bVa9/YsO7G7QMaTccEH9FBdWfFhzF4jBZZtx2Lk1mK3arZws6RqpKYZ58MUdA+0kftWOQJrq3RTc6
	oKIH8KLyV6tKRY5INtCAb0wnHzCxlPUyPE5Tu9PGxFlYmgt9674A7/0smcsFr88Fx5Dvw1RwerHZg
	ufSusgnmm573cKVXzyfGUEdP4kLV86lOJCliGLlbzttk6thj4xm7kh+pkVSDLIPGjaRHkE2ENQbiN
	bst5HjnTeHkeKAiAXJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOxB-00000001nQF-41X3;
	Thu, 18 Apr 2024 10:25:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOx7-00000001nNb-13Xy;
	Thu, 18 Apr 2024 10:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60375617CE;
	Thu, 18 Apr 2024 10:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36123C113CC;
	Thu, 18 Apr 2024 10:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713435912;
	bh=YYR+dNmhH5n7QU2mxc3zizI6arTy/RTvZImlW/XQhPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7r3HpYQ6nFiS0E8RoFspK8YNTCn1wvgAKmlggqCij/FXkbh7szpgdlp50MnvnkyP
	 lk96Jv8sQ1JdQGAURqqmqgYkF3mGapE5gySL9ZwhZHyzkL0O/RbIQf5t1nWm3gYpbq
	 uEpL9PSB2RTnOFLn1B9HaIE/diUnPoc6ZmU/M8wQ2SoiNmWWCQToS5x4OihQModqbL
	 wQp9NYpGP/8mk1FlFPEVNiGZQBNpmOaQ1CBof6I+gHZEt/zViTgmR/oZTmy5m+cXoj
	 Tt5QDTjkEbUg1MEvU+IXwpfYnYqHcejQQSHvHq4OyuZGU6Xkki5E+LhnslG0zaaCc7
	 s1wPnD7FtE6tA==
Date: Thu, 18 Apr 2024 13:23:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>, Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [RFC PATCH 6/7] execmem: add support for cache of large ROX pages
Message-ID: <ZiD0u3uz97ltnXJS@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-7-rppt@kernel.org>
 <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
 <Zh1dKkFr6zdBh2Kz@kernel.org>
 <20240416075234.GA31647@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416075234.GA31647@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_032513_408656_A1ABFE60 
X-CRM114-Status: GOOD (  19.35  )
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

On Tue, Apr 16, 2024 at 09:52:34AM +0200, Peter Zijlstra wrote:
> On Mon, Apr 15, 2024 at 08:00:26PM +0300, Mike Rapoport wrote:
> > On Mon, Apr 15, 2024 at 12:47:50PM +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 11, 2024 at 07:05:25PM +0300, Mike Rapoport wrote:
> > > 
> > > > To populate the cache, a writable large page is allocated from vmalloc with
> > > > VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> > > > ROX.
> > > 
> > > > +static void execmem_invalidate(void *ptr, size_t size, bool writable)
> > > > +{
> > > > +	if (execmem_info->invalidate)
> > > > +		execmem_info->invalidate(ptr, size, writable);
> > > > +	else
> > > > +		memset(ptr, 0, size);
> > > > +}
> > > 
> > > +static void execmem_invalidate(void *ptr, size_t size, bool writeable)
> > > +{
> > > +       /* fill memory with INT3 instructions */
> > > +       if (writeable)
> > > +               memset(ptr, 0xcc, size);
> > > +       else
> > > +               text_poke_set(ptr, 0xcc, size);
> > > +}
> > > 
> > > Thing is, 0xcc (aka INT3_INSN_OPCODE) is not an invalid instruction.
> > > It raises #BP not #UD.
> > 
> > Do you mean that _invalidate is a poor name choice or that it's necessary
> > to use an instruction that raises #UD?
> 
> Poor naming, mostly. #BP handler will still scream bloody murder if the
> site is otherwise unclaimed.
> 
> It just isn't an invalid instruction.

Well, execmem_fill_with_insns_screaming_bloody_murder seems too long, how
about execmem_fill_trapping_insns?

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
