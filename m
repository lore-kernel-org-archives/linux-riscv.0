Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C04EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsZgXfxTK4tT0SuaXdcmxjckTabRD7OMXLOd0V35rPw=; b=q37KHeKzrhFyKi
	NogZY8WyVOrykKgcShHjzr99WIXkncffAvDSU2ZbFPjynJhA6Ud9FWTOU0SrV8GnBtWAu8i9F+p6/
	JiQ4pNCo/MAb6Nb4GFNSPpjCh9L6E7ToMSuqhcw2qsH/Uc0+sByYOAzPev7wrMC0QMWEDQPVi3zzG
	Ser9hTt6AUpGtmZEN36RU7yU/A0Mw7jxKl703kW+klW29gsUzkBVgcZjvsIR8s3vYIfchyRvdqUZ2
	a3lkyUVnXNLf4H4XugE3lOA8atJGX+F8ncM+gjKoRhG5MhG1NMY63tgQ7qrlaa/kTd8TuMZIvNHTZ
	+m5e/x7iAWKZ+v4eYnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqjM-0015CP-1U;
	Thu, 29 Jun 2023 12:26:36 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqjI-0015Bq-1h
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 12:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688041592; x=1719577592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0o1PLQFg9YJAxU4F7OxUhopL9W2Htn2NqsUM9AgVd30=;
  b=IQuZHBSS+aLy5BG9EILplV04XdPHSGGbeu4ycp3VNynaXUQm1vzOyvNg
   d5fGXcc81G5j11PR8vF9BwShN1ISFSEkAc/az2sMIWO2rA+NWv0QuqppG
   m1ediQGWoeD+E10N98XTIAIHCoHfj5xhZQC6f6MIUWBIVn3Refp5eyUUH
   j88l9htBeJzq0/ydpOF1aHpa4YDo0iIz+ZjVCwk0+btMcebkpGCQqMx4n
   jd1jBl1o3yOk7qTH4WXz/uR8yko15Klb1xUwvKWBlna6sA5k8Oraio260
   DnaPxidKTuoOIRNXxn+4hVPZWjlzr2JV1jGtsb2sxIpqS95siifW6fhWV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="360941779"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="360941779"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 05:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="711397816"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="711397816"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jun 2023 05:26:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEqjB-000E8z-1o;
	Thu, 29 Jun 2023 12:26:25 +0000
Date: Thu, 29 Jun 2023 20:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux@rivosinc.com,
	=?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>,
	Darius Rad <darius@bluespec.com>
Subject: Re: [PATCH v3] riscv: Discard vector state on syscalls
Message-ID: <202306292011.OGfLGBam-lkp@intel.com>
References: <20230629062730.985184-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629062730.985184-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_052632_573939_67759AAA 
X-CRM114-Status: GOOD (  10.41  )
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
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230629=
/202306292011.OGfLGBam-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306292011.O=
GfLGBam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306292011.OGfLGBam-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps.c: In function 'do_trap_ecall_u':
>> arch/riscv/kernel/traps.c:299:17: error: implicit declaration of functio=
n 'riscv_v_vstate_discard'; did you mean 'riscv_v_vstate_restore'? [-Werror=
=3Dimplicit-function-declaration]
     299 |                 riscv_v_vstate_discard(regs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 riscv_v_vstate_restore
   cc1: some warnings being treated as errors


vim +299 arch/riscv/kernel/traps.c

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
