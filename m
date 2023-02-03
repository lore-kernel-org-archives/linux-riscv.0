Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F5CC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 12:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rxve2h7Iqn3e5gHdHkB6B5TgnddxLX/ZyTN7SjKO6hI=; b=1/Z7AF7tv7qlgd
	eH7jHEblDYDvQs11F8zjpOdfIJ2gxrSxPFatojPQ7F9N0HPG4cHrADsaAc2LKwkET7/+YNHAibBDs
	L306S9KpWPbiRfHMdQWqJkIvcYk8IP63LZAPeWwYqREdO5G1rL21KGsgLMhb6ggTEV1vmMR1Npv0x
	IbEdoNzzWr9IwUdcEfVaRFxVh7FwLF8GfPcvYp/0RyWULCnGHiuMrSnNKP0VVmaWp3y5/jr3a6RcP
	CKx5VRcB3mBZLSFHcU7yWZ/5y19heiNHWAlcfPyrAajq0OzAwgzDdBPW/ug4V+F0JScS3SX2LsHjr
	islC6BnzMPwHxCVIM7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNukp-001ft8-EE; Fri, 03 Feb 2023 12:01:19 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNukm-001frc-93
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 12:01:17 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id l20so2421902vkm.11
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 04:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bVBPlUOA2Saz8Z2ELzkGmW92oTRqygdhDOd3NoQ2OvM=;
        b=C0uuf321Wlpg5+wIml2URGup0sUV3eCPnVIs2mDubn8aIXCDxAhcQSy9bMxjMoDglN
         WcXKKTa6sG7igE+h+BLd8BeJdcl8aT3AGLNm/QAUA8CLyEZ3tLodnzc9O6xFxOH9H2rm
         RG7c3hxqIFNYoSIwwLgsm/pxZCwRhRha88p+JP4D/8dVsQxT5KKKcCaFXDWjhWbf4VwI
         DKHc1USEDM+uqwVFaEleFuPeRlzU2HoNi+DorLJNKMj9937DweWd35ye2+U8oXmJA2Jn
         suSVFvjiD+nJ1WVEq4UEg8W3YIvny6e1yTg4NCLHFkgbu2oeqlA3w0vuckXv9FQDGlIL
         /Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVBPlUOA2Saz8Z2ELzkGmW92oTRqygdhDOd3NoQ2OvM=;
        b=5hfHKTKa+33ajPP5J2i80jT5nMZ6h2ayS+olef0EnoXV0TeeIMfUIlkjlNIQejr+1I
         BPQDz7/7TrwxCI0kJ6U7WC4hYMS9H4Q/zCCiMcoo27DBCZolSfkf/ghPj0vs+fD0zWrs
         GoUFXh87d3YkWsRuyAdlIj6jz5W9zPBpou4GPLBs2+AyKhqFc04IxEUc6ByF7+T6XLPh
         /eWitcabKrQ2KOHMrox9hjlzwmsN73cZ26lqw5KiNkAfCr3btQsIYCWfXGetXT5sKxjC
         ULw2oBbiCiSB/PPvip9csbFO2zxZDzQM2A6jIfNhLmmlLJ7R/Pv1TXUT3DfQT5z8ykLe
         8Uiw==
X-Gm-Message-State: AO0yUKUNuAoqfATbIwv9Jpyk/bN4I4tkgTLGsB+736NTmcKYup6skvj8
	9Ain8ZuOJtVatZ7+6hOOm3yVBUk6gnWTSDJxMp1RDw==
X-Google-Smtp-Source: AK7set8Q/OFTvZSYsRPT84VinKFWhLoPFlGow5ONcJ4RtLja8SFxkXGoz+YFgryocUWfojsT3S3jNMO/0HXz/NNCAyc=
X-Received: by 2002:a1f:6e0c:0:b0:3e1:95e8:fe1e with SMTP id
 j12-20020a1f6e0c000000b003e195e8fe1emr1584545vkc.1.1675425672447; Fri, 03 Feb
 2023 04:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-3-apatel@ventanamicro.com> <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
In-Reply-To: <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 3 Feb 2023 17:31:01 +0530
Message-ID: <CAK9=C2X8C4yswGhDwe1OzQXTELXQxp8=ayiFxh1aVMk4TxeDjw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: pbonzini@redhat.com, atishp@atishpatra.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, anup@brainfault.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_040116_323763_378BF639 
X-CRM114-Status: GOOD (  25.99  )
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

On Fri, Feb 3, 2023 at 5:54 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 27 Jan 2023 23:27:32 PST (-0800), apatel@ventanamicro.com wrote:
> > We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> > and Ssaia (S-mode AIA CSRs).
>
> This has pretty much the same problem that we had with the other
> AIA-related ISA string patches, where there's that ambiguity with the
> non-ratified chapters.  IIRC when this came up in GCC the rough idea was
> to try and document that we're going to interpret the standard ISA
> strings that way, but now that we're doing custom ISA extensions it
> seems saner to just define on here that removes the ambiguity.
>
> I just sent
> <https://lore.kernel.org/r/20230203001201.14770-1-palmer@rivosinc.com/>
> which documents that.

I am not sure why you say that these are custom extensions.

Multiple folks have clarified that both Smaia and Ssaia are frozen
ISA extensions as-per RVI process. The individual chapters which
are in the draft state have nothing to do with Smaia and Ssaia CSRs.

Please refer:
https://github.com/riscv/riscv-aia/pull/36
https://lists.riscv.org/g/tech-aia/message/336
https://lists.riscv.org/g/tech-aia/message/337

>
> > We extend the ISA string parsing to detect Smaia and Ssaia extensions.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 2 ++
> >  arch/riscv/kernel/cpu.c        | 2 ++
> >  arch/riscv/kernel/cpufeature.c | 2 ++
> >  3 files changed, 6 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 86328e3acb02..341ef30a3718 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,6 +59,8 @@ enum riscv_isa_ext_id {
> >       RISCV_ISA_EXT_ZIHINTPAUSE,
> >       RISCV_ISA_EXT_SSTC,
> >       RISCV_ISA_EXT_SVINVAL,
> > +     RISCV_ISA_EXT_SMAIA,
> > +     RISCV_ISA_EXT_SSAIA,
> >       RISCV_ISA_EXT_ID_MAX
> >  };
> >  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1b9a5a66e55a..a215ec929160 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
> >   *    extensions by an underscore.
> >   */
> >  static struct riscv_isa_ext_data isa_ext_arr[] = {
> > +     __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > +     __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>
> This will conflict with that ISA string refactoring I just merged.  It
> should be a pretty mechanical merge conflict, but if you want we can do
> a shared tag with the first few patches and I can handle the merge
> conflict locally.

I am planning to send this series as a second PR for Linux-6.3 after your
PR (which includes ISA string refactoring) is merged. Is that okay with you?

With that said, it would request you to ACK this patch as well.

>
> >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >       __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 93e45560af30..3c5b51f519d5 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
> >                               SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> >                               SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> >                               SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> > +                             SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> > +                             SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
> >                       }
> >  #undef SET_ISA_EXT_MAP
> >               }

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
