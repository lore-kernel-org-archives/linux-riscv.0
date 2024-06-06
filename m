Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CA6C27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 23:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jn4wI/f5WVX419Zh7PfRvpKmJ+Dp2F8dMvPoshRH1/g=; b=Ot0ocMktZIqhZX
	lenBbjD8xSAaIHVv/l6bZy21grlVtawLRK0PJkju51t7PtE95LfGUpDiAfAlUxVNJsS5KVTZRIyip
	dSWb3ijmMuiXa32ItkKUShUnXHR2u1CIw6+DtJVMDoQSdcEo2Kujv3UqVJar882SOWiJgtusZNm30
	HIBpVFmHZ/RKvypw6X/7cCd1YiEXqVzr4jrvAnVsDRvepoOdclwRy4Z02+8vwGcgoYZ+ILJNXcpJc
	6EPLkUNNbpSipWKNN46fSzy4gjiYlxKi46qZahpzd/MZSwjmlb4XpyUQhtp0j+6zhRQHYt9Ijo7Lc
	e3sip32cLI2eicmql8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFMHW-0000000BeM5-49BA;
	Thu, 06 Jun 2024 23:12:30 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFMHT-0000000BeJt-2E3E
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 23:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717715547; x=1749251547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UxgXmFowYVLE9rUt04mrl6c/rElWFPzaOW5I47QclB0=;
  b=ZSKP5QUp9zkisfvm5Glpgc4e+qGomyKZGHMBvo/HywmxoJvuVby8kgSp
   XFHw7RY9h2xJCZyBjyHzYS0nMZ1/admxc/1SRgdM1YOFih7SimxTYWYnw
   rWffYoGjHp/sGm/MQ8YlOP/Kr3bnaeCWs4wNSKUL9XUp6jRpAFkcaukYH
   Pa/39860i28ZzUsRysgrwaNtLFbE11U0crZyt5ZOsGRGl+VLqEz5ZOxV/
   OArEon3fPjXCsYlFg18f5v6cW3JLZBt5fYCVB3jMV3tAMtk207CuPIkrc
   U0Q4bakt05zf7lpMtEr7/keFJEzAggcNlrUuYCacG0GlSpWAIRvwod5PC
   A==;
X-CSE-ConnectionGUID: D+NM+bktRQWQSr9ybf9v4w==
X-CSE-MsgGUID: W4GY3vIYRueOU0NHrn1uaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14600277"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14600277"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 16:12:23 -0700
X-CSE-ConnectionGUID: 2UalCSQ4S9iYZbcTDMW4jw==
X-CSE-MsgGUID: 5QSzTMwTQl25hS0Nqz38Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38805588"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2024 16:12:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFMHG-0003qE-2w;
	Thu, 06 Jun 2024 23:12:14 +0000
Date: Fri, 7 Jun 2024 07:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
	Erick Archer <erick.archer@gmx.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] RISC-V: Report vector unaligned accesse speed hwprobe
Message-ID: <202406070612.Vj1dDiqM-lkp@intel.com>
References: <20240606183215.416829-3-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606183215.416829-3-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_161227_642391_5025F12C 
X-CRM114-Status: GOOD (  15.50  )
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

[auto build test ERROR on v6.9]
[cannot apply to akpm-mm/mm-everything linus/master v6.10-rc2 v6.10-rc1 next-20240606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/RISC-V-Detect-unaligned-vector-accesses-supported/20240607-023434
base:   v6.9
patch link:    https://lore.kernel.org/r/20240606183215.416829-3-jesse%40rivosinc.com
patch subject: [PATCH 3/3] RISC-V: Report vector unaligned accesse speed hwprobe
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406070612.Vj1dDiqM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070612.Vj1dDiqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070612.Vj1dDiqM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/kernel/unaligned_access_speed.c: In function 'vec_check_unaligned_access_speed_all_cpus':
>> arch/riscv/kernel/unaligned_access_speed.c:370:30: error: 'check_vector_unaligned_access' undeclared (first use in this function); did you mean 'check_unaligned_access'?
     370 |         schedule_on_each_cpu(check_vector_unaligned_access);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              check_unaligned_access
   arch/riscv/kernel/unaligned_access_speed.c:370:30: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kernel/unaligned_access_speed.c:377:35: error: 'riscv_online_cpu_vec' undeclared (first use in this function); did you mean 'riscv_online_cpu'?
     377 |                                   riscv_online_cpu_vec, NULL);
         |                                   ^~~~~~~~~~~~~~~~~~~~
         |                                   riscv_online_cpu
   arch/riscv/kernel/unaligned_access_speed.c: At top level:
>> arch/riscv/kernel/unaligned_access_speed.c:368:12: warning: 'vec_check_unaligned_access_speed_all_cpus' defined but not used [-Wunused-function]
     368 | static int vec_check_unaligned_access_speed_all_cpus(void *unused)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +370 arch/riscv/kernel/unaligned_access_speed.c

   366	
   367	/* Measure unaligned access speed on all CPUs present at boot in parallel. */
 > 368	static int vec_check_unaligned_access_speed_all_cpus(void *unused)
   369	{
 > 370		schedule_on_each_cpu(check_vector_unaligned_access);
   371	
   372		/*
   373		 * Setup hotplug callbacks for any new CPUs that come online or go
   374		 * offline.
   375		 */
   376		cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 > 377					  riscv_online_cpu_vec, NULL);
   378	
   379		return 0;
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
