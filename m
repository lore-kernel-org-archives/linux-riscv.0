Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16EBC3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 21:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Afj75w/tuJ2q8pyJ2BsiYMg151/aeE6D6EUUO8gqc74=; b=L3hqs6D5TpoHWc
	T43C7+OAq8rc6hBv9S4FLz66I6zfJfPYgO0ryWavAiDylGfGUlvijP/RAtbw/Pxu1OXUa8vbwW9Pl
	Ikb1gmc63kqmGJAffoquiUq+p1P0LlEX2JdsZEsvJJ92x3vrUuEAPt819W4XIaR406tEVsCcWPSdT
	1ogeumpDiKcZlI3jyKngSEzX8r2xLebqkXGmmjpUwDjkNflRKJAYeR9P+CPNiuUBqYyxJWUWaWFHs
	fn/gAfaIzmOkscbp51FO/ziyUHhyQzvV0xBwC5oLkEEWqmqen732RQuEQbJ3GvkUToPl6p8t1ts2A
	uWaQckik6cna00Cobb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZzjc-0000000A6Qg-3XGL;
	Fri, 02 Aug 2024 21:22:48 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZzjY-0000000A6OX-1xTw
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 21:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722633764; x=1754169764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=68g9t3xwE/x8Utm3R0R2KDyytx3UwsMziaDerOfK+hE=;
  b=mGx1+ct8oz5qIcaFi+8xg3E7lEyH3iiuR8thK3QA1igrBLQT2JciJJQM
   HYFmkaKfdxC7pltDAfmHj1+LvzcFeaBxad8w+qf9LOE9g/7PBLn+R0gED
   YN2qktzzlA7JghqldmCUzLrTl9CW5QTKuxZxEe7+oPwBdA3MfETGnyVNm
   yMpRwvfHc7IT4nDuzVy55q7yhICfkg2fv7AMahmEkPEU4yKLfbuLIhGr1
   yJMPGuDljkNSDb7mtAc+madapU7VDexrfPLqp1F1kMKrPAMm/puajAe0E
   mHshTxhtLCHo5jKgaBKiewgPDjd58xTBqW0+0rFfGoW23f0kVrpCv9pkR
   Q==;
X-CSE-ConnectionGUID: qk0PJi/9RyGkHDAUMO2HaQ==
X-CSE-MsgGUID: nQ5tcNLHQIeSwjZ13uRO/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20787198"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="20787198"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 14:22:28 -0700
X-CSE-ConnectionGUID: HtIKt9R6QRK4jLykuPHEbQ==
X-CSE-MsgGUID: Ei855qBCRBK+yYArkRHdsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="55409890"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2024 14:22:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZzjC-000xRg-2H;
	Fri, 02 Aug 2024 21:22:22 +0000
Date: Sat, 3 Aug 2024 05:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V2 2/3] riscv: mm: Add soft-dirty page tracking support
Message-ID: <202408030546.nd9jmMe3-lkp@intel.com>
References: <20240731040444.3384790-3-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731040444.3384790-3-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_142244_576843_0B596133 
X-CRM114-Status: UNSURE (   9.87  )
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

Hi Chunyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunyan-Zhang/riscv-mm-Prepare-for-reuse-PTE-RSW-bit-9/20240801-231628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240731040444.3384790-3-zhangchunyan%40iscas.ac.cn
patch subject: [PATCH V2 2/3] riscv: mm: Add soft-dirty page tracking support
config: riscv-kismet-CONFIG_PROC_PAGE_MONITOR-CONFIG_MEM_SOFT_DIRTY-0-0 (https://download.01.org/0day-ci/archive/20240803/202408030546.nd9jmMe3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240803/202408030546.nd9jmMe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030546.nd9jmMe3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PROC_PAGE_MONITOR when selected by MEM_SOFT_DIRTY
   WARNING: unmet direct dependencies detected for PROC_PAGE_MONITOR
     Depends on [n]: PROC_FS [=y] && MMU [=n]
     Selected by [y]:
     - MEM_SOFT_DIRTY [=y] && CHECKPOINT_RESTORE [=y] && HAVE_ARCH_SOFT_DIRTY [=y] && PROC_FS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
