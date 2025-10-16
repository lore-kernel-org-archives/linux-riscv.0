Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8781CCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 06:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RbvTwttvTEVwHUe2JgvXsmrtoiUgRk+MoN3dr1m6PE=; b=ABrEQa8cVabo3J
	I7JDVl8gfCw/lvaChQ8VlKCFhSlIUqzauXG0gCibMh8IbcWI5oAxCp/rHBde/Bb12vCD207GDdfvf
	/iaa76o9q/HW735cnNp6G3Dj7KXvzA9Rwc2Nmg78zbKki/77A9KOUB0qJ1u9j/RvcGAOB7KKrCa6G
	Ao9SSsvD0bOVswj1LVYFao4tOGJVLrlG4q6LYE0qirfpky9E3IVSbE6T7Wm7oBwtV8uMDl9K0UIYt
	3qFu519EKh9a/8u5WUpktqlRR40WZbfa/l/HmR6U7cMb716ZG/iIdYlaoU9GazpbtyfqJxH41UHUn
	2XcW4lpO3nfWdfcwbApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H5T-00000003Z2G-1ZzQ;
	Thu, 16 Oct 2025 06:03:43 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H5Q-00000003Z1O-1KTZ
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 06:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760594620; x=1792130620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DYGH30jDUAm4j6nu3ucbB5T9mziY602oEn8yT04F0JA=;
  b=NodCEh8G5rDS9S2rXe5ER+mzuqc8tw9EBXB1jl8rrTCssYxyOuXzj8Tz
   IvG6v96YBBuuj2u2IAVRlEvEeW2R2t5Xa1aaA90ItwiS04UbsOXW6ly7b
   qEBjus9/8CfPeO2NWb6a/XtYQpi4MoaJTrlftPL3juI4cXzPonSJWZCY1
   UgspZtr09IPZD3Uly0pmVH39XpV2IDKvnQbc8lvT/R8JIUbFGX0sC/x7L
   ONSc64hWEYgTduQJnrWWfbIRcJ7Nw3GJqPVsr06SQShyci5M6+/BmHM6V
   JCWVAm4w+VtQO/JpPGhHooSSH1tiy5rtPDayWAGouibmTJuBdoSCKeLcZ
   Q==;
X-CSE-ConnectionGUID: pL6K6YCARxm0AEjqNnyQ2w==
X-CSE-MsgGUID: eCP0uv+uTFabYobsyU3R6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80218691"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="80218691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 23:03:37 -0700
X-CSE-ConnectionGUID: 4GHeEhqXSz+sg/B4aDp9JA==
X-CSE-MsgGUID: Ej4lsW2CQdOabrhXE7/3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182040085"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Oct 2025 23:03:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9H5I-0004Vz-0c;
	Thu, 16 Oct 2025 06:03:32 +0000
Date: Thu, 16 Oct 2025 14:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yuan Tan <tanyuan@tinylab.org>, arnd@arndb.de, masahiroy@kernel.org,
	nathan@kernel.org, palmer@dabbelt.com, linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, i@maskray.me, tanyuan@tinylab.org,
	falcon@tinylab.org, ronbogo@outlook.com, z1652074432@gmail.com,
	lx24@stu.ynu.edu.cn
Subject: Re: [PATCH v2 6/8] compiler.h: introduce PUSHSECTION macro to
 establish proper references
Message-ID: <202510161337.2Vym0Pmn-lkp@intel.com>
References: <40854460DE090346+c30007da67d26ae0e8651732f32a8ede4926db14.1760463245.git.tanyuan@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40854460DE090346+c30007da67d26ae0e8651732f32a8ede4926db14.1760463245.git.tanyuan@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_230340_407141_526A7C76 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi Yuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on arnd-asm-generic/master linus/master v6.18-rc1 next-20251015]
[cannot apply to masahiroy-kbuild/for-next masahiroy-kbuild/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuan-Tan/scripts-syscalltbl-sh-add-optional-used-syscalls-argument-for-syscall-trimming/20251015-181934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/40854460DE090346%2Bc30007da67d26ae0e8651732f32a8ede4926db14.1760463245.git.tanyuan%40tinylab.org
patch subject: [PATCH v2 6/8] compiler.h: introduce PUSHSECTION macro to establish proper references
config: sh-randconfig-002-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161337.2Vym0Pmn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161337.2Vym0Pmn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161337.2Vym0Pmn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sh4-linux-ld:./arch/sh/kernel/vmlinux.lds:2: syntax error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
