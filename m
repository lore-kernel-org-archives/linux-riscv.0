Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F048AD3B7EA
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 03:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6PDajr8UD4qtzvpm1sTnBr/5SiFPZ3YaCPgx7W2Ark=; b=1Yg5h+F5ycVi6H
	fbbXai3zAdSD7pigbdP4fIYX878/EFQqLB8TL0Bi3X6ztfv/em+drhZYal+E22HaENeBbun0ZsKXE
	WYDNVx8LImL5d0UnugUqOaHDjkXXV0gX8Qgpyu7jBDw1frwSQhXNSmaPvY/wM44v8xfonI/ZhQ04X
	2UNAcjCq5U8hTB7LVNYe7017d1xbxEtOh7p8tVzR+bBEasy5NynPHqMYtue2Z0ZbDYxzWRbW9BdG1
	9birP6qlXmTDj61BEMHtjMttuLemR1QO+XOAdGbbrijzqt88E1XHNLz9vrpjUoQwD9KpFdqd4et8V
	Qit6fuO8Sdsy+ki1PX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSopo-0000000Dmh5-1UD0;
	Tue, 09 Dec 2025 03:56:20 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSopm-0000000Dmgh-0U8e
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 03:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765252578; x=1796788578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7BP/S/pgzhOWIgTxUdCLG8fbFzYoQrglr8XUeSf1EHs=;
  b=KW+nrAJ8/uOV0tyV02nX42O09dj+ryzIatjE9LcrNMluhvyy9X3as6MY
   puzujFDjkgQ7rOfcsA4JcOtROZcOJRivqABjsWFuHLzjKnjlaqI172VuC
   YqX3ot+N2LWQEwx9x3J8sWrSKT0ZaPOINFyBlAmvvWkScJ4QPBNxOAeW8
   sJFdNZddvh6UtGPPY5KANpMbGUAFCZgoocaX10dOZlY9IAXKlTuRZ6tre
   VMpZkY2UWzKwgBfFa6y/P4E/LRNvacpBI4bSEOr8cSKZKZrfTUCbP5erE
   3KHqrRHmLgzTH7xYa92BhGsP+Jf7mOJ4yBG98BAWaBEhN13D4XcPeVJL7
   g==;
X-CSE-ConnectionGUID: Jx3D0WojQ46Xj6pFXTmKHQ==
X-CSE-MsgGUID: rYNiUhOGTDmfj/YAHuMl5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67284339"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67284339"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 19:56:15 -0800
X-CSE-ConnectionGUID: GP2DZnxMQm+Hrj5HWbbDlA==
X-CSE-MsgGUID: 1Rq14/z4TO2zsMNQ7ndFqQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2025 19:56:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSopa-000000001ID-0gUl;
	Tue, 09 Dec 2025 03:56:06 +0000
Date: Tue, 9 Dec 2025 11:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>, aou@eecs.berkeley.edu,
	alex@ghiti.fr, andii@kernel.org, andybnac@gmail.com,
	apatel@ventanamicro.com, ast@kernel.org, ben.dooks@codethink.co.uk,
	bjorn@kernel.org, bpf@vger.kernel.org, charlie@rivosinc.com,
	cl@gentwo.org, conor.dooley@microchip.com, cyrilbur@tenstorrent.com,
	daniel@iogearbox.net, debug@rivosinc.com, dennis@kernel.org,
	eddyz87@gmail.com, haoluo@google.com, john.fastabend@gmail.com,
	jolsa@kernel.org, kpsingh@kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk, martin.lau@linux.dev, palmer@dabbelt.com,
	pjw@kernel.org, puranjay@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] riscv: introduce percpu.h into include/asm
Message-ID: <202512091137.3Qw1dX94-lkp@intel.com>
References: <20251208034944.73113-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251208034944.73113-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_195618_164207_52D91586 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
[also build test ERROR on v6.18 next-20251209]
[cannot apply to bpf-next/net bpf-next/master bpf/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhui-Cui/riscv-remove-irqflags-h-inclusion-in-asm-bitops-h/20251208-115407
base:   linus/master
patch link:    https://lore.kernel.org/r/20251208034944.73113-3-cuiyunhui%40bytedance.com
patch subject: [PATCH v2 2/3] riscv: introduce percpu.h into include/asm
config: riscv-randconfig-002-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091137.3Qw1dX94-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091137.3Qw1dX94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091137.3Qw1dX94-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:4380:9: error: call to undeclared function 'arch_cmpxchg128_local'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4380 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
         |                ^
   mm/slab.h:24:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      24 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg128
         |                                         ^
   include/asm-generic/percpu.h:529:47: note: expanded from macro 'this_cpu_try_cmpxchg128'
     529 |         __cpu_fallback_try_cmpxchg(pcp, ovalp, nval, this_cpu_cmpxchg128)
         |                                                      ^
   1 error generated.


vim +/arch_cmpxchg128_local +4380 mm/slub.c

0b303fb402862d Vlastimil Babka 2021-05-08  4371  
6801be4f2653e5 Peter Zijlstra  2023-05-31  4372  static inline bool
6801be4f2653e5 Peter Zijlstra  2023-05-31  4373  __update_cpu_freelist_fast(struct kmem_cache *s,
6801be4f2653e5 Peter Zijlstra  2023-05-31  4374  			   void *freelist_old, void *freelist_new,
6801be4f2653e5 Peter Zijlstra  2023-05-31  4375  			   unsigned long tid)
6801be4f2653e5 Peter Zijlstra  2023-05-31  4376  {
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4377  	struct freelist_tid old = { .freelist = freelist_old, .tid = tid };
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4378  	struct freelist_tid new = { .freelist = freelist_new, .tid = next_tid(tid) };
6801be4f2653e5 Peter Zijlstra  2023-05-31  4379  
b244358e9a1cd6 Vlastimil Babka 2025-11-07 @4380  	return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid,
b244358e9a1cd6 Vlastimil Babka 2025-11-07  4381  					     &old.freelist_tid, new.freelist_tid);
6801be4f2653e5 Peter Zijlstra  2023-05-31  4382  }
6801be4f2653e5 Peter Zijlstra  2023-05-31  4383  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
