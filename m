Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA36DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 18:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ugOeNnPLRmE+UZI5S7RGuCiVGDDOf9oWr7K8WK5ERw=; b=I+8C3KFFOowfxD
	XB5Kjyyk4/McceZYnbi9DlKNrbBtDHSJKbq5eoPjaN73tjDsIY4RL1g/cZCgRDnEfS16wQV/fy19D
	+873+sMhn8mv6y+2QVukRAFwvSVyTx09RiimEs8hrrSN/7fLoi/hB+NZAHrBM9LX3eyK8NL/vTWl+
	QH30ym/EVFP9/4Mb1/WspETOu6XYfWt8x3gcIZWVySc6e+mkLt6+RZyCxfKP3LeijOp3bcFNmFbIo
	GpTUOJr0ev7Eh6RN5awl9S3HUtKcOGc9v+sPOz41/kIyWtCdJH22a1lQUYzHwwenWdORQC5c9AFtt
	yaCLHlNlse6gj9kFSksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofmqQ-00Ag9e-Jb; Tue, 04 Oct 2022 18:40:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofmqN-00Ag9B-CY
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 18:40:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7633614CE;
	Tue,  4 Oct 2022 18:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F19C433C1;
	Tue,  4 Oct 2022 18:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664908837;
	bh=/BjqC3PSrWPqo5dYctMa7Gci6LYEkDUHjYF8Egs/s6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1c5DdoBKgsLcquMxZLu5qNDH3EaotA20zkbHAsT1zyTc1qxjtS1uu0YLPNmzl8WT
	 Is9LqjTonDlDV4dJ0Sfi4U1vei3WrWmE02qEAjkoMC/KsXueH0nNtGR82OofKRmMeq
	 MmyO92CmnDNFJPyp1dG8C0lgHo4ma7LdhsuQr8MIBkba2Qi8/TAZjOHylTDouH6uGK
	 fV5y8/m+FC9agbAcbNzZxUF0B1zeGjAqJQDzzIqqHJJ6qWAJpSBny236tw7PS2v9NU
	 LX3GN9GrTu0h4nodnfudjnUzZD6P913AcCUNWXajP5z6QYx6WVz6SqsBxnOLycz1E/
	 z720PplVtpdzw==
Date: Tue, 4 Oct 2022 19:40:33 +0100
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn
Subject: Re: [PATCH v5 2/4] mm: support Svnapot in physical page
 linear-mapping
Message-ID: <Yzx+IbMifJ5xJpuq@spud>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-3-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221003134721.1772455-3-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_114039_541718_F572E6BD 
X-CRM114-Status: GOOD (  31.61  )
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


Hey Qinglin Pan,

Other comments aside, it'd be good to add previous reviewers to the CC
list on follow-up versions.

On Mon, Oct 03, 2022 at 09:47:19PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> mm: modify pte format for Svnapot

"riscv: mm: foo" please.

> 
> Svnapot is powerful when a physical region is going to mapped to a
> virtual region. Kernel will do like this when mapping all allocable
> physical pages to kernel vm space. This commit modifies the

s/This commit modifies/Modify

> create_pte_mapping function used in linear-mapping procedure, so the
> kernel can be able to use Svnapot when both address and length of
> physical region are 64KB align. Code here will be executed only when
> other size huge page is not suitable, so it can be an addition of
> PMD_SIZE and PUD_SIZE mapping.
> 
> This commit also modifies the best_map_size function to give map_size

s/This commit also modifies/Modify/

Although, with the "also" should this be two patches or is there a
compile time dependency?

> many times instead of only once, so a memory region can be mapped by
> both PMD_SIZE and 64KB napot size.
> 
> It is tested by setting qemu's memory to a 262272k region, and the
> kernel can boot successfully.
> 
> Currently, the modified create_pte_mapping will never take use of SVNAPOT,
> because this extension is detected in riscv_fill_hwcap and enabled in
> apply_boot_alternatives(called from setup_arch) which is called
> after setup_vm_final. We will need to support function like

Out of curiousity, why doesn't this series add the support?
Do you intend sending a follow up series?

> riscv_fill_hwcap_early to fill hardware capabilities more earlier, and
> try to enable SVNAPOT more earlier in apply_early_boot_alternatives,
> so that we can determine SVNAPOT's presence during setup_vm_final.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b56a0a75533f..76317bb28f29 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -373,9 +373,21 @@ static void __init create_pte_mapping(pte_t *ptep,
>  				      phys_addr_t sz, pgprot_t prot)
>  {
>  	uintptr_t pte_idx = pte_index(va);
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT

Would using IS_ENBLED() cause problems here?

> +	pte_t pte;
> +
> +	if (has_svnapot() && sz == NAPOT_CONT64KB_SIZE) {
> +		do {
> +			pte = pfn_pte(PFN_DOWN(pa), prot);
> +			ptep[pte_idx] = pte_mknapot(pte, NAPOT_CONT64KB_ORDER);
> +			pte_idx++;
> +			sz -= PAGE_SIZE;
> +		} while (sz > 0);
> +		return;
> +	}
> +#endif
>  
>  	BUG_ON(sz != PAGE_SIZE);
> -
>  	if (pte_none(ptep[pte_idx]))
>  		ptep[pte_idx] = pfn_pte(PFN_DOWN(pa), prot);
>  }
> @@ -673,10 +685,18 @@ void __init create_pgd_mapping(pgd_t *pgdp,
>  static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  {
>  	/* Upgrade to PMD_SIZE mappings whenever possible */
> -	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
> +	base &= PMD_SIZE - 1;
> +	if (!base && size >= PMD_SIZE)
> +		return PMD_SIZE;
> +
> +	if (!has_svnapot())
>  		return PAGE_SIZE;
>  
> -	return PMD_SIZE;
> +	base &= NAPOT_CONT64KB_SIZE - 1;
> +	if (!base && size >= NAPOT_CONT64KB_SIZE)
> +		return NAPOT_CONT64KB_SIZE;
> +
> +	return PAGE_SIZE;
>  }
>  
>  #ifdef CONFIG_XIP_KERNEL
> @@ -1111,9 +1131,9 @@ static void __init setup_vm_final(void)
>  		if (end >= __pa(PAGE_OFFSET) + memory_limit)
>  			end = __pa(PAGE_OFFSET) + memory_limit;
>  
> -		map_size = best_map_size(start, end - start);
>  		for (pa = start; pa < end; pa += map_size) {
>  			va = (uintptr_t)__va(pa);
> +			map_size = best_map_size(pa, end - pa);
>  
>  			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
>  					   pgprot_from_va(va));
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
