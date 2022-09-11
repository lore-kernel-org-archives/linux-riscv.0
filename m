Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26554C54EE9
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Sep 2022 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOsbu39yryi59HC1sIKqdVSKJof/4yFb2Rdat+Ax/9A=; b=cfFj11b+ZJa7Lg
	K0noJ/fr5cvvL8NIpWutfWY0SSv9LP8JLMRXc93eBdu/aHn8L60n7ravXTTqRfssn0BoLfu5EIwfL
	dkx3V/ZUeJ70D6vh5906B830fO+Ryff2j6O1UTRs3pwFlPDD8I6p/1LhxsivtsLNNMBqNsEqFA3gU
	GdH38j2s4h8jytiKv8lz6f+Slc+mlBRoezd4KiVUAJBmJMK9Hay0ZsQjF0wDMgGEapgL96io8G0pv
	Yh/r0jJcsJOuTBvFkdsICn0iIxeWH2MuDqxf9RA+d9r/50it7/b5qwMB/kzoiHW8aQW3DS/ub4eZ+
	n3SkHU4Kp/suJbU+atMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXOaY-002f58-GP; Sun, 11 Sep 2022 15:09:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXOaX-002f4T-5f
	for linux-riscv@bombadil.infradead.org; Sun, 11 Sep 2022 15:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T8kXbrdbT0Mke2qcZ/J70Cx3QoQ+vc4dEdyuf7NS6dY=; b=hwd59oKeR7QyS4faWmLioIutcD
	jnFDLj8Kq4wxulz4rBu+1D+I0NXF+nYg7V72IBpovjcu2BV7iXrg5hgUrS0OEykNZdPMnd/zLMOvJ
	9hfKCVTTZxhat6GIfnIcF37jW3WIL/YSWUV1u7EKbA6t3IDHq4Z589CrwvR1jjgi60tJOhRtfhE3X
	sT8475j0pTfITCc8mIWM7+b8yg4XDOtJ0zO/oaSfhJDrgmbhtlj2JZ+4pjDLnp1QHH+yPzL7Y7lOO
	Sr0mRn8L2pWSAHgwzFT8OZSUWEVfGemVzETGuBAT5mOH/ZScFJDTVcew4x8nRm0YWPM9vMGy99T6o
	Ljv3QMOg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXOaQ-00F8y6-Tf; Sun, 11 Sep 2022 15:09:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7016C30008D;
	Sun, 11 Sep 2022 17:09:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1A1AB2B16572A; Sun, 11 Sep 2022 17:09:25 +0200 (CEST)
Date: Sun, 11 Sep 2022 17:09:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, bigeasy@linutronix.de,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 4/8] riscv: traps: Add noinstr to prevent
 instrumentation inserted
Message-ID: <Yx36JRG64DtuDrRz@hirez.programming.kicks-ass.net>
References: <20220908022506.1275799-1-guoren@kernel.org>
 <20220908022506.1275799-5-guoren@kernel.org>
 <Yxmaz7wJPEBQ7Vki@hirez.programming.kicks-ass.net>
 <CAJF2gTSs4Ycu52DH6NUzdMXQGMT51XU6x-fgQ-_OpRne+vkTqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSs4Ycu52DH6NUzdMXQGMT51XU6x-fgQ-_OpRne+vkTqQ@mail.gmail.com>
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

On Sat, Sep 10, 2022 at 05:17:44PM +0800, Guo Ren wrote:

> > > -asmlinkage __visible __trap_section void name(struct pt_regs *regs)  \
> > > +asmlinkage __visible __trap_section void noinstr name(struct pt_regs *regs)  \
> >
> > But now you have __trap_section and noinstr both adding a section
> > attribute.
> 
> Oops, thx for correcting. Here is my solution.
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 635e6ec26938..eba744caa711 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -92,9 +92,11 @@ static void do_trap_error(struct pt_regs *regs, int
> signo, int code,
>  }
> 
>  #if defined(CONFIG_XIP_KERNEL) && defined(CONFIG_RISCV_ALTERNATIVE)
> -#define __trap_section         __section(".xip.traps")
> +#define __trap_section                                                 \
> +       noinline notrace __attribute((__section__(".xip.traps")))       \
> +       __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
>  #else
> -#define __trap_section
> +#define __trap_section noinstr
>  #endif

This is almost guaranteed to get out of sync when the compiler guys add
yet another sanitizier. Please consider picking up this patch:

  https://lore.kernel.org/all/20211110115736.3776-7-jiangshanlai@gmail.com/

and using __noinstr_section(".xip.traps")

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
