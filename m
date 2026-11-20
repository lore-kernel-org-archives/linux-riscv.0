Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0B1606A33E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hV3JhqYe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O96Vy4qJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ii7/j8A5imdknKt8YJKpBmZZdlBzq//GhbT9pksOscY=; b=hV3JhqYemZJL9YDTMbrV1FioGL
	OOC7y8bApPJK7l1kOd7NgEY+eTHjsMugGWisgYWeZZYUv2+LSZA28mb1TnAXq09rAMUvtXReYr1vG
	v4/WDzzd6hEZJRkIh3ftwOavnJ/U2WJnWcGuxkFSU0EpCLBHtRWRS+OKdmpMW01xi8IvAsAQj4N6U
	VfoRhm/iaHXfobMV9IvWt9EiLdbtves4MKoYy5MI6wuD0WV1nJxMZ5W2lxCBTB4ER6Reg0AArxY1T
	u9Yl6tmAPXfxY8GYZv0/QwC5LHpdd0Ef8otHozscRszpzzgJMXD2+QVQslRco5mIM4Spg2kOMtN+b
	Y4pou+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUDR-0000000G4mo-1vo9;
	Fri, 20 Nov 2026 19:24:09 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUD6-0000000G4fy-3bCG;
	Fri, 20 Nov 2026 19:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795202629; x=1826738629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1NiJp6d9VgMIwxcRAsooN0LZHNBFTQODfOi8K94dGo=;
  b=O96Vy4qJo8dWPMlDYdEKQqxyBSv0NdPIbYfs+Iy4ch4eRb2wSi7yPbCf
   zPqMedjDILlwgmGTsoVmSaONdyMiz0PwjLL9S7TFQKK57Cj5xSDMwPPgK
   2NW2Q4MxlhynIiKg8RAqoxf2nfEdvxNG/1fXWIMzs3DLMZg9iYmtAlFoy
   5METQrQdcW+jzSIylDHVxlFzWevgIr6tPLEVkXlFZMPCGWQXUF6oSU+5W
   7kJepAOektCeWykxsD/iSP9TXN0I7aO4XKTFU2iUvFMjlV6fmWFPlrX1s
   W1+KL+4l6K4RuYio4VvhJdM6FzWvwCmNFZV8EzXQ92H9bPWCr0X67EGOt
   w==;
X-CSE-ConnectionGUID: RZ8Mn8gASNOIjry+BwvXIQ==
X-CSE-MsgGUID: E2+7hgd8TIOZY8KHWTpAXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3971348"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3971348"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:23:46 -0800
X-CSE-ConnectionGUID: IcMig1jkS+a4yth9PVQCqQ==
X-CSE-MsgGUID: +iLoEhuvQbKE8PRygMOlvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10991760"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2026 11:23:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUUCu-00000001IN5-05op;
	Fri, 20 Nov 2026 19:23:36 +0000
Date: Sat, 21 Nov 2026 03:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com,
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, beeman@rivosinc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vikram Singh <vikram.singh3@oss.qualcomm.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v5 5/7] riscv: pmu: Add driver for Control Transfer
 Records Ext
Message-ID: <202611210338.qHaMzDp7-lkp@intel.com>
References: <20261118095053.3871267-6-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118095053.3871267-6-vikram.singh3@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112353_868197_46C87FF5 
X-CRM114-Status: GOOD (  12.47  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vikram,

kernel test robot noticed the following build errors:

[auto build test ERROR on peterz-queue/sched/core]
[also build test ERROR on perf-tools-next/perf-tools-next perf-tools/perf-tools robh/for-next linus/master v7.4-rc3 next-20261116]
[cannot apply to tip/perf/core acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vikram-Singh/perf-Increase-the-maximum-number-of-branches-remove_loops-can-process/20261118-152047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
patch link:    https://lore.kernel.org/r/20261118095053.3871267-6-vikram.singh3%40oss.qualcomm.com
patch subject: [PATCH v5 5/7] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20261121/202611210338.qHaMzDp7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 67ab6538dff0ed2593b90166214d93e992c74905)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611210338.qHaMzDp7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611210338.qHaMzDp7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/mm/tlbflush.c:76:3: error: call to undeclared function 'sbi_remote_sfence_vma_asid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      76 |                 sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
         |                 ^
   arch/riscv/mm/tlbflush.c:76:3: note: did you mean 'sbi_remote_fence_i'?
   arch/riscv/include/asm/sbi.h:756:19: note: 'sbi_remote_fence_i' declared here
     756 | static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
         |                   ^
   arch/riscv/mm/tlbflush.c:112:3: error: call to undeclared function 'sbi_remote_sfence_vma_asid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     112 |                 sbi_remote_sfence_vma_asid(cmask, start, size, asid);
         |                 ^
   2 errors generated.
--
>> arch/riscv/errata/andes/errata.c:30:16: error: variable has incomplete type 'struct sbiret'
      30 |         struct sbiret ret;
         |                       ^
   arch/riscv/errata/andes/errata.c:30:9: note: forward declaration of 'struct sbiret'
      30 |         struct sbiret ret;
         |                ^
>> arch/riscv/errata/andes/errata.c:36:8: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      36 |         ret = sbi_ecall(ANDES_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
         |               ^
   2 errors generated.
--
>> drivers/acpi/riscv/cpuidle.c:73:14: error: use of undeclared identifier 'SBI_HSM_SUSP_NON_RET_BIT'
      73 |         if (state & SBI_HSM_SUSP_NON_RET_BIT)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/acpi/riscv/cppc.c:31:16: error: field has incomplete type 'struct sbiret'
      31 |         struct sbiret ret;
         |                       ^
   drivers/acpi/riscv/cppc.c:31:9: note: forward declaration of 'struct sbiret'
      31 |         struct sbiret ret;
         |                ^
>> drivers/acpi/riscv/cppc.c:38:6: error: use of undeclared identifier 'sbi_spec_version'
      38 |         if (sbi_spec_version >= sbi_mk_version(2, 0) &&
         |             ^~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/cppc.c:38:26: error: call to undeclared function 'sbi_mk_version'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      38 |         if (sbi_spec_version >= sbi_mk_version(2, 0) &&
         |                                 ^
>> drivers/acpi/riscv/cppc.c:39:6: error: call to undeclared function 'sbi_probe_extension'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      39 |             sbi_probe_extension(SBI_EXT_CPPC) > 0) {
         |             ^
>> drivers/acpi/riscv/cppc.c:53:14: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |         data->ret = sbi_ecall(SBI_EXT_CPPC, SBI_CPPC_READ,
         |                     ^
   drivers/acpi/riscv/cppc.c:61:14: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |         data->ret = sbi_ecall(SBI_EXT_CPPC, SBI_CPPC_WRITE,
         |                     ^
>> drivers/acpi/riscv/cppc.c:115:11: error: call to undeclared function 'sbi_err_map_linux_errno'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     115 |                         return sbi_err_map_linux_errno(data.ret.error);
         |                                ^
   drivers/acpi/riscv/cppc.c:156:29: error: call to undeclared function 'sbi_err_map_linux_errno'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     156 |                 return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
         |                                           ^
   8 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ERRATA_ANDES
   Depends on [n]: RISCV_SBI [=n]
   Selected by [y]:
   - ARCH_ANDES [=y] && MMU [=y]


vim +/sbi_remote_sfence_vma_asid +76 arch/riscv/mm/tlbflush.c

18d2199d81054f Anup Patel        2023-03-28  70  
95594cb40c6e01 Christoph Hellwig 2019-08-21  71  void flush_tlb_all(void)
95594cb40c6e01 Christoph Hellwig 2019-08-21  72  {
9546f00410ed88 Samuel Holland    2024-03-26  73  	if (num_online_cpus() < 2)
9546f00410ed88 Samuel Holland    2024-03-26  74  		local_flush_tlb_all();
9546f00410ed88 Samuel Holland    2024-03-26  75  	else if (riscv_use_sbi_for_rfence())
9d4e8d5fa7dbbb Alexandre Ghiti   2023-10-30 @76  		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
dc892fb443224d Samuel Holland    2024-03-26  77  	else
dc892fb443224d Samuel Holland    2024-03-26  78  		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
95594cb40c6e01 Christoph Hellwig 2019-08-21  79  }
95594cb40c6e01 Christoph Hellwig 2019-08-21  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
