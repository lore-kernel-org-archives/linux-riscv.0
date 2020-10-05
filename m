Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DFAC4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 19:14:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD0132074F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 19:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CMOLdIsJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="F2TRLVcM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD0132074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fHh2xX6EaRp48JxI+7A20aNTVbWtMY0jG8gyFNfbR9c=; b=CMOLdIsJXQOChtxMmJ+OvQVCH
	KxP47n3eoZLj2/MW1FR0NJ4LWxI6cUqoDY4WrftieD+YfYr4Su0+LpiPZbdrSgbB4DiL59caeCNFi
	y38ljTj90cizOw2Aa9sypXOk+MDG60P8qhYiSBW2SG22aj7D0ZdXopWsyhtu72ziv+UMQVSEKY7NP
	udUQpwOK3I1WyXsjMeQr3rpkzF0YgjRxvgaT5hlsh9vz2QX/bX88X1yO9giTRnnef3C83ouWoW6Uv
	KfwdPvSod5hCAh7L38KgRpbxW8pu+WLeV25jZWQemiaJtKTaLf3nOm/4bm6jAzz8mPFBlvKa2QqWD
	z9gUOx/7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPVw8-0007Ik-8G; Mon, 05 Oct 2020 19:14:16 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPVw6-0007I2-GO
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 19:14:15 +0000
Received: by mail-io1-xd43.google.com with SMTP id u6so10377278iow.9
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 12:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xwAxPetPQqjNloRqroHgPvWNU+a4/LgMNfeziHOHJfY=;
 b=F2TRLVcMaGt3VPEEmegwbHPJ4ou8ND6anmLed18QlQIrqj8v2nxubg6lM79u1s4oi9
 pUIrVv2FRRGNSC8ASvas42okTQ3qCh7q3fWtd6bfHviFqAceEtSblKsomzFqK+lMqnir
 MxxNaca8KW2t8a/hAAHLN2eXGppKSuGDWm1aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwAxPetPQqjNloRqroHgPvWNU+a4/LgMNfeziHOHJfY=;
 b=bk5Mwh9KItbyywREBe7MJUIy94x0Huw/SAdywJElhM7P29ReENUIwyUJqS0LcbAksh
 495ftZPbSxQHwnza+EkgT+66/srDwiYEqgy6eYET/gnNpgpSO+JVycsClxislqkq7QBy
 e0uocXsMh9IHyGoOdaDx/K04ezU5OA+PdyOIBvXil5Yrh/auw7zEiPXVe3tuu1Uq4QRM
 ecps7uasly9SZj+gMAFP9FHczuJZ5X87HsH8Yuiivm7j9cJo6+7WG+70VAnU2DRcNt4n
 syhI7mcRMVPKelfSQ7btuZjkuCjsgxJBb8nmAOzzOB0JZeWHnvfiKuuTXHvFCYP7Jft5
 YXQg==
X-Gm-Message-State: AOAM5312lJc8a5CJ8SbkWiJfUsyhUJf5X4qe7LQDOIfZhredLZAmNjKG
 u2sX5A3AXtdbDBkZLlwfl04HMSsozA4U30tIequj
X-Google-Smtp-Source: ABdhPJzZTWc5aDIps9qCUH4gIcx01yrGYSRg4jL6Z7cAHeANHCNGR8ghILZwdUivcGDVDXopZEUHL3dxxcJiPt4KNJA=
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr1345504jaj.115.1601925252825; 
 Mon, 05 Oct 2020 12:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
 <1593266228-61125-2-git-send-email-guoren@kernel.org>
 <20200911204512.GA2705@aurel32.net>
 <CAJF2gTQiLV8sDE5cnvP=aBog4zaiMvMeieg_JtXwRODky1u3Hg@mail.gmail.com>
 <20200914103836.GB2705@aurel32.net> <87lfgzeidk.fsf@igel.home>
 <CAJF2gTQ8ONde3GRhQgx2Nqvb5X20nTmW8jZEemZKhezRDzP3aQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQ8ONde3GRhQgx2Nqvb5X20nTmW8jZEemZKhezRDzP3aQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 5 Oct 2020 12:14:01 -0700
Message-ID: <CAOnJCUJhb2K89pRETbfTJ=5jHQhWfyfrOUu8zOE77j+id6OpSA@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_151414_575859_31EA0B0C 
X-CRM114-Status: GOOD (  24.58  )
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

On Thu, Sep 24, 2020 at 9:19 AM Guo Ren <guoren@kernel.org> wrote:
>
> How about this, revert the commit and don't free INIT_DATA_SECTION. I
> think the solution is safe enough, but wast a little memory.
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index f3586e3..34d00d9 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -22,13 +22,11 @@ SECTIONS
>         /* Beginning of code and text segment */
>         . = LOAD_OFFSET;
>         _start = .;
> -       _stext = .;
>         HEAD_TEXT_SECTION
>         . = ALIGN(PAGE_SIZE);
>
>         __init_begin = .;
>         INIT_TEXT_SECTION(PAGE_SIZE)
> -       INIT_DATA_SECTION(16)
>         . = ALIGN(8);
>         __soc_early_init_table : {
>                 __soc_early_init_table_start = .;
> @@ -55,6 +53,7 @@ SECTIONS
>         . = ALIGN(SECTION_ALIGN);
>         .text : {
>                 _text = .;
> +               _stext = .;
>                 TEXT_TEXT
>                 SCHED_TEXT
>                 CPUIDLE_TEXT
> @@ -67,6 +66,8 @@ SECTIONS
>                 _etext = .;
>         }
>
> +       INIT_DATA_SECTION(16)
> +

I think you need to move EXIT_DATA as well. Currently, we have init
data & text in one section.
In general it is better idea to separate those similar to ARM64.
Additionally, ARM64 applies different mapping for init data & text
as the init data section is marked as non-executable[1]

However, we don't modify any permission for any init sections. Should
we do that as well ?

[1] https://patchwork.kernel.org/patch/9572869/

>         /* Start of data section */
>         _sdata = .;
>         RO_DATA(SECTION_ALIGN)
>
> On Thu, Sep 24, 2020 at 3:36 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> >
> > On Sep 14 2020, Aurelien Jarno wrote:
> >
> > > How should we proceed to get that fixed in time for 5.9? For the older
> > > branches where it has been backported (so far 5.7 and 5.8), should we
> > > just get that commit reverted instead?
> >
> > Can this please be resolved ASAP?
> >
> > Andreas.
> >
> > --
> > Andreas Schwab, schwab@linux-m68k.org
> > GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> > "And now for something completely different."
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
