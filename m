Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FFEC04A6A
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/mP5d42P9Xuyw6BK6ZE6UHdfDxKriph0ynQpZuK+pI=; b=ekV1lZjd0BtzJp
	TOb1hbJ1Oy0qmY94AzjFYG18EzMfQPaMhNvhScDJtcFPNWFsm9CN7ufR+z0ejMrhsnJLh2UpJnlgg
	wrNviqBbtEnl6IbuWKEx47LtK14nBt5RfSDpM9/fE+lxC+wlYhpbZdHwhLuQT0gw9FCbGRoXSstIo
	u66C1MbEDHO3ImEWn4GGbo6LyajSO4TaNwlRnB2Gr8G5hb0RXmDntWo3fpipeCrNyo5R+ZU0PMFAR
	4K0pyG+uFZgfUCu8qHCOwqU2KMDZRS6vZQt59qV2w4bVRFrurmNUXBq03ufWliju7ZceHnJ6mvE0R
	uid4hXS0ADFWENxs8fnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUpj9-00DZWK-1N;
	Sat, 12 Aug 2023 14:36:27 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUpj6-00DZVb-1P
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 14:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691850984; x=1723386984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R7NRsqEtZsZwqqRfMkes7tldaRARTKA/e6Mek0FrHvo=;
  b=VoqdlemeX4tBUWqEtVgHzMxxAxWY/d9VWRfeBGebbeDpxUexyKFWKV9C
   HaSdgJBMLeaANKSnk20g2X/XVh11sVmCzOZ362UaUdNtyp3PEt3PgVx3o
   Je8Ecsvu68poTbHAxgp8vndu60ZKOTudZmoUqfRI7d2W/AFn3BGKPLver
   7BYsgx+EDp+oF2FODrgJfZ1JmWEw9WlqTAgcwbT7XvajaJBPE/nWUPGRL
   DwZb4E+LzrP0Y+knjQvg4IzpwBa2hpFYMccMGINZ7yAYfp1hmsrpF5kxW
   L564H4cXjjeg1Irl9o/8R8Gst58Tw7dV/FLsbGUKshK+7fR5B9qtXmHJj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="435724847"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="435724847"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 07:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="762473293"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="762473293"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Aug 2023 07:36:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUpix-0008ca-19;
	Sat, 12 Aug 2023 14:36:15 +0000
Date: Sat, 12 Aug 2023 22:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 1/5] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <202308122238.XLMMmeL0-lkp@intel.com>
References: <20230811233556.97161-8-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811233556.97161-8-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_073624_552609_AF1D24AC 
X-CRM114-Status: UNSURE (   9.08  )
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

Hi Sami,

kernel test robot noticed the following build errors:

[auto build test ERROR on 52a93d39b17dc7eb98b6aa3edb93943248e03b2f]

url:    https://github.com/intel-lab-lkp/linux/commits/Sami-Tolvanen/riscv-VMAP_STACK-overflow-detection-thread-safe/20230812-073751
base:   52a93d39b17dc7eb98b6aa3edb93943248e03b2f
patch link:    https://lore.kernel.org/r/20230811233556.97161-8-samitolvanen%40google.com
patch subject: [PATCH 1/5] riscv: VMAP_STACK overflow detection thread-safe
config: riscv-randconfig-r042-20230812 (https://download.01.org/0day-ci/archive/20230812/202308122238.XLMMmeL0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308122238.XLMMmeL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308122238.XLMMmeL0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __per_cpu_offset
   >>> referenced by arch/riscv/kernel/entry.o:(handle_kernel_stack_overflow) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
