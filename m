Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A487C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0+hH0zMIgh/qAOvNB0uuCdyKZOADMkORTsewoGAGJo=; b=HX/ge5+LtXnCar
	t2QqTeVpaKdkwKiyUztettplJ0uCGF/JlkcJr86f9O5vSKhPEOKLj32GabOIPbpEA6wot2cDs1j5a
	QYiATqJd0Ip316CN2fnurRzEtgDLlQQbTFPVU7ZD0a6xIsJsiHQbSLFogqsEYttB7MMkjVGwPjgpJ
	DPMnZkttFUYyhbl4JEnPnAndZEyBfbfuz+oPdoDr9WiojqcSY7qICF4gsCrfCPc4UtpwuWER0g/DZ
	Ys+Md3D4tp1VMf2v44PgTa4skNtgH4eCXAx0+6RGTOlshyeAhTSXRv8RhLBoJNcParQdV7NlplvWr
	oNV3sylBdSrbsLWuqRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZrNU-001XwN-HD; Thu, 31 Mar 2022 09:46:04 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZrNR-001XvO-Kg
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 09:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648719961; x=1680255961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nzqSovEaB1+9yVRKn8HXLbqr/ZdlhWVFtpWNH7LPBF4=;
 b=gpL+YlU3Gb6EM5QeAQswwGFu3TjTKLlzEeIShu0cI9GKMNfXdnM58mBo
 8SXlRb9CgL57nqttu+qi1HyqlGyxkOFQAS8qnyIdPF5lJXUE1K93rXNFI
 +yM/h280JlWsYzrpzWLe0cCzv7+gK5khRwjJeNoY5jHu9Bum/JB9uDIPg
 tlZsfgx13qOTx1QTanEP/r8Jl/tMurU1wcacuqTTTXD6ozcgqGfjYuey8
 IJRdQYF6QuGdHaD+2khsigte9STkZQ6AjvIZyw5q/QmGZrcMdfk+QAfHt
 UwFYklj1OYDwh3Fa0dzb6AsWvz8e+DKpLJoWSY4qnS7WO94sQePe/7hJU Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257361307"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="257361307"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 02:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="503675581"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 31 Mar 2022 02:45:56 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZrNL-00008e-He;
 Thu, 31 Mar 2022 09:45:55 +0000
Date: Thu, 31 Mar 2022 17:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com
Cc: kbuild-all@lists.01.org, atishp@rivosinc.com, anup@brainfault.org,
 guoren@kernel.org, alistair23@gmail.com, linux-kernel@vger.kernel.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3] riscv: Ensure only ASIDLEN is used for sfence.vma
Message-ID: <202203311731.xi8xw0gy-lkp@intel.com>
References: <20220331055906.3552337-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220331055906.3552337-1-alistair.francis@opensource.wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_024601_751322_FE8CA4FF 
X-CRM114-Status: GOOD (  18.67  )
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

Hi Alistair,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17 next-20220331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Francis/riscv-Ensure-only-ASIDLEN-is-used-for-sfence-vma/20220331-140116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 787af64d05cd528aac9ad16752d11bb1c6061bb9
config: riscv-nommu_k210_defconfig (https://download.01.org/0day-ci/archive/20220331/202203311731.xi8xw0gy-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/162147030f410152d028af446a7383e3c9410f55
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alistair-Francis/riscv-Ensure-only-ASIDLEN-is-used-for-sfence-vma/20220331-140116
        git checkout 162147030f410152d028af446a7383e3c9410f55
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/riscv/mm/context.c: In function 'get_mm_asid':
>> arch/riscv/mm/context.c:307:45: error: 'mm_context_t' has no member named 'id'
     307 |         return atomic_long_read(&mm->context.id) & asid_mask;
         |                                             ^
>> arch/riscv/mm/context.c:307:52: error: 'asid_mask' undeclared (first use in this function); did you mean 'pid_task'?
     307 |         return atomic_long_read(&mm->context.id) & asid_mask;
         |                                                    ^~~~~~~~~
         |                                                    pid_task
   arch/riscv/mm/context.c:307:52: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/mm/context.c:308:1: error: control reaches end of non-void function [-Werror=return-type]
     308 | }
         | ^
   cc1: some warnings being treated as errors


vim +307 arch/riscv/mm/context.c

   304	
   305	unsigned long get_mm_asid(struct mm_struct *mm)
   306	{
 > 307		return atomic_long_read(&mm->context.id) & asid_mask;
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
