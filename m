Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A23CD37AC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 02:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w18jBQvrb4LF3nAR90mgC9MS7ZCeuz1/1UFfhfdR5C0=; b=EJIQBs7nHYVLip
	UzRXOT0175g+OK2Kp/212dYFjMnxrRRYDeMzx83+yWmWhEeEOFZTTsRlNg4zQFowlWTCpSHv2rMe5
	7YmjiSXDpfQ9I/aeejfSjPSw4awLKzzcve4h4bN+5EtN/5MW+TqUIRVFTsqDi948GHH4502AZXl/w
	3flFNxfJvT1PQ7HEyE82yPsfRRQ9lVwDAUapY+BuJ3lOrlixElXdWB/EJWSqmN2iAaSb90TsH3E3p
	2bWVl5tpxJglsGPiWMjx/MYuOmPnSvpD/CzQhzLCq/Smcm8pJMVlQJUKur0JV4kDymQe0+SeAmtpD
	9OIy14Gdfj/6ElX4GcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLlP-00000004MID-22PD;
	Thu, 14 May 2026 02:25:27 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNLlM-00000004MHX-2Gew
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 02:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778725524; x=1810261524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/pf7isI3byc11rrABu6e8n7Zzxos23Sk/PCCBbiveVs=;
  b=DLjCX2u8iXmHb7rKf8MZtXYuMRKkJsOnlR+jO0UapnXcxVlRGcb1E6tk
   1n0Sa7quvPXCrm5mies/b/m2fqeezsE3gsZ3GNd7yfolNpWMo5RDbzcWW
   yCh8GHYp1/KQ4NLXFF1qdrOKjf1zgEDVn0enr+NPi0pbYLkWgJWNVWUEy
   TA+PFr9HJ0lAr3d+aRksTOIkKXQWoBwx63YnM3MWiNC4l/S7Lnnr2Q+eI
   2aDiB+93/CE/qcRskm+g4/KbDkkCOubBi+ClO8oQPmxl5Dt0htt/mgGPR
   XsxGnwHVJA4x+jF1m5pVeX59lguDGIjDIsMUnHdK1Aj+6SZnovFKB4DQP
   g==;
X-CSE-ConnectionGUID: ffcleLFdS3SFn1eP7JyKXg==
X-CSE-MsgGUID: 5fl+ozicTG6l/q8wxtCzAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79644671"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79644671"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 19:25:23 -0700
X-CSE-ConnectionGUID: BBnIGDTxRGOlXd/jFfeYVQ==
X-CSE-MsgGUID: 3Gn9w2a6QSKk7gNLQ9LT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="231857809"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2026 19:25:20 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNLlE-000000005fP-3wZ4;
	Thu, 14 May 2026 02:25:16 +0000
Date: Thu, 14 May 2026 10:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
Message-ID: <202605141021.Fw5Aqgfw-lkp@intel.com>
References: <20260511-p8700-wfi-v1-1-099b1d10fcf2@htecgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-p8700-wfi-v1-1-099b1d10fcf2@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_192524_632945_651500D4 
X-CRM114-Status: UNSURE (   8.71  )
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

Hi Aleksa,

kernel test robot noticed the following build errors:

[auto build test ERROR on c369299895a591d96745d6492d4888259b004a9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Paunovic-via-B4-Relay/riscv-Add-ERRATA_MIPS_P8700_WFI-to-replace-WFI-with-mips-pause/20260513-011847
base:   c369299895a591d96745d6492d4888259b004a9e
patch link:    https://lore.kernel.org/r/20260511-p8700-wfi-v1-1-099b1d10fcf2%40htecgroup.com
patch subject: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with mips.pause
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260514/202605141021.Fw5Aqgfw-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141021.Fw5Aqgfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141021.Fw5Aqgfw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:1:7: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
         ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:25: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                           ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:43: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                             ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:61: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                               ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:79: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                                                 ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:97: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                                                                   ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:115: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                                                                                     ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:133: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                                                                                                       ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
