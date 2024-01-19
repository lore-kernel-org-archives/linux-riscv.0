Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BC6C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDcRhiePJD1WK5YTWvNjkxAbd2z7iDhVzuwv3fe4h5g=; b=L3j9a2fmHd7M6N
	LG+auAuzrOuQVzWqdvmMtSPeEGiEUzn3E8UbIWcFao2fJFmxpAtzWg0a51N3lPFfF6lWLwiJHyMVK
	c1SuvYY632oZpoDFk2FDzGAXqyeoC8WW9eHp0AW3FXk/KYU9VvzQMvXQ0LktT/LjLcYtjb4uKCprq
	kuiAbn+l1w19dSHSOm4q/Ai1YnnSAQYKCzbXVcMyG4zd1rVG+AmXromjZ4poMKQzKo4ROx28ahkCA
	GL4eQl6x/Yi/8lyJrY1EOamucRztVr/NwL6yfmzIL/IKoXhW7WMr95D/exec7hiSx2tKl8EPZKJHa
	kIVi/oyB18zb7Wf68YCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQro8-00686a-12;
	Fri, 19 Jan 2024 16:33:28 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQro5-00685S-31;
	Fri, 19 Jan 2024 16:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705682005; x=1737218005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4MTHcTMRo8vaC78u9KaJGas7GabALp0/v9oyhzhuUno=;
  b=h2RMJIYmJ1S3g8j8Wgfye9qX4yZ8Bd/Sk606fkNoh/oQ+XCuyafbL5MO
   VGU77k7/gjo/H308xfBwXxmZeCclUVy+eVS/+5wpFjbrQ7pUPrnxci4zy
   2x7siIG0Rrd815u5G6WmTEf7LL6mn/E85/15tGI/PyjLJw2/rf/rzBSqj
   sZboZBapg0tPF3C16+AMjkMc28fhOphRz4kt7yaeWzIiQbcssHm/2nh81
   ylPDFTwNNFMyRhyjk4bHHGoobCDqTDeZuNtZxhBsisTEgcYq3oN7JcKmL
   IlwOGVoI5ErBxzahLgHfOX7ZIf4BJFG8SRB6TtG6mtC0fVLg52KK+yuw9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="676887"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="676887"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 08:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="27082145"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2024 08:33:09 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQrnm-0004Fy-2T;
	Fri, 19 Jan 2024 16:33:06 +0000
Date: Sat, 20 Jan 2024 00:32:24 +0800
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
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <202401200006.wOMN1YgH-lkp@intel.com>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240119033227.14113-1-shijie@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_083326_013361_BFDADDEA 
X-CRM114-Status: GOOD (  11.04  )
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
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus akpm-mm/mm-everything linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huang-Shijie/NUMA-Early-use-of-cpu_to_node-returns-0-instead-of-the-correct-node-id/20240119-113623
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240119033227.14113-1-shijie%40os.amperecomputing.com
patch subject: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the correct node id
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240120/202401200006.wOMN1YgH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200006.wOMN1YgH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200006.wOMN1YgH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `rapl_cpu_online':
>> rapl.c:(.text+0x75ec): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `amd_pmu_cpu_prepare':
>> core.c:(.text+0x8580): undefined reference to `cpu_to_node'
>> ld: core.c:(.text+0x85d6): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `amd_uncore_ctx_init.part.0':
>> uncore.c:(.text+0xc3bd): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `intel_cpuc_prepare':
>> (.text+0x129ee): undefined reference to `cpu_to_node'
   ld: vmlinux.o:(.text+0x12a71): more undefined references to `cpu_to_node' follow
   ld: vmlinux.o: in function `kernel_init_freeable':
>> main.c:(.init.text+0x1240): undefined reference to `_cpu_to_node'
   ld: vmlinux.o: in function `check_timer':
>> io_apic.c:(.init.text+0x1ec1d): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `kvm_alloc_cpumask':
>> kvm.c:(.init.text+0x21678): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `fork_idle':
>> (.init.text+0x28fe2): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `cpus_share_numa':
>> workqueue.c:(.init.text+0x2a4c8): undefined reference to `cpu_to_node'
>> ld: workqueue.c:(.init.text+0x2a4d8): undefined reference to `cpu_to_node'
   ld: vmlinux.o:workqueue.c:(.init.text+0x2a7bc): more undefined references to `cpu_to_node' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
