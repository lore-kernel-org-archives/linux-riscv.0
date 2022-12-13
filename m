Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D314BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVCoxhygMyjZhRubgEIl2WIYicNHw97ihKjq6ZubsBo=; b=IPu734/F10La3x
	+8aaJiZsJR4Pe50rZJv4XPzZUArr60OeXw0qvhOiKdm1keLyHjq5iDZIedLDY+vSHKcNQ/0IYGEBr
	v12nHUbNVekIgxXXbXhX0/m/+hN2b0Cwu1RWXbJO9AfniDnGh/VsuBpbTHYosLUd9G1RBqnXhL483
	uche5i3Jwoch7Pe/45dD8u7hkArF/QDymRBYJUil4GfUYAKhV0z6GxnfiK+GQpSLj7FLsw3+8wjBF
	27Nzlgs4Dqd3SdPW9JVrSMX/AmXtXo1iaD02zGiTqeYa6l01tGTIR5pAYcdSzvPRiZk/O7GPfwW6B
	MF4bCSJ0nSL1dFyVTJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p509y-00DndO-V7; Tue, 13 Dec 2022 07:57:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p509v-00DnbZ-OT
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 07:57:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h12so14702311wrv.10
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 23:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6o0GeZJe7zgU/rQbNGO95bs2olhPXjHiwqfmfQC5R7A=;
        b=YjfllNNB32j4iHz3ehIUDe2K11iAW5NST8YgvWTvel7Ca2tyyrir/QmG3MBaAaF8Dw
         6BGujKvE2jVDfZlXrdKxkY1DRG6uRQwJSR99PkVDPktwI2r+5bEmOEZPkvtqqzX/y/Km
         7bLiFwkST1oDvgcEnyAgZyE3M8xj5oW0SNuWcmUJj87Klox8NRsl+ZfGlF5W2CqUc7tJ
         EjSzNEMA5iTQV3Y10avb0/4Tny9UNW47ZK3PXY06g0DqHjCKbvM8+MqmfV6L2MW6KLcF
         aeTyYXtRmfe1TbZRulomxOZ/4pitudsf5inLeOTbJmc6DWxXN3mHC27OLG/nq4x32j0t
         3UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6o0GeZJe7zgU/rQbNGO95bs2olhPXjHiwqfmfQC5R7A=;
        b=zGzUG94WnTF3co2jMl2K4FPNiQioVewmhmFyHe54veD3y7FE6AlN/dOTacTs/qpq5Q
         KGKS3WGeg5v5acoucrbBbtAJrXUEX4gww1OM+VDffRir16+vWUnJnaTBX4CkaUOHAh4T
         I8/O8dHnSjHw448Jl1hz0SCGzV+bWXTYEE3ZdMq7o1pXxwDzgX3zc8wlYyA600PjG+R7
         QqscwDAO67MfZ2bFbGg8mPo/HWDj6eVX/LJv6Kb32ohkbEoibAEUAqUE5Z+XWK489fCU
         6HodmrwOIFVM2Gr/pHU5ojA1OIK48na2MQF5ASxKA7DF4l48shBEnbRgTu5PyI/FOJDC
         GR2Q==
X-Gm-Message-State: ANoB5pnz7MB+wUzqKk/KdKYisGCHGVZjy7GRYhDnVHs8AaJtlMgZy4ZB
	DTldu7doAdsIug/Pt2ZRBKWVJkVpDVKtfO5ua8i+EJkHYrpvML+o
X-Google-Smtp-Source: AA0mqf5CAW19crv/THSl7pw+ACF9HjBX2ntNgiivqTeLEk1s3kIsOF+Zmw7LKwen32ZAnBWYGYgoNLW+m979aqJdBe0=
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id
 h13-20020a5d504d000000b00242246c2f89mr24102419wrt.108.1670918219475; Mon, 12
 Dec 2022 23:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20221212143102.175065-1-alexghiti@rivosinc.com> <CAL_JsqJz4uf+956oC4BfZGdjb+rfAZqduexLw3=D5HHjtyBC+g@mail.gmail.com>
In-Reply-To: <CAL_JsqJz4uf+956oC4BfZGdjb+rfAZqduexLw3=D5HHjtyBC+g@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 13 Dec 2022 08:56:48 +0100
Message-ID: <CAHVXubgu_Voet_TPB0z+yec4DG8TP2_nSTDUcQdW2yf20wvP1w@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Rob Herring <robh+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_235704_039161_74B4391E 
X-CRM114-Status: GOOD (  36.26  )
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

Hi Rob,


On Mon, Dec 12, 2022 at 6:54 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Dec 12, 2022 at 8:31 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >
> > During the early page table creation, we used to set the mapping for
> > PAGE_OFFSET to the kernel load address: but the kernel load address is
> > always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> > pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> > PAGE_OFFSET is).
> >
> > But actually we don't have to establish this mapping (ie set va_pa_offset)
> > that early in the boot process because:
> >
> > - first, setup_vm installs a temporary kernel mapping and among other
> >   things, discovers the system memory,
> > - then, setup_vm_final creates the final kernel mapping and takes
> >   advantage of the discovered system memory to create the linear
> >   mapping.
> >
> > During the first phase, we don't know the start of the system memory and
> > then until the second phase is finished, we can't use the linear mapping at
> > all and phys_to_virt/virt_to_phys translations must not be used because it
> > would result in a different translation from the 'real' one once the final
> > mapping is installed.
> >
> > So here we simply delay the initialization of va_pa_offset to after the
> > system memory discovery. But to make sure noone uses the linear mapping
> > before, we add some guard in the DEBUG_VIRTUAL config.
> >
> > Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> > in a better TLB utilization.
> >
> > Note that we rely on the firmware to protect itself using PMP.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >
> > v2:
> > - Add a comment on why RISCV64 does not need to set initrd_start/end that
> >   early in the boot process, as asked by Rob
> >
> > Note that this patch is rebased on top of:
> > [PATCH v1 1/1] riscv: mm: call best_map_size many times during linear-mapping
> >
> >  arch/riscv/include/asm/page.h | 16 ++++++++++++++++
> >  arch/riscv/mm/init.c          | 25 +++++++++++++++++++------
> >  arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
> >  drivers/of/fdt.c              |  7 ++++++-
> >  4 files changed, 57 insertions(+), 7 deletions(-)
>
> [...]
>
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 7b571a631639..012554445054 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -895,8 +895,13 @@ static void __early_init_dt_declare_initrd(unsigned long start,
> >          * enabled since __va() is called too early. ARM64 does make use
> >          * of phys_initrd_start/phys_initrd_size so we can skip this
> >          * conversion.
> > +        * On RISCV64, the usage of __va() before the linear mapping exists
> > +        * is wrong and RISCV64 rightly calls reserve_initrd_mem after it is
> > +        * available where it actually resets the translation that is done
> > +        * here and re-computes it.
>
> No, I want a single comment that covers both cases (and the next arch
> we add here). Something like this:
>
> __va() is not yet available this early on some platforms. In that
> case, the platform uses phys_initrd_start/phys_initrd_size instead and
> does the VA conversion itself.


I have just sent the v3, thanks for your reviews,

Alex

>
>
> Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
