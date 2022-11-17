Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F297C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 01:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWGcabpJuqOOcBG1qhnQBdUj7bRP3NKurChxkr73Ga0=; b=2uZUzG5PS3Zab5
	Au7Xptxg6c3l6UyX7EpYVGLyRbbr4qt4jtanpZicWvLKtbDy7zI8J6EWqAA40Zf6+Nk06se3VkRVo
	o5e+1qybUE0Uv0JpcRsX2sD6gSPU5ZBhQMVafQ/6Mb1gPpWBK51lgOJ+zyo+zh3xZlQXks6Jjam4m
	DYYssBtZKLAYqfjGpL20Kqie7gIu05dSwbx+j89VuIG6kx2Ktd1bjNhor/seggtUusvuZzsWlaohL
	5gnroTFhflzXrjLotSf6500XECHupLwMbdYA2x5Riic7hx42YiTg9l2hULjyZWHbr1N6kee3Q2TrO
	g6V/rHGzXBmShKKjH9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovTyj-009NGJ-FU; Thu, 17 Nov 2022 01:46:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovTye-009NFM-SZ
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 01:46:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0A5B62064
	for <linux-riscv@lists.infradead.org>; Thu, 17 Nov 2022 01:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548D2C433C1
	for <linux-riscv@lists.infradead.org>; Thu, 17 Nov 2022 01:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668649561;
	bh=ZQ72dHxfzCyCaQz3CU/waK5F/XDoW5QrMiejHqa2A18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TXRyYqgDoXpXPTDkrlZNSzTNGzU4TOEnQ2rnkMaDzv34sguJbjL5nZNVoGa7wIm6Y
	 mXe53vdgSiOSF6wypK0FTsZJ0zr1FWrJ7kp1K1wSKnf9WJSz5dWBTxtbyP8zW6Lf10
	 tcwjMpQR7JMy4Y6XDYjFYRbounQF0ezpqWz3GBc6UH/aPLzCPdHKQFGjU20CcuU7ag
	 03lUXe2ZkCpgEFUqA7AT3lwpVz5roEMlQGWDEKF85BqtuTdbmYSzlzn23NTXq2tJQo
	 0rE09jf4Ep5EirEW+ovcsNrjlLtxWpnoe45YMdnQvdNXl/a/xDCKp0q3FTfgrniSc8
	 q65w9AL62srUw==
Received: by mail-ed1-f44.google.com with SMTP id e13so495746edj.7
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 17:46:01 -0800 (PST)
X-Gm-Message-State: ANoB5pmWNRLaRh5wugbMRWVm2i3UCJMFOxhVZX/5dKTf0WNaTGe+MZIg
	j8qByDHeAkLS60h18ILtRVIsYImKydZG5nKZKKk=
X-Google-Smtp-Source: AA0mqf5vGCdSJ+MQ4ohyTYv8MIycakRYqNFyn2MWQYAZgcTJhU/qVqT81Z7wWxd8fEErepAsnpVV9AmbGLA17OpBPRM=
X-Received: by 2002:aa7:db91:0:b0:458:bd09:1b20 with SMTP id
 u17-20020aa7db91000000b00458bd091b20mr337228edt.176.1668649559600; Wed, 16
 Nov 2022 17:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20221116031305.286634-1-suagrfillet@gmail.com>
In-Reply-To: <20221116031305.286634-1-suagrfillet@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 17 Nov 2022 09:45:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS0jFkynErVVnQPoqzo-_cWRPRCYZLwRyTpuaxu7NVdWQ@mail.gmail.com>
Message-ID: <CAJF2gTS0jFkynErVVnQPoqzo-_cWRPRCYZLwRyTpuaxu7NVdWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] riscv/ftrace: make function graph use ftrace directly
To: Song Shuai <suagrfillet@gmail.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_174605_042581_3405D2C9 
X-CRM114-Status: GOOD (  21.72  )
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

I hope this series could base on the following:
https://lore.kernel.org/linux-riscv/20220921034910.3142465-4-guoren@kernel.org/

They all modified the mcount-dyn.S.

On Wed, Nov 16, 2022 at 11:13 AM Song Shuai <suagrfillet@gmail.com> wrote:
>
> In RISC-V architecture, when we enable the ftrace_graph tracer on some
> functions, the function tracings on other functions will suffer extra
> graph tracing work. In essence, graph_ops isn't limited by its func_hash
> due to the global ftrace_graph_[regs]_call label. That should be corrected.
>
> What inspires me is the commit 0c0593b45c9b ("x86/ftrace: Make function
> graph use ftrace directly") that uses graph_ops::func function to install
> return_hooker and makes the function called against its func_hash.
>
> This series of patches makes function graph use ftrace directly for riscv.
>
> If FTRACE_WITH_REGS isn't defined, ftrace_caller keeps ftrace_graph_call
> so that it can be replaced with the calling of prepare_ftrace_return by
> the enable/disable helper.
>
> As for defining FTRACE_WITH_REGS, ftrace_caller is adjusted to save the
> necessary regs against the pt_regs layout, so it can reasonably call the
> graph_ops::func function - ftrace_graph_func. And ftrace_graph_[regs]_call
> and its enable/disable helper aren't needed.
>
> The tests generated by CONFIG_FTRACE_STARTUP_TEST have passed in the local
> qemu-system-riscv64 virt machine. The following is the log during startup.
>
> ```
> Nov 15 03:07:13 stage4 kernel: Testing tracer function: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace ops #1:
> Nov 15 03:07:13 stage4 kernel: (1 0 1 0 0)
> Nov 15 03:07:13 stage4 kernel: (1 1 2 0 0)
> Nov 15 03:07:13 stage4 kernel: (2 1 3 0 365)
> Nov 15 03:07:13 stage4 kernel: (2 2 4 0 399)
> Nov 15 03:07:13 stage4 kernel: (3 2 4 0 146071)
> Nov 15 03:07:13 stage4 kernel: (3 3 5 0 146105) PASSED
> Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace ops #2:
> Nov 15 03:07:13 stage4 kernel: (1 0 1 589 0)
> Nov 15 03:07:13 stage4 kernel: (1 1 2 635 0)
> Nov 15 03:07:13 stage4 kernel: (2 1 3 1 2)
> Nov 15 03:07:13 stage4 kernel: (2 2 4 125 126)
> Nov 15 03:07:13 stage4 kernel: (3 2 4 146001 146078)
> Nov 15 03:07:13 stage4 kernel: (3 3 5 146035 146112) PASSED
> Nov 15 03:07:13 stage4 kernel: Testing ftrace recursion: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing ftrace recursion safe: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing ftrace regs: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer nop: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer irqsoff: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup:
> Nov 15 03:07:13 stage4 kernel: sched: DL replenish lagged too much
> Nov 15 03:07:13 stage4 kernel: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup_rt: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup_dl: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer function_graph: PASSED
> ```
>
> Note that the changes of mcount-dyn.S conflicts with this unmerged
> commit (riscv: entry: consolidate general regs saving/restoring).
> https://lore.kernel.org/linux-riscv/20221103075047.1634923-15-guoren@kernel.org
>
> Changes since v1
> -  fixed the checkpatch warnings in patch 1
> Link: https://lore.kernel.org/linux-riscv/20221115061525.112757-1-suagrfillet@gmail.com
>
> Song Shuai (3):
>   riscv/ftrace: add ftrace_graph_func
>   riscv/ftrace: SAVE_ALL supports lightweight save
>   riscv/ftrace: cleanup ftrace_caller and ftrace_regs_caller
>
>  arch/riscv/include/asm/ftrace.h |  13 ++-
>  arch/riscv/kernel/ftrace.c      |  35 ++++----
>  arch/riscv/kernel/mcount-dyn.S  | 145 +++++++++++++++++++++++---------
>  3 files changed, 136 insertions(+), 57 deletions(-)
>
> --
> 2.20.1
>


--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
