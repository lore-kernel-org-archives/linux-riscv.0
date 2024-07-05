Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C4C3271E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORqngote1rN2m18m1BqGTpoNHT/CGXPxYs9sKoIqZGE=; b=G+EOjN+sSDhdDk
	Mplrsr+x3a+0rwmgw+BL1FSLk4SHQsn13kpUjnDvxvEI8T7SJ8b/OpOlHbiPTS/55mQYpKEM/GMlB
	/VYiljw5cyEVE+U5ZXyZnoir3w4WLK+YVH0lJbmIHLx30AbcQMSzs8np/QYi4CABOJm8UVv7FD7Jl
	BBiTayn1TxVUMnX23s5sBEVOimRNdm34CABA+MDpt8Zj73tsjG9fN5h5CG4nIJl/dgJd0AgbXPRHC
	5ux7Ru5CzRS6Z2Pt9LJHmw2KNNGJUBh9Rc+bNUrnFFAFujU+VLlnQIdNEAYUMy17IuQIGx/eX4tJ6
	fbcy+IkTH4bUYxsOKg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmj0-0000000GXlm-0DZO;
	Fri, 05 Jul 2024 17:27:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmiw-0000000GXko-2px8
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 17:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AA0762BB1;
	Fri,  5 Jul 2024 17:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC732C116B1;
	Fri,  5 Jul 2024 17:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720200473;
	bh=UFVPAqRzqVT/p6Fkd12jSpwFaK0O3pMzpk6h3778Y08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+GP2NpY0ut/WIX+ybo8MYYpHvTp8h6a8vetEwsE/CbsZlhV+S991AWIZQb+Jg+40
	 Xub3zFx2IpPojnRyBNL0MkZVtnDZt1V/zZhl2sEeONoOWw7jyoGc9lHYogye7A1WBo
	 AUHbhFUiJizR4/QRRv0a+vBtq65BJGzTWnCT2Szffa42qipZHQBkX0x4WA8bnciHcB
	 UPLGQqqHEWbqWMA7tm9Mn/iIcyaFG654UF2ohEHfnpUJ+60mEL8CkilSUEoc8wGBlu
	 bIOKp4D2LiBLowXpcxchn5BGGI1OhqAU8JU1YXF57oGQbB9lLjEY0fx8VJDrSuQL0R
	 KLTiruSZV+s+A==
Date: Fri, 5 Jul 2024 10:27:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <20240705172750.GF987634@thelio-3990X>
References: <20240626130347.520750-2-alexghiti@rivosinc.com>
 <202407041157.odTZAYZ6-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202407041157.odTZAYZ6-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_102754_850095_97A5EFF5 
X-CRM114-Status: GOOD (  16.87  )
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

On Thu, Jul 04, 2024 at 11:38:46AM +0800, kernel test robot wrote:
> Hi Alexandre,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on soc/for-next]
> [also build test ERROR on linus/master v6.10-rc6 next-20240703]
> [cannot apply to arnd-asm-generic/master robh/for-next tip/locking/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Implement-cmpxchg32-64-using-Zacas/20240627-034946
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> patch link:    https://lore.kernel.org/r/20240626130347.520750-2-alexghiti%40rivosinc.com
> patch subject: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
> config: riscv-randconfig-002-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041157.odTZAYZ6-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041157.odTZAYZ6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/sched/core.c:11873:7: error: cannot jump from this asm goto statement to one of its possible targets
>                    if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
>                        ^
>    include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded from macro 'try_cmpxchg'
>            raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>            ^
>    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from macro 'raw_try_cmpxchg'
>            ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>                   ^
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
>    #define raw_cmpxchg arch_cmpxchg
>                        ^
>    arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'arch_cmpxchg'
>            _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
>            ^
>    arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_arch_cmpxchg'
>                    __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,      \
>                    ^
>    arch/riscv/include/asm/cmpxchg.h:144:3: note: expanded from macro '__arch_cmpxchg'
>                    asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,            \
>                    ^
>    kernel/sched/core.c:11840:7: note: possible target of asm goto statement
>            if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
>                 ^
>    include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded from macro 'try_cmpxchg'
>            raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>            ^
>    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from macro 'raw_try_cmpxchg'
>            ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>                   ^
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
>    #define raw_cmpxchg arch_cmpxchg
>                        ^
>    arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'arch_cmpxchg'
>            _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
>            ^
>    arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_arch_cmpxchg'
>                    __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,      \
>                    ^
>    arch/riscv/include/asm/cmpxchg.h:161:10: note: expanded from macro '__arch_cmpxchg'
>                                                                            \
>                                                                            ^
>    kernel/sched/core.c:11872:2: note: jump exits scope of variable with __attribute__((cleanup))
>            scoped_guard (irqsave) {
>            ^
>    include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
>            for (CLASS(_name, scope)(args),                                 \
>                              ^
>    kernel/sched/core.c:11840:7: error: cannot jump from this asm goto statement to one of its possible targets
>            if (!try_cmpxchg(&pcpu_cid->cid, &cid, lazy_cid))
>                 ^
>    include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded from macro 'try_cmpxchg'
>            raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>            ^
>    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from macro 'raw_try_cmpxchg'
>            ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>                   ^
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
>    #define raw_cmpxchg arch_cmpxchg
>                        ^
>    arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'arch_cmpxchg'
>            _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
>            ^
>    arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_arch_cmpxchg'
>                    __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,      \
>                    ^
>    arch/riscv/include/asm/cmpxchg.h:144:3: note: expanded from macro '__arch_cmpxchg'
>                    asm goto(ALTERNATIVE("nop", "j %[zacas]", 0,            \
>                    ^
>    kernel/sched/core.c:11873:7: note: possible target of asm goto statement
>                    if (try_cmpxchg(&pcpu_cid->cid, &lazy_cid, MM_CID_UNSET))
>                        ^
>    include/linux/atomic/atomic-instrumented.h:4880:2: note: expanded from macro 'try_cmpxchg'
>            raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>            ^
>    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from macro 'raw_try_cmpxchg'
>            ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
>                   ^
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from macro 'raw_cmpxchg'
>    #define raw_cmpxchg arch_cmpxchg
>                        ^
>    arch/riscv/include/asm/cmpxchg.h:212:2: note: expanded from macro 'arch_cmpxchg'
>            _arch_cmpxchg((ptr), (o), (n), ".rl", "", "     fence rw, rw\n")
>            ^
>    arch/riscv/include/asm/cmpxchg.h:189:3: note: expanded from macro '_arch_cmpxchg'
>                    __arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,      \
>                    ^
>    arch/riscv/include/asm/cmpxchg.h:161:10: note: expanded from macro '__arch_cmpxchg'
>                                                                            \
>                                                                            ^
>    kernel/sched/core.c:11872:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
>            scoped_guard (irqsave) {
>            ^
>    include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
>            for (CLASS(_name, scope)(args),                                 \
>                              ^
>    2 errors generated.

Ugh, this is an unfortunate interaction with clang's jump scope analysis
and asm goto in LLVM releases prior to 17 :/

https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment-1645979992

Unfortunately, 'if (0)' does not prevent this (the analysis runs early
in the front end as far as I understand it), we would need to workaround
this with full preprocessor guards...

Another alternative would be to require LLVM 17+ for RISC-V, which may
not be the worst alternative, since I think most people doing serious
work with clang will probably be living close to tip of tree anyways
because of all the extension work that goes on upstream.

I am open to other thoughts though.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
