Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F5C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEzfGmS74DSonQ5bzlClWLU4M5vD4jmOQcYJqECt0QU=; b=AOxAqDUQSGlo5B
	4M1q35x6t/TZYdyziLeCqCB+AwboHIqxQt+P8PY6HxeasQovXqxECCdnQVZK1yR/dG8/6g8NwXKtC
	pkApROGrKfhSkX6pFi2Y8KQNeMFe9Pg7PpSvFqEQRPaVOLlmZDJ0SfhOQJcwIhHteBI5BtYiZnigJ
	bqAbr2BiHV5D/Sq+qBq1UA5W0ha2hMFDEn+WrQVZ/Wm1cg6ZCi6TkwpyqEQp+DXLnTzLlOK4SI9iL
	Q9SCCaP7mrZTHJtqOla+jNVu1kefqG+kdKiuVAjAzKlzhXcdIzNaGYHRSxp5qhaQqiiQ7Kuf9JxLe
	pxGZkp4y2+ox9sUk6Fpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUa1K-009nZv-Cs; Tue, 21 Feb 2023 21:17:54 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUa1G-009nYu-Se
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 21:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677014270; x=1708550270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Z8HpLXCWddG+Jt9ywudS/nE++JVzN3twAynOXAq0E0=;
  b=l0IMtcOH4jse0jpOUPiOohylRBquJIKQ0bte0r3bE533mA58torPLbjG
   lmBL+uMP4wqJMFljYJ9eNLjmLgAymYSKWG1mF27mfcCmLRGuxcbRNQUnk
   c3Gw30JV5xCpVpMLKCA2Mcor4Notd6rbozYceAqr13edVqHAxGeRRh2RJ
   jMfqWYfIkcqeTCKqnXys3P0CO1K+OQ+u9+1KUb+8Z6tYZTzH7s7S68hx5
   LDGcs3rlOw0TMUVimHEq+mh7tJ7xernMtMuTzB21c3swBbqP3Es9O528t
   xpODZBAfPwME9HrrXQqpHoYk3ysSzAJ4HbmdLSbu6tDzIvGX2FDLz3XVl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="331423416"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="331423416"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 13:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="1000749794"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="1000749794"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2023 13:17:42 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUa17-0000FP-1J;
	Tue, 21 Feb 2023 21:17:41 +0000
Date: Wed, 22 Feb 2023 05:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, heiko@sntech.de,
	Conor Dooley <conor@kernel.org>, slewis@rivosinc.com,
	vineetg@rivosinc.com, Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 7/7] RISC-V: Add hwprobe vDSO function and data
Message-ID: <202302220534.zLN2kaHH-lkp@intel.com>
References: <20230221190858.3159617-8-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230221190858.3159617-8-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_131750_981941_E88C77B8 
X-CRM114-Status: GOOD (  12.39  )
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

Hi Evan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes robh/for-next soc/for-next linus/master v6.2]
[cannot apply to next-20230221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230222-031210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20230221190858.3159617-8-evan%40rivosinc.com
patch subject: [PATCH v3 7/7] RISC-V: Add hwprobe vDSO function and data
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230222/202302220534.zLN2kaHH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3f47f3f920ffcb37a461d04a1ee0e245451c869e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230222-031210
        git checkout 3f47f3f920ffcb37a461d04a1ee0e245451c869e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220534.zLN2kaHH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/vdso/hwprobe.c:14:5: warning: no previous prototype for '__vdso_riscv_hwprobe' [-Wmissing-prototypes]
      14 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, long pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> arch/riscv/kernel/vdso/hwprobe.c:14:5: warning: no previous prototype for '__vdso_riscv_hwprobe' [-Wmissing-prototypes]
      14 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, long pair_count,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/__vdso_riscv_hwprobe +14 arch/riscv/kernel/vdso/hwprobe.c

     9	
    10	extern int riscv_hwprobe(struct riscv_hwprobe *pairs, long pair_count,
    11				 long cpu_count, unsigned long *cpus,
    12				 unsigned long flags);
    13	
  > 14	int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, long pair_count,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
