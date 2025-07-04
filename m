Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAA2C83030
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 02:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSDGN90LI7NgZzGeNw+GtyLWx3j/oOePj7ZzrO1udmc=; b=NS0g+qHcmOuQHX
	bwWER/1vWmhzB2Oy1fxKSrZD+sQ8OzDa1TNC/W4ZXkGn0pt3Mv+9YFl5zYU+rtZkYguTJtow6qTm3
	woKnuozl0SdPgW99zIqNsd0iU2qMUMZsKPaAdC2PnC+bm2P41NvlmgesQX8xJW3glj3pM8G8kNf6t
	Ek9V2sz5dI9UkqCeoSNMCdBhT1CsCvrGOjHr2kD7NXjpLP4+yLyldTr+hM1vLArIZJb8aJotbZdaJ
	D6ogoS3tdfFox5UO3fF/YVEiGDmpq/l8FGGQFaDKZYbJE+i0EzXi8TRgYLPwJ9Q55mORDpxi1+dTC
	oXrgkspbfXVsi6fOhCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXW4s-0000000D43W-4AUn;
	Fri, 04 Jul 2025 02:23:02 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXW4q-0000000D42z-15Af
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 02:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751595781; x=1783131781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Heuj4A3C9IpnhfL/sGEreqQAnEu9NfzBteqR00oA0BY=;
  b=I/LDfYZkJQFmQitABjN8z31DDR/g65tUYBuKaepajonS2svGOBPzCgSV
   7/5aqTQdLRnG3bMxZOjAVm3jfvgB27YLEAtkvDQ9yI357VBXhBpCXsR8t
   b3bowyN7vtHsuhQqgmn3rgs1CoihYhYh9bTqZWVBOJDqPOSCVjwReOkiA
   JxrQrd0lxZq+y+TXvVbFeBMOLFB4gIqcY9HVOAewWyXFb8CiuMTBcCDXw
   lAlQy7SGLZthrJ34TPBX8bxHAGGCwhdTu59OpQ/Js6387NUvvZtVjFW9o
   pK6GSJHPMJi/kosZDrdyEzMAUXva0Xv/vhRlOUbVXjZw3yJAhVObC2cfk
   Q==;
X-CSE-ConnectionGUID: UrzhLJNVRbug8DzaHnhuew==
X-CSE-MsgGUID: 3U8uY9H/Qcup6JKgUpAXpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54047708"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="54047708"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 19:22:55 -0700
X-CSE-ConnectionGUID: CaCjBhAARrmmXq04FuFiuQ==
X-CSE-MsgGUID: n9d6ikfgRrqsaNx2N9fcpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154610043"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2025 19:22:52 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXW4f-0003Dn-2P;
	Fri, 04 Jul 2025 02:22:49 +0000
Date: Fri, 4 Jul 2025 10:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: ChenMiao <chenmiao.ku@gmail.com>,
	Linux RISCV <linux-riscv@lists.infradead.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, chenmiao <chenmiao.ku@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
Message-ID: <202507041001.7eWJmB1g-lkp@intel.com>
References: <20250703084818.394491-1-chenmiao.ku@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250703084818.394491-1-chenmiao.ku@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_192300_358285_4174B2B9 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi ChenMiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ChenMiao/riscv-ftrace-Fix-the-logic-issue-in-DYNAMIC_FTRACE-selection/20250703-165308
base:   linus/master
patch link:    https://lore.kernel.org/r/20250703084818.394491-1-chenmiao.ku%40gmail.com
patch subject: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
config: riscv-kismet-CONFIG_DYNAMIC_FTRACE-CONFIG_RISCV-0-0 (https://download.01.org/0day-ci/archive/20250704/202507041001.7eWJmB1g-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250704/202507041001.7eWJmB1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041001.7eWJmB1g-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE when selected by RISCV
   

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
