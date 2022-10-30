Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493E6ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 23:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzyXImOUOlcDUbn9ENn6gQ1EryvO/+w+QNtuNBt2tCw=; b=QGrUGWeMVdwobX
	MZswuq3KhTcWYwLplByg5iTZudSkT2QpgQ+69AcHlhXvWAGsfmi099jdFIJwkMP+9+TP0Z/qKsbk9
	6nQMrtr0IrXy4rQ0jcPmDz2C3wZto63cMG9csQxvgxj0H7oPiJkzE5vPct69VXNraCmnQS/0XgYiS
	08KFAJImd23uyqYG8mGath9895wnL9IIuAcHo3Woo+DpTH23r8/lAAI0R6TCFPAhzmr4K8hnBf4n/
	u/aQBBzhbfqI31uUZ4raVd1SM2t2CWfEJ8gNOfeFGxNX/4oln1tx9484TE6IdiHlLKeqK97VmBRPa
	BOhmpbuBgEYlgAohyZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opHJm-004CSx-5x; Sun, 30 Oct 2022 23:02:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opHJj-004CNw-3q
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 23:02:12 +0000
Received: by mail-ej1-x630.google.com with SMTP id 13so25534039ejn.3
        for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 16:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gaZUGhF8KbynRhDhu/p6JSGKUF6OSpMhoT/g9ZSUcOw=;
        b=iTeijkDcEXUW6ozKNbAJYPxQlGhsrIS0iBQ35RDsGVc96Nazhijx6tq5zNN9OIL3qN
         rXwqAUS+F4C4HfTI+/1D4wW6bzwCzJWUZSyjWUHY6UkvW+NzLvcHMimU6u1H15nAYoyI
         sguHeEmuFmpsn8ErecjlMjbYqGivQqeC96YHpiWlLsBoWFrhuQMR8ofxPex2y8F2p7/Q
         OApPUiS2lcYU3FwuzSurmiOL1aOjgBLba5CIP5CgP3SPFKvJDZZ+xjKUbrk4MvZjjHq0
         mUWS+0jNHr2mrVa9rzIcIbtqzg5JR4dvti7LX5HQN5fUvFXK6n7UW3gD516SF/uqHuLt
         zPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaZUGhF8KbynRhDhu/p6JSGKUF6OSpMhoT/g9ZSUcOw=;
        b=FJsOfZnZmMkr3+PNJhHNFdMK9fvlIMnWlDfy5hN8XaJVKiI1rcF0P6E7xu0fPglmGK
         GOlylaOE+FgqCg7R81x6oO1Xn3G9n5ZwdSpHRE/gtMUt9jN8Gd3UC6SBpZDxetz3pB9d
         elxnH7TKB0MmvkrN7tUFoU8+pGkZaVwCwR7/Y0ra8/d7RgCxm7lnKnXOfqJVXxZW67NR
         1IyMH0u2Bnp3IcD2x9N2dGx9UCbJ6tq3w6QMEAmexXvLKPkzgvvAq3SEQFO4UfXkYrvP
         v2XDgEjBj1BF5gtC3Qft8gMRM0uIAc8cGFdg1FrtY5NVTKrekXFhgfLL+gTymlxfsAuT
         LJjA==
X-Gm-Message-State: ACrzQf3qi8UosdDua6H9HPP1/16iTlON7bX1pyI+itOXTB57f87hIIid
	yk/lWaDPh6Nhq1QmzjNhahzIV8jK0jh1x81MSl8=
X-Google-Smtp-Source: AMsMyM4Le9JGA4FBUg/iu17NYcoAoHjLMPQLet9oDZjaa/2K6RoqdC2Rp8KM7AQQXP3i3RT27yhw/78TcUXP7Cm1xqI=
X-Received: by 2002:a17:907:270b:b0:7ad:ae01:e0d9 with SMTP id
 w11-20020a170907270b00b007adae01e0d9mr9161259ejk.196.1667170926812; Sun, 30
 Oct 2022 16:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y17BWPuEcmY7Bba3@spud> <CA+V-a8uKQ8QvYi5qLC9O=QAQN5CxNB7cOTmw4vk+ndB2R8d3nQ@mail.gmail.com>
 <Y17+pHAg/SBJAEXq@spud>
In-Reply-To: <Y17+pHAg/SBJAEXq@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 30 Oct 2022 23:01:40 +0000
Message-ID: <CA+V-a8t-niCHSWo_CSRSkPS4ND12DAkiwxWxOM1vNn=oBKKd_w@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_160211_199534_6DF93DEE 
X-CRM114-Status: GOOD (  26.99  )
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

On Sun, Oct 30, 2022 at 10:46 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Sun, Oct 30, 2022 at 10:37:01PM +0000, Lad, Prabhakar wrote:
> > Hi Conor,
> >
> > On Sun, Oct 30, 2022 at 6:24 PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Fri, Oct 28, 2022 at 05:59:14PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Hi All,
> > > >
> > > > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > > > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > > > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > > > entry-class social infrastructure gateway control and industrial gateway
> > > > control.
> > > >
> > > > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > > > (R9A07G043) SoC. Below is the list of IP blocks enabled in the initial
> > > > board DTS which can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > > - AX45MP CPU
> > > > - CPG
> > > > - PINCTRL
> > >
> > > Hey,
> > > Looks like you've got a pair of warnings here from dtbs_check. I tested
> > > this on top of 20221028's next, with the three branches below merged in,
> > > hopefully my merges aren't the source of them:
> > >
> > > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: 'interrupt-controller' is a required property
> > >         From schema: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: '#interrupt-cells' is a required property
> > >         From schema: linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > >
> > Thanks for the review and test. The warnings above are coming from [0]
> > as support for IRQC is missing, once that is added the warnings should
> > go away.
>
> Right. I merged in the stuff in Geert's trees & I don't think I saw any
> pending patches in the cover that I missed. Is there something else that
> adds the support that's not going to make v6.2? I got rid of all the
> dtbs_check warnings for v6.1 and I'd really like to keep things that
> way!
>
Sorry that pacth wasn't posted yet so I hadn't mentioned it in the
cover letter. I'll make sure I get it posted asap and merged for v6.2.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
