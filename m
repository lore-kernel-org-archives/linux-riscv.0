Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CC8C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhCa05VRNhb7pQM9WVvLJrqWk4fG6vovoor4HcQdUZA=; b=Hr/GSfPth7UUPX
	O+JeK5vo2e03AByowyORmccvuvcuLuRLIdF6Z3/3YebfddOX4GzDLjEQ9f4FkLXfLw/ZmbBCA+24H
	PQ2r92kSqzQ/iUCnzaTXxk1D/aqUjsrZ/1ivB4sdTm+6KsgdfoTschLQOwfddd96Uq00Je0vFXq2k
	iwyZgQd6fHYp8SMqmV77IMRwHb0FiR1zzPVkAsKoByWO4xoQJwKfU7aF7U1I/Yz47+Ey2j/p7rvI5
	iIxdb1QhdW0bm8O37kt0aWp3zJgQOtjQHxhxOA6GqkiyM3pmlKCHjPLnH2EldBLcckN3GFq+FLTuU
	l/8R8ZtXVCVaaLu+V+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVAQO-00GFzJ-18; Thu, 23 Feb 2023 12:10:12 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVAQK-00GFyP-Ph
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 12:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677154208; x=1708690208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c3/6mmV17tShYWq3QB6unXyeKS83+JV/EnZRZDWCD5A=;
  b=MITWUEHpld16YqWEG0FsYiR3YNK+KEDdsV1o49lh76/oHtjAUyeq/f50
   umI9Z2T6J+iJlf9D6IGJ3DnWSQGbIgFCmbyl8m7gxQemNxjQV+pfKk0yv
   /s/PRixpeN5DzQ/L4Aw/osq65qJvs5XL/3y+y56UFQXvrdqywU9jUDykL
   9CiSdUVwEDZpUqL+6YL294oo78DrKoxYbuA1S6cuBtvkj3A348EdhPZ09
   AZda8I2eqfIuAb7AsQLADSiHbeNuxzO0a3aoYueSgR5YbWZB5WfLgUolR
   NkbUFAKpxrN/5QgUisES+dKExmJ30Y4nCid0rBsj9oPl25TPm+Nvk72Pe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="330921144"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="330921144"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 04:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="781858049"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="781858049"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2023 04:09:59 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVAQA-0001JW-1a;
	Thu, 23 Feb 2023 12:09:58 +0000
Date: Thu, 23 Feb 2023 20:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v6 1/1] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <202302231942.6C2mSFYv-lkp@intel.com>
References: <20230223082434.1280957-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223082434.1280957-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_041008_899026_BDE7FF11 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Alexandre,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Allow-to-downgrade-paging-mode-from-the-command-line/20230223-162702
patch link:    https://lore.kernel.org/r/20230223082434.1280957-2-alexghiti%40rivosinc.com
patch subject: [PATCH v6 1/1] riscv: Allow to downgrade paging mode from the command line
config: riscv-buildonly-randconfig-r002-20230222 (https://download.01.org/0day-ci/archive/20230223/202302231942.6C2mSFYv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7e18f795579f897e63812ca9dcb5b48ef2b7b4d2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Allow-to-downgrade-paging-mode-from-the-command-line/20230223-162702
        git checkout 7e18f795579f897e63812ca9dcb5b48ef2b7b4d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/pi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231942.6C2mSFYv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/pi/cmdline_early.c:50:10: error: use of undeclared identifier 'SATP_MODE_48'
                   return SATP_MODE_48;
                          ^
>> arch/riscv/kernel/pi/cmdline_early.c:52:10: error: use of undeclared identifier 'SATP_MODE_57'
                   return SATP_MODE_57;
                          ^
   2 errors generated.


vim +/SATP_MODE_48 +50 arch/riscv/kernel/pi/cmdline_early.c

    46	
    47	static u64 __init match_noXlvl(char *cmdline)
    48	{
    49		if (strstr(cmdline, "no4lvl"))
  > 50			return SATP_MODE_48;
    51		else if (strstr(cmdline, "no5lvl"))
  > 52			return SATP_MODE_57;
    53	
    54		return 0;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
