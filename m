Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660B1CD98CE
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGL/upfSbqCxawtruKb6lGuoI0hV/laD9ECTFw+Ng/o=; b=OF/CdWx5RLE7RL
	AiyZfB2aJUJsxmdYa4S7Luex51ZgMwah0cHc0xY4BOPN0eAyKsH4CX2X3NuSDLbhYvXYNCMVwbSSd
	AA+nOvf3quwo72MZJljertzNjB0uyGAY/xRQiArscABU1KrMzYr0rnr9nZZNn2MRPZRhYCul0r/b4
	eOUwdR90pCPev5QcocScD/71WeFGvUEQNWW1q4bNRE4mZyr1kle33ZUAov9qS8urmM9K/waXdF9T4
	9c93giVSg8AmMAe0flDzj73MBatZwTzo9NfPCwEtP4tzjGcwFV09jmfhmTxF4CZmSkxtXwaZwGaJy
	eaEE3gj1R0A7NodjAYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2og-0000000B3aT-0I55;
	Fri, 12 Jun 2026 14:25:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2oc-0000000B3Zn-3iGX
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 14:25:00 +0000
Date: Fri, 12 Jun 2026 16:24:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781274291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwVtWQfu240VJ6rqsKtn7HxHk2R31SZbP2CkXTGyVBw=;
	b=yN++Ar4UPeFVObgPptrM588vgWIw15P7N4oXqSzIGyFQOf7x7CuItiHn6bBlXUdRbH+axN
	cxeXNn9myH56N2/BOTWRv5I7U8xz2ahAuqxtOjs44Y3LN3KzmtViijfT3xmoFWC3fYywgC
	kdA5dD3bEqw8r/tQcN3waQH5d3f78ixh5AeNCpzcyxsKx5QLrYM81+yA6PadxpruigX+2y
	yMHPec+j0IT3CFCARpo6yNoAGFxdEHrOCyXSCcbTlK8229Y/u0vIU868LvZkG1isqj5X/s
	shtQSjoIxeiw44nTiY3N4xwJaXBVysKjTYpH81IBW6iV1cOjhGLr9CIDNM9lEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781274291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwVtWQfu240VJ6rqsKtn7HxHk2R31SZbP2CkXTGyVBw=;
	b=Fw/CS40Emarj/k0CM4lLjf3k6omNTZJE0zu0chda+lYYSWq7q5sblGyvvDa0yVi5lfqMRN
	8BnlkiroEJEQ0CAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Andrey Smirnov <andrey.smirnov@siderolabs.com>
Cc: pasha.tatashin@soleen.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	syzbot+2b5fe617654be3d8848b@syzkaller.appspotmail.com, Thomas Gleixner <tglx@linutronix.de>, 
	Andrei Vagin <avagin@gmail.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_table_check: do not track special (PFN-mapped)
 PTEs
Message-ID: <20260612162031-b4731d21-b293-4d36-8582-26394bd55a1f@linutronix.de>
References: <20260608155758.1220420-1-andrey.smirnov@siderolabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608155758.1220420-1-andrey.smirnov@siderolabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_072459_087994_1EC64302 
X-CRM114-Status: GOOD (  30.42  )
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

On Mon, Jun 08, 2026 at 07:57:58PM +0400, Andrey Smirnov wrote:
> The vDSO data store ("[vvar]") special mapping is created as a VM_PFNMAP
> mapping and its pages are installed into userspace with vmf_insert_pfn(),
> which produces special PTEs (pte_special()). On x86 and arm64 (and riscv)
> pte_user_accessible_page() only tests the PRESENT/USER bits and does not
> exclude special PTEs, so page_table_check accounts these PFN mappings in
> the per-page anon/file map counters even though they are not rmap-managed
> pages (vm_normal_page() returns NULL for them).
> =

> Most of these data pages live in the kernel image and are never freed, so
> the stray accounting is invisible. The time-namespace VVAR page is the
> exception: it is a real alloc_page() page that is released with
> __free_page() in free_time_ns() when the last task of a time namespace
> exits. Across the map / unmap / vdso_join_timens() zap transitions the
> special-PTE accounting is not balanced for this page, so a non-zero
> file_map_count survives to the free path and trips:
> =

>   kernel BUG at mm/page_table_check.c:143!
>   __page_table_check_zero+0xfb/0x130
>   __free_frozen_pages+0x52f/0x650
>   free_time_ns+0x85/0xc0
>   free_nsproxy+0x7f/0x130
>   do_exit+0x313/0xa60
>   do_group_exit+0x77/0x90
> =

> This is reliably reproducible on x86_64 and arm64 under heavy container/CI
> churn that rapidly creates and destroys time namespaces (CLONE_NEWTIME via
> runc / docker-init / tini), and was independently reported by syzbot on
> riscv. It only manifests when CONFIG_PAGE_TABLE_CHECK is active.
> =

> Special PTEs have no struct-page rmap semantics and must never have been
> tracked by page table check. Skip them in both the set and clear paths so
> the counters stay balanced (always zero) for PFN-mapped pages, regardless
> of how the architecture defines pte_user_accessible_page(). pte_special()
> is available generically (it is a no-op returning false on architectures
> without ARCH_HAS_PTE_SPECIAL), so this is a single, arch-independent fix.
> =

> Note that the v7.0 generic vDSO datastore rework in commit 05988dba1179
> ("vdso/datastore: Allocate data pages dynamically") incidentally avoids
> the problem by switching the mapping to VM_MIXEDMAP + vmf_insert_page()
> with balanced struct-page accounting. This patch fixes the still-affected
> VM_PFNMAP path used by 6.18.y and earlier, and additionally makes
> page_table_check robust against any future PFN-mapped user pages.
> =

> Fixes: df4e817b7108 ("mm: page table check")
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> Cc: Andrei Vagin <avagin@gmail.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Reported-by: syzbot+2b5fe617654be3d8848b@syzkaller.appspotmail.com
> Closes: https://github.com/siderolabs/talos/issues/13496
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrey.smirnov@siderolabs.com>
> ---
>  mm/page_table_check.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> =

> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 4eeca782b888..ee492d5389b9 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -150,9 +150,16 @@ void __page_table_check_pte_clear(struct mm_struct *=
mm, pte_t pte)
>  	if (&init_mm =3D=3D mm)
>  		return;
>  =

> -	if (pte_user_accessible_page(pte)) {
> +	/*
> +	 * PFN-mapped (special) PTEs - e.g. the vDSO/time-namespace "[vvar]"
> +	 * mapping installed via vmf_insert_pfn() - are not rmap-managed and
> +	 * must not be tracked here. Tracking them can leave a non-zero map
> +	 * count on a struct page that is later freed (the time namespace VVAR
> +	 * page in free_time_ns()), tripping the BUG_ON() in
> +	 * __page_table_check_zero().

As this comment mentioning the [vvar] pages is already stale, IMO this shou=
ld
not be mentioned specifically. It is also not clear to me why this only hap=
pens
now and where the non-zero map count comes from.

> +	 */
> +	if (pte_user_accessible_page(pte) && !pte_special(pte))
>  		page_table_check_clear(pte_pfn(pte), PAGE_SIZE >> PAGE_SHIFT);
> -	}
>  }
>  EXPORT_SYMBOL(__page_table_check_pte_clear);
>  =

> @@ -205,7 +212,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm=
, pte_t *ptep, pte_t pte,
>  =

>  	for (i =3D 0; i < nr; i++)
>  		__page_table_check_pte_clear(mm, ptep_get(ptep + i));
> -	if (pte_user_accessible_page(pte))
> +	if (pte_user_accessible_page(pte) && !pte_special(pte))
>  		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
>  }
>  EXPORT_SYMBOL(__page_table_check_ptes_set);
> -- =

> 2.53.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
