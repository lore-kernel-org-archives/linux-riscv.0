Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA102ECAAD5
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 00:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diya717AgcYFEfOTVvG7i0rusGLL/3HWqXqOhYSVE0E=; b=TG0a8Bmlc03NXl
	nFTSvcNJglXIiJ6oDsTys/a3zzULDI3Q19OOqPi+jtjTUAGAmKx2bb7/hg2kvWmkBpSe0WEBfYSjG
	gGcyEL1jZSGXdT+FP3PwOtGfCNm/ovBcA1uJi4OKXNZJVJ797kgXqeNHzDj8KlBzQ6+Gp47BTSxbt
	TkkVuVPOKCNmNl6SXbfx9U/U+79yC/+ucPwDJHDLABhRzgP5uegQg3Ms6ANRwz3CGaNkIqJ6VveWU
	P/5ai6n2aY2zJTNpsEiFJST7tAgtZZcH7z+AJpLH++IsnktYmCrtG/rJGz+ZKICkjljlB9sVVmorq
	AQUDzX2Vp6z3AZR17lyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUdqM-008fpF-PC; Sun, 04 Sep 2022 00:50:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUdqJ-008fj8-L5
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 00:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8281860E2D
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 00:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691E0C43140
	for <linux-riscv@lists.infradead.org>; Sun,  4 Sep 2022 00:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662252627;
	bh=ksEfQgyVJmtFnHe1G9mJ/zdS+A33wXj6d/7sIqipu3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UGyw8kEvOD7u2JaLt9H4F+9s6PS/KXrFIqm8j2AzeHiFpNSjdORTQpZoEnbJ4v20u
	 azbe7G5m/W3rxGzgpa+p/9Ogj4XcDaQBFWlXxt/3kf2sYJyLIduZ2X2rPSPHuwi68x
	 JDPLjRdhjmzGoa0m0dFoQZ1R+nYgITnxHR/eLGjrtxoQeO7jWAeGNlOJRV0sR0skH7
	 vDNf4BSpboYsAeMGiH/I+ZwTOOOegV10kxNbyvbOk/Bcc1vZlgday38UJITzqDQRuZ
	 u7XctvT3rSgrf9jbV33igGoL0lFqW6hNhXQpLdsUZ1hJyJ1Z/26jMEyIRHe936JLJs
	 MnsOOU/Z87pKg==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-11f0fa892aeso13967388fac.7
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 17:50:27 -0700 (PDT)
X-Gm-Message-State: ACgBeo0zCJSCN5LgzAIXDPzJhXKisG1QqDnYCb9mPsic5yNcV5/DySrG
	MiMnlre3kPXc1fT6HLYlFR6j7+Rm0vSlcitrshY=
X-Google-Smtp-Source: AA6agR4qiR/QXf3Z1El6po8BJBRz2HLjT7oOxsXfAy/JNS0LCsqub54/O+VJE3ccfzOMo6eSjT+FP6O6bNW+Gw3PQoM=
X-Received: by 2002:a05:6808:2028:b0:344:246d:2bed with SMTP id
 q40-20020a056808202800b00344246d2bedmr4637506oiw.19.1662252626504; Sat, 03
 Sep 2022 17:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220903163808.1954131-2-guoren@kernel.org> <202209040122.Nhovi9f6-lkp@intel.com>
In-Reply-To: <202209040122.Nhovi9f6-lkp@intel.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 4 Sep 2022 08:50:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSQBJLq9Mr_wZYGF4DHSWfk7WkERNCokRu0JQdybB04Hg@mail.gmail.com>
Message-ID: <CAJF2gTSQBJLq9Mr_wZYGF4DHSWfk7WkERNCokRu0JQdybB04Hg@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: convert to generic entry
To: kernel test robot <lkp@intel.com>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	kbuild-all@lists.01.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, Huacai Chen <chenhuacai@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_175031_793356_6D17AAF1 
X-CRM114-Status: GOOD (  17.37  )
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

It would be fixed in V2

On Sun, Sep 4, 2022 at 1:49 AM kernel test robot <lkp@intel.com> wrote:
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
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220904/202209040122.Nhovi9f6-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/8390e92d0bcc635f457df18c8c1baefc78a94e48
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
>         git checkout 8390e92d0bcc635f457df18c8c1baefc78a94e48
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> arch/riscv/kernel/signal.c:275:6: warning: no previous prototype for 'arch_do_signal_or_restart' [-Wmissing-prototypes]
>      275 | void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/arch_do_signal_or_restart +275 arch/riscv/kernel/signal.c
>
>    274
>  > 275  void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
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
