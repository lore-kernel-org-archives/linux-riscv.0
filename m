Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E44BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmXcU42Y9J4JYr7LrsXuWks78jAzJXnCIsktYVNevoE=; b=j4UgXd/37J7BYi
	riDy4oGERwzbuYLgMj6Czvv9ULqwyWN+feGpOE2rSxiEJrSiJZkWFE2vWZrD1bKBqggWA2pheMd5k
	DpYf11g23d04zIRCDWsBsG0gGsMixCMSZl8lFU+bKCI78OIqr5em+f3n2HbA7O/5yz84JN/Cy02jx
	c4kLH0+1Pus/qvwGe3gzCT/xS+TESdqGZErF7O7YlztrXtFUivCkl83sbgV4tiisZoWb+V3Z9mKbq
	QSq9A4WhSylYvxzehsE2AYj/jnchE68vSSI6ckrwt6Rdfc6nZI62YNBXLfM8KeHbhnlg8WNr8qY5z
	WDJKIEfi7pc0kUck0Rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzEnb-001NNw-Ry; Mon, 20 Dec 2021 09:17:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzEnX-001NMe-KC
 for linux-riscv@lists.infradead.org; Mon, 20 Dec 2021 09:17:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1804560EFF
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 09:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6C8C36AEA
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639991853;
 bh=4+z4MVcPf/vwKLP5WpH1FLTAs/YDepAbppw8qxij2dk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RORZ8FOw5XgCfTedf8Vy4x/Kl7XUma5ObTwalOH2cpItN6PusnsjAaknMoFb9TDJy
 Vn5HSAelSIcanbH9Z6LicVbjMkXhurbYiqRngLzWVpI/+VSU61pEtjwBO71Rjs/nAR
 /bnrwbg8l/6JHKBqbP/eov9VvGYmwwazgRY2h8GI8XJ19FbNP4MhaBoBfZH+TOrtWa
 n1vldrkZQL3PW2zxAV4xWDJh06uQHgnnkUY0HS/V24mZNsvpTT55bujoSNt25Kqqfn
 ceiu+JZ1RXYw23uIYkXwX9vLzsTf21ndZn0hkkMPkNntjcNVqIPvZTsH1S5WfLqVDz
 InAVWDfCognMA==
Received: by mail-wm1-f42.google.com with SMTP id z206so6416174wmc.1
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 01:17:33 -0800 (PST)
X-Gm-Message-State: AOAM532NY6FSGT+GGNNFNjhj11DqDPyhptGL6MqkhFDSVv1DO+RDwIfv
 VxfF107Tvf0vMf+K+yhgLz3kAoq6NXAUJlUVjxE=
X-Google-Smtp-Source: ABdhPJx5h88IXQvYmswzOZH9pshCavecGzDNWpi0p2Dn/d/bkKU5f+wXghRuyty1pglHInCAdE5taSAXaJWtpT1dxOs=
X-Received: by 2002:a1c:1f93:: with SMTP id f141mr4145000wmf.56.1639991851853; 
 Mon, 20 Dec 2021 01:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
 <20211206104657.433304-13-alexandre.ghiti@canonical.com>
 <CAJF2gTQEHv1dVzv=JNCYSzD8oh6UxYOFRTdBOp-FFeeeOhSJrQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQEHv1dVzv=JNCYSzD8oh6UxYOFRTdBOp-FFeeeOhSJrQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 20 Dec 2021 10:17:20 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHmdDKFozkoAfM-mxsxxfanhVq5HcA1qKTrkp=vAt=Umg@mail.gmail.com>
Message-ID: <CAMj1kXHmdDKFozkoAfM-mxsxxfanhVq5HcA1qKTrkp=vAt=Umg@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] riscv: Initialize thread pointer before calling
 C functions
To: Guo Ren <guoren@kernel.org>
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
X-CRM114-CacheID: sfid-20211220_011735_767500_EE351D6E 
X-CRM114-Status: GOOD (  23.20  )
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

On Mon, 20 Dec 2021 at 10:11, Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Dec 7, 2021 at 11:55 AM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > Because of the stack canary feature that reads from the current task
> > structure the stack canary value, the thread pointer register "tp" must
> > be set before calling any C function from head.S: by chance, setup_vm
> Shall we disable -fstack-protector for setup_vm() with __attribute__?

Don't use __attribute__((optimize())) for that: it is known to be
broken, and documented as debug purposes only in the GCC info pages:

https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html




> Actually, we've already init tp later.
>
> > and all the functions that it calls does not seem to be part of the
> > functions where the canary check is done, but in the following commits,
> > some functions will.
> >
> > Fixes: f2c9699f65557a31 ("riscv: Add STACKPROTECTOR supported")
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > ---
> >  arch/riscv/kernel/head.S | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index c3c0ed559770..86f7ee3d210d 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -302,6 +302,7 @@ clear_bss_done:
> >         REG_S a0, (a2)
> >
> >         /* Initialize page tables and relocate to virtual addresses */
> > +       la tp, init_task
> >         la sp, init_thread_union + THREAD_SIZE
> >         XIP_FIXUP_OFFSET sp
> >  #ifdef CONFIG_BUILTIN_DTB
> > --
> > 2.32.0
> >
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
