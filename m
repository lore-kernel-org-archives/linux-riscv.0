Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE60C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 21:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDDeUVLmogt0/CpBH6pQZe2j8tvS9NdG8FvQp6KlrEo=; b=MwyHpc/PxH62So
	Y27oJDcdUyMfg262kgYLv/Np+/cFuOb37HTqpW+VXNgaUr+aAi9amNHKbkEMNQ+mRF54sTT2IafTQ
	TIHf5jyuAwseGOPQvK5VO6NNUYhcDuQWS03xEJVOcvlp7XuaxczShwEeTOKDP+u03ZuCSfpCTiv2q
	TwmytG+JhM0XlmoxUmGrUxWmTLT6vMeIgpzaCXqbg9RMo89RLel/tjwQedPtlQ/hDUdO2cTzGccPg
	o2fte7jBRDyf/3lI/+0yp/YySN4rN6YQJ8ZWakOUMn5ovzIinsrtnUXimoY/q7y6OFpphYNRFBRvL
	Wng+XDPb5TYtXEsGFK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUD5u-008kFB-1L;
	Thu, 10 Aug 2023 21:21:22 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUD5r-008kE7-0R
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 21:21:21 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C0CA99200C1; Thu, 10 Aug 2023 23:21:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BA7BA9200BF;
	Thu, 10 Aug 2023 22:21:17 +0100 (BST)
Date: Thu, 10 Aug 2023 22:21:17 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Chiu <andy.chiu@sifive.com>
cc: Greg Savin <greg.savin@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
    Oleg Nesterov <oleg@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    linux-riscv@lists.infradead.org, gdb-patches@sourceware.org, 
    Andrew Burgess <andrew.burgess@embecosm.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via ptrace()
 in RISC-V Linux native
In-Reply-To: <CABgGipUXWK3XSQNnY66z1EaOeLDrqJnW0bSCmSCv11xMiVppAg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2308102151450.8596@angie.orcam.me.uk>
References: <20230803230110.904724-1-greg.savin@sifive.com> <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk> <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com> <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk>
 <20230810103510.GA2509@hsinchu26> <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk> <alpine.DEB.2.21.2308101436450.8596@angie.orcam.me.uk> <CABgGipUXWK3XSQNnY66z1EaOeLDrqJnW0bSCmSCv11xMiVppAg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_142119_340272_A4AD6C3A 
X-CRM114-Status: GOOD (  20.33  )
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

On Fri, 11 Aug 2023, Andy Chiu wrote:

> > >  No, how do you expect it to work with a core dump (that can be examined
> > > on a different system, or with a cross-debugger)?  You need to change the
> > > API I'm afraid; it's unusable anyway.  It's a pity the toolchain community
> > > wasn't consulted if you weren't sure how to design the interface.  Better
> > > yet it would have been to implement the GDB side before the kernel part
> > > has been committed.
> 
> I just took some look into the code and here is what I came up with.
> Actually, you know VLENB in a core dump file. The size of
> NT_RISCV_VECTOR in a core dump file just equals sizeof(struct
> __riscv_v_ext_state), which is 40B, plus VLENB * 32. So, the debugger
> can actually calculate VLENB and resolve placement of V registers by
> subtracting 40 from the size of NT_RISCV_VECTOR in a core dump file.

 Fair enough, I didn't dive into Linux code deeply enough to figure out 
that the size of an NT_RISCV_VECTOR core file note is indeed dynamically 
calculated.  Most notes are of a fixed size, but we also have generic 
support for variable-size ones in GDB, so handling this case should be 
reasonably straightforward.

 OTOH VLENB is a program-visible register, so I think it will best be 
provided explicitly regardless rather than having to be reconstructed from 
the size of the note; I would find that awkward.

 NB I have been a bit concerned about the unusually huge allocation size 
of 256KiB+ for the register buffer required for ptrace(2), but I guess 
we'll have to live with it, because any solution that makes it dynamic 
would also complicate the interface.  At least we won't waste filesystem 
space for any extraneous allocation in core dumps.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
