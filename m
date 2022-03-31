Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAA0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rML4RtFFpDcpU0x/D66iSOvu1S95x9sA2lN6D0I7jSE=; b=EOM0vZKtd78y48
	3RXjO4OEKHigN9pfMDPqDpWHBNXJo/uMzk+/nqtCO2UDGmF9+U+tAVdyMmOcqJfDOAaYQWUkQwPeY
	8Vgk8+KHNWfcSaIDWJGdh4tdepQGDqRYLZ3qRXfqQCi6vHCdk/Q59PiTtA+yE6GXF42BEVctiSKmH
	Cx+7487hvZ5EMMsWEm3LXTXQpzmyE38pE8ha7ToLZTOjLT5tsaRSTpeS91UQGkFLcTQ+wtOgXWoWu
	NSMfXbdYrvuU0sxIuVauOM6LWUofZpWrQOGZQL0f6hFX2zcPR5Yml1qqXbRo/vOZUqO9dDKypq/oL
	Hv1CLxf6/+/nOF3+nD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZvE9-002RWX-Ry; Thu, 31 Mar 2022 13:52:41 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZvE5-002RV9-RY
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 13:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648734758; x=1680270758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cea9BIXvxQfSFyXleL4Gt1pWuuhgt62Aif3PCu7C/tw=;
 b=Istjv4xeLtwyrMVYpv+HwZgQXz+rmaS3/Ams8qiO4HPL3Gyuhe8IJd34
 zy13Bebn2+p2qgSnhFiXrim8H0c2+W57MZ51drOKCUsH2Gj4trxCD7W1I
 CITHqm/F46TUO+rsLOPReG3ynDt6ydJNI1myb7f/IAtGIBLINwDym9jeK
 7XTvTSYUUcksIcpk+TJhiZFXmAV/39BtayPubDQj94Y29KbJz74neYUla
 c0m6XhhIBF0i3g0drUT6eeNXWIeaw7HlgPCR2/PWtJOgGMtwsZJQPCY4V
 HUB3ytxqc3RilJgy5g7Ixrh7JekoF7xuLfGABhjo+Efi9lVMtC+f8/g4h g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="241992235"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="241992235"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="720471387"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 31 Mar 2022 06:52:32 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZvDz-0000JM-Bt;
 Thu, 31 Mar 2022 13:52:31 +0000
Date: Thu, 31 Mar 2022 21:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, atishp@rivosinc.com,
 anup@brainfault.org, guoren@kernel.org, alistair23@gmail.com,
 linux-kernel@vger.kernel.org, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3] riscv: Ensure only ASIDLEN is used for sfence.vma
Message-ID: <202203312110.VamttjhO-lkp@intel.com>
References: <20220331055906.3552337-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220331055906.3552337-1-alistair.francis@opensource.wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_065238_178274_CB5E2656 
X-CRM114-Status: GOOD (  13.72  )
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
config: riscv-randconfig-c006-20220331 (https://download.01.org/0day-ci/archive/20220331/202203312110.VamttjhO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 881350a92d821d4f8e4fa648443ed1d17e251188)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/162147030f410152d028af446a7383e3c9410f55
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alistair-Francis/riscv-Ensure-only-ASIDLEN-is-used-for-sfence-vma/20220331-140116
        git checkout 162147030f410152d028af446a7383e3c9410f55
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/mm/context.c:307:39: error: no member named 'id' in 'mm_context_t'
           return atomic_long_read(&mm->context.id) & asid_mask;
                                    ~~~~~~~~~~~ ^
>> arch/riscv/mm/context.c:307:45: error: use of undeclared identifier 'asid_mask'
           return atomic_long_read(&mm->context.id) & asid_mask;
                                                      ^
   2 errors generated.


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
