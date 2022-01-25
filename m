Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB39C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 21:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCt3+62NAy1z/V8mo9cCYGt07FJ5Q7HBNWib09WRqt4=; b=vxqXTNZTKwaumK
	TkHGKbEmCc3BdzSgBr+4qqFnqLA8ODTAMzhcrwKJDL+zF5N2oyZiJAKbjcE2yWZSs/+9uB10RNttL
	x+IWtNhuvcg4fHRMPWXYgzO+uR/Xn0+9NVGd1qon+V7Exs4DRyWzhLc9xVHHhrWmlEUKTa5F8g6gK
	/x4KUwUlCBMOyhxm8UAnKppM4xRhj25Ypx9cZMMWoBN29+Xi16U2xZjiikbReRNHh/5rii3SmW+fW
	X6j5UNselY8Q8N1IXsgnQbWUK/cOZgVgZOEbQFXHWs1QTUmdNEhjSCxybdF9W8+DQxKNlfAi/HTSN
	PWQAMkFPD4ceHsu2meBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCTOv-009aj3-1s; Tue, 25 Jan 2022 21:30:53 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCTOs-009aig-Ie
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 21:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643146250; x=1674682250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XowxNXgoa7qTiYGMsiGyGW3OfOAW78GHgwKP30yaINQ=;
 b=MxrrzP659TOuh3nLEPDlTi+E5+9q3wRRVEUpcPg+Jc+bsxrIKuI3Wu5S
 RLN6RndWxVyqEL5JSkKCzD7NI50w7/ygGXng1lO+3Ww6WYHjHCnfKojm8
 TyrIlSRU8JI3hUiqTvzm9z8ujSsmIbHvaD6tW8XsUT35jOynvqG94ghtZ
 Azc3MZONCos8MYzp7CslmSU4YAYmE1gcwflIvcOfvt+82lV+l7iu8mP4q
 w+R/DdCdXamTCVBzFGhJ9vvHyOlKt2eurDo3SYkdi3KAJRKx5oH1mw2ke
 2zZW9ZtgmHFFyL4bn6hQlOwvKzElZsknGwU8PHmBdw3LphwOR+V7BEVlF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="270869732"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="270869732"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 13:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="617760902"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2022 13:30:22 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nCTOP-000KS4-P7; Tue, 25 Jan 2022 21:30:21 +0000
Date: Wed, 26 Jan 2022 05:30:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: convert pgtable_l4_enabled to static key
Message-ID: <202201260555.SwYGWcoq-lkp@intel.com>
References: <20220125165036.987-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220125165036.987-4-jszhang@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_133050_702976_B4ED6D9B 
X-CRM114-Status: GOOD (  18.42  )
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

Hi Jisheng,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jisheng-Zhang/unified-way-to-use-static-key-and-optimize-pgtable_l4_enabled/20220126-010230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a08b41ab9e2e468647f78eb17c28e29b93006394
config: riscv-randconfig-r012-20220124 (https://download.01.org/0day-ci/archive/20220126/202201260555.SwYGWcoq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6822380e5bcac6d3edfa5d0723d829db8ec28405
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jisheng-Zhang/unified-way-to-use-static-key-and-optimize-pgtable_l4_enabled/20220126-010230
        git checkout 6822380e5bcac6d3edfa5d0723d829db8ec28405
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/mm/init.c:691:6: error: implicit declaration of function 'system_supports_sv48' [-Werror,-Wimplicit-function-declaration]
           if (system_supports_sv48()) {
               ^
   arch/riscv/mm/init.c:721:13: warning: no previous prototype for function 'pt_ops_set_early' [-Wmissing-prototypes]
   void __init pt_ops_set_early(void)
               ^
   arch/riscv/mm/init.c:721:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init pt_ops_set_early(void)
   ^
   static 
   arch/riscv/mm/init.c:741:13: warning: no previous prototype for function 'pt_ops_set_fixmap' [-Wmissing-prototypes]
   void __init pt_ops_set_fixmap(void)
               ^
   arch/riscv/mm/init.c:741:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init pt_ops_set_fixmap(void)
   ^
   static 
   arch/riscv/mm/init.c:757:13: warning: no previous prototype for function 'pt_ops_set_late' [-Wmissing-prototypes]
   void __init pt_ops_set_late(void)
               ^
   arch/riscv/mm/init.c:757:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init pt_ops_set_late(void)
   ^
   static 
   3 warnings and 1 error generated.


vim +/system_supports_sv48 +691 arch/riscv/mm/init.c

   675	
   676	/*
   677	 * Setup a 4MB mapping that encompasses the device tree: for 64-bit kernel,
   678	 * this means 2 PMD entries whereas for 32-bit kernel, this is only 1 PGDIR
   679	 * entry.
   680	 */
   681	static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
   682	{
   683	#ifndef CONFIG_BUILTIN_DTB
   684		uintptr_t pa = dtb_pa & ~(PMD_SIZE - 1);
   685	
   686		create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
   687				   IS_ENABLED(CONFIG_64BIT) ? early_dtb_pgd_next : pa,
   688				   PGDIR_SIZE,
   689				   IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
   690	
 > 691		if (system_supports_sv48()) {
   692			create_pud_mapping(early_dtb_pud, DTB_EARLY_BASE_VA,
   693					   (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
   694		}
   695	
   696		if (IS_ENABLED(CONFIG_64BIT)) {
   697			create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
   698					   pa, PMD_SIZE, PAGE_KERNEL);
   699			create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
   700					   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
   701		}
   702	
   703		dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
   704	#else
   705		/*
   706		 * For 64-bit kernel, __va can't be used since it would return a linear
   707		 * mapping address whereas dtb_early_va will be used before
   708		 * setup_vm_final installs the linear mapping. For 32-bit kernel, as the
   709		 * kernel is mapped in the linear mapping, that makes no difference.
   710		 */
   711		dtb_early_va = kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
   712	#endif
   713	
   714		dtb_early_pa = dtb_pa;
   715	}
   716	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
