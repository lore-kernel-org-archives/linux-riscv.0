Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D054C47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DN2XNGxrgaz7LxWAsoDuKT1T9o7Qy72mfkudlDdcrng=; b=pXcver2I4Qd3Jx
	NdDnW9pnjqnQPjS3esaP4Lf7IjUdaFHD85KTxwnjyYI7PXr9vao7nO8zSvSn2L0u1s2P451TzHQMN
	P4dBkBzL5H5v/kfn/R9B4MKdQQw6ZxF6Ets+xxdXfaP8JeMTQnvlqpSsXFxTh35GzpDlYOlVKAy5i
	ybH5NwCrUOI+JgDuINNm2Ban0MZd82RkPctXZEQauOYu4SpkLe1d18dzSiGEC8xI3TM5Xx6OFezuQ
	8T+Z7a7RFXGYNOobltlfhf5GevRFiIdynUi7sD9fMtp/58sX3P7OL5hdlJRmxL0hPyW9VKTzyd8Xh
	KB6XvPh3Q3IJ3oTMCChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU9Qh-0000000AAq5-3zAP;
	Sun, 28 Jan 2024 17:58:51 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU9Qe-0000000AApV-2Nlu;
	Sun, 28 Jan 2024 17:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706464729; x=1738000729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5cEP+zWFr/nlAcAv00WyKAUSHk9AI618LLTjG1LtvxI=;
  b=LJEU9Qb4ea//NM9/6Q4nyLKZecKBQXYoCqNEZ5ODM5jZRdFebSla7ij8
   ZGCJHgCL5YyfukX4eEl/XH80qGc7H7D9gnSKjbCJyeqTqG8pdW4qmQ+uf
   zT4fq3aNWSTcawqtHH7oD/1BRMPfLK0ec0nxBjaE3bUgYP7bIuO4Dlh0B
   wbqjpYqyupwewrfWCA5WF1Th+VJmPgWg9tNKZKrjmWzxC9MxvdGJx/v5b
   IcpgxTy7amoBJaZqMosMc2R9082uPVAELgVMj2W0TQxW4VzGudIoqGncm
   1xUeZKAUIQgOHhJRzXKsUiLBVje0ncuHnnIgLmU3MYq6uwCeLbCslAk51
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2683769"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2683769"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 09:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="737165941"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="737165941"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jan 2024 09:58:35 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU9QP-0003cs-1f;
	Sun, 28 Jan 2024 17:58:33 +0000
Date: Mon, 29 Jan 2024 01:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	patches@amperecomputing.com, rafael@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	yury.norov@gmail.com, kuba@kernel.org, vschneid@redhat.com,
	mingo@kernel.org, akpm@linux-foundation.org, vbabka@suse.cz,
	rppt@kernel.org, tglx@linutronix.de, jpoimboe@kernel.org,
	ndesaulniers@google.com, mikelley@microsoft.com,
	mhiramat@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH] init: refactor the generic cpu_to_node for NUMA
Message-ID: <202401290116.GpUOCzGd-lkp@intel.com>
References: <20240118031412.3300-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118031412.3300-1-shijie@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_095848_740573_B937E3BB 
X-CRM114-Status: GOOD (  11.09  )
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240129/202401290116.GpUOCzGd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290116.GpUOCzGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290116.GpUOCzGd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cpu_to_node
   >>> referenced by main.c:880 (init/main.c:880)
   >>>               init/main.o:(start_kernel) in archive vmlinux.a
   >>> referenced by main.c:1542 (init/main.c:1542)
   >>>               init/main.o:(kernel_init_freeable) in archive vmlinux.a
   >>> referenced by core.c:550 (arch/x86/events/amd/core.c:550)
   >>>               arch/x86/events/amd/core.o:(amd_pmu_cpu_prepare) in archive vmlinux.a
   >>> referenced 179 more times
--
>> ld.lld: error: undefined symbol: _cpu_to_node
   >>> referenced by main.c:1542 (init/main.c:1542)
   >>>               init/main.o:(kernel_init_freeable) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
