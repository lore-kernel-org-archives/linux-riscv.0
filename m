Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FF7C636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 23:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeCtamorTQuDUMQ/dAYZSSIHIUltXy9HNcUBDGZj9xM=; b=cWx+aFV329j73j
	5n3+GdMJT3bBpDe66nwvAgQHwAbiu1Jhc7McTa46Ynv2S2My2kxq6DYi2MTTDI3BTZAwDhTbRmDZ5
	CoQlBYaLaf0tnK2s4PB/DQlfvAIxJrVCea7OzEs3mSPfiaWi8v5QjiLNJLnfdeKzX2SEX8iB1cAEP
	por51g8DuWiA+PFQVJ8o7LxkHvXhgVM9U9dHlwJG6W9xvdbcSvssJhejYCvaLxnfuv3YVoYPCXAh2
	C3zJp5vsZ4fZZtims6DW70V0hd851EjbR8nUbYpOsU+P0A654wYjysWWXUPXAUTYD5p9aTNW2nSeC
	eo1ubFACjYQ/kn3dLcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPXCl-00Ddzq-1D; Tue, 07 Feb 2023 23:16:51 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPXCi-00DdyR-4E
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 23:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675811808; x=1707347808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=STI6p7MWc4YADHC7iNdmUKpnTsVLSGk6u5h6DbhqFKA=;
  b=dgEdF3YVk1tAVChCI4Y0iW8Sec7P/A1L1E11n7B3fzgMGI6q/IL0P/V9
   7shzjF1mPHhJipjV+XFSTB8E3i5ClNgT00kZSUGGzH+YlEopZgr/3YPPf
   uAcBw8fZE21aD26Nm+v6uQr1HwMhb8E7r+sN6FeX2KEo2CQH2uZyootbL
   x1H8c7BSsq1EABXOg8hChkoovx7LE1nJckYCBKu9OhYCK4SOn+NfMVeTk
   2r+fnItPAfbn18lKxdZ0HHYOTmKmj4wiof8VYlJyo3w26fAhDaokAUEov
   F4d2opz0TRe7/XYtynz2Vk9hCUvDtII1Vq5xmWTdb0BAicEPd9hb14TNl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="415875348"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="415875348"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 15:16:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="790978634"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="790978634"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Feb 2023 15:16:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPXCZ-0003yH-0G;
	Tue, 07 Feb 2023 23:16:39 +0000
Date: Wed, 8 Feb 2023 07:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
Message-ID: <202302080600.xT7BtKan-lkp@intel.com>
References: <20230206201455.1790329-3-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206201455.1790329-3-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_151648_197358_0F9B55A9 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, oe-kbuild-all@lists.linux.dev, Atish Patra <atishp@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Dao Lu <daolu@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Evan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes robh/for-next soc/for-next linus/master v6.2-rc7 next-20230207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230207-041746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20230206201455.1790329-3-evan%40rivosinc.com
patch subject: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/4a91a9ca5d81029b702e6e74c8f2015cf50af0ae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230207-041746
        git checkout 4a91a9ca5d81029b702e6e74c8f2015cf50af0ae
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/riscv/hwprobe.rst:33: WARNING: Field list ends without a blank line; unexpected unindent.

vim +33 Documentation/riscv/hwprobe.rst

    31	
    32	* :RISCV_HWPROBE_KEY_MVENDORID:: Contains the value of :mvendorid:, as per the
  > 33	  ISA specifications.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
