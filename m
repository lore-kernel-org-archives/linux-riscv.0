Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64D9ECAAD3
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efntTV9jMzM63p9K58qvcxmufi30s6ZS+vEz2XGnxHI=; b=Eda05Zr4l0kN11
	xwr3hYJtgFnNlH/tHxiunELJv6qs1WXuNQbfDg2qajj7qeZq8HNNO73KG3O7sesgKtSJPRCR7mIDR
	i08r705c/REJuf06EcCfYdZbRcZOK7Qilp7rJrGasXBlw26DNx+Q9nTj0OQNkzzpC1N1/dXyxnhhc
	ZLas7GrGrD/blTASAI49734jUju9e0HFhhuE5oa1CHfyxrRPJSh5kNh3QyALCUk0dscswOxXKSttj
	cSMt8KLS1Ctj4f82+qH2RdZPomFNX9m5neaAoQYYX5TGXA2ftmUYrnbxSuMb2ymn4tfHcoKldn8cY
	rJjdBt1bVcRc6Eizr47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUlVb-001meb-Ka; Sun, 04 Sep 2022 09:01:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUlVY-001mOv-Bi
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 09:01:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 11E95B80D34
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 09:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D290C43140
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662282093;
	bh=HlPvNDiHsWvi8VNASLwoCrNd5NLgOHJdkOMDeDxRhjw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ER3l7ne4UR78n1M8oOF5+Ddu+uZKu+pPv7DEI3pJSVoWkfH7JQhr8i+lKRhgc925a
	 Z0BcGmoblqarce+QdMQ8etN8gJNBZ9wkpjJewxpn8F65JY21sE/qWB1lChIvGaEvbc
	 yLIb+a60HS6kZhUjUOc6HA481gFLMd9taepA41oDSgUCYQzDrkssLRmVbhRXB19abS
	 myGqbbq4BU8haC0MyxLkI9DD3fhMKeJABoJX4IBExZbG4ZElCzvMZCiku2Jq6FM4B0
	 JyyA4iOwA2NCppthamBQQ+uTcKYZmeER2XBs8LHrfXfLQ15hBhxEQcbNX1S3+/hIrp
	 IY072jHfEPjoA==
Received: by mail-ot1-f49.google.com with SMTP id d18-20020a9d72d2000000b0063934f06268so4433794otk.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Sep 2022 02:01:33 -0700 (PDT)
X-Gm-Message-State: ACgBeo1Zy/a1skTZH9qOSqyu8WMqeGKzAfg+hCpSqZovA9D8+mozpzfA
	H6d2igiwaWNRW+gxkD5wLJgZ5LynyBHgEkJDER4=
X-Google-Smtp-Source: AA6agR6qji+0Nhpnm5WxW4jSAWPGEVwh9lBXvI8/VqpHg4LlK62E36LEG/pL13gfE8wYnGOn8BI/JwZn7Hf4eK+i+OE=
X-Received: by 2002:a05:6830:348b:b0:637:899e:146e with SMTP id
 c11-20020a056830348b00b00637899e146emr17070867otu.308.1662282092245; Sun, 04
 Sep 2022 02:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220903163808.1954131-2-guoren@kernel.org> <202209041559.Mnnj8WRz-lkp@intel.com>
In-Reply-To: <202209041559.Mnnj8WRz-lkp@intel.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 4 Sep 2022 17:01:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSekwXtdAGArPWiWshSDZuPH569jHBJZkpcf9JPdvS7hA@mail.gmail.com>
Message-ID: <CAJF2gTSekwXtdAGArPWiWshSDZuPH569jHBJZkpcf9JPdvS7hA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: convert to generic entry
To: kernel test robot <lkp@intel.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, kbuild-all@lists.01.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	Huacai Chen <chenhuacai@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_020136_709172_64945BE5 
X-CRM114-Status: GOOD (  23.23  )
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

The problem is the robot only picks one of my patch series.

git:(8390e92d0bcc) git log --oneline -8
8390e92d0bcc (HEAD) riscv: convert to generic entry
b224d265f838 soc: document merges
a10b904f72e1 Merge branch 'arm/soc' into for-next
566e373fe047 arm64: Kconfig.platforms: Group NXP platforms together
96796c914b84 arm64: Kconfig.platforms: Re-organized Broadcom menu
3779852e05c7 Merge branch 'arm/defconfig' into for-next
646e8ad3e676 Merge branch 'arm/drivers' into for-next
086e9b3719ae Merge branch 'arm/dt' into for-next

After cherry-pick all patches, all is right:
27642008ec1f (HEAD) riscv: compat_syscall_table: Fixup compile warning
afcaaabc38e0 riscv: elf_kexec: Fixup compile warning
741c29016482 riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
4eb9469a3bc8 riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
a372b565b7c9 riscv: convert to generic entry
2d228d709c92 riscv: ptrace: Remove duplicate operation
b224d265f838 soc: document merges
a10b904f72e1 Merge branch 'arm/soc' into for-next

If you want to try the riscv generic entry, please use the
v6.0-rc3-based branch [1].

[1]: https://github.com/guoren83/linux/tree/generic_entry_v2

On Sun, Sep 4, 2022 at 3:39 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on soc/for-next]
> [also build test ERROR on linus/master v6.0-rc3 next-20220901]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> config: riscv-rv32_defconfig
> compiler: riscv32-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/8390e92d0bcc635f457df18c8c1baefc78a94e48
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
>         git checkout 8390e92d0bcc635f457df18c8c1baefc78a94e48
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/riscv/kernel/sys_riscv.c:80:17: warning: no previous prototype for 'do_sys_ecall_u' [-Wmissing-prototypes]
>       80 | asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
>          |                 ^~~~~~~~~~~~~~
>    arch/riscv/kernel/sys_riscv.c: In function 'do_sys_ecall_u':
> >> arch/riscv/kernel/sys_riscv.c:83:39: error: 'SR_UXL' undeclared (first use in this function); did you mean 'SR_XS'?
>       83 |         ulong sr_uxl = regs->status & SR_UXL;
>          |                                       ^~~~~~
>          |                                       SR_XS
>    arch/riscv/kernel/sys_riscv.c:83:39: note: each undeclared identifier is reported only once for each function it appears in
> >> arch/riscv/kernel/sys_riscv.c:91:23: error: 'SR_UXL_32' undeclared (first use in this function)
>       91 |         if (sr_uxl == SR_UXL_32)
>          |                       ^~~~~~~~~
>
>
> vim +83 arch/riscv/kernel/sys_riscv.c
>
>     79
>     80  asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
>     81  {
>     82          syscall_t syscall;
>   > 83          ulong sr_uxl = regs->status & SR_UXL;
>     84          ulong nr = regs->a7;
>     85
>     86          regs->epc += 4;
>     87          regs->orig_a0 = regs->a0;
>     88          regs->a0 = -ENOSYS;
>     89
>     90          nr = syscall_enter_from_user_mode(regs, nr);
>   > 91          if (sr_uxl == SR_UXL_32)
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
