Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F3ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+34DBrj2/aW3nwojG+HCOLyriTbrJCYtcvJQT5Zpezg=; b=t+UZ6tfUEmPCJ1
	zi1OoaMxkb/pmMdCgJpRkQZKARrypkeyBz8VBPiHASKoKNj/x9reepFDEK1vjEpyObRuZa+eEaFL+
	s56C1n1pozwq7MIV26HhQu0w0rvcv+8BnjmruhhChb4Apx6avFHgwtZjCIpYP+Igy1/b24E/OCoTu
	Qm42O6G9/RLtFRNSgEPdPHJlYDVcATTNKZbFtE4OMZLDTDGLR7hwqkF5A2Whtp/3jnCOz4FFQ6A4y
	bqbSov2nOnaywPRpjhoHzfvE7oAGNkPjOm5qfGA5aOK4G5AnYont+ZcTkPPgARWbgPMVkuzRNUjjF
	lETGvL2NsTN69uykAbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeqY-004ihR-IO; Tue, 20 Sep 2022 15:07:38 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeqV-004ieg-Re
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 15:07:37 +0000
Received: by mail-qk1-f176.google.com with SMTP id o7so1790794qkj.10
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 08:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=beo87QLkKwCHQVFvRevjYmIvSu6gsEO9BIku51wSlXE=;
        b=xPnDa3ZFaimyvrOxe6LA+slTD7UKl1TYq5Qk7d42ZWvG1XSDg1Mv7jZ2RWbaukaPcX
         4h5QzpM9+z7oAQ162N7N4x2UsTh8phgG6CDdSlZAN1YGqtoE+qwk2hnFLjUKfVyf++5i
         IlaK45AXtFwdHmoZ5GMWkI5idlC4HWVlwJaCX/FjYfIMJ54XfPCYB0d+wTcXEo6lI94d
         LkTydcXkTolOuArT62FvrgwBSZfpUHrBqIrT6jAE8df3749Ou7biV5At/92tWtNPUgEd
         WinU1xz7Y4RmQmMAxPcKmg0hQaMJ8ISbeeVnKRJHZIMnvzrlMfYWJG9AZdnOSr+4WGSe
         A5Ow==
X-Gm-Message-State: ACrzQf2fOirZ5BWmJmlKbOCmKH4jOk6OKaqmTMkC/PHMEyuw02+ksafl
	o6SasP/TpZfpuKieedu6G548m6f1p6uP6g==
X-Google-Smtp-Source: AMsMyM7DSbFBWeavGdtmDmC4eI5ntcBYAo1XUy7+z8RWgEbOAKL2pevPMMtcuYjl5yORL8XWuPCZfw==
X-Received: by 2002:a05:620a:424f:b0:6b6:7a9d:c5c7 with SMTP id w15-20020a05620a424f00b006b67a9dc5c7mr16407133qko.479.1663686451968;
        Tue, 20 Sep 2022 08:07:31 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id y16-20020ac85250000000b0035badb499c7sm136531qtn.21.2022.09.20.08.07.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:07:31 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3450990b0aeso30169887b3.12
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 08:07:31 -0700 (PDT)
X-Received: by 2002:a81:8d3:0:b0:34d:1215:fb4b with SMTP id
 202-20020a8108d3000000b0034d1215fb4bmr7135561ywi.383.1663686450814; Tue, 20
 Sep 2022 08:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW99EutciosPtOTU9AztfvfMdKTaS+YRmpmS4VnhZ9KAA@mail.gmail.com> <CA+V-a8s9y0Jq4TJk9E_ptsZTW3iCoysaBSrUeQV8qfDFO3wzeQ@mail.gmail.com>
In-Reply-To: <CA+V-a8s9y0Jq4TJk9E_ptsZTW3iCoysaBSrUeQV8qfDFO3wzeQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Sep 2022 16:07:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWy=uU-QQgkz+-sBHfuK9tE-E4LijVLrYX7Efh9=C9vLg@mail.gmail.com>
Message-ID: <CAMuHMdWy=uU-QQgkz+-sBHfuK9tE-E4LijVLrYX7Efh9=C9vLg@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_080735_916735_F5E73332 
X-CRM114-Status: GOOD (  27.14  )
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

Hi Prabhakar,

On Tue, Sep 20, 2022 at 3:05 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Sep 20, 2022 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Sep 15, 2022 at 8:17 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Enable the minimal blocks required for booting the Renesas RZ/Five
> > > SMARC EVK with initramfs.
> > >
> > > Below are the blocks enabled:
> > > - CPG
> > > - CPU0
> > > - DDR (memory regions)
> > > - PINCTRL
> > > - PLIC
> > > - SCIF0
> > >
> > > Note we have deleted the nodes from the DT for which support needs to be
> > > added for RZ/Five SoC and are enabled by RZ/G2UL SMARC EVK SoM/carrier
> > > board DTS/I.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> > > @@ -0,0 +1,42 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +/*
> > > + * Device Tree Source for the RZ/Five SMARC EVK SOM
> > > + *
> > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > + */
> > > +
> > > +#include <arm64/renesas/rzg2ul-smarc-som.dtsi>
> > > +
> > > +/ {
> > > +       aliases {
> > > +               /delete-property/ ethernet0;
> > > +               /delete-property/ ethernet1;
> >
> > OK
> >
> I assume you are OK with dropping the above too?

I did intend to delete these properties (hence the "OK"), as their
presence may confuse U-Boot.

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
