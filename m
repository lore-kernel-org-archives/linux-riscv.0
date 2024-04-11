Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7541ACD1292
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 04:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSc1xLgVd0tQDbM2uH+c74xnUVtxb6hiqJpiVVrcN10=; b=0BztnqhV26LuWH
	0QK5rCDBCl+Aos3lZRE+9pTkMPFC/vmsRrhCg8PIOnZ1y54uzxYSBBnZiIfni/960JAkNWFbN2caE
	8tuV1hWVIt2UexZC3q4/fyCbOwMsxLJMBoT1j42TY+wLkvfI12QO1NFjfaC6UY5t/HWEcsWaszJBR
	lIpaYVAsfd0Tnaij/GSINoVnvEERNjtdXi1YmjD1L1foqoHZ1O3dV4PBIb/VWkMBe8kjtgGX/n6mr
	pERNOiiWNCRcHHSzsKIxxI60UT3lhFNAYcN2WOqUdrXpICaSFtIRKtuqcG5s+Y8J+hGb3PwMDeMLF
	9V04hLAxEulcgSRoCPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rumAc-0000000AJLX-1kVE;
	Thu, 11 Apr 2024 04:36:18 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rumAY-0000000AJKY-2FMJ
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 04:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712810175; x=1744346175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o/+uwXlHAOmhl3WAKzDaiuVdwVeGNqrRyUVMQyyK9YU=;
  b=cG3Rr+kkorYIZckI6K40Qr41d9gKlqDAVgRlsv9PvE4DV29ZPcD2Fu+T
   E79i0oyAsuFEAsHmgVqYVdKG7BIDhU9rylLmf5qTDaSzO1vROMeFNNZbR
   XeX3N9xloD1pMYJJ3KSWqkeUY8j8MXwIJL4XmBqyuFNVYAIvMcMB1HTZK
   6w4OpAIZIDxLIptD4ZUUkW2zru/MiroaNB/bUrKbYe6zXWlYZx99xy403
   ygN2c6KCLq1shFrIj1kgcRXcrXS6SuONDkVX9t8sKsx9s7dqZRs8YpsJX
   G9owPJKWbcrB3JIcsVXSx+RBs0uetHmuFyKFJg+g0bbog+VJI7MiL9o6J
   g==;
X-CSE-ConnectionGUID: SINceZhwS2irfJshGMbGwA==
X-CSE-MsgGUID: kdyIGkpdQCSZexG7anMsBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18913207"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="18913207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:36:09 -0700
X-CSE-ConnectionGUID: sDkHX2rWTVew/QfTWLUgGQ==
X-CSE-MsgGUID: Pce/SbP3T3C4/uW44S2Mtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20783082"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2024 21:36:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rumAN-0008Do-2N;
	Thu, 11 Apr 2024 04:36:03 +0000
Date: Thu, 11 Apr 2024 12:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jinglin Wen <jinglin.wen@shingroup.cn>, palmer@dabbelt.com
Cc: oe-kbuild-all@lists.linux.dev, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, gregkh@linuxfoundation.org,
	atishp@rivosinc.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: Re: [PATCH 1/3] riscv: Support for early console.
Message-ID: <202404111237.OOIpC9KS-lkp@intel.com>
References: <20240410063432.23058-2-jinglin.wen@shingroup.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410063432.23058-2-jinglin.wen@shingroup.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_213614_644854_340834D6 
X-CRM114-Status: UNSURE (   8.95  )
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

Hi Jinglin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.9-rc3 next-20240410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinglin-Wen/riscv-Support-for-early-console/20240410-143840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240410063432.23058-2-jinglin.wen%40shingroup.cn
patch subject: [PATCH 1/3] riscv: Support for early console.
config: riscv-randconfig-r112-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111237.OOIpC9KS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce: (https://download.01.org/0day-ci/archive/20240411/202404111237.OOIpC9KS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111237.OOIpC9KS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/early_console.c:13:6: sparse: sparse: symbol 'riscv_early_console_putc' was not declared. Should it be static?

vim +/riscv_early_console_putc +13 arch/riscv/kernel/early_console.c

    11	
    12	/* interface for early console output characters */
  > 13	void (*riscv_early_console_putc)(char c);
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
