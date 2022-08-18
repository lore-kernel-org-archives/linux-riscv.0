Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8228DC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIh1mhEOqeRCWM8fq8bDCTE2FHTJmGwvcbUFWLF2JUg=; b=hNH1XjJGgpQSRt
	Hh78uG3uQhOiBA0V/uYxymp781vdrq7AnC+rhfVZK0KGZA3zRJN6wFiEJdDl0B3hXpCOk160GGEKG
	S1ipcdHLl3wS89sWhbdUVwcfoM3oK4o02na9YPekzkG7GKnjL3UHdmZGm1Me+tCXNgkBkqdoCpxAk
	cduVYpbX8mu3R0B2GsFgprPq52CqwAYaXoooxFYIGTD8o9tNrMuYAGMYeFHx059VGV3e7qTdDpBfE
	pbHqCxbnzMmRFkAFHjMsjQ516qyoMhLMjdxW1DY/e2zeXZKA7lEUIH6h8tjjvnb7EX6DiUuWtANF6
	/JgmFYHTlGaDu8WUSdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOk7R-007v18-6r; Thu, 18 Aug 2022 18:19:49 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOk7O-007uw7-LD
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 18:19:47 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3375488624aso34402297b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 11:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=hsfwWpmgExzWlmbZDKLSyuPDLh/uObZ0VNKfsXtXMuw=;
        b=dvhZE5h4dCmIqJy4VGVxeGkNi4ssy0JxthqBuXfA+I1ljmRwFgAB00+bdKrl1CN1u6
         UovJbjpmOUSsZtvFusj6eRbJWHXHWj7M4ihDY22ZSATSHYwapy4A4g35tlnfGuuz/6Ak
         Lx7oS4ourgghCf7qYsg6ob7CpALUl2mXllPL7gcD5Rh3xsyoWd6JCUm0R4Ycf5QaSAPD
         HPxPvu8LtSyBfGBP53gryTRw0nQ3UVuZW5ro9BHs8iJq1xz3V7JOu+9uFSXhJNsX6gsk
         W8f6rDt7Pdrj8f+26pd/G0sOnOhHrbxvGc93tfOE1/xl2U2RG/j1ljzyxEgCzNueSVnu
         3NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hsfwWpmgExzWlmbZDKLSyuPDLh/uObZ0VNKfsXtXMuw=;
        b=4QuF/qfOMMlLrrYRSLRJgaZYjN2YDW9xuQv7zmO4GMWMI3mTR3wcFgefBlPyT0nBi4
         A9Zsa5ahUJSHCcQ8O0addgIrGneOH7g1kwaFva3TJI/K/J31Hgc7y3+Dhf9KwMUukMYR
         4OBMvvs+6qT0QbzOLVtlcYVdkM9oYD615vSs4oY12ciu+ybda0Hf+raAbYoWndKeWgIZ
         jA7q+jTEmTjfafxeLMHkiQIGlNNVJ/XxUBXW3+aHMwqLe9dJPBnj9IfQjJ+ZdZrQ2V2b
         inxXsK3fTcdSU8DndTGAsuemokpggJEDqC7OJgcf0GuhRRFP4GcKsYJLjrKMD4NpY/yS
         zK1w==
X-Gm-Message-State: ACgBeo3unTKBc7XVwjeP+nziKplw9t2ZTfKlYze5cf4U4Hdt0BQRz+mE
	N8xndf6G5FfXudQxvD7WffdCQkowowjuxo7PneQ=
X-Google-Smtp-Source: AA6agR7U/oVpzPHvchwsE54U6r7OKVjyYC6QkwgfBzrzIUX5YaKC8KGeQyILJ2Z8F/pH21bfHWi7erMANy19NPP7t9c=
X-Received: by 2002:a81:6c0f:0:b0:334:c01f:fa10 with SMTP id
 h15-20020a816c0f000000b00334c01ffa10mr4117792ywc.382.1660846785474; Thu, 18
 Aug 2022 11:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW29Q40hypWZ05KRj5cc=DY8XjnDwOPVw3kJPNUrnL0fA@mail.gmail.com>
In-Reply-To: <CAMuHMdW29Q40hypWZ05KRj5cc=DY8XjnDwOPVw3kJPNUrnL0fA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Aug 2022 19:19:18 +0100
Message-ID: <CA+V-a8sVpEx==R6QXF8qxhVSsv2mVnZ_R3N2wTt+JPcQWNqCWQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <Conor.Dooley@microchip.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_111946_729844_9A485A3E 
X-CRM114-Status: GOOD (  23.06  )
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

Thank you for the review.

On Thu, Aug 18, 2022 at 4:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
> > (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
> > of the Renesas drivers depend on this config option.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> The technical part LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif # SOC_CANAAN
> >
> > +config ARCH_RENESAS
>
> We definitely want ARCH_RENESAS, as it serves as a gatekeeper for
> Kconfig options for IP cores found on Renesas ARM and RISC-V SoCs.
>
Agreed, or else we will end up touching too many Kconfig files.

> > +       bool
> > +       select GPIOLIB
> > +       select PINCTRL
> > +       select SOC_BUS
> > +
> > +config SOC_RENESAS_RZFIVE
>
> Do we need this symbol? You could as well make ARCH_RENESAS above
> visible, and defer the actual SoC selection to ARCH_R9A07G043 in
> drivers/soc/renesas/Kconfig[1].
>
I think we could drop it and just defer the actual SoC selection to
ARCH_R9A07G043 as you said.

> I don't know what is the policy on RISC-V. ARM64 has a "single-symbol
> in arch/arm64/Kconfig.platforms"-policy, so we handle SoC selection
> in drivers/soc/renesas/Kconfig, and that is fine, as it avoids merge
> conflicts.
>
Agreed.

@Conor - Does the above sound OK?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
