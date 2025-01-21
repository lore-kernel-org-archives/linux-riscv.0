Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C597CC0218B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzMtlBFlUgDrkz3mq5ic9hrylONx6F9YCzn9gty9ciY=; b=rhbQfppmP2EsgN
	3vVBoSNJh2UJFxEwje39bcTtsHCBlRd1aUvm12GNPjI7s4nfNoRDh1QBfXobnSr2vuuM/CgeoTTGD
	unuK3Kplw5+9fesykpL4giatmht4awqums//ekMf9IDKA65D4iums3WL8MGRDacf96t6fk33aoeIk
	aG+P+cZoxgNxUg+XTzeQPkZ4d+Z4WxW5HLrTLPKVdBlvThd9tGFrfQYUwIJ/jY2WuFBkz3Ywb1BhO
	OIHm/JbH5+cL3O7eYY6rZVkOQxg9CLqgJMBeN8FW5gNNwPNBAK1XEepBYoekb0ZmaCut1TOIMz/Bx
	HJSMiL95LuI2GPq7kryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFpW-000000089pv-0M94;
	Tue, 21 Jan 2025 15:06:14 +0000
Received: from [192.198.163.15] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFpS-000000089pD-2zRP
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 15:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737471971; x=1769007971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S3o4xpq8tYTaMjstzCaN30PnGEnKrBktJhCmmKimQcw=;
  b=EKNAogOJQ7UX1Ub9qO898pM0sdbfEVW+1Pxk8MrdMqulY5Iyfv2scoxU
   qbKz6RkX5GWZkAfaZpPBjWomFFdhzKEiQcYt03Xnjqy1ffhFtibPvWka9
   H4t/Rresi6So2gQK/YuX6/l0q0pKOgLfkEIMRpF0KfG2SMFxdtllyn5qe
   gJdoeb7HjYKq+c3mKPQHWfPDX5zgvNN/yFOu7pSv2h9UZXORJSFMVoa4y
   RtVSg3PHLDy0ttxZ5Pkp3vBJ/nS0kCx5riMHNG5X/f//j0P/2hzaF3sTi
   YvrUi2bI0iUruCgln/t34AKNhUqmNwwD3epfeGkn3wJdMdJYwpe8sPMkj
   Q==;
X-CSE-ConnectionGUID: Lax7ovvlS661sK+fcBc1bg==
X-CSE-MsgGUID: 6oopqsTUTiqAlYqyedxSRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38052843"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="38052843"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 07:05:51 -0800
X-CSE-ConnectionGUID: 5NiWJB7UTkymc2FPHxSDkw==
X-CSE-MsgGUID: P+6iTQlFReOnqbu/LWYeVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="106948955"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jan 2025 07:05:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taFp2-000YC7-1C;
	Tue, 21 Jan 2025 15:05:44 +0000
Date: Tue, 21 Jan 2025 23:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu,
	charlie@rivosinc.com, cleger@rivosinc.com,
	conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net,
	evan@rivosinc.com, jesse@rivosinc.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	shuah@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom extension and its
 block size
Message-ID: <202501212220.5GHTtuF7-lkp@intel.com>
References: <20250115024024.84365-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115024024.84365-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_070610_784725_3C8F6473 
X-CRM114-Status: GOOD (  13.07  )
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

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.13 next-20250121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunhui-Cui/RISC-V-Enable-cbo-clean-flush-in-usermode/20250115-104456
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20250115024024.84365-3-cuiyunhui%40bytedance.com
patch subject: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
config: riscv-randconfig-r133-20250121 (https://download.01.org/0day-ci/archive/20250121/202501212220.5GHTtuF7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce: (https://download.01.org/0day-ci/archive/20250121/202501212220.5GHTtuF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501212220.5GHTtuF7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/sys_hwprobe.c:284:30: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 1125899906842624 to 0 [-Wconstant-conversion]
     284 |                 if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
         |                     ~~~~~~~~~~~~~~~~       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/uapi/asm/hwprobe.h:76:41: note: expanded from macro 'RISCV_HWPROBE_EXT_ZICBOM'
      76 | #define         RISCV_HWPROBE_EXT_ZICBOM        (1ULL << 50)
         |                                                  ~~~~~^~~~~
   1 warning generated.


vim +284 arch/riscv/kernel/sys_hwprobe.c

   244	
   245	static void hwprobe_one_pair(struct riscv_hwprobe *pair,
   246				     const struct cpumask *cpus)
   247	{
   248		switch (pair->key) {
   249		case RISCV_HWPROBE_KEY_MVENDORID:
   250		case RISCV_HWPROBE_KEY_MARCHID:
   251		case RISCV_HWPROBE_KEY_MIMPID:
   252			hwprobe_arch_id(pair, cpus);
   253			break;
   254		/*
   255		 * The kernel already assumes that the base single-letter ISA
   256		 * extensions are supported on all harts, and only supports the
   257		 * IMA base, so just cheat a bit here and tell that to
   258		 * userspace.
   259		 */
   260		case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
   261			pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
   262			break;
   263	
   264		case RISCV_HWPROBE_KEY_IMA_EXT_0:
   265			hwprobe_isa_ext0(pair, cpus);
   266			break;
   267	
   268		case RISCV_HWPROBE_KEY_CPUPERF_0:
   269		case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
   270			pair->value = hwprobe_misaligned(cpus);
   271			break;
   272	
   273		case RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF:
   274			pair->value = hwprobe_vec_misaligned(cpus);
   275			break;
   276	
   277		case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
   278			pair->value = 0;
   279			if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
   280				pair->value = riscv_cboz_block_size;
   281			break;
   282		case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
   283			pair->value = 0;
 > 284			if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
   285				pair->value = riscv_cbom_block_size;
   286			break;
   287		case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
   288			pair->value = user_max_virt_addr();
   289			break;
   290	
   291		case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
   292			pair->value = riscv_timebase;
   293			break;
   294	
   295		/*
   296		 * For forward compatibility, unknown keys don't fail the whole
   297		 * call, but get their element key set to -1 and value set to 0
   298		 * indicating they're unrecognized.
   299		 */
   300		default:
   301			pair->key = -1;
   302			pair->value = 0;
   303			break;
   304		}
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
