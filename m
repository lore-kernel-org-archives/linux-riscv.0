Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78A0C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0EORhOLEXBEPU3f73z6aDwsbnGoJrwK2hBZRHNiYoU=; b=l0isUSaDk+ob3E
	J6DuZ0prgaDs1YOCmKeV6GmwGPprTZKx4BbISYz4d/KCGGaxQZi/MusD6OgP3l6IN9XymI6T1Xj9k
	FRFdK7bP83PkbM0LYK98GYDgDCVIeVfOKIFkWvZIjg8DG456fSFci76j6fTSZoSRWvB+uihPPF0uV
	53PpHSS4tdBK3GvK6+4+oxanNfyD9HUTKMe2IkyF/3Zf3qjL5Edgx0cj0dXzKcG2kmjvAeU9KpxSS
	IFqonLGkJ1btW1CD2DR2hoAyHHejFRreqAz+XrMsvKwJOhN8IRTSYzmF20ZMDusa6UmLgIG5660b2
	7H/pWWWmstL3qfhhUpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdcU-0000000BL9e-3vje;
	Tue, 16 Apr 2024 07:52:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdcS-0000000BL92-2MQO;
	Tue, 16 Apr 2024 07:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=507ZBsLeuCe8QOYcleBeRL5NXt96hdJ7/5G0PziK1K0=; b=fU/cNEu5qw/O2Klf8s6HCr+ThI
	AhpI1nEs4Up9XFmJBI03cktnXOkGdoRbOvIZzjK48ok45c2JILgNd4BIrGYsKyEjDF0eQQL+HYJwR
	Yiyrnny32/na/Ys3afDWWVnk61J34su4s2sCj0Ub01AHgZcx+Fsp5j+qrF1A8v0sYzXZMlCD5kjBk
	s3viP3O4TygKJJxdljC/ZTymqUoM44K9+R+bQ//RVwqZYO5nBn5merN0aN+obc8V8nFi/A7z6wGAX
	iEjE6w/enUoiPeoQuWrQTmG1HLtwkxvfU1NO54vIH5bCDXvS5cudA99gRVmIMYwS4kC9jIInm3J/Z
	dg+Vrz+Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdcJ-0000000HZIl-1TGs;
	Tue, 16 Apr 2024 07:52:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0630E30040C; Tue, 16 Apr 2024 09:52:35 +0200 (CEST)
Date: Tue, 16 Apr 2024 09:52:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <20240416075234.GA31647@noisy.programming.kicks-ass.net>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-7-rppt@kernel.org>
 <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
 <Zh1dKkFr6zdBh2Kz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zh1dKkFr6zdBh2Kz@kernel.org>
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

On Mon, Apr 15, 2024 at 08:00:26PM +0300, Mike Rapoport wrote:
> On Mon, Apr 15, 2024 at 12:47:50PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 11, 2024 at 07:05:25PM +0300, Mike Rapoport wrote:
> > 
> > > To populate the cache, a writable large page is allocated from vmalloc with
> > > VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> > > ROX.
> > 
> > > +static void execmem_invalidate(void *ptr, size_t size, bool writable)
> > > +{
> > > +	if (execmem_info->invalidate)
> > > +		execmem_info->invalidate(ptr, size, writable);
> > > +	else
> > > +		memset(ptr, 0, size);
> > > +}
> > 
> > +static void execmem_invalidate(void *ptr, size_t size, bool writeable)
> > +{
> > +       /* fill memory with INT3 instructions */
> > +       if (writeable)
> > +               memset(ptr, 0xcc, size);
> > +       else
> > +               text_poke_set(ptr, 0xcc, size);
> > +}
> > 
> > Thing is, 0xcc (aka INT3_INSN_OPCODE) is not an invalid instruction.
> > It raises #BP not #UD.
> 
> Do you mean that _invalidate is a poor name choice or that it's necessary
> to use an instruction that raises #UD?

Poor naming, mostly. #BP handler will still scream bloody murder if the
site is otherwise unclaimed.

It just isn't an invalid instruction.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
