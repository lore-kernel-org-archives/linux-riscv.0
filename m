Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BE4C001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqsSc1R0MKrGLOYrOuB6LgAl0GmhiaDzcyJ9ptzeEOI=; b=D08CjKaJlaA7UK
	zkpGA1PW/tDcp4u+0XVrMMrqt/TVgIzgfNJrkonL0djp27xni3wsBdmluonaBWc+FQdD3z7u3nzaL
	i7I2fpca+zJttg5CDHKd4DmNU9o5ld3fMQY9ut3p3xJD4YCBBwwBF1JQuQIz7yJPu/CgtD0HnyWvx
	ogdu/uuEZBZc1/le65fUpTMLHkOuk3XpTb33XvUttEXAKut2OJVTwbafEFmq0zvCF+EUAFxsbxbOy
	2Gnx39sG+JnBG7hZ1wtOZ7g1ByZjTB0eKi5Ak48bVkAiy7vh16U5PehotAgd77gJYs/rnm8woneIf
	izuE5xymoT0jbxuKd5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU41c-007U7Q-1x;
	Thu, 10 Aug 2023 11:40:20 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU41Z-007U5i-12
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 11:40:19 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 85D4D9200C1; Thu, 10 Aug 2023 13:40:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7F6179200BF;
	Thu, 10 Aug 2023 12:40:12 +0100 (BST)
Date: Thu, 10 Aug 2023 12:40:12 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Chiu <andy.chiu@sifive.com>
cc: Greg Savin <greg.savin@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
    linux-riscv@lists.infradead.org, gdb-patches@sourceware.org, 
    Andrew Burgess <andrew.burgess@embecosm.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via ptrace()
 in RISC-V Linux native
In-Reply-To: <20230810103510.GA2509@hsinchu26>
Message-ID: <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk>
References: <20230803230110.904724-1-greg.savin@sifive.com> <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk> <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com> <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk>
 <20230810103510.GA2509@hsinchu26>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_044017_522479_57489E03 
X-CRM114-Status: GOOD (  30.14  )
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

On Thu, 10 Aug 2023, Andy Chiu wrote:

> > > The SIGILL guard is being used as a wrapper around determination of the
> > > VLENB CSR, which is not part of the ptrace() payload for vector registers,
> > > at least as it exists at head-of-tree Linux kernel.   GDB or gdbserver
> > > needs to know VLENB in order to construct the architectural feature
> > > metadata that reports an accurate width for the vector registers.  If not
> > > for the VLENB determination specifically, and the lack of this information
> > > via ptrace(), then there would be no motivation for executing a vector
> > > instruction directly.  It's a workaround, basically.  I guess I could
> > > inquire in Linux kernel land regarding whether the NT_RISCV_VECTOR ptrace()
> > > payload could be enhanced to provide VLENB.
> > 
> >  I think the kernel interface needs to be clarified first, before we can 
> > proceed with the tools side.
> > 
> >  I can see the vector state is carried in a REGSET_V regset, which in turn 
> > corresponds to an NT_RISCV_VECTOR core file note.  I can see that besides 
> > the vector data registers only the VSTART, VL, VTYPE, and VCSR vector CSRs
> > are provided in that regset, and that vector data registers are assigned 
> > a contiguous space of (32 * RISCV_MAX_VLENB) bytes rather than individual 
> > slots.
> > 
> >  So how are we supposed to determine the width of the vector registers 
> > recorded in a core file?  I'd say the RISC-V/Linux kernel regset API is 
> > incomplete.
> 
> Does it make sense to you if we encapsulate this with a hwprobe syscall?
> e.g provide a hwprobe entry to get system's VLENB. We will have to
> increase and rearrange the buffer for NT_RISCV_VECTOR if we want to use
> ptrace as the entry point for this purpose. I am not very sure if it'd be
> too late to do though.

 No, how do you expect it to work with a core dump (that can be examined 
on a different system, or with a cross-debugger)?  You need to change the 
API I'm afraid; it's unusable anyway.  It's a pity the toolchain community 
wasn't consulted if you weren't sure how to design the interface.  Better 
yet it would have been to implement the GDB side before the kernel part 
has been committed.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
