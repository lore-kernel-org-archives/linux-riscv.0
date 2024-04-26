Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF27C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 05:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgH1t3bl8JLh3fmdEXlWLS0NVIKYlb/xtPy1iGDnbIk=; b=14i8t6mCkO9g0I
	t0CqonUlK9XZEa1InZ7hHuKE2aTeSKkO+ajTk10zbKZDBDw3hlrvPy6NICo3+e+9Foqz5ttv8brAp
	EidRyhKxKcPIlUr9Iw17FjL06oeVvoc9S8YREp3vmXHTBOSNOrlQcWu0Lxxy9phzXXphgImiltt52
	MVW6nDeQvkJqUv5gxpu84+o8mn6PHSvLpwQ+XZ1R0fmFr0wbxmMg5B5wQf8cBIfCGnbadM7kdoG/G
	wtEdvjmOuKmMyf5jVJ7Lky+AueeAb+kEwmrU4GAHFLPTsE80IASHsKOa4+9vqxaNdLRziwMGYCbRH
	EnHVrh6r7vYv0zXFcNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0EEu-0000000BBVv-3oUT;
	Fri, 26 Apr 2024 05:35:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0EEr-0000000BBVD-3Ew5
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 05:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 270F1CE1BC1;
	Fri, 26 Apr 2024 05:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F1DC113CD;
	Fri, 26 Apr 2024 05:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714109709;
	bh=1WCFz9g7vTUTNKQ3TiTEs820xuQE/CC/C1Y28k+/o60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9U1FN/20RXfKopPasfFAShCCrhI3NZlsOg+C2eP02+0f+PVfhCFII+xKjnSQlGiA
	 WDtJWv9d9PJoPXD6bMntp9AlPegnDBvKFHnValE1Slnn1GwGwkCbfyChnxSq4pf8IS
	 IlIGbt3gh+bI7cmVaw6gZ10KEhToTg0YZ2qcGa/9+EU2l5v52L6oalNAdhS0TSe6u/
	 0Kk7MZA1SmDJrP5HU7QISnArPbpTRD6P3/7KuAUDPEm/TRiSA0Ufnoe5QEptNkmw1X
	 3g5D8qANo93l/o0OFPibSM8NgVzIy9w9G2/ZcjTfejylb25AXON8HJnIb593qoAXRt
	 jM7RBaqkgkRqw==
Date: Fri, 26 Apr 2024 08:33:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: fix overlap of allocated page and PTR_ERR
Message-ID: <Zis8u5qiewKqNzfs@kernel.org>
References: <20240425115201.3044202-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240425115201.3044202-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_223514_197330_2C730E10 
X-CRM114-Status: GOOD (  27.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2024 at 01:52:01PM +0200, Nam Cao wrote:
> On riscv32, it is possible for the last page in virtual address space
> (0xfffff000) to be allocated. This page overlaps with PTR_ERR, so that
> shouldn't happen.
> =

> There is already some code to ensure memblock won't allocate the last pag=
e.
> However, buddy allocator is left unchecked.
> =

> Fix this by reserving physical memory that would be mapped at virtual
> addresses greater than 0xfffff000.
> =

> Reported-by: Bj=F6rn T=F6pel <bjorn@kernel.org>
> Closes: https://lore.kernel.org/linux-riscv/878r1ibpdn.fsf@all.your.base.=
are.belong.to.us
> Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: <stable@vger.kernel.org>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/riscv/mm/init.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> =

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 968761843203..7c985435b3fc 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -235,18 +235,19 @@ static void __init setup_bootmem(void)
>  		kernel_map.va_pa_offset =3D PAGE_OFFSET - phys_ram_base;
>  =

>  	/*
> -	 * memblock allocator is not aware of the fact that last 4K bytes of
> -	 * the addressable memory can not be mapped because of IS_ERR_VALUE
> -	 * macro. Make sure that last 4k bytes are not usable by memblock
> -	 * if end of dram is equal to maximum addressable memory.  For 64-bit
> -	 * kernel, this problem can't happen here as the end of the virtual
> -	 * address space is occupied by the kernel mapping then this check must
> -	 * be done as soon as the kernel mapping base address is determined.
> +	 * Reserve physical address space that would be mapped to virtual
> +	 * addresses greater than (void *)(-PAGE_SIZE) because:
> +	 *  - This memory would overlap with ERR_PTR
> +	 *  - This memory belongs to high memory, which is not supported
> +	 *
> +	 * This is not applicable to 64-bit kernel, because virtual addresses
> +	 * after (void *)(-PAGE_SIZE) are not linearly mapped: they are
> +	 * occupied by kernel mapping. Also it is unrealistic for high memory
> +	 * to exist on 64-bit platforms.
>  	 */
>  	if (!IS_ENABLED(CONFIG_64BIT)) {
> -		max_mapped_addr =3D __pa(~(ulong)0);
> -		if (max_mapped_addr =3D=3D (phys_ram_end - 1))
> -			memblock_set_current_limit(max_mapped_addr - 4096);
> +		max_mapped_addr =3D __va_to_pa_nodebug(-PAGE_SIZE);
> +		memblock_reserve(max_mapped_addr, (phys_addr_t)-max_mapped_addr);
>  	}
>  =

>  	min_low_pfn =3D PFN_UP(phys_ram_base);
> -- =

> 2.39.2
> =


-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
