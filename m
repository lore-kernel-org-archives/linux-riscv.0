Return-Path: <SRS0=rfC7=BJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA69DC433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 09:15:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB3D220809
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 09:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mb0ArXxz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjhsmzIR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB3D220809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C4BFiV+BADx3LC8OdB7e98uqCNW9z4oGA9I9zdVpV+A=; b=Mb0ArXxzwKoEucLSlotFmMSSC
	33Itr6Zafo+JyJ7Z+hyggK8J1YhVWs2EWWV0IQwgDXF0phjhlrRL6hlFI8QVjBel9Y6//QZBmZLpu
	2tund67DJmWTcsTSUHSoUdcpsOKTw/87mdR8iaoSZowgYJlrxiwb04Vhf0/rTKCsLl2bVMJnI/Say
	GAmv/2GEc4YPx+53TPOReZSP4LGGkSGr+o/bVgVS4DlPe4YJ2qagfFwgvuXA9Hd1eP8yca0unXwVi
	oP8cmQ8PCfB1OV+TsJaKKqmRaKX8zjd92eDZkehYTYKQPNgbFPu8wZxHoJ92a6T47/nqXi+H+RkY2
	zoLm13BlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k14eM-0004OV-1M; Thu, 30 Jul 2020 09:14:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k14eJ-0004Nf-Ct
 for linux-riscv@lists.infradead.org; Thu, 30 Jul 2020 09:14:52 +0000
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C15820809;
 Thu, 30 Jul 2020 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596100489;
 bh=l4NjSWF1HZWx/Xih8Ycmt7FVp9NzizelD5w+ezXB0Gs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IjhsmzIR4gyOzE6k4cUaxOv7b3yXeZhUjHCgaMSbpMORCrhxlHXPA6sn2Z9x6yXYg
 bZ8ePyTHxQnYyT4KrMKZErHOPOeTCznQMU31gArycY+pKUSlT/2NRLzUV8VOHzTDqJ
 dYnv4+pPpOJMQZo7w3oqdgMb6bpD6kXrK52WSEmg=
Date: Thu, 30 Jul 2020 12:14:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v4 3/9] RISC-V: Implement late mapping page table
 allocation functions
Message-ID: <20200730091440.GA534153@kernel.org>
References: <20200729233635.14406-1-atish.patra@wdc.com>
 <20200729233635.14406-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729233635.14406-4-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_051451_642621_66C9C67A 
X-CRM114-Status: GOOD (  28.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
 Nick Hu <nickhu@andestech.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Yash Shah <yash.shah@sifive.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Jul 29, 2020 at 04:36:29PM -0700, Atish Patra wrote:
> Currently, page table setup is done during setup_va_final where fixmap can
> be used to create the temporary mappings. The physical frame is allocated
> from memblock_alloc_* functions. However, this won't work if page table
> mapping needs to be created for a different mm context (i.e. efi mm) at
> a later point of time.

TBH, I'm not very happy to see pte/pmd allocations, but I don't see a
way to reuse the existing routines in this case.

As a general wild idea, maybe it's worth using something like

struct pt_alloc_ops {
	pte_t *(*get_pte_virt)(phys_addr_t pa);
	phys_addr_t (*alloc_pte)(uintptr_t va);
	...
};

and add there implementations: nommu, MMU early and MMU late.

Some more comments below.
 
> Use generic kernel page allocation function & macros for any mapping
> after setup_vm_final.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/init.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 68c608a0e91f..cba03fec08c1 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -212,6 +212,7 @@ pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
>  static bool mmu_enabled;
> +static bool late_mapping;
>  
>  #define MAX_EARLY_MAPPING_SIZE	SZ_128M
>  
> @@ -236,7 +237,9 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>  
>  static pte_t *__init get_pte_virt(phys_addr_t pa)
>  {
> -	if (mmu_enabled) {
> +	if (late_mapping)
> +		return (pte_t *) __va(pa);
> +	else if (mmu_enabled) {
>  		clear_fixmap(FIX_PTE);
>  		return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
>  	} else {
> @@ -246,13 +249,19 @@ static pte_t *__init get_pte_virt(phys_addr_t pa)
>  
>  static phys_addr_t __init alloc_pte(uintptr_t va)
>  {
> +	unsigned long vaddr;
>  	/*
>  	 * We only create PMD or PGD early mappings so we
>  	 * should never reach here with MMU disabled.
>  	 */
>  	BUG_ON(!mmu_enabled);
> -
> -	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> +	if (late_mapping) {
> +		vaddr = __get_free_page(GFP_KERNEL);
> +		if (!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)))
> +			BUG();

Is BUG() here really necessary? If I understand correctly, this would be
used to enable mappings for EFI runtime services, so we probably want to
propagete the error to to caller and, if really necessary, BUG() there,
don't we?

> +		return __pa(vaddr);
> +	} else
> +		return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>  }
>  
>  static void __init create_pte_mapping(pte_t *ptep,
> @@ -281,7 +290,9 @@ pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
>  
>  static pmd_t *__init get_pmd_virt(phys_addr_t pa)
>  {
> -	if (mmu_enabled) {
> +	if (late_mapping)
> +		return (pmd_t *) __va(pa);
> +	else if (mmu_enabled) {
>  		clear_fixmap(FIX_PMD);
>  		return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
>  	} else {
> @@ -292,8 +303,13 @@ static pmd_t *__init get_pmd_virt(phys_addr_t pa)
>  static phys_addr_t __init alloc_pmd(uintptr_t va)
>  {
>  	uintptr_t pmd_num;
> +	unsigned long vaddr;
>  
> -	if (mmu_enabled)
> +	if (late_mapping) {
> +		vaddr = __get_free_page(GFP_KERNEL);
> +		BUG_ON(!vaddr);
> +		return __pa(vaddr);

Does nommu also need to allocate a page for pmd?

> +	} else if (mmu_enabled)
>  		return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>  
>  	pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
> @@ -533,6 +549,9 @@ static void __init setup_vm_final(void)
>  	/* Move to swapper page table */
>  	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
>  	local_flush_tlb_all();
> +
> +	/* generic page allocation function must be used to setup page table */
> +	late_mapping = true;
>  }
>  #else
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> -- 
> 2.24.0
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
