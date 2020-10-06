Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB53C4727E
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 16:47:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 196B1206DD
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 16:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zXP8n+HC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF9Y+dbl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 196B1206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q2vWOkE3aLGJETv9syGKUI5O0SNaZo9xvSrpbAHjo5A=; b=zXP8n+HChIp0B+tLsh27pJBpM
	glOe0KHv7ZE2FxCZCOrQqhKD0eftcOY8U5zr8P6lHfpxo3WHFgWNNrmBhI7W8KLFP51pGA0I8IBDy
	bFonfiD+YWhXHZfyEbPeVnU45QaFlQHxmX1TEZ/Eezr6kHOB/cm/G7y/+KQ3/KNciRkvylntZI+1U
	ZcM3Zahf0TWIzVsVDjIwVYWXwe3xfrh4Jz1S1jVM5F++g8VOiZTk5gJsb97MsUKLRo7P5+ppotvqZ
	6FHNzUy19li2/Oor1Nmg0ZdTukHHppBU5qOkwgdm33OKnG6ToX5pFH+jB9ZlPulyi0ke3vBun0FDx
	hL6TlW0ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPq79-0000tG-1p; Tue, 06 Oct 2020 16:46:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPq76-0000rr-44
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 16:46:57 +0000
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F72F2075A
 for <linux-riscv@lists.infradead.org>; Tue,  6 Oct 2020 16:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602002814;
 bh=6N+wobMAF8IDk/3qDidkLTePM+37ZvHyxc4HmXmoJ1c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BF9Y+dblnnqOoSkiL8Cu4L+HICS17ElwDmAcgBEhWIW0dK9tYf7dz5YiIFggv2lR4
 R4wad3CFaPcdR0am35OTcuG7bD1vJOrcwe6UAF3WYDnrwhsy9aiA1tpcbgfA+yaxIc
 qEsTKDBh+N3Os2f049MjERzQ03NlRgf/RBsOK5nY=
Received: by mail-lf1-f46.google.com with SMTP id z19so15827402lfr.4
 for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2020 09:46:54 -0700 (PDT)
X-Gm-Message-State: AOAM533iA1EEDNPts/2xYo/8Ewe8b23drwvyNi6C7R7Yagl6U6O+r6pq
 xj/gTL4s7vU0yt3R5jtNFIz1kcAHysD/aBFmKv0=
X-Google-Smtp-Source: ABdhPJwtmt0yVvix028cPsVw2WUiutEQ6nut7CVVXsWMH1AsUC4wFfHGzamo+vtertKc8n/lduNuaP6Rc5riToZ+vuI=
X-Received: by 2002:a19:7508:: with SMTP id y8mr771313lfe.540.1602002812413;
 Tue, 06 Oct 2020 09:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
 <1593266228-61125-2-git-send-email-guoren@kernel.org>
 <20200911204512.GA2705@aurel32.net>
 <CAJF2gTQiLV8sDE5cnvP=aBog4zaiMvMeieg_JtXwRODky1u3Hg@mail.gmail.com>
 <20200914103836.GB2705@aurel32.net> <87lfgzeidk.fsf@igel.home>
 <CAJF2gTQ8ONde3GRhQgx2Nqvb5X20nTmW8jZEemZKhezRDzP3aQ@mail.gmail.com>
 <CAOnJCUJhb2K89pRETbfTJ=5jHQhWfyfrOUu8zOE77j+id6OpSA@mail.gmail.com>
In-Reply-To: <CAOnJCUJhb2K89pRETbfTJ=5jHQhWfyfrOUu8zOE77j+id6OpSA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 7 Oct 2020 00:46:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRc-RUBiQ=ZE7BT8tABHu3=Bcmuc+ADyBLZ7r7fozwahg@mail.gmail.com>
Message-ID: <CAJF2gTRc-RUBiQ=ZE7BT8tABHu3=Bcmuc+ADyBLZ7r7fozwahg@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_124656_370023_EC12ACEA 
X-CRM114-Status: GOOD (  32.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Andreas Schwab <schwab@linux-m68k.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 6, 2020 at 3:14 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Sep 24, 2020 at 9:19 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > How about this, revert the commit and don't free INIT_DATA_SECTION. I
> > think the solution is safe enough, but wast a little memory.
> >
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > index f3586e3..34d00d9 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -22,13 +22,11 @@ SECTIONS
> >         /* Beginning of code and text segment */
> >         . = LOAD_OFFSET;
> >         _start = .;
> > -       _stext = .;
> >         HEAD_TEXT_SECTION
> >         . = ALIGN(PAGE_SIZE);
> >
> >         __init_begin = .;
> >         INIT_TEXT_SECTION(PAGE_SIZE)
> > -       INIT_DATA_SECTION(16)
> >         . = ALIGN(8);
> >         __soc_early_init_table : {
> >                 __soc_early_init_table_start = .;
> > @@ -55,6 +53,7 @@ SECTIONS
> >         . = ALIGN(SECTION_ALIGN);
> >         .text : {
> >                 _text = .;
> > +               _stext = .;
> >                 TEXT_TEXT
> >                 SCHED_TEXT
> >                 CPUIDLE_TEXT
> > @@ -67,6 +66,8 @@ SECTIONS
> >                 _etext = .;
> >         }
> >
> > +       INIT_DATA_SECTION(16)
> > +
>
> I think you need to move EXIT_DATA as well. Currently, we have init
> data & text in one section.
It's not related to this issue. There is two check code problem:
 1.     static int static_obj(const void *obj)
    {
            unsigned long start = (unsigned long) &_stext,
                          end   = (unsigned long) &_end,
                          addr  = (unsigned long) obj;

            /*
             * static variable?
             */
            if ((addr >= start) && (addr < end))
                    return 1;

 2.     /* Is this address range in the kernel text area? */
    static inline void check_kernel_text_object(const unsigned long ptr,
                                                unsigned long n, bool to_user)
    {
            unsigned long textlow = (unsigned long)_stext;
            unsigned long texthigh = (unsigned long)_etext;
            unsigned long textlow_linear, texthigh_linear;

            if (overlaps(ptr, n, textlow, texthigh))
                    usercopy_abort("kernel text", NULL, to_user, ptr -
textlow, n);

The patch of commit: a0fa4027dc911 (riscv: Fixup static_obj() fail) broke 2th.

> In general it is better idea to separate those similar to ARM64.
> Additionally, ARM64 applies different mapping for init data & text
> as the init data section is marked as non-executable[1]
Yes, it's safer to protect init text & init data, but it's should be
another patch.

>
> However, we don't modify any permission for any init sections. Should
> we do that as well ?
Agree, we should do that.

>
> [1] https://patchwork.kernel.org/patch/9572869/
>
> >         /* Start of data section */
> >         _sdata = .;
> >         RO_DATA(SECTION_ALIGN)
> >
> > On Thu, Sep 24, 2020 at 3:36 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> > >
> > > On Sep 14 2020, Aurelien Jarno wrote:
> > >
> > > > How should we proceed to get that fixed in time for 5.9? For the older
> > > > branches where it has been backported (so far 5.7 and 5.8), should we
> > > > just get that commit reverted instead?
> > >
> > > Can this please be resolved ASAP?
> > >
> > > Andreas.
> > >
> > > --
> > > Andreas Schwab, schwab@linux-m68k.org
> > > GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> > > "And now for something completely different."
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
