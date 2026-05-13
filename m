Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FCECD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 18:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnhzziWI/tAdkbPWwkgwyREP9aVo+PXAA58fNuJ9hJo=; b=P2rOnehMGGGBOt
	El/2HBq5vSJY+iz+1OmYkPnhX2rp2lVLc/f2CKya7vrTUfxuOjZtdNLHLh10Rxr12UinRt7xFZsWG
	xCOKIh0vLqSPMIG9HqyU7A3arcy6x6/wkoPC74Nw0UVZA+vRMspqgfNm0QXM5Vz8O7Mdk/+/7XHKz
	54tw6CjEhRpW10JeRP0MHMJMCrri4rK82eh97FlV8WTyOMw7WgqmHivqa5bMfjqhmcJ+4M+CDTK+A
	GcVmbDznUKUta1HfjrGsAfOAII40lezvGw6VFRYhYvmpUd7FLrxfvgyY+7WPSK5thPuTONu8Y8JLq
	lrRtlexmZdiJbh0Le/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEHY-00000003THk-1dlM;
	Wed, 13 May 2026 18:26:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEHX-00000003THc-1jZd
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 18:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEDDF600AE;
	Wed, 13 May 2026 18:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1ABC2BCB7;
	Wed, 13 May 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778696766;
	bh=Sla0gj1TI+Tj5BUFAwsF4c5sPgjNg/ssUh4AJzjhcN8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rR7Izjej7ta5J0k2pCxmXWv+BWK895Xc+DUOOGnP5hmqUMDgeP+hXIOzqeY28VAe0
	 JI2fJU7bYVElx5XbgqiTlRmw/b2nQtLrNCgwvzRgqs+ckkx0o+M0JADCuQ2p+q+H0s
	 QohBh7bUah6KRtRVJQuh4A06oYlyCLsW8hlkrwdwPn8p0UJNSe2iJIMflwtBG47+dS
	 zRNWYljH6OiETF3Scc2r4eQThWlMBWoHxSONBhKjR3AvsKR5sVJfhQndgdnmQ5Zmjr
	 wHoCHntgBtlOOs+ct3s90Yjv7OjZ2oTfaE6maon8RWgBu6G3rlwNZ2/JjSCo0DmqZ/
	 t3neYb66nJECg==
Date: Wed, 13 May 2026 12:25:53 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
In-Reply-To: <20260511-p8700-wfi-v1-1-099b1d10fcf2@htecgroup.com>
Message-ID: <53299395-2e6a-a9d2-106b-8b857f64f7ba@kernel.org>
References: <20260511-p8700-wfi-v1-1-099b1d10fcf2@htecgroup.com>
MIME-Version: 1.0
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

Hi,

On Mon, 11 May 2026, Aleksa Paunovic via B4 Relay wrote:

> From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> 
> The MIPS P8700 has bugs with the WFI instruction. 

Has MIPS published an erratum for this?   If so, could you add a link to 
it in the patch description?  If not, could you please briefly describe 
the impact of the bug in the patch description, when WFI is used?

> This errata uses the RISC-V alternatives framework to patch all WFI 
> instructions with the MIPS P8700 pause opcode (0x00501013) at runtime 
> when running on P8700 hardware.
> 
> Two call sites are patched:
>  - arch/riscv/kernel/head.S: secondary hart parking loop
>  - arch/riscv/include/asm/processor.h: wait_for_interrupt()
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
> This patch was tested on QEMU configured with eight P8700 harts,
> as well as on the MIPS Boston board, configured with a single P8700 CPU.
> Errata application was tested by disassembling with GDB on QEMU
> and inserting an illegal instruction on the Boston board.
> Correctness was tested with a combination of kselftests
> and torture tests (rcu, locktorture), along with coremark testing.

This kind of test report is very helpful!  Thank you.

> ---
>  arch/riscv/Kconfig.errata                    | 11 +++++++++++
>  arch/riscv/errata/mips/errata.c              | 14 ++++++++++++++
>  arch/riscv/include/asm/errata_list.h         | 27 +++++++++++++++++++++++++++
>  arch/riscv/include/asm/errata_list_vendors.h |  5 +++--
>  arch/riscv/include/asm/processor.h           |  3 ++-
>  arch/riscv/kernel/head.S                     |  4 +++-
>  6 files changed, 60 insertions(+), 4 deletions(-)
> 

[ ... ]

> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 6694b5ccdcf85cfe7e767ea4de981b34f2b17b04..cbe90b19556203e1462cfb345b164c9061887e74 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -25,6 +25,16 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
>  	    __stringify(RISCV_PTR sifive_cip_453_page_fault_trp),	\
>  	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
>  	    CONFIG_ERRATA_SIFIVE_CIP_453)
> +
> +#ifdef CONFIG_ERRATA_MIPS_P8700_WFI
> +#define ALT_WFI								\
> +ALTERNATIVE("wfi; .rept 7; nop; .endr;",				\
> +	".rept 8; .insn 0x00501013; .endr;", MIPS_VENDOR_ID,		\
> +	ERRATA_MIPS_P8700_WFI, CONFIG_ERRATA_MIPS_P8700_WFI)

.insn only works on newer toolchains/binutils versions - this is why 
CONFIG_AS_HAS_INSN was added.  See for example commit 
dc20452e6caf962f04ede7f364267b0c37784ab4 ("riscv: Fix CONFIG_AS_HAS_INSN 
for new .insn usage").  Can you please fix this?

Please add some sort of code comment to describe why 8 MIPS PAUSE 
instructions are needed, as opposed to a single MIPS PAUSE instruction.  
An event that causes the first PAUSE to exit would then encounter the 
subsequent PAUSEs, at which point, there could be additional latency 
before the core can return to doing real work.  The P8700 Programmer's 
Guide mentions a maximum number of cycles per PAUSE instruction, but 
doesn't state what it is precisely.  Could you please add a comment here 
to describe what it is?

> +#else
> +#define ALT_WFI	wfi
> +#endif
> +
>  #else /* !__ASSEMBLER__ */
>  
>  #define ALT_SFENCE_VMA_ASID(asid)					\
> @@ -53,6 +63,23 @@ asm(ALTERNATIVE(	\
>  	: /* no inputs */	\
>  	: "memory")
>  
> +#ifdef CONFIG_ERRATA_MIPS_P8700_WFI
> +#define ALT_RISCV_WFI()										\
> +asm volatile(ALTERNATIVE(									\
> +		"wfi\n" /* Original RISC-V wfi insn */						\
> +		__nops(7),									\
> +		".rept 8;" MIPS_PAUSE ".endr;\n", /* Replacement: mips.pause for P8700 */	\
> +		MIPS_VENDOR_ID, /* Vendor ID to match */					\
> +		ERRATA_MIPS_P8700_WFI, /* patch_id */						\
> +		CONFIG_ERRATA_MIPS_P8700_WFI)							\
> +		: /* no outputs */								\
> +		: /* no inputs */								\
> +		: "memory")
> +#else
> +#define ALT_RISCV_WFI()		\
> +	__asm__ __volatile__ ("wfi")
> +#endif
> +
>  /*
>   * _val is marked as "will be overwritten", so need to set it to 0
>   * in the default case.


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
