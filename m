Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F0EC636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 00:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzVDDW6ES5B1otD2M2XVpZIRjIQLTQao/ozyM/Ls+iQ=; b=dZuFqf8Y7yGOk5
	T3C295mWuh2QuW5aXEJ3UWNe/ohexdWoMGaGzgTIPM6ie4HCK1gkjdyjfjge7md1Dx/uXNUwbPXY8
	7HGxCT6crV92oVUC0toNAGw9giWrzaTZ9rJxfMBSHssbiGTWNACfC25HPk/JTyjuyX78VEVagKoAK
	gaLJRMd1Z+FTueDB+cr0RfXIbXxzohz6kXJw8qiSDHK9TSCaFkOQalDNWx1gMVHF9W8MLCOa+O/Pp
	F7XNcG7DxjG8m7x5OAoKaDN0kMFD/smFlvplmzb5VZIEtkqlQfpdeR6UVVsjULqP1eomeobq/DXUV
	mYJqb4BXL6XKba3w4OxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN0nr-009lPF-Pp; Wed, 01 Feb 2023 00:16:43 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN0no-009lOD-9y
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 00:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675210600; x=1706746600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oGcc5GCEMxGvL5mm0PL0tfMmHHnzeThTjrhfqHsD/iI=;
  b=Alpss01FWJpZJbk2gsYFCXBrZQchyu/ptmNqRBfG4dEGBTXV5POd7MkT
   yaTZphBjWc2JAcc0RTPlUA7JgA+NTEjDz9T/CDkBU0jchPzZDgo0/2Okl
   wIO/dGgPlODCQnDwUmvkfrAj0hlaGTAiP3E12Oqxi2cx2UrKl5AAmkT8s
   e3KsXr913bkkML/JR9OmLhaVY/MWDDF4xsBigTkLbigMkjtSQFQF7FlXq
   HjJnkHxyIEcAhRujs5Y2J1Kr+Nn0y+gi6AK61oXPeHqQxiFoS9YJP/khl
   2qGf1ykC6VoYKRdH0VaG2038+GLy8E0Am1PLHlqmNXcpeEVoIt3AIUZYs
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="330108539"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="330108539"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 16:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="838579710"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="838579710"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2023 16:16:32 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN0ne-0004pS-39;
	Wed, 01 Feb 2023 00:16:30 +0000
Date: Wed, 1 Feb 2023 08:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-efi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 2/6] riscv: Rework kasan population functions
Message-ID: <202302010819.RAsjyv6V-lkp@intel.com>
References: <20230125082333.1577572-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230125082333.1577572-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_161640_606198_011FE91E 
X-CRM114-Status: GOOD (  14.73  )
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

Hi Alexandre,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc6 next-20230131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230125-163113
patch link:    https://lore.kernel.org/r/20230125082333.1577572-3-alexghiti%40rivosinc.com
patch subject: [PATCH v3 2/6] riscv: Rework kasan population functions
config: riscv-randconfig-r006-20230201 (https://download.01.org/0day-ci/archive/20230201/202302010819.RAsjyv6V-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c18726e8d14edbd59ec19854b4eb06d83fff716f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230125-163113
        git checkout c18726e8d14edbd59ec19854b4eb06d83fff716f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/mm/kasan_init.c:442:6: warning: no previous prototype for 'create_tmp_mapping' [-Wmissing-prototypes]
     442 | void create_tmp_mapping(void)
         |      ^~~~~~~~~~~~~~~~~~


vim +/create_tmp_mapping +442 arch/riscv/mm/kasan_init.c

   441	
 > 442	void create_tmp_mapping(void)
   443	{
   444		void *ptr;
   445		p4d_t *base_p4d;
   446	
   447		/*
   448		 * We need to clean the early mapping: this is hard to achieve "in-place",
   449		 * so install a temporary mapping like arm64 and x86 do.
   450		 */
   451		memcpy(tmp_pg_dir, swapper_pg_dir, sizeof(pgd_t) * PTRS_PER_PGD);
   452	
   453		/* Copy the last p4d since it is shared with the kernel mapping. */
   454		if (pgtable_l5_enabled) {
   455			ptr = (p4d_t *)pgd_page_vaddr(*pgd_offset_k(KASAN_SHADOW_END));
   456			memcpy(tmp_p4d, ptr, sizeof(p4d_t) * PTRS_PER_P4D);
   457			set_pgd(&tmp_pg_dir[pgd_index(KASAN_SHADOW_END)],
   458				pfn_pgd(PFN_DOWN(__pa(tmp_p4d)), PAGE_TABLE));
   459			base_p4d = tmp_p4d;
   460		} else {
   461			base_p4d = (p4d_t *)tmp_pg_dir;
   462		}
   463	
   464		/* Copy the last pud since it is shared with the kernel mapping. */
   465		if (pgtable_l4_enabled) {
   466			ptr = (pud_t *)p4d_page_vaddr(*(base_p4d + p4d_index(KASAN_SHADOW_END)));
   467			memcpy(tmp_pud, ptr, sizeof(pud_t) * PTRS_PER_PUD);
   468			set_p4d(&base_p4d[p4d_index(KASAN_SHADOW_END)],
   469				pfn_p4d(PFN_DOWN(__pa(tmp_pud)), PAGE_TABLE));
   470		}
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
