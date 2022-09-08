Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9420C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPDMBSDYIGF/KNzR82m/bfElPQOY6tIQWAeAK2T0ZAY=; b=pSYq8vaPlawfKX
	Kctu8PjBVoo1OW6d7g4mVuO0aBbOERzMxccd/1Pgjmm7rRX5bB3/5C47JVo3GhZwzAtptzp88t/J3
	FKBN4LOQYSuBQACAyGNkMRvi7KywK1yjcKxNQnT4uAF/sj/TRscNtfYaCC+5np6ahu7RiddTKVHzi
	bbzVzFUMkgpF94ZzwvonwXY9v3zD9CzPKpugIl9o8CsdbZWmmG37GB37DD3S7HZT2RpT/w2fkMAjR
	sPG6aGG5KNge8/wGNtoApm2zL+oZteg5gPLhuMe5OW5UHkV/3JzDk6XAsKavOd/PPmln3nvbdAZ/L
	d52kuE10pBRIUykZ3YZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWOvz-008zUe-B2; Thu, 08 Sep 2022 21:19:39 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWOvv-008zTH-L0
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 21:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662671975; x=1694207975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hPK/Pv0LGYyLuxyhio+4Qw0tsqTk3tEa/oIwXYx8sWg=;
  b=dFGU4zLdlLmoVyKxBEGP20HC3NlVjGGtAlsmSH0JRQY9HsbwRg3Z1JCQ
   cAzv7X/s7kOu7qZfAJ/ly+ZSBY0yjCFFcBTYQLe1EUgFiboZmBIUoQMXB
   +gEcVZHTYKIiQyj2r9bFqnZOE3M4nqqk7K0fbMuW/KEFsaFJp648v8RmW
   WRJjcjI+rYXNkWGNmfcVlihK9sqbkI+WKKPli8NJkMkymqKamCcilZ4Ll
   xiORSOC2JLIvL7vWmfzblCdl+KZwmp4SqxoOtJTOf87p9592vchrIxh4p
   86Bj4Kz5WKlTcB9YztjPpulZr6ElIa/rHKH7feNBbeWmsObGPsoLppMGV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="383621831"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="383621831"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 14:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="566108806"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Sep 2022 14:19:31 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWOvq-0000KL-0R;
	Thu, 08 Sep 2022 21:19:30 +0000
Date: Fri, 9 Sep 2022 05:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vdso: fix NULL deference in vdso_join_timens() when vfork
Message-ID: <202209090531.SgtAsnCi-lkp@intel.com>
References: <20220907165831.457-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220907165831.457-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_141935_739954_DC018979 
X-CRM114-Status: GOOD (  12.38  )
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
[also build test ERROR on v6.0-rc4]
[cannot apply to next-20220908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/vdso-fix-NULL-deference-in-vdso_join_timens-when-vfork/20220908-011001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0066f1b0e27556381402db3ff31f85d2a2265858
config: riscv-randconfig-r012-20220907 (https://download.01.org/0day-ci/archive/20220909/202209090531.SgtAsnCi-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/247635b442c42937dc9f0c0a04711fb3f86df2a9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jisheng-Zhang/vdso-fix-NULL-deference-in-vdso_join_timens-when-vfork/20220908-011001
        git checkout 247635b442c42937dc9f0c0a04711fb3f86df2a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/vdso.c:158:10: error: use of undeclared identifier 'rv_compat_vdso_maps'
                   .dm = &rv_compat_vdso_maps[RV_VDSO_MAP_VVAR],
                          ^
   arch/riscv/kernel/vdso.c:159:10: error: use of undeclared identifier 'rv_compat_vdso_maps'
                   .cm = &rv_compat_vdso_maps[RV_VDSO_MAP_VDSO],
                          ^
   2 errors generated.


vim +/rv_compat_vdso_maps +158 arch/riscv/kernel/vdso.c

   144	
   145	static struct __vdso_info vdso_info[] __ro_after_init = {
   146		[VDSO_ABI_RV64] = {
   147			.name = "vdso",
   148			.vdso_code_start = vdso_start,
   149			.vdso_code_end = vdso_end,
   150			.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
   151			.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
   152		},
   153	#ifdef CONFIG_COMPAT
   154		[VDSO_ABI_RV32] = {
   155			.name = "compat_vdso",
   156			.vdso_code_start = compat_vdso_start,
   157			.vdso_code_end = compat_vdso_end,
 > 158			.dm = &rv_compat_vdso_maps[RV_VDSO_MAP_VVAR],
   159			.cm = &rv_compat_vdso_maps[RV_VDSO_MAP_VDSO],
   160		},
   161	#endif
   162	};
   163	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
