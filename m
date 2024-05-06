Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9493DC25B4F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9pPXBkDHajPINLWwYCAG9zZsqNg4I/9S/tuwyfcDnU=; b=0p9UdpDogpKB7n
	0yo67qa6o4AeUizoRLkIUehix6ooj4YL8oTEXigEPul4LD4HtZyH/cm1AqpJmUcKEHCBZlHqVyICo
	f8/QUqsNOJ3rOFGBezZf3fF6hWY7nS3VRCoRw3i/M7Ylqck+XoTHWWQxVFF55kl1XbHVCTHSQTv4J
	uTEHge6o7uH9vH6agwMCgbqzuySNqyD+1Enwpeg9onTV4x1S+cgvoXwQ+2ypq/CD6MB5QVlBCpZmd
	DQEJAMCmcB9yHUb9CMocwjZOR5XDTIJ7xe6mv++O7oBqv5BezAKOSph7c2wwEDUjwSiUQtWQsPXu2
	n5DyNSvNG3fjgV7VSJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s42s1-00000008Mjv-09Yq;
	Mon, 06 May 2024 18:15:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s42rx-00000008MgN-1GlS;
	Mon, 06 May 2024 18:15:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 617ADCE0B16;
	Mon,  6 May 2024 18:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4789AC116B1;
	Mon,  6 May 2024 18:15:10 +0000 (UTC)
Date: Mon, 6 May 2024 14:15:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald Dutile
 <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko Carstens
 <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, Liviu
 Dudau <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>, Russell King
 <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Song Liu
 <song@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas
 Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 06/17] mm: introduce execmem_alloc() and
 execmem_free()
Message-ID: <20240506141515.10fb2a69@gandalf.local.home>
In-Reply-To: <20240505142600.2322517-7-rppt@kernel.org>
References: <20240505142600.2322517-1-rppt@kernel.org>
	<20240505142600.2322517-7-rppt@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_111521_545603_B02E9E74 
X-CRM114-Status: GOOD (  14.20  )
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

On Sun,  5 May 2024 17:25:49 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 70139d9d2e01..c8ddb7abda7c 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -25,6 +25,7 @@
>  #include <linux/memory.h>
>  #include <linux/vmalloc.h>
>  #include <linux/set_memory.h>
> +#include <linux/execmem.h>
>  
>  #include <trace/syscall.h>
>  
> @@ -261,15 +262,14 @@ void arch_ftrace_update_code(int command)
>  #ifdef CONFIG_X86_64
>  
>  #ifdef CONFIG_MODULES
> -#include <linux/moduleloader.h>
>  /* Module allocation simplifies allocating memory for code */
>  static inline void *alloc_tramp(unsigned long size)
>  {
> -	return module_alloc(size);
> +	return execmem_alloc(EXECMEM_FTRACE, size);
>  }
>  static inline void tramp_free(void *tramp)
>  {
> -	module_memfree(tramp);
> +	execmem_free(tramp);
>  }
>  #else
>  /* Trampolines can only be created if modules are supported */
> diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
