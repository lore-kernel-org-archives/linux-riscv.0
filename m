Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D40BC27C54
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlvu8fwAXCsvBfUvJDmQDHPU+JG0nFCggWZjl2vh4sQ=; b=pG2BMwlNYAG0YM
	KxY4AAStyKTtnfJdY3GQLFQiFSLx8y1pMwLK4rhyEtLSAu6+FlRKUrdrRr7FgQfZ0DijMfc6CZ6c7
	JPplt+MtJy5AtOgkmQKH7B0TSK7rIF5bPVVXFqw+15hTE9Oly28oHx8zYW/qNawHdKVDFy+vIIuQH
	gkxKwxZqkXDtunmDWJ7SLOmTS6d2QWf0JRqW0JH5TcM0PRn1KKZACivsG0akbMiU7D2MGchS92QZ/
	WCjfE8EZpsm62aKrGJagqYFJ46pA1LeUeR/WZB4Zk2gId1Pri3/pThsmoZXHnzMeS7HFHslOz2KZn
	OQjU1zKOwedx0oTWsiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFL96-0000000BU9N-3GbY;
	Thu, 06 Jun 2024 21:59:45 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFL94-0000000BU8b-01iF
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 21:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717711182; x=1749247182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Gwn0DCpWggIO+/CSb7e0Je5msLNmTRhJebT8XHU8NU=;
  b=VkLXBvEVqkh/AKyKcoVaujwY+bgomnWKtYxJgjkiL30i+Sfcz6o/vX3b
   wQsnQG3RsJGqnPcqGG8XXOax9rQHPEVU/Uxrc0XW2o+FImOfbitfyqwXU
   au5mj5SWq5rerdb7t19fRjI1eoRp4GuGtsl2R+++KD6xdByfUVEnlf6vo
   csOsb+hdfQHUwsGpfXTquQyjYQX7cEUPFZep85ibtCLdpfmSEvriqwDIY
   htZzmZjFH2nXuSxX49d7jchpFjtg4JFajiM81WOpMpkvpqU9a2glIHOaV
   1JnEo69teq0stQlce7GJAY9K1b5EHZKzRh77gvxVdp6d+RSzHChHkZ1g1
   A==;
X-CSE-ConnectionGUID: MO96yEclQF+fdt91/vmrKA==
X-CSE-MsgGUID: WMscKMbySSC8VrATgJ8OYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14367737"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14367737"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 14:59:39 -0700
X-CSE-ConnectionGUID: xzoZxw0oQ8CbgKXPJQxYzw==
X-CSE-MsgGUID: iGfO0fY6TamP4YqJsropYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42545100"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jun 2024 14:59:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFL8r-0003mC-2D;
	Thu, 06 Jun 2024 21:59:29 +0000
Date: Fri, 7 Jun 2024 05:58:56 +0800
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
Subject: Re: [PATCH 2/3] RISC-V: Detect unaligned vector accesses supported.
Message-ID: <202406070508.6UJUx2rO-lkp@intel.com>
References: <20240606183215.416829-2-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606183215.416829-2-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_145942_146719_B67EC020 
X-CRM114-Status: GOOD (  14.46  )
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
patch link:    https://lore.kernel.org/r/20240606183215.416829-2-jesse%40rivosinc.com
patch subject: [PATCH 2/3] RISC-V: Detect unaligned vector accesses supported.
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406070508.6UJUx2rO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070508.6UJUx2rO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070508.6UJUx2rO-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps_misaligned.c: In function 'handle_misaligned_load':
>> arch/riscv/kernel/traps_misaligned.c:427:13: error: implicit declaration of function 'insn_is_vector' [-Werror=implicit-function-declaration]
     427 |         if (insn_is_vector(insn) &&
         |             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/insn_is_vector +427 arch/riscv/kernel/traps_misaligned.c

   406	
   407	int handle_misaligned_load(struct pt_regs *regs)
   408	{
   409		union reg_data val;
   410		unsigned long epc = regs->epc;
   411		unsigned long insn;
   412		unsigned long addr = regs->badaddr;
   413		int i, fp = 0, shift = 0, len = 0;
   414	
   415		perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
   416	
   417		if (!unaligned_enabled)
   418			return -1;
   419	
   420		if (user_mode(regs) && (current->thread.align_ctl & PR_UNALIGN_SIGBUS))
   421			return -1;
   422	
   423		if (get_insn(regs, epc, &insn))
   424			return -1;
   425	
   426	#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 > 427		if (insn_is_vector(insn) &&
   428		    *this_cpu_ptr(&vector_misaligned_access) == RISCV_HWPROBE_VEC_MISALIGNED_SUPPORTED) {
   429			*this_cpu_ptr(&vector_misaligned_access) = RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
   430			regs->epc = epc + INSN_LEN(insn);
   431			return 0;
   432		}
   433	
   434		*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_EMULATED;
   435	#endif
   436	
   437		regs->epc = 0;
   438	
   439		if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
   440			len = 4;
   441			shift = 8 * (sizeof(unsigned long) - len);
   442	#if defined(CONFIG_64BIT)
   443		} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
   444			len = 8;
   445			shift = 8 * (sizeof(unsigned long) - len);
   446		} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
   447			len = 4;
   448	#endif
   449		} else if ((insn & INSN_MASK_FLD) == INSN_MATCH_FLD) {
   450			fp = 1;
   451			len = 8;
   452		} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
   453			fp = 1;
   454			len = 4;
   455		} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
   456			len = 2;
   457			shift = 8 * (sizeof(unsigned long) - len);
   458		} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
   459			len = 2;
   460	#if defined(CONFIG_64BIT)
   461		} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
   462			len = 8;
   463			shift = 8 * (sizeof(unsigned long) - len);
   464			insn = RVC_RS2S(insn) << SH_RD;
   465		} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
   466			   ((insn >> SH_RD) & 0x1f)) {
   467			len = 8;
   468			shift = 8 * (sizeof(unsigned long) - len);
   469	#endif
   470		} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
   471			len = 4;
   472			shift = 8 * (sizeof(unsigned long) - len);
   473			insn = RVC_RS2S(insn) << SH_RD;
   474		} else if ((insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
   475			   ((insn >> SH_RD) & 0x1f)) {
   476			len = 4;
   477			shift = 8 * (sizeof(unsigned long) - len);
   478		} else if ((insn & INSN_MASK_C_FLD) == INSN_MATCH_C_FLD) {
   479			fp = 1;
   480			len = 8;
   481			insn = RVC_RS2S(insn) << SH_RD;
   482		} else if ((insn & INSN_MASK_C_FLDSP) == INSN_MATCH_C_FLDSP) {
   483			fp = 1;
   484			len = 8;
   485	#if defined(CONFIG_32BIT)
   486		} else if ((insn & INSN_MASK_C_FLW) == INSN_MATCH_C_FLW) {
   487			fp = 1;
   488			len = 4;
   489			insn = RVC_RS2S(insn) << SH_RD;
   490		} else if ((insn & INSN_MASK_C_FLWSP) == INSN_MATCH_C_FLWSP) {
   491			fp = 1;
   492			len = 4;
   493	#endif
   494		} else {
   495			regs->epc = epc;
   496			return -1;
   497		}
   498	
   499		if (!IS_ENABLED(CONFIG_FPU) && fp)
   500			return -EOPNOTSUPP;
   501	
   502		val.data_u64 = 0;
   503		for (i = 0; i < len; i++) {
   504			if (load_u8(regs, (void *)(addr + i), &val.data_bytes[i]))
   505				return -1;
   506		}
   507	
   508		if (!fp)
   509			SET_RD(insn, regs, val.data_ulong << shift >> shift);
   510		else if (len == 8)
   511			set_f64_rd(insn, regs, val.data_u64);
   512		else
   513			set_f32_rd(insn, regs, val.data_ulong);
   514	
   515		regs->epc = epc + INSN_LEN(insn);
   516	
   517		return 0;
   518	}
   519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
