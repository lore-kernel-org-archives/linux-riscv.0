Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDDFC433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 00:31:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A28776101E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 00:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A28776101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FUsuQvl8DEmBIZhRNZk4cLknvdFEb7NybPdznNdsgHs=; b=ND3y8nRhKgtnpAQVeCQt7pAKJ
	tyYWb43hsxDSGCsgwAaqF0SrvV8Oocb2Z+sWonVhGoVUgdsR9tLs2FPbbr6qdYM0RIx4W6/aM9g4h
	vxZyBDAsETXCjZ0xMvXxMpm4UfmXrFR0/eL+ZfcdKKDEcYvhFUUsPo3tmrxdVF5of6RzMm13WBN3G
	C76G3KJqfzbFzJ1GcFZW+0MMeCml1L35+0i6L5Mce3FeiYTYu/oWWCMKeHoBllN+gsgA6DZoJH70t
	s6r4sZ/26IDRV4vKVAXmG5Pf2SFxPmDsq+eBhaiSXw2z7Z5rB397gmdWy2a/CJZlbksEXsllKVQ2x
	2mUjzUj7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRlEc-0081TS-MN; Thu, 01 Apr 2021 00:30:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRlEV-0081SX-Bk
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 00:30:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2C546101E;
 Thu,  1 Apr 2021 00:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617237040;
 bh=62oBHtP8b4XwyEoNVJI6VmhrBZdgCYFCTbD8I+sP/zg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kW/E6LbgqWEEZAvhHiViofcw5zhxPQblmj3TNdcAS3uwY90IWH7VBOq8nCZPcsyBI
 WfGxVMo/O0WED0VA8ycLnreGZ5zQFUQEQ+otYNAxAIYhkwGMopGSPl8/VW7VPsNABl
 4iNicD4J2OkAAgUt5uET2fEDmtMlrvufR2/KJw81J6uIytfaR/hpg9x9pMvroVq3S9
 RRC+UbZ/Kr8dpzqeKOwVgb9Xvp1kg70kXuIwMHezmrrsq42DxMrIuduQJwFfzLXTZz
 9nfteii8VYEc6Bp1fpZZ4IE8V+zoZ4y1FLVA3DBXBE33AfdBOXX87VDtRRyeb+cag9
 VHqKnyOnshqhA==
Date: Thu, 1 Apr 2021 09:30:36 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@linux.alibaba.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
Message-Id: <20210401093036.037f2abbce7ed5d1e68466b7@kernel.org>
In-Reply-To: <20210331222244.45a5807c@xhacker>
References: <20210330021624.2b776386@xhacker>
 <20210330183316.942215efe8e6e8455ad14113@kernel.org>
 <20210331222244.45a5807c@xhacker>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_013047_669964_841332AA 
X-CRM114-Status: GOOD (  12.60  )
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

Hi,

On Wed, 31 Mar 2021 22:22:44 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> On Tue, 30 Mar 2021 18:33:16 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > Hi Jisheng,
> 
> Hi Masami,
> 
> > 
> > On Tue, 30 Mar 2021 02:16:24 +0800
> > Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
> > 
> > > From: Jisheng Zhang <jszhang@kernel.org>
> > > 
> > > Current riscv's kprobe handlers are run with both preemption and
> > > interrupt enabled, this violates kprobe requirements. Fix this issue
> > > by keeping interrupts disabled for BREAKPOINT exception.  
> > 
> > Not only while the breakpoint exception but also until the end of
> > the single step (maybe you are using __BUG_INSN_32 ??) need to be
> > disable interrupts. Can this do that?
> > 
> 
> interrupt is disabled during "single step" by kprobes_save_local_irqflag()
> and kprobes_restore_local_irqflag(). The code flow looks like: 
> 
> do_trap_break()   // for bp
>   kprobe_breakpoint_handler()
>     setup_singlestep()
>       kprobes_restore_local_irqflag()
> 
> do_trap_break()  // for ss
>   kprobe_single_step_handler()
>     kprobes_restore_local_irqflag()

OK, thanks for the confirmation!

Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>

Thanks,

-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
