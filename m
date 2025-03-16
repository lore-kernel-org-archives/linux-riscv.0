Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BA3C28B28
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Mar 2025 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6HUZ2pZNJl53tfouQ+6HRudLea657wxpdHRr0L6xbk=; b=SmB8ZyiN5CJoY0
	7mdC16GXcf1XITm5nNhHzN3YCrvdgJktWigWAlwslvY24riwKRBCs1bxoFNqcDpZ0tcRHma0zHlLp
	3m3gbUlP4oqAgC0UWg1HM1/mkfdfXoUzO3kb1zJAU7gZwq4JI5VVO+VDcAL9zYSA335YLbi53E7Zn
	Y7mtGrZ+4U7Xw4crggXd4Tc6W8CMw6sLXvTGgvOku02TQvfxZyrNV8C8VsY7OCbHiR0+rlmbn5sxO
	kA6miRltNWS/njPG2V+HxORHb3t94ag/38vLONy+Z3zDO2Xqcc1maHl9xitK3IF3hCU6fS2KkhxIk
	Elke+vQgFnC1iZDzIvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttcck-0000000H4Ac-1MtT;
	Sun, 16 Mar 2025 01:17:06 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttcci-0000000H4AH-1DnS
	for linux-riscv@lists.infradead.org;
	Sun, 16 Mar 2025 01:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742087824; x=1773623824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SSAZS0Aw8X7I+lmtlf1UTRPtQEiv9h3mzLxk5QChPPc=;
  b=NamVXwHswstUslZr+19l2cUdZUvEj1DVj6gqGQBUTxK6ep47MMBHBplK
   pFQEVT9ubYAGcSk6e2RQ7gQAblnJBul8VIc3z8P4DGgVVgz3R1uIqTTDl
   al9quaW5GtJtL+5vghcWsJOisMM4Y3EnNtpWYO0DhTywIoEwq+opc+cyS
   mImXS0UvBSJ9AxGgqd+VpI5h/3g8dphO1/MqjKIa/ZVunR1uM+exayDbH
   2WUEfC8bPwT5cCB4aztquNQ9Vq4/XUCmn872o91Ised3E2QXJ/9owO9cp
   BPV0Bf+EgYnLBGpEPmDcEkf9ot+/757GyF3ebA5FBq3rE2mEN21x4y298
   Q==;
X-CSE-ConnectionGUID: LMxNitmnSj6umo8A2dcTQw==
X-CSE-MsgGUID: z+6I/50ETTm2s3FQsKgRCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="45977545"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="45977545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 18:16:58 -0700
X-CSE-ConnectionGUID: cWRnzUJ5QriF7b36Uq0b9A==
X-CSE-MsgGUID: ESDT0N2/SLCTX94sQwGBXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="144792764"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2025 18:16:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttccX-000Bkh-1F;
	Sun, 16 Mar 2025 01:16:53 +0000
Date: Sun, 16 Mar 2025 09:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH] riscv: fgraph: Fix stack layout to match
 __arch_ftrace_regs argument of ftrace_return_to_handler
Message-ID: <202503160820.dvqMpH0g-lkp@intel.com>
References: <20250311132243.2178271-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250311132243.2178271-1-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_181704_377061_06310FEB 
X-CRM114-Status: UNSURE (   9.22  )
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

Hi Pu,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc6 next-20250314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pu-Lehui/riscv-fgraph-Fix-stack-layout-to-match-__arch_ftrace_regs-argument-of-ftrace_return_to_handler/20250311-212440
base:   linus/master
patch link:    https://lore.kernel.org/r/20250311132243.2178271-1-pulehui%40huaweicloud.com
patch subject: [PATCH] riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler
config: riscv-randconfig-001-20250316 (https://download.01.org/0day-ci/archive/20250316/202503160820.dvqMpH0g-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160820.dvqMpH0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160820.dvqMpH0g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:1:14: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
   addi sp, sp, -FREGS_SIZE_ON_STACK
                ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
>> <instantiation>:2:17: error: unexpected token
    sw ra, FREGS_RA(sp)
                   ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:3:17: error: unexpected token
    sw s0, FREGS_S0(sp)
                   ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:4:17: error: unexpected token
    sw a0, FREGS_A0(sp)
                   ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:5:17: error: unexpected token
    sw a1, FREGS_A1(sp)
                   ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:6:15: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
    addi s0, sp, FREGS_SIZE_ON_STACK
                 ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:1:16: error: unexpected token
   lw ra, FREGS_RA(sp)
                  ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^
>> <instantiation>:2:17: error: unexpected token
    lw s0, FREGS_S0(sp)
                   ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^
   <instantiation>:3:17: error: unexpected token
    lw a0, FREGS_A0(sp)
                   ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^
   <instantiation>:4:17: error: unexpected token
    lw a1, FREGS_A1(sp)
                   ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^
   <instantiation>:5:15: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
    addi sp, sp, FREGS_SIZE_ON_STACK
                 ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
