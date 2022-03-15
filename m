Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BC6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JXLD3wBVDr9SQcdIttn6rplou/HSwCrudxBIxheCBI=; b=nBh9pNgE3F3hsP
	/uUuDlWkHE3hWiQuKxDgOX0qyJ0V+CuIJUQRdmnp7g4Je4FtPHm7EkLmWdswy6shSyv6rPD9fDrxS
	ZkU1P45xRGr0SHcbOooapZFL479vIHixb4ogefLs4rpTWacaAoWas4aExRi24HN6LxmNyGNr1R9RV
	CmlrrhpBJja6aj8ppXsuasLlN1UcPAZnZFpuyP3kinOGH69hQpssQ2effBc7bnFoO8bnR//bhR/Sh
	aZPWu9+ySJy2PGZw1VNfYNRE5efWoINLKaBKLVbS5bUWsnarJyjj581lVClf4v5x3kueAVOyVZ850
	l7wWkwUm8R7ybG7a3Hsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU5jM-008vnf-5r; Tue, 15 Mar 2022 11:52:48 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU5j8-008vj0-DM; Tue, 15 Mar 2022 11:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647345154; x=1678881154;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cq4Pk617PcjJPsbbqjl+pk5hh/VfPh2oGmmkdgt4sWc=;
 b=hW/lBPbz03LWbd28ZLr1wphAD6cwNMkBSQ+F0qKdOTKs7vdu8gA7FkYj
 XqOKR3Qa4TkAESRge4oFo2E+NqKmuGol/tS6osotnwnV8U5xIO3+0si03
 dxPh3G7dl4jc5WBBF0yPDmPfI94X62llilgO5bCFRNIn67n7MsY2phVjD
 LpZ84YizzM9h+zoZcTuqFFfk0MmMBOwn1PUL6rafArfso8Kg1gp7SpdCL
 w0qZOaeYA0wsNxkuM9nNuCJ3FIrcoauVv/8+ck+QHJz3sJRyYMIXAC/x7
 RA5M96edPlahyf0zvYEtSQE4yfJbDywvsB6qudZvkxwo7VTweFaydSr2M A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256468401"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="256468401"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 04:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="819749449"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2022 04:52:29 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nU5j2-000AuR-QF; Tue, 15 Mar 2022 11:52:28 +0000
Date: Tue, 15 Mar 2022 19:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Wang <wangqing@vivo.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: kbuild-all@lists.01.org, Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] sched: dynamic config sd_flags if described in DT
Message-ID: <202203151939.NI7Rsold-lkp@intel.com>
References: <1647331137-69890-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1647331137-69890-1-git-send-email-wangqing@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_045234_501518_D3BEDBE1 
X-CRM114-Status: GOOD (  18.86  )
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

Hi Qing,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on driver-core/driver-core-testing tip/sched/core linus/master v5.17-rc8 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Qing-Wang/sched-dynamic-config-sd_flags-if-described-in-DT/20220315-160039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20220315/202203151939.NI7Rsold-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3322560249c42b0a3e719b19842a3ace7d5ffb6a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Qing-Wang/sched-dynamic-config-sd_flags-if-described-in-DT/20220315-160039
        git checkout 3322560249c42b0a3e719b19842a3ace7d5ffb6a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/base/arch_topology.c: In function 'cpus_share_self_cache':
>> drivers/base/arch_topology.c:648:37: error: 'cpu' undeclared (first use in this function)
     648 |                 if (!cache_topology[cpu][cache_level])
         |                                     ^~~
   drivers/base/arch_topology.c:648:37: note: each undeclared identifier is reported only once for each function it appears in


vim +/cpu +648 drivers/base/arch_topology.c

   639	
   640	int cpus_share_self_cache(const struct cpumask *cpu_map)
   641	{
   642		int cache_level, cpu_id;
   643		int first, last;
   644		int id = cpumask_first(cpu_map);
   645		int size = cpumask_weight(cpu_map);
   646	
   647		for (cache_level = 0; cache_level < MAX_CACHE_LEVEL; cache_level++) {
 > 648			if (!cache_topology[cpu][cache_level])
   649				return -1;
   650	
   651			first = -1;
   652			last = id;
   653			for (cpu_id = 0; cpu_id < NR_CPUS; cpu_id++) {
   654				if (cache_topology[cpu][cache_level] == cache_topology[cpu_id][cache_level]) {
   655					if (cpu_id < id || cpu_id >= id + size)
   656						return 0;
   657	
   658					first = (first == -1)?cpu_id:first;
   659					last = cpu_id;
   660				}
   661			}
   662	
   663			if (first == id && last == id + size)
   664				return 1;
   665		}
   666	
   667		return 0;
   668	}
   669	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
