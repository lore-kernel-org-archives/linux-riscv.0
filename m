Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CBDC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBWU38Sqb7VQKWuIG7ptZy9dkeZl/1Yfea2HRcSkTq8=; b=BRCFnvufsWB8D0
	35rq33sTn2Cz6AliopczKx8cPJfMMYnFH9fiNJeZr6bJkeYQBAiQ2CIKX5leOUG/qFwIs6MR+Gvnz
	q0NyvvPL9E0mQ6Nrvaaz2RlTRapixuHp+qWy/FivhlJroGT+1Il01jh/q0dL97WbU4e5fMwJQvso3
	0VB8f4yV40pW/Aj8mP3XB3+yaGZw8jn71tMn9HhBvLqrBEmxImDV43GCWxAYiWEPErdL2Pvl19g+X
	5Pm1CXU8OE676JBnGMqhAZN6Y8dHJkvWtFZrfnpY1uHF6Mrlyok2N+oEHGDMOfysHSt8AhemmwJj6
	B9Rj1+mlXDR8VouaF3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ir3-002K9x-Tk; Fri, 08 Jul 2022 07:56:49 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ir1-002K9J-Ma
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 07:56:49 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-10c0052da61so17534429fac.12
        for <linux-riscv@lists.infradead.org>; Fri, 08 Jul 2022 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Do5c8txc35InXIJTFqJJ/E8z0P5htDZ6YcOx7IOLib4=;
        b=M9nZk+GiwzgziI39VmWu680AJS4FjtY1nR5tp27o4jWBQP0LZPqGcXn1x5sO529gDv
         wCJuzTvesEgGqTiAHWF8cU3kn4+N2Yr5T9DGJk6pv6u7CkHhiSHk6wtezyQrBpYCtH2V
         EfAJ3mBKs7snFwdWNzLZF70x2glvnCqbAmpShEpqcFa8qa9IeOntuXjifNq2l7OkzhaE
         DnWEmGYXQvLh2BnwULxg5ncFEKox6sxrNXuDKj6zngPa5i78VRsUE7LXe8epTJJa3vrU
         84NmXHCy1ov7orC3u6TV2fTkuT/DEHLbUKvS+JHIQSjX5Ds2X4+yz0MH63igFZvyCH//
         vDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Do5c8txc35InXIJTFqJJ/E8z0P5htDZ6YcOx7IOLib4=;
        b=Qf6+7thUM9lxx6zZlGVrsxK2JODZVtEbqr+ZDrQ/2r0oLsmsKTsivhgTpyvowG8iPy
         i/Fzbl/4xbgh0M0MDdGvfVJBNu54F2tEA6qVuI72WonyJ/j+/wZ84zSniTqBB6EcwsCq
         gXnuXsA5vQDkXJCjPiDGU+iQdXNC73T2kbbuGMJ5PcquYz1vhRchVqongRvoWNa9I0+o
         QbvFqA6JHaYQ9OjQsvm9egSqPTiBugLwdn+c1FmN/NpGzh4We+egde0AiOZ2MHsoydaI
         wBlZnwa5py3KmLpYpcrGE7Z0aFckXMx8Tb2qvWuzrFItLwpoqqhHubMeyNUbZ1fMdUxJ
         bkxQ==
X-Gm-Message-State: AJIora+Dt5bJVqb+XWnhUsliWZa+5+xQGbjJRoJCjvebzA8b59/t927z
	rSvojqYeLJNTsJKwjF0QjkfXiNR9BWMNC+/HUFKC+w==
X-Google-Smtp-Source: AGRyM1vCxElxv0AT4eNN481DIahwan83nHGGhEiE5wCdx/gz66WqGaIqD3+PJXDHARvWmjldH1bUoStaaIvojl41siE=
X-Received: by 2002:a05:6871:5c2:b0:108:4cbf:a965 with SMTP id
 v2-20020a05687105c200b001084cbfa965mr1078660oan.285.1657267005216; Fri, 08
 Jul 2022 00:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220609071833.1051941-1-andy.chiu@sifive.com> <CABgGipVpafnRB6VhTonq3U5uFrLxCwJBqW9JZBCvYjA93gGESQ@mail.gmail.com>
In-Reply-To: <CABgGipVpafnRB6VhTonq3U5uFrLxCwJBqW9JZBCvYjA93gGESQ@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 8 Jul 2022 15:56:34 +0800
Message-ID: <CABgGipUDq+BdEAbs8+hHtkjkekswXK=J9ysa9=nR9q_M4N7rcg@mail.gmail.com>
Subject: Re: [PATCH riscv/for-next 0/4] Enable ftrace with kernel preemption
 for RISC-V
To: aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, rostedt@goodmis.org, mingo@redhat.com, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com
Cc: Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_005647_804205_41FF14AB 
X-CRM114-Status: GOOD (  33.63  )
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

This is just a gentle ping. If there are concerns or problems
regarding this patch, please let me know. Thanks!

> On Thu, Jun 9, 2022 at 3:21 PM Andy Chiu <andy.chiu@sifive.com> wrote:
> >
> > This patch remove dependency of dynamic ftrace from calling
> > stop_machine(), and make it compatiable with kernel preemption.
> > Originally, we ran into stack corruptions, or execution of partially
> > updated instructions when starting or stopping ftrace on a fully
> > preemptible kernel configuration. The reason is that kernel periodically
> > calls rcu_momentary_dyntick_idle() on cores waiting for the code-patching
> > core running in ftrace. Though rcu_momentary_dyntick_idle() itself is
> > marked as notrace, it would call a bunch of tracable functions if we
> > configured the kernel as preemptible. For example, these are some functions
> > that happened to have a symbol and have not been marked as notrace on a
> > RISC-V preemptible kernel compiled with GCC-11:
> >  - __rcu_report_exp_rnp()
> >  - rcu_report_exp_cpu_mult()
> >  - rcu_preempt_deferred_qs()
> >  - rcu_preempt_need_deferred_qs()
> >  - rcu_preempt_deferred_qs_irqrestore()
> >
> > Thus, this make it not ideal for us to rely on stop_machine() and
> > handly marked "notrace"s to perform runtime code patching. To remove
> > such dependency, we must make updates of code seemed atomic on running
> > cores. This might not be obvious for RISC-V since it usaually uses a pair
> > of AUIPC + JALR to perform a long jump, which cannot be modified and
> > executed concurrently if we consider preemptions. As such, this patch
> > proposed a way to make it possible. It embeds a 32-bit rel-address data
> > into instructions of each ftrace prologue and jumps indirectly. In this
> > way, we could store and load the address atomically so that the code
> > patching core could run simutaneously with the rest of running cores.
> >
> > After applying the patchset, we compiled a preemptible kernel with all
> > tracers and ftrace-selftest enabled, and booted it on a 2-core QEMU virt
> > machine. The kernel could boot up successfully, passing all ftrace
> > testsuits. Besides, we ran a script that randomly pick a tracer on every
> > 0~5 seconds. The kernel has sustained over 20K rounds of the test. In
> > contrast, a preemptible kernel without our patch would panic in few
> > rounds on the same machine.
> >
> > However, we did run into errors when using hwlat or irqsoff tracers
> > together with cpu-online stressor from stress-ng on a preemptible kernel.
> > The stressor would randomly take a cpu from 1-N offline and online using
> > hotplug mechanism. Nonotheless, since we think there is little chance that
> > it is related to our changes in ftrace, we are working on it in parallel,
> > and may come up with another patch soon.
> >
> > Andy Chiu (4):
> >   riscv: align ftrace to 4 Byte boundary and increase ftrace prologue
> >     size
> >   riscv: export patch_insn_write
> >   riscv: ftrace: use indirect jump to work with kernel preemption
> >   riscv: ftrace: do not use stop_machine to update code
> >
> >  arch/riscv/Makefile             |   2 +-
> >  arch/riscv/include/asm/ftrace.h |  24 ------
> >  arch/riscv/include/asm/patch.h  |   1 +
> >  arch/riscv/kernel/ftrace.c      | 135 ++++++++++++++++++++------------
> >  arch/riscv/kernel/mcount-dyn.S  |  62 +++++++++++----
> >  arch/riscv/kernel/patch.c       |   4 +-
> >  6 files changed, 136 insertions(+), 92 deletions(-)
> >
> > --
> > 2.36.0
> >

Regards,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
