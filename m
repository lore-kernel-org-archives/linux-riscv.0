Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E8FC3065C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 03:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WwVcbZSbQ83KReIMiI4jOcA8lgEPbPS5iLo6TCg9cw=; b=cXWerjVcoa4BDe
	44vSBq2CTtIJHix1pXSmtmT8aNwAMsUkaqXVcxKe4mLv9h3DHcnfJ7oUwu6o5KfRlrv3zaSQ92uYn
	yqMloW+chFYxbtWUlY/4Fc61TnfUy+DZg3lSkcGXP6xihnyvXG3wkyepgV9kSJTUbqI+yXMgODZys
	JFA7q0/E6AswGHetAFQNVbBJxA4HtFBy4aEzSFJ5kPuhSHG78rNTq5TUcWwnBmNrSG8zBCji1rhz9
	1P7A9HYbhI0N5gJtebgoQt5qoRJxBCqxc/YEpY/b5xbtQpLfEKguDqGMxDJKmleoQ8e5F+6qzOxZJ
	ymXEY7qf89lO37O1M05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPDJY-0000000C2Aq-0Fjl;
	Thu, 04 Jul 2024 03:39:20 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPDJU-0000000C29X-0IJ1
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 03:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720064356; x=1751600356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSZWX0gWlKWv/j9j9F4F3Urou4mvlKJB7ifrwMMcz9w=;
  b=W4BXizSoHL11aIoePohIIHqf8ZgRAdxO+hVY1eAuyouHflmVTkunHGzW
   3TaQj1uPnC9n5MXRlqDTGdjH2keXrkazN/8Cgu1pTZ0sPP9a78nHjC7Mt
   hQ/dkWlvMUsC5z46o+KCEiXJG0EM4UPDKnciic/2AYm5hZcgUIOFZ6Msq
   iZiTFADZL339+3XNycYv5T666thfDFk3ZSawx4slrtp9/yMe1ZQJ5HvB0
   ggYafH1BRM+jp1ldvONfEghVMzfiYYUEQGf4UNmPkpyweVQ4nIgkPOwVN
   //cwQ+0CPozvolyfDqq1R1T6f4G5mpIhtXmuGwvygJY7fyVoHYNUmpjyI
   Q==;
X-CSE-ConnectionGUID: N/aCPIlfR9qVMzfk7ONb0w==
X-CSE-MsgGUID: /Mw0hvHWQAm7ecWlSKExcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="42745993"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="42745993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:39:14 -0700
X-CSE-ConnectionGUID: KPbiy3BOTv2zmQuVt+flyA==
X-CSE-MsgGUID: cc6XAiE4SLqCt3rnpjN/aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46472076"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2024 20:39:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPDJL-000QVm-2I;
	Thu, 04 Jul 2024 03:39:07 +0000
Date: Thu, 4 Jul 2024 11:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <202407041157.odTZAYZ6-lkp@intel.com>
References: <20240626130347.520750-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626130347.520750-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_203916_186760_F65BFE9C 
X-CRM114-Status: GOOD (  14.03  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.10-rc6 next-20240703]
[cannot apply to arnd-asm-generic/master robh/for-next tip/locking/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Implement-cmpxchg32-64-using-Zacas/20240627-034946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20240626130347.520750-2-alexghiti%40rivosinc.com
patch subject: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
config: riscv-randconfig-002-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041157.odTZAYZ6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041157.odTZAYZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:11873:7: error: cannot jump from this asm goto statement to one of its possible targets
                   if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
                       ^
   include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded from macro 'try_cmpxchg'
           raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from macro 'raw_try_cmpxchg'
           ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
                  ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
   #define raw_cmpxchg arch_cmpxchg
                       ^
   arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'arch_cmpxchg'
           _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
           ^
   arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_arch_cmpxchg'
                   __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,      \
                   ^
   arch/riscv/include/asm/cmpxchg.h:144:3: note: expanded from macro '__arch_cmpxchg'
                   asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,            \
                   ^
   kernel/sched/core.c:11840:7: note: possible target of asm goto statement
           if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
                ^
   include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded from macro 'try_cmpxchg'
           raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from macro 'raw_try_cmpxchg'
           ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
                  ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
   #define raw_cmpxchg arch_cmpxchg
                       ^
   arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'arch_cmpxchg'
           _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
           ^
   arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_arch_cmpxchg'
                   __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,      \
                   ^
   arch/riscv/include/asm/cmpxchg.h:161:10: note: expanded from macro '__arch_cmpxchg'
                                                                           \
                                                                           ^
   kernel/sched/core.c:11872:2: note: jump exits scope of variable with __attribute__((cleanup))
           scoped_guard (irqsave) {
           ^
   include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
           for (CLASS(_name, scope)(args),                                 \
                             ^
   kernel/sched/core.c:11840:7: error: cannot jump from this asm goto statement to one of its possible targets
           if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
                ^
   include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded from macro 'try_cmpxchg'
           raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from macro 'raw_try_cmpxchg'
           ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
                  ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
   #define raw_cmpxchg arch_cmpxchg
                       ^
   arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'arch_cmpxchg'
           _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
           ^
   arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_arch_cmpxchg'
                   __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,      \
                   ^
   arch/riscv/include/asm/cmpxchg.h:144:3: note: expanded from macro '__arch_cmpxchg'
                   asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,            \
                   ^
   kernel/sched/core.c:11873:7: note: possible target of asm goto statement
                   if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
                       ^
   include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded from macro 'try_cmpxchg'
           raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
           ^
   include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from macro 'raw_try_cmpxchg'
           ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
                  ^
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
   #define raw_cmpxchg arch_cmpxchg
                       ^
   arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'arch_cmpxchg'
           _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
           ^
   arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_arch_cmpxchg'
                   __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,      \
                   ^
   arch/riscv/include/asm/cmpxchg.h:161:10: note: expanded from macro '__arch_cmpxchg'
                                                                           \
                                                                           ^
   kernel/sched/core.c:11872:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
           scoped_guard (irqsave) {
           ^
   include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
           for (CLASS(_name, scope)(args),                                 \
                             ^
   2 errors generated.


vim +11873 kernel/sched/core.c

223baf9d17f25e Mathieu Desnoyers 2023-04-20  11821  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11822  static void sched_mm_cid_remote_clear(struct mm_struct *mm, struct mm_cid *pcpu_cid,
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11823  				      int cpu)
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11824  {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11825  	struct rq *rq = cpu_rq(cpu);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11826  	struct task_struct *t;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11827  	int cid, lazy_cid;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11828  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11829  	cid = READ_ONCE(pcpu_cid->cid);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11830  	if (!mm_cid_is_valid(cid))
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11831  		return;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11832  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11833  	/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11834  	 * Clear the cpu cid if it is set to keep cid allocation compact.  If
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11835  	 * there happens to be other tasks left on the source cpu using this
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11836  	 * mm, the next task using this mm will reallocate its cid on context
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11837  	 * switch.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11838  	 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11839  	lazy_cid = mm_cid_set_lazy_put(cid);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11840  	if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11841  		return;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11842  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11843  	/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11844  	 * The implicit barrier after cmpxchg per-mm/cpu cid before loading
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11845  	 * rq->curr->mm matches the scheduler barrier in context_switch()
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11846  	 * between store to rq->curr and load of prev and next task's
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11847  	 * per-mm/cpu cid.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11848  	 *
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11849  	 * The implicit barrier after cmpxchg per-mm/cpu cid before loading
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11850  	 * rq->curr->mm_cid_active matches the barrier in
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11851  	 * sched_mm_cid_exit_signals(), sched_mm_cid_before_execve(), and
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11852  	 * sched_mm_cid_after_execve() between store to t->mm_cid_active and
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11853  	 * load of per-mm/cpu cid.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11854  	 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11855  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11856  	/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11857  	 * If we observe an active task using the mm on this rq after setting
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11858  	 * the lazy-put flag, that task will be responsible for transitioning
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11859  	 * from lazy-put flag set to MM_CID_UNSET.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11860  	 */
0e34600ac9317d Peter Zijlstra    2023-06-09  11861  	scoped_guard (rcu) {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11862  		t = rcu_dereference(rq->curr);
0e34600ac9317d Peter Zijlstra    2023-06-09  11863  		if (READ_ONCE(t->mm_cid_active) && t->mm == mm)
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11864  			return;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11865  	}
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11866  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11867  	/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11868  	 * The cid is unused, so it can be unset.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11869  	 * Disable interrupts to keep the window of cid ownership without rq
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11870  	 * lock small.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11871  	 */
0e34600ac9317d Peter Zijlstra    2023-06-09  11872  	scoped_guard (irqsave) {
223baf9d17f25e Mathieu Desnoyers 2023-04-20 @11873  		if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
223baf9d17f25e Mathieu Desnoyers 2023-04-20  11874  			__mm_cid_put(mm, cid);
0e34600ac9317d Peter Zijlstra    2023-06-09  11875  	}
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  11876  }
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  11877  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
