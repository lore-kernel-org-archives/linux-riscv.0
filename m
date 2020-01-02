Return-Path: <SRS0=K0nT=2X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C08C2D0DC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 15:14:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF5BD21835
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 15:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZxJ/NgXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF5BD21835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3zTnBqkJGK+m0eNIwEfQVQ5QHyVh4amMZNLJjBcpTs=; b=ZxJ/NgXIXmt7W8
	3sX9/gj3YcOF2Ni+VyxQRAraXnvJ62OLcdRxOhNeALgBAJLN7Y254kQc6+RtveT2RiLzI3JoFjP+x
	7XYfY+rbZLuD7IoNBzcE92/haCi4uuo6QgMg0jmwr8aNw3vKxA0RGt4z18eVQ9e/LkOntXTMIpBDf
	SrfYKqja7KqXtBzzaVIJJYeHLdo0YZASj4lH4k/WCVvxXVN65hp3dKY4pEN2qP5mRtZOyb2Cp9plN
	6HzneCZp+9BFaGSWne15P5raS7YlOkk3iECvYpPhoAgnY9Yec/uttAO0Bcn8bBqff41MJFfg+pDaU
	tPhJlWSdicESuD6IlOjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in2BJ-00007v-SA; Thu, 02 Jan 2020 15:14:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in2BF-00007D-DC
 for linux-riscv@lists.infradead.org; Thu, 02 Jan 2020 15:14:35 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60384206E6;
 Thu,  2 Jan 2020 15:14:31 +0000 (UTC)
Date: Thu, 2 Jan 2020 10:14:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 0/2] RISC-V: fixes issues of ftrace graph tracer
Message-ID: <20200102101429.383088c7@gandalf.local.home>
In-Reply-To: <CANXhq0qTG-ezdrJpOEd9fhc-_iRL2syASO9KnQxbDfxoVXwfqQ@mail.gmail.com>
References: <20191223084614.67126-1-zong.li@sifive.com>
 <CANXhq0qTG-ezdrJpOEd9fhc-_iRL2syASO9KnQxbDfxoVXwfqQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_071433_466448_9CBC1AEC 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jan 2020 11:50:22 +0800
Zong Li <zong.li@sifive.com> wrote:

> On Mon, Dec 23, 2019 at 4:46 PM Zong Li <zong.li@sifive.com> wrote:
> >
> > Ftrace graph tracer is broken now, these patches fix the problem of ftrace graph
> > tracer and tested on QEMU and HiFive Unleashed board.
> >
> > Zong Li (2):
> >   riscv: ftrace: correct the condition logic in function graph tracer
> >   clocksource/drivers/riscv: add notrace to riscv_sched_clock
> >
> >  arch/riscv/kernel/ftrace.c        | 2 +-
> >  drivers/clocksource/timer-riscv.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > --
> > 2.24.1
> >  
> 
> ping

Both patches look legit.

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

