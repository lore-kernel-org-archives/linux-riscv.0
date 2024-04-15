Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5776CC00A94
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCN5oy5Pq/epN0S8up+6OGjnn3p+oA0Zt3zWGBs7ghQ=; b=TWrgTWgcGfNmVi
	8QMOsszCWgDGhmve/EtHjN+kdaTmQ8EG7r2s8KTYBmJ3c29BcAA2C35LY6z3rLy5iDtPSuhJq7rfM
	8PW+XQ9sItSb0CQ5Pgu7R3E97QSO5oxtdSuZYO37+k9eDG9fTsZkf+0luOssqBfvKc+dB7XWNvd12
	MawDqkB9PNzdZ0sNFPBnOdkcJbyizf2qiq/JANSNKIIKJQw9xmCADflmojBClUAreVANaV8fX6fVS
	6ziMO0iNzLLtibK5jzdJyPYRYgBfK4iCD936Qb1I/2PT9W1YLdQePoaVIo9mzNHOmCWlu5kd6hgXJ
	UrIjtxSDMYA9X4sQ+B/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIm4-00000007jJe-36bz;
	Mon, 15 Apr 2024 09:37:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIlv-00000007jF9-16EL;
	Mon, 15 Apr 2024 09:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gJURSN8ZhZs54MX6UPe8WS991KHmcU3CMSr/wsPBYas=; b=WL3mGK96b4dqocWg2WT6S+o3Lh
	6R4hcBA6RfcHuQQK7isTyMyXCwDos8Q1HdHKBvnc80dazhTsMKZZh+HOA+2p3MytoMgm0z79fe1lO
	6VNzmYAbfQ0K4rY/gTJDrpu5Cj+twK8P8H6r2xTaYF5wANkZ19gJAqZM8x7uwfcFkyoEWlipCNTWk
	6fylSl1gmglon4eNg+zb/yC04zTO/2Lfq8d+LNZPMMi03er3jB/2uzdVHk4Db9ls69FN+sjSeErGv
	ir1OIAWRPD8gvlVd9eQwbdsiTncbhidLvva928W/3FSV8BR+sXBV2NxpcV2Vc46i56RkcJA4zwnpr
	gpLaCNRw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIlk-0000000FOjV-0IDN;
	Mon, 15 Apr 2024 09:36:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B1DC030040C; Mon, 15 Apr 2024 11:36:55 +0200 (CEST)
Date: Mon, 15 Apr 2024 11:36:55 +0200
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
Subject: Re: [PATCH v4 07/15] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20240415093655.GH40213@noisy.programming.kicks-ass.net>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-8-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-8-rppt@kernel.org>
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

On Thu, Apr 11, 2024 at 07:00:43PM +0300, Mike Rapoport wrote:

> +static struct execmem_info execmem_info __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
> +			.flags = EXECMEM_KASAN_SHADOW,
> +			.alignment = MODULE_ALIGN,
> +		},
> +	},
> +};
>  
> +struct execmem_info __init *execmem_arch_setup(void)
>  {
> +	unsigned long start, offset = 0;
>  
> +	if (kaslr_enabled())
> +		offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
>  
> +	start = MODULES_VADDR + offset;
> +	execmem_info.ranges[EXECMEM_DEFAULT].start = start;
> +	execmem_info.ranges[EXECMEM_DEFAULT].end = MODULES_END;
> +	execmem_info.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
>  
> +	return &execmem_info;
>  }

struct execmem_info __init *execmem_arch_setup(void)
{
	unsigned long offset = 0;

	if (kaslr_enabled())
		offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;

	execmem_info = (struct execmem_info){
		.ranges = {
			[EXECMEM_DEFAULT] = {
				.start     = MODULES_VADDR + offset,
				.end       = MODULES_END,
				.pgprot    = PAGE_KERNEL,
				.flags     = EXECMEM_KASAN_SHADOW,
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
