Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6825C47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 19:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHH4O9lGG2RuuCp60NPU7XPm7TpiMlocdAOYQghq7HU=; b=y7h0ggzC9lBgHy
	zZ9Hp1JvVkOQa6IY2OM1LpsACiuWkvtIqSKh9o1wDQR9hq5tI24+TVsTLcdb3KWxXyxTGUNQuWWuj
	97PsxH6HfIhuMiOi4Cs4nRh5Qsw7pzH1hOYhUaHQljXUwD5Q+58kOSAl5xGPihQeKLKeNh4L+E80x
	kE/UMS4T0DnY4ptEJrUljtJAUqPj4XiEG5p1RCDdv8PtfdzDnMP9a/nj1F8cC4feX0xtRduivWIYc
	dzpqDwQZUjS28XK9Vs/bSHs0Nd9IQE1qAQudktgC1KA6n8juvSXa3ezCZPfHmkYEn5pbb26bwOynP
	CSx10Yvu3GzLElPCIUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUB4K-0000000AOCq-22e2;
	Sun, 28 Jan 2024 19:43:52 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUB4H-0000000AOCH-1yS9;
	Sun, 28 Jan 2024 19:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706471029; x=1738007029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gAznsvvIw+2Ntm0oZe02zil1LYT+hELlj3+NPCQBn34=;
  b=VLWdvGGO3sfM9FZePpI1qNyh24yzq8JJ5XfaeTb395xXeSm4U5ILw9hS
   O6GZ9gVVh/bf+gQ0FJN7AT8bp5pabPxk1KvAHCkDPUN9HSjDcT0GytGk9
   Ewppv+cjAsZBfbMksXwhNkBcnaL698b/TBC7eOscdWdr0z7KAG6K+QI+l
   v86FIAEUJR4kUn3fBFE6O6IhRPrQK/nj/vaYzAqz++Jg5Tn9EHzevLNRv
   CWFL8/HRKEr2nvbNCGfzuR4fCknxSoKv7EqFo+7tl9C07PMMC45kNCV6p
   gY/wfmxHzyE0Kl9a1Hbdhhb/emaif242bQFVkdMJYfsLwZKPE4GheZ2+7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="393233511"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393233511"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 11:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="930888327"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="930888327"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2024 11:43:38 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUB43-0003hO-31;
	Sun, 28 Jan 2024 19:43:35 +0000
Date: Mon, 29 Jan 2024 03:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, patches@amperecomputing.com,
	rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, yury.norov@gmail.com, kuba@kernel.org,
	vschneid@redhat.com, mingo@kernel.org, akpm@linux-foundation.org,
	vbabka@suse.cz, rppt@kernel.org, tglx@linutronix.de,
	jpoimboe@kernel.org, ndesaulniers@google.com,
	mikelley@microsoft.com, mhiramat@kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH] init: refactor the generic cpu_to_node for NUMA
Message-ID: <202401290316.0eu1Mue2-lkp@intel.com>
References: <20240118031412.3300-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118031412.3300-1-shijie@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_114349_627316_E85938DE 
X-CRM114-Status: GOOD (  13.12  )
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

Hi Huang,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.8-rc1 next-20240125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huang-Shijie/init-refactor-the-generic-cpu_to_node-for-NUMA/20240118-111802
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240118031412.3300-1-shijie%40os.amperecomputing.com
patch subject: [PATCH] init: refactor the generic cpu_to_node for NUMA
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240129/202401290316.0eu1Mue2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290316.0eu1Mue2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290316.0eu1Mue2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `amd_pmu_cpu_prepare':
>> arch/x86/events/amd/core.c:549: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `amd_alloc_nb':
   arch/x86/events/amd/core.c:507: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `amd_uncore_ctx_init':
>> arch/x86/events/amd/uncore.c:476: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `allocate_shared_regs':
>> arch/x86/events/intel/core.c:4520: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `intel_cpuc_prepare':
   arch/x86/events/intel/core.c:4561: undefined reference to `cpu_to_node'
   ld: vmlinux.o:arch/x86/events/intel/core.c:4538: more undefined references to `cpu_to_node' follow
   ld: vmlinux.o: in function `smp_prepare_cpus_done':
>> init/main.c:1542: undefined reference to `_cpu_to_node'
   ld: vmlinux.o: in function `check_timer':
>> arch/x86/kernel/apic/io_apic.c:2169: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `kvm_alloc_cpumask':
>> arch/x86/kernel/kvm.c:687: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `fork_idle':
>> kernel/fork.c:2826: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `cpus_share_numa':
>> kernel/workqueue.c:6768: undefined reference to `cpu_to_node'
>> ld: kernel/workqueue.c:6768: undefined reference to `cpu_to_node'
   ld: vmlinux.o:kernel/workqueue.c:6748: more undefined references to `cpu_to_node' follow


vim +549 arch/x86/events/amd/core.c

21d59e3e2c403c arch/x86/events/amd/core.c           Sandipan Das    2022-04-21  544  
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  545  static int amd_pmu_cpu_prepare(int cpu)
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  546  {
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  547  	struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  548  
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11 @549  	cpuc->lbr_sel = kzalloc_node(sizeof(struct er_account), GFP_KERNEL,
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  550  				     cpu_to_node(cpu));
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  551  	if (!cpuc->lbr_sel)
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  552  		return -ENOMEM;
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  553  
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  554  	WARN_ON_ONCE(cpuc->amd_nb);
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  555  
32b62f446827f6 arch/x86/events/amd/core.c           Peter Zijlstra  2016-03-25  556  	if (!x86_pmu.amd_nb_constraints)
95ca792c7582fd arch/x86/events/amd/core.c           Thomas Gleixner 2016-07-13  557  		return 0;
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  558  
c079c791c5a062 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-11-25  559  	cpuc->amd_nb = amd_alloc_nb(cpu);
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  560  	if (cpuc->amd_nb)
95ca792c7582fd arch/x86/events/amd/core.c           Thomas Gleixner 2016-07-13  561  		return 0;
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  562  
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  563  	kfree(cpuc->lbr_sel);
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  564  	cpuc->lbr_sel = NULL;
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  565  
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  566  	return -ENOMEM;
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  567  }
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  568  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
