Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C40ECAAD4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9v3yh/74uvR/ychnsugWc/FSEVFoHqRZ13v/Qh9OPM=; b=iInhFZG0UA/w4J
	pPYugmMbTcbyKhilfqpqnhq5coqgNR+I+lIKY82lILpzLPOfSJcAx/JGznQVp3q64hs0RbJraNhTg
	4AhbZQLCXfr+LAxyd70jLtROMDlVDMDXriD3K7qozJ7jFgvoqRno/lJARDEW+XY4siJcwA6lEqah7
	CVewKhvHlAxajmZ/kfcg6Au3cktHPTYSUXxDGAYTix1Jzoo+9+Uz1dv404lt2fNDVcSP4QDT4U/P0
	T9o8g8kZJQORPj8ciISkDtIrY8V6dOdwX8l6qWopMz5ForrTKt0PDUgy051zlfX3n4bnDre5zEXIc
	WP0aW8jw9Oo6kxS46rjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmyN-003UqC-1e; Sun, 04 Sep 2022 10:35:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmyJ-003Umb-I7
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 10:35:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48ABC60F4F
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7CFC43140
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662287721;
	bh=xdeVGuwDIVCVU+rvdeDeQYqrkKbZlmc2u/NK3uiq/hQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VFzOTmMFsxIgruZB2STurj+wx6ZMg0ysKioGM+awmrmv9aYFrkxPj1COiq7y5L9Rz
	 16DkF3v7Wyvnb+l26yvJ5Gc6Vjx9NtU1jrOTcsX+ogUP9v4hjW015POy1lKzyqeRwd
	 2Q14DNjduv/LA6Onro+ll0Vtawz0L9n1aIoBEboMweoay1gupce6c4dAzpAMnOBKjb
	 DIN4dAhSIQzLt7Iuu+s9umV4bepSg/1fnCTUOBg+fFD504kPMGGfqg+dM8L4JSMAAs
	 OgJ5MDXg6LdxIhXw49GVBifsH3+Y1H93BP+vPqnxqRbpsrsBWXGVU/OBgjAQflpaIi
	 MQLNOOx7eai0A==
Received: by mail-ot1-f46.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so4461612otq.11
        for <linux-riscv@lists.infradead.org>; Sun, 04 Sep 2022 03:35:21 -0700 (PDT)
X-Gm-Message-State: ACgBeo1nyPcUz1Nl6v5H1XNuZrmTZQRZMY67AjwkIYr/bUPSpxeeaBjq
	1JLX/X6qTrJRK6i3Tz6iR7c8/a4xdCrAeWpouts=
X-Google-Smtp-Source: AA6agR4aNwp+b7X8LY9K2G7rnThgdM7+ajNHmPCDpYSeAOY9uRJ8H1HSJuyNI0QUDOCt2F1FUmUcZBE/Yj63I71GMvk=
X-Received: by 2002:a05:6830:3482:b0:638:92b7:f09b with SMTP id
 c2-20020a056830348200b0063892b7f09bmr17354165otu.140.1662287720669; Sun, 04
 Sep 2022 03:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220903163808.1954131-2-guoren@kernel.org> <202209041559.Mnnj8WRz-lkp@intel.com>
 <CAJF2gTSekwXtdAGArPWiWshSDZuPH569jHBJZkpcf9JPdvS7hA@mail.gmail.com> <de36b174-ddeb-02cc-8271-6db8ee16f6fc@microchip.com>
In-Reply-To: <de36b174-ddeb-02cc-8271-6db8ee16f6fc@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 4 Sep 2022 18:35:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR3_O11ps7J6am9wXXjUfsKV1Fr72OiUOVVzQidpuo4YQ@mail.gmail.com>
Message-ID: <CAJF2gTR3_O11ps7J6am9wXXjUfsKV1Fr72OiUOVVzQidpuo4YQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: convert to generic entry
To: Conor.Dooley@microchip.com
Cc: lkp@intel.com, arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, kbuild-all@lists.01.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com, 
	chenhuacai@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_033523_705486_A16DC64B 
X-CRM114-Status: GOOD (  33.47  )
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

On Sun, Sep 4, 2022 at 6:23 PM <Conor.Dooley@microchip.com> wrote:
>
> On 04/09/2022 10:01, Guo Ren wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > The problem is the robot only picks one of my patch series.
>
> If there are build dependencies, could you just send it all as
> a single series?
It depends on riscv: cleanup disable_ptrace.

See V2.

> Thanks,
> Conor.
>
> >
> > git:(8390e92d0bcc) git log --oneline -8
> > 8390e92d0bcc (HEAD) riscv: convert to generic entry
> > b224d265f838 soc: document merges
> > a10b904f72e1 Merge branch 'arm/soc' into for-next
> > 566e373fe047 arm64: Kconfig.platforms: Group NXP platforms together
> > 96796c914b84 arm64: Kconfig.platforms: Re-organized Broadcom menu
> > 3779852e05c7 Merge branch 'arm/defconfig' into for-next
> > 646e8ad3e676 Merge branch 'arm/drivers' into for-next
> > 086e9b3719ae Merge branch 'arm/dt' into for-next
> >
> > After cherry-pick all patches, all is right:
> > 27642008ec1f (HEAD) riscv: compat_syscall_table: Fixup compile warning
> > afcaaabc38e0 riscv: elf_kexec: Fixup compile warning
> > 741c29016482 riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
> > 4eb9469a3bc8 riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
> > a372b565b7c9 riscv: convert to generic entry
> > 2d228d709c92 riscv: ptrace: Remove duplicate operation
> > b224d265f838 soc: document merges
> > a10b904f72e1 Merge branch 'arm/soc' into for-next
> >
> > If you want to try the riscv generic entry, please use the
> > v6.0-rc3-based branch [1].
> >
> > [1]: https://github.com/guoren83/linux/tree/generic_entry_v2
> >
> > On Sun, Sep 4, 2022 at 3:39 PM kernel test robot <lkp@intel.com> wrote:
> >>
> >> Hi,
> >>
> >> I love your patch! Yet something to improve:
> >>
> >> [auto build test ERROR on soc/for-next]
> >> [also build test ERROR on linus/master v6.0-rc3 next-20220901]
> >> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> >> config: riscv-rv32_defconfig
> >> compiler: riscv32-linux-gcc (GCC) 12.1.0
> >> reproduce (this is a W=1 build):
> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         # https://github.com/intel-lab-lkp/linux/commit/8390e92d0bcc635f457df18c8c1baefc78a94e48
> >>         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >>         git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
> >>         git checkout 8390e92d0bcc635f457df18c8c1baefc78a94e48
> >>         # save the config file
> >>         mkdir build_dir && cp config build_dir/.config
> >>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> >>
> >> If you fix the issue, kindly add following tag where applicable
> >> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>    arch/riscv/kernel/sys_riscv.c:80:17: warning: no previous prototype for 'do_sys_ecall_u' [-Wmissing-prototypes]
> >>       80 | asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
> >>          |                 ^~~~~~~~~~~~~~
> >>    arch/riscv/kernel/sys_riscv.c: In function 'do_sys_ecall_u':
> >>>> arch/riscv/kernel/sys_riscv.c:83:39: error: 'SR_UXL' undeclared (first use in this function); did you mean 'SR_XS'?
> >>       83 |         ulong sr_uxl = regs->status & SR_UXL;
> >>          |                                       ^~~~~~
> >>          |                                       SR_XS
> >>    arch/riscv/kernel/sys_riscv.c:83:39: note: each undeclared identifier is reported only once for each function it appears in
> >>>> arch/riscv/kernel/sys_riscv.c:91:23: error: 'SR_UXL_32' undeclared (first use in this function)
> >>       91 |         if (sr_uxl == SR_UXL_32)
> >>          |                       ^~~~~~~~~
> >>
> >>
> >> vim +83 arch/riscv/kernel/sys_riscv.c
> >>
> >>     79
> >>     80  asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
> >>     81  {
> >>     82          syscall_t syscall;
> >>   > 83          ulong sr_uxl = regs->status & SR_UXL;
> >>     84          ulong nr = regs->a7;
> >>     85
> >>     86          regs->epc += 4;
> >>     87          regs->orig_a0 = regs->a0;
> >>     88          regs->a0 = -ENOSYS;
> >>     89
> >>     90          nr = syscall_enter_from_user_mode(regs, nr);
> >>   > 91          if (sr_uxl == SR_UXL_32)
> >>
> >> --
> >> 0-DAY CI Kernel Test Service
> >> https://01.org/lkp
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
