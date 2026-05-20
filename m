Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A05ECD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 00:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06Cm/2D3Cslki3wILiexDSQXFQfcJdm4aLQEBouV0CQ=; b=y1aI3VzN1bxL9w
	h3G5r2goqsr2NXUe8/mafAmDOJo2vzxEMhOJ8XhANh4ER+BhXw0mC7j6Xdq29EKOw0EJgpEW0FNW6
	7cw+mz44V9aexq6JApjpwPzrYDnZCXoEi58erjySnhdLKd7wfW81Conwj/rczVisQ4zfGiRAtC5kA
	diF/xVVzBHC173zFpZq4fNm+4Adipv14dcvXjF+9N8cKCo+XNCnhY7jIEeaU+ybeHSbbwTLLVqrxm
	UFQyc0d/SMDMK/SQuWq+olTp13lv4fxeKpnbaBJDsbuP7JHX6jYsy2+ZKalMImwcFfXYBxHhMLbP1
	H7J0LNoeYgHRjKrtFoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPV41-00000003Ard-2vcd;
	Wed, 20 May 2026 00:45:33 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPV3y-00000003Aqz-0UTQ
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 00:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779237930; x=1810773930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4PsJnTUON22Goo6tlt1Y6Ak2MmT6eI/0fKJ8ErFBhuE=;
  b=k1gri4zX/KjaxvTfPY/9mLhI35tZvWgmMtlTYercpR1XkhzQ9o/QeKKl
   y64CfdaE5Q1GvLSuB6AlySFXV6vZtkHqNbXaPL27EJKVfHa5P3LVuAZcN
   pOoInIpqWsJ4G86ZwRP43fHnWXf+ALt1V0CUAflURuE8NpWHGPTACcwhc
   fkgmHPFLBKipsELBsb0xhKSFf4nZVCcNGq8AEssMMpeqLBrNI5C2sipvl
   dZoOLQstmpAUoGIiJBKNv9OquAHCRv4xSyBNUkSBrwgDIf6JMQuNQs+7I
   8smMFhVb8ZJybJJ6ct5EEd4AbTezhnyPsx/FFUIVbD/ZiBUeqIsDAGo7/
   w==;
X-CSE-ConnectionGUID: XD9EdJsIR9SAIisEATa8BQ==
X-CSE-MsgGUID: laGlKKuKRaaJn2W9smIeCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79278663"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79278663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 17:45:29 -0700
X-CSE-ConnectionGUID: ru2WZgRgTHWJ/t+PIDF9fQ==
X-CSE-MsgGUID: xBgstxrHRcuEgw8AFD+H3A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 19 May 2026 17:45:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPV3s-00000000AOD-2r4h;
	Wed, 20 May 2026 00:45:24 +0000
Date: Wed, 20 May 2026 02:45:02 +0200
From: kernel test robot <lkp@intel.com>
To: Milan Tripkovic <milant2002@gmail.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, kees@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, alex@ghiti.fr, andy@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, Dusan.Stojkovic@rt-rk.com,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: Re: [PATCH v5 2/2] lib/string_kunit: extend benchmarks and unit test
 to memcmp()
Message-ID: <202605200211.1iDJR97h-lkp@intel.com>
References: <20260519140029.1190381-3-milant2002@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519140029.1190381-3-milant2002@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_174530_199722_2150EB47 
X-CRM114-Status: GOOD (  11.02  )
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

Hi Milan,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on next-20260519]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Milan-Tripkovic/riscv-lib-add-memcmp-implementation/20260519-221028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20260519140029.1190381-3-milant2002%40gmail.com
patch subject: [PATCH v5 2/2] lib/string_kunit: extend benchmarks and unit test to memcmp()
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260520/202605200211.1iDJR97h-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200211.1iDJR97h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200211.1iDJR97h-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/lib/memcmp.S: Assembler messages:
>> arch/riscv/lib/memcmp.S:58: Error: unrecognized opcode `rev8 t1,t1', extension `zbb' or `zbkb' required
>> arch/riscv/lib/memcmp.S:59: Error: unrecognized opcode `rev8 t2,t2', extension `zbb' or `zbkb' required
   arch/riscv/lib/memcmp.S:85: Error: unrecognized opcode `rev8 t1,t1', extension `zbb' or `zbkb' required
   arch/riscv/lib/memcmp.S:86: Error: unrecognized opcode `rev8 t2,t2', extension `zbb' or `zbkb' required


vim +58 arch/riscv/lib/memcmp.S

    12	
    13	/* int memcmp(const void *cs, const void *ct, size_t n) */
    14	SYM_FUNC_START(memcmp)
    15	/*
    16	 * Parameters
    17	 *	a0 - Pointer to first memory block (cs), also return value
    18	 *	a1 - Pointer to second memory block (ct)
    19	 *	a2 - Number of bytes to compare (n), decremented during loop
    20	 *
    21	 * Returns
    22	 *	a0 - 0 if equal, positive if cs > ct, negative if cs < ct
    23	 *
    24	 * Clobbers
    25	 *	t0, t1, t2, t3, t4
    26	 */
    27		add	t3, a0, a2
    28		or	t0, a0, a1
    29		andi	t0, t0, (SZREG - 1)
    30		bnez	t0, 5f
    31	
    32		addi	t4, t3, -SZREG
    33		bltu	t4, a0, 7f
    34	
    35	1:
    36		REG_L	t1, 0(a0)
    37		REG_L	t2, 0(a1)
    38		bne	t1, t2, 2f
    39		addi	a0, a0, SZREG
    40		addi	a1, a1, SZREG
    41		bleu	a0, t4, 1b
    42	
    43	#if defined(CONFIG_TOOLCHAIN_HAS_ZBB)
    44	7:
    45		__ALTERNATIVE_CFG("j 5f", "nop", 0, RISCV_ISA_EXT_ZBB,
    46				  IS_ENABLED(CONFIG_RISCV_ISA_ZBB))
    47	
    48		beq	a0, t3, 4f
    49		REG_L	t1, 0(a0)
    50		REG_L	t2, 0(a1)
    51	
    52		sub	t0, t3, a0
    53		li	t4, SZREG
    54		sub	t0, t4, t0
    55		slli	t0, t0, 3
    56	
    57	#ifndef CONFIG_CPU_BIG_ENDIAN
  > 58		rev8	t1, t1
  > 59		rev8	t2, t2
    60	#endif
    61		srl	t1, t1, t0
    62		srl	t2, t2, t0
    63	
    64		bne	t1, t2, 8f
    65		li	a0, 0
    66		ret
    67	#else
    68		j	5f
    69	#endif
    70	5:
    71		beq	a0, t3, 4f
    72	6:
    73		lbu	t1, 0(a0)
    74		lbu	t2, 0(a1)
    75		bne	t1, t2, 3f
    76		addi	a0, a0, 1
    77		addi	a1, a1, 1
    78		bne	a0, t3, 6b
    79	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
