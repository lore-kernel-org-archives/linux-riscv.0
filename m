Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D631DCD4F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 04:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBUmuBRkTfQNsW4jwkPemBPMtd4VCg31PoK8Ud2y7+c=; b=C/1vGYB/GHD9qO
	X55nDhveaLjkgifcmZtTESB5cyyxZy++sd+fkicscth2vUV1pc2US+NordpLZ8O9/D4RCguDecazN
	F+8uSx5pyXnTBYi/jh3SWihdHEMTPpLYx4PAnatfIf98Re9CsDGV8h1ljg26f/a9DZ4d2Tk1MvfIm
	Lya1ZA0AAmsjEoThDf0rRMCyydui00hwBOJ2OGYzl4BDb+bBIjKC9BHLGaSiZvkfIfPMnJ6HQedVs
	vFUnUcXol7lcIQmBkV1HNW/Mu4e08qcw6xdeXRMKRSwakgroWqYJc213k9O7kqa3Eq7xWhYzxrY9z
	qNrv7lSucQj5LO0TDtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPKw-00000009tfM-03ns;
	Thu, 13 Nov 2025 04:53:34 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPKt-00000009tev-2AkA
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 04:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009612; x=1794545612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/S+WjjUSEkVtvCHe8svQ+akEl//PD1NKJVfzgDfMQlE=;
  b=SBRH0kZ7yzTk4SD1kcMMY5bVXWxijJS9EjR9UbSdTNRm+LOxq5xWXmVT
   9GpSl+WGwvjJZ99MqjZFxhuo8ik+E5+8hzX7bLRQdtr+37paUX7P3A13F
   m05YoeKaCD0ZJr1nX58AuKqTGYDd1PPwJbDkOLraOhLFBd5TQkeP66j9x
   a9YyFDF0K3V57EMqoiXbhmZRkYO1YaJG/cqVmhxDJ31Jfbnfqr6olLPAe
   ZyUrMrYd1csQrNQoQHQ1pqKsZuWLVdZ3ZVBKGCXOdzBlzgWQrSfEDD+dW
   jC1LmWWLmqd6C6wMylEuG5yquBci6uy2hUWzqy/SgXv28sLCijmMqj5pu
   g==;
X-CSE-ConnectionGUID: Byi69DWiQtWrVpKhf6bovA==
X-CSE-MsgGUID: OVQEBl/zTT2J4SDbZzk36Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82480097"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="82480097"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:28 -0800
X-CSE-ConnectionGUID: de5TNagITzuMYBg/6vVGzA==
X-CSE-MsgGUID: 6ZLSdvckRpGmIxHl17leoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189415465"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2025 20:53:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004tx-1F;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
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
Message-ID: <202511131136.6CBuWpof-lkp@intel.com>
References: <20251113014656.2605447-7-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251113014656.2605447-7-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_205331_596798_E32570CF 
X-CRM114-Status: GOOD (  12.36  )
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
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131136.6CBuWpof-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131136.6CBuWpof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131136.6CBuWpof-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/pgtable-generic.c:27:2: error: cannot take the address of an rvalue of type 'pgd_t'
      27 |         pgd_ERROR(pgdp_get(pgd));
         |         ^         ~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64.h:50:29: note: expanded from macro 'pgd_ERROR'
      50 |                __FILE__, __LINE__, &(e), pgd_val(e))
         |                                    ^ ~
   include/linux/printk.h:555:33: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> mm/pgtable-generic.c:34:2: error: cannot take the address of an rvalue of type 'p4d_t'
      34 |         p4d_ERROR(p4dp_get(p4d));
         |         ^         ~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64.h:46:29: note: expanded from macro 'p4d_ERROR'
      46 |                __FILE__, __LINE__, &(e), p4d_val(e))
         |                                    ^ ~
   include/linux/printk.h:555:33: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> mm/pgtable-generic.c:42:2: error: cannot take the address of an rvalue of type 'pud_t'
      42 |         pud_ERROR(pudp_get(pud));
         |         ^         ~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64.h:42:29: note: expanded from macro 'pud_ERROR'
      42 |                __FILE__, __LINE__, &(e), pud_val(e))
         |                                    ^ ~
   include/linux/printk.h:555:33: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> mm/pgtable-generic.c:54:2: error: cannot take the address of an rvalue of type 'pmd_t'
      54 |         pmd_ERROR(pmdp_get(pmd));
         |         ^         ~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable_64.h:39:29: note: expanded from macro 'pmd_ERROR'
      39 |                __FILE__, __LINE__, &(e), pmd_val(e))
         |                                    ^ ~
   include/linux/printk.h:555:33: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   4 errors generated.


vim +/pgd_t +27 mm/pgtable-generic.c

    18	
    19	/*
    20	 * If a p?d_bad entry is found while walking page tables, report
    21	 * the error, before resetting entry to p?d_none.  Usually (but
    22	 * very seldom) called out from the p?d_none_or_clear_bad macros.
    23	 */
    24	
    25	void pgd_clear_bad(pgd_t *pgd)
    26	{
  > 27		pgd_ERROR(pgdp_get(pgd));
    28		pgd_clear(pgd);
    29	}
    30	
    31	#ifndef __PAGETABLE_P4D_FOLDED
    32	void p4d_clear_bad(p4d_t *p4d)
    33	{
  > 34		p4d_ERROR(p4dp_get(p4d));
    35		p4d_clear(p4d);
    36	}
    37	#endif
    38	
    39	#ifndef __PAGETABLE_PUD_FOLDED
    40	void pud_clear_bad(pud_t *pud)
    41	{
  > 42		pud_ERROR(pudp_get(pud));
    43		pud_clear(pud);
    44	}
    45	#endif
    46	
    47	/*
    48	 * Note that the pmd variant below can't be stub'ed out just as for p4d/pud
    49	 * above. pmd folding is special and typically pmd_* macros refer to upper
    50	 * level even when folded
    51	 */
    52	void pmd_clear_bad(pmd_t *pmd)
    53	{
  > 54		pmd_ERROR(pmdp_get(pmd));
    55		pmd_clear(pmd);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
