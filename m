Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44F5C00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9c+YD+8V4ZrprbpHA18avyiAvHsbxG9dmKKglNBJh4=; b=bsDha4YgbO3hCs
	cJHzVkfVwInxT1jcLu+4HBVciBWY5Lut4Htlf2bG3ZQp8OwrVRh1F3WKCBj5/+Wy2Altd7yrutCx5
	FIInMHpyd1NXGk4KZgHySZE+07sMlMhf2eYHa+cMbb12wOUOscsHIyYX8DUCWL8X351nY8AjfsVo2
	bzO+Zvhkf3NPjH4vTiufbGSYJ0fO5n+wLjF7cR2Ks1S4OKj63dsUNRBcEee2pKA22L+qwvE1nhEIW
	SyFFe1GmPb1XaFdciRMXEfxxJZ2Bt/kDZq5wdqxi8FB0CLPqNyToZ/Av03/iEDGBKVN6kzPKu/3fV
	d0A1HDaP6gVIc8bMEOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJoE-00000007u82-27vY;
	Mon, 15 Apr 2024 10:43:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJoC-00000007u6t-20Xy;
	Mon, 15 Apr 2024 10:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sHN9K6TMgi0EQGirMl9LJrLTL74puiAUj6pDWO1mbbg=; b=GwGuQ4aHjE28h3DMQEljrl12S9
	k7qbRgAehAWmB1KZsKYRkIe5T4YmQ/IK7K1/tscLIiWM+Frzf3BTbHghy00qu8vsdYndUrZk657/5
	7U6MObgQX8Hy2DTMmRYPlPtuplIcSQak3GNH/5HdZ6q2oAguSRJjpD+LaJ9a87To/HWlTYLJ9YvvV
	DlPdjGnZeeuN/uKeKILlCHLcOLy+D7L1I3Tkf+oPOF+MhpDr74c6GfylqnVH3luQcSx0xGQC7Rr+F
	/Pi5v1/cfv4gkg/y9fqk5azH4jFf+jsMj8+XJZsS62wcfAHMmEcUQTu5cq8eADVZRA0kd303q26id
	Ns2I29PA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJnx-0000000FWHZ-0CDf;
	Mon, 15 Apr 2024 10:43:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ACBA530040C; Mon, 15 Apr 2024 12:43:16 +0200 (CEST)
Date: Mon, 15 Apr 2024 12:43:16 +0200
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
Subject: Re: [RFC PATCH 5/7] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <20240415104316.GI40213@noisy.programming.kicks-ass.net>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160526.2093408-6-rppt@kernel.org>
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

On Thu, Apr 11, 2024 at 07:05:24PM +0300, Mike Rapoport wrote:
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 45a280f2161c..b4d6868df573 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c

> @@ -504,17 +513,17 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
>  		 *   patch if feature is *NOT* present.
>  		 */
>  		if (!boot_cpu_has(a->cpuid) == !(a->flags & ALT_FLAG_NOT)) {
> -			optimize_nops_inplace(instr, a->instrlen);
> +			optimize_nops_inplace(wr_instr, a->instrlen);
>  			continue;
>  		}
>  
> -		DPRINTK(ALT, "feat: %d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d) flags: 0x%x",
> +		DPRINTK(ALT, "feat: %d*32+%d, old: (%px (%px) len: %d), repl: (%px (%px), len: %d) flags: 0x%x",
>  			a->cpuid >> 5,
>  			a->cpuid & 0x1f,
> -			instr, instr, a->instrlen,
> -			replacement, a->replacementlen, a->flags);
> +			instr, wr_instr, a->instrlen,
> +			replacement, wr_replacement, a->replacementlen, a->flags);

I think this, and

>  
> -		memcpy(insn_buff, replacement, a->replacementlen);
> +		memcpy(insn_buff, wr_replacement, a->replacementlen);
>  		insn_buff_sz = a->replacementlen;
>  
>  		if (a->flags & ALT_FLAG_DIRECT_CALL) {
> @@ -528,11 +537,11 @@ void __init_or_module noinline apply_alternatives(struct alt_instr *start,
>  
>  		apply_relocation(insn_buff, a->instrlen, instr, replacement, a->replacementlen);
>  
> -		DUMP_BYTES(ALT, instr, a->instrlen, "%px:   old_insn: ", instr);
> +		DUMP_BYTES(ALT, wr_instr, a->instrlen, "%px:   old_insn: ", instr);

this, want to remain as is. 

>  		DUMP_BYTES(ALT, replacement, a->replacementlen, "%px:   rpl_insn: ", replacement);
>  		DUMP_BYTES(ALT, insn_buff, insn_buff_sz, "%px: final_insn: ", instr);
>  
> -		text_poke_early(instr, insn_buff, insn_buff_sz);
> +		text_poke_early(wr_instr, insn_buff, insn_buff_sz);
>  	}
>  
>  	kasan_enable_current();

The rationale being that we then print an address that can be correlated
to the kernel image (provided one either kills kaslr or adjusts for it).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
