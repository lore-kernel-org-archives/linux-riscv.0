Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9393C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUpW5i7mCY5yF2CnV1Bhy++O6WTUKviKCf3Y844AsN8=; b=iI5Qup+Ko6olE2
	nVGonIVBE0JQrh8UK7yOvk57U4hybXQ2k4wFGYsN71wG61iEaiXX1lxQcJIrjaLLoVd4XGgFYkdR6
	NYz4qkp9XL1ZF79xNpycYYv9L4dRB/LkPq4L8Q6gSENE74agJ97/OFx570ky2eB0AcVfpM0aEjBvB
	rFEIgGf7IasCnqX2hTxpZoQNLPSytEzffeHd2fad5bpu6IeaQH4RfWuRkv5iVFq0IYeSPOUJAuRE4
	gvz6Eb/tf0yli0HKR4mj2iF/sx4lTuFId5i4ILX580sC9jyzB0e2NwE0XdMtylrjJPXyH4JPYNRUV
	yW5+sE9IL5FIJJ/SJlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVbx-003w2E-6b; Mon, 30 Jan 2023 14:58:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVbt-003vyp-6j
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 14:58:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CBD2B81087
	for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 14:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC42C4339C
	for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675090692;
	bh=Dy66gCGzyPJcLshQJwfc5AQ29gXjKkXX0fJ1HpNtqwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FfM/uxuAyNgHOaqVA8WADrwhDAnalF3RevfdK1VNAF103T+vEiOMf03gaTiz87HZo
	 ekjJ8tW7eBKz3Utie3p7HTVEbuI2WiRIz38SAILkcrJJupLWrj5HG5yacNczSsZIc7
	 p0wzL2WshdRla/3UwqoJDl8OXqCMR1ERvTHhR7gJc4m5b/KE5HbhCHtrjcMKyHyBKf
	 Z3w6BD0ysSkyA4+6z6roeaPMZku2lI0tvak6eS28tIA2R9RaoulnUHkOQMBouXawGE
	 V4qss+S9LJmZdY3c9Suhyq2USXdJ6PG9tZVf67dQZfG/R3BXyKd6baMhyhajL5/93X
	 2Tc/9NVE1Pd+A==
Received: by mail-vk1-f169.google.com with SMTP id v81so5855976vkv.5
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 06:58:11 -0800 (PST)
X-Gm-Message-State: AO0yUKWYfl32myKNBY5AyvdmzkeFxYJ3FjTkf99pQvjhhhCmy6qCBPc+
	bj07nXeXbymXGjRa/HieYHjQY4ZFLz3Aus3tNQ==
X-Google-Smtp-Source: AK7set9svEjsdOnCKyk10Z9orQXpAu0MQ19gFzSd4yUat7bVea/0tlPfgDkyR8ht9EtvCpLlVMcChGgiQFZ47mwWGzg=
X-Received: by 2002:a1f:eec2:0:b0:3ea:1a72:aad6 with SMTP id
 m185-20020a1feec2000000b003ea1a72aad6mr899057vkh.15.1675090690804; Mon, 30
 Jan 2023 06:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20230123112803.817534-1-alexghiti@rivosinc.com>
 <20230123142554.f22ajf6upfk2ybxk@orel> <20230125104102.2thvourt3lx2p36a@orel>
 <CAHVXubjUCmk6xGTCPzMujYqKUwE0bhQBqd8A+=yq7ijQZtBObg@mail.gmail.com>
 <CAL_JsqJ8JtkOBLpdf3hU9JWcdRTFr3Ss1Hd+yFpMqs7ujUiyCQ@mail.gmail.com> <20230130141933.wuikrruh2svkcfv4@orel>
In-Reply-To: <20230130141933.wuikrruh2svkcfv4@orel>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Jan 2023 08:57:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJdBGAOELLTQbfi6Q3r-AnS5Wf8VNf94BP6Y9TNvPHS-w@mail.gmail.com>
Message-ID: <CAL_JsqJdBGAOELLTQbfi6Q3r-AnS5Wf8VNf94BP6Y9TNvPHS-w@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_065817_563477_E4821352 
X-CRM114-Status: GOOD (  41.31  )
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

On Mon, Jan 30, 2023 at 8:19 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 30, 2023 at 07:48:04AM -0600, Rob Herring wrote:
> > On Wed, Jan 25, 2023 at 6:13 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> > >
> > > On Wed, Jan 25, 2023 at 11:41 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > On Mon, Jan 23, 2023 at 03:25:54PM +0100, Andrew Jones wrote:
> > > > > On Mon, Jan 23, 2023 at 12:28:02PM +0100, Alexandre Ghiti wrote:
> > > > > > During the early page table creation, we used to set the mapping for
> > > > > > PAGE_OFFSET to the kernel load address: but the kernel load address is
> > > > > > always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> > > > > > pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> > > > > > PAGE_OFFSET is).
> >
> > [...]
> >
> > > > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > > > index f08b25195ae7..58107bd56f8f 100644
> > > > > > --- a/drivers/of/fdt.c
> > > > > > +++ b/drivers/of/fdt.c
> > > > > > @@ -891,12 +891,13 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
> > > > > >  static void __early_init_dt_declare_initrd(unsigned long start,
> > > > > >                                        unsigned long end)
> > > > > >  {
> > > > > > -   /* ARM64 would cause a BUG to occur here when CONFIG_DEBUG_VM is
> > > > > > -    * enabled since __va() is called too early. ARM64 does make use
> > > > > > -    * of phys_initrd_start/phys_initrd_size so we can skip this
> > > > > > -    * conversion.
> > > > > > +   /*
> > > > > > +    * __va() is not yet available this early on some platforms. In that
> > > > > > +    * case, the platform uses phys_initrd_start/phys_initrd_size instead
> > > > > > +    * and does the VA conversion itself.
> > > > > >      */
> > > > > > -   if (!IS_ENABLED(CONFIG_ARM64)) {
> > > > > > +   if (!IS_ENABLED(CONFIG_ARM64) &&
> > > > > > +       !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
> > > > >
> > > > > There are now two architectures, so maybe it's time for a new config
> > > > > symbol which would be selected by arm64 and riscv64 and then used here,
> > > > > e.g.
> > > > >
> > > > >   if (!IS_ENABLED(CONFIG_NO_EARLY_LINEAR_MAP)) {
> > > >
> > > > I see v5 left this as it was. Any comment on this suggestion?
> > >
> > > Introducing a config for this only use case sounds excessive to me,
> > > but I'll let Rob decide what he wants to see here.
> >
> > Agreed. Can we just keep it as is here.
> >
> > > > > >             initrd_start = (unsigned long)__va(start);
> > > > > >             initrd_end = (unsigned long)__va(end);
> >
> > I think long term, we should just get rid of needing to do this part
> > in the DT code and let the initrd code do this.
>
> initrd code provides reserve_initrd_mem() for this and riscv calls
> it later on. afaict, this early setting in OF code is a convenience
> which architectures could be taught not to depend on, and then it
> could be removed. But, until then, some architectures will need to
> avoid it. As I commented downthread, I also don't want to go with
> a config anymore, but it'd be nice to keep arch-specifics out of
> here, so I've posted a patch changing __early_init_dt_declare_initrd
> to be a weak function.

If this was *always* going to be architecture specific, then I'd
agree. But I think there are better paths to refactor this. I don't
want to go back to a weak function and encourage more implementations
of __early_init_dt_declare_initrd().

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
