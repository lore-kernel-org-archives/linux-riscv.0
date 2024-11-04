Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B69D132A2
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7aUGHwnfXjmrttY/QWHRV284Hq/lFhfKeOQ3yl8cu8=; b=RuYWoAk6wfMrkr
	B+OpbRwhlZJnX1eJLplMeWdvpU3O9bcxZyxDGgsAidpRqqt6faDfi6+2W02B1ITKTB19jHXeDKkam
	YlpdHq5KfbBxM2/5J71guEmAdCakAxdE9DtYrUXhk4rQ/J8o/y3fU9v5QG09jUPD6V4sy6AobxV5m
	SGCkgHDfPSYFhYvsESsWTt8MKTo12TJyXS+f8HPdKdcZMDJNMjwipaQ3CQasRbJAZMonQSjHbThm+
	dLKRyl0XHjo0KrOPnHN28M6x2Dj9iFNYJbzYGfHnm2xGkssYvS0ZoJuvf3Vy56EpE8lWqlsJOxBAl
	CeEOTf7p/LWtVqDj9F3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t7b-0000000D6l5-1OIz;
	Mon, 04 Nov 2024 09:11:39 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t1G-0000000D5Gt-0r8M
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 09:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730711106; x=1762247106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YxpTatOZCyamBYTrl1KGmff6TcW5/0IaMURbSuA1bRs=;
  b=S3SuE4ZAXJ2qiNvAKhcaPzduGajS3Lt+dw4ZMM5IAdM5HYy1ZuquAVjy
   +qkVHSafTPshB3RCO1Q69OTVohAlVfVD49C2aJozQgA4sLkxHSYXJy+94
   4snZqsvida4/vLe0q+1qphgih+bUwVS3szjSiKSm2XfDJsmyx37yxZ+FH
   1rB2o+5SlSCxoJJ65bqzXmWeSkwBbKi8/vTkwGPTPC0sKYVZT9V55fn3W
   /iZMMRctP2Zj0RMizyfgjKNyito2xfz4RT61cIzE7CfRFvAn0ifn/QzyT
   czwNwD1oiPC7AlDaTtqFMZhmEBnw27mIMtVu3y2fat3J7bC3SEcZjlrny
   g==;
X-CSE-ConnectionGUID: +0GiA7A7QPifOSkuvSsSdw==
X-CSE-MsgGUID: hkUkhwt2QPCrQINp+W8hpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="55797123"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="55797123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 01:05:05 -0800
X-CSE-ConnectionGUID: ebv1R6qRT+2i4k8PHCqdPw==
X-CSE-MsgGUID: Mf8Ep902TI2Ai7UY3aK1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83523755"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Nov 2024 01:04:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7t16-000kfn-0q;
	Mon, 04 Nov 2024 09:04:56 +0000
Date: Mon, 4 Nov 2024 17:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
Message-ID: <202411041609.gxjI2dsw-lkp@intel.com>
References: <20241103145153.105097-14-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241103145153.105097-14-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_010506_316889_4F0F7854 
X-CRM114-Status: GOOD (  13.27  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on robh/for-next tip/locking/core linus/master v6.12-rc6]
[cannot apply to next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Move-cpufeature-h-macros-into-their-own-header/20241103-230614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20241103145153.105097-14-alexghiti%40rivosinc.com
patch subject: [PATCH v6 13/13] riscv: Add qspinlock support
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041609.gxjI2dsw-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/include/asm/spinlock.h: asm/ticket_spinlock.h is included more than once.
>> arch/riscv/include/asm/spinlock.h: asm/qspinlock.h is included more than once.

vim +10 arch/riscv/include/asm/spinlock.h

     8	
     9	#define __no_arch_spinlock_redefine
  > 10	#include <asm/ticket_spinlock.h>
    11	#include <asm/qspinlock.h>
    12	#include <asm/jump_label.h>
    13	
    14	/*
    15	 * TODO: Use an alternative instead of a static key when we are able to parse
    16	 * the extensions string earlier in the boot process.
    17	 */
    18	DECLARE_STATIC_KEY_TRUE(qspinlock_key);
    19	
    20	#define SPINLOCK_BASE_DECLARE(op, type, type_lock)			\
    21	static __always_inline type arch_spin_##op(type_lock lock)		\
    22	{									\
    23		if (static_branch_unlikely(&qspinlock_key))			\
    24			return queued_spin_##op(lock);				\
    25		return ticket_spin_##op(lock);					\
    26	}
    27	
    28	SPINLOCK_BASE_DECLARE(lock, void, arch_spinlock_t *)
    29	SPINLOCK_BASE_DECLARE(unlock, void, arch_spinlock_t *)
    30	SPINLOCK_BASE_DECLARE(is_locked, int, arch_spinlock_t *)
    31	SPINLOCK_BASE_DECLARE(is_contended, int, arch_spinlock_t *)
    32	SPINLOCK_BASE_DECLARE(trylock, bool, arch_spinlock_t *)
    33	SPINLOCK_BASE_DECLARE(value_unlocked, int, arch_spinlock_t)
    34	
    35	#elif defined(CONFIG_RISCV_QUEUED_SPINLOCKS)
    36	
    37	#include <asm/qspinlock.h>
    38	
    39	#else
    40	
  > 41	#include <asm/ticket_spinlock.h>
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
