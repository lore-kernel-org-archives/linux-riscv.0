Return-Path: <SRS0=k7m6=QA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D65C282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Jan 2019 00:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E2F217D7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Jan 2019 00:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iDeooPN+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E2F217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpXVDhX1XQAfC7kSR8C62Pxm46aqAO8vUX00oBhk93E=; b=iDeooPN+LO7IGi
	9XUIIUrU+nT4uzigYnmsu185eNa3McrOHT1iuGRJxT7fKdfv++Ci8eeL3QhHkBmgKLbRhOYxF+uTv
	rFzHZKONgjBqlS2plyChRR9Kvxv9uePb5BAWNhoK8YqYICHh6XLZ9a4vMqkFRlhwCg9c7PffvvxOn
	Md5ScChSvNSAQ4Kww6CWl2I+kO3pWgsFkpVup10+9CC3OP5wW6AV+BlH56dMuuNlLRAoH04nicdQ2
	cA2KQ8cU6C1hnI7dNYRbyedu47Z7+Ch+0hxOb7qbZ5lUue1KrgCqVx7L5McRGR39BphOukaIPaqAy
	U/eMcq9Ab4CkqEz/11+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmSux-0006FI-EN; Thu, 24 Jan 2019 00:30:51 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmSuu-0006En-51
 for linux-riscv@lists.infradead.org; Thu, 24 Jan 2019 00:30:50 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x0O0WMwG060590;
 Thu, 24 Jan 2019 08:32:22 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 24 Jan 2019
 08:30:12 +0800
Date: Thu, 24 Jan 2019 08:30:09 +0800
From: Vincent Chen <vincentc@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Add _TIF_NEED_RESCHED check for kernel thread
 when CONFIG_PREEMPT=y
Message-ID: <20190124003008.GA31546@andestech.com>
References: <20190103054555.GA30904@roeck-us.net>
 <mhng-fd3c9beb-34ce-40c5-92ce-0a7d76d877aa@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-fd3c9beb-34ce-40c5-92ce-0a7d76d877aa@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x0O0WMwG060590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_163048_449463_DC843A1D 
X-CRM114-Status: GOOD (  22.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 23, 2019 at 02:58:51AM +0800, Palmer Dabbelt wrote:
> On Wed, 02 Jan 2019 21:45:55 PST (-0800), linux@roeck-us.net wrote:
> > On Thu, Jan 03, 2019 at 11:32:33AM +0800, Vincent Chen wrote:
> >> The cond_resched() can be used to yield the CPU resource if
> >> CONFIG_PREEMPT is not defined. Otherwise, cond_resched() is a dummy
> >> function. In order to avoid kernel thread occupying entire CPU,
> >> when CONFIG_PREEMPT=y, the kernel thread needs to follow the
> >> rescheduling mechanism like a user thread.
> >>
> >> Signed-off-by: Vincent Chen <vincentc@andestech.com>
> >
> > This patch seems to do the trick. I no longer see a problem with
> > CONFIG_PREEMPT=y and the various lock torture tests enabled, as
> > previously reported.
> >
> > Nice catch and fix.
> >
> > Tested-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Guenter
> >
> >> ---
> >>  arch/riscv/kernel/asm-offsets.c |    1 +
> >>  arch/riscv/kernel/entry.S       |   18 +++++++++++++++++-
> >>  2 files changed, 18 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> >> index 6a92a2f..dac9834 100644
> >> --- a/arch/riscv/kernel/asm-offsets.c
> >> +++ b/arch/riscv/kernel/asm-offsets.c
> >> @@ -39,6 +39,7 @@ void asm_offsets(void)
> >>  	OFFSET(TASK_STACK, task_struct, stack);
> >>  	OFFSET(TASK_TI, task_struct, thread_info);
> >>  	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
> >> +	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
> >>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> >>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> >>  	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> >> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> >> index 13d4826..728b72d 100644
> >> --- a/arch/riscv/kernel/entry.S
> >> +++ b/arch/riscv/kernel/entry.S
> >> @@ -144,6 +144,10 @@ _save_context:
> >>  	REG_L x2,  PT_SP(sp)
> >>  	.endm
> >>
> >> +#if !IS_ENABLED(CONFIG_PREEMPT)
> >> +#define resume_kernel restore_all
> >> +#endif
> >> +
> 
> I don't like preprocessor stuff if we can avoid it, are you OK if I squash in 
> the following diff:
> 
>     diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>     index cfbad2f689c3..fd9b57c8b4ce 100644
>     --- a/arch/riscv/kernel/entry.S
>     +++ b/arch/riscv/kernel/entry.S
>     @@ -145,7 +145,7 @@ _save_context:
>      	.endm
>     
>      #if !IS_ENABLED(CONFIG_PREEMPT)
>     -#define resume_kernel restore_all
>     +.set resume_kernel, restore_all
>      #endif
>     
>      ENTRY(handle_exception)
> 
> I think that should do the same thing, but at link time instead of in the 
> preprocessor -- that makes it a bit less likely to bit us in the future.
> 
> >>  ENTRY(handle_exception)
> >>  	SAVE_ALL
> >>
> >> @@ -228,7 +232,7 @@ ret_from_exception:
> >>  	REG_L s0, PT_SSTATUS(sp)
> >>  	csrc sstatus, SR_SIE
> >>  	andi s0, s0, SR_SPP
> >> -	bnez s0, restore_all
> >> +	bnez s0, resume_kernel
> >>
> >>  resume_userspace:
> >>  	/* Interrupts must be disabled here so flags are checked atomically */
> >> @@ -250,6 +254,18 @@ restore_all:
> >>  	RESTORE_ALL
> >>  	sret
> >>
> >> +#if IS_ENABLED(CONFIG_PREEMPT)
> >> +resume_kernel:
> >> +	REG_L s0, TASK_TI_PREEMPT_COUNT(tp)
> >> +	bnez s0, restore_all
> >> +need_resched:
> >> +	REG_L s0, TASK_TI_FLAGS(tp)
> >> +	andi s0, s0, _TIF_NEED_RESCHED
> >> +	beqz s0, restore_all
> >> +	call preempt_schedule_irq
> >> +	j need_resched
> >> +#endif
> >> +
> >>  work_pending:
> >>  	/* Enter slow path for supplementary processing */
> >>  	la ra, ret_from_exception
> 
> I'm just going to assume you're OK with the squash and drop this into my plans 
> for the next RC, let me know if that's not OK.
>
> Thanks for fixing this!

  OK, it's fine for me.

  Vincent

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
