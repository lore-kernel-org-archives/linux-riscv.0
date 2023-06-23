Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D215CEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKsV3Qw5VB5w00JYIjr7Yrum5kmlACYSzQ8qTek41qI=; b=QTp5uQVX+v4soQ
	Qc/hE+ijcopdo0Uz3/gksb+/bKzU3DM1iRa+euQCMHSYSSYT/8CvBQbIm4bmtGuw9RcIwda445jn0
	u3KP0UUkrUNhd28qRQpvG0orpoGXJz+79ck/lItJn5W9OfgDinZ3hMnXb80Vl6sOtUiuLxJ25I5B/
	XYmTGRspQFTD3GblhrXWnQVootelNEx0Ds7EM1wPMBTTe+piMHHrONEL363hr/PKkwe85GXPrdirN
	+3kMHjhTZAqvQ6A3lvm/ccuzvOvWP7QjlTFdYF9fy9nGtH7am/LlMEdKU7ZoImraPOH26PPViW/IF
	94bRdc0l9GfJ6VUpEzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCh9A-003g0p-0I;
	Fri, 23 Jun 2023 13:48:20 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCh94-003fzL-2t
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 13:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687528094; x=1719064094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fTE3/RwlDADn/1fdTPrzBhWxZmKbGCIKmzOMK9NG++c=;
  b=baIdDTyAUVSdGAuEexpi3ugpCDs4nTHcxLNuzw8+VFyPx0W4LA0g4Z4o
   NKd6VWZPRcQpXTQALK3fI672ASXpjM2TxURr1GQ5lPOKRLVIGvkORwruk
   nQhwBIzMZBKNizqXe15u8xisFxwy5m6c8n9b8vdETr2ur1eKQu/orLkVO
   biB4T6mkCLba1A0ajlFs85qKFMRITnsSLeXRjIoIhDbt/ocZZD20hssl3
   AQQ2GhLOk6C05TgfmI/gtAIYST4KzQtiqNzlCgycLk3wAbPopYNTBa4VC
   xIbRqMry/m1ozvXr+9HJUjGqViTf89wumZ7Q0ucoNjx/PqVTqdUawqGXx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="364212135"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="364212135"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 06:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="805209568"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="805209568"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jun 2023 06:48:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCh8y-0008Ib-1n;
	Fri, 23 Jun 2023 13:48:08 +0000
Date: Fri, 23 Jun 2023 21:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	samuel@sholland.org, guoren@kernel.org, christoph.muellner@vrull.eu,
	heiko@sntech.de, conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 3/3] RISC-V: add T-Head vector errata handling
Message-ID: <202306232111.5WpYab2n-lkp@intel.com>
References: <20230622231305.631331-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622231305.631331-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_064814_972202_C0AB7538 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Heiko,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230622]
[cannot apply to linus/master v6.4-rc7 v6.4-rc6 v6.4-rc5 v6.4-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/RISC-V-move-vector-available-status-into-a-dedicated-variable/20230623-081314
base:   next-20230622
patch link:    https://lore.kernel.org/r/20230622231305.631331-4-heiko%40sntech.de
patch subject: [PATCH v2 3/3] RISC-V: add T-Head vector errata handling
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230623/202306232111.5WpYab2n-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306232111.5WpYab2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306232111.5WpYab2n-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/vector.h: Assembler messages:
>> arch/riscv/include/asm/vector.h:162: Error: unrecognized opcode `slliw a4,a4,1'
>> arch/riscv/include/asm/vector.h:194: Error: unrecognized opcode `srliw t4,a1,1'
>> arch/riscv/include/asm/vector.h:169: Error: attempt to move .org backwards
   arch/riscv/include/asm/vector.h:203: Error: attempt to move .org backwards
--
   arch/riscv/include/asm/vector.h: Assembler messages:
>> arch/riscv/include/asm/vector.h:162: Error: unrecognized opcode `slliw a4,a4,1'
>> arch/riscv/include/asm/vector.h:169: Error: attempt to move .org backwards
--
   arch/riscv/include/asm/vector.h: Assembler messages:
>> arch/riscv/include/asm/vector.h:194: Error: unrecognized opcode `srliw t4,a1,1'
>> arch/riscv/include/asm/vector.h:162: Error: unrecognized opcode `slliw a4,a4,1'
   arch/riscv/include/asm/vector.h:203: Error: attempt to move .org backwards
>> arch/riscv/include/asm/vector.h:169: Error: attempt to move .org backwards


vim +162 arch/riscv/include/asm/vector.h

03c3fcd9941a17 Greentime Hu   2023-06-05  150  
03c3fcd9941a17 Greentime Hu   2023-06-05  151  static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src)
03c3fcd9941a17 Greentime Hu   2023-06-05  152  {
5255e253b722bb Heiko Stuebner 2023-06-23  153  	register u32 t1 asm("t1") = (SR_FS);
5255e253b722bb Heiko Stuebner 2023-06-23  154  
5255e253b722bb Heiko Stuebner 2023-06-23  155  	/*
5255e253b722bb Heiko Stuebner 2023-06-23  156  	 * Similar to __vstate_csr_save above, restore values for the
5255e253b722bb Heiko Stuebner 2023-06-23  157  	 * separate VXRM and VXSAT CSRs from the vcsr variable.
5255e253b722bb Heiko Stuebner 2023-06-23  158  	 */
5255e253b722bb Heiko Stuebner 2023-06-23  159  	asm volatile (ALTERNATIVE(
03c3fcd9941a17 Greentime Hu   2023-06-05  160  		".option push\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  161  		".option arch, +v\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05 @162  		"vsetvl	 x0, %2, %1\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  163  		".option pop\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  164  		"csrw	" __stringify(CSR_VSTART) ", %0\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  165  		"csrw	" __stringify(CSR_VCSR) ", %3\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  166  		__nops(6),
5255e253b722bb Heiko Stuebner 2023-06-23  167  		"csrs	sstatus, t1\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  168  		".option push\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23 @169  		".option arch, +v\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  170  		"vsetvl	 x0, %2, %1\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  171  		".option pop\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  172  		"csrw	" __stringify(CSR_VSTART) ", %0\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  173  		"srliw	t4, %3, " __stringify(VCSR_VXRM_SHIFT) "\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  174  		"andi	t4, t4, " __stringify(VCSR_VXRM_MASK) "\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  175  		"csrw	" __stringify(THEAD_C9XX_CSR_VXRM) ", t4\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  176  		"andi	%3, %3, " __stringify(VCSR_VXSAT_MASK) "\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  177  		"csrw	" __stringify(THEAD_C9XX_CSR_VXSAT) ", %3\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  178  		"csrc	sstatus, t1\n\t",
5255e253b722bb Heiko Stuebner 2023-06-23  179  		THEAD_VENDOR_ID,
5255e253b722bb Heiko Stuebner 2023-06-23  180  		ERRATA_THEAD_VECTOR, CONFIG_ERRATA_THEAD_VECTOR)
03c3fcd9941a17 Greentime Hu   2023-06-05  181  		: : "r" (src->vstart), "r" (src->vtype), "r" (src->vl),
5255e253b722bb Heiko Stuebner 2023-06-23  182  		    "r" (src->vcsr), "r"(t1) : "t4");
03c3fcd9941a17 Greentime Hu   2023-06-05  183  }
03c3fcd9941a17 Greentime Hu   2023-06-05  184  
03c3fcd9941a17 Greentime Hu   2023-06-05  185  static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
03c3fcd9941a17 Greentime Hu   2023-06-05  186  					 void *datap)
03c3fcd9941a17 Greentime Hu   2023-06-05  187  {
03c3fcd9941a17 Greentime Hu   2023-06-05  188  	unsigned long vl;
03c3fcd9941a17 Greentime Hu   2023-06-05  189  
03c3fcd9941a17 Greentime Hu   2023-06-05  190  	riscv_v_enable();
03c3fcd9941a17 Greentime Hu   2023-06-05  191  	__vstate_csr_save(save_to);
5255e253b722bb Heiko Stuebner 2023-06-23  192  	asm volatile (ALTERNATIVE(
5255e253b722bb Heiko Stuebner 2023-06-23  193  		"nop\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05 @194  		".option push\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  195  		".option arch, +v\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  196  		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  197  		"vse8.v		v0, (%1)\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  198  		"add		%1, %1, %0\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  199  		"vse8.v		v8, (%1)\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  200  		"add		%1, %1, %0\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  201  		"vse8.v		v16, (%1)\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  202  		"add		%1, %1, %0\n\t"
03c3fcd9941a17 Greentime Hu   2023-06-05  203  		"vse8.v		v24, (%1)\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  204  		".option pop\n\t",
5255e253b722bb Heiko Stuebner 2023-06-23  205  		"mv		t0, %1\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  206  		THEAD_VSETVLI_T4X0E8M8D1
5255e253b722bb Heiko Stuebner 2023-06-23  207  		THEAD_VSB_V_V0T0
5255e253b722bb Heiko Stuebner 2023-06-23  208  		"addi		t0, t0, 128\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  209  		THEAD_VSB_V_V8T0
5255e253b722bb Heiko Stuebner 2023-06-23  210  		"addi		t0, t0, 128\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  211  		THEAD_VSB_V_V16T0
5255e253b722bb Heiko Stuebner 2023-06-23  212  		"addi		t0, t0, 128\n\t"
5255e253b722bb Heiko Stuebner 2023-06-23  213  		THEAD_VSB_V_V24T0, THEAD_VENDOR_ID,
5255e253b722bb Heiko Stuebner 2023-06-23  214  		ERRATA_THEAD_VECTOR, CONFIG_ERRATA_THEAD_VECTOR)
5255e253b722bb Heiko Stuebner 2023-06-23  215  		: "=&r" (vl) : "r" (datap) : "t0", "t4", "memory");
03c3fcd9941a17 Greentime Hu   2023-06-05  216  	riscv_v_disable();
03c3fcd9941a17 Greentime Hu   2023-06-05  217  }
03c3fcd9941a17 Greentime Hu   2023-06-05  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
