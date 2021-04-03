Return-Path: <SRS0=xqXW=JA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5D0C433B4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Apr 2021 18:31:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCBE60551
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Apr 2021 18:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCBE60551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E92o70UXL2ssGrejYGIcAtszLw2Me8BLOR7WTqLaSls=; b=c0lNmMQfLciZA5zIFcdp0nwed
	BDT+Gk6aBMSNrnX42MKudXXwAO4a9ZoJTTsnaq9E+WF9V/MvfaCYUdFsV3ivLPRDjxmyXE7V1MtUb
	tSgX5EZ152SJFx6Zsq86473oxldJPXoFCggSO31VcTUIHVRRTNGsN2aV0+LcCZt1HtV+bFzQPfQnx
	yQsE9akkxgDgqftwRwlegTx7jmE3qMJcef35cgKvL5HXFfK8Lr3DRRo1969GPj68mZO0fyieNVUdw
	mdpDVwrIaCjC3MC+8U3hF5qiymKCIeI9KpP+rJ0CjfFTI8D1xH+nBQZtBmKpDytLLoGXb62XG3po5
	8Gqqs1iqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSl31-00EwBn-6Q; Sat, 03 Apr 2021 18:31:03 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::4])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lSl2w-00EwAu-1H
 for linux-riscv@lists.infradead.org; Sat, 03 Apr 2021 18:30:59 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id D1DEC92009C; Sat,  3 Apr 2021 20:30:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id C2E5592009B;
 Sat,  3 Apr 2021 20:30:53 +0200 (CEST)
Date: Sat, 3 Apr 2021 20:30:53 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Masami Hiramatsu <mhiramat@kernel.org>
cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@linux.alibaba.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
In-Reply-To: <20210401093036.037f2abbce7ed5d1e68466b7@kernel.org>
Message-ID: <alpine.DEB.2.21.2104032020100.65251@angie.orcam.me.uk>
References: <20210330021624.2b776386@xhacker>
 <20210330183316.942215efe8e6e8455ad14113@kernel.org>
 <20210331222244.45a5807c@xhacker>
 <20210401093036.037f2abbce7ed5d1e68466b7@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_193058_249038_7CB1DACB 
X-CRM114-Status: GOOD (  12.15  )
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

On Thu, 1 Apr 2021, Masami Hiramatsu wrote:

> > > > Current riscv's kprobe handlers are run with both preemption and
> > > > interrupt enabled, this violates kprobe requirements. Fix this issue
> > > > by keeping interrupts disabled for BREAKPOINT exception.  
> > > 
> > > Not only while the breakpoint exception but also until the end of
> > > the single step (maybe you are using __BUG_INSN_32 ??) need to be
> > > disable interrupts. Can this do that?
> > > 
> > 
> > interrupt is disabled during "single step" by kprobes_save_local_irqflag()
> > and kprobes_restore_local_irqflag(). The code flow looks like: 
> > 
> > do_trap_break()   // for bp
> >   kprobe_breakpoint_handler()
> >     setup_singlestep()
> >       kprobes_restore_local_irqflag()
> > 
> > do_trap_break()  // for ss
> >   kprobe_single_step_handler()
> >     kprobes_restore_local_irqflag()
> 
> OK, thanks for the confirmation!

 Is this approach guaranteed to keep interrupt handling latency low enough 
for the system not to be negatively affected, e.g. for the purpose of NTP 
timekeeping?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
