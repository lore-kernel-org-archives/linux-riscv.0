Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16002CD8C9D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 02:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OoaOA0F3X6Pnl8pNPXkm9Faur8WaeSzhcW5G/DWbBg=; b=w2XICXucTPo88B
	6eVhnCzsSip1IiMrRqJNsi10ccElTp4QY1WMNSvdb1RY8bRE8Z1Jd6l1dHiZFLmptIy4A1lr+Rlew
	b8ix7HPxhMfBJxFraw7xLBfc41Mu7VLobHS8Oe4ehuyUsN4q4Upiu7ZOiJV3LnJo5eIr2iyYkGxbp
	Lyl3jiLskuLRGCbm3S3948vwYlgT3rHl4wLUkkj4ozzmOx8DjaeihRc+6x//lwB5deNJL53MN8OKL
	T1+2IDzDmkO0a9c3Zv3+qIcb7lMeLbbdOPj/DjTr9qKgvT6d2skBMvSQfdXmboHMnRdRVDnZwZUp1
	rCxsjDalczlnKNKLaKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWm7q-00000004cue-0NhP;
	Tue, 09 Jun 2026 02:23:34 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWm7n-00000004cuH-0iko
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 02:23:32 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8ccce57762cso52436746d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 19:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780971810; x=1781576610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1sg1EhG9c0ZhlRBhQ86dEr/peU6rOT1SETxtf5KI1s=;
        b=OFAXNFW8/qP8gOpu1Xls+uoPHwtMSpb2H0PHs70qI9LacrmO3yofZEO/MUJlGLjogG
         0iCTylppUntDSAxpXnExpJlEFaTPlwz/2+QC9OskvRRZLhFJzSrmBoSy7N3zeq4oiuup
         q996tdp7+7NgdsCLeweWnjugu6E4kfKtn0iCT5jI0QNk+la5/YOLY7TeSUCyJ+guNUCw
         KaeKUQ1za2LnRtQm3RaZM5/StHM5FhrNTxE14tQ8eXBrndJ+f8j88aX+I0Z5v2/GH7cX
         z1raPWt1OUbvi5F1Ola35fNwmvUD0Atq9zITYX+4bqFF1M8tSbVAR9XucD7R7SFDB3Qw
         dXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780971810; x=1781576610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1sg1EhG9c0ZhlRBhQ86dEr/peU6rOT1SETxtf5KI1s=;
        b=kkebPSWLs22+rNbdaP6rn/uXnzgXUt0oh07AbJMDQcQSM3ViVr92dpT42RtXyHAycM
         IIdCG6H/6Ys531SjL9/FFZ2tHuIFSwOK7yZYDn9FUhU5rArM6FCloWcobKJM+WxUgNwp
         7kNiI6wcxzbb0jZDxPyzRCxAPa3qqrvi74wPu1rJveeabhGwrrDEYCHKeTrHZNdklj78
         2y+PJ4VgahqPEFFNEb7+EQUT2KCJaWL6u8LJicc0Rx1DdIRSj7LfpjEhgym7e33HPyhV
         zWe79BZ1UzSi1YHuEucZgSyiLMht5XovDnd39DhGzanO5zYTrlLDeRaIkiE+gaglQ7Pr
         Zaug==
X-Forwarded-Encrypted: i=1; AFNElJ9DiwBTPhtAQMTuS0RlnXde3JHwyht6B+ANp0uz5bAazvMLVxV/RQYb7ePw/ULD8pZ9ORSF60g437ZTQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmQ/wFEES4FmBfQoxECgAlNPRk9ZnhD/TE+sKudXZQooDhizen
	nTWrQbIRYM4/AxF9hJaQY55M656iu5htO9jXnN38xTzf3197aeQO8+onpbeQXgRNjZ6eGBn8GfX
	gSBYA
X-Gm-Gg: Acq92OGw8NcCNWY5ODQ8LS8aZTDzIF34vfyreLXGfT7ZfGmTvvpbDArdR61jhuC8jtk
	CydMNROYzwsFo4Uza6J6GFz3mVbScStZKs7FOPbEFY/pQPmVJ6WVpXJHNtwqc/d1KMbB4Bk6C+Y
	9BqUQ8+KGfYU/+IJAs0/TfUNpXX53ASJ7tWmJpcfEPkvuqhZgjWD9AL01b38Gsq+vQAH7xGJPGn
	r/9PY19mNDkxCmrXld6uRajw9cMAPZrqu/FtxvpWqZAyHYpYJupNGtOHNiPjZUzBvIzIAavknPZ
	n7UOa4Qk5dX655fyXLrnw5KoKxPFAm/vYh5lgaGrX2f4H6PyutBKeEp8Mi0hoASBx40RPDH+xcg
	ab3VS+dqi1SpPeEMiIzOpE71IrbR5prKkPzdOr9Rr7e+5kRr3Ol/ccFH3kwJGEDSxXI9drUMNds
	fArOvAbgMPHaZ1QXubPTe5/Kbqf+WyVsD1VolKEg6oYJ/MMH7uriowdeGphAajLA==
X-Received: by 2002:a05:6214:1c0b:b0:8ba:2c02:f9d6 with SMTP id 6a1803df08f44-8cee625c052mr320889586d6.35.1780971809622;
        Mon, 08 Jun 2026 19:23:29 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd263003sm188126846d6.42.2026.06.08.19.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 19:23:29 -0700 (PDT)
Date: Tue, 9 Jun 2026 02:23:28 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Smirnov <andrey.smirnov@siderolabs.com>, 
	pasha.tatashin@soleen.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, syzbot+2b5fe617654be3d8848b@syzkaller.appspotmail.com, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Andrei Vagin <avagin@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_table_check: do not track special (PFN-mapped)
 PTEs
Message-ID: <aid4yw9WRvZEm2BV@plex>
References: <20260608155758.1220420-1-andrey.smirnov@siderolabs.com>
 <20260608142258.5028187b1d245b46554eb2dc@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608142258.5028187b1d245b46554eb2dc@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_192331_250826_E95228FF 
X-CRM114-Status: GOOD (  32.06  )
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

On 06-08 14:22, Andrew Morton wrote:
> On Mon,  8 Jun 2026 19:57:58 +0400 Andrey Smirnov <andrey.smirnov@siderolabs.com> wrote:
> 
> > The vDSO data store ("[vvar]") special mapping is created as a VM_PFNMAP
> > mapping and its pages are installed into userspace with vmf_insert_pfn(),
> > which produces special PTEs (pte_special()). On x86 and arm64 (and riscv)
> > pte_user_accessible_page() only tests the PRESENT/USER bits and does not
> > exclude special PTEs, so page_table_check accounts these PFN mappings in
> > the per-page anon/file map counters even though they are not rmap-managed
> > pages (vm_normal_page() returns NULL for them).
> > 
> > Most of these data pages live in the kernel image and are never freed, so
> > the stray accounting is invisible. The time-namespace VVAR page is the
> > exception: it is a real alloc_page() page that is released with
> > __free_page() in free_time_ns() when the last task of a time namespace
> > exits. Across the map / unmap / vdso_join_timens() zap transitions the
> > special-PTE accounting is not balanced for this page, so a non-zero
> > file_map_count survives to the free path and trips:
> > 
> >   kernel BUG at mm/page_table_check.c:143!
> >   __page_table_check_zero+0xfb/0x130
> >   __free_frozen_pages+0x52f/0x650
> >   free_time_ns+0x85/0xc0
> >   free_nsproxy+0x7f/0x130
> >   do_exit+0x313/0xa60
> >   do_group_exit+0x77/0x90
> > 
> > This is reliably reproducible on x86_64 and arm64 under heavy container/CI
> > churn that rapidly creates and destroys time namespaces (CLONE_NEWTIME via
> > runc / docker-init / tini), and was independently reported by syzbot on
> > riscv. It only manifests when CONFIG_PAGE_TABLE_CHECK is active.
> > 
> > Special PTEs have no struct-page rmap semantics and must never have been
> > tracked by page table check. Skip them in both the set and clear paths so
> > the counters stay balanced (always zero) for PFN-mapped pages, regardless
> > of how the architecture defines pte_user_accessible_page(). pte_special()
> > is available generically (it is a no-op returning false on architectures
> > without ARCH_HAS_PTE_SPECIAL), so this is a single, arch-independent fix.
> > 
> > Note that the v7.0 generic vDSO datastore rework in commit 05988dba1179
> > ("vdso/datastore: Allocate data pages dynamically") incidentally avoids
> > the problem by switching the mapping to VM_MIXEDMAP + vmf_insert_page()
> > with balanced struct-page accounting. This patch fixes the still-affected
> > VM_PFNMAP path used by 6.18.y and earlier, and additionally makes
> > page_table_check robust against any future PFN-mapped user pages.

Thank you for detailed explanation of the bug, and it makes sense to me.

> Thanks.
> 
> The patch isn't applicable to current -linus mainline.  I reworked it
> as below, then deleted it.  It would be better if this rework came from
> yourself (tested), please.  And a patch which applies will get checked
> by Sashiko AI review.

+1.

Pasha

> --- a/mm/page_table_check.c~mm-page_table_check-do-not-track-special-pfn-mapped-ptes
> +++ a/mm/page_table_check.c
> @@ -151,7 +151,15 @@ void __page_table_check_pte_clear(struct
>  	if (&init_mm == mm)
>  		return;
>  
> -	if (pte_user_accessible_page(mm, addr, pte))
> +	/*
> +	 * PFN-mapped (special) PTEs - e.g. the vDSO/time-namespace "[vvar]"
> +	 * mapping installed via vmf_insert_pfn() - are not rmap-managed and
> +	 * must not be tracked here. Tracking them can leave a non-zero map
> +	 * count on a struct page that is later freed (the time namespace VVAR
> +	 * page in free_time_ns()), tripping the BUG_ON() in
> +	 * __page_table_check_zero().
> +	 */
> +	if (pte_user_accessible_page(mm, addr, pte) && !pte_special(pte))
>  		page_table_check_clear(pte_pfn(pte), PAGE_SIZE >> PAGE_SHIFT);
>  }
>  EXPORT_SYMBOL(__page_table_check_pte_clear);
> @@ -208,7 +216,7 @@ void __page_table_check_ptes_set(struct
>  
>  	for (i = 0; i < nr; i++)
>  		__page_table_check_pte_clear(mm, addr + PAGE_SIZE * i, ptep_get(ptep + i));
> -	if (pte_user_accessible_page(mm, addr, pte))
> +	if (pte_user_accessible_page(mm, addr, pte) && !pte_special(pte))
>  		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
>  }
>  EXPORT_SYMBOL(__page_table_check_ptes_set);
> _
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
