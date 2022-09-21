Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0D8C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 02:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGNLYXAXw5Z2qJwddP9Qh2CTbryaq4rlWZnKpjsVI4I=; b=HhERDZHCSNU2hY
	TFDTRYZZ8TggrWB1/dZ2T5u3GtDn2TAor/Vml3ujZp+SU6yGp4Uz8c4ElN98avrDzElINzcqzst4O
	avfAjzQhVGHDi37Isw9g8zWhuVpcwqPNijgVtK3zpCOy1Un34gkq2USZX1Gfb+AHXwoiP5lXwUyRR
	C/ynChOQSfPPEVDPSnXXk+aajxJKkyCAhDF3rwsJmFwGJAPgHzHgtNJORd4QDfYrGHx+vYHF57bGA
	mQhufXcylHLO8+4YydE4+JnpJEwB17WE2AXvHFf1PLtVa5pWTVZORuU372uQ3CofhTcFwwkczJP+I
	ku5sARIsvR5wtVklQm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapVr-008HNt-V1; Wed, 21 Sep 2022 02:30:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapVo-008HME-Ht
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 02:30:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 06BA9B81A60
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 02:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54A7C4347C
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 02:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663727453;
	bh=IlG0gnyjYzJPRT4Op43nB8mTf1EWR65qF0nnc5/7Th4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tMGhK/2IZ34IEAE7WzLcYamKLmk06jbH4IFNJQnMU6TGZbYlF7RUMRGGMA/sVcttm
	 lZgKgDXCpNaeQZ+GdJsmhOSJQpestwA/Av81YfXEP8b7kHthbixCDu3Is+zFy6nIyv
	 6mtJSbQvbNSel4sNNTfqZsaj31CVLgqv01W3aj9huRUBd5Vf7s0aK0whq9a3gzQQZE
	 b3abvqdXmpvXQceVd9F4ExQsmbEh9t7V155jugOaxheIUIv3FKahdoOR9NCgVzGYIM
	 dsAKv3kcZ7qALWG3S3DvBaiumsr9mOnyvkCmfHvq7y130Ak1dytFUr+qntWeywEl2N
	 BpctILw3/KzLg==
Received: by mail-oi1-f179.google.com with SMTP id o184so6249455oif.13
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 19:30:53 -0700 (PDT)
X-Gm-Message-State: ACrzQf1HAbRSvbkyyES+7WMRU7rW+7AjaAnpxtgZZ7XPxV3XZ97ZZsiE
	mqXxt13rmQVrQ/xd/ucZAhNCSG7HuBJyi6npjDY=
X-Google-Smtp-Source: AMsMyM6KrdR2Wv3e6RoF6x1x7BI4T9AH7ddVRa6LgIcQDLrWFR5/Eo+BTY5lQTB1EzIbHQmoX0DKqBvD5AFUJvDkE9o=
X-Received: by 2002:a05:6808:201f:b0:34f:9fdf:dbbf with SMTP id
 q31-20020a056808201f00b0034f9fdfdbbfmr2887695oiw.19.1663727452972; Tue, 20
 Sep 2022 19:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220920151202.180057-1-chenzhongjin@huawei.com>
In-Reply-To: <20220920151202.180057-1-chenzhongjin@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 10:30:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRUh6RiMypEm=b=iJruXDWXoqXpXwn1YaUChgyJ0v2gxw@mail.gmail.com>
Message-ID: <CAJF2gTRUh6RiMypEm=b=iJruXDWXoqXpXwn1YaUChgyJ0v2gxw@mail.gmail.com>
Subject: Re: [PATCH -next 0/7] riscv: Improvments for stacktrace
To: Chen Zhongjin <chenzhongjin@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, namhyung@kernel.org, jolsa@kernel.org, 
	nsaenzju@redhat.com, frederic@kernel.org, changbin.du@intel.com, 
	vincent.chen@sifive.com, ardb@kernel.org, mhiramat@kernel.org, 
	rostedt@goodmis.org, keescook@chromium.org, catalin.marinas@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_193056_909786_93D7C6D3 
X-CRM114-Status: GOOD (  20.29  )
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

Some modifications are related to the patch series [1] [2], please take a look.

[1] https://lore.kernel.org/linux-riscv/20220918155246.1203293-1-guoren@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20220916103817.9490-1-guoren@kernel.org/

On Tue, Sep 20, 2022 at 11:15 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
>
> Currently, the stacktrace with FRAME_POINTER on riscv has some problem:
>
> 1. stacktrace will stop at irq so it can't get the stack frames before
> irq entry.
> 2. stacktrace can't unwind all the real stack frames when there is
> k{ret}probes or ftrace.
>
> These are mainly becase when there is a pt_regs on stack, we can't unwind
> the stack frame as normal function.
>
> Some architectures (e.g. arm64) create a extra stackframe inside pt_regs.
> However this doesn't work for riscv because the ra is not ensured to be
> pushed to stack. As explained in:
> commit f766f77a74f5("riscv/stacktrace: Fix stack output without ra on the stack top")
>
> So, I choosed the method of x86 that, if there is a pt_regs on stack,
> we encoded the frame pointer and save it. When unwinding stack frame,
> we can get pt_regs and registers required for unwinding stacks.
>
> In addition, the patch set contains some refactoring of stacktrace.c to
> keep the stacktrace code on riscv consistent with other architectures.
>
> Chen Zhongjin (7):
>   riscv: stacktrace: Replace walk_stackframe with arch_stack_walk
>   riscv: stacktrace: Introduce unwind functions
>   riscv: stacktrace: Save pt_regs in encoded fp on irq entry
>   riscv: syscall: Don't clobber s0 when syscall
>   riscv: stacktrace: Implement stacktrace for irq
>   riscv: stacktrace: Fix unwinding on ftrace_regs_call
>   riscv: stacktrace: Fix unwinding on __kretporbe_trampoline
>
>  arch/riscv/include/asm/frame.h                |  45 +++++
>  arch/riscv/include/asm/stacktrace.h           |  13 +-
>  arch/riscv/kernel/entry.S                     |  23 +--
>  arch/riscv/kernel/mcount-dyn.S                |   8 +
>  arch/riscv/kernel/perf_callchain.c            |   2 +-
>  arch/riscv/kernel/probes/kprobes_trampoline.S |   8 +
>  arch/riscv/kernel/stacktrace.c                | 155 ++++++++++++------
>  7 files changed, 195 insertions(+), 59 deletions(-)
>  create mode 100644 arch/riscv/include/asm/frame.h
>
> --
> 2.17.1
>


--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
