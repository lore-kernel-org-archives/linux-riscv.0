Return-Path: <SRS0=Z71o=LW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08342C11F64
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 23:20:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28E161CE7
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 23:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B28E161CE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sIQwFdD7BYKKVqMl8ZCg1vdJXA9/niE2N7ZuXYXKgY=; b=fZObzT2KOoPrgW
	sV/rb0cX0jW6nnAS8470OG+ZAmFmKHJwspMLJi2rb/0S9adFk+JHQeqjxGh1kdFRbC1PjECJTUgQo
	yM7M3vCI3+kIxL3Aom9j2xbUFU47Vvklzr+3uMUDA5PUGMNxDMbkCAB48iqxUbT/Og42HCPjMbbod
	qvCxVd8TZ53fPHERzN8S+6DqABZajFFEioFmgiaZElaQGuOSUG9FJmpSpwlw+iD6Pl39cPwb4U00T
	u004f02zCWAy5bWMhY+qdTSo9kGpDaLHZfPdq+No+VpTQ1t1XEP+fjDFFC/oZGbypUSSqNX5DOZgW
	TlR3t4lpnkQPbbj6pz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly0YK-009LOc-Gf; Mon, 28 Jun 2021 23:20:32 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly0YH-009LNy-Ug
 for linux-riscv@lists.infradead.org; Mon, 28 Jun 2021 23:20:31 +0000
Received: by mail-pj1-x102d.google.com with SMTP id g4so11256317pjk.0
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jun 2021 16:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mRUbf3KJA2d64vKTZ/FyrTly1jL2s60EVp6ODRb0q9Q=;
 b=uXOWQ+eB18empgtJVMYzzMwdBwxLEMq2W32P0eBwWcEwSQUzia+V/S8UP6EgC3kBJ1
 xxY9Mu0kbipBr7023piq8gZS7lglwBz6MHTSf8NQepDqOgQJUuKVFOEOFFz5k3aEVvR6
 fS2z13O8CYBnqa5ci3RlGU9XLg18OXDHkCSYPrcTBTTaJ68T89J+5KTaxLJbeq6QM8M5
 2lqzzHj9pUqDuJA3Yvkg9y9NVyXc0emYOOftoXBM86l0xJnmqWg6S4JtCKpl6LrTsIBa
 CjrQxMi4nA9a4zHjfMNq7CpYcwLuCOFfSzRlOjWF3SvVbw/ty0IReHyA1kWprbVUdWbj
 FU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mRUbf3KJA2d64vKTZ/FyrTly1jL2s60EVp6ODRb0q9Q=;
 b=H9jvuvDZcf651NfEmn7DV2S8wO91RF128RuiEfN0qFL++gIwSM+gBnNc+mZBL9UKRv
 2tbuz8fPiqOuRZMbfty7NyQJzVPL9krcwHyJhZjXreQB/GvtPLw6M/uVVtyx2h3sVLc9
 DsMRVWlnwgfvP+Cxjpgr//GpNmOmEEtpW1uHLmPlvGmMjp6fVUq/tC+jcNX2zvMbVC9N
 JWHXO9KDGcC9c55CVxtczlKv3AhuDChcyA3X3WXaUiL63hUoKmAlnHMDUAFKqZEMb5bZ
 XHldaMukp5Sj0DvR1HndYN9lGpyr81QcGiO1QLZTZJVu+IZBdEhNcUutt2MTuP8M0vCn
 wM2A==
X-Gm-Message-State: AOAM532yID7O8NnAt24jLw42K64Byvd4xEBXAnB87QeVipWeFTk/GrFa
 PLfk7cMPxmI8UnMaHB4zLRY=
X-Google-Smtp-Source: ABdhPJysNaqjkYn1H0Iwdtijp2+qlaPNrYNNPvI5VF7m7NFdeCk2r71nY6ITTL1zQwSyEQPKlBHEzg==
X-Received: by 2002:a17:90a:a29:: with SMTP id
 o38mr27617803pjo.228.1624922427442; 
 Mon, 28 Jun 2021 16:20:27 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id i27sm15304030pgl.78.2021.06.28.16.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 16:20:26 -0700 (PDT)
Date: Tue, 29 Jun 2021 07:20:23 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: stacktrace: fix dump_backtrace/walk_stackframe
 with NULL task
Message-ID: <20210628232023.l6o7k5eetvvz2ysm@mail.google.com>
References: <20210627092659.46193-1-changbin.du@gmail.com>
 <20210628134404.4c470112@xhacker.debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628134404.4c470112@xhacker.debian>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_162030_053989_5587E87F 
X-CRM114-Status: GOOD (  29.81  )
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

On Mon, Jun 28, 2021 at 01:44:04PM +0800, Jisheng Zhang wrote:
> On Sun, 27 Jun 2021 17:26:59 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> 
> > 
> > 
> > Some places try to show backtrace with NULL task, and expect the task is
> > 'current'. For example, dump_stack()->show_stack(NULL,...). So the
> > stacktrace code should take care of this case.
> 
> I fixed this issue one week ago:
> 
> http://lists.infradead.org/pipermail/linux-riscv/2021-June/007258.html
> 
Good to know. Thanks!

> > 
> > Here is an oops caused by this issue when accessing the NULL task.
> > 
> > [   15.180813] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
> > [   15.182382] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc7-00111-g625acffd7ae2-dirty #18
> > [   15.183431] Hardware name: riscv-virtio,qemu (DT)
> > [   15.184253] Call Trace:
> > [   15.223617] Unable to handle kernel paging request at virtual address 0000000000001590
> > [   15.267378] Oops [#1]
> > [   15.268215] Modules linked in:
> > [   15.272027] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc7-00111-g625acffd7ae2-dirty #18
> > [   15.273997] Hardware name: riscv-virtio,qemu (DT)
> > [   15.275134] epc : walk_stackframe+0xc4/0xdc
> > [   15.280146]  ra : dump_backtrace+0x30/0x38
> > [   15.280799] epc : ffffffff8000597e ra : ffffffff800059c6 sp : ffffffe002383d60
> > [   15.281622]  gp : ffffffff8179ad18 tp : ffffffe002378000 t0 : ffffffff81bc1a3f
> > [   15.282574]  t1 : 0000000000000001 t2 : 0000000000000000 s0 : ffffffe002383dc0
> > [   15.283782]  s1 : ffffffff812b7d18 a0 : 0000000000001000 a1 : 0000000000000000
> > [   15.285115]  a2 : ffffffff807ec668 a3 : ffffffff812b7d18 a4 : c76c00cabf08b500
> > [   15.286213]  a5 : 0000000000001000 a6 : 000000001a9ef260 a7 : 0000000000000000
> > [   15.287317]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
> > [   15.288323]  s5 : ffffffff807ec668 s6 : ffffffff812b7d18 s7 : 0000000000000000
> > [   15.289530]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
> > [   15.290995]  s11: 0000000000000000 t3 : 0000000000000001 t4 : 0000000000000000
> > [   15.292465]  t5 : 206f74206e6f6974 t6 : ffffffe002383b28
> > [   15.293859] status: 0000000000000100 badaddr: 0000000000001590 cause: 000000000000000d
> > [   15.296035] [<ffffffff8000597e>] walk_stackframe+0xc4/0xdc
> > [   15.297342] [<ffffffff800059c6>] dump_backtrace+0x30/0x38
> > [   15.298333] [<ffffffff807ec6e0>] show_stack+0x40/0x4c
> > [   15.299765] [<ffffffff807f07ac>] dump_stack+0x7c/0x96
> > [   15.300553] [<ffffffff807ec8be>] panic+0x118/0x300
> > [   15.301147] [<ffffffff807f61e8>] kernel_init+0x12c/0x138
> > [   15.302056] [<ffffffff80003a22>] ret_from_exception+0x0/0xc
> > [   15.338628] ---[ end trace 0a3fa0cc7f3393cd ]---
> > [   15.339919] note: swapper/0[1] exited with preempt_count 1
> > [   15.341995] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> > [   15.343889] SMP: stopping secondary CPUs
> > [   16.802836] SMP: failed to stop secondary CPUs 0-3
> > [   16.806264] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> > 
> > This patch fixes it by setting the task to current if it's NULL before
> > accessing it.
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > Fixes: 5d8544e2d0 ("RISC-V: Generic library routines and assembly")
> 
> Hmm, this fixes tag should be
> Fixes: eac2f3059e02 ("riscv: stacktrace: fix the riscv stacktrace when CONFIG_FRAME_POINTER enabled"
> 
> 
> > ---
> >  arch/riscv/kernel/stacktrace.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> > index bde85fc53357..788b65eba965 100644
> > --- a/arch/riscv/kernel/stacktrace.c
> > +++ b/arch/riscv/kernel/stacktrace.c
> > @@ -23,6 +23,9 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
> >  {
> >         unsigned long fp, sp, pc;
> > 
> > +       if (!task)
> > +               task = current;
> > +
> >         if (regs) {
> >                 fp = frame_pointer(regs);
> >                 sp = user_stack_pointer(regs);
> > @@ -73,6 +76,9 @@ void notrace walk_stackframe(struct task_struct *task,
> >         unsigned long sp, pc;
> >         unsigned long *ksp;
> > 
> > +       if (!task)
> > +               task = current;
> > +
> >         if (regs) {
> >                 sp = user_stack_pointer(regs);
> >                 pc = instruction_pointer(regs);
> > --
> > 2.30.2
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> 

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
