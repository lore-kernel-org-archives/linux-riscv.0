Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEB7C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOm07wvJYSSR3USJDAs7UPztCLo12gPGEDhIAERygBc=; b=4Z/9RPnObaKopT
	iTqmqkICjsAWcuAqTpv0jC66kxFfU8ygKxZIQc/OoG+l3kxcFAsWVeDMp+Dhi9xRu+YLSfLkgU2/2
	TFhe/BM4oa8cERlUM5hJmBr8WzPBHIAgzdE8D25W6LVogryGL/FDCDu7+sAUi74DCJImnLashjwul
	3ppyrx7Lupa2RtBsJNkUuCY+NtQN8wSnBE2+HG7szpxPYnAiQ+dC3oD0ItAbjSitYA0E3dyZq3Uup
	/KOiZqmeUW97IdnF04WD7BR+Vap93rbvVOGmmsqSYyo+LVti1fqW342WVX44XbKcbnhDGQu8bWHDq
	QePu3BNh9+nS0yZihARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwQrd-00000009PvJ-2qoz;
	Mon, 15 Apr 2024 18:15:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPln-00000009E7v-2H6b;
	Mon, 15 Apr 2024 17:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB0A760ECF;
	Mon, 15 Apr 2024 17:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EB7C2BD10;
	Mon, 15 Apr 2024 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713200726;
	bh=brTfnO2VyUJAmFmt0xYsxELn1GfIqBydjJY5MAA2GwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eA4Y4x6LpKDmJlhsFuCKUKDWszVPc0aMol9ibBC4zWuhXiukyHzmx+wctUQDy9YcO
	 SgrxzhBVYrKzoib5nD4pxj58Yru3AKozTZkN+TvcG/88RKgokKwWdJ7ot3KrqKc7Eq
	 DUMXngRm3Kt+F/W7nD5rsdsyrXI/SKwSE27eJw0RyuFsxXe2CY8Th13OWBhzodIeFI
	 g3IfMeClHVfNPTzOpcIibEz/rTBRU3MdIzMovL+lADX98nFVYDJgBcU0E0gUS/Sp3y
	 NkyrAJJ3bphAZ5D3Vr/0URqS2QdYx5P8qEukDaFoUJqWeYw/1mketQaU4aGKwRL5Ma
	 kNnuFlXqLWYaw==
Date: Mon, 15 Apr 2024 20:04:13 +0300
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
Subject: Re: [RFC PATCH 5/7] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <Zh1eDU1L1FbFwZzT@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-6-rppt@kernel.org>
 <20240415104316.GI40213@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415104316.GI40213@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100527_847354_CC341757 
X-CRM114-Status: GOOD (  19.45  )
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

On Mon, Apr 15, 2024 at 12:43:16PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 11, 2024 at 07:05:24PM +0300, Mike Rapoport wrote:
> > diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> > index 45a280f2161c..b4d6868df573 100644
> > --- a/arch/x86/kernel/alternative.c
> > +++ b/arch/x86/kernel/alternative.c
> 
> > @@ -504,17 +513,17 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
> >  		 *   patch if feature is *NOT* present.
> >  		 */
> >  		if (!boot_cpu_has(a->cpuid) == !(a->flags & ALT_FLAG_NOT)) {
> > -			optimize_nops_inplace(instr, a->instrlen);
> > +			optimize_nops_inplace(wr_instr, a->instrlen);
> >  			continue;
> >  		}
> >  
> > -		DPRINTK(ALT, "feat: %d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d) flags: 0x%x",
> > +		DPRINTK(ALT, "feat: %d*32+%d, old: (%px (%px) len: %d), repl: (%px (%px), len: %d) flags: 0x%x",
> >  			a->cpuid >> 5,
> >  			a->cpuid & 0x1f,
> > -			instr, instr, a->instrlen,
> > -			replacement, a->replacementlen, a->flags);
> > +			instr, wr_instr, a->instrlen,
> > +			replacement, wr_replacement, a->replacementlen, a->flags);
> 
> I think this, and

I've found printing both address handy when I debugged it, but no strong
feelings here.
 
> >  
> > -		memcpy(insn_buff, replacement, a->replacementlen);
> > +		memcpy(insn_buff, wr_replacement, a->replacementlen);
> >  		insn_buff_sz = a->replacementlen;
> >  
> >  		if (a->flags & ALT_FLAG_DIRECT_CALL) {
> > @@ -528,11 +537,11 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
> >  
> >  		apply_relocation(insn_buff, a->instrlen, instr, replacement, a->replacementlen);
> >  
> > -		DUMP_BYTES(ALT, instr, a->instrlen, "%px:   old_insn: ", instr);
> > +		DUMP_BYTES(ALT, wr_instr, a->instrlen, "%px:   old_insn: ", instr);
> 
> this, want to remain as is. 

here wr_instr is the buffer to dump:

DUMP_BYTES(type, buf, len, fmt, args...)

rather than an address, which remained 'instr'.
 
> >  		DUMP_BYTES(ALT, replacement, a->replacementlen, "%px:   rpl_insn: ", replacement);
> >  		DUMP_BYTES(ALT, insn_buff, insn_buff_sz, "%px: final_insn: ", instr);
> >  
> > -		text_poke_early(instr, insn_buff, insn_buff_sz);
> > +		text_poke_early(wr_instr, insn_buff, insn_buff_sz);
> >  	}
> >  
> >  	kasan_enable_current();
> 
> The rationale being that we then print an address that can be correlated
> to the kernel image (provided one either kills kaslr or adjusts for it).

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
