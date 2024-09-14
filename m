Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482D3FC618D
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2024 03:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIu6XuzL+KPR/r0tdPSciZ9dm3gMA/76WHirOmVtJdA=; b=w1vIVN4+lIMUts
	0IkjRGYzSrY9MWkzIk7hLcT9mMq7gGamWiOAT4PaqFJxzJZohQ6f8Z/jOFC+fdZxrGWr+7kLgJMV2
	Ap/NsltFKgWUnmSulv/9Snuqu0wXo6HXQpr5/oKwKJM+6JLIP9vbu717KVwWHKOXGBkYMxmDlq9SC
	LID47D4tyvacUwSLewdAWeEirRKJqvMK0ial443lcHfsizx/tpHZGzfh10U8DxX+gSrVi1aOPMcVh
	YiRCuvOUc4kzYGKmNXWjMyQBliVP90/I1nVETvamerVxZi8dBgDKHZe+WES3FKyNhW0GBuuQZBDRM
	uOUwVovaMaFkTs6rz6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spJ7Y-0000000HZ00-0Ml2;
	Sat, 14 Sep 2024 03:06:48 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spJ7V-0000000HYzb-0NT7
	for linux-riscv@lists.infradead.org;
	Sat, 14 Sep 2024 03:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726283205; x=1757819205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VuTTj0+Hf6dafOpC2060LVcxOgfAYGN+KF2rIky5w6c=;
  b=LuwrY/l86vF/r3MwZBOgb6HGG3bVpamGgdiBK4Of0Nx2jmQqYxT1hmXC
   7vlmujWu7oAqzXgvJPlR5//mWLjeY24GIUPMLJZt2Q7c5R4suCc1auZzA
   ESJ1csvgsKrujq8xgLc8nHxZ7GIVtuPaLgtA5OCZ0XLnMFJUodmBO3iJN
   5tH86HVNP/zOkAyIVxu69d9DKM69kxDLOHO+vjEUo5bGCpzobigUQlij1
   Z5AHIFOvbHhZusv/enwVSH+tU3aS9OGEElUnQN5pMP1JDTQpvInf5Dw5w
   Cb7Q2qMsO1b09bomhuGlQRIq0Ziut8cwtj/TW2gn6jmi6801B/ugH3te7
   g==;
X-CSE-ConnectionGUID: vp4iygMuRdij6mOMjuMMiA==
X-CSE-MsgGUID: uUbrq2ZuRUqWaB1Evw3wHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25291139"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25291139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 20:06:44 -0700
X-CSE-ConnectionGUID: dU7HVl+vSZK4EySvvPPaKA==
X-CSE-MsgGUID: 6iQmQ58DSpe1AOImeKqRbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="98958003"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2024 20:06:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spJ7K-0007Is-2t;
	Sat, 14 Sep 2024 03:06:34 +0000
Date: Sat, 14 Sep 2024 11:06:10 +0800
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
Message-ID: <202409141059.SDUgpQw4-lkp@intel.com>
References: <20240912231650.3740732-17-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240912231650.3740732-17-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_200645_203266_DDA78147 
X-CRM114-Status: GOOD (  12.79  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes tip/x86/core robh/for-next arnd-asm-generic/master tip/smp/core kees/for-next/execve linus/master v6.11-rc7]
[cannot apply to akpm-mm/mm-everything next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-Introduce-ARCH_HAS_USER_SHADOW_STACK/20240913-072124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240912231650.3740732-17-debug%40rivosinc.com
patch subject: [PATCH v4 16/30] riscv/shstk: If needed allocate a new shadow stack on clone
config: riscv-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141059.SDUgpQw4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141059.SDUgpQw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141059.SDUgpQw4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> clang diag: arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for function 'get_shstk_base' [-Wmissing-prototypes]
--
   In file included from drivers/gpu/drm/drm_plane.c:23:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/riscv/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/riscv/include/asm/thread_info.h:37:
   In file included from arch/riscv/include/asm/processor.h:17:
>> arch/riscv/include/asm/usercfi.h:44:15: error: no previous prototype for function 'get_shstk_base' [-Werror,-Wmissing-prototypes]
   unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
                 ^
   arch/riscv/include/asm/usercfi.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
   ^
   static 
   1 error generated.
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
   arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for function 'get_shstk_base' [-Wmissing-prototypes]
   unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
                 ^
   arch/riscv/include/asm/usercfi.h:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long get_shstk_base(struct task_struct *task, unsigned long *size)
   ^
   static 
   1 warning generated.
>> clang diag: arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for function 'get_shstk_base' [-Wmissing-prototypes]
>> clang diag: arch/riscv/include/asm/usercfi.h:44:15: warning: no previous prototype for function 'get_shstk_base' [-Wmissing-prototypes]


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
