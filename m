Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B5DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 09:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zx+j4jZ9V234Q7hwLSdHOnNYH4PN5uzMkH+13o6zbCs=; b=h2ga7vmBjJ/UIc
	ViqjrIv0Z0RvnLtWkf63EfmLESQg1fR7oXrgC1vDRSSbG+PB2EyoBUYWZn7j5+LPebO1gY/bOQN7a
	lR7XP6Xr+fysnzsyLwoi4jA2ACYnabFXwrani/Az0MrxP3Ov5SzXSpl31773+Etg0/p/pKHDQy+Nd
	WTExNlxANkPtVwcgOLDcBeKCnuLPm7UpksotKopY4EvmQVBsH8Pvnx04/6ughN63lkmJOxIWqPsyd
	6hwOpBO5dDtnTP+ktpUkMoFDp57t0+ePQW4jYL4p19ppbiiCIYrMxrgnGSqHAP/LQJdD9Oiv1vlRG
	uBYw4ADtRMH2CBPQ08/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgL7U-00000004YhB-2oRb;
	Tue, 20 Aug 2024 09:25:40 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgL7R-00000004Yf4-18la
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 09:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724145937; x=1755681937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=THweWyUnKikOWA2A+WsOKdmg2rS+0jZaR0q7DErdGs8=;
  b=aSKdzUAVt5JnU95CJSxTPPGjdlbmtZZ/d4LJ4Zv+/ALsWOQoKDu+alf9
   eGC9TEuLE9foWy0lbfb2FdzkcWD4D/HOmluY4eqGoyB0PJwQw24dXj6ws
   06lg8XYPQtvkzRACtNT7Gym49wj7qvYr4yyYlmvHsyCaEIKETURtZId9+
   AN2pkGK1ZXBFV1i4Dv8f8I4ivK11p+5tedkxXB43SZKAN7z53/lgcUfPL
   aYA3cSJBFhUGj0MNPBnwZhs98v51wiR1J/S/Ab1bW45Z2yLar0rLnKBIg
   zwwWC4cy2MscgaUH13gAKV0K5ys90GzjdBh5GMmknnkIAql6mA3JM0dAU
   A==;
X-CSE-ConnectionGUID: SZ5RoTKiRN6K5d15N2oYBg==
X-CSE-MsgGUID: ueN977M9SJG2DniKATzAdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22282119"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="22282119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 02:25:33 -0700
X-CSE-ConnectionGUID: uKJSlvzWTU+N3dv/t9vFdA==
X-CSE-MsgGUID: M23/lFdcQLSJJU+C9YW+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="64850206"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2024 02:25:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgL7E-0009y0-1o;
	Tue, 20 Aug 2024 09:25:24 +0000
Date: Tue, 20 Aug 2024 17:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>
Subject: Re: [PATCH v8 4/6] RISC-V: Detect unaligned vector accesses supported
Message-ID: <202408201720.u8SfprDk-lkp@intel.com>
References: <20240819212605.1837175-5-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240819212605.1837175-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_022537_437836_02ACCBE6 
X-CRM114-Status: GOOD (  12.37  )
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

[auto build test ERROR on 32d5f7add080a936e28ab4142bfeea6b06999789]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/RISC-V-Check-scalar-unaligned-access-on-all-CPUs/20240820-052900
base:   32d5f7add080a936e28ab4142bfeea6b06999789
patch link:    https://lore.kernel.org/r/20240819212605.1837175-5-jesse%40rivosinc.com
patch subject: [PATCH v8 4/6] RISC-V: Detect unaligned vector accesses supported
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240820/202408201720.u8SfprDk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201720.u8SfprDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201720.u8SfprDk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/sys_hwprobe.c:7:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/riscv/kernel/sys_hwprobe.c:263:7: error: use of undeclared identifier 'RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF'
     263 |         case RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF:
         |              ^
   1 warning and 1 error generated.


vim +/RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF +263 arch/riscv/kernel/sys_hwprobe.c

   234	
   235	static void hwprobe_one_pair(struct riscv_hwprobe *pair,
   236				     const struct cpumask *cpus)
   237	{
   238		switch (pair->key) {
   239		case RISCV_HWPROBE_KEY_MVENDORID:
   240		case RISCV_HWPROBE_KEY_MARCHID:
   241		case RISCV_HWPROBE_KEY_MIMPID:
   242			hwprobe_arch_id(pair, cpus);
   243			break;
   244		/*
   245		 * The kernel already assumes that the base single-letter ISA
   246		 * extensions are supported on all harts, and only supports the
   247		 * IMA base, so just cheat a bit here and tell that to
   248		 * userspace.
   249		 */
   250		case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
   251			pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
   252			break;
   253	
   254		case RISCV_HWPROBE_KEY_IMA_EXT_0:
   255			hwprobe_isa_ext0(pair, cpus);
   256			break;
   257	
   258		case RISCV_HWPROBE_KEY_CPUPERF_0:
   259		case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
   260			pair->value = hwprobe_misaligned(cpus);
   261			break;
   262	
 > 263		case RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF:
   264			pair->value = hwprobe_vec_misaligned(cpus);
   265			break;
   266	
   267		case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
   268			pair->value = 0;
   269			if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
   270				pair->value = riscv_cboz_block_size;
   271			break;
   272		case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
   273			pair->value = user_max_virt_addr();
   274			break;
   275	
   276		case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
   277			pair->value = riscv_timebase;
   278			break;
   279	
   280		/*
   281		 * For forward compatibility, unknown keys don't fail the whole
   282		 * call, but get their element key set to -1 and value set to 0
   283		 * indicating they're unrecognized.
   284		 */
   285		default:
   286			pair->key = -1;
   287			pair->value = 0;
   288			break;
   289		}
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
