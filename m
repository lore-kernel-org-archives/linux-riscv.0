Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE05C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 18:34:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD7E61163
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 18:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD7E61163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=klvXXZooyCRFCBPkGWQbrSWVIEpnLmsjp8IHmyKwm/I=; b=APBVY6pG3PKXA/u/V15VaDFd+
	+w7R4wR7q0cTs1IY+JSNEav+BldQUVRjUC9pw6y9/kMzit3DeAa/1FvmVIu6ELauN1BQf8AojVjFd
	Fg+jKcoIy2l/d6Y0b5DSClO9Of8ksPS+Kj3BQRJoGMbA6vMbwZyGJOoW36zSOa931woF5vu5uFha9
	jF1CHwEmRCrF4/n1CkCvbCyVT9RfFIMUoLAKa5u9jiw8+j4eBhqG2eKm3CMZnrx96htW+V3jg5RC0
	RQdTrffa+fp5a3QPctP4mypSpM5iwGeQBcUSWgrXHQ10IhKl55uBGk0DMIhjfKUc0JCEXRdaToaVQ
	qX1X1Kpcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSOc2-00DbKQ-Np; Fri, 02 Apr 2021 18:33:42 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::4])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lSObv-00DbIz-OD
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 18:33:39 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 0BDAE92009C; Fri,  2 Apr 2021 20:33:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 05AAC92009B;
 Fri,  2 Apr 2021 20:33:30 +0200 (CEST)
Date: Fri, 2 Apr 2021 20:33:30 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
cc: Dmitry Vyukov <dvyukov@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux API <linux-api@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
In-Reply-To: <CAEn-LTqTXCEC=bXTvGyo8SNL0JMWRKtiSwQB7R=Pc4uhxZUruA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2104022022300.18977@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2103302221590.18977@angie.orcam.me.uk>
 <mhng-08e5e4fb-8a42-4f7b-8ceb-ff549784100e@palmerdabbelt-glaptop>
 <CACT4Y+Z0PaAuUFrOBenztWkw8OV=J-qaeD1FASPM4ufcLg5a5A@mail.gmail.com>
 <CAEn-LTqTXCEC=bXTvGyo8SNL0JMWRKtiSwQB7R=Pc4uhxZUruA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_193336_014018_604B4BE1 
X-CRM114-Status: GOOD (  33.71  )
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

On Fri, 2 Apr 2021, David Abdurachmanov wrote:

> > > >  This macro is exported as a part of the user API so it must not depend on
> > > > Kconfig.  Also changing it (rather than say adding COMMAND_LINE_SIZE_V2 or
> > > > switching to an entirely new data object that has its dimension set in a
> > > > different way) requires careful evaluation as external binaries have and
> > > > will have the value it expands to compiled in, so it's a part of the ABI
> > > > too.
> > >
> > > Thanks, I didn't realize this was part of the user BI.  In that case we
> > > really can't chage it, so we'll have to sort out some other way do fix
> > > whatever is going on.
> > >
> > > I've dropped this from fixes.
> >
> > Does increasing COMMAND_LINE_SIZE break user-space binaries? I would
> > expect it to work the same way as adding new enum values, or adding
> > fields at the end of versioned structs, etc.
> > I would assume the old bootloaders/etc will only support up to the
> > old, smaller max command line size, while the kernel will support
> > larger command line size, which is fine.
> > However, if something copies /proc/cmdline into a fixed-size buffer
> > and expects that to work, that will break... that's quite unfortunate
> > user-space code... is it what we afraid of?
> >
> > Alternatively, could expose the same COMMAND_LINE_SIZE, but internally
> > support a larger command line?
> 
> Looking at kernel commit history I see PowerPC switched from 512 to
> 2048, and I don't see complaints about the ABI on the mailing list.
> 
> If COMMAND_LINE_SIZE is used by user space applications and we
> increase it there shouldn't be problems. I would expect things to
> work, but just get truncated boot args? That is the application will
> continue only to look at the initial 512 chars.

 The macro is in an include/uapi header, so it's exported to the userland 
and a part of the user API.  I don't know what the consequences are for 
the RISC-V port specifically, but it has raised my attention, and I think 
it has to be investigated.

 Perhaps it's OK to change it after all, but you'd have to go through 
known/potential users of this macro.  I guess there shouldn't be that many 
of them.

 In any case it cannot depend on Kconfig, because the userland won't have 
access to the configuration, and then presumably wants to handle any and 
all.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
