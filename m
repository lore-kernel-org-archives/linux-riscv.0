Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5886CD8CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ympFgnQpd8xK1QK9MnQyjuW10urQliuJsSJAYUZjVkA=; b=IIW4YPGsMa35Pk
	ts91VYL4NMNpwnGVgKKUd1e+Bs8MccoDaCVqYpVvGdsF5IbnWvG1UEPL2V/ukCp99s2DoUKQoHsF/
	LlEFSSsSVo/FOS5Eu8iYbTwwJdd3N013QWkgaTHBhXGfdxZdLST0YAdyx1W+6QpPbX3tEMGrri4vU
	XB/b2j4YT8wt8Nefi8NYB1AuKWZe4b7xYpb7auGN0S5Kj0kCNdNmsLdZXtCFZiFdtTbgl2VjwoZ/p
	afYArX01Ky2QYNPnaxshIxXnaUg6/YuRVeGEsGvaL1uWyBrcV9AeFyP5niNrEQ2IWfuvn+7uUsuO/
	tpbfkKwKFMIIK1O5i56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqEIh-00De2O-2U;
	Tue, 10 Oct 2023 15:05:35 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqEIe-00De15-1N
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 15:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696950333; x=1728486333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdUyBSaObi/bh3BJzqLGOF381cKMFk0z6OBG3myfggs=;
  b=kpvkPN3Mey088HsfZOfnEVZUBEAwsLZyJeb/HgifCXMJ8gRB30oK3URF
   EEtmMJlWIIBNhrY79cSLwO0yqaWbjXVrZQksuYU42cVkDz3gf/FM56WMW
   lvIz21VQHxaMe0nR5Po3zhRm2SUMw40JwETnKgoMWnSxrqlvVmWJFhUsi
   YY4KkWSLRDeQRXjrHZIu+36KEaMXLMW9S+J6hf3mHA8NtXap63NR29Pqx
   rT3HdGCHdEoWB5t1XEPxZKKA4RvbbOzdqIMxeJyNbgh/i7Cr8hV4ph7sV
   rgEuGC50FEWE1dnmzFBJnacb15BwP7acaLxfy6ELz6+BHghhm3jh4RjXy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="3007009"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="3007009"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 08:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877255433"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="877255433"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Oct 2023 08:05:28 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqEIX-0000cO-1O;
	Tue, 10 Oct 2023 15:05:25 +0000
Date: Tue, 10 Oct 2023 23:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2 2/2] riscv: Add tests for riscv module loading
Message-ID: <202310102243.0Ab0xH1g-lkp@intel.com>
References: <20231006-module_relocations-v2-2-47566453fedc@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231006-module_relocations-v2-2-47566453fedc@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_080532_545020_1917214F 
X-CRM114-Status: GOOD (  10.92  )
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

Hi Charlie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82714078aee4ccbd6ee7579d5a21f8a72155d0fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-Add-remaining-module-relocations/20231007-084330
base:   82714078aee4ccbd6ee7579d5a21f8a72155d0fb
patch link:    https://lore.kernel.org/r/20231006-module_relocations-v2-2-47566453fedc%40rivosinc.com
patch subject: [PATCH v2 2/2] riscv: Add tests for riscv module loading
config: riscv-randconfig-002-20231010 (https://download.01.org/0day-ci/archive/20231010/202310102243.0Ab0xH1g-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310102243.0Ab0xH1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102243.0Ab0xH1g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/tests/module_test/test_module_linking_main.c:26:6: warning: no previous prototype for 'run_test_set' [-Wmissing-prototypes]
      26 | void run_test_set(struct kunit *test)
         |      ^~~~~~~~~~~~
>> arch/riscv/kernel/tests/module_test/test_module_linking_main.c:39:6: warning: no previous prototype for 'run_test_sub' [-Wmissing-prototypes]
      39 | void run_test_sub(struct kunit *test)
         |      ^~~~~~~~~~~~
>> arch/riscv/kernel/tests/module_test/test_module_linking_main.c:54:6: warning: no previous prototype for 'run_test_uleb' [-Wmissing-prototypes]
      54 | void run_test_uleb(struct kunit *test)
         |      ^~~~~~~~~~~~~


vim +/run_test_set +26 arch/riscv/kernel/tests/module_test/test_module_linking_main.c

    25	
  > 26	void run_test_set(struct kunit *test)
    27	{
    28		int val32 = test_set32();
    29		int val16 = test_set16();
    30		int val8 = test_set8();
    31		int val6 = test_set6();
    32	
    33		CHECK_EQ(val32, 0);
    34		CHECK_EQ(val16, 0);
    35		CHECK_EQ(val8, 0);
    36		CHECK_EQ(val6, 0);
    37	}
    38	
  > 39	void run_test_sub(struct kunit *test)
    40	{
    41		int val64 = test_sub64();
    42		int val32 = test_sub32();
    43		int val16 = test_sub16();
    44		int val8 = test_sub8();
    45		int val6 = test_sub6();
    46	
    47		CHECK_EQ(val64, 0);
    48		CHECK_EQ(val32, 0);
    49		CHECK_EQ(val16, 0);
    50		CHECK_EQ(val8, 0);
    51		CHECK_EQ(val6, 0);
    52	}
    53	
  > 54	void run_test_uleb(struct kunit *test)
    55	{
    56		int valuleb = test_uleb();
    57	
    58		CHECK_EQ(valuleb, 0);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
