Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE68C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 16:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTztwIvt5qu1VoiDemvliqQtX6ezAuSnygJyB0WiOyc=; b=ANH+AInoGwW2Yo
	RppFCUXOOL6iSGY73iuy+hs6Yq/jnG1R9XYADJJv6EUa6rEMfcxaUJX42tphFM94UvwDykx3MrWEH
	W0A1RTYBSx6WujQgddSCyEi/chYdX6ctGlAhvdmQhxgH64Sb/0Hs7rQTYTgtnWGkGPDawRUeqXuOb
	7Iatd82TECYuPEGCdCIozTfDhoweSqs0Kkddip1b8q+OvaHWFAqFfiBeaYlJkI9wnuoC4dfc8U4JE
	IFCadM2cpecHS4YGyk0+ftdqqSGmRFEKrGDyyFz1nx3nxvrzbXoUzWOhsKgR1bVCDBH4p8WbIAq1K
	R7Z+PTAmiYWZTHGNu5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osRDS-006dJI-LN; Tue, 08 Nov 2022 16:12:46 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osRDQ-006dIS-NK
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 16:12:46 +0000
Received: by mail-qk1-f174.google.com with SMTP id f8so9365942qkg.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 08:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgqoDDJ4Y7w9ioCT4WNS5M7fA0vMFFdNn1b0OYSBfYA=;
        b=A9kzFrbLWZag/zRbtUtJRudxf3x17T4duCXO4JttLAd7HbhYasg1sNCP0Nak6pIyro
         Bynun0tovTEirZXhLVm3zdntS5SiyFppyCqBGommw5m+QBagW9/1RcKkTN53zo7HGNff
         YWllXef+d1BeOVhTrpVicffGysrU1tRFLBmJj8qYUWMIF1yFsaHIlxLI2f/ceUig6FZf
         1EIu4MZa2BceRS/4dHpa2qaVDiI1AQJsRcTso5kZBLj+brtA3RrH27iwBis4xzKfQkiX
         5lNsMk2gFR/0o8O4GRZSZFcrEcVhmYje7iZ0fHHdcFbCXOjhziq4KjNRhbPpU6ZMYoFk
         GgLw==
X-Gm-Message-State: ACrzQf3D28Zv6woia0G9/H7Bgj/iR3pUY/kfOxYNDB0INAbH3r56VWxX
	whKV6o/XTxp1zLh71dXtaiFpwL/gc0ToYxfY
X-Google-Smtp-Source: AMsMyM4Axt+413V+0zZjfAP7Rb8iGb+CM+QoERxcfSJxILWVxyqkxS/1esnho90gRRqfQpMjg5ZSww==
X-Received: by 2002:a05:620a:4248:b0:6d2:7f09:50a1 with SMTP id w8-20020a05620a424800b006d27f0950a1mr39268531qko.746.1667923962044;
        Tue, 08 Nov 2022 08:12:42 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 81-20020a370b54000000b006e702033b15sm837857qkl.66.2022.11.08.08.12.40
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 08:12:41 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 63so17924239ybq.4
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 08:12:40 -0800 (PST)
X-Received: by 2002:a25:6b07:0:b0:6cd:3a43:bfe5 with SMTP id
 g7-20020a256b07000000b006cd3a43bfe5mr43205650ybc.89.1667923960599; Tue, 08
 Nov 2022 08:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com> <CA+V-a8t5Qah3MNm2m__xnmgK-52=HC9QBPPudnB+1j4-FYJ_NA@mail.gmail.com>
In-Reply-To: <CA+V-a8t5Qah3MNm2m__xnmgK-52=HC9QBPPudnB+1j4-FYJ_NA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 17:12:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTJf24XR+KR8yVJOnfpgs-PkUf9b8B=PX9Dd4mfawD5Q@mail.gmail.com>
Message-ID: <CAMuHMdWTJf24XR+KR8yVJOnfpgs-PkUf9b8B=PX9Dd4mfawD5Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221108_081244_783159_864E4774 
X-CRM114-Status: GOOD (  33.24  )
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

On Tue, Nov 8, 2022 at 5:07 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Nov 8, 2022 at 3:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> > > upstream kernel to boot on RZ/Five SMARC EVK board.
> > >
> > > Alongside enable SERIAL_SH_SCI config so that the serial driver used by
> > > RZ/Five SoC is built-in.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v4 -> v5
> > > * No change
> > >
> > > v3 -> v4
> > > * Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
> > >   tags with this change)
> > > * Used riscv instead of RISC-V in subject line
> >
> > Thanks for the update!
> >
> > > --- a/arch/riscv/configs/defconfig
> > > +++ b/arch/riscv/configs/defconfig
> > > @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > >  CONFIG_SOC_SIFIVE=y
> > >  CONFIG_SOC_STARFIVE=y
> > >  CONFIG_SOC_VIRT=y
> > > +CONFIG_ARCH_RENESAS=y
> > > +CONFIG_ARCH_R9A07G043=y
> >
> > You forgot to refresh after moving ARCH_RENESAS in v5 of "riscv:
> > Kconfig.socs: Add ARCH_RENESAS kconfig option", and after relying on
> > ARCH_R9A07G043 in drivers/soc/renesas/Kconfig.
> >
> Sorry I missed your point here, could you please elaborate.

I mean that the options have moved, so you should update
your patch like this:

    --- a/arch/riscv/configs/defconfig
    +++ b/arch/riscv/configs/defconfig
    @@ -26,11 +26,10 @@ CONFIG_EXPERT=y
     # CONFIG_SYSFS_SYSCALL is not set
     CONFIG_PROFILING=y
     CONFIG_SOC_MICROCHIP_POLARFIRE=y
    +CONFIG_ARCH_RENESAS=y
     CONFIG_SOC_SIFIVE=y
     CONFIG_SOC_STARFIVE=y
     CONFIG_SOC_VIRT=y
    -CONFIG_ARCH_RENESAS=y
    -CONFIG_ARCH_R9A07G043=y
     CONFIG_SMP=y
     CONFIG_HOTPLUG_CPU=y
     CONFIG_PM=y
    @@ -163,6 +159,7 @@ CONFIG_MAILBOX=y
     CONFIG_RPMSG_CHAR=y
     CONFIG_RPMSG_CTRL=y
     CONFIG_RPMSG_VIRTIO=y
    +CONFIG_ARCH_R9A07G043=y
     CONFIG_EXT4_FS=y
     CONFIG_EXT4_FS_POSIX_ACL=y
     CONFIG_EXT4_FS_SECURITY=y

> > >  CONFIG_SMP=y
> > >  CONFIG_HOTPLUG_CPU=y
> > >  CONFIG_PM=y
> >
> > PM and GPIOLIB are auto-selected by ARCH_R9A07G043 (through ARCH_RZG2L)
> > resp. SOC_RENESAS, so they can be dropped.  But it's better to do this
> > after the release of v6.2-rc1, when all pieces have fallen together.
> >
> Are you suggesting dropping it from defconfig?

Yes, but not right now, as that would make it depend on my
renesas-drivers-for-v6.2 branch to keep them enabled.

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
