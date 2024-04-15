Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E18C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3IxMInHKTHQDJwO+RB0PUw7NtxSsvusqJRy+SE3vAM=; b=AvtqaFoP1OsIwI
	D9QAovBUMn/eIzpYHE/Tr33q33n/x1xRV7zmyshElvcyZ3fSPvJQ6c/AFc7WZml4BtpPmqPnJzllJ
	zkTWFlCjiL7g4qqQpqN4v61pQn57Tij+PfqjZnK/D4AMl+c1+SfvG+zQIOJ+V+M30SMasqqrlvtUg
	c13LwZ1zJtbgamA3IjbX6hYoU8f10D3HElWJ5IyShl4tlktH1RGV6oJv8RrxRhzinDcMYxDIZ82Fu
	c6hvxz2XkvQTVe906dKt3vNC50UkWWQ/bFonzVmDMAkJ5b4gQ6pG43bDLwi93F7BTkluCUZtL9DRw
	1JLZCq8f1/0esjW1hq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHJV-00000007SMe-1po6;
	Mon, 15 Apr 2024 08:03:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHJT-00000007SKd-1foo;
	Mon, 15 Apr 2024 08:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SnC5QhRh3mlXbiY7BQLXM/Gh385CPpYbuU5jeG1ji44=; b=hKFfLh3ZzFSzJGPDsRiopYa0ZT
	efNxCJqPzVqpITxLJsqCQRDO/uvf69qkc9BXqmWr7IXteAQce+itGNJYH8NcZtrv9mowEIaYK6OnE
	zu1E4zjHKlTRzhIC1ZV1QOADiXZdrVLff1qYNP1JR24KuBKOy5EmbA81XuxsDuKJyy+iJ89PdOUI/
	efJhNT73J6k+ohWLAe+NOaJ0tLI7iHDK5KHmXtq9go12IpYLvh58Vu6qfltj09NU88Ez/5/ao6M2e
	ksvVbHfa9e2PLeJq7LlMBgltQx/i+r0JGyYLxMjQF0iD8WvUaOibeLqFhJKeJcs34Gs9iz6tlyZPZ
	lKITRWCQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHJC-0000000FFhi-3aDy;
	Mon, 15 Apr 2024 08:03:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 12C5730040C; Mon, 15 Apr 2024 10:03:22 +0200 (CEST)
Date: Mon, 15 Apr 2024 10:03:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 06/15] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Message-ID: <20240415080321.GG40213@noisy.programming.kicks-ass.net>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-7-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-7-rppt@kernel.org>
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

On Thu, Apr 11, 2024 at 07:00:42PM +0300, Mike Rapoport wrote:
> +static struct execmem_info execmem_info __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
> +			.start = MODULES_VADDR,
> +			.end = MODULES_END,
> +			.alignment = 1,
> +		},
> +	},
> +};
> +
> +struct execmem_info __init *execmem_arch_setup(void)
>  {
> +	execmem_info.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
> +
> +	return &execmem_info;
>  }

> +static struct execmem_info execmem_info __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
> +			.start = MODULES_VADDR,
> +			.end = MODULES_END,
> +			.pgprot = PAGE_KERNEL_EXEC,
> +			.alignment = 1,
> +		},
> +	},
> +};
> +
> +struct execmem_info __init *execmem_arch_setup(void)
>  {
> +	return &execmem_info;
>  }

> +static struct execmem_info execmem_info __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
> +			.pgprot = PAGE_KERNEL_RWX,
> +			.alignment = 1,
> +		},
> +	},
> +};
> +
> +struct execmem_info __init *execmem_arch_setup(void)
>  {
> +	execmem_info.ranges[EXECMEM_DEFAULT].start = VMALLOC_START;
> +	execmem_info.ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
> +
> +	return &execmem_info;
>  }

> +static struct execmem_info execmem_info __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
> +			.pgprot = PAGE_KERNEL,
> +			.alignment = 1,
> +		},
> +	},
> +};
> +
> +struct execmem_info __init *execmem_arch_setup(void)
>  {
> +	execmem_info.ranges[EXECMEM_DEFAULT].start = MODULES_VADDR;
> +	execmem_info.ranges[EXECMEM_DEFAULT].end = MODULES_END;
> +
> +	return &execmem_info;
>  }

> +static struct execmem_info execmem_info __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
>  #ifdef CONFIG_SPARC64
> +			.start = MODULES_VADDR,
> +			.end = MODULES_END,
>  #else
> +			.start = VMALLOC_START,
> +			.end = VMALLOC_END,
> +#endif
> +			.alignment = 1,
> +		},
> +	},
> +};
> +
> +struct execmem_info __init *execmem_arch_setup(void)
>  {
> +	execmem_info.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
>  
> +	return &execmem_info;
>  }

I'm amazed by the weird and inconsistent breakup of initializations.

What exactly is wrong with something like:

static struct execmem_info execmem_info __ro_after_init;

struct execmem_info __init *execmem_arch_setup(void)
{
	execmem_info = (struct execmem_info){
		.ranges = {
			[EXECMEM_DEFAULT] = {
				.start	= MODULES_VADDR,
				.end	= MODULES_END,
				.pgprot	= PAGE_KERNEL,
				.alignment = 1,
			},
		},
	};
	return &execmem_info;
}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
