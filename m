Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8AEC8303C
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlSca92HjlrZDuKuIUvZxiAQXFACzyQBGnRBIXm5Vgc=; b=Bl99xO6Eaa/ldv
	BO1zPthWJq674YhE/LO6EkvHB5ekJbzHbSIkE5e1Ze2LQEaLuLxa/9rSM8uRkUc/NGwhwKvtvktft
	xFcUiGpO/Zt0oso670Cgw+gvuVdBzOo6wk+0FFqvfoSw/p/JvAxy8eMGWeOk5JpfE6RIz1NnR+cm+
	Ezzqg4YbRItxV+Xlnzgu06kCFzsdkV2Zwlxl7ZFqF1pZ8R2SUAweI1PWxAgrl6eYSkWg8RL4QxKsM
	Hi5fnQFF1EU6bml+J5w59BriMo5eFMvKspMInwh7XNc1FIhR49f9WSHEfnfb6k3zg2/mDnERiI5nU
	aGFZJ+xAq0lRdNV7+L/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYEsL-0000000HGQU-3ra3;
	Sun, 06 Jul 2025 02:13:05 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYEsJ-0000000HGPi-3sde
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 02:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751767984; x=1783303984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cxQeL0oH+76cufx36nw7v4ljcvG3KBCpszc/4BzMYVU=;
  b=L3odc+lPN2Tf2xMHPG/FVYnGkaHd+IHX3utR3FLKh4KOACdewfcxyQpP
   d6/J0tKOs4+QXKlJB/cPgvM7MmxFKYLDbNZ08kJqj6icSoV5MYGfARy1z
   SQAGfyJayCTynjdTMD0H2yv7EjQ8yOXmbf7RTNW0cE+PHx2AyGBpjCeX8
   JbvZwsiGQXaSMimVRxUd0dnenR3Dvgmsf983B8IVcraE+sbVihiM4ga5U
   qCxlfqEoY8VORvDnGyLusrzmnIySPw6Z5bAaXqQErwAmsN/yKLpo4LGyi
   C2UtzMOt1ZmZF1jsi9kXReZL5SVy2Gb+3b3Q0t/oxTd/Cma+gq5vepfpq
   A==;
X-CSE-ConnectionGUID: RWUiEsOWR3+gsNOtqRwd8Q==
X-CSE-MsgGUID: JD9COFcPQGSTTyET8ly1Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53953047"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53953047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 19:13:01 -0700
X-CSE-ConnectionGUID: P7AFuKtSR+WFx2ZJHWLR/g==
X-CSE-MsgGUID: FP+xo/NgTgmmHsIN/qpxMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="155275019"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jul 2025 19:12:59 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYEsC-0004p1-1k;
	Sun, 06 Jul 2025 02:12:56 +0000
Date: Sun, 6 Jul 2025 10:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: ChenMiao <chenmiao.ku@gmail.com>,
	Linux RISCV <linux-riscv@lists.infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, chenmiao <chenmiao.ku@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
Message-ID: <202507060946.JDTW8TlM-lkp@intel.com>
References: <20250703084818.394491-1-chenmiao.ku@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250703084818.394491-1-chenmiao.ku@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_191304_016632_E0844080 
X-CRM114-Status: GOOD (  11.90  )
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

Hi ChenMiao,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ChenMiao/riscv-ftrace-Fix-the-logic-issue-in-DYNAMIC_FTRACE-selection/20250703-165308
base:   linus/master
patch link:    https://lore.kernel.org/r/20250703084818.394491-1-chenmiao.ku%40gmail.com
patch subject: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
config: riscv-randconfig-001-20250706 (https://download.01.org/0day-ci/archive/20250706/202507060946.JDTW8TlM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060946.JDTW8TlM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060946.JDTW8TlM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/mcount-dyn.S: Assembler messages:
>> arch/riscv/kernel/mcount-dyn.S:85: Error: illegal operands `addi sp,sp,-FREGS_SIZE_ON_STACK'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:86: Error: illegal operands `sd t0,FREGS_EPC(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:87: Error: illegal operands `sd x1,FREGS_RA(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:91: Error: illegal operands `sd x6,FREGS_T1(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:100: Error: illegal operands `sd x10,FREGS_A0(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:101: Error: illegal operands `sd x11,FREGS_A1(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:102: Error: illegal operands `sd x12,FREGS_A2(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:103: Error: illegal operands `sd x13,FREGS_A3(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:104: Error: illegal operands `sd x14,FREGS_A4(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:105: Error: illegal operands `sd x15,FREGS_A5(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:106: Error: illegal operands `sd x16,FREGS_A6(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:107: Error: illegal operands `sd x17,FREGS_A7(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:109: Error: illegal operands `addi a0,a0,FREGS_SIZE_ON_STACK'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:110: Error: illegal operands `sd a0,FREGS_SP(sp)'
   arch/riscv/kernel/mcount-dyn.S:185:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:114: Error: illegal operands `ld t0,FREGS_EPC(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:115: Error: illegal operands `ld x1,FREGS_RA(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:119: Error: illegal operands `ld x6,FREGS_T1(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:128: Error: illegal operands `ld x10,FREGS_A0(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:129: Error: illegal operands `ld x11,FREGS_A1(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
>> arch/riscv/kernel/mcount-dyn.S:130: Error: illegal operands `ld x12,FREGS_A2(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
   arch/riscv/kernel/mcount-dyn.S:131: Error: illegal operands `ld x13,FREGS_A3(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
   arch/riscv/kernel/mcount-dyn.S:132: Error: illegal operands `ld x14,FREGS_A4(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
   arch/riscv/kernel/mcount-dyn.S:133: Error: illegal operands `ld x15,FREGS_A5(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
   arch/riscv/kernel/mcount-dyn.S:134: Error: illegal operands `ld x16,FREGS_A6(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
   arch/riscv/kernel/mcount-dyn.S:135: Error: illegal operands `ld x17,FREGS_A7(sp)'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here
   arch/riscv/kernel/mcount-dyn.S:137: Error: illegal operands `addi sp,sp,FREGS_SIZE_ON_STACK'
   arch/riscv/kernel/mcount-dyn.S:195:  Info: macro invoked from here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE
   Depends on [n]: FTRACE [=y] && FUNCTION_TRACER [=y] && HAVE_DYNAMIC_FTRACE [=n]
   Selected by [y]:
   - RISCV [=y] && FUNCTION_TRACER [=y]


vim +85 arch/riscv/kernel/mcount-dyn.S

afc76b8b8011218 Guo Ren        2020-12-17   27  
afc76b8b8011218 Guo Ren        2020-12-17   28  	.macro SAVE_ABI
afc76b8b8011218 Guo Ren        2020-12-17   29  	addi	sp, sp, -ABI_SIZE_ON_STACK
afc76b8b8011218 Guo Ren        2020-12-17   30  
afc76b8b8011218 Guo Ren        2020-12-17   31  	REG_S	a0, ABI_A0(sp)
afc76b8b8011218 Guo Ren        2020-12-17   32  	REG_S	a1, ABI_A1(sp)
afc76b8b8011218 Guo Ren        2020-12-17   33  	REG_S	a2, ABI_A2(sp)
afc76b8b8011218 Guo Ren        2020-12-17   34  	REG_S	a3, ABI_A3(sp)
afc76b8b8011218 Guo Ren        2020-12-17   35  	REG_S	a4, ABI_A4(sp)
afc76b8b8011218 Guo Ren        2020-12-17   36  	REG_S	a5, ABI_A5(sp)
afc76b8b8011218 Guo Ren        2020-12-17   37  	REG_S	a6, ABI_A6(sp)
afc76b8b8011218 Guo Ren        2020-12-17   38  	REG_S	a7, ABI_A7(sp)
6724a76cff85ee2 Guo Ren        2023-01-12   39  	REG_S	t0, ABI_T0(sp)
afc76b8b8011218 Guo Ren        2020-12-17   40  	REG_S	ra, ABI_RA(sp)
c15ac4fd60d5ffd Alan Kao       2018-02-13   41  	.endm
c15ac4fd60d5ffd Alan Kao       2018-02-13   42  
afc76b8b8011218 Guo Ren        2020-12-17   43  	.macro RESTORE_ABI
afc76b8b8011218 Guo Ren        2020-12-17   44  	REG_L	a0, ABI_A0(sp)
afc76b8b8011218 Guo Ren        2020-12-17   45  	REG_L	a1, ABI_A1(sp)
afc76b8b8011218 Guo Ren        2020-12-17   46  	REG_L	a2, ABI_A2(sp)
afc76b8b8011218 Guo Ren        2020-12-17   47  	REG_L	a3, ABI_A3(sp)
afc76b8b8011218 Guo Ren        2020-12-17   48  	REG_L	a4, ABI_A4(sp)
afc76b8b8011218 Guo Ren        2020-12-17   49  	REG_L	a5, ABI_A5(sp)
afc76b8b8011218 Guo Ren        2020-12-17   50  	REG_L	a6, ABI_A6(sp)
afc76b8b8011218 Guo Ren        2020-12-17   51  	REG_L	a7, ABI_A7(sp)
6724a76cff85ee2 Guo Ren        2023-01-12   52  	REG_L	t0, ABI_T0(sp)
afc76b8b8011218 Guo Ren        2020-12-17   53  	REG_L	ra, ABI_RA(sp)
afc76b8b8011218 Guo Ren        2020-12-17   54  
afc76b8b8011218 Guo Ren        2020-12-17   55  	addi	sp, sp, ABI_SIZE_ON_STACK
c15ac4fd60d5ffd Alan Kao       2018-02-13   56  	.endm
c15ac4fd60d5ffd Alan Kao       2018-02-13   57  
35e61e8827ee8ea Song Shuai     2023-11-30   58  /**
7caa9765465f60b Puranjay Mohan 2024-04-05   59  * SAVE_ABI_REGS - save regs against the ftrace_regs struct
35e61e8827ee8ea Song Shuai     2023-11-30   60  *
35e61e8827ee8ea Song Shuai     2023-11-30   61  * After the stack is established,
35e61e8827ee8ea Song Shuai     2023-11-30   62  *
35e61e8827ee8ea Song Shuai     2023-11-30   63  * 0(sp) stores the PC of the traced function which can be accessed
b2137c3b6d7a456 Andy Chiu      2025-04-08   64  * by &(fregs)->epc in tracing function.
35e61e8827ee8ea Song Shuai     2023-11-30   65  *
35e61e8827ee8ea Song Shuai     2023-11-30   66  * 8(sp) stores the function return address (i.e. parent IP) that
7caa9765465f60b Puranjay Mohan 2024-04-05   67  * can be accessed by &(fregs)->ra in tracing function.
35e61e8827ee8ea Song Shuai     2023-11-30   68  *
35e61e8827ee8ea Song Shuai     2023-11-30   69  * The other regs are saved at the respective localtion and accessed
7caa9765465f60b Puranjay Mohan 2024-04-05   70  * by the respective ftrace_regs member.
35e61e8827ee8ea Song Shuai     2023-11-30   71  *
35e61e8827ee8ea Song Shuai     2023-11-30   72  * Here is the layout of stack for your reference.
35e61e8827ee8ea Song Shuai     2023-11-30   73  *
35e61e8827ee8ea Song Shuai     2023-11-30   74  * PT_SIZE_ON_STACK  ->  +++++++++
35e61e8827ee8ea Song Shuai     2023-11-30   75  *                       + ..... +
35e61e8827ee8ea Song Shuai     2023-11-30   76  *                       + a0-a7 + --++++-> ftrace_caller saved
7caa9765465f60b Puranjay Mohan 2024-04-05   77  *                       + t1    + --++++-> direct tramp address
7caa9765465f60b Puranjay Mohan 2024-04-05   78  *                       + s0    + --+ // frame pointer
35e61e8827ee8ea Song Shuai     2023-11-30   79  *                       + sp    +   +
35e61e8827ee8ea Song Shuai     2023-11-30   80  *                       + ra    + --+ // parent IP
35e61e8827ee8ea Song Shuai     2023-11-30   81  *               sp  ->  + epc   + --+ // PC
35e61e8827ee8ea Song Shuai     2023-11-30   82  *                       +++++++++
35e61e8827ee8ea Song Shuai     2023-11-30   83  **/
7caa9765465f60b Puranjay Mohan 2024-04-05   84  	.macro SAVE_ABI_REGS
7caa9765465f60b Puranjay Mohan 2024-04-05  @85  	addi	sp, sp, -FREGS_SIZE_ON_STACK
7caa9765465f60b Puranjay Mohan 2024-04-05  @86  	REG_S	t0,  FREGS_EPC(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05  @87  	REG_S	x1,  FREGS_RA(sp)
35e61e8827ee8ea Song Shuai     2023-11-30   88  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
7caa9765465f60b Puranjay Mohan 2024-04-05   89  	REG_S	x8,  FREGS_S0(sp)
35e61e8827ee8ea Song Shuai     2023-11-30   90  #endif
7caa9765465f60b Puranjay Mohan 2024-04-05  @91  	REG_S	x6,  FREGS_T1(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08   92  #ifdef CONFIG_CC_IS_CLANG
f8693f6dffcd186 Andy Chiu      2025-04-08   93  	REG_S	x7,  FREGS_T2(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08   94  	REG_S	x28, FREGS_T3(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08   95  	REG_S	x29, FREGS_T4(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08   96  	REG_S	x30, FREGS_T5(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08   97  	REG_S	x31, FREGS_T6(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08   98  #endif
7caa9765465f60b Puranjay Mohan 2024-04-05   99  	// save the arguments
7caa9765465f60b Puranjay Mohan 2024-04-05 @100  	REG_S	x10, FREGS_A0(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @101  	REG_S	x11, FREGS_A1(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @102  	REG_S	x12, FREGS_A2(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @103  	REG_S	x13, FREGS_A3(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @104  	REG_S	x14, FREGS_A4(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @105  	REG_S	x15, FREGS_A5(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @106  	REG_S	x16, FREGS_A6(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @107  	REG_S	x17, FREGS_A7(sp)
b21cdb9523e5561 Andy Chiu      2025-04-08  108  	mv	a0, sp
b21cdb9523e5561 Andy Chiu      2025-04-08 @109  	addi	a0, a0, FREGS_SIZE_ON_STACK
b21cdb9523e5561 Andy Chiu      2025-04-08 @110  	REG_S	a0, FREGS_SP(sp)	// Put original SP on stack
bc1a4c3a8425568 Alan Kao       2018-02-13  111  	.endm
bc1a4c3a8425568 Alan Kao       2018-02-13  112  
b21cdb9523e5561 Andy Chiu      2025-04-08  113  	.macro RESTORE_ABI_REGS
7caa9765465f60b Puranjay Mohan 2024-04-05 @114  	REG_L	t0, FREGS_EPC(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @115  	REG_L	x1, FREGS_RA(sp)
35e61e8827ee8ea Song Shuai     2023-11-30  116  #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
7caa9765465f60b Puranjay Mohan 2024-04-05  117  	REG_L	x8, FREGS_S0(sp)
35e61e8827ee8ea Song Shuai     2023-11-30  118  #endif
7caa9765465f60b Puranjay Mohan 2024-04-05 @119  	REG_L	x6,  FREGS_T1(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08  120  #ifdef CONFIG_CC_IS_CLANG
f8693f6dffcd186 Andy Chiu      2025-04-08  121  	REG_L	x7,  FREGS_T2(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08  122  	REG_L	x28, FREGS_T3(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08  123  	REG_L	x29, FREGS_T4(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08  124  	REG_L	x30, FREGS_T5(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08  125  	REG_L	x31, FREGS_T6(sp)
f8693f6dffcd186 Andy Chiu      2025-04-08  126  #endif
7caa9765465f60b Puranjay Mohan 2024-04-05  127  	// restore the arguments
7caa9765465f60b Puranjay Mohan 2024-04-05 @128  	REG_L	x10, FREGS_A0(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @129  	REG_L	x11, FREGS_A1(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @130  	REG_L	x12, FREGS_A2(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @131  	REG_L	x13, FREGS_A3(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @132  	REG_L	x14, FREGS_A4(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @133  	REG_L	x15, FREGS_A5(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @134  	REG_L	x16, FREGS_A6(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05 @135  	REG_L	x17, FREGS_A7(sp)
7caa9765465f60b Puranjay Mohan 2024-04-05  136  
7caa9765465f60b Puranjay Mohan 2024-04-05  137  	addi	sp, sp, FREGS_SIZE_ON_STACK
afc76b8b8011218 Guo Ren        2020-12-17  138  	.endm
35e61e8827ee8ea Song Shuai     2023-11-30  139  
35e61e8827ee8ea Song Shuai     2023-11-30  140  	.macro PREPARE_ARGS
b2137c3b6d7a456 Andy Chiu      2025-04-08  141  	addi	a0, t0, -MCOUNT_JALR_SIZE	// ip (callsite's jalr insn)
b21cdb9523e5561 Andy Chiu      2025-04-08  142  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
b21cdb9523e5561 Andy Chiu      2025-04-08  143  	mv 	a1, ra				// parent_ip
b21cdb9523e5561 Andy Chiu      2025-04-08  144  	REG_L   a2, -16(t0)			// op
b21cdb9523e5561 Andy Chiu      2025-04-08  145  	REG_L   ra, FTRACE_OPS_FUNC(a2)		// op->func
b21cdb9523e5561 Andy Chiu      2025-04-08  146  #else
b21cdb9523e5561 Andy Chiu      2025-04-08  147  	la	a1, function_trace_op
b21cdb9523e5561 Andy Chiu      2025-04-08  148  	REG_L	a2, 0(a1)			// op
b21cdb9523e5561 Andy Chiu      2025-04-08  149  	mv	a1, ra				// parent_ip
b21cdb9523e5561 Andy Chiu      2025-04-08  150  #endif
b21cdb9523e5561 Andy Chiu      2025-04-08  151  	mv	a3, sp				// regs
b21cdb9523e5561 Andy Chiu      2025-04-08  152  	.endm
b21cdb9523e5561 Andy Chiu      2025-04-08  153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
