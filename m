Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80333C636CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pl2/D3HQjR4tVw4L4Xl5qziuC7qs5UoSk0jHuj40fYQ=; b=A73jF3cEP27BAd
	TPAlfbYKZL7qQ93TWZI663NVuVzfYWsbYhVmTMPlS+IFDvNJYZp5BWj2hChqVtjZYzJIl+V3TnL16
	wOJ2q0BtBojYDiLEaj7ieyPU5dygoBnWA+eqMpH4xyfOH+G5HyTH1AVBpXCMPDLtmeCpqz2VtbsxA
	nrklzO6IYnyDuPad8slRCUzJpHQBnH5gHG06tXzIMV4997qXwF9SaqLX2IYecoqGaz41FOBNXB70i
	80IcLgFIaaZ6JgFYDaZiMdaKVuEp3X/77VMplWr5lxpiAwqmpJVq194gB/LR2yuLXuoxC0pVMbd2w
	sCYhYtnbUX3F4KC2rAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPSVG-00D1co-VF; Tue, 07 Feb 2023 18:15:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPSVD-00D1cG-9O
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 18:15:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id r8so16550498pls.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 10:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ki5DOsdj+I7V0iQm8c+gc68aPy9B9pJYIHBnvaR1rFo=;
        b=A07E34blrOf+RFVP72blgH8SbduWvX6cBnnfjRZ2CzllY/8fAJkqPEVNWtIK9VHV3G
         NbHsgqj7AkQ+2sRd9xHvgd5/iJ54AgAJlVf+Z2/iPcX5oXc2Xzkk02jNKgu+6/TL5ugC
         9uo6rAd8z6K0yL55sIIsjZmh+dM5biPINJZdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ki5DOsdj+I7V0iQm8c+gc68aPy9B9pJYIHBnvaR1rFo=;
        b=QSKmBNliAv2SJAVIOGDC3+jr2aIO0ClcOAtKIzarGnxsS0DeNK8pXRYzSJcXQdrq9n
         J33BXVyjyDSAuEb5pY5qWAXD8mZ1zJyt3twDVw4AXWX3W7xdt36Dp3rjR/aDC3Ei9Fj7
         8L3xyVhpIveFjE2CcJJoFL400DBAaHEPnHn8JUtOUEbceOEdqdnAy6in6Nu34OVTSg8n
         xG0jMaZOIemVsX6m0eCpYOuFaifym1GFtIY3Jf0Tee4rJZeTNKd0v0oSJa+kPr5G08Rg
         7kQtPqdtdBctYwsNGKpX1ieOVQK4MR9F7NC9AfN17yLjlYByQQiY/EOSedD1kBS5Lxax
         NFCA==
X-Gm-Message-State: AO0yUKXVDK98iXtTcG526bF61DxK6W6qXdfsBWQhzf+SYrwkYSebbkwO
	QMxFJfQ/I1VQs0vaL7Bxivm1t0U1vx8k8vCAE5VK
X-Google-Smtp-Source: AK7set/YrPhx5DtOD8Hema0OE/cOhtAcN2EmCieWwUvZ0K1SqOrSl8cw8V7VYiGAiEYa2sV/BqvLr1rX2qChP/KNeGA=
X-Received: by 2002:a17:902:d889:b0:199:21af:cba0 with SMTP id
 b9-20020a170902d88900b0019921afcba0mr992775plz.23.1675793734355; Tue, 07 Feb
 2023 10:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAK9=C2X8C4yswGhDwe1OzQXTELXQxp8=ayiFxh1aVMk4TxeDjw@mail.gmail.com> <Y+KS16ZNXrDU+xun@spud>
In-Reply-To: <Y+KS16ZNXrDU+xun@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 7 Feb 2023 10:15:22 -0800
Message-ID: <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
To: Conor Dooley <conor@kernel.org>, Stephano Cetola <stephano@riscv.org>, Jeff Scheel <jeff@riscv.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, pbonzini@redhat.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, anup@brainfault.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_101535_581357_89629AB2 
X-CRM114-Status: GOOD (  43.54  )
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

On Tue, Feb 7, 2023 at 10:05 AM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Anup, Palmer,
>
> On Fri, Feb 03, 2023 at 05:31:01PM +0530, Anup Patel wrote:
> > On Fri, Feb 3, 2023 at 5:54 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > >
> > > On Fri, 27 Jan 2023 23:27:32 PST (-0800), apatel@ventanamicro.com wrote:
> > > > We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> > > > and Ssaia (S-mode AIA CSRs).
> > >
> > > This has pretty much the same problem that we had with the other
> > > AIA-related ISA string patches, where there's that ambiguity with the
> > > non-ratified chapters.  IIRC when this came up in GCC the rough idea was
> > > to try and document that we're going to interpret the standard ISA
> > > strings that way, but now that we're doing custom ISA extensions it
> > > seems saner to just define on here that removes the ambiguity.
> > >
> > > I just sent
> > > <https://lore.kernel.org/r/20230203001201.14770-1-palmer@rivosinc.com/>
> > > which documents that.
> >
> > I am not sure why you say that these are custom extensions.
> >
> > Multiple folks have clarified that both Smaia and Ssaia are frozen
> > ISA extensions as-per RVI process. The individual chapters which
> > are in the draft state have nothing to do with Smaia and Ssaia CSRs.
> >
> > Please refer:
> > https://github.com/riscv/riscv-aia/pull/36
> > https://lists.riscv.org/g/tech-aia/message/336
> > https://lists.riscv.org/g/tech-aia/message/337
>
> All of these links seem to discuss the draft chapters somehow being
> incompatible with the non-draft ones. I would very expect that that,
> as pointed out in several places there, that the draft chapters
> finalisation would not lead to meaningful (and incompatible!) changes
> being made to the non-draft chapters.
>

Here is the status of all RVI specs. It states that the Smaia, Ssaia
extensions are frozen (i.e. public review complete).
https://wiki.riscv.org/display/HOME/Specification+Status

I have added stephano/Jeff to confirm the same.

AFAIK, IOMMU spec is close to the public review phase and should be
frozen in this or next quarter.
IIRC, this chapter in AIA will be frozen along with IOMMU spec.

Anup: Please correct me if that's not correct.

> Maybe yourself and Palmer are looking at this from different
> perspectives? Looking at his patch from Friday:
> https://lore.kernel.org/linux-riscv/20230203001201.14770-1-palmer@rivosinc.com/
> He specifically mentioned this aspect, as opposed to the aspect that
> your links refer to.
>
> Surely a duo-plic, if that ever comes to be, could be detected from
> compatible strings in DT or w/e - but how do you intend differentiating
> between an implementation of S*aia that contains the IOMMU support in
> Chapter 9 in a finalised form, versus an implementation that may make
> "different decisions" when it comes to that chapter of the spec?

We will most likely have an extension specific to iommu spec as well.

> I thought that would be handled by extension versions, but I am told
> that those are not a thing any more.
> If that's not true, and there'll be a version number that we can pull in
> from a DT and parse which will distinguish between the two, then please
> correct my misunderstanding here!
>
> Thanks,
> Conor.
>
> > > > We extend the ISA string parsing to detect Smaia and Ssaia extensions.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/include/asm/hwcap.h | 2 ++
> > > >  arch/riscv/kernel/cpu.c        | 2 ++
> > > >  arch/riscv/kernel/cpufeature.c | 2 ++
> > > >  3 files changed, 6 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > > index 86328e3acb02..341ef30a3718 100644
> > > > --- a/arch/riscv/include/asm/hwcap.h
> > > > +++ b/arch/riscv/include/asm/hwcap.h
> > > > @@ -59,6 +59,8 @@ enum riscv_isa_ext_id {
> > > >       RISCV_ISA_EXT_ZIHINTPAUSE,
> > > >       RISCV_ISA_EXT_SSTC,
> > > >       RISCV_ISA_EXT_SVINVAL,
> > > > +     RISCV_ISA_EXT_SMAIA,
> > > > +     RISCV_ISA_EXT_SSAIA,
> > > >       RISCV_ISA_EXT_ID_MAX
> > > >  };
> > > >  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> > > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > > index 1b9a5a66e55a..a215ec929160 100644
> > > > --- a/arch/riscv/kernel/cpu.c
> > > > +++ b/arch/riscv/kernel/cpu.c
> > > > @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
> > > >   *    extensions by an underscore.
> > > >   */
> > > >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > > > +     __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > > > +     __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> > >
> > > This will conflict with that ISA string refactoring I just merged.  It
> > > should be a pretty mechanical merge conflict, but if you want we can do
> > > a shared tag with the first few patches and I can handle the merge
> > > conflict locally.
> >
> > I am planning to send this series as a second PR for Linux-6.3 after your
> > PR (which includes ISA string refactoring) is merged. Is that okay with you?
> >
> > With that said, it would request you to ACK this patch as well.
> >
> > >
> > > >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> > > >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > > >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > index 93e45560af30..3c5b51f519d5 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
> > > >                               SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> > > >                               SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> > > >                               SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> > > > +                             SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> > > > +                             SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
> > > >                       }
> > > >  #undef SET_ISA_EXT_MAP
> > > >               }
> >
> > Thanks,
> > Anup



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
