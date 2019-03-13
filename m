Return-Path: <SRS0=5v1j=RQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7591CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 18:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482B22075C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 18:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i61fXTRI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482B22075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NP+h1Ad40s9VL1vpZ8yV3AhjZsi6mUzMZ27Pj9vOrT4=; b=i61fXTRIFBT+GK
	8zeHnxno0Ul7tmrfj5RV8Chz/Xyw1/vIUBFCtxMDgQ1KEvG2B9GADfAeW9EBSK28tqUWHN49NuTlZ
	SM47yFiyF+GlFl3eHWKPQa5pEcAFTxcW7ztybR1E5r6gCWFKeFshXpprUapY8vMcr6ORkTA3MiuwX
	vrxCZaFOZNH4mhP4Wy43Ia5/Kt18jtI0AWeZviJtVZJu32grs4Xu79rIA2S2oEzGQGxV9P7UQ4DjC
	kKFxQFW2fy7NtykBUZd0muY5fyVM5WHjTl3sxnzp77dSdFs6t+xvEY47IEcIFwjvHvIeV9j+dqpRI
	aDsE+CGKsWl3cOAQMlWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h48PY-0002Hq-No; Wed, 13 Mar 2019 18:15:28 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h48PV-0002Gd-MR
 for linux-riscv@lists.infradead.org; Wed, 13 Mar 2019 18:15:27 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2DICAMQ029130
 for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2019 14:15:13 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r76swgjsu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2019 14:15:13 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Wed, 13 Mar 2019 18:15:10 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Mar 2019 18:15:07 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2DIF6BJ32964702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Mar 2019 18:15:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37567A405B;
 Wed, 13 Mar 2019 18:15:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1330AA405F;
 Wed, 13 Mar 2019 18:15:05 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.204.233])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 13 Mar 2019 18:15:04 +0000 (GMT)
Date: Wed, 13 Mar 2019 20:15:03 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH 2/3] RISC-V: Make setup_vm() independent of GCC code model
References: <20190312220752.128141-1-anup.patel@wdc.com>
 <20190312220752.128141-3-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190312220752.128141-3-anup.patel@wdc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19031318-0028-0000-0000-000003539FC8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031318-0029-0000-0000-000024122936
Message-Id: <20190313181502.GA28630@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-13_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903130126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_111525_845130_0F359151 
X-CRM114-Status: GOOD (  31.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12, 2019 at 10:08:16PM +0000, Anup Patel wrote:
> The setup_vm() must access kernel symbols in a position independent way
> because it will be called from head.S with MMU off.
> 
> If we compile kernel with cmodel=medany then PC-relative addressing will
> be used in setup_vm() to access kernel symbols so it works perfectly fine.
> 
> Although, if we compile kernel with cmodel=medlow then either absolute
> addressing or PC-relative addressing (based on whichever requires fewer
> instructions) is used to access kernel symbols in setup_vm(). This can
> break setup_vm() whenever any absolute addressing is used to access
> kernel symbols.
> 
> With the movement of setup_vm() from kernel/setup.c to mm/init.c, the
> setup_vm() is now broken for cmodel=medlow but it works perfectly fine
> for cmodel=medany.
> 
> This patch fixes setup_vm() and makes it independent of GCC code model
> by accessing kernel symbols relative to kernel load address instead of
> assuming PC-relative addressing.
> 
> Fixes: 6f1e9e946f0b ("RISC-V: Move setup_vm() to mm/init.c")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/head.S |  1 +
>  arch/riscv/mm/init.c     | 71 ++++++++++++++++++++++++++--------------
>  2 files changed, 47 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fe884cd69abd..7966262b4f9d 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -62,6 +62,7 @@ clear_bss_done:
>  
>  	/* Initialize page tables and relocate to virtual addresses */
>  	la sp, init_thread_union + THREAD_SIZE
> +	la a0, _start
>  	call setup_vm
>  	call relocate
>  
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b379a75ac6a6..f35299f2f3d5 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -172,55 +172,76 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>  	}
>  }
>  
> -asmlinkage void __init setup_vm(void)
> +static inline void *__early_va(void *ptr, uintptr_t load_pa)
>  {
>  	extern char _start;
> +	uintptr_t va = (uintptr_t)ptr;
> +	uintptr_t sz = (uintptr_t)(&_end) - (uintptr_t)(&_start);
> +
> +	if (va >= PAGE_OFFSET && va < (PAGE_OFFSET + sz))
> +		return (void *)(load_pa + (va - PAGE_OFFSET));

This is (void *)__pa(va), isn't it?

> +	return (void *)va;

The below usage suggests that __early_va() should be used solely for
addresses inside the kernel. What will happen if the accesses is outside
that range? Isn't it a BUG()?

> +}
> +
> +asmlinkage void __init setup_vm(uintptr_t load_pa)
> +{
>  	uintptr_t i;
> -	uintptr_t pa = (uintptr_t) &_start;
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	pmd_t *pmdp;
> +#endif
> +	pgd_t *pgdp;
> +	phys_addr_t map_pa;
> +	pgprot_t tableprot = __pgprot(_PAGE_TABLE);
>  	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
>  
> -	va_pa_offset = PAGE_OFFSET - pa;
> -	pfn_base = PFN_DOWN(pa);
> +	va_pa_offset = PAGE_OFFSET - load_pa;
> +	pfn_base = PFN_DOWN(load_pa);
>  
>  	/* Sanity check alignment and size */
>  	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
> -	BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
> +	BUG_ON((load_pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> -	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> -		pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
> -			__pgprot(_PAGE_TABLE));
> -	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
> +	pgdp = __early_va(trampoline_pg_dir, load_pa);
> +	map_pa = (uintptr_t)__early_va(trampoline_pmd, load_pa);

This reads a bit strange: pa = va()
BTW, I think you could keep the pa local variable instead of introducing
map_pa.

> +	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> +		pfn_pgd(PFN_DOWN(map_pa), tableprot);
> +	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(load_pa), prot);
> +
> +	pgdp = __early_va(swapper_pg_dir, load_pa);
>  
>  	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
>  		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
>  
> -		swapper_pg_dir[o] =
> -			pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
> -				__pgprot(_PAGE_TABLE));
> +		map_pa = (uintptr_t)__early_va(swapper_pmd, load_pa);
> +		pgdp[o] = pfn_pgd(PFN_DOWN(map_pa) + i, tableprot);
>  	}
> +	pmdp = __early_va(swapper_pmd, load_pa);
>  	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
> -		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
> +		pmdp[i] = pfn_pmd(PFN_DOWN(load_pa + i * PMD_SIZE), prot);
>  
> -	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> -		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
> -				__pgprot(_PAGE_TABLE));
> +	map_pa = (uintptr_t)__early_va(fixmap_pmd, load_pa);
> +	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> +		pfn_pgd(PFN_DOWN(map_pa), tableprot);
> +	pmdp = __early_va(fixmap_pmd, load_pa);
> +	map_pa = (uintptr_t)__early_va(fixmap_pte, load_pa);
>  	fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
> -		pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
> -				__pgprot(_PAGE_TABLE));
> +		pfn_pmd(PFN_DOWN(map_pa), tableprot);
>  #else
> -	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> -		pfn_pgd(PFN_DOWN(pa), prot);
> +	pgdp = __early_va(trampoline_pg_dir, load_pa);
> +	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> +		pfn_pgd(PFN_DOWN(load_pa), prot);
> +
> +	pgdp = __early_va(swapper_pg_dir, load_pa);
>  
>  	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
>  		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
>  
> -		swapper_pg_dir[o] =
> -			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
> +		pgdp[o] = pfn_pgd(PFN_DOWN(load_pa + i * PGDIR_SIZE), prot);
>  	}
>  
> -	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> -		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
> -				__pgprot(_PAGE_TABLE));
> +	map_pa = (uintptr_t)__early_va(fixmap_pte, load_pa);
> +	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> +		pfn_pgd(PFN_DOWN(map_pa), tableprot);
>  #endif
>  }
> -- 
> 2.17.1
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
