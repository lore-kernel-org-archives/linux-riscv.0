Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5514ECF042A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIinx/G4cLJuVBoYIIHj19QdIT84CLVi1IvKfvZewac=; b=BPkE6uZM0TbyyD
	6HMGMp39N+AWkihdVs7cxI2GRJJ8HyEU2fHLG0kSiVQtd4F8d0wazVVBwhBcBFnBVny50am+PHxT1
	KB1g5+On5qPAF3GQkPc8BfGD/XCMQ0k0Td+vZoQGzPsZBDoGUtydGNi+K0TeHmY2qgSg1qcMymnpr
	h+EQtnccbf1YAwLiUq9ftBGnNM0vrK2myJSfslNBMqS1i8RCc+4cscgX6BQ/ZbJ5I5bwiJw+ra/8K
	mcwXvVBVwUdLhHdZY4ihbg9ny0HgeBYRBxrYDtndC3ZPP475E/JZfUxnJ8Jor9nBMt2qU3+YTJmt7
	CnZosU9QK5mU0JEBnUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIvg-00000007Ksc-1imC;
	Tue, 08 Oct 2024 22:43:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIts-00000007KZ6-07jy;
	Tue, 08 Oct 2024 22:41:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89C5C5C547A;
	Tue,  8 Oct 2024 22:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821CEC4CEC7;
	Tue,  8 Oct 2024 22:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728427310;
	bh=dcyvt0dgAZszkRlVAvb5HjPFo8uYI0c0H8I8+ifT9Mc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YVKI9Crqoxb+kubNcOuiLkrNECGkggxSHQ7zCyU+C4i8uxiYSqLNhL0X/vyK4nbzv
	 ZTZhdx2QyfKE2LnLqpmbl5qupaMKqcPjo4pfP0XVVDT7jJ3Pi+yGLIFlAoyQ1zJ8f/
	 LRx6mNnFL/YEgXB3zZceNPZm3XxIxsg2PBPTbpBe46PAYpR81VHsD8MOEnS/HXOEZ2
	 Ap8/akyKsgqNs5Pe4svGt4x+EP0vBEWmNqIITelNqML0XZvg5lqB67aOG28+RNgkvt
	 wfDDeXaYNBD5I8SjevQEEAIRaEj2kZMlEcSfY0ZWuEXT4HdfIj190zY9PkfL3KNXYl
	 LDp5MEWE7lO/w==
Date: Wed, 9 Oct 2024 07:41:40 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-Id: <20241009074140.b163eceb2f973227b400c962@kernel.org>
In-Reply-To: <20241007204743.41314f1d@gandalf.local.home>
References: <20241007204743.41314f1d@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_154152_146404_CA156AC2 
X-CRM114-Status: GOOD (  13.05  )
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

Hi Steve, 

> diff --git a/include/asm-generic/ftrace.h b/include/asm-generic/ftrace.h
> index 3a23028d69d2..ba7b7d6e55d6 100644
> --- a/include/asm-generic/ftrace.h
> +++ b/include/asm-generic/ftrace.h
> @@ -10,4 +10,17 @@
>   * common definitions are already in linux/ftrace.h.
>   */
>  
> +#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> +struct __arch_ftrace_regs {
> +	struct pt_regs		regs;
> +};
> +
> +#define arch_ftrace_get_regs(fregs)					\
> +	({ struct __arch_fregs_regs *__f = (struct __arch_ftrace_regs *)(fregs); \
> +		&__f->regs;						\
> +	})
> +
> +struct ftrace_regs;
> +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> +
>  #endif /* __ASM_GENERIC_FTRACE_H__ */

There seems no #endif for CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS.
I wonder how it passed the build. (#ifdef block does not affect over
the file boundary?

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
