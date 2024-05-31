Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB90C25B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JD3VlTJlT3ioVZj1DGZDhUX5iDwHQLi8V5L9WCnA70=; b=oV3upPXy/1X1eI
	HlJONaRnby9Q6ASqvzeG0vPzgYcFIA+LoVSEkIBad8EjZ2RGV76wz0NrqXnOhssyXN6CMx6BNevWO
	zWz2UL+JEG/PGLGl/EUjHulVYHNz3OzscK6vctzGh2UrFwDW75PtM2aX/2/NLTjMHsFguxUJkW9bR
	JUEhcce5lgJq3OyUb6EqWKskWfvXdInlrXU4L+UJvqNsnT0fn8Fua7MUDCSMO0inNeuT72cqJB5Fc
	5VfLg5NCcmTF+GnXm6Pse47ia6K4Esf57ifVikB2fJ5DYy5TwSZqxvXmbRU1P6/BJppiGaM56WgNv
	DXtNp6PYA8Jk/FWqiLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD76K-0000000B8Vx-0HAC;
	Fri, 31 May 2024 18:35:40 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD76G-0000000B8VL-4B1i
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 18:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717180537; x=1748716537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r7DQ3avihlSDHYQgeFqpv8TcDPZqxHs/SRRgjLXHxvI=;
  b=BWpaCinh7yEP/p4J/xK52NGpD4fJgAIv5YtpvH8AoMYVi9bIW2ugZU+y
   S8CGAkkLl6VIx/RxbpynkPKVHXD0rywTzVuFHzHDAGufv1BODwqfai+++
   Md7X3Kpa/6knzJJh7QgzZjKr59N0PEbd5b72sCB3fdmmd+RoKcA6shjDB
   EP2tcG1lB1gKteRaapexeEtvDJ+yR0aBif59Y+9LLuNurJPhTKwo1VBHa
   RTU3/IebZdYrldLj+6YewGHLPniWFl5t2aa/zMmsmxlzqvelbPpV4UnwW
   hSg2+GndKeyj0LDOM33vKjYcLjw+10SogJNt71GG5KoatRk7PDIVlRTTo
   w==;
X-CSE-ConnectionGUID: fiZkxVDCSGaYVjhHLkzjfg==
X-CSE-MsgGUID: Z8cqBrQJTh60KY/ZAQg9QA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24400406"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="24400406"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 11:35:35 -0700
X-CSE-ConnectionGUID: 2aN9h814TI+3vFApkNNgOQ==
X-CSE-MsgGUID: Yby8Si2cSDGLlXOp5EhbUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36167529"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 11:35:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD769-000He7-25;
	Fri, 31 May 2024 18:35:29 +0000
Date: Sat, 1 Jun 2024 02:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <202406010252.0xgcgnD7-lkp@intel.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531162327.2436962-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_113537_079295_CB294D6C 
X-CRM114-Status: GOOD (  11.55  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/RISC-V-Use-Zkr-to-seed-KASLR-base-address/20240601-002545
base:   linus/master
patch link:    https://lore.kernel.org/r/20240531162327.2436962-1-jesse%40rivosinc.com
patch subject: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240601/202406010252.0xgcgnD7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010252.0xgcgnD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010252.0xgcgnD7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/pi/archrandom_early.pi.o: in function `__pi_.L0 ':
>> __pi_archrandom_early.c:(.init.pi.text+0x90): undefined reference to `__pi__printk'
--
   In file included from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:11,
                    from arch/riscv/include/asm/processor.h:71,
                    from arch/riscv/include/asm/archrandom.h:13,
                    from arch/riscv/kernel/pi/archrandom_early.c:13:
>> include/linux/printk.h:619: warning: "pr_err_once" redefined
     619 | #define pr_err_once(fmt, ...)                                   \
         | 
   arch/riscv/kernel/pi/archrandom_early.c:9: note: this is the location of the previous definition
       9 | #define pr_err_once(...)
         | 


vim +/pr_err_once +619 include/linux/printk.h

16cb839f133249 Joe Perches     2011-01-12  612  
16cb839f133249 Joe Perches     2011-01-12  613  #define pr_emerg_once(fmt, ...)					\
16cb839f133249 Joe Perches     2011-01-12  614  	printk_once(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
16cb839f133249 Joe Perches     2011-01-12  615  #define pr_alert_once(fmt, ...)					\
16cb839f133249 Joe Perches     2011-01-12  616  	printk_once(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
16cb839f133249 Joe Perches     2011-01-12  617  #define pr_crit_once(fmt, ...)					\
16cb839f133249 Joe Perches     2011-01-12  618  	printk_once(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
16cb839f133249 Joe Perches     2011-01-12 @619  #define pr_err_once(fmt, ...)					\
16cb839f133249 Joe Perches     2011-01-12  620  	printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
16cb839f133249 Joe Perches     2011-01-12  621  #define pr_warn_once(fmt, ...)					\
16cb839f133249 Joe Perches     2011-01-12  622  	printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
16cb839f133249 Joe Perches     2011-01-12  623  #define pr_notice_once(fmt, ...)				\
16cb839f133249 Joe Perches     2011-01-12  624  	printk_once(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
16cb839f133249 Joe Perches     2011-01-12  625  #define pr_info_once(fmt, ...)					\
16cb839f133249 Joe Perches     2011-01-12  626  	printk_once(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
eb012d125a2419 Tetsuo Handa    2020-05-25  627  /* no pr_cont_once, don't do that... */
36d308d8b547ee Mikhail Gruzdev 2013-02-21  628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
