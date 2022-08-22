Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECE6C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 10:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7uE6u+FnlERecWHQc5BQz+4em/ajjypLzOiUxI7QCA=; b=t9zUhn46LwtWV1
	4qqykVkRrnGB1EIjZceNfj6QKHmTlQSOQUCdZQxc8MA6Reivz9oDNXRBwPKg2AgLgWoyl6qsjBwMS
	cmWI83Bzk7jYj4C7LrPH+sKzqMrDSCIHU5xdWTl1i6ib1zx34xAMkCuNkdeuAJHsO/qGzTcYYvHkk
	wMg+NMaCXd9deK5vQtss8OP7GKKLPj1v/3MO4nCGgoS3m8FMy7rD8CEjzPe7X644Bk5jnbNNwz6Un
	YkWx3jqJimuoN2IR6naQgHBLwP/lZCA+o89YpJgBGPpEaiH0PDSNpxlIEPUAYEzwzIRN9os5fr0y0
	EvNYILIfcTiXBKX4P6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ4wm-007gf0-Ib; Mon, 22 Aug 2022 10:46:20 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ4wj-007gcv-O4
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 10:46:19 +0000
Received: by mail-qt1-f180.google.com with SMTP id a4so7515600qto.10
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 03:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1JBBO1Gon6h+53jLetxo2erRdLEP73QBoztcgKCnoH0=;
        b=ge8ppPK2iksBo7ncZ8EwPFbwtDsoXf4msT1PbFqoXYH/fWiq7z8l3RXFmN6d0tfGSz
         GTFoLCUJVa5SHSY7saio67vq8xZuRSM9nI9bYtjdLC9D/d4ihxfGBtLhbJOZdQ1nbcIx
         gTU6oZ4Ww+hsa7bbln3Apc/jxaFVYa1gib/a428ACVtO0H8G+CakbJeOCjdgW7qqMUu0
         vdee9g1VDWZmHK8RrlwjyYt43dH78kuJYHvjrZCHNkuZmnfcCN0eLq1d9IIvO0SYmY5F
         u/L+xs5gEMhZTuuOeHaqcRlQUoS+aOt986f6ZjBRNrruxoAnnp22SFsvyM9H3dqjjU1p
         JQzw==
X-Gm-Message-State: ACgBeo3qsQPRPukhD6UfVneKhqxOvvuLZUWhytM7I2XANGNPOdhVPBXR
	W6pQxikJhZXKLphOUt2BIXh+aTfaapWRqg==
X-Google-Smtp-Source: AA6agR5Qd6SrTZ2sorBkpkA/mQqjwQ9UitisabBMJ8FY3sDFrNJ0XYxzOhvyx9mzYWgZda86nao8SQ==
X-Received: by 2002:a05:622a:1486:b0:343:6d3f:2fce with SMTP id t6-20020a05622a148600b003436d3f2fcemr14851647qtx.171.1661165175474;
        Mon, 22 Aug 2022 03:46:15 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bs43-20020a05620a472b00b006b9b7879964sm10691859qkb.28.2022.08.22.03.46.15
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 03:46:15 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-334dc616f86so280880807b3.8
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 03:46:15 -0700 (PDT)
X-Received: by 2002:a25:e004:0:b0:695:d8b6:57e7 with SMTP id
 x4-20020a25e004000000b00695d8b657e7mr510074ybg.380.1661165164007; Mon, 22 Aug
 2022 03:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220821113512.2056409-1-mail@conchuod.ie> <CAMuHMdV_dpijX7YqSR+24wWDQr4roi7EBm1nbhJuWkoidAcCng@mail.gmail.com>
 <ac6eacdf-81ad-42ec-3f3e-2db4c5ef76cf@microchip.com>
In-Reply-To: <ac6eacdf-81ad-42ec-3f3e-2db4c5ef76cf@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2022 12:45:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCXOqNjcK1ZrFA3jUtzv+PUqfEr-7PyZNg38-X+SG5Qw@mail.gmail.com>
Message-ID: <CAMuHMdWCXOqNjcK1ZrFA3jUtzv+PUqfEr-7PyZNg38-X+SG5Qw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add an asm-generic cpuinfo_op declaration
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Conor Dooley <mail@conchuod.ie>, Michal Simek <monstr@monstr.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	"David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_034617_803514_B44D9650 
X-CRM114-Status: GOOD (  30.30  )
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

Hi Conor,

On Mon, Aug 22, 2022 at 12:05 PM <Conor.Dooley@microchip.com> wrote:
> On 22/08/2022 10:36, Geert Uytterhoeven wrote:
> > On Sun, Aug 21, 2022 at 1:36 PM Conor Dooley <mail@conchuod.ie> wrote:
> >>   arch/microblaze/include/asm/processor.h | 2 +-
> >>   arch/riscv/include/asm/processor.h      | 1 +
> >>   arch/s390/include/asm/processor.h       | 2 +-
> >>   arch/sh/include/asm/processor.h         | 2 +-
> >>   arch/sparc/include/asm/cpudata.h        | 3 +--
> >>   arch/x86/include/asm/processor.h        | 2 +-
> >>   include/asm-generic/processor.h         | 7 +++++++
> >>   7 files changed, 13 insertions(+), 6 deletions(-)
> >>   create mode 100644 include/asm-generic/processor.h
> >
> > I was a bit surprised not to find fs/proc/cpuinfo.c in the diffstat
> > above. That file already has an external declaration for cpuinfo_op,
> > and uses it rather unconditionally (that is, if CONFIG_PROC_FS=y)
> > on all architectures.
> >
> > So I think you can just move that to include/linux/processor.h, include
> > the latter everywhere, and drop all architecture-specific copies.
>
> This is the sort of thing I was really hoping to hear, so fine by
> me.. When you say "everywhere", I assume you mean in every arch
> and not just the ones listed here that already have it in an arch
> specific header?

Yes, above every user, to silence the sparse "foo was not
declared. Should it be static?" warnings.

Thanks!

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
