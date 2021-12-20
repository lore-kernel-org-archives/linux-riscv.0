Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF38C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyL18FfGPNgCdRZSoKCMcHHSc+cogMchVLZv6ORNnGY=; b=aob0OROEP3OnA2
	X8sMtngD6NARy5sfYgPMv9yL+9Et1USuXCuxbN8VQu0lTx+BPS+ijMpBcor3AnjFgCVHMSvRYUxa0
	pCa9RDs6Ze6VuXSTTOjumi/bilktxkmnhP0HXgOUe7mFKntmtn0BZzOzQ6jLfGMEZRHryXam0Kc0O
	FFzFiRTBSAHhzg2+pwXu9/yIuJjqLbGcF1a+hV93urU9KVq2SqLzDHlt4uqjNotBT9EnOGEIYP3SK
	tmKKtEsdOGG9PlYrp0Izt3PEcjdIUdHvnj3v2S4M7zv+vj8WDcRo5aYTHVY4rQM1gfiERZ5uYhlXF
	HPsWpMjwTNU8j9hCfCKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzIuY-002Zxk-MC; Mon, 20 Dec 2021 13:41:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzIuW-002ZxH-AE
 for linux-riscv@lists.infradead.org; Mon, 20 Dec 2021 13:41:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1B0661123
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 13:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16397C36AEA
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640007663;
 bh=sEhqYPxM4z19kGZYE2peDh+u0pT/5DH5Q0sa/WgLz2s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oT13uPmkAxGD5Bshuprq6DF7tVZgmsbYCW7m81SlEheTzmKYwN9cteS2Qm0f+yzG6
 FxEZ90zHRkBUkkldie3P2GUorJw1P9OF2hEnTx8f/v+ToJqdVDYWB/RZ1XHjnjfRxL
 fLVSWyLXsF5rXhpcI2KLW7oGXDoL1S/kUska8UuCqrAnXLgCH77Juo+nSxz7bV+YX3
 3WfuXF6l3rrDlcVq5dlYauRBATyJZitLDYYQCif2MaHz6a5dvEw228kOuvYnysWwa9
 APhZ9+umMMMIfdZxyvdYYy+6SLkJwLHrNpa2baLRP4StlCKGzXgQu+j2Qe1Fq0Q/Z8
 2W1x/QxmwJyOQ==
Received: by mail-ua1-f52.google.com with SMTP id a14so17820104uak.0
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 05:41:03 -0800 (PST)
X-Gm-Message-State: AOAM533dNUFu6PEsOf9NkTOj4Ht4gxN1z8BL2OHlBl00e5+AUgzSNbC7
 b/36dwDbwMDmVAzMcTWZARZW1lK2JmjuYjCWTzg=
X-Google-Smtp-Source: ABdhPJwGr/+MFfoW7ipUpJBlTl+ZN+AB5Gr6EIJrZEEcp5Ttg/AYr9iCWiGr8Ukebm4uIUfe9nTB/0FRTqyMvS0jIYU=
X-Received: by 2002:a05:6102:316e:: with SMTP id
 l14mr233250vsm.8.1640007662059; 
 Mon, 20 Dec 2021 05:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
 <20211206104657.433304-13-alexandre.ghiti@canonical.com>
 <CAJF2gTQEHv1dVzv=JNCYSzD8oh6UxYOFRTdBOp-FFeeeOhSJrQ@mail.gmail.com>
 <CAMj1kXHmdDKFozkoAfM-mxsxxfanhVq5HcA1qKTrkp=vAt=Umg@mail.gmail.com>
In-Reply-To: <CAMj1kXHmdDKFozkoAfM-mxsxxfanhVq5HcA1qKTrkp=vAt=Umg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 20 Dec 2021 21:40:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2pDN8vvknmE2s1nj2WSuCfTkXYkU074rCck+CCwQv7Q@mail.gmail.com>
Message-ID: <CAJF2gTR2pDN8vvknmE2s1nj2WSuCfTkXYkU074rCck+CCwQv7Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] riscv: Initialize thread pointer before calling
 C functions
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <Atish.Patra@rivosinc.com>, 
 Christoph Hellwig <hch@lst.de>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, 
 linux-efi <linux-efi@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_054104_467296_A1C45CCB 
X-CRM114-Status: GOOD (  25.74  )
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

On Mon, Dec 20, 2021 at 5:17 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 20 Dec 2021 at 10:11, Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Dec 7, 2021 at 11:55 AM Alexandre Ghiti
> > <alexandre.ghiti@canonical.com> wrote:
> > >
> > > Because of the stack canary feature that reads from the current task
> > > structure the stack canary value, the thread pointer register "tp" must
> > > be set before calling any C function from head.S: by chance, setup_vm
> > Shall we disable -fstack-protector for setup_vm() with __attribute__?
>
> Don't use __attribute__((optimize())) for that: it is known to be
> broken, and documented as debug purposes only in the GCC info pages:
>
> https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html
Oh, thx for the link.

>
>
>
>
> > Actually, we've already init tp later.
> >
> > > and all the functions that it calls does not seem to be part of the
> > > functions where the canary check is done, but in the following commits,
> > > some functions will.
> > >
> > > Fixes: f2c9699f65557a31 ("riscv: Add STACKPROTECTOR supported")
> > > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > > ---
> > >  arch/riscv/kernel/head.S | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > > index c3c0ed559770..86f7ee3d210d 100644
> > > --- a/arch/riscv/kernel/head.S
> > > +++ b/arch/riscv/kernel/head.S
> > > @@ -302,6 +302,7 @@ clear_bss_done:
> > >         REG_S a0, (a2)
> > >
> > >         /* Initialize page tables and relocate to virtual addresses */
> > > +       la tp, init_task
> > >         la sp, init_thread_union + THREAD_SIZE
> > >         XIP_FIXUP_OFFSET sp
> > >  #ifdef CONFIG_BUILTIN_DTB
> > > --
> > > 2.32.0
> > >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
