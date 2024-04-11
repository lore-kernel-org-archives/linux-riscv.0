Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD22C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 20:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGyXwrDRcscoykCa2oMbhm8D4bdH8Ojvu3xeJDnf8yU=; b=tDvSpzfoMe2UJE
	JU5r7dBTdEIdePOxDQy3REEvA65uoQuQmubC4bQDIBsrUwANInixR5xUK0qZb3WiwreFuf4G0GpzI
	ifLVjLRzL8mZbktk2SJwZ2qdVM9Qzi4nLoqxizFgirQAWQST0TDWujmrjuN+5ZZ6tP4c9P2mj1Uf5
	xL3Dr+1DQuI3TeWWiNXD5/7jDvRsrusng5CwBpyP9/tMxc1vGiZN1592pC5jljklQM7PqZscwJBIk
	asiPgJo/D0oBMMT0ZU8ubSuzGyDCheOLX+YNzAbDoSajhAAB1SQyRD1JddxFAdQje7a4B94a39y0I
	Y+FxpS+U0eSzs2jCmlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv1Qs-0000000E5us-061W;
	Thu, 11 Apr 2024 20:54:06 +0000
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:400::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv1Qk-0000000E5pf-2OIY
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 20:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=8iZCIbXv/o+9vFGi/T/APUrhuAqs9LM6RRA1ferZ2wg=;
	b=kv3VYS1nb+1jhVe9oEyryqOQdogTQlFfldT5zGFYz9zCFOW49UnzyKwrJoDnpG5By8Wz6/89q37/J
	 74y1ANyGrc4+nAdiZLdwTQ7At1BMHShrpW21ksmQCnho4ndLVURK71dGIBPbwAmFDNXGQ3nhWfJORf
	 kv6U7sF+UeIM9uVpTWy6T9yWjx+pcsw/GMhx3KJhDEBn/z0Ta31X9WEj03K6p1on5B6YlTztmnenxM
	 6t/dz3ghpSDNSSOo+Nh+gwCqPRCFFIbfiAkM9VZsrPcOKFRvNMfm1iQmPZN5y4JbJlPGl97XHjBdfO
	 1z6v1BSheYGCsHilS105+mOpPAp8U2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=8iZCIbXv/o+9vFGi/T/APUrhuAqs9LM6RRA1ferZ2wg=;
	b=2lz6/kgt5Ws9Bwhsrc83nOkDSczAnngGL2Yh8km6qYY8h6ibpExr6aVD63x7Bbyn4q9jSyAbA/9ij
	 5z3+8uwDQ==
X-HalOne-ID: 9634f2b2-f845-11ee-b2f6-516168859393
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 9634f2b2-f845-11ee-b2f6-516168859393;
	Thu, 11 Apr 2024 20:53:48 +0000 (UTC)
Date: Thu, 11 Apr 2024 22:53:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
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
Message-ID: <20240411205346.GA66667@ravnborg.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-7-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-7-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_135358_793816_C8FDFB6D 
X-CRM114-Status: GOOD (  24.66  )
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

Hi Mike.

On Thu, Apr 11, 2024 at 07:00:42PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Several architectures override module_alloc() only to define address
> range for code allocations different than VMALLOC address space.
> 
> Provide a generic implementation in execmem that uses the parameters for
> address space ranges, required alignment and page protections provided
> by architectures.
> 
> The architectures must fill execmem_info structure and implement
> execmem_arch_setup() that returns a pointer to that structure. This way the
> execmem initialization won't be called from every architecture, but rather
> from a central place, namely a core_initcall() in execmem.
> 
> The execmem provides execmem_alloc() API that wraps __vmalloc_node_range()
> with the parameters defined by the architectures.  If an architecture does
> not implement execmem_arch_setup(), execmem_alloc() will fall back to
> module_alloc().
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

This code snippet could be more readable ...
> diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
> index 66c45a2764bc..b70047f944cc 100644
> --- a/arch/sparc/kernel/module.c
> +++ b/arch/sparc/kernel/module.c
> @@ -14,6 +14,7 @@
>  #include <linux/string.h>
>  #include <linux/ctype.h>
>  #include <linux/mm.h>
> +#include <linux/execmem.h>
>  
>  #include <asm/processor.h>
>  #include <asm/spitfire.h>
> @@ -21,34 +22,26 @@
>  
>  #include "entry.h"
>  
> +static struct execmem_info execmem_info __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
>  #ifdef CONFIG_SPARC64
> -
> -#include <linux/jump_label.h>
> -
> -static void *module_map(unsigned long size)
> -{
> -	if (PAGE_ALIGN(size) > MODULES_LEN)
> -		return NULL;
> -	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> -				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> -				__builtin_return_address(0));
> -}
> +			.start = MODULES_VADDR,
> +			.end = MODULES_END,
>  #else
> -static void *module_map(unsigned long size)
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
> -	return vmalloc(size);
> -}
> -#endif /* CONFIG_SPARC64 */
> -
> -void *module_alloc(unsigned long size)
> -{
> -	void *ret;
> -
> -	ret = module_map(size);
> -	if (ret)
> -		memset(ret, 0, size);
> +	execmem_info.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
>  
> -	return ret;
> +	return &execmem_info;
>  }
>  
>  /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */

... if the following was added:

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 9e85d57ac3f2..62bcafe38b1f 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -432,6 +432,8 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,

 #define VMALLOC_START           _AC(0xfe600000,UL)
 #define VMALLOC_END             _AC(0xffc00000,UL)
+#define MODULES_VADDR           VMALLOC_START
+#define MODULES_END             VMALLOC_END


Then the #ifdef CONFIG_SPARC64 could be dropped and the code would be
the same for 32 and 64 bits.

Just a drive-by comment.

	Sam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
