Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E43C6FA8B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 03:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiOsreh2afKAng7QA1vcm9E6NPNGcT9l6PI53miwBlM=; b=BV4DejZQCV7JUZ
	XosXSThuvwTGlNFz4oKFL/KWA5HwLNCu5ftbv0vHubZJTD5ep//APdtDQmxXpOfqerrFgioiTuLi4
	P9bz+xxl1VI5eO0uIn+Caev4bwl/xmoZESZ6ClafM4UcKfQew94qRSDI6Kf+Pm8aeESPXk1lfNaqk
	enW+vbjl6M9n7GDpQ6x1MNyDM3gauOaoQluMkqyMYxVLnXKAPgCeMSM53bbZxbcTZCiUs1nD6ObSw
	ySr0Dq4sP19b69FQkAFlVSanSLXOZgvrsl3yAU3AlitLw7VhZAE6Tnl4zIr++tlTL/9NsxGFJspUy
	QZYkRNRtIKnqWiLAFajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obZfp-001oiv-F7; Fri, 23 Sep 2022 03:48:21 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obYPg-001PfV-4J; Fri, 23 Sep 2022 02:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663900056; x=1695436056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jAYDgleBPbTOdu0y3VZbHd+A4x8iiSPAjiS8UjgjHoQ=;
  b=YclKjVxjxqEgT3IGko+h+4BUlj32OmNwVpxMMhTNETjgnYF082VAvTXj
   3AAGItrMb2jQSkRJ+HiYcZWOQGecEnIc5JR7IBqQULA+eCiYXsU9GWcSc
   GaLL1tIUENDBeaLTeoxSgbryMIRmYf8maP2lQGmmVHlvO5sVcNeYKSHzM
   f+VuuDpV5C1WSdd/XfQuSB7VPt1+xcoxgOmvtUeamuEtg9bOGFeInKXcV
   JKuhKkCtDB+loNe3dhQoTceT2pz+zGY/NyILjCo0s/2gNxXYbcw6kzLvB
   IdtNvIK+dyM/k99CnEtPHHb28tYkeYaml+lICPyudII1+1e/2ANtBChCt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="298089759"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="298089759"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 19:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="709136696"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2022 19:27:25 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obYPU-0005DM-30;
	Fri, 23 Sep 2022 02:27:24 +0000
Date: Fri, 23 Sep 2022 10:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Russell King <linux@armlinux.org.uk>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: move -Wundef from KBUILD_CFLAGS to
 KBUILD_CPPFLAGS
Message-ID: <202209231052.nj1STd5X-lkp@intel.com>
References: <20220913080727.608495-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220913080727.608495-1-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_192736_232649_172F6F14 
X-CRM114-Status: GOOD (  14.53  )
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

Hi Masahiro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on s390/features soc/for-next linus/master v6.0-rc6]
[cannot apply to next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/kbuild-move-Wundef-from-KBUILD_CFLAGS-to-KBUILD_CPPFLAGS/20220913-161447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
config: arm64-buildonly-randconfig-r003-20220922 (https://download.01.org/0day-ci/archive/20220923/202209231052.nj1STd5X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ccf1a82d3dedb27a2b1b21f64e09183b197e1f6f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahiro-Yamada/kbuild-move-Wundef-from-KBUILD_CFLAGS-to-KBUILD_CPPFLAGS/20220913-161447
        git checkout ccf1a82d3dedb27a2b1b21f64e09183b197e1f6f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/vmlinux.lds.S:65:
>> arch/arm64/include/asm/kernel-pgtable.h:135:41: warning: "PMD_SHIFT" is not defined, evaluates to 0 [-Wundef]
     135 | #define ARM64_MEMSTART_SHIFT            PMD_SHIFT
         |                                         ^~~~~~~~~
   arch/arm64/include/asm/kernel-pgtable.h:144:5: note: in expansion of macro 'ARM64_MEMSTART_SHIFT'
     144 | #if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/PMD_SHIFT +135 arch/arm64/include/asm/kernel-pgtable.h

87d1587bef394c Suzuki K. Poulose 2015-10-19  122  
a7f8de168ace48 Ard Biesheuvel    2016-02-16  123  /*
a7f8de168ace48 Ard Biesheuvel    2016-02-16  124   * To make optimal use of block mappings when laying out the linear
a7f8de168ace48 Ard Biesheuvel    2016-02-16  125   * mapping, round down the base of physical memory to a size that can
a7f8de168ace48 Ard Biesheuvel    2016-02-16  126   * be mapped efficiently, i.e., either PUD_SIZE (4k granule) or PMD_SIZE
a7f8de168ace48 Ard Biesheuvel    2016-02-16  127   * (64k granule), or a multiple that can be mapped using contiguous bits
a7f8de168ace48 Ard Biesheuvel    2016-02-16  128   * in the page tables: 32 * PMD_SIZE (16k granule)
a7f8de168ace48 Ard Biesheuvel    2016-02-16  129   */
06e9bf2fd9b372 Ard Biesheuvel    2016-03-30  130  #if defined(CONFIG_ARM64_4K_PAGES)
06e9bf2fd9b372 Ard Biesheuvel    2016-03-30  131  #define ARM64_MEMSTART_SHIFT		PUD_SHIFT
06e9bf2fd9b372 Ard Biesheuvel    2016-03-30  132  #elif defined(CONFIG_ARM64_16K_PAGES)
ca6ece6a76a8b5 Anshuman Khandual 2021-06-14  133  #define ARM64_MEMSTART_SHIFT		CONT_PMD_SHIFT
a7f8de168ace48 Ard Biesheuvel    2016-02-16  134  #else
06e9bf2fd9b372 Ard Biesheuvel    2016-03-30 @135  #define ARM64_MEMSTART_SHIFT		PMD_SHIFT
06e9bf2fd9b372 Ard Biesheuvel    2016-03-30  136  #endif
06e9bf2fd9b372 Ard Biesheuvel    2016-03-30  137  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
