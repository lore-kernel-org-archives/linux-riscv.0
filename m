Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEC8C25B76
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2BCffo/mKoXK9Xj+EQEo3mWelmTge2cM4sQpxfj33Y=; b=CokmVCOAJGdnJ/
	iaHE6V1XhyGaF1NX2ar6/0y+sp07bfhM+1U0+FG+EApjR4NLo798VvPspEc9vzMUl5k4XZAhr4QEu
	+I4EU3eNPy5hjQVGSiu9abBKnCtZfGGBdAhywqHbPVoipNB10RZpD/wPipPsVp2EmkDk2W83OHxsz
	t/cqPJkfR+02kvEYdsC2nryUEC4vTFzI45wcGxE5ozuSnIj4MXkZG+84t5GpBWHAte+RYBn8RUn8B
	JCBmrXYUW3C5rMMym22C9zKDz0vMozYenzi4MoxY14Vs2xdc/1+8A5dUbpJAqiRLl31ubsuwGfi4K
	iS+2Th7HJ5fWDpKUYFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDOmi-0000000ChAV-0xWc;
	Sat, 01 Jun 2024 13:28:36 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDOme-0000000Ch9P-2tdN
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 13:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717248513; x=1748784513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D59jnmVQMhCNl55Pkwv0majNLLAp15FV0PALvzWaA2Q=;
  b=E2drzqfcf1Y+iA5L1CpFJ5ckpo0Fx3XcdZj0NbsV5OsOK2glpbOwnLcI
   jxfqQLWugi5GyifIAisj5rIzeBFpqcuTR0DkTifu4/jAmHq+18VUEFvlw
   iVZXfVhrOeUeZX/L3eT0ma/L85fFhwNSDXlLFB4py01dyKjTcw1snvD2N
   XLazCi8OGPqIU29Yuov75+gqxFh9KlOpOfhGQteujCeuTlDVqM5nLS/g7
   kCOf/thQb+fZMsw8AdEOpMiO9/R9J3UIPIqusvFfXySSlEj1TPT6EQ3Le
   rhye9IDC7bFNss/L3a4gnImlYn9DPS8im8CSxIlSz2XKCOoQMQLy2rviL
   Q==;
X-CSE-ConnectionGUID: RRgnZRfsS7m1/EqEYNnAUQ==
X-CSE-MsgGUID: Z/iEq9wMTIK9BpX2GtX5yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="17636691"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="17636691"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 06:28:31 -0700
X-CSE-ConnectionGUID: VUgAXcZJSS2qpLFK8gkM7Q==
X-CSE-MsgGUID: QA43emCHShOWnAJco8uRRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36526002"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jun 2024 06:28:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDOmV-000Iur-2L;
	Sat, 01 Jun 2024 13:28:23 +0000
Date: Sat, 1 Jun 2024 21:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, dev.mbstr@gmail.com,
	samuel.holland@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ruanjinjie@huawei.com
Subject: Re: [PATCH] riscv: stacktrace: Add USER_STACKTRACE support
Message-ID: <202406012109.PDAjXm2i-lkp@intel.com>
References: <20240531083258.386709-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531083258.386709-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_062832_799004_4ECC153C 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/riscv-stacktrace-Add-USER_STACKTRACE-support/20240531-163624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240531083258.386709-1-ruanjinjie%40huawei.com
patch subject: [PATCH] riscv: stacktrace: Add USER_STACKTRACE support
config: riscv-randconfig-r061-20240601 (https://download.01.org/0day-ci/archive/20240601/202406012109.PDAjXm2i-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406012109.PDAjXm2i-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/stacktrace.c:188:16-18: WARNING !A || A && B is equivalent to !A || B

vim +188 arch/riscv/kernel/stacktrace.c

   164	
   165	/*
   166	 * Get the return address for a single stackframe and return a pointer to the
   167	 * next frame tail.
   168	 */
   169	static unsigned long unwind_user_frame(stack_trace_consume_fn consume_entry,
   170					       void *cookie, unsigned long fp,
   171					       unsigned long reg_ra)
   172	{
   173		struct stackframe buftail;
   174		unsigned long ra = 0;
   175		unsigned long __user *user_frame_tail =
   176			(unsigned long __user *)(fp - sizeof(struct stackframe));
   177	
   178		/* Check accessibility of one struct frame_tail beyond */
   179		if (!access_ok(user_frame_tail, sizeof(buftail)))
   180			return 0;
   181		if (__copy_from_user_inatomic(&buftail, user_frame_tail,
   182					      sizeof(buftail)))
   183			return 0;
   184	
   185		ra = reg_ra ? : buftail.ra;
   186	
   187		fp = buftail.fp;
 > 188		if (!ra || (ra && !consume_entry(cookie, ra)))
   189			return 0;
   190	
   191		return fp;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
