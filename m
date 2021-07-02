Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87948C07E95
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 19:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3395861411
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 19:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3395861411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nN6Qoe97/H3JwUxMsSUY0PWk0ZjkAYajTVwccFHXBY=; b=XWponUKn0NYQqj
	+h/Sdfm3bML5hP8k2ZTDI+jBkIV14oc8K6UNwTQx4Whwqo/xeYqpYRZ6/dj3ZZWmtPKoxftm74XW+
	K2xOhUrldRz9GcFXJSxu6E3VVu3//7q76nJU62zpu6vgF0RCiZvrc0/DyJMfkHfWMwkDhntIV5atq
	HMlbEMndzcQLKoQOFYVF7vF0cw1qVkCJKS+eMxVbUv+ddacBtrHU9dbuPmJDcv/z7n+8+0gXrM6Z1
	fjXtlcq08h8Rb6i4mpnVq7bTshBUPGqF3e9yZ1BrQwIF77DJDPpVBtS67NkkgUBIn0ku4zXEhwC+y
	B2hiG1Go1BUltq8pmzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzOZs-003r87-DO; Fri, 02 Jul 2021 19:11:52 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzOZY-003r79-JA
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 19:11:34 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id p15so17950486ybe.6
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 12:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNe0CZD49Y6HeTR2zvAdV2swVmjxw8HGAOl4RmeBDHE=;
 b=OOVuX5kUkOlD/17Ow3pMt/Tn89olUzx+mZzFNrRE4ecm1Jj02CZuYiUFeZr0lWOjWz
 xvpR/25J+giT5ahz7BrHpktRPhIefWfoJLpypEkWWgiZudgt5ffrOhODpUYXBmNgX1uK
 nME76vrEPtrO4pBugfe6fpIZRc9NP2F0trgYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNe0CZD49Y6HeTR2zvAdV2swVmjxw8HGAOl4RmeBDHE=;
 b=Pmq/etLMMrks0fBqmFlC6ArVGHF9bkBtO5kjBK7sQCCQe0fWt6IbeO0ebcMEGZLnTG
 lgwwAL52QyzUEDXYlsvNGXHyHDyHZtO51O4gciIj9lrQr+oZ1mwXoUVM3JO+Ld8sfeZj
 FXkpAAkFNgHYkc4IP1Vt6+zGxdLt7txiAIRSoL2AyG6ZidEGYUfXIi2IEDLg1AsHCEvW
 x51p4uk8qw/tSkD+7mn2/UFAla59UC2YmD1VJ/O6jOrZ1+znxyP8OmFyMdSQqv6krH1o
 JnAmAQIz+gJkqJqewe01coMOScZ7At9cvASZ3uvgEx8UbP+V5BSnAlHakaHNwWRE2C+F
 dzAg==
X-Gm-Message-State: AOAM532KexFZU+4GsxbDxK249+SUKAdI/69Loc3cSPijaVD0jHzsQccj
 k0jhJKkFegIQJTsxpCNbod+9e4mQwALVLvOQ59Wb
X-Google-Smtp-Source: ABdhPJzqkbkxM1MEMKQQBXENZX/GSVyjLhXai8633EMbMtXXh8Efubsw76BaSmLC7bBeenfpRwhH1lqLwnbb+jznUVk=
X-Received: by 2002:a25:b3c3:: with SMTP id x3mr1106992ybf.147.1625253088549; 
 Fri, 02 Jul 2021 12:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210629134018.62859-1-xypron.glpk@gmx.de>
 <CAOnJCUKuHGUZi-13PpnZGHKkXxhj3asVJgaNMTv3=830eVwi=g@mail.gmail.com>
 <CAMj1kXG-O5PLnEWGWXzYf2r471ng7j-jZ2ziTwLdSgdVFdJNaA@mail.gmail.com>
In-Reply-To: <CAMj1kXG-O5PLnEWGWXzYf2r471ng7j-jZ2ziTwLdSgdVFdJNaA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 2 Jul 2021 12:11:17 -0700
Message-ID: <CAOnJCUK3fiNBfRaWpFBzqe3oy3Sb7-_fVC5CP0ynz_4Qscv8VA@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: load initrd wherever it fits into memory
To: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Andreas Schwab <schwab@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, linux-efi <linux-efi@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_121132_680043_DA664956 
X-CRM114-Status: GOOD (  21.30  )
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

On Wed, Jun 30, 2021 at 12:30 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 30 Jun 2021 at 00:56, Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Tue, Jun 29, 2021 at 6:40 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > >
> > > Requiring that initrd is loaded below RAM start + 256 MiB led to failure
> > > to boot SUSE Linux with GRUB on QEMU, cf.
> > > https://lists.gnu.org/archive/html/grub-devel/2021-06/msg00037.html
> > >
> > > Remove the constraint.
> > >
> > > Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> > > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > > ---
> > >  arch/riscv/include/asm/efi.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
> > > index 7542282f1141..649ab513dc99 100644
> > > --- a/arch/riscv/include/asm/efi.h
> > > +++ b/arch/riscv/include/asm/efi.h
> > > @@ -33,10 +33,10 @@ static inline unsigned long efi_get_max_fdt_addr(unsigned long image_addr)
> > >
> > >  #define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)
> > >
> > > -/* Load initrd at enough distance from DRAM start */
> > > +/* Load initrd anywhere in system RAM */

Alex/Anup/Palmer:

As per my understanding initrd can be loaded in system RAM as long as
it doesn't overwrite the existing data (fdt/kernel image)
and respect reserved memory regions.

Let us know if we have any inherent memory location limitation for
initrd loading.


> > >  static inline unsigned long efi_get_max_initrd_addr(unsigned long image_addr)
> > >  {
> > > -       return image_addr + SZ_256M;
> > > +       return ULONG_MAX;
> > >  }
> > >
> > >  #define alloc_screen_info(x...)                (&screen_info)
> > > --
> > > 2.30.2
> > >
> >
> > LGTM
> >
> > Reviewed-by: Atish Patra <atish.patra@wdc.com>
> >
>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
>
> Please take this via the RISC-V tree.



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
