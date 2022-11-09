Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01490C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unYvDSKJ5yJL4mlanu7Jbu+nhmkS1E3Nn7vTMTx58Gg=; b=J7d1INtDkbcaLn
	ZJCZ9vPZuH+WbGIBv+PkMNdx4pWLJulbuZUnV10O8SLDk9aFNNZzvHK8oyNqzNAWvrCdqOz2a+HwR
	f2FTprYzFNiirjDXYJivDxCeXSZl9rZCbfZ978Rug5V+sqDEjkYIhRz+Q5kdjpA+G4StcsSJ4VUjW
	ffp+Xn5aYAL4HhOdaVWFKQ1dwm2JxoXJz5Sb05chON647Nlm/NmNOVKRBmz9xJAYAE7KHMAsTCSTR
	W8WQ7rWlXeDN3u2p473waz5Kt4QhYISPKjn7B3mrHd+seIWloI+0qbhOy98ieTCC+zgHa8WgCgViG
	RNVkoobE1fxGGEIXObPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osfnl-00BnbB-66; Wed, 09 Nov 2022 07:47:13 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osfni-00BnU5-3Q
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 07:47:12 +0000
Received: by mail-qk1-f169.google.com with SMTP id z17so4171441qki.11
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 23:47:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iy4mDC1gBsOXs8MITh+tDfMo44TwiYSg8FQ+wHggFpo=;
        b=TmyioBjz+SFt5HuXpW+URkzcRw9TrYN3ct9xGbyAF4SczIo/XUlJnvkGlNmlL515z+
         vrcRz3oTARGCc3npf2ARqpFNr/uoOr1QjmE5R3fCvjVmbFLpGXw4f6fXmvVAOEZBLtg7
         sb+3/Jvizp1hNXaB2PTOAxKuRxeU3gXSIk2DooBClmaubSDsOEHdvJLQh/DGYNx6wg79
         CwvEn796bbMsRDXvFlLEQzImOvJ8EjHpS+yznU73pXJ9bEhQlUt27ISXlloDyoPEhNjS
         xbesEbGpX9c0EOe1yycFBOV3FkqLaLwbsY1Hjk0OKGjFCg/R91550I42w5PXyWQiodL0
         nHTg==
X-Gm-Message-State: ACrzQf1mx9ay9h9MlI5phmetJkvQOQYrbSgibIDnx3yYB1/1NGLxe3bJ
	eYZQpw2v8nJrcK+YFJ7TmTgFMKrc6IZjfDde
X-Google-Smtp-Source: AMsMyM5jOV9F7Iw5ZQYtULKI9FPOw6lRxY2HVN7bLECx8BSBMiQ3ivHDJNH2V7w4Exh0OB3Gp+9eAQ==
X-Received: by 2002:a05:620a:bcc:b0:6ce:c077:acf3 with SMTP id s12-20020a05620a0bcc00b006cec077acf3mr41862345qki.263.1667980027003;
        Tue, 08 Nov 2022 23:47:07 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id bq44-20020a05620a46ac00b006f7ee901674sm10650736qkb.2.2022.11.08.23.47.05
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 23:47:06 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id e123so15804608ybh.11
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 23:47:05 -0800 (PST)
X-Received: by 2002:a25:6b07:0:b0:6cd:3a43:bfe5 with SMTP id
 g7-20020a256b07000000b006cd3a43bfe5mr46193922ybc.89.1667980025410; Tue, 08
 Nov 2022 23:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
 <CA+V-a8t5Qah3MNm2m__xnmgK-52=HC9QBPPudnB+1j4-FYJ_NA@mail.gmail.com>
 <CAMuHMdWTJf24XR+KR8yVJOnfpgs-PkUf9b8B=PX9Dd4mfawD5Q@mail.gmail.com>
 <CA+V-a8vCGDHL1SUTEnD-WvoUGKSVL=xzDeQxy77=1vFJdk+fYg@mail.gmail.com>
 <CAMuHMdU=K0o6KHVPUdfEu0tkH8kDMBg-WaRFcYS7r=azWEnfTQ@mail.gmail.com> <CA+V-a8s6Amvb35wRE7pbwXHxwzk8znT8OWsbA9DRpX76E8Uh+w@mail.gmail.com>
In-Reply-To: <CA+V-a8s6Amvb35wRE7pbwXHxwzk8znT8OWsbA9DRpX76E8Uh+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Nov 2022 08:46:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2cQ_9a6HcXzMQPNUoJ78i4y04oAkZ0HnRLzyYq2MsuA@mail.gmail.com>
Message-ID: <CAMuHMdU2cQ_9a6HcXzMQPNUoJ78i4y04oAkZ0HnRLzyYq2MsuA@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_234710_169023_B81E37FF 
X-CRM114-Status: GOOD (  40.59  )
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

On Tue, Nov 8, 2022 at 11:05 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Nov 8, 2022 at 7:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Nov 8, 2022 at 6:23 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Tue, Nov 8, 2022 at 4:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Nov 8, 2022 at 5:07 PM Lad, Prabhakar
> > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > On Tue, Nov 8, 2022 at 3:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > >
> > > > > > > Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> > > > > > > upstream kernel to boot on RZ/Five SMARC EVK board.
> > > > > > >
> > > > > > > Alongside enable SERIAL_SH_SCI config so that the serial driver used by
> > > > > > > RZ/Five SoC is built-in.
> > > > > > >
> > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > ---
> > > > > > > v4 -> v5
> > > > > > > * No change
> > > > > > >
> > > > > > > v3 -> v4
> > > > > > > * Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
> > > > > > >   tags with this change)
> > > > > > > * Used riscv instead of RISC-V in subject line
> > > > > >
> > > > > > Thanks for the update!
> > > > > >
> > > > > > > --- a/arch/riscv/configs/defconfig
> > > > > > > +++ b/arch/riscv/configs/defconfig
> > > > > > > @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > > > > > >  CONFIG_SOC_SIFIVE=y
> > > > > > >  CONFIG_SOC_STARFIVE=y
> > > > > > >  CONFIG_SOC_VIRT=y
> > > > > > > +CONFIG_ARCH_RENESAS=y
> > > > > > > +CONFIG_ARCH_R9A07G043=y
> > > > > >
> > > > > > You forgot to refresh after moving ARCH_RENESAS in v5 of "riscv:
> > > > > > Kconfig.socs: Add ARCH_RENESAS kconfig option", and after relying on
> > > > > > ARCH_R9A07G043 in drivers/soc/renesas/Kconfig.
> > > > > >
> > > > > Sorry I missed your point here, could you please elaborate.
> > > >
> > > > I mean that the options have moved, so you should update
> > > > your patch like this:
> > > >
> > > Ouch got that.
> > >
> > > >     --- a/arch/riscv/configs/defconfig
> > > >     +++ b/arch/riscv/configs/defconfig
> > > >     @@ -26,11 +26,10 @@ CONFIG_EXPERT=y
> > > >      # CONFIG_SYSFS_SYSCALL is not set
> > > >      CONFIG_PROFILING=y
> > > >      CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > > >     +CONFIG_ARCH_RENESAS=y
> > > >      CONFIG_SOC_SIFIVE=y
> > > >      CONFIG_SOC_STARFIVE=y
> > > >      CONFIG_SOC_VIRT=y
> > > >     -CONFIG_ARCH_RENESAS=y
> > > >     -CONFIG_ARCH_R9A07G043=y
> > > >      CONFIG_SMP=y
> > > >      CONFIG_HOTPLUG_CPU=y
> > > >      CONFIG_PM=y
> > > >     @@ -163,6 +159,7 @@ CONFIG_MAILBOX=y
> > > >      CONFIG_RPMSG_CHAR=y
> > > >      CONFIG_RPMSG_CTRL=y
> > > >      CONFIG_RPMSG_VIRTIO=y
> > > >     +CONFIG_ARCH_R9A07G043=y
> > > >      CONFIG_EXT4_FS=y
> > > >      CONFIG_EXT4_FS_POSIX_ACL=y
> > > >      CONFIG_EXT4_FS_SECURITY=y
> > > >
> > > > > > >  CONFIG_SMP=y
> > > > > > >  CONFIG_HOTPLUG_CPU=y
> > > > > > >  CONFIG_PM=y
> > > > > >
> > > > > > PM and GPIOLIB are auto-selected by ARCH_R9A07G043 (through ARCH_RZG2L)
> > > > > > resp. SOC_RENESAS, so they can be dropped.  But it's better to do this
> > > > > > after the release of v6.2-rc1, when all pieces have fallen together.
> > > > > >
> > > > > Are you suggesting dropping it from defconfig?
> > > >
> > > > Yes, but not right now, as that would make it depend on my
> > > > renesas-drivers-for-v6.2 branch to keep them enabled.
> > > >
> ^^^
> > > I was wondering if that's required by other platforms though.
> > > CONFIG_PM was added for VIRT machine and GPIOLIB for HiFive.
> >
> > Does that matter? They would still get it, as long as they use the
> > defconfig.
> >
> Confused, didnt you say about dropping it from defconfig...

Yes, I did, but not right now, only after v6.2-rc1.

  - Once the defconfig has CONFIG_ARCH_R9A07G043=y, ARCH_RZG2L will
    be auto-selected (commit ebd0e06f3063cc2e ("soc: renesas: Identify
    RZ/Five SoC") is already upstream), and CONFIG_PM as well. So there
    is no longer a need for the defconfig to enable it explicitly.
  - Once the defconfig has CONFIG_ARCH_RENESAS=y, SOC_RENESAS will
    be auto-selected, but auto-selecting CONFIG_GPIOLIB depends on commit
    b3acbca3c80e6124 ("soc: renesas: Kconfig: Explicitly select GPIOLIB and
    PINCTRL config under SOC_RENESAS") is only in renesas-drivers-for-v6.2.

Please run "make savedefconfig", and compare the generated defconfig
with arch/riscv/configs/defconfig.

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
