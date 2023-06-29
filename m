Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D773EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tkk3kjK3JcjfgiM1sWt8df/HuO1UKLpQZywISeJDHA0=; b=W1B7JnK1DMnRA/
	REVRIvRpEhykt4rxBc47Vk8klwg5koHhykHgT8AnjeUEYm2J6J9L9ZfMKVDgo5nDUV7PUMzmhituZ
	9WZCwRQmGjSYovvPjpMaGE5is5EjaJf3OrUFoSAAh/VoAlRTHwzU92EzL4yVGtkjaDsBY3FYns74Q
	FX5VXfFk3JmibjSBv/rXAVoVYGuKihKPavYteHZL9xIi7VLbXV94N/Ui9/PvROE7RsleHon8Y11tE
	Cx1SnJSNOq2iBvRGsRLKF1E2bEwpkHWEeAP/IFQMrDD1V5HEmReAsKV13TE9/UvLboSkwrGiC9G3q
	SNr4fykLvLTZ7P8z5Phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmed-000JKH-0z;
	Thu, 29 Jun 2023 08:05:27 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmeZ-000JIk-22
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688025923; x=1719561923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5Y+YCSow5LvUte0a0y0qeDa2mDYP7COwAuMVhjDb7ms=;
  b=FHp++rtM2nyfyTI+ot8wqSRgunNFKyvCNdeRQ+wdSt8HMtsaZMvlduna
   k44vqqbjwLlU/FgNI0bUSxjMzVdcGazBTXawpIESZYYzOIxUgS2J7tflW
   IX3yw1N5OvBudrGz6UajOQkeXUS7Yr9HMjfGx0633On0frRDnmQ7gsgGK
   M4o7CDFHDEiL9ez7s3CGFCe5c8p8n3K1pnsKhKe1E2DBNEHWz42uSwKMc
   u57AvGMeB8WX9uKeQ2jmj6pl8kcPAv/XMtdJoFJduTWiHIM9E6cRU1Jat
   5tcG6FyuXMBn6kAnEX5/HJTuR9hZl1FVAOU4u4nDr2NIdDuPvAtBZfUh1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364596611"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="364596611"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 01:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="807220312"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="807220312"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2023 01:05:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEmeR-000Dys-37;
	Thu, 29 Jun 2023 08:05:15 +0000
Date: Thu, 29 Jun 2023 16:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux@rivosinc.com,
	=?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>,
	Darius Rad <darius@bluespec.com>
Subject: Re: [PATCH v3] riscv: Discard vector state on syscalls
Message-ID: <202306291513.DwaMo6k7-lkp@intel.com>
References: <20230629062730.985184-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629062730.985184-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_010523_718272_3E2D0C2C 
X-CRM114-Status: GOOD (  12.08  )
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

Hi Bj=F6rn,

kernel test robot noticed the following build errors:

[auto build test ERROR on 488833ccdcac118da16701f4ee0673b20ba47fe3]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/riscv-Di=
scard-vector-state-on-syscalls/20230629-142852
base:   488833ccdcac118da16701f4ee0673b20ba47fe3
patch link:    https://lore.kernel.org/r/20230629062730.985184-1-bjorn%40ke=
rnel.org
patch subject: [PATCH v3] riscv: Discard vector state on syscalls
config: riscv-randconfig-r042-20230629 (https://download.01.org/0day-ci/arc=
hive/20230629/202306291513.DwaMo6k7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a=
5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306291513.D=
waMo6k7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306291513.DwaMo6k7-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/traps.c:15:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     751 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), bu=
ffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/traps.c:15:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), bu=
ffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/traps.c:15:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), =
buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/traps.c:15:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), =
buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/traps.c:15:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), =
buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/traps.c:15:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
>> arch/riscv/kernel/traps.c:299:3: error: call to undeclared function 'ris=
cv_v_vstate_discard'; ISO C99 and later do not support implicit function de=
clarations [-Wimplicit-function-declaration]
     299 |                 riscv_v_vstate_discard(regs);
         |                 ^
   arch/riscv/kernel/traps.c:299:3: note: did you mean 'riscv_v_vstate_quer=
y'?
   arch/riscv/include/asm/vector.h:206:20: note: 'riscv_v_vstate_query' dec=
lared here
     206 | static inline bool riscv_v_vstate_query(struct pt_regs *regs) { =
return false; }
         |                    ^
   13 warnings and 1 error generated.


vim +/riscv_v_vstate_discard +299 arch/riscv/kernel/traps.c

   290	=

   291	asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_r=
egs *regs)
   292	{
   293		if (user_mode(regs)) {
   294			ulong syscall =3D regs->a7;
   295	=

   296			regs->epc +=3D 4;
   297			regs->orig_a0 =3D regs->a0;
   298	=

 > 299			riscv_v_vstate_discard(regs);
   300	=

   301			syscall =3D syscall_enter_from_user_mode(regs, syscall);
   302	=

   303			if (syscall < NR_syscalls)
   304				syscall_handler(regs, syscall);
   305			else
   306				regs->a0 =3D -ENOSYS;
   307	=

   308			syscall_exit_to_user_mode(regs);
   309		} else {
   310			irqentry_state_t state =3D irqentry_nmi_enter(regs);
   311	=

   312			do_trap_error(regs, SIGILL, ILL_ILLTRP, regs->epc,
   313				"Oops - environment call from U-mode");
   314	=

   315			irqentry_nmi_exit(regs, state);
   316		}
   317	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
