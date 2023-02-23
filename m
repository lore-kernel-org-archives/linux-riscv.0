Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA978C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVisea9CJnHjZMWvfl4DJy+Pi083FTPhl1Rc4tS86lc=; b=Q8RrMwd1KECXDd
	wg/qLbm+vjitQTYEagdnF3mpf/zM9q3BaMtmfbMpWdkEyvo/9EgdklkiCZd1G0Fc/kY7xDFPvlWvm
	68yna/x2NK3rfTxVvvAIrXk90l2e4zEppBtfOKMRZCNhxJuX8jK2xKglfjg6c0G6lRkeia6pXuzX5
	nZ/K3anqAimKRKaBsPiRS3gGYil4qauEG9A+RZeHxjKMth21QED7dJtuiHjtFT/SUkBGba0tTzYbC
	GmAnAwt2h5c3SqnSc0IMn7gu084woGOdWxHnV91esTF5sW0WmjjcmQpN/z/CqKsRkaPRniClgO3Bz
	IvxySvoyhM/lGva1DJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVHpb-000DVd-FU; Thu, 23 Feb 2023 20:04:43 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVHpY-000DTx-Bq
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 20:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677182680; x=1708718680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bMM8jrE3GaTMJ5jxYncWrywv+nAQI6dAHrUKTQF4Qzg=;
  b=avyuAhjywIc15ZWuFxkd7TM+NfPPzmrZhF3mKnpKrxSWyjOK4DBtEL3J
   YH4f8vZ+PW3zwtqz/oVnxDOP/DawPJhtOYviZfmKtPbuLJwfq1u89O+26
   epha10Fa7IGcDAlOr8HmvTErpqin3J3KpzObizxAWBt8RFD45McJ8HK9Q
   taoFdEeVQr6qOfXWmNpLTRJ0o807hcga/lbX+xE7zW5gE2jlYknMVNEoR
   U9/EaRcfROPEm8UHVfzgbMCB5YzQUje5cwC2dw62FwMG8CgSYVTrw0RXl
   BxO7ZKKx258Yy59TzTecNKLrnpzvSNt7uKdx8UaMu4tld1PJjgnXdPK3I
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="312947297"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="312947297"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 12:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="702921729"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="702921729"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Feb 2023 12:04:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVHpB-0001hR-0R;
	Thu, 23 Feb 2023 20:04:17 +0000
Date: Fri, 24 Feb 2023 04:03:33 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v6 1/1] riscv: Allow to downgrade paging mode from the
 command line
Message-ID: <202302240308.1CC475U8-lkp@intel.com>
References: <20230223082434.1280957-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223082434.1280957-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_120440_468061_757C4C39 
X-CRM114-Status: GOOD (  14.72  )
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
[also build test ERROR on v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Allow-to-downgrade-paging-mode-from-the-command-line/20230223-162702
patch link:    https://lore.kernel.org/r/20230223082434.1280957-2-alexghiti%40rivosinc.com
patch subject: [PATCH v6 1/1] riscv: Allow to downgrade paging mode from the command line
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230224/202302240308.1CC475U8-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7e18f795579f897e63812ca9dcb5b48ef2b7b4d2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Allow-to-downgrade-paging-mode-from-the-command-line/20230223-162702
        git checkout 7e18f795579f897e63812ca9dcb5b48ef2b7b4d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240308.1CC475U8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/pi/cmdline_early.c: In function 'match_noXlvl':
>> arch/riscv/kernel/pi/cmdline_early.c:50:24: error: 'SATP_MODE_48' undeclared (first use in this function); did you mean 'SATP_MODE_32'?
      50 |                 return SATP_MODE_48;
         |                        ^~~~~~~~~~~~
         |                        SATP_MODE_32
   arch/riscv/kernel/pi/cmdline_early.c:50:24: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kernel/pi/cmdline_early.c:52:24: error: 'SATP_MODE_57' undeclared (first use in this function); did you mean 'SATP_MODE_32'?
      52 |                 return SATP_MODE_57;
         |                        ^~~~~~~~~~~~
         |                        SATP_MODE_32


vim +50 arch/riscv/kernel/pi/cmdline_early.c

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
