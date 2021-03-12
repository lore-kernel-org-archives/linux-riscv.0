Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83A9C433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:52:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74CE164FE0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74CE164FE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rg9f0IQDFk6U6UeGsVEJJVDx5kzbgWxPAshzUH6yGC4=; b=TDtAz1nHUhidZQasYw89ymh0c
	W1nvsVzU8/OiHNhIpiMrb8BFB75UoMuvnotv3moABmwc1RTeTmIinr6FCf6KiWL8Nph7a02k2uhXU
	5PfkZ2U279GSdhjY8EqEv48QEjgyV28vmBgIQAiJCvv5Mi2UezHejcumdQO7mbEZ/pf+PQ3c2z0we
	lq6YC21y9peUw+hvz4NUlApSnbDWhJYdKQmNUvNtCb0mTe6dHqiL9XmBX5RnEJJCMzqYJLTMf1aHs
	w17dV8wlSgHE5FZiSwb5ry6ZqRYiQ7ds93BG1aNCvCY5e3nMusiNmh6OUiWL0VPRGBq7XCpBf2sUT
	1Td+3YtFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKk5S-00BsFH-QU; Fri, 12 Mar 2021 15:52:26 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKk5F-00BsBz-UK
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 15:52:15 +0000
Received: by mail-ua1-f46.google.com with SMTP id 97so1910304uav.7
 for <linux-riscv@lists.infradead.org>; Fri, 12 Mar 2021 07:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ufGY0BpS1FFe+dVBdNB94a4xu++ZlC5MzGN3kgXpLE=;
 b=GhFpO2qAdbtAV3xzLU2jj2jYMiAlIX3m0m3vaILdX0NrAaIjqhJ7xRENbRCo4C2fp/
 aVJpeeFqT+gW5L0O9RgXpvHJkwXBnhHaac1Hi8Rl9tob8q/I6ZWELBwYmMRpMVU47DOA
 XzkhezFwvao+heZ6c5pQoXO590AafTucvHwZJFGq9yz1jDMkvUecuHnex4CVe1HDjsQz
 5BJ07RzN84nP7qNwZNw1iyoyON8MEFj/mTZ8z2BXpE80spJSfZjzPH9YOhQFeHDWTuiO
 b9sOvOZhoMtE2hqqAqNOtijzlEcdUM05QDDwo3ajz2Tua0t/lWhUFmcBAzYu1bs+MB4S
 WgwQ==
X-Gm-Message-State: AOAM532KukjQIRRPrfZf9X9K4s1wnPbQTOUtPeQ+gPKoCZt7+anOMEDF
 w5SG4rnlSEGmYSTeKuHENhZaNQ6aAMiO8GUDQns=
X-Google-Smtp-Source: ABdhPJxCumYpIHmJF/Vw3mPrBZtFKjQV9FO4fc15rHi2hf+aiIEVAVv0yR+b7rK0YHXckIBF+0u3E8dWXbrbbjQxLo8=
X-Received: by 2002:ab0:30b3:: with SMTP id b19mr8849816uam.58.1615564332725; 
 Fri, 12 Mar 2021 07:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-4-atish.patra@wdc.com>
 <mhng-1400a3dd-651b-4a78-bb2d-1f10580add75@palmerdabbelt-glaptop>
 <CAOnJCU+mCPwbeOQpmHmu3ar_17otmgftiKHLL+Z4_nExpj0=cA@mail.gmail.com>
In-Reply-To: <CAOnJCU+mCPwbeOQpmHmu3ar_17otmgftiKHLL+Z4_nExpj0=cA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Mar 2021 16:52:01 +0100
Message-ID: <CAMuHMdVOzdy9zA8uk0j4OxFWHQqu_jb7uMXRXqmioY+H-TdtkA@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
To: Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <Anup.Patel@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, 
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_155214_086620_B5819A3D 
X-CRM114-Status: GOOD (  35.90  )
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

On Thu, Jan 14, 2021 at 7:34 PM Atish Patra <atishp@atishpatra.org> wrote:
> On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
> > > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> > > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> > > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  arch/riscv/include/asm/cache.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> > > index 9b58b104559e..c9c669ea2fe6 100644
> > > --- a/arch/riscv/include/asm/cache.h
> > > +++ b/arch/riscv/include/asm/cache.h
> > > @@ -7,7 +7,11 @@
> > >  #ifndef _ASM_RISCV_CACHE_H
> > >  #define _ASM_RISCV_CACHE_H
> > >
> > > +#ifdef CONFIG_64BIT
> > >  #define L1_CACHE_SHIFT               6
> > > +#else
> > > +#define L1_CACHE_SHIFT               5
> > > +#endif
> > >
> > >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
> >
> > Should we not instead just
> >
> > #define SMP_CACHE_BYTES L1_CACHE_BYTES
> >
> > like a handful of architectures do?
> >
>
> The generic code already defines it that way in include/linux/cache.h
>
> > The cache size is sort of fake here, as we don't have any non-coherent
> > mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
> > cache lines in RISC-V implementations as software may assume that for
> > performance reasons.  Not really a strong reason, but I'd prefer to just make
> > these match.
> >
>
> If it is documented somewhere in the kernel, we should update that. I
> think SMP_CACHE_BYTES being 64
> actually degrades the performance as there will be a fragmented memory
> blocks with 32 bit bytes gap wherever
> SMP_CACHE_BYTES is used as an alignment requirement.
>
> In addition to that, Geert Uytterhoeven mentioned some panic on vex32
> without this patch.
> I didn't see anything in Qemu though.

FTR, I no longer need this patch on vexriscv.
It seems it just masked an issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
