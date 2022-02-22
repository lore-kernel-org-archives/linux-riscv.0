Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47785C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vUbUCPkC6Ll4O2d20I20g2NYJKGEB7Ti22sbj2Soto=; b=Cp/7s4vzUQnfDL
	3gySxCEkEIli7Z7lfgpMycLEGv+oEyrfJj2QdtHmqVLj10v8lPyDgK1B8YYJupdeGmSJjbM1oKUWi
	2IC44lun79j6NNiwPxvQcvhWJ1BabmHtuDECmQ1z1hacmS7K/5IelCB3JUMcHyS7qYAjNrQuc/QXf
	GQg0y0wyD7ACYoSR+eV34TzcFbZK0SQumNOpWkOmQ/gh2ChqdHt7UNtWxJ/LnvIaQ5cgPB77mmbvN
	i59b15szslggIn6KfojzYmdxzET0Zbf+NSJlIiM3t2ogehZ8gw2o59vP5D46S7k5/UD+UYFEiWekU
	5MpPwu3ag5OH4rCK/+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMZcn-00B9Gl-R1; Tue, 22 Feb 2022 18:10:57 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMZcj-00B9FL-KY
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 18:10:56 +0000
Received: by mail-yb1-xb35.google.com with SMTP id bt13so42961651ybb.2
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 10:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PodtsV3IZhfRYHA+gmyJlY7RLZtqZrXBop9ZuZOGDCM=;
 b=n3aEmbyvo/OZ83wEt2+H0j4xE2xlGACP2BdZKSZCtkCJFegTwv9t1c2B2j2+hCcm+t
 DuXQ8MmdB0qp3KakxPjDfhF/0Wvv1jgJE9GStoQV+AjVSbtgW+dArZTj6IrMRmL4+X7p
 pG/oREz4HEwJCHgdGK6eHxY+ePdduQ/oj2pY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PodtsV3IZhfRYHA+gmyJlY7RLZtqZrXBop9ZuZOGDCM=;
 b=R44CTBsAUexveTwHEXDg73pvaFbyCUZccrjjrxPSBczUolP+XKThY4/lYv11b52Tlp
 DebjnvbUO5y9KR4Jf/hnblAIcwU2mxg+wOM9PPnshmF+4I7DectJ5eJHbFHG4FvlRQFc
 HIy+drSOgLHIY+mOC/fK1NL6nl5N3CfgSNiqWh1Or5oMevVbYvpb7zg9rWONKGxzYBT4
 x8QNcs2VmwU6QZLeFswIVRdvkNRBIrdlEU6XL8ZeFoU0VK+LiRJFwx0HSYYc+PQA9rTy
 MjVAZlxAxWt4Fl2M9dkOqI7qCm3hgeJo0gdIeyG1xC7WZDOdXYJpHbfBR87ZIMf3NzCU
 CHIQ==
X-Gm-Message-State: AOAM533KSnibC7IwXB5JRvjFaJXprzwVK3ptAy0OPpCm68Uw8HAcG0ba
 oaN1WJS+WHAmyfeh24CrnAj6EHIxROIEmv20VEjL97e2IWrG
X-Google-Smtp-Source: ABdhPJyzwNQucE7qn2fz+dBN5gljgY+ELRL09JRS9TKhW9J3kwUKyInqXcZekfRKCO5mCMItlbKWSVAK6v6GzzqQT54=
X-Received: by 2002:a25:d294:0:b0:61d:9809:9917 with SMTP id
 j142-20020a25d294000000b0061d98099917mr24363735ybg.289.1645553451567; Tue, 22
 Feb 2022 10:10:51 -0800 (PST)
MIME-Version: 1.0
References: <20220216002911.1219593-1-atishp@rivosinc.com>
 <cover.1644987761.git.research_trasio@irq.a4lg.com>
 <8d7e1937f9476d14f64a53684b11bedd6f4ff88d.1644987761.git.research_trasio@irq.a4lg.com>
 <CAOnJCUKPBht9OY6bhHracxsX7U0w8jPKX-kFcQ5ZYkD-k7q4mQ@mail.gmail.com>
 <32ca2b3e-3e2b-ded3-39a9-df12bb9cb416@irq.a4lg.com>
 <CAOnJCUL_OX1NgzP_uqu4oEt3E-J1-ipdAeuuBPkByUKGAXSJTg@mail.gmail.com>
 <eaf1421b-677f-6fa5-0d0a-4f92c5153068@irq.a4lg.com>
In-Reply-To: <eaf1421b-677f-6fa5-0d0a-4f92c5153068@irq.a4lg.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 10:10:37 -0800
Message-ID: <CAOnJCU+2LQHJPP4dCLrJ-e10_6ngMcF6ZcoREqHo0Jwn7puYoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Extract base ISA from device tree
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_101053_790544_C83FE3A3 
X-CRM114-Status: GOOD (  42.06  )
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

On Mon, Feb 21, 2022 at 5:42 AM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> On 2022/02/16 16:43, Atish Patra wrote:
> > On Tue, Feb 15, 2022 at 10:59 PM Tsukasa OI
> > <research_trasio@irq.a4lg.com> wrote:
> >>
> >> On 2022/02/16 15:01, Atish Patra wrote:
> >>> On Tue, Feb 15, 2022 at 9:04 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
> >>>>
> >>>> This commit replaces print_isa function to extract base ISA from device
> >>>> tree ("riscv,isa").  It uses a subset of Tsukasa's riscv_fill_hwcap ISA
> >>>> parser.
> >>>>
> >>>> Design choices (1):
> >>>>
> >>>> It constructs base ISA string from the original string (does not cut
> >>>> the original string like Atish's).  This is to strip version numbers
> >>>> (too minor to represent as major ISA) but this behavior may be
> >>>> debatable.
> >>>>
> >>>
> >>> A simpler solution would be to just invoke
> >>> __riscv_isa_extension_available for all the base
> >>> extensions (imafdc) and print the base isa string.
> >>> We don't need to parse the ISA string again here.
> >>
> >> I agree that my patchset is ugly and simpler solution would be good.
> >> (Having two parser for same string is definitely not the best idea.)
> >> There are some testcases (some are not accepted by Spike's --isa option
> >> and requires custom Device tree) for testing:
> >>
> >> *   rv64imac
> >> *   rv64imacsu      (invalid ISA string; test QEMU workaround)
> >> *   rv64imafdch
> >> *   rv64imafdcsuh   (invalid ISA string; test QEMU workaround)
> >> *   rv64imafdc_svinval_svnapot
> >> *   rv64imafdcsvinval_svnapot
> >> *   rv64i2p1m2a2fdcsvinval
> >> *   rv64i2p1_m_afdcsvinval
> >>
> >
> > Thanks. This is a good set of test cases that covers most of the cases.
> >
> >>>
> >>>> Design choices (2):
> >>>>
> >>>> It skips when single-letter 'S' or 'U' is encountered.  It improves
> >>>> familiarity with regular ISA string.
> >>>>
> >>>
> >>> I don't think this is necessary because only Qemu appends 'S' & 'U' in
> >>> the isa string.
> >>> Your patch in Qemu will fix that for future releases of Qemu.
> >>> All other commonly used platforms (hardware/spike) already use the
> >>> correct ISA string.
> >>
> >> Yes, only QEMU.  It's not a serious problem like on cpufeature.c but would
> >> be nice to remove them (when exposing to the usermode) to prevent confusion
> >> on usermode side.
> >>
> >> If you invoke __riscv_isa_extension_available to generate base ISA string,
> >> would you exclude 'S' and 'U'?
> >>
> >
> > Yeah. That's easy. The possible valid base extensions are "IMAFHDQCBJPV".
> > (all the possible defined bits in misa except 'S' & 'U')
> > So we will invoke __riscv_isa_extension_available for those only.
>
> Order "IEMAFDQLCBKJTPVH" would be sufficient.
> Note that some of them may be incompatible with Linux or currently has
> no plan to be added as a single-letter extension.
>
> "E"**: RV32E
>      (incompatible with Linux?)

Yes. No need to check for this.

> "L"**: Decimal floating point
>      (placeholder is removed from the ISA specification)
> "B"**: Bit manipulation
>      (no single-letter extension plan but multiple subextensions)
> "K"**: Cryptography
>      (no single-letter extension plan but multiple subextensions)
> "J"**: Extensions for dynamic languages
>      (no single-letter extension but planned multiple subextensions)
> "T"**: Transactional memory
>      (placeholder is removed from the ISA specification)

That's why I did not include L & T as the ISA spec doesn't talk about
it anymore.
I am in favor of not including right now and add it later if any
future ratified spec includes it.

> "P"  : narrow SIMD using GPR
>      (this order is ratified but "P" is not)
> "H"  : Hypervisor (different position compared to your post)
>      (this order is not ratified but likely placed here
>       for compatibility with QEMU and Spike)
>

I thought it would be after "imafdqc". I will change it as per your suggestion.
We can always fix if the ratified spec will specify a different order.

This is what base ISA extension (single letter) will look like (for now)

"imafdqcbkjpvh"

I will send the patch shortly.

> Tsukasa
>
> >
> >>>
> >>>> This commit is intended to be squashed into Atish's isa_framework_v4
> >>>> PATCH 6/6.
> >>>>
> >>>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> >>>> ---
> >>>>  arch/riscv/kernel/cpu.c | 83 ++++++++++++++++++++++++++++++++++++-----
> >>>>  1 file changed, 74 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> >>>> index 6f9660c0a973..3f9607a66d95 100644
> >>>> --- a/arch/riscv/kernel/cpu.c
> >>>> +++ b/arch/riscv/kernel/cpu.c
> >>>> @@ -101,17 +101,82 @@ static void print_isa_ext(struct seq_file *f)
> >>>>
> >>>>  static void print_isa(struct seq_file *f, const char *isa)
> >>>>  {
> >>>> -       char *ext_start;
> >>>> -       int isa_len = strlen(isa);
> >>>> -       int base_isa_len = isa_len;
> >>>> -
> >>>> -       ext_start = strnchr(isa, isa_len, '_');
> >>>> -       if (ext_start)
> >>>> -               base_isa_len = isa_len - strlen(ext_start);
> >>>> +       unsigned char parse_break = 0;
> >>>> +       char base_isa[RISCV_ISA_EXT_BASE + 5];
> >>>> +       char *base_isa_end = base_isa;
> >>>> +       const char *isa_end = isa;
> >>>> +#if IS_ENABLED(CONFIG_32BIT)
> >>>> +       if (!strncmp(isa, "rv32", 4))
> >>>> +               isa_end += 4;
> >>>> +#elif IS_ENABLED(CONFIG_64BIT)
> >>>> +       if (!strncmp(isa, "rv64", 4))
> >>>> +               isa_end += 4;
> >>>> +#endif
> >>>> +       if (isa != isa_end) {
> >>>> +               strncpy(base_isa, isa, isa_end - isa);
> >>>> +               base_isa_end += isa_end - isa;
> >>>> +               for (; *isa_end; ++isa_end) {
> >>>> +                       switch (*isa_end++) {
> >>>> +                       case 'x':
> >>>> +                       case 'z':
> >>>> +                               parse_break = 1;
> >>>> +                               break;
> >>>> +                       case 's':
> >>>> +                               if (*isa_end != 'u') {
> >>>> +                                       parse_break = 1;
> >>>> +                                       break;
> >>>> +                               }
> >>>> +                               /**
> >>>> +                                * Workaround for invalid single-letter 's'
> >>>> +                                * (QEMU).  Should break for valid ISA string.
> >>>> +                                */
> >>>> +                               fallthrough;
> >>>> +                       default:
> >>>> +                               if (unlikely(!islower(isa_end[-1])
> >>>> +                                   || base_isa_end == base_isa + sizeof(base_isa))) {
> >>>> +                                       parse_break = 2;
> >>>> +                                       break;
> >>>> +                               }
> >>>> +                               switch (isa_end[-1]) {
> >>>> +                               case 's':
> >>>> +                               case 'u':
> >>>> +                                       break;
> >>>> +                               default:
> >>>> +                                       *base_isa_end++ = isa_end[-1];
> >>>> +                               }
> >>>> +                               /* Skip version number */
> >>>> +                               if (!isdigit(*isa_end))
> >>>> +                                       break;
> >>>> +                               while (isdigit(*++isa_end))
> >>>> +                                       ;
> >>>> +                               if (*isa_end != 'p')
> >>>> +                                       break;
> >>>> +                               if (!isdigit(*++isa_end)) {
> >>>> +                                       --isa_end;
> >>>> +                                       break;
> >>>> +                               }
> >>>> +                               while (isdigit(*++isa_end))
> >>>> +                                       ;
> >>>> +                               break;
> >>>> +                       }
> >>>> +                       if (*isa_end != '_')
> >>>> +                               --isa_end;
> >>>> +                       if (parse_break)
> >>>> +                               break;
> >>>> +               }
> >>>> +       }
> >>>>
> >>>> -       /* Print only the base ISA as it is */
> >>>> +       /**
> >>>> +        * Print only the base ISA
> >>>> +        * (original ISA string as is if an error is encountered)
> >>>> +        */
> >>>>         seq_puts(f, "isa\t\t: ");
> >>>> -       seq_write(f, isa, base_isa_len);
> >>>> +       if (parse_break < 2) {
> >>>> +               seq_write(f, base_isa, base_isa_end - base_isa);
> >>>> +       } else {
> >>>> +               isa_end += strlen(isa_end);
> >>>> +               seq_write(f, isa, isa_end - isa);
> >>>> +       }
> >>>>         seq_puts(f, "\n");
> >>>>  }
> >>>>
> >>>> --
> >>>> 2.32.0
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
