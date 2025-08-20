Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497DCA0EED
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfvEg+KJbdbWHqovvCFWGWhsWaHDz5FyHJFH4c5P7QQ=; b=dXg3rb0AOeGY0Y
	LE1CrNlZ9/n8i+OSm5Fr9onJ49pR4kTW+R2GLm0nEx0E3MM/owqvRo5VFQycdR71KHZwQ6MtKieBm
	FO9Dwh3a4HgYqHm8iS3qVCh8pCSQCaQ4CTiGv3QNnlafxZOQ378pCXkF4Xd9zCkFWeKmKGgtgDTzc
	ZzLq7LeJbPa0M9zZDa1I938NqlJhSQXAUqsCOQiY1RJPJtehBFNksTHSympk8IklYK0I1GGhm4egd
	B7rhp8967eHfcIvZblPe9BCRJ14rTWNVjJqlC84VhXjv7g+fCpJDB+QsEC+0ehil9jINhfGbTUuro
	Abq7BCw8AFntzrwhxDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocZn-0000000CWPa-2WbU;
	Wed, 20 Aug 2025 06:45:39 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocZl-0000000CWPD-24P0
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 06:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755672337; x=1787208337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Aks18XLnFJDywmToiC/hQRBj84tcW/vcMhMm0McgHP4=;
  b=BQXJa2DklheG1XobGiKPr7yfHJ1llIMtWEnmthEuG2o5XuQJhnZd4722
   +r4ginOFQaGSEUGnmO/3zhl+ytz6YfJNcrajthLUsCrcqJyHsMf2/LpAV
   AY3egFRSJco4Dh4wUl+GSItpo1Wcq7yRfeZICZT95j5RScDfm2Pv26g8J
   wGhpaYcSwhYgj4WUe5SxR+V93cgCBi3CsHjQpLZIG072iwUGi+hQrrmiG
   j2EfKJZV870QQCCUxmxMz5CHCiKoRlFTzHNT4iNEyO9IBiMJffcigLMXk
   eZ0wdtzvwUQ9FXwwpTLG3b716xUuWMi4WvKmGukpY/i5jjsGwaUlbnav0
   Q==;
X-CSE-ConnectionGUID: ifJb8bwiTByEPDy5MhL8iA==
X-CSE-MsgGUID: KqNQeZ7PSMKmZdd6oU9Lmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61745339"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61745339"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 23:45:36 -0700
X-CSE-ConnectionGUID: oZu6t+lTTiuD65z9o2thYw==
X-CSE-MsgGUID: BZwrqRZbQTWCzxT/CDtEsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168851444"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Aug 2025 23:45:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uocZd-000IJH-2r;
	Wed, 20 Aug 2025 06:45:29 +0000
Date: Wed, 20 Aug 2025 14:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH 2/2] riscv: introduce percpu.h into include/asm
Message-ID: <202508201452.ciEgfhNO-lkp@intel.com>
References: <20250819135007.85646-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819135007.85646-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_234537_550885_89867966 
X-CRM114-Status: GOOD (  11.61  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on dennis-percpu/for-next v6.17-rc2 next-20250819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhui-Cui/riscv-remove-irqflags-h-inclusion-in-asm-bitops-h/20250819-215256
base:   linus/master
patch link:    https://lore.kernel.org/r/20250819135007.85646-3-cuiyunhui%40bytedance.com
patch subject: [PATCH 2/2] riscv: introduce percpu.h into include/asm
config: riscv-randconfig-002-20250820 (https://download.01.org/0day-ci/archive/20250820/202508201452.ciEgfhNO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201452.ciEgfhNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201452.ciEgfhNO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
>> include/linux/alloc_tag.h:219:2: warning: implicit conversion from 'typeof (tag->counters->calls)' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     219 |         this_cpu_dec(tag->counters->calls);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:512:28: note: expanded from macro 'this_cpu_dec'
     512 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:510:51: note: expanded from macro 'this_cpu_sub'
     510 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
         |                                         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:501:70: note: expanded from macro 'this_cpu_add'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/percpu-defs.h:372:29: note: expanded from macro '__pcpu_size_call'
     372 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:96:78: note: expanded from macro 'this_cpu_add_8'
      96 | #define this_cpu_add_8(pcp, val)        _pcp_protect(__percpu_add_amo_case_64, pcp, val)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/riscv/include/asm/percpu.h:72:26: note: expanded from macro '_pcp_protect'
      72 |         op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);                           \
         |         ~~                      ^~~~~~~~~~~
   1 warning generated.
--
   In file included from arch/riscv/errata/sifive/errata.c:7:
   In file included from include/linux/memory.h:19:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:16:
   In file included from include/linux/energy_model.h:7:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:16:
   In file included from include/linux/percpu.h:5:
>> include/linux/alloc_tag.h:219:2: warning: implicit conversion from 'typeof (tag->counters->calls)' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     219 |         this_cpu_dec(tag->counters->calls);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:512:28: note: expanded from macro 'this_cpu_dec'
     512 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:510:51: note: expanded from macro 'this_cpu_sub'
     510 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
         |                                         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:501:70: note: expanded from macro 'this_cpu_add'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/percpu-defs.h:372:29: note: expanded from macro '__pcpu_size_call'
     372 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:96:78: note: expanded from macro 'this_cpu_add_8'
      96 | #define this_cpu_add_8(pcp, val)        _pcp_protect(__percpu_add_amo_case_64, pcp, val)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/riscv/include/asm/percpu.h:72:26: note: expanded from macro '_pcp_protect'
      72 |         op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);                           \
         |         ~~                      ^~~~~~~~~~~
   arch/riscv/errata/sifive/errata.c:29:14: warning: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
      29 |         if (arch_id != 0x8000000000000007 ||
         |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
   arch/riscv/errata/sifive/errata.c:42:14: warning: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
      42 |         if (arch_id != 0x8000000000000007 && arch_id != 0x1)
         |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from arch/riscv/kernel/asm-offsets.c:8:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:19:
   In file included from include/linux/workqueue.h:9:
>> include/linux/alloc_tag.h:219:2: warning: implicit conversion from 'typeof (tag->counters->calls)' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
     219 |         this_cpu_dec(tag->counters->calls);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:512:28: note: expanded from macro 'this_cpu_dec'
     512 | #define this_cpu_dec(pcp)               this_cpu_sub(pcp, 1)
         |                                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:510:51: note: expanded from macro 'this_cpu_sub'
     510 | #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
         |                                         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:501:70: note: expanded from macro 'this_cpu_add'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/percpu-defs.h:372:29: note: expanded from macro '__pcpu_size_call'
     372 |                 case 8: stem##8(variable, __VA_ARGS__);break;           \
         |                         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   arch/riscv/include/asm/percpu.h:96:78: note: expanded from macro 'this_cpu_add_8'
      96 | #define this_cpu_add_8(pcp, val)        _pcp_protect(__percpu_add_amo_case_64, pcp, val)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/riscv/include/asm/percpu.h:72:26: note: expanded from macro '_pcp_protect'
      72 |         op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);                           \
         |         ~~                      ^~~~~~~~~~~
   1 warning generated.


vim +219 include/linux/alloc_tag.h

22d407b164ff79 Suren Baghdasaryan 2024-03-21  202  
22d407b164ff79 Suren Baghdasaryan 2024-03-21  203  static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)
22d407b164ff79 Suren Baghdasaryan 2024-03-21  204  {
22d407b164ff79 Suren Baghdasaryan 2024-03-21  205  	struct alloc_tag *tag;
22d407b164ff79 Suren Baghdasaryan 2024-03-21  206  
22d407b164ff79 Suren Baghdasaryan 2024-03-21  207  	alloc_tag_sub_check(ref);
22d407b164ff79 Suren Baghdasaryan 2024-03-21  208  	if (!ref || !ref->ct)
22d407b164ff79 Suren Baghdasaryan 2024-03-21  209  		return;
22d407b164ff79 Suren Baghdasaryan 2024-03-21  210  
239d6c96d86f8a Suren Baghdasaryan 2024-03-21  211  	if (is_codetag_empty(ref)) {
239d6c96d86f8a Suren Baghdasaryan 2024-03-21  212  		ref->ct = NULL;
239d6c96d86f8a Suren Baghdasaryan 2024-03-21  213  		return;
239d6c96d86f8a Suren Baghdasaryan 2024-03-21  214  	}
239d6c96d86f8a Suren Baghdasaryan 2024-03-21  215  
22d407b164ff79 Suren Baghdasaryan 2024-03-21  216  	tag = ct_to_alloc_tag(ref->ct);
22d407b164ff79 Suren Baghdasaryan 2024-03-21  217  
22d407b164ff79 Suren Baghdasaryan 2024-03-21  218  	this_cpu_sub(tag->counters->bytes, bytes);
22d407b164ff79 Suren Baghdasaryan 2024-03-21 @219  	this_cpu_dec(tag->counters->calls);
22d407b164ff79 Suren Baghdasaryan 2024-03-21  220  
22d407b164ff79 Suren Baghdasaryan 2024-03-21  221  	ref->ct = NULL;
22d407b164ff79 Suren Baghdasaryan 2024-03-21  222  }
22d407b164ff79 Suren Baghdasaryan 2024-03-21  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
