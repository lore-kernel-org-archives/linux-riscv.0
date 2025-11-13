Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F67CD4F28
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WtRprxWd8K6QouWBWZat7PbOX+MovnE4V2i+DpFaeN8=; b=iBAqQAjaTf7cyz
	Na1KXgbzR7Blaj1Bj6OAtT8s1Gj4Y6WDYawmZtlUncIe0YPT9mVgm9Tedh7W9cHRqe3mDXxuf7YsQ
	2RMkhz/rIBdCXbFWBoqil3sklsdVa7zY4vUkRrlFhiUZ6y0X4hTTvXHAlqFYOfp2V8k5sO/Etle89
	wQglY9gSNlXDQmQMa9sUWIWpfJ7fh93i3Lp2TaqTPba6mUba5JRBBuFnotdMdIbOpTQPxI5ZICuUe
	NvQ7LhFnB8XZCID8JCQSyVTKNx9k6zGHGVe3KeNjWuSAxIi4FSOJlk7Bb7c65hbIxSTuhpZD0v8/g
	Jwcsk8RqfaMtBuIm2tgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJRdN-00000009zPJ-03D7;
	Thu, 13 Nov 2025 07:20:45 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJRdL-00000009zOn-1TLc
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 07:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763018444; x=1794554444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Me6GWqOMV1Te3Vqndd4JPy4GgWbf+TWVFwtSqdGhwE=;
  b=AK3kCalM8Evdol0ClFC3V5w5LFNgJfsIwVJG8hBILuq+T8f0rt84Oxec
   D/c8NuUu5beMMUHw/M9QQfNuggbBvvXI8ynpaxXsI/fg/XYRNdVuGvpLe
   Uy7ejBrL2blvSeNmPyRWSGjA7K00Jw17VjIQvnfxJ9j9K01gA2x34qn7Z
   vMXvUCuscWW8cB8dR7IqlLvOzVuuRQwNjTVnJ1vuTPX1Whkh+KVjTlSe6
   xFpK/FxkgE6y0yhnMWAdTbiNalTxw2c+D4BnBbHTKJbUwMaE7svFketH1
   47UfGLGeLNrkza9SBqpmoxloMobA7FoFs7ftkhQIXSRc0+Mgi+5hylEx+
   g==;
X-CSE-ConnectionGUID: BKkaVE0rT7KJ9rpNtMWHrg==
X-CSE-MsgGUID: hXAnjkv5QhuXhEwx9/8BCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65018351"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65018351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 23:20:40 -0800
X-CSE-ConnectionGUID: Gj2hNzySSG+P7YfpZN0+0w==
X-CSE-MsgGUID: Rg/fE/d9SqiQUCtfAuTUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189614267"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2025 23:20:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJRdB-00051L-19;
	Thu, 13 Nov 2025 07:20:33 +0000
Date: Thu, 13 Nov 2025 15:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 08/22] mm: Allow page table accessors to be
 non-idempotent
Message-ID: <202511131448.ZCsuBlBE-lkp@intel.com>
References: <20251113014656.2605447-9-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251113014656.2605447-9-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_232043_431075_35CA93C7 
X-CRM114-Status: GOOD (  15.55  )
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

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24172e0d79900908cf5ebf366600616d29c9b417]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/mm-ptdump-replace-READ_ONCE-with-standard-page-table-accessors/20251113-095117
base:   24172e0d79900908cf5ebf366600616d29c9b417
patch link:    https://lore.kernel.org/r/20251113014656.2605447-9-samuel.holland%40sifive.com
patch subject: [PATCH v3 08/22] mm: Allow page table accessors to be non-idempotent
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131448.ZCsuBlBE-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131448.ZCsuBlBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131448.ZCsuBlBE-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/gup.c: In function 'gup_fast_pte_range':
>> mm/gup.c:2848:9: error: implicit declaration of function 'set_pmd'; did you mean 'set_p4d'? [-Wimplicit-function-declaration]
    2848 |         set_pmd(&pmd, pmd);
         |         ^~~~~~~
         |         set_p4d
--
   mm/pgtable-generic.c: In function '___pte_offset_map':
>> mm/pgtable-generic.c:303:9: error: implicit declaration of function 'set_pmd'; did you mean 'set_p4d'? [-Wimplicit-function-declaration]
     303 |         set_pmd(&pmdval, pmdval);
         |         ^~~~~~~
         |         set_p4d


vim +2848 mm/gup.c

  2819	
  2820	#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
  2821	/*
  2822	 * GUP-fast relies on pte change detection to avoid concurrent pgtable
  2823	 * operations.
  2824	 *
  2825	 * To pin the page, GUP-fast needs to do below in order:
  2826	 * (1) pin the page (by prefetching pte), then (2) check pte not changed.
  2827	 *
  2828	 * For the rest of pgtable operations where pgtable updates can be racy
  2829	 * with GUP-fast, we need to do (1) clear pte, then (2) check whether page
  2830	 * is pinned.
  2831	 *
  2832	 * Above will work for all pte-level operations, including THP split.
  2833	 *
  2834	 * For THP collapse, it's a bit more complicated because GUP-fast may be
  2835	 * walking a pgtable page that is being freed (pte is still valid but pmd
  2836	 * can be cleared already).  To avoid race in such condition, we need to
  2837	 * also check pmd here to make sure pmd doesn't change (corresponds to
  2838	 * pmdp_collapse_flush() in the THP collapse code path).
  2839	 */
  2840	static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
  2841			unsigned long end, unsigned int flags, struct page **pages,
  2842			int *nr)
  2843	{
  2844		int ret = 0;
  2845		pte_t *ptep, *ptem;
  2846	
  2847		/* transform pmd as if &pmd pointed to a hardware page table */
> 2848		set_pmd(&pmd, pmd);
  2849		ptem = ptep = pte_offset_map(&pmd, addr);
  2850		pmd = pmdp_get(&pmd);
  2851		if (!ptep)
  2852			return 0;
  2853		do {
  2854			pte_t pte = ptep_get_lockless(ptep);
  2855			struct page *page;
  2856			struct folio *folio;
  2857	
  2858			/*
  2859			 * Always fallback to ordinary GUP on PROT_NONE-mapped pages:
  2860			 * pte_access_permitted() better should reject these pages
  2861			 * either way: otherwise, GUP-fast might succeed in
  2862			 * cases where ordinary GUP would fail due to VMA access
  2863			 * permissions.
  2864			 */
  2865			if (pte_protnone(pte))
  2866				goto pte_unmap;
  2867	
  2868			if (!pte_access_permitted(pte, flags & FOLL_WRITE))
  2869				goto pte_unmap;
  2870	
  2871			if (pte_special(pte))
  2872				goto pte_unmap;
  2873	
  2874			/* If it's not marked as special it must have a valid memmap. */
  2875			VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
  2876			page = pte_page(pte);
  2877	
  2878			folio = try_grab_folio_fast(page, 1, flags);
  2879			if (!folio)
  2880				goto pte_unmap;
  2881	
  2882			if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get(pmdp))) ||
  2883			    unlikely(pte_val(pte) != pte_val(ptep_get(ptep)))) {
  2884				gup_put_folio(folio, 1, flags);
  2885				goto pte_unmap;
  2886			}
  2887	
  2888			if (!gup_fast_folio_allowed(folio, flags)) {
  2889				gup_put_folio(folio, 1, flags);
  2890				goto pte_unmap;
  2891			}
  2892	
  2893			if (!pte_write(pte) && gup_must_unshare(NULL, flags, page)) {
  2894				gup_put_folio(folio, 1, flags);
  2895				goto pte_unmap;
  2896			}
  2897	
  2898			/*
  2899			 * We need to make the page accessible if and only if we are
  2900			 * going to access its content (the FOLL_PIN case).  Please
  2901			 * see Documentation/core-api/pin_user_pages.rst for
  2902			 * details.
  2903			 */
  2904			if ((flags & FOLL_PIN) && arch_make_folio_accessible(folio)) {
  2905				gup_put_folio(folio, 1, flags);
  2906				goto pte_unmap;
  2907			}
  2908			folio_set_referenced(folio);
  2909			pages[*nr] = page;
  2910			(*nr)++;
  2911		} while (ptep++, addr += PAGE_SIZE, addr != end);
  2912	
  2913		ret = 1;
  2914	
  2915	pte_unmap:
  2916		pte_unmap(ptem);
  2917		return ret;
  2918	}
  2919	#else
  2920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
