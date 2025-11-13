Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32991CD4F28
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 05:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLmz0qTL0QA8au8CyI24d2CLCzmUe1uVZCZUDeNb9P4=; b=TydwcMHKsR2+77
	cFj6SYzRR7U9+KIBZJwFWALwIBVouruT/5zV1+R37dJu6h3iZ5T+JxO8+iduOizbGI1GNswJosQNW
	drOw8TOBnNlGpEW+693cKJK3rV1VPSwOS9shplmkZJKAzYvILi6cdyTnX7rmy5uxQzdIcMNCiVSF6
	fGkbOHhj+ymQwhbVMtsAijhqdC+1DK6Tf1xuHcdDtCe6Oeet+BWg5Iaap7oFeuybqcxkotm/HbjcJ
	cHSsfhI/9HiqbL+cux6AAvsE+EhoKT/4NZYb/hSIfvldEEe9pk+FiS8IvEwSqiwokB8TZ/X656BOs
	/IcvtGGE3xpH5X/kaY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJQBD-00000009vq2-33pe;
	Thu, 13 Nov 2025 05:47:35 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJQBB-00000009vpg-0uRR
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 05:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763012853; x=1794548853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tYTHNNf+YGbTSSvqqxsTBUg/KkDpiG6hdbKFlnGdIzE=;
  b=aCWXQC8ZxHIyhqwWwidbQspBEVIEJKFtk0y0i+0TQAMrztx7vedy2eQ1
   6FiS9i1+/IAbRxFjS3UA3DOfK8FTRb3VslK2I8CZ55aTyJpYguZpfKcPQ
   diNZMWNa5/5MLv2cvZjdeRBLSCX0CCUqCsNphYx7xMP6KlH8JRSo36kXm
   ZiGXXj4rriWfKpMFuooM3TIzP3jdso5UMIcfwhGDcXdB9ekE5QH1VoRvs
   vHpEt6fEViGwMkN/4I4pslHvFBcj/xNVMy+YHiCov0qx0dqRCLac6E622
   fMlibTXq7T3E02+Wj0CW/z2tUCNFd334TilraICISOJtQtqGQrFfHowJE
   g==;
X-CSE-ConnectionGUID: Px/dPbavQBGsWaTt4R6G+g==
X-CSE-MsgGUID: wKuDv+d5Rv61YVf6k9i8lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65011340"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65011340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 21:47:30 -0800
X-CSE-ConnectionGUID: LZMRPt/QQRmtXvbcDjngVg==
X-CSE-MsgGUID: uhQmO3RJRcaWuElWg0Lv/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189689750"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2025 21:47:25 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJQB1-0004wl-2L;
	Thu, 13 Nov 2025 05:47:23 +0000
Date: Thu, 13 Nov 2025 13:46:28 +0800
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
	Samuel Holland <samuel.holland@sifive.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
Message-ID: <202511131118.UUi1EVXL-lkp@intel.com>
References: <20251113014656.2605447-7-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251113014656.2605447-7-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_214733_327993_CB87908C 
X-CRM114-Status: GOOD (  11.01  )
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
patch link:    https://lore.kernel.org/r/20251113014656.2605447-7-samuel.holland%40sifive.com
patch subject: [PATCH v3 06/22] mm: Always use page table accessor functions
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131118.UUi1EVXL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131118.UUi1EVXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131118.UUi1EVXL-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'guard_install_set_pte':
>> mm/madvise.c:1119:9: error: implicit declaration of function 'set_pte'; did you mean 'set_ptes'? [-Wimplicit-function-declaration]
    1119 |         set_pte(ptep, make_pte_marker(PTE_MARKER_GUARD));
         |         ^~~~~~~
         |         set_ptes


vim +1119 mm/madvise.c

  1112	
  1113	static int guard_install_set_pte(unsigned long addr, unsigned long next,
  1114					 pte_t *ptep, struct mm_walk *walk)
  1115	{
  1116		unsigned long *nr_pages = (unsigned long *)walk->private;
  1117	
  1118		/* Simply install a PTE marker, this causes segfault on access. */
> 1119		set_pte(ptep, make_pte_marker(PTE_MARKER_GUARD));
  1120		(*nr_pages)++;
  1121	
  1122		return 0;
  1123	}
  1124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
