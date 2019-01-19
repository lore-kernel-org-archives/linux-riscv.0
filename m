Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBEDC61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 11:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F9CF2084C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 11:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uqAj5GgG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="OpIQBQ3N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F9CF2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVpWwBCnqhFok5urw7Xb3a4KiamON93Ty0tPLdN+y/M=; b=uqAj5GgGdMlIZ+
	yoaEqRnVh/Xy9HsdDEF3MbpqPtZfFoNB3geuTFzmeVqNGFKZKOaxMNr/1e15tsbDx4RnzFxK2ayug
	yNWTol0QfOfH1oQkEy8z7E1/kGyZZGroGbvBTSGHyOi7QFyYou7FvEARKP3gGd/OWAFfjqu27FJPi
	YZYDdKT+7YlrambF5nqechpOTYNJdoFa0OvTBgBl5w32nCdEXmt4yj0R8nJZiFuk2SRWGIcYyCLML
	79XVgMwglHNG7L96XZpVwEEz0jUnvkihkhCFkB8w/TocbOVWOVAPWL2PQgqDZPSW6T9LL92BbzaE1
	z/gfVOKEUsdGUkbhpy+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkp3q-0003Gz-Cd; Sat, 19 Jan 2019 11:45:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkp3m-0002sA-La
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 11:45:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id u4so18101862wrp.3
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jan 2019 03:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vwESvPsUPWdfsIpmSo7CLXk62e+AihcYNrgiKP4BLQ=;
 b=OpIQBQ3NSuf6//MCRyI6qaPtJyGFEDxT1a4VxytfAnf8yf8s1fUWao8ldyI+H9Vjud
 eNB0nlCawXuyFdY3BcVNx9O1QZnGHP0SvASh2yezB+c+GKKLxD+D+op3xfzs3AlvKwgG
 Ljd+GVWRq8La+o7AabLJSJK29D7rrWXaJ3NFeM7W2B9pcmtKO4GRJBqDo8xu6siEbqKQ
 hf7sJTp3Jdfvc88qSdmy1LeZOCCs6F5Q0j1ZwN/bIesN/5lfqhw5qWFVvA+gOH5TIsCA
 y1lvnpJzGZdeRLZP70fP0hnijSyRooLiebwZGX4oZ167UHO9lDOHvYXPkzyQ8J9aIudu
 /B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vwESvPsUPWdfsIpmSo7CLXk62e+AihcYNrgiKP4BLQ=;
 b=a4DwDMaQbRdDtqePqHr41fZ5RwqHWWrg8d2BR5pedvTZdDVEa0sf3ev8bhrOP04kU9
 oHja4HvHS3fGqrVmik+rSBIwYe0CzFHCcoYtprung/WDkOCS3k7YCoTEO69CnXK7wfOn
 m63JF+I58lugCHg8gYzCXtxAG61fKw+qahi7Nep2rqIPb6RBqewbPmreeGN6n+0AiLMo
 WI8R+XH5Tk9ml6UcxCc0rBNAI/fKzuubBaQTYdWMgw0uRofFck+0MYKhLStMyPZ2p91j
 wjlarF5lc+BiMdP/rnVJhpkdlOH8NXNOAxRXOgQKvTctqXU7HwG919vBrB9f2VvnjYou
 taKA==
X-Gm-Message-State: AJcUukegrHMRka7RRaoUFq6L/ew6AuX9Gt6TMo9rt2jib1iKuw6cfmze
 kntpK7Q8eAqMUE+CDGZLtML64ibpNASOEr53/3WNPg==
X-Google-Smtp-Source: ALg8bN69SN2/62L2WE9uHPe+C1tCbhqKYQmuUgsN2yf0vNo5uCkeHMUuRGCD4glW1ctt9fG9CfepzW/OcOHFlV+1cxQ=
X-Received: by 2002:adf:f785:: with SMTP id q5mr19369498wrp.9.1547898306356;
 Sat, 19 Jan 2019 03:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20190107161047.10516-1-anup@brainfault.org>
 <20190107161047.10516-6-anup@brainfault.org>
 <20190115134746.GF13216@infradead.org>
In-Reply-To: <20190115134746.GF13216@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 17:14:55 +0530
Message-ID: <CAAhSdy2Fzj08+Tdog1Z907=mr8Th0CYvE+fM1kFpii=GcTeTnw@mail.gmail.com>
Subject: Re: [PATCH 5/5] RISC-V: Implement compile-time fixed mappings
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_034510_855375_E78787AC 
X-CRM114-Status: GOOD (  21.85  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 7:17 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Jan 07, 2019 at 09:40:47PM +0530, Anup Patel wrote:
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > This patch implements compile-time virtual to physical
> > mappings. These compile-time fixed mappings can be used
> > by earlycon, ACPI, and early ioremap for creating fixed
> > mappings when FIX_EARLYCON_MEM=y.
> >
> > To start with, we have enabled compile-time fixed
> > mappings for earlycon.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/Kconfig              |  3 ++
> >  arch/riscv/include/asm/fixmap.h | 52 +++++++++++++++++++++++++++++++++
> >  arch/riscv/mm/init.c            | 32 ++++++++++++++++++++
> >  3 files changed, 87 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/fixmap.h
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e0d7d61779a6..66094aba9a59 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -86,6 +86,9 @@ config GENERIC_CSUM
> >  config GENERIC_HWEIGHT
> >       def_bool y
> >
> > +config FIX_EARLYCON_MEM
> > +     def_bool y
> > +
>
> Can you please throw in a prep patch to move FIX_EARLYCON_MEM to
> drivers/tty/serial/Kconfig and only select it from the architectures
> that use it?

Implementing fixmap is totally optional for architectures so it
makes sense to have FIX_EARLYCON_MEM as architecture
specific kconfig option. There are many such architecture specific
options provided as "def_bool y" in arch/<xyz>/Kconfig. Also,
having such "def_bool y" kconfig options in arch/<xyz>/Kconfig
gives us idea about optional features implemented by <xyz>
arch support.

I don't agree with this suggestion. If you still feel this is right way
to go then please go ahead and send patch to move
FIX_EARLYCON_MEM option in drivers/tty/serial/Kconfig.

>
> > + * fixmap.h: compile-time virtual memory allocation
>
> No need to mention the header name.

Sure, will remove header name.

>
> > + */
> > +
> > +#ifndef _ASM_RISCV_FIXMAP_H
> > +#define _ASM_RISCV_FIXMAP_H
> > +
> > +#ifndef __ASSEMBLY__
>
> As far as I can tell we never include this header from assembly files,
> so this ifdef should not be needed.
>
> > +/*
> > + * Here we define all the compile-time 'special' virtual
> > + * addresses. The point is to have a constant address at
> > + * compile time, but to set the physical address only
> > + * in the boot process.
> > + *
> > + * These 'compile-time allocated' memory buffers are
> > + * page-sized. Use set_fixmap(idx,phys) to associate
> > + * physical memory with fixmap indices.
> > + */
>
> Please use up the available 80 chars per line for comments.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
