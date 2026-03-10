Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51D2EB1041
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Z92cz9qSCrKHshBgkyKt9E/CXVyO0c7BidHHcXLPAw=; b=f8bZCD9VVt8hQT
	ZQI8rfdG9UcHmKNG/woqHUH8l2JOIIgR4X0K4+uxjqtjgUXJj1aVjctrJIRD1StIeoyJ4dQVScoRt
	chXbVDYvh/46V8VV49PZT1sESA9nHPsWaoJ4CaWTlExzRy+q3kSsgFBnBVOxTpVw7cb+6NNZeFADq
	ebGI4S06hd6UPBkm8FkBi988c5pknH+bIkdwvohnBzHYtxa9QZOUE1fHWVBdUGgzugDTHlBloP/KL
	n0Q64mfcBHNM67VRc6zgj516o/KL51ACU9c7rdL+KRKwGaB/Ju5N7/diLZgsbYd1BiqHKD1hyZd3v
	bPl4SLHsDdqOYfVfu4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzu8e-00000009Au6-0tBp;
	Tue, 10 Mar 2026 10:16:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzu8c-00000009AtX-315a
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 10:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB8EA60054;
	Tue, 10 Mar 2026 10:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2309EC19423;
	Tue, 10 Mar 2026 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773137789;
	bh=UxcGXdDlPYAQeJJ+SPPyEPeVgjFOrndX+2mVDREjEq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3cWzl8l6zZd2+YMQ/BWEZw4vD7jHUP9sP9tOZuE9iRHk9eSifXnZGOFrfwttp0E2
	 SBRBSBzDO/AVXfGxVjf4irrAIgn51ovnZz/rzu3g6QpkhuSvZoQc2rr4M/kzqu4Up/
	 7CaKSeup4M/loo3PY+93EPhcAccXSlzZ0QcU2WVOdk3XN0lEvdMPnT9FKCwTb9JewB
	 7JMcNYL+Xt+ipXpHk39jCY/0TEyr+V+Z8zm5tDzhh4Il4C7y7ps0WNM1MTfUXOv7+l
	 /TnY3hxrXcpeO9SAem7ezIBiyyGzPG8Xw1/Wd344DokS7j+5OSFoVW4I0U2W3QKYc/
	 g1BZXgW2BZuOQ==
Date: Tue, 10 Mar 2026 12:16:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH] riscv: patch: Avoid early page_to_phys()
Message-ID: <aa_vds3WhAK1FHW5@kernel.org>
References: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
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

On Tue, Mar 10, 2026 at 04:25:33PM +0800, Vivian Wang wrote:
> Similarly to commit 8d09e2d569f6 ("arm64: patching: avoid early
> page_to_phys()"), avoid using phys_to_page() for the kernel address case
> in patch_map().
> =

> Since this is called from apply_boot_alternatives() in setup_arch(), and
> commit 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE
> memory model") has moved sparse_init() to after setup_arch(),
> phys_to_page() is not available there yet, and it panics on boot with
> SPARSEMEM on RV32, which does not use SPARSEMEM_VMEMMAP.
> =

> Reported-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> Closes: https://lore.kernel.org/r/20260223144108-dcace0b9-02e8-4b67-a7ce-=
f263bed36f26@linutronix.de/
> Fixes: 4267739cabb8 ("arch, mm: consolidate initialization of SPARSE memo=
ry model")
> Suggested-by: Mike Rapoport <rppt@kernel.org>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> checkpatch.pl complains about the BUG_ON which was already there
> ---
>  arch/riscv/kernel/patch.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> =

> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index db13c9ddf9e3..16b243376f36 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -42,19 +42,20 @@ static inline bool is_kernel_exittext(uintptr_t addr)
>  static __always_inline void *patch_map(void *addr, const unsigned int fi=
xmap)
>  {
>  	uintptr_t uintaddr =3D (uintptr_t) addr;
> -	struct page *page;
> +	phys_addr_t phys;
>  =

> -	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))
> -		page =3D phys_to_page(__pa_symbol(addr));
> -	else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> -		page =3D vmalloc_to_page(addr);
> -	else
> +	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
> +		phys =3D __pa_symbol(addr);
> +	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
> +		struct page *page =3D vmalloc_to_page(addr);
> +
> +		BUG_ON(!page);
> +		phys =3D page_to_phys(page) + offset_in_page(addr);
> +	} else {
>  		return addr;
> +	}
>  =

> -	BUG_ON(!page);
> -
> -	return (void *)set_fixmap_offset(fixmap, page_to_phys(page) +
> -					 offset_in_page(addr));
> +	return (void *)set_fixmap_offset(fixmap, phys);
>  }
>  =

>  static void patch_unmap(int fixmap)
> =

> ---
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> change-id: 20260310-riscv-sparsemem-alternatives-fix-f9ea051b1694
> =

> Best regards,
> -- =

> Vivian "dramforever" Wang
> =


-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
