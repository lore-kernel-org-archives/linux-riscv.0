Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D500C76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfu5LZhczt4LJIjhJXxGu1kPK80p3tbE1DOs4mhGldc=; b=CTVsmwG0/4fiWX
	dB28FhZ18xYW3g9xLjhJhRJUUyBsfXn4F9s82SfE4ufyr8gbkyoEjsOAM2EOeuvy3HNcaAetC/aiF
	CUR38d+J4bJf0YUe+AZ3fYp64hadhCFmtKCE/JdObv9PIdlYwwxdLP6C/Q5nkydMFheut/Dw8SgbK
	4sd5wGR77NacBRQr7fz4yMwijqgq0J9y3u4pyJT4gvhP30hZTPM4eQhEBNN1S1OLjqQYNmEeijJJY
	oLc16DYBQdh9dnrg5iTtFT3rmVv4u4FCtdiGBNR12Z/9rzCFx1PhZX2nFjF+PuNviEj3HDb1BP9EA
	6QkatXoXClsA1Qo/poBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piigW-00BKSW-1L;
	Sat, 01 Apr 2023 21:22:52 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piigS-00BKS7-2A
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 21:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680384168; x=1711920168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fhwNesxe6ke8KocxC20SOUuPRnmmVMa1sYZs1M2LhAs=;
  b=kxVUynLHQNbHBE7ZLKBPmLnhsif2KhOLYz4drIeN5W4d17uhMHlXeDxb
   /oXZNdlgkIu6BHoZ/iSeZDcQm1vspFu4w8dupJubi5lsPfqh5T2SO1MMw
   tEQxSS0tPI+vebKrvK9sfQfiYZPGttQTpiyjX9s5paynB7rh5pMZxLX3R
   2lhYV9QhVCrNfrhOSaP3iSjoVaQqovgZ05AMikktcFr/1dci77r4ne8Ur
   tUsHIFHcOpl0suIm2nE4lR7TPwfIW3eNYs3+UfkncI3MTx9otwlMR2jsv
   ErF9fxmmplIQpsG6HaU6ilDIGXboh5Jf0r2Jkjvhlvb4RFbfIE6RQhrc2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="406726443"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="406726443"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 14:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="809415495"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="809415495"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Apr 2023 14:22:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piigJ-000N3J-11;
	Sat, 01 Apr 2023 21:22:39 +0000
Date: Sun, 2 Apr 2023 05:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, slewis@rivosinc.com,
	vineetg@rivosinc.com, heiko@sntech.de,
	Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jann Horn <jannh@google.com>, Jisheng Zhang <jszhang@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 6/6] RISC-V: Add hwprobe vDSO function and data
Message-ID: <202304020554.WGmuSRal-lkp@intel.com>
References: <20230327163203.2918455-7-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327163203.2918455-7-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_142248_775448_9A5454CA 
X-CRM114-Status: GOOD (  11.19  )
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230328-003521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20230327163203.2918455-7-evan%40rivosinc.com
patch subject: [PATCH v5 6/6] RISC-V: Add hwprobe vDSO function and data
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20230402/202304020554.WGmuSRal-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/36489c1f81535a512da07d7d0272dd607bb217ca
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230328-003521
        git checkout 36489c1f81535a512da07d7d0272dd607bb217ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020554.WGmuSRal-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/sys_riscv.o: in function `.L0 ':
>> sys_riscv.c:(.init.text+0x4): undefined reference to `vdso_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
