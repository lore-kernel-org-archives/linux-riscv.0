Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E61C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 17:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OouTsOvjTSFlyFL5f0cywEr83brG9gvXTdC+zzVVTQ=; b=NiFGhRDWeb0x5/
	qN3GNFeAEujZw2/Fd77dftIMWBaWnTfhSwjGHMTMeL2ziDEdzY+WjacB5Ajd4xW6gNS9g+JcJiOJp
	8uS/Ss9Vhne91WH2hyCwCTtvoKk2Qk+pZ2eaLE591cN37sXG56PNPPQXQdlhFGrqWn8ZRynrSLNee
	M7LtXznO+ocEtu5JGTKt284jDGIvrrxbjySpp9SHJce2r0UrOlN9urHnSskc55Mr+ktkZUGj1jsy7
	lOS8TufjJTI+3M3dSZcNHGKh/LzTLItLtxhmbUv2NyyprVBZh+7RZcMsCWjhzwJu3pWIGncvqCHtV
	d5iYgEb9kDWvYde+KRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmGrO-00000009SpQ-0GaC;
	Mon, 18 Mar 2024 17:33:18 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmGrK-00000009SnJ-1bfW
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 17:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710783195; x=1742319195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1hmrVQaRTbW0zKlfKJKDoA4Vhe70kFEXF9wECjSBBb8=;
  b=mMCDWT5hOKq3/Tw0wWv73tr6pIkdS/9zJA72KDxDhndYf7NR/babKPcT
   Fdcxpi/XitFE46/vSpq2Yf9bNFccbiveds2HpFarzo14vzorSV/wH50/a
   Yxqo5Afa87i90h+UEpJzMLUc7n8gNwt2PHnJbTWSR1B4r4nX5rf8VxhXc
   nO0Yc1E/ToskMtP/cxhU/4BD2YI4cor1BVKm1GMDt+KKC9VLrXs+eMeLi
   GjgbCOYUtww2NqhLuz7ndtNehGUtMYRRGgVDUuwbkAeDUl/4kVxZUcvRe
   vwwmDOWgMHeRVJArndexvj6mk3TpNuUnZSTKiMFR90mylNUDyfkRX1usw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5741747"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5741747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 10:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13501548"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2024 10:33:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmGrC-000H8N-1L;
	Mon, 18 Mar 2024 17:33:06 +0000
Date: Tue, 19 Mar 2024 01:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Joel Granados <j.granados@samsung.com>
Subject: Re: [PATCH v3 7/7] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <202403190142.8MfCnioh-lkp@intel.com>
References: <20240318-zve-detection-v3-7-e12d42107fa8@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240318-zve-detection-v3-7-e12d42107fa8@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_103315_346357_933F44C5 
X-CRM114-Status: GOOD (  16.10  )
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on 099dbac6e90c620d8ce0bbf75bbdc94da1feb4fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-vector-add-a-comment-when-calling-riscv_setup_vsize/20240318-184348
base:   099dbac6e90c620d8ce0bbf75bbdc94da1feb4fb
patch link:    https://lore.kernel.org/r/20240318-zve-detection-v3-7-e12d42107fa8%40sifive.com
patch subject: [PATCH v3 7/7] riscv: vector: adjust minimum Vector requirement to ZVE32X
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240319/202403190142.8MfCnioh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403190142.8MfCnioh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403190142.8MfCnioh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/process.c: In function 'arch_release_task_struct':
>> arch/riscv/kernel/process.c:181:24: error: 'ZVE32X' undeclared (first use in this function)
     181 |         if (has_vector(ZVE32X))
         |                        ^~~~~~
   arch/riscv/kernel/process.c:181:24: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/process.c: In function 'copy_thread':
   arch/riscv/kernel/process.c:228:24: error: 'ZVE32X' undeclared (first use in this function)
     228 |         if (has_vector(ZVE32X))
         |                        ^~~~~~
--
   arch/riscv/kernel/signal.c: In function 'restore_sigcontext':
>> arch/riscv/kernel/signal.c:191:41: error: 'ZVE32X' undeclared (first use in this function)
     191 |                         if (!has_vector(ZVE32X) || !riscv_v_vstate_query(regs) ||
         |                                         ^~~~~~
   arch/riscv/kernel/signal.c:191:41: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/signal.c: In function 'get_rt_frame_size':
   arch/riscv/kernel/signal.c:213:24: error: 'ZVE32X' undeclared (first use in this function)
     213 |         if (has_vector(ZVE32X)) {
         |                        ^~~~~~
   arch/riscv/kernel/signal.c: In function 'setup_sigcontext':
   arch/riscv/kernel/signal.c:286:24: error: 'ZVE32X' undeclared (first use in this function)
     286 |         if (has_vector(ZVE32X) && riscv_v_vstate_query(regs))
         |                        ^~~~~~
--
   arch/riscv/kernel/sys_hwprobe.c: In function 'hwprobe_isa_ext0':
>> arch/riscv/kernel/sys_hwprobe.c:72:24: error: 'v' undeclared (first use in this function)
      72 |         if (has_vector(v))
         |                        ^
   arch/riscv/kernel/sys_hwprobe.c:72:24: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kernel/sys_hwprobe.c:119:32: error: 'ZVE32X' undeclared (first use in this function)
     119 |                 if (has_vector(ZVE32X)) {
         |                                ^~~~~~
--
   In file included from kernel/sched/core.c:78:
   kernel/sched/core.c: In function 'context_switch':
>> arch/riscv/include/asm/switch_to.h:81:24: error: 'ZVE32X' undeclared (first use in this function)
      81 |         if (has_vector(ZVE32X))                 \
         |                        ^~~~~~
   kernel/sched/core.c:5400:9: note: in expansion of macro 'switch_to'
    5400 |         switch_to(prev, next, prev);
         |         ^~~~~~~~~
   arch/riscv/include/asm/switch_to.h:81:24: note: each undeclared identifier is reported only once for each function it appears in
      81 |         if (has_vector(ZVE32X))                 \
         |                        ^~~~~~
   kernel/sched/core.c:5400:9: note: in expansion of macro 'switch_to'
    5400 |         switch_to(prev, next, prev);
         |         ^~~~~~~~~


vim +/ZVE32X +181 arch/riscv/kernel/process.c

   177	
   178	void arch_release_task_struct(struct task_struct *tsk)
   179	{
   180		/* Free the vector context of datap. */
 > 181		if (has_vector(ZVE32X))
   182			riscv_v_thread_free(tsk);
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
