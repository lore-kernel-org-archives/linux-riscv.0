Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E7AC7618B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIaDUI/tWvikVgdvAEOEKXZzV7NCDvg9CzAG+3ILmvQ=; b=31glwIbjYIz2Mm
	oKAva9ONXccEF/7uhb317vZjpQUgAkysAbUfDvxrWhcvlP0Rlt0ygYEvdjDvZYlit3v+7mZ6Au8X8
	InQXi1BcTYhIvIdF7TllqoorjK8aFlWDCPSkU6bKscWxMuXTj0hkX6aCozFaTIinBsCBsgCQqkdHQ
	lMeMBofw8aOMhV1aVXjzNzG7D2C27RcCgxVJVki9K1bNOcIZu8J761s476oECpGndXw0SfqV3czfI
	V0/C4a0I2lAR32n57IG46U1/5maqu4BIpag1JFS/oJqI3jcz65lT2/r4Y3pfcuaqhZ10EQHYwm8vd
	h6XZlum0xdMAXdHvA1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd7xV-0020Sl-2a;
	Fri, 17 Mar 2023 11:09:17 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd7xS-0020QR-1O
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679051354; x=1710587354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v10ok78XmnbTvrOG0ZyBDbG2rIV540KEKIp/CoL6i84=;
  b=hB6/VL2VvP+2XIy6HNw7LfLLc6heSFAcJSVX8rppZlgptpHcijR1ib9F
   LI4NrwNKJYFkC2sRXHofCuM+ZCxmQ47hGaNUasBME52kJ7AoMy4yb7ILD
   hzMjfeIuKyeRtZvpJGz9N0TIWsqkjdwWs22PMgS+ZFVNNsOSETXcTop+p
   ej3c66KpghEH3pV8f58geTz2NDuSt5CpVZq4yQ5dut7kGFuouBdmfJp5p
   9o8q6mPFJDFuJ7UbsXlAKOprdBgZvfwYFO3t2O9qkSuA1DRYu+P4DSprq
   voxRfzQDd+j0jf9oTsGXefyJ596iRixTafPMfovk2q4mIIYKVMm5HeFiH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424508727"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="424508727"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 04:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="926107442"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="926107442"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2023 04:09:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd7xJ-0009JS-14;
	Fri, 17 Mar 2023 11:09:05 +0000
Date: Fri, 17 Mar 2023 19:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	slewis@rivosinc.com, heiko@sntech.de,
	Conor Dooley <conor@kernel.org>, vineetg@rivosinc.com,
	Evan Green <evan@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Davidlohr Bueso <dave@stgolabs.net>, Guo Ren <guoren@kernel.org>,
	Jann Horn <jannh@google.com>, Jisheng Zhang <jszhang@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] RISC-V: Add hwprobe vDSO function and data
Message-ID: <202303171804.y0iCB2XM-lkp@intel.com>
References: <20230314183220.513101-7-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230314183220.513101-7-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_040914_502117_577BBF9E 
X-CRM114-Status: GOOD (  10.77  )
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

[auto build test ERROR on v6.2]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes linus/master v6.3-rc2 v6.3-rc1 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230315-023754
patch link:    https://lore.kernel.org/r/20230314183220.513101-7-evan%40rivosinc.com
patch subject: [PATCH v4 6/6] RISC-V: Add hwprobe vDSO function and data
config: riscv-randconfig-r033-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171804.y0iCB2XM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8ded35c1c6a29c13d7509e1e845fe6bb27a4c109
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230315-023754
        git checkout 8ded35c1c6a29c13d7509e1e845fe6bb27a4c109
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171804.y0iCB2XM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:101
   >>> referenced by hwprobe.c:35 (arch/riscv/kernel/vdso/hwprobe.c:35)
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:101
   >>> referenced by hwprobe.c:0 (arch/riscv/kernel/vdso/hwprobe.c:0)
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:101
   >>> referenced by hwprobe.c:0 (arch/riscv/kernel/vdso/hwprobe.c:0)
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:101
   >>> referenced by hwprobe.c:0 (arch/riscv/kernel/vdso/hwprobe.c:0)
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
