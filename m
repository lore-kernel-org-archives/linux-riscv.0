Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7D9C25B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 18:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NKsHX2HLZIsbz8D29xJZxR6Kf8+j2we90Zz98bnpw4=; b=EZXonFV/EWCOnv
	p7QHbTNf8X2wKIz2kaHx3NViSL4r6cnYLczxi58DkwgjbcozqWlIHLQj7GQXm95SQj5pg57lQs3gb
	N8VFCIxRa/3UcjFNnOc4GyZ8/O2UNA+0VYZb+pDMHSSrQXvvYqIAyZkqbua/zIVBSCC/VEpOiZCUR
	EGcWSDeuyFWtu85LP6whjY1oASiW1/gwiskwZsM8JPjA5/YHxZEBYX8kB3DBiqmLAYyD2fvMqo2Tn
	CJUsoOUzz71SNa4PPxu1l9whHW5UWXYhqSMK7DT/RhoAHRlkmn1xEfTRtCCGGtfKR1/sFvFcF1jy0
	SNSIJlMO8CsvSsu5FrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD7Qm-0000000BBA8-2L65;
	Fri, 31 May 2024 18:56:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD7Qh-0000000BB9B-1Mcv
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 18:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717181803; x=1748717803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SrJwZ/7eOLujVLRysciVp6Tf179CgGDJdlrnRGdI2qk=;
  b=D4eF8gge9we+d5XpioTtWr0g7t6cvEMkNoZLBBKwpH4SGwzxX6EkhwsD
   qMUE6d2oQnoHj0JzOSpG8PhBlUw5A1LtOdvuvtOyQB1kGoLCHQMAKMq+6
   cdB6NNOjYWGBQi4N94cK/aaSZxtNTMf/afxyPPFjdgzoWTfkIGTmd/GvJ
   elX6962W2D4s7QY8eshoMdGztPvFAf3mCahNBzTV/Al8OzeenI4vJuP+L
   kxVpp5fzMoNe8h+hAIwBoz0vU71lXL2hEZ5bhPUlCR6FYjWcbXs3yuybY
   7eEodTUV0RrScQ/BhYZyUnFfrP0YZZfQ2M5aYoNZgwWp3G442klystMZn
   g==;
X-CSE-ConnectionGUID: F6u5XuTLQGuTr/RiPAlDTA==
X-CSE-MsgGUID: uCdBG7XVSkqYMmuZCy7O0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13581617"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="13581617"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 11:56:42 -0700
X-CSE-ConnectionGUID: ghdv28QiTZ+1fU84+KkuEw==
X-CSE-MsgGUID: C3uIBoSNQoqmiTs/k80Z+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="40685318"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 11:56:39 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD7QW-000Hfl-0L;
	Fri, 31 May 2024 18:56:33 +0000
Date: Sat, 1 Jun 2024 02:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <202406010241.HBpKhSuj-lkp@intel.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531162327.2436962-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_115643_481277_FA6D6630 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Jesse,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/RISC-V-Use-Zkr-to-seed-KASLR-base-address/20240601-002545
base:   linus/master
patch link:    https://lore.kernel.org/r/20240531162327.2436962-1-jesse%40rivosinc.com
patch subject: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240601/202406010241.HBpKhSuj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010241.HBpKhSuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010241.HBpKhSuj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/pi/archrandom_early.c:13:
   In file included from arch/riscv/include/asm/archrandom.h:13:
   In file included from arch/riscv/include/asm/processor.h:71:
   In file included from include/linux/cpumask.h:11:
   In file included from include/linux/kernel.h:31:
>> include/linux/printk.h:619:9: warning: 'pr_err_once' macro redefined [-Wmacro-redefined]
     619 | #define pr_err_once(fmt, ...)                                   \
         |         ^
   arch/riscv/kernel/pi/archrandom_early.c:9:9: note: previous definition is here
       9 | #define pr_err_once(...)
         |         ^
>> arch/riscv/kernel/pi/archrandom_early.c:51:22: warning: variable 'tvec' is uninitialized when used here [-Wuninitialized]
      51 |         csr_write(CSR_TVEC, tvec);
         |                             ^~~~
   arch/riscv/include/asm/csr.h:506:38: note: expanded from macro 'csr_write'
     506 |         unsigned long __v = (unsigned long)(val);               \
         |                                             ^~~
   arch/riscv/kernel/pi/archrandom_early.c:44:20: note: initialize the variable 'tvec' to silence this warning
      44 |         unsigned long tvec;
         |                           ^
         |                            = 0
   2 warnings generated.


vim +/pr_err_once +619 include/linux/printk.h

16cb839f1332497 Joe Perches     2011-01-12  612  
16cb839f1332497 Joe Perches     2011-01-12  613  #define pr_emerg_once(fmt, ...)					\
16cb839f1332497 Joe Perches     2011-01-12  614  	printk_once(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
16cb839f1332497 Joe Perches     2011-01-12  615  #define pr_alert_once(fmt, ...)					\
16cb839f1332497 Joe Perches     2011-01-12  616  	printk_once(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
16cb839f1332497 Joe Perches     2011-01-12  617  #define pr_crit_once(fmt, ...)					\
16cb839f1332497 Joe Perches     2011-01-12  618  	printk_once(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
16cb839f1332497 Joe Perches     2011-01-12 @619  #define pr_err_once(fmt, ...)					\
16cb839f1332497 Joe Perches     2011-01-12  620  	printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
16cb839f1332497 Joe Perches     2011-01-12  621  #define pr_warn_once(fmt, ...)					\
16cb839f1332497 Joe Perches     2011-01-12  622  	printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
16cb839f1332497 Joe Perches     2011-01-12  623  #define pr_notice_once(fmt, ...)				\
16cb839f1332497 Joe Perches     2011-01-12  624  	printk_once(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
16cb839f1332497 Joe Perches     2011-01-12  625  #define pr_info_once(fmt, ...)					\
16cb839f1332497 Joe Perches     2011-01-12  626  	printk_once(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
eb012d125a24197 Tetsuo Handa    2020-05-25  627  /* no pr_cont_once, don't do that... */
36d308d8b547ee1 Mikhail Gruzdev 2013-02-21  628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
