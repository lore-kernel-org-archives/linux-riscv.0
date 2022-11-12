Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2050AC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Nov 2022 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxNzaLFb6bDjMe+wJDgcgrocbdOwCsI8FE+71CtJutA=; b=ulVuoKCQ1SjsyA
	GM38TEkakRikMJ+jP/Iv+khaa6LICTrNeg9n+48YUpqbRl74dzZunCcpzcimnc5X89SzsKuQXacIv
	DpSqawFoiN+cGipMqe8OAM7b8NddqdE9jihEg5oPLt1iLSrhbpC5abIAY9NbVmP3b+DH4AK0PpX5M
	varnjHCAswXcs6zncww8czk0HHCvcuH7meVWWsI3bVQtYJhPGDOURUTfXgk1q3sPY/fhor4GHkiZ8
	ADUrYOIz+yta4Unv4EiBfhIDM9Ez607YLo0IwqZsvIDpPzw116uqgBvafqqJBmcyW826Xdng2YTAE
	lGjzSyWraRzFHdndrbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otlEH-00436A-0B; Sat, 12 Nov 2022 07:47:05 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otlED-0042vH-QH
	for linux-riscv@lists.infradead.org; Sat, 12 Nov 2022 07:47:03 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-13c2cfd1126so7623838fac.10
        for <linux-riscv@lists.infradead.org>; Fri, 11 Nov 2022 23:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q63GJUSuDThP3uhtQba7IfspRKrI38ddEA7KDeMNEBs=;
        b=OU6VbUzxoJagZDCAhkjPlwn+dxRYKXSdHS3bm8UzVpdr8cEmzHxPs09JjfkImTKJN+
         XFcsoC1FAX6ofpuAHdIai45gSdgIofR2A/1UQpByFY1wXPa4AWDTqWtrHBXOwNIQ1hKB
         M58koGCywJ5peiq0aXvLGnIuwgNYfX2ec3S90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q63GJUSuDThP3uhtQba7IfspRKrI38ddEA7KDeMNEBs=;
        b=cyFwnRhr9PSEOQI5SWUFHG/GOhXgAGUi8PF0BWsYN+MqdUHC34Zkgq/h5aQzfl72D0
         F/5zS9W8wgo/qsr2YlycDsw6lcuDerbk8jzGgNQsey/V7ooK5JEqB7MnAxZvZRQgnci4
         qIty1+eutvf+o/AIRoqnCVoajHDu7mEbIbxKJIU6r16XtNhaOntVsxJb4HKLHgiR6Xtr
         4d4/iW3x9ZCYKxpflvYobbQTbPzfnA6lucPmzlTNQYjDxXZLLo9RkdhZt/ZdzSUg3ebh
         NBiH2ZPzyDcBTvPsdHz1yupdnSEafN2Rgq6I03G1Zl7D3iKYj+tNAb2KgLo7dnad89oy
         RBug==
X-Gm-Message-State: ANoB5plUBMLBZJDAhxFkvfuLndtvAc30rnhIHKxg3BzB1Dk2stDRwerk
	EDajrscVu9H10wFxSzxy65i7fKDyycrZAqQ09afC
X-Google-Smtp-Source: AA0mqf5UZ4i28VsBcXzC38GqHTvV3wPQq6gV4LbNJlcIfzZ/TtpvLnkdm9eKU7eM+H6GimyjKU6Bf9PqVPrLqR+IgVU=
X-Received: by 2002:a05:6870:518:b0:13b:be90:a68a with SMTP id
 j24-20020a056870051800b0013bbe90a68amr2736045oao.181.1668239209389; Fri, 11
 Nov 2022 23:46:49 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCUK5Z6i39f5MJaRFhorGjcmBR=p_MapY_TDcR1e274wtpA@mail.gmail.com>
 <mhng-76ad1ec7-7ad6-4223-9e6f-321ac56d6dee@palmer-ri-x1c9a>
In-Reply-To: <mhng-76ad1ec7-7ad6-4223-9e6f-321ac56d6dee@palmer-ri-x1c9a>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 11 Nov 2022 23:46:38 -0800
Message-ID: <CAOnJCUKKqJmJXvebn=12NciDe7iw016jpN6me-ZCH=50cCm+hg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Do not issue remote fences until smp is available
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	aou@eecs.berkeley.edu, anup@brainfault.org, damien.lemoal@wdc.com, 
	devicetree@vger.kernel.org, jszhang@kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_234701_876371_63EE6757 
X-CRM114-Status: GOOD (  29.81  )
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

On Thu, Nov 10, 2022 at 1:42 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 31 Oct 2022 12:26:05 PDT (-0700), atishp@atishpatra.org wrote:
> > On Mon, Oct 31, 2022 at 12:12 PM Conor Dooley <conor@kernel.org> wrote:
> >>
> >> On Fri, Oct 28, 2022 at 04:19:29PM -0700, Atish Patra wrote:
> >> > It is useless to issue remote fences if there is a single core
> >> > available. It becomes a bottleneck for sbi based rfences where
> >> > we will be making those ECALLs for no reason. Early code patching
> >> > because of static calls end up in this path.
> >> >
> >> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >>
> >> Hey Atish,
> >> This doesn't apply for me to either fixes or for-next. What branch does
> >> it apply to?
> >> Thanks,
> >> Conor.
> >>
> >> > ---
> >> >  arch/riscv/mm/cacheflush.c | 4 ++++
> >> >  1 file changed, 4 insertions(+)
> >> >
> >> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> >> > index f10cb47eac3a..7fafc8c26505 100644
> >> > --- a/arch/riscv/mm/cacheflush.c
> >> > +++ b/arch/riscv/mm/cacheflush.c
> >> > @@ -19,6 +19,10 @@ void flush_icache_all(void)
> >> >  {
> >> >       local_flush_icache_all();
> >> >
> >> > +     /* No need to issue remote fence if only 1 cpu is online */
> >> > +     if (num_online_cpus() == 1)
> >> > +             return;
> >> > +
> >> >       if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
> >> >               sbi_remote_fence_i(NULL);
> >> >       else
> >> > --
> >> > 2.34.1
> >> >
> >
> > Sorry I forgot to specify the dependencies for this patch. This patch
> > is based on Anup's IPI series [1] as
> > I assumed the IPI series would go first. I can rebase on top of the
> > master if required.
> > However, the issue will manifest only after Jisheng's patch[2] which
> > moved the sbi_init to earlier and introduced the
> > static key in the paging_init path.
> >
> > [1] https://patchwork.kernel.org/project/linux-riscv/patch/20220820065446.389788-8-apatel@ventanamicro.com/
> > [2] https://lore.kernel.org/lkml/20220716115059.3509-1-jszhang@kernel.org/
>
> IMO we should just stop issuing the SBI remote fences at all, with the
> code to do IPI-based fences we're just adding complexity for the slow
> case.

Sure. We can do that too. However, that will have some performance
impact for any platform(existing and future ones) without imsic.

Is that acceptable ? Maybe it will encourage every vendor to implement
AIA instead of PLIC ;)

--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
