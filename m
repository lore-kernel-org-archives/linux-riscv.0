Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45971C636CB
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qj9GU+vnkXrzYqGMzq5H4J8fh9tkVCXOttkQXCXrkmg=; b=gqjeVTpTa8bH17
	Pfgm/f14H5nP+o2EwKXELCz5Tl4fijBLjmVSeXHDZVkbnB66M/EkLrzu82BNaiiIOrtTOTJaYQQ6n
	Q0vyzfvOPuUkHVEct/rGjiDbRoOSgWftubtWeoSNX7yJpRwim5WVQSmLZMi9HbWk38IPgKDmSxYJ/
	cWhFhPkGJRrNiE0dewMH5sO5jRwZuAhOloaH7U81XH0mTKcjTUWxY89V4KXya0fEW+fsg7QywPUV+
	7E17n1vIFuHdPQP3SlKy/zQimOnytDodkwKwy9963Ysc6pGYWbabYIg5KE+E/FojbXBK/MDfFxJKo
	GdtbRPl8cDMr+Kq6+svg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUlg-003npg-3V; Mon, 30 Jan 2023 14:04:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUl1-003neH-1K
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 14:03:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BCADBB81132
	for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 13:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C23C433A0
	for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675086497;
	bh=+iz7/0m+hEIPyBQg3I/82VjHc01NMeldbSQt2dqGcSg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R9sDP955tHpJ1QqsR0L3i+gv+cjOVpaU84PSIDDhw30Zfl75NL7qlIA2Ek9QCOvOs
	 f+80E8rQ53TD2AN3Y/fjhXCl/P394lhf7L+pmSgNTulhP9LTLp6wF6rENXVPR99t4q
	 P7PT9uexAhtg0aTWMcOYFA3CSWm9/gLd1V6rPdGhjNkwjeN/4nwM9wJRlxmuhyahod
	 oB/uATlvf3mMQn1UmbUNCfzcUWCJKUY9gGnL/RqnIJP6gJ9vUwQcc9VGeaLhCHOMJe
	 qUvl/iPosG3dy0T8Zw5/MXdW5+nM7hxAjDtIxxYz/Dkt76O6zY7CAxhzYf6xfll6wU
	 3fXZBoZjE6a5g==
Received: by mail-vs1-f43.google.com with SMTP id h19so10713946vsv.13
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 05:48:17 -0800 (PST)
X-Gm-Message-State: AFqh2kr9XM0rSOElO4IbTIhUA1r+QugFXArGEgmZ544dYf/H6S8inpZN
	KMJEOp5fxCYwJaLnvOvFp+kjds4Q/7dEAvATww==
X-Google-Smtp-Source: AMrXdXvWFxwf7o8XYdZZzxKLXqR1OblZ1Jf42fyF9cWbecmrBhoaNv2NX636Gi1FINWWYnmBotKarycuGbTuFd70diw=
X-Received: by 2002:a05:6102:5490:b0:3b5:1fe4:f1c2 with SMTP id
 bk16-20020a056102549000b003b51fe4f1c2mr6746365vsb.0.1675086496230; Mon, 30
 Jan 2023 05:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20230123112803.817534-1-alexghiti@rivosinc.com>
 <20230123142554.f22ajf6upfk2ybxk@orel> <20230125104102.2thvourt3lx2p36a@orel> <CAHVXubjUCmk6xGTCPzMujYqKUwE0bhQBqd8A+=yq7ijQZtBObg@mail.gmail.com>
In-Reply-To: <CAHVXubjUCmk6xGTCPzMujYqKUwE0bhQBqd8A+=yq7ijQZtBObg@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Jan 2023 07:48:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ8JtkOBLpdf3hU9JWcdRTFr3Ss1Hd+yFpMqs7ujUiyCQ@mail.gmail.com>
Message-ID: <CAL_JsqJ8JtkOBLpdf3hU9JWcdRTFr3Ss1Hd+yFpMqs7ujUiyCQ@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_060339_415223_19E03CE3 
X-CRM114-Status: GOOD (  33.19  )
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

On Wed, Jan 25, 2023 at 6:13 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> On Wed, Jan 25, 2023 at 11:41 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Jan 23, 2023 at 03:25:54PM +0100, Andrew Jones wrote:
> > > On Mon, Jan 23, 2023 at 12:28:02PM +0100, Alexandre Ghiti wrote:
> > > > During the early page table creation, we used to set the mapping for
> > > > PAGE_OFFSET to the kernel load address: but the kernel load address is
> > > > always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> > > > pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> > > > PAGE_OFFSET is).

[...]

> > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > index f08b25195ae7..58107bd56f8f 100644
> > > > --- a/drivers/of/fdt.c
> > > > +++ b/drivers/of/fdt.c
> > > > @@ -891,12 +891,13 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
> > > >  static void __early_init_dt_declare_initrd(unsigned long start,
> > > >                                        unsigned long end)
> > > >  {
> > > > -   /* ARM64 would cause a BUG to occur here when CONFIG_DEBUG_VM is
> > > > -    * enabled since __va() is called too early. ARM64 does make use
> > > > -    * of phys_initrd_start/phys_initrd_size so we can skip this
> > > > -    * conversion.
> > > > +   /*
> > > > +    * __va() is not yet available this early on some platforms. In that
> > > > +    * case, the platform uses phys_initrd_start/phys_initrd_size instead
> > > > +    * and does the VA conversion itself.
> > > >      */
> > > > -   if (!IS_ENABLED(CONFIG_ARM64)) {
> > > > +   if (!IS_ENABLED(CONFIG_ARM64) &&
> > > > +       !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
> > >
> > > There are now two architectures, so maybe it's time for a new config
> > > symbol which would be selected by arm64 and riscv64 and then used here,
> > > e.g.
> > >
> > >   if (!IS_ENABLED(CONFIG_NO_EARLY_LINEAR_MAP)) {
> >
> > I see v5 left this as it was. Any comment on this suggestion?
>
> Introducing a config for this only use case sounds excessive to me,
> but I'll let Rob decide what he wants to see here.

Agreed. Can we just keep it as is here.

> > > >             initrd_start = (unsigned long)__va(start);
> > > >             initrd_end = (unsigned long)__va(end);

I think long term, we should just get rid of needing to do this part
in the DT code and let the initrd code do this.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
