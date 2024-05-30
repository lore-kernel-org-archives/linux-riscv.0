Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24998C27C43
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qk/s+Bs3YYRWQvYmdbI0Fjz3E6Tsh5nxrRe5jxL0ZKs=; b=WEFSx0JGTBS4PW
	DAVn4REavk0yurucxKBeXjxsqQGvFX2AdQ9gQKSOmBKTAsuCQZA4kDtiuTqyuyFr6dsSoBy61/JpH
	LF5g/jF94USoxF4eKnxW1wLklKxr5rt45CDzLlV6IO63TcEJqiY0UHakW3v0raXF/UFZLdmJW7Zos
	9+3KKuTRDIEFAp0LTNVfcTWMIvc8Z1EKkc4zJRR2VrC2okWx77hrfAQDAWp7Ou3uMrlpiveaENVpx
	SO4EsZtCF2iv2pCihBMIipUSO2NRKpTbH3Qvy8OU9+WY/gafm5P8duqgcbTYgbIDuxv34xF4Mia6Y
	CDHuizRgaG0v2b26vX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCggJ-00000007Vw3-1704;
	Thu, 30 May 2024 14:23:03 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCggF-00000007Vva-25Np
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 14:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717078980; x=1748614980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0TzI08c66avPZJEdsDRUEmen7CFRPyXzgnULJsKiuKw=;
  b=dFgXwNkJ/bPDw6SePTxryvX+cH/Kh0mD96VW2vp+j2cEKK7QaN6HI9aB
   T8ehzLi7HYy1ULIJFGU+1fBSRoT/KBEshSTdMIMYilugdU2AueS5kVAxC
   KzzkGskBSgz10+n/iInnAd546Xw25VEGYgvuCxWnycvINOmdBzwvWqp1l
   LkU5dxnNJOOnUdxICLOktvq2jV7FwnS+T16F5KJSNzEhBd+rgs0QHizE0
   JZE2HFkgpbKui0ShasEzQOmIC97ov79UOPqqWc3rYweIkz2Ev7SEbPDqT
   5QthlZWf9HLDEXCJyoJgn644KhW6R7wEjz8hfBWo9HUX8i9Tc0XUGmNfK
   g==;
X-CSE-ConnectionGUID: nvDSxrAySZa1oSZP0gUQsw==
X-CSE-MsgGUID: QtAlWHIHQBut+npN4hbAlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24971286"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24971286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 07:22:54 -0700
X-CSE-ConnectionGUID: JU4D+hkIS5GrqJb6iNRbeg==
X-CSE-MsgGUID: cDohpN6KSJ2/DX72oY4GmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35764100"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 May 2024 07:22:52 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCgfx-000FY4-2t;
	Thu, 30 May 2024 14:22:47 +0000
Date: Thu, 30 May 2024 22:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 4/4] riscv: entry: Save a frame record for exceptions
Message-ID: <202405302207.M9bDz8l3-lkp@intel.com>
References: <20240530001733.1407654-5-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240530001733.1407654-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_072259_612885_F4DCE51D 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Samuel,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/riscv=
-Fix-32-bit-call_on_irq_stack-frame-pointer-ABI/20240530-081923
base:   linus/master
patch link:    https://lore.kernel.org/r/20240530001733.1407654-5-samuel.ho=
lland%40sifive.com
patch subject: [PATCH 4/4] riscv: entry: Save a frame record for exceptions
config: riscv-randconfig-001-20240530 (https://download.01.org/0day-ci/arch=
ive/20240530/202405302207.M9bDz8l3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project baf=
da89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240530/202405302207.M9bDz8l3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405302207.M9bDz8l3-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/probes/rethook_trampoline.S:79:15: error: operand must=
 be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the ran=
ge [-2048, 2047]
    addi sp, sp, -(PT_SIZE_ON_STACK)
                 ^
   arch/riscv/kernel/probes/rethook_trampoline.S:90:15: error: operand must=
 be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the ran=
ge [-2048, 2047]
    addi sp, sp, PT_SIZE_ON_STACK
                 ^


vim +79 arch/riscv/kernel/probes/rethook_trampoline.S

c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17   9  =

c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  10  	.text
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  11  	.altmacro
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  12  =

c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  13  	.macro save_all_base_regs
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  14  	REG_S x1,  PT_RA(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  15  	REG_S x3,  PT_GP(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  16  	REG_S x4,  PT_TP(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  17  	REG_S x5,  PT_T0(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  18  	REG_S x6,  PT_T1(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  19  	REG_S x7,  PT_T2(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  20  	REG_S x8,  PT_S0(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  21  	REG_S x9,  PT_S1(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  22  	REG_S x10, PT_A0(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  23  	REG_S x11, PT_A1(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  24  	REG_S x12, PT_A2(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  25  	REG_S x13, PT_A3(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  26  	REG_S x14, PT_A4(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  27  	REG_S x15, PT_A5(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  28  	REG_S x16, PT_A6(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  29  	REG_S x17, PT_A7(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  30  	REG_S x18, PT_S2(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  31  	REG_S x19, PT_S3(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  32  	REG_S x20, PT_S4(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  33  	REG_S x21, PT_S5(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  34  	REG_S x22, PT_S6(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  35  	REG_S x23, PT_S7(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  36  	REG_S x24, PT_S8(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  37  	REG_S x25, PT_S9(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  38  	REG_S x26, PT_S10(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  39  	REG_S x27, PT_S11(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  40  	REG_S x28, PT_T3(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  41  	REG_S x29, PT_T4(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  42  	REG_S x30, PT_T5(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  43  	REG_S x31, PT_T6(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  44  	.endm
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  45  =

c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  46  	.macro restore_all_base_regs
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  47  	REG_L x3,  PT_GP(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  48  	REG_L x4,  PT_TP(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  49  	REG_L x5,  PT_T0(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  50  	REG_L x6,  PT_T1(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  51  	REG_L x7,  PT_T2(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  52  	REG_L x8,  PT_S0(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  53  	REG_L x9,  PT_S1(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  54  	REG_L x10, PT_A0(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  55  	REG_L x11, PT_A1(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  56  	REG_L x12, PT_A2(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  57  	REG_L x13, PT_A3(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  58  	REG_L x14, PT_A4(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  59  	REG_L x15, PT_A5(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  60  	REG_L x16, PT_A6(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  61  	REG_L x17, PT_A7(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  62  	REG_L x18, PT_S2(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  63  	REG_L x19, PT_S3(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  64  	REG_L x20, PT_S4(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  65  	REG_L x21, PT_S5(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  66  	REG_L x22, PT_S6(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  67  	REG_L x23, PT_S7(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  68  	REG_L x24, PT_S8(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  69  	REG_L x25, PT_S9(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  70  	REG_L x26, PT_S10(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  71  	REG_L x27, PT_S11(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  72  	REG_L x28, PT_T3(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  73  	REG_L x29, PT_T4(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  74  	REG_L x30, PT_T5(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  75  	REG_L x31, PT_T6(sp)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  76  	.endm
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17  77  =

76329c693924d8 arch/riscv/kernel/probes/rethook_trampoline.S Cl=E9ment L=E9=
ger 2023-10-24  78  SYM_CODE_START(arch_rethook_trampoline)
c22b0bcb1dd024 arch/riscv/kernel/probes/kprobes_trampoline.S Guo Ren       =
2020-12-17 @79  	addi sp, sp, -(PT_SIZE_ON_STACK)

-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
