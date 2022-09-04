Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA6FC54EE9
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 00:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idVKSh/O0q6O1K7eiDH0DPhWdoSTjGwYVr3YKYfQNlc=; b=KyFHavYeJiS7Jb
	gFcsxGUevcePQowb4GwWq/awwDz6evjFMJ9MqI4Vsw9cPkjHWwWYBrQg9v8sZ0yTXEH01FQoON5AA
	8HKed9fYJsXwxPQVZm4sAMlNkU5cRSzyEd+OBoezT54K4C2I0W+pn95Jv3oMKUnjV4m9AzXIsBAtz
	b+bJz2BOdC99Lap1OoV33dYua8+oSOnMbNseb/xK9F8yXnZn9Of8cLMCNIR4NRm6aWmvbRC95YXbF
	0cNgG2qI/vGrvFATx0NTc1yFI2da3ix4MSNVs+o/zlExSZqj3I5LrB+9NQcXkMrXhJeHk9grqvR94
	IjxJ46LVdEWkCZaUWE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUd7m-007WGK-TL; Sun, 04 Sep 2022 00:04:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUd7j-007Vur-He
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 00:04:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CE2E1B80C71
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 00:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D43C43141
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 00:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662249859;
	bh=KoBcKASn8qA//k0q8Ko3Kw15nV3tnc0Cq8A9Lc6qS2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NdxZRRaQDTmrzkWXFeVybd/TdF7FjscPT47/ARklt7ZgWR5S+22+TXu0dzkVPVhb1
	 a31Cke7rub19cP4VJgeULHCBnvBfnbOSmyFnYFrC5z8nYwGc4/SYys88p9cU0HRLM8
	 n11Ow83e4k1mzbNUcQ4U+sM7kNmFEeEO4ujAQRmSyzlK3WqCMPRN3eEDh8YFkPMRUs
	 v3wFPU0WCJluAOT5bBymKqxvM3FA6TdQdil432D5MhA29TkldSBdR50cy17pSC95Zf
	 pUBPHMeGbvJFjbxQ+7RplRCgdQ5pbRqMFcwU81X7NAXL5p3c2BnfJC1gR8eHhc3Hbr
	 98UppoBmbfPng==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-11edd61a9edso13834949fac.5
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 17:04:19 -0700 (PDT)
X-Gm-Message-State: ACgBeo1+qjaJ7sYvGkY5iBLA3QlkWJ6Rhh18FuhaWYufYj/VmBUG/Bpl
	bdDIBVDDGmWOqR3UMr7YHM5JF+aih7ucj/Akevk=
X-Google-Smtp-Source: AA6agR77EBLmMj9+Q0o/9QIp5FTxFDt+rkmb/qt7Y2jzmFtjgapjSdtfZhSF08/NbwXO8Vu04joLKLktUvxiUio0tnU=
X-Received: by 2002:a05:6870:7092:b0:11e:ff3a:d984 with SMTP id
 v18-20020a056870709200b0011eff3ad984mr5348554oae.19.1662249858171; Sat, 03
 Sep 2022 17:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220903163808.1954131-4-guoren@kernel.org> <202209040118.GmG1Lby1-lkp@intel.com>
In-Reply-To: <202209040118.GmG1Lby1-lkp@intel.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 4 Sep 2022 08:04:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQFYAth8WDwch-d1ASFEaKFJTuMrZgJEttOoBZtxay6nQ@mail.gmail.com>
Message-ID: <CAJF2gTQFYAth8WDwch-d1ASFEaKFJTuMrZgJEttOoBZtxay6nQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
To: kernel test robot <lkp@intel.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	kbuild-all@lists.01.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_170427_903883_673428ED 
X-CRM114-Status: GOOD (  20.25  )
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

Oops, there is no warning with 6.0-rc3. But it's a bug, I fixed that by:

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index afc8c030c222..5871eccbbd94 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -12,6 +12,7 @@
 #include <linux/syscalls.h>
 #include <linux/resume_user_mode.h>
 #include <linux/linkage.h>
+#include <linux/entry-common.h>

 #include <asm/ucontext.h>
 #include <asm/vdso.h>
@@ -272,7 +273,7 @@ static void handle_signal(struct ksignal *ksig,
struct pt_regs *regs)
        signal_setup_done(ret, ksig, 0);
 }

-void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
+void arch_do_signal_or_restart(struct pt_regs *regs)
 {
        struct ksignal ksig;

On Sun, Sep 4, 2022 at 1:59 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on soc/for-next]
> [also build test WARNING on linus/master v6.0-rc3 next-20220901]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220904/202209040118.GmG1Lby1-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/6ed1ef93b372116f7d4586b13bfd352e19453740
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
>         git checkout 6ed1ef93b372116f7d4586b13bfd352e19453740
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> arch/riscv/kernel/irq.c:48:6: warning: no previous prototype for 'do_softirq_own_stack' [-Wmissing-prototypes]
>       48 | void do_softirq_own_stack(void)
>          |      ^~~~~~~~~~~~~~~~~~~~
>    arch/riscv/kernel/irq.c:74:25: warning: no previous prototype for 'handle_riscv_irq' [-Wmissing-prototypes]
>       74 | asmlinkage void noinstr handle_riscv_irq(struct pt_regs *regs)
>          |                         ^~~~~~~~~~~~~~~~
>    arch/riscv/kernel/irq.c:85:25: warning: no previous prototype for 'do_riscv_irq' [-Wmissing-prototypes]
>       85 | asmlinkage void noinstr do_riscv_irq(struct pt_regs *regs)
>          |                         ^~~~~~~~~~~~
>
>
> vim +/do_softirq_own_stack +48 arch/riscv/kernel/irq.c
>
>     47
>   > 48  void do_softirq_own_stack(void)
>     49  {
>     50          ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id());
>     51
>     52          call_on_stack(NULL, sp, do_riscv_softirq, 0);
>     53  }
>     54  #endif /* CONFIG_PREEMPT_RT */
>     55
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
