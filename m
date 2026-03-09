Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D597FEF36F6
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAlVgpe5TpwrwRwmcPGvZ4yJUI1M8nH2H/0RvLIvpWc=; b=4LAq77rDxv83Ys
	ZhfUHYoFsSBt317/pSdsfZYspL73ZuQWgtty0ckkGUMPhnMFW3dA/XNMgma1MF01h7GXelg7ucgW1
	TwHUow0QApDdOhXo7T5nWl85MuqWu7jxG30WysxFnkYFQctCs5VueSlaOxmiHxuG4KwezWggVMvQz
	i/+YDjJYCLuVnmEJLHpEeXgkw3AAXXh2mji/oel4xqZTivdnmRawRn9gOzBxu0QljJbFQMhAmP2pe
	wRWLHai8Wjs3zLHPo6ZpTG+ACjR360hDSoL5bf8dAoHc/Xht+gTZQzYNfFggfWmvET4Nr29SuLfZy
	WbldL7pQ0yD6UBL7j0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzV8q-00000006oYx-0i5Y;
	Mon, 09 Mar 2026 07:35:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzV8n-00000006oYH-3Zim
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 07:35:03 +0000
Date: Mon, 9 Mar 2026 08:34:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773041696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erREKkXABbkGYvmxVpdti4swV6Ha5+3/x20eD7gFqSI=;
	b=S82gM2Jx+axPsYux9DiBRFecth8F0F6P8ysrYnlCfbt665ZpbroetIAWoRB+ultVzvox9E
	2A2O+wcDkjsYuXODYk4wdb6QLz23loYpzJMh4tJnltuEC3Qv5OI2Cnf1SYukYX1VjmTsqO
	nV0OtuPZzg9lIxV0VvH/w7H2sZQihooaFoSniWYRPSQJfjLxH6GvwV6ctowvGXzZXGu+Yy
	j7dhtqnclxQniHEC3dboVtkziP9VtKNdinqJavgcYnaGNwbaWR4ouSrMCGDL1u8OuJ6YI/
	A/9Xh7qjs5OGXLUNGOw44da+mPmxp2Fyl2ADfEHkFaUqyc5uhzMbM7zHwdjZsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773041696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erREKkXABbkGYvmxVpdti4swV6Ha5+3/x20eD7gFqSI=;
	b=37sFK1ihP0FLGdk850YWQdPbPoi9LKffiG59KV702LXIQaaljdobZkiJ5LO1vpUlnMsovj
	6K00gNZqnwUXabDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Mike Rapoport <rppt@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org
Subject: [BUG] SPARSEMEM broken on RISC-V; was: [PATCH] arch, mm: consolidate
 initialization of SPARSE memory model
Message-ID: <20260309082841-9c542a85-073d-4d08-8b8e-a56621a13c91@linutronix.de>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-25-rppt@kernel.org>
 <20260223144108-dcace0b9-02e8-4b67-a7ce-f263bed36f26@linutronix.de>
 <aZytSwzGj24lqkLU@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZytSwzGj24lqkLU@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_003502_055894_7C9C587A 
X-CRM114-Status: GOOD (  31.02  )
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

Hi RISC-V maintainers,

SPARSEMEM on RISC-V is currently broken in mainline.
Could you take a look at my report and the suggestions from Mike below?

On Mon, Feb 23, 2026 at 09:40:59PM +0200, Mike Rapoport wrote:
> On Mon, Feb 23, 2026 at 02:52:45PM +0100, Thomas Wei=DFschuh wrote:
> > On Sun, Jan 11, 2026 at 10:20:58AM +0200, Mike Rapoport wrote:
> > > Every architecture calls sparse_init() during setup_arch() although t=
he
> > > data structures created by sparse_init() are not used until the
> > > initialization of the core MM.
> > > =

> > > Beside the code duplication, calling sparse_init() from architecture
> > > specific code causes ordering differences of vmemmap and HVO initiali=
zation
> > > on different architectures.
> > > =

> > > Move the call to sparse_init() from architecture specific code to
> > > free_area_init() to ensure that vmemmap and HVO initialization order =
is
> > > always the same.
> > =

> > This broke the boot on RISC-V 32-bit (rv32_defconfig) for me.
> > =

> > Specifically if sparse_init() is *not* called before the following call=
chain,
> > the kernel dies at that point.
> > =

> > start_kernel()
> >   setup_arch()
> >     apply_boot_alternatives()
> >       _apply_alternatives()
> >         riscv_cpufeature_patch_func()
> >           patch_text_nosync()
> >           riscv_alternative_fix_offsets()
> =

> Hm, most architectures do alternatives patching much later in the boot,
> when much more subsystems (including mm) is already initialized.
> =

> Any particular reason riscv does it that early? =

>  =

> > Simple reproducer, using kunit:
> > =

> > ./tools/testing/kunit/kunit.py run --raw_output=3Dall --make_options LL=
VM=3D1 --arch riscv32 --kconfig_add CONFIG_SPARSEMEM_MANUAL=3Dy --kconfig_a=
dd CONFIG_SPARSEMEM=3Dy
> =

> Looking at patch_map it's quite clear why movement of sparse_init() cased=
 a
> crash:
> =

> 	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))
> 		page =3D phys_to_page(__pa_symbol(addr));
> =

> phys_to_page() with CONFIG_SPARSEMEM=3Dy will try to access memory section
> that are initialized in sparse_init().
> =

> What I don't understand is why patch_map() needs a struct page for kernel
> text patching at all, __pa_symbol() should work just fine.
> And the BUG_ON(!page) is completely bogus for phys_to_page() conversion,
> because that one is pure arithmetics.
> =

> If moving apply_boot_alternatives() is not an option for riscv, something
> like the patch below should fix the issue with access to nonexistent
> memory sections. But I think moving apply_boot_alternatives() later in bo=
ot
> would make things less fragile.
> =

> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index db13c9ddf9e3..89b3c13f2865 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -43,18 +43,19 @@ static __always_inline void *patch_map(void *addr, co=
nst unsigned int fixmap)
>  {
>  	uintptr_t uintaddr =3D (uintptr_t) addr;
>  	struct page *page;
> +	phys_addr_t phys;
>  =

> -	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))
> -		page =3D phys_to_page(__pa_symbol(addr));
> -	else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> +	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
> +		phys =3D __pa_symbol(addr);
> +	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
>  		page =3D vmalloc_to_page(addr);
> -	else
> +		BUG_ON(!page);
> +		phys =3D page_to_phys(page);
> +	} else {
>  		return addr;
> +	}
>  =

> -	BUG_ON(!page);
> -
> -	return (void *)set_fixmap_offset(fixmap, page_to_phys(page) +
> -					 offset_in_page(addr));
> +	return (void *)set_fixmap_offset(fixmap, phys + offset_in_page(addr));
>  }
>  =

>  static void patch_unmap(int fixmap)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
