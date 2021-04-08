Return-Path: <SRS0=+Lbj=JF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CCCC433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 22:39:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB2A61106
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 22:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB2A61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pnY70Hq4tBSZYHZiFNjv3N4G7bP3nm8KdOcvRs8v8no=; b=MbFQLGyd+12VYHbGSVxe8gk9g
	g7p+XtB23plaFPeGyM5XH/uXAJrEEoJWKEXiXHwRCvbnvcpENzz5Be2VRthRQIarVIYB/opCMynXC
	gS7Y1BqnyJzK/pYvQmW8IWjyAennNH+/vJX00uOE0bG/nQROzYhm3w4xw7SPkPwEqJzOXJ+JBwzeS
	eJ0jy0s1zPpbKpA/O0p3vpKCOYOEmB4ZkQAUl3MCm5PUiFh8faJhgYfFxLXWZigCf9AUhssdi8sOy
	1bCNq+TGtSPjoYMVUUNPYc3uzSbPC95LaY76axfPeyi1gsuJbEsTUa05tYPMwsHPWZmnpO30Td+v6
	cnpeGEdNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUdIt-009OAF-2T; Thu, 08 Apr 2021 22:39:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUdIn-009O9d-NG
 for linux-riscv@lists.infradead.org; Thu, 08 Apr 2021 22:39:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E83F961106;
 Thu,  8 Apr 2021 22:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617921542;
 bh=T9Xmxojax6GIvmigkpUkfCNwyL8m2lnVcs8esdkHluU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZoU0pR6FdJu6NdPGeoNs5yO5cYoxyUs5bEwLhoirKPbQrjPHpWtA+GzKhw29LGl5r
 +sTOldiQ0OL/ST5SCFI0jkDveSexpBw0H8n/gorKyEk80ZGWY39TlpDhicZEMtfueJ
 RK7rLjeY7NEl9hyAZpceiuMOO+eZtYj0DrDiRLpUkqMBL40n1r/5caoi1xibNPVGlF
 TdInRWzsqMAGGrEP9lxyyxTGXVRLEd1RV3uaStHZmgwLGQo+AlCh87v4jeNa8iW8oz
 qeOstpHj1ppXnpMBid3KuC+uYJLqjF6y5MupJiorqVbC6iB3kkQE5V+f1WzFQTWpch
 O2C2IEeYapqDg==
Date: Fri, 9 Apr 2021 07:38:58 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Masami Hiramatsu
 <mhiramat@kernel.org>, Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@linux.alibaba.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
Message-Id: <20210409073858.e7b439e99e9e506f4f3847e2@kernel.org>
In-Reply-To: <20210408192348.1d50c588@xhacker.debian>
References: <20210330021624.2b776386@xhacker>
 <20210330183316.942215efe8e6e8455ad14113@kernel.org>
 <20210331222244.45a5807c@xhacker>
 <20210401093036.037f2abbce7ed5d1e68466b7@kernel.org>
 <alpine.DEB.2.21.2104032020100.65251@angie.orcam.me.uk>
 <20210408192348.1d50c588@xhacker.debian>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_233905_975544_B521649E 
X-CRM114-Status: GOOD (  17.36  )
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

On Thu, 8 Apr 2021 19:23:48 +0800
Jisheng Zhang <Jisheng.Zhang@synaptics.com> wrote:

> On Sat, 3 Apr 2021 20:30:53 +0200 (CEST)
> "Maciej W. Rozycki" <macro@orcam.me.uk> wrote:
> 
> > CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> > On Thu, 1 Apr 2021, Masami Hiramatsu wrote:
> > 
> > > > > > Current riscv's kprobe handlers are run with both preemption and
> > > > > > interrupt enabled, this violates kprobe requirements. Fix this issue
> > > > > > by keeping interrupts disabled for BREAKPOINT exception.  
> > > > >
> > > > > Not only while the breakpoint exception but also until the end of
> > > > > the single step (maybe you are using __BUG_INSN_32 ??) need to be
> > > > > disable interrupts. Can this do that?
> > > > >  
> > > >
> > > > interrupt is disabled during "single step" by kprobes_save_local_irqflag()
> > > > and kprobes_restore_local_irqflag(). The code flow looks like:
> > > >
> > > > do_trap_break()   // for bp
> > > >   kprobe_breakpoint_handler()
> > > >     setup_singlestep()
> > > >       kprobes_restore_local_irqflag()
> > > >
> > > > do_trap_break()  // for ss
> > > >   kprobe_single_step_handler()
> > > >     kprobes_restore_local_irqflag()  
> > >
> > > OK, thanks for the confirmation!  
> > 
> >  Is this approach guaranteed to keep interrupt handling latency low enough
> > for the system not to be negatively affected, e.g. for the purpose of NTP
> > timekeeping?
> 
> IMHO, interrupt latency can't be ensured if kprobes is triggered.

Indeed. The latency depends on what the kprobe user handler does. Of course
it must be as minimal as possible... On x86, it is less than a few microseconds.
Thus it may be a jitter on hard realtime system, but not a big issue on
usual system like NTP timekeeping.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
