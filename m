Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347DBC25B46
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc57i/CK4MZT8RP/Un4CNxy72bIuYF2rtWSzoRdmUjY=; b=uxtBezvUkG0kmt
	wyljGJJeTtPue1L9p7x+Fbb8oCAUvE5eiOKMjEONe+XnSuhROKYhqFaFlwtgdK3/ZSDkVsW658YR4
	xLqsPkmGhkbdD25qXSSOLWMm5CoNaMLX1c4NgpVDU/xT2RFB8Cr6vBlZeODB/pzKDSZaKHqTCX/qU
	qAxht1nAQ+ZQH41Frdx5M4aN0WCWEdZnKnQF9HcP18qaUUj59sGw0zkS7g8nR+/28DPDcIB1STJq2
	JXqwgYnUlpeNfmlGLIXNhr4sRsuLueZGfThRsBZMdnMZYilTIkW7xuLb5Rx3Sn+96VOcYNQg8y0fp
	lDwRKlUHMbCClbiRJ0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quycB-007v4x-1Q;
	Mon, 23 Oct 2023 17:21:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyc7-007v2h-0y;
	Mon, 23 Oct 2023 17:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF6ADCE0C47;
	Mon, 23 Oct 2023 17:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977DEC433C7;
	Mon, 23 Oct 2023 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698081670;
	bh=WQYEKm0Mc7inaH0wFnxcEUmfAmPR1JoMV7fRygVNKQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOVDksWfw+hV9R+Z5ZexM6NcY3xDNdzdq9AsRt4vO9wMdxWhqWWcxLwP+eW4A962q
	 Qk6ekhq2Ipm65VVsfFxXGy8qQeQOWzCvDqLJfEU8nWaZHFbI6flnaXvlVH0CRDWH+w
	 hIMRahts5mdD+tpF+6eXFcpVMEl1Ep7tHL5W7fbVdPmlfZ6yQugf14RafBolwJcEMn
	 21vyDdZz0h9WC0+Q/QJBX2oIB6fGQ1kXhcFuxCsKB2tbLoPEgU/BSdSOixB9qw31iO
	 OgDPN8A4Uqs6uFqTMJcPk6zjMZ/offJmG+hcHSxPefHsLKYd1oYsfoKs6fvoRIkbKX
	 wMvEth+vb/+ag==
Date: Mon, 23 Oct 2023 18:21:00 +0100
From: Will Deacon <will@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
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
	Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 07/13] arm64, execmem: extend execmem_params for
 generated code allocations
Message-ID: <20231023172059.GB4041@willie-the-truck>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-8-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918072955.2507221-8-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_102115_675269_5BFA1080 
X-CRM114-Status: GOOD (  19.42  )
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

On Mon, Sep 18, 2023 at 10:29:49AM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> The memory allocations for kprobes and BPF on arm64 can be placed
> anywhere in vmalloc address space and currently this is implemented with
> overrides of alloc_insn_page() and bpf_jit_alloc_exec() in arm64.
> 
> Define EXECMEM_KPROBES and EXECMEM_BPF ranges in arm64::execmem_params and
> drop overrides of alloc_insn_page() and bpf_jit_alloc_exec().
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/arm64/kernel/module.c         | 13 +++++++++++++
>  arch/arm64/kernel/probes/kprobes.c |  7 -------
>  arch/arm64/net/bpf_jit_comp.c      | 11 -----------
>  3 files changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index cd6320de1c54..d27db168d2a2 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -116,6 +116,16 @@ static struct execmem_params execmem_params __ro_after_init = {
>  			.flags = EXECMEM_KASAN_SHADOW,
>  			.alignment = MODULE_ALIGN,
>  		},
> +		[EXECMEM_KPROBES] = {
> +			.start = VMALLOC_START,
> +			.end = VMALLOC_END,
> +			.alignment = 1,
> +		},
> +		[EXECMEM_BPF] = {
> +			.start = VMALLOC_START,
> +			.end = VMALLOC_END,
> +			.alignment = 1,
> +		},
>  	},
>  };
>  
> @@ -140,6 +150,9 @@ struct execmem_params __init *execmem_arch_params(void)
>  		r->end = module_plt_base + SZ_2G;
>  	}
>  
> +	execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_ROX;
> +	execmem_params.ranges[EXECMEM_BPF].pgprot = PAGE_KERNEL;
> +
>  	return &execmem_params;
>  }
>  
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 70b91a8c6bb3..6fccedd02b2a 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -129,13 +129,6 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>  	return 0;
>  }
>  
> -void *alloc_insn_page(void)
> -{
> -	return __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
> -			GFP_KERNEL, PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS,
> -			NUMA_NO_NODE, __builtin_return_address(0));
> -}

It's slightly curious that we didn't clear the tag here, so it's nice that
it all happens magically with your series:

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
