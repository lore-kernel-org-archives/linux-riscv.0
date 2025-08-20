Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55479CA0EF8
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=To7ZHpz0WnmyYJx5WHeK71BkifsNPPzfGqqqmi74mm0=; b=xBSIqKgE+mUSa/
	rO4qJmR7HqAD11D6oVwbH0B+5OZZKvpOM9PW++nUxIfHczNxn3HvPGENlB9IXqIZotipBNx4POWgm
	Hnd0Jz3HB+1u9dTnDepTGkBlG7zfD/+QQPrXOLrjq5KXsrc338CbbsoKASlQ5iMZQz+JboSVkbHg0
	Mzge0xv4UjnfgoArEuh5BBu2aNr0ktUWJrRP6KL1OzpREKWL07i2ACzYAch2yfHXRAUYYAbLpNo6q
	ky8EhA3IyxArQmHw5meMic6+dQMAsofp3aWEkYE6248aSIpzBV7QWeM5WrhX6OenNub0wZGP/SyPn
	Lmh3SNF+zwqFrmGgjbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqkQ-0000000F2Le-1zH8;
	Wed, 20 Aug 2025 21:53:34 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomTQ-0000000EWEI-3Qmy
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 17:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755710385; x=1787246385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GxHr6/54rgcy6sAclCD5AO7ktqqANCdjdS8twJwHCMA=;
  b=fDpsQa9eXVW3VUKag2sEKTeHkQJUYbP+sJO26cTNdygg9yv2PSm668ZS
   pEGSj0wFF13DBljeGm0IZbdiIj6A4jXr685Cgf69OJitnwKhVycI3sz/X
   lzzRitpiNyi29foD5g6Uk4OERwXVAMs5BcMxg99RPdgMBR2T0/7qdRSHI
   2apcDGhrma00TnfuFZyg40kzxGrT5ARuGMTTAtG8TTvcR6gtVw8rn/jkf
   7n9nMq4EdJ+q9WgGgxakeeI5nQraY1pgxtTeSFcEbykSwWyTZ7xK5EEbv
   LwU0/T/WQVhjT+PH+BE+PXG0fM51QyhfAq0cOq1vWPJTbYMx/ruy6U1lw
   A==;
X-CSE-ConnectionGUID: S48BkUiGSjmtIwTUOjlqaw==
X-CSE-MsgGUID: 4WrFc0s/Rf2KoitWGnCQgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="83406119"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="83406119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 10:19:44 -0700
X-CSE-ConnectionGUID: id3NsaM5RTK6EUgGk1bUSw==
X-CSE-MsgGUID: F/GOHyWPSxGZCqOCHmhCXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167798899"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2025 10:19:40 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uomTK-000JXL-03;
	Wed, 20 Aug 2025 17:19:38 +0000
Date: Thu, 21 Aug 2025 01:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH 2/2] riscv: introduce percpu.h into include/asm
Message-ID: <202508210101.WySkXlSZ-lkp@intel.com>
References: <20250819135007.85646-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819135007.85646-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_101944_899925_1624141A 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Yunhui,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on dennis-percpu/for-next v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhui-Cui/riscv-remove-irqflags-h-inclusion-in-asm-bitops-h/20250819-215256
base:   linus/master
patch link:    https://lore.kernel.org/r/20250819135007.85646-3-cuiyunhui%40bytedance.com
patch subject: [PATCH 2/2] riscv: introduce percpu.h into include/asm
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20250821/202508210101.WySkXlSZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210101.WySkXlSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210101.WySkXlSZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic.h:80,
                    from include/linux/cpumask.h:14,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/slub.c:13:
   mm/slub.c: In function '__update_cpu_freelist_fast':
>> include/linux/atomic/atomic-arch-fallback.h:414:30: error: implicit declaration of function 'arch_cmpxchg128_local'; did you mean 'arch_cmpxchg64_local'? [-Wimplicit-function-declaration]
     414 | #define raw_cmpxchg128_local arch_cmpxchg128_local
         |                              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5005:9: note: in expansion of macro 'raw_cmpxchg128_local'
    5005 |         raw_cmpxchg128_local(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:131:17: note: in expansion of macro 'cmpxchg128_local'
     131 |         ret__ = cmpxchg128_local(ptr__, old__, new__);                  \
         |                 ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:108:17: note: in expansion of macro 'this_cpu_cmpxchg128'
     108 |         __val = _cmpxchg(pcp, __old, nval);                             \
         |                 ^~~~~~~~
   include/asm-generic/percpu.h:527:9: note: in expansion of macro '__cpu_fallback_try_cmpxchg'
     527 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg128)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:24:41: note: in expansion of macro 'this_cpu_try_cmpxchg128'
      24 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg128
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:3638:16: note: in expansion of macro 'this_cpu_try_cmpxchg_freelist'
    3638 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid.full,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +414 include/linux/atomic/atomic-arch-fallback.h

9257959a6e5b4f Mark Rutland 2023-06-05  413  
9257959a6e5b4f Mark Rutland 2023-06-05 @414  #define raw_cmpxchg128_local arch_cmpxchg128_local
e6ce9d741163af Uros Bizjak  2023-04-05  415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
