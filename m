Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C598DC001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HSzcpRbAhLOIZJMji15FZNYTXP1RpYEzKJ9TfCiDjM=; b=aMkdh+bFiObQg2
	x9KtNBl5pzPRan3J6O2IP41pcVi+sDuBD3Ix5th50zFA81ywX2GQFuby+2zCfxF2iwUyjXSYhtcx3
	EdcBW5aF1wqM8OZ3I+bhXh+nOu4/pGiZwfjUiors5/oZOeZUMM2ODLF7c6Qja8Ov5udcB7naf9eTS
	S4QoGe/rp6dtimiFUvR2o12a015+14Xjl8ij+9VasnscVpKV3JsCsJgXKh4w9dB0IBDaK1ueLX+vv
	X+iKTe6BkVYTtaSOVg+c3ET3OSK8x1ezkSeNGYazsXXzK81l1HOtdl+I0Y/oS7b814uzImrypmtst
	W86BXS57u8STEH5dtcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU68l-007njS-1f;
	Thu, 10 Aug 2023 13:55:51 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU68h-007nis-1u
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 13:55:49 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 287109200C1; Thu, 10 Aug 2023 15:55:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 21F089200BF;
	Thu, 10 Aug 2023 14:55:44 +0100 (BST)
Date: Thu, 10 Aug 2023 14:55:44 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Chiu <andy.chiu@sifive.com>
cc: Greg Savin <greg.savin@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
    Oleg Nesterov <oleg@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    linux-riscv@lists.infradead.org, gdb-patches@sourceware.org, 
    Andrew Burgess <andrew.burgess@embecosm.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via ptrace()
 in RISC-V Linux native
In-Reply-To: <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2308101436450.8596@angie.orcam.me.uk>
References: <20230803230110.904724-1-greg.savin@sifive.com> <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk> <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com> <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk>
 <20230810103510.GA2509@hsinchu26> <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_065547_814536_389A2EF3 
X-CRM114-Status: GOOD (  19.91  )
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

On Thu, 10 Aug 2023, Maciej W. Rozycki wrote:

> > Does it make sense to you if we encapsulate this with a hwprobe syscall?
> > e.g provide a hwprobe entry to get system's VLENB. We will have to
> > increase and rearrange the buffer for NT_RISCV_VECTOR if we want to use
> > ptrace as the entry point for this purpose. I am not very sure if it'd be
> > too late to do though.
> 
>  No, how do you expect it to work with a core dump (that can be examined 
> on a different system, or with a cross-debugger)?  You need to change the 
> API I'm afraid; it's unusable anyway.  It's a pity the toolchain community 
> wasn't consulted if you weren't sure how to design the interface.  Better 
> yet it would have been to implement the GDB side before the kernel part 
> has been committed.

 NB since this stuff went in with v6.5-rc1 and v6.5 hasn't been released 
you can still back out the problematic change as no one is expected to use 
RC stuff in production.  Alternatively you can redefine NT_RISCV_VECTOR 
for a corrected ABI, but I think it shouldn't be necessary.  You just need 
to act quickly as I guess there may be 1-2 further v6.5 RCs only and you 
have to get with that to Linus right away.  We can have a release or two 
without NT_RISCV_VECTOR support for the otherwise included vector stuff, 
it shouldn't be a big deal.  There just won't be support for the debug 
API.

 CC-ing Linux ptrace/RISC-V maintainers now to bring their attention.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
