Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4CAE743D3
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 01:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaKLAqFNKmKFRemAzd98SSLYkZ2Y2u8vub/0GJX4va8=; b=hffnZosoFUgIns
	LNckPs5q7D4GS/qF/xxaGjEoRmYfRJRtIzfX2EwuB1Q5bodYiREB6InGCqhjm9unzNpkBSpN4QILe
	v225cNRUPUrEkK6BKzbXiM3x+S+nS0kvhBaJ6E2xu6v7nnQdZjZ+xs34GPe240AZkYrggDQWGURkd
	eSQof9ujMe27l6qXSzZUE8xrccnGmfrXvTrezBgWwZsIsFBse8xoPQzAfxGhxLQ5S6daEKfgi/H8W
	8bEndQL6odOhQMslPhkvYfpI99l3lGNu9JaGHZdNWmTbFtHbB/wioPk+rWqpesummUxOJ5UNs64iS
	suLV+7S2Yw+Y60unTpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm1uv-006xVX-0O;
	Fri, 29 Sep 2023 01:03:41 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm1ur-006xV2-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 01:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695949417; x=1727485417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=N78cAAZkwSzZQ/y3pbMOcajxYV4P3x+HCUtYShyNIt4=;
  b=YNXCGZrYS8a3zJIusQhZ8QpzORbsFwTBPvEWBbNQPd8DCw3SR7gMduMA
   h4LoE19C+YucgQ3x8yz3PRkIthsPCGXZnetZNd1Th8foxAZhCtGiHd7/U
   qaDC2LZoEYCWWMfH/phz4D3r9hXD2eghzfW5aaZT5Vh+LKfWWe0eaD2v+
   H6DaJ8fRvBtLNA4BfF2uIejyDLnPP9bMUn/9aSA9s0LWT2+kjH769hNLU
   HreoIUspRNv5J/Y0cBiqdkg1dQB2gY9PIvv1SvKGGKensBvoU2HMC18RL
   24tVNy82tHc5Wjtygf/PVo6yCqK7n4tI+LeXz7mpufnpLSZq9QORTe3eE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413119752"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="413119752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 18:03:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865506909"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="865506909"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2023 18:03:21 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm1uZ-0002EF-16;
	Fri, 29 Sep 2023 01:03:19 +0000
Date: Fri, 29 Sep 2023 09:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Topel <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>
Subject: Re: [PATCH 6/7] riscv: report misaligned accesses emulation to
 hwprobe
Message-ID: <202309290842.Dk0K2nsp-lkp@intel.com>
References: <20230926150316.1129648-7-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926150316.1129648-7-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_180337_537561_DA127F1C 
X-CRM114-Status: GOOD (  12.79  )
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

Hi Cl=E9ment,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc3 next-20230928]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-=
remove-unused-functions-in-traps_misaligned-c/20230926-230654
base:   linus/master
patch link:    https://lore.kernel.org/r/20230926150316.1129648-7-cleger%40=
rivosinc.com
patch subject: [PATCH 6/7] riscv: report misaligned accesses emulation to h=
wprobe
config: riscv-randconfig-002-20230929 (https://download.01.org/0day-ci/arch=
ive/20230929/202309290842.Dk0K2nsp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20230929/202309290842.Dk0K2nsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290842.Dk0K2nsp-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/kernel/traps_misaligned.c: In function 'handle_misaligned_loa=
d':
   arch/riscv/kernel/traps_misaligned.c:420:48: error: 'struct thread_struc=
t' has no member named 'align_ctl'
     420 |         if (user_mode(regs) && (current->thread.align_ctl & PR_U=
NALIGN_SIGBUS))
         |                                                ^
   arch/riscv/kernel/traps_misaligned.c: In function 'handle_misaligned_sto=
re':
   arch/riscv/kernel/traps_misaligned.c:522:48: error: 'struct thread_struc=
t' has no member named 'align_ctl'
     522 |         if (user_mode(regs) && (current->thread.align_ctl & PR_U=
NALIGN_SIGBUS))
         |                                                ^
   arch/riscv/kernel/traps_misaligned.c: In function 'check_unaligned_acces=
s_emulated':
>> arch/riscv/kernel/traps_misaligned.c:610:17: error: expected ':' or ')' =
before '_ASM_EXTABLE'
     610 |                 _ASM_EXTABLE(1b, 2b)
         |                 ^~~~~~~~~~~~
>> arch/riscv/kernel/traps_misaligned.c:610:30: error: invalid suffix "b" o=
n integer constant
     610 |                 _ASM_EXTABLE(1b, 2b)
         |                              ^~
   arch/riscv/kernel/traps_misaligned.c:610:34: error: invalid suffix "b" o=
n integer constant
     610 |                 _ASM_EXTABLE(1b, 2b)
         |                                  ^~
>> arch/riscv/kernel/traps_misaligned.c:602:37: warning: unused variable 't=
mp_var' [-Wunused-variable]
     602 |         unsigned long emulated =3D 1, tmp_var;
         |                                     ^~~~~~~


vim +610 arch/riscv/kernel/traps_misaligned.c

   599	=

   600	bool check_unaligned_access_emulated(int cpu)
   601	{
 > 602		unsigned long emulated =3D 1, tmp_var;
   603	=

   604		/* Use a fixup to detect if misaligned access triggered an exceptio=
n */
   605		__asm__ __volatile__ (
   606			"1:\n"
   607			"	"REG_L" %[tmp], 1(%[ptr])\n"
   608			"	li %[emulated], 0\n"
   609			"2:\n"
 > 610			_ASM_EXTABLE(1b, 2b)
   611		: [emulated] "+r" (emulated), [tmp] "=3Dr" (tmp_var)
   612		: [ptr] "r" (&tmp_var)
   613		: "memory");
   614	=

   615		if (!emulated)
   616			return false;
   617	=

   618		per_cpu(misaligned_access_speed, cpu) =3D
   619			RISCV_HWPROBE_MISALIGNED_EMULATED;
   620	=

   621		return true;
   622	}
   623	=


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
