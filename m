Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3634DFC618A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 01:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vY6fFtvzfJn6dj64Tvvjgjklz8DYPDALD6Cw5JH1ssU=; b=0+hGFyyaSy8aVU
	YYs+ITikuasRoSQNok7UVJXaJjkjLJBuF1T79KVjKbP6O3OuUogw0zvOmVir3uWpGJwa5/JWbhR9p
	uIUA3gWrAY3RJkRNsdH4Yamy+hbT9Id9dORgcArqjsXz9zbb0Ik0YhJF0gLS0U+oPG8h7exoZYm7M
	C+11RV95Y9RaT4taedQiBz9WtUESht+ZQoRP+Vh1h9iLRyEiICdcMGg9akgk8kPhKuhkFuYqtdCHT
	Ege4Rm5uq1QgcZUQeCtjjVDu3RTvb+VP2FrqMCN9DpW49FMYnfgbziVhEqZszW2tWa5CwCLzkeDgr
	xBoPNazTBAKGaOXnICpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spHzt-0000000HUU7-1YpR;
	Sat, 14 Sep 2024 01:54:49 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spHzq-0000000HUTc-3Iw0
	for linux-riscv@lists.infradead.org;
	Sat, 14 Sep 2024 01:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726278887; x=1757814887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TLXeBUebCUeA7FDBNQ7Y62aN1d7vguuNY9Dg5smqFKw=;
  b=Mk42WwY+D3T0A1d9TzVczQ5C2yjhBt7ZOelm0uPJ0XnIC0GzojXfFHKp
   +531lDVVEKuQq/g3EwJsjctXjhapv78+kyPwj0OHZS53XCmvs4ZlbzN7t
   Z2cW0v9S3cDP/HcBKMj2SUDsY1Z5y2I92RPd+tkm7K2Wi5OiuuKI2tUKb
   oN2eIkgAK4cgO2BzR+H9Wo8YFEe9jjrSafqSdX9LLA3+/A8LEwZjqKJxx
   NkIxnP7bxYG7b7oenAQVpFAnBtprzJbsMbQ2qxLsFAIbXPan+juMBzUxh
   FguCVWlTUIjZjHvHj9vVNqR/0T4Yxy/zDtCklcH1Gd7xQZjn2AsMPdIOE
   w==;
X-CSE-ConnectionGUID: JgsTGE1eTuOMHUfyVsOtuA==
X-CSE-MsgGUID: qA/kpnIAR++ART8ER1Cjsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25392359"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25392359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 18:54:42 -0700
X-CSE-ConnectionGUID: 8/RVo9fwTHKmd/RxSkbmmA==
X-CSE-MsgGUID: 6noWOEqXTIaiVBZhuyPnbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72381126"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Sep 2024 18:54:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spHzc-0007Eu-2R;
	Sat, 14 Sep 2024 01:54:32 +0000
Date: Sat, 14 Sep 2024 09:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@sifive.com, conor@kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, corbet@lwn.net,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, robh@kernel.org,
	krzk+dt@kernel.org, oleg@redhat.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
	arnd@arndb.de, ebiederm@xmission.com, kees@kernel.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz
Subject: Re: [PATCH v4 16/30] riscv/shstk: If needed allocate a new shadow
 stack on clone
Message-ID: <202409140913.73qFCOmB-lkp@intel.com>
References: <20240912231650.3740732-17-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240912231650.3740732-17-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_185446_897867_AA740796 
X-CRM114-Status: GOOD (  13.31  )
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

Hi Deepak,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes tip/x86/core robh/for-next tip/smp/core kees/for-next/execve linus/master v6.11-rc7]
[cannot apply to akpm-mm/mm-everything next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-Introduce-ARCH_HAS_USER_SHADOW_STACK/20240913-072124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240912231650.3740732-17-debug%40rivosinc.com
patch subject: [PATCH v4 16/30] riscv/shstk: If needed allocate a new shadow stack on clone
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240914/202409140913.73qFCOmB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140913.73qFCOmB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140913.73qFCOmB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/riscv/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/riscv/include/asm/thread_info.h:37:
   In file included from arch/riscv/include/asm/processor.h:17:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for function 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^
   arch/riscv/include/asm/usercfi.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         | ^
         | static 
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2233:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   2 warnings generated.
--
   In file included from arch/riscv/kernel/soc.c:7:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:9:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/riscv/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/riscv/include/asm/thread_info.h:37:
   In file included from arch/riscv/include/asm/processor.h:17:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for function 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^
   arch/riscv/include/asm/usercfi.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         | ^
         | static 
   1 warning generated.
--
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/riscv/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/riscv/include/asm/thread_info.h:37:
   In file included from arch/riscv/include/asm/processor.h:17:
>> arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for function 'get_shstk_base' [-Wmissing-prototypes]
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         |               ^
   arch/riscv/include/asm/usercfi.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      44 | unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
         | ^
         | static 
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2233:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   2 warnings generated.


vim +/get_shstk_base +44 arch/riscv/include/asm/usercfi.h

    43	
  > 44	unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
    45	{
    46		return 0;
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
