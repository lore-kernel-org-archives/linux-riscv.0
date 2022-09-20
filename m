Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66E9ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMGwSDTU0PzoGKntyLE+jwUlmWtdPJJ3SGvNgztmERE=; b=4izGVCO+xSuZMV
	mmxN2/VUrR7Cap5wWwCpOd9MCyhatszJ4HxiHCLBMQmFr5jtVi6pWbjVKadPXWELtVRNuePeLMkNZ
	Eb1Q6rri53wnz6vNgfGo2RPVV7pS9vvuQ3zVAM1JASBp5UkysOqHQf3ytuNusRH1kIeIQO6DrcBcY
	pH6uaPJ7uo8XZSmDucxxLjxuUUvU+ozJjjrI+Q+fK3PsZW2IDap8fU859z4D3Vbndf6Y+b328z4P8
	c5NAFYBBLPMnQr258c8hCjUWXkEHxNzyK/o0Yq0tYVNgadYBhzlYUejkO1JkH7GeihkcZbApen6xv
	L2pKc3/dh88bKFjqdmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafkl-0054Bj-P8; Tue, 20 Sep 2022 16:05:43 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafkj-00549u-IE
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 16:05:42 +0000
Received: by mail-ej1-x62b.google.com with SMTP id y3so7377939ejc.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Eoj+9YVS7ZbvdHxGcn08+V7ecurW5KQvPgCOMjMH010=;
        b=kjU9hV8Jl2mKbVH0atog7MEskvKVMD9stVp5tTaogMS7eA8whFWkcxzC+ndpdlRoSz
         cWOcC81rhxeIZlNl+1hokFH0dloCkV8m3p9yuNQ/ntyMPQER7kSoOamT1FdxqAIJu8D3
         mxnuecSURZO7Dcyysr9OiVWReIXxdHGAY5YE699JnvYLJts5wLhTrSgioCIFZEELwkYv
         q9l9TB8snGKAlRqCq7IpvZqxL40MeP+aGrBDEZuI7lrj/RSsupPYZg6YgzLXxB+IufbA
         6AZmL+8kM/E1FVR61Agrk3g28pwSc4vsAGB0BpvOf1cs5WUPsR7yYRJeskbsuZesVTcF
         /rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Eoj+9YVS7ZbvdHxGcn08+V7ecurW5KQvPgCOMjMH010=;
        b=4atKgYi7IDlkDOOS/DPILNjgVBnj4fyauGRN2iPla9P1Gk6biLsebZdwN/KfOiFRCu
         lt1hPrXF/ht8RniByHKClU+YLnCRYVPWHdgaKfMvAL8XlsgmxQlv4vQ2NxGoZuOCOtkJ
         rgPQeNGbUJ7TEZQSs9trLYufqt0h2zpznZcqf38ZiRfzq9a+JIIl9sYZds5Jnz1iiUQS
         mnns8gYCKw+MlUbrwxgn+U8uyzh+es69MNXf+jL4x62NCsjwzivnOsYVri0H6DRPZiz0
         F/6Ogr66aF0FD9k9d0vB0KvUxZAPb+NPMPiL9NGRPLDjYVvmKRNCogfuF0dWlAQBlnJT
         dqEg==
X-Gm-Message-State: ACrzQf0duQkNE074s4e+HvPVN9anQg+/9qrKq+qH4fXo6gnuEDmp8S64
	cNXTGDPoMlBrLVjTFWeE5PnTCp4e5SXpCgho9U4=
X-Google-Smtp-Source: AMsMyM48vhimTOMy7qPE4/TDwKwjy1/XnY2/SRfe6v6ZGuZqQeW9NiA4wGt5KXErXoSujh/QByRFk32JRBhed8tP15k=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr17227555ejb.80.1663689939190; Tue, 20
 Sep 2022 09:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW99EutciosPtOTU9AztfvfMdKTaS+YRmpmS4VnhZ9KAA@mail.gmail.com>
 <CA+V-a8s9y0Jq4TJk9E_ptsZTW3iCoysaBSrUeQV8qfDFO3wzeQ@mail.gmail.com> <CAMuHMdWy=uU-QQgkz+-sBHfuK9tE-E4LijVLrYX7Efh9=C9vLg@mail.gmail.com>
In-Reply-To: <CAMuHMdWy=uU-QQgkz+-sBHfuK9tE-E4LijVLrYX7Efh9=C9vLg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 20 Sep 2022 17:05:12 +0100
Message-ID: <CA+V-a8uQ1XOq4v+nmoxOKk=K5tmahXeAttvE8BdbMBoU8GHr-A@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20220920_090541_622114_C5BFF5BF 
X-CRM114-Status: GOOD (  20.61  )
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

Hi Geert,

On Tue, Sep 20, 2022 at 4:07 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Sep 20, 2022 at 3:05 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Tue, Sep 20, 2022 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Sep 15, 2022 at 8:17 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Enable the minimal blocks required for booting the Renesas RZ/Five
> > > > SMARC EVK with initramfs.
> > > >
> > > > Below are the blocks enabled:
> > > > - CPG
> > > > - CPU0
> > > > - DDR (memory regions)
> > > > - PINCTRL
> > > > - PLIC
> > > > - SCIF0
> > > >
> > > > Note we have deleted the nodes from the DT for which support needs to be
> > > > added for RZ/Five SoC and are enabled by RZ/G2UL SMARC EVK SoM/carrier
> > > > board DTS/I.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > > > --- /dev/null
> > > > +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> > > > @@ -0,0 +1,42 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +/*
> > > > + * Device Tree Source for the RZ/Five SMARC EVK SOM
> > > > + *
> > > > + * Copyright (C) 2022 Renesas Electronics Corp.
> > > > + */
> > > > +
> > > > +#include <arm64/renesas/rzg2ul-smarc-som.dtsi>
> > > > +
> > > > +/ {
> > > > +       aliases {
> > > > +               /delete-property/ ethernet0;
> > > > +               /delete-property/ ethernet1;
> > >
> > > OK
> > >
> > I assume you are OK with dropping the above too?
>
> I did intend to delete these properties (hence the "OK"), as their
> presence may confuse U-Boot.
>
Thank you for the clarification.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
