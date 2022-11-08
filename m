Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A5CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3QN57vxz3dxTqvgz9gCDxGMVAeqvi04MNlFxhcyps0=; b=Hjf58hFZitz+vz
	63IpFif0vpb+eNyzMcSMsifc8ywGO2nzHyvFQybvsNuIuKzrZg3pgnKZ1Q00nsZ7bSwSX0hn+asoU
	cltLpl1ERl44htvszRiyrJkgo6uyM+/PKaHS9V1GRmcujMvnp1hwpSoN+6mLQE4289DhcRIfWZLpW
	Hx0JBGe8UlNoIomucRP5113wd40G0FNcLP81d3UiYCQjQEUA3m90vBHhAuVdE2sWDZZDJH8lhncCr
	DkpnPVrAbJr0yHyWvwdGfTzW9sFcmm7Q1//H/2Q45GxiuXNAEY0O+LoMNOOBOr4w3d/Di2Xj2u+GQ
	gRsiBf5vYlINTbLv+zjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osU8L-007pLU-57; Tue, 08 Nov 2022 19:19:41 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osU8I-007pFK-2o
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 19:19:39 +0000
Received: by mail-qt1-f173.google.com with SMTP id e15so9237445qts.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 11:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DHetEprijHwJyY7sxsB6FmGPNUrIdgk23YtAJeS+As=;
        b=PVMFAKZZNPJuaYP3s8+QtSmriyeIyHPZw9bwlWZaJVK1cs6ZzRJ1rk0ww8j1D35bEO
         miRK5aLK9/w28KxhU6DCp/SLJIpHhNKoutfRQ6JfLbW/TCRmTfNXVJPiSc882sDWI8Yt
         rfuFNe48jLIT6UqSshJehwy6MbNyBTkr8Jp6K3UvCHkCZhjeY6ePzaXrUaxC7CkWb+mA
         fvr87IlLl25NN/Quo7XVuAyzEZfbPxV15a+NKMQyjVlxOWhLZClkmRZgf6rGAvgVYFVN
         +bd+S/P+l79pfKK7iEy6sRMefOE/e6/z4oQq1l+3hD8Ym7L4GOlDbJ0YMak3j837D7oZ
         P19A==
X-Gm-Message-State: ACrzQf106NIW1nHmjfbhMGOQIKlDDyIRue8/hvHJnvPc25IL883Sm5a/
	EyUgUvBGemuKA+JtKNe6k+EgiC6CFe6BdGn5
X-Google-Smtp-Source: AMsMyM4UXk3YIInWf6KGL6hvfTOrncBXgkQmI0LSBKKObD6WpBlQv8RQc53d4liufbcIEOKXTKW0Pw==
X-Received: by 2002:ac8:5807:0:b0:3a4:f4dc:b316 with SMTP id g7-20020ac85807000000b003a4f4dcb316mr43977147qtg.139.1667935164974;
        Tue, 08 Nov 2022 11:19:24 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id m17-20020ae9e711000000b006ce580c2663sm9577109qka.35.2022.11.08.11.19.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 11:19:23 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id z192so18578398yba.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 11:19:22 -0800 (PST)
X-Received: by 2002:a05:6902:503:b0:6cf:c510:6a23 with SMTP id
 x3-20020a056902050300b006cfc5106a23mr37163786ybs.380.1667935162186; Tue, 08
 Nov 2022 11:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
 <CA+V-a8t5Qah3MNm2m__xnmgK-52=HC9QBPPudnB+1j4-FYJ_NA@mail.gmail.com>
 <CAMuHMdWTJf24XR+KR8yVJOnfpgs-PkUf9b8B=PX9Dd4mfawD5Q@mail.gmail.com> <CA+V-a8vCGDHL1SUTEnD-WvoUGKSVL=xzDeQxy77=1vFJdk+fYg@mail.gmail.com>
In-Reply-To: <CA+V-a8vCGDHL1SUTEnD-WvoUGKSVL=xzDeQxy77=1vFJdk+fYg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 20:19:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=K0o6KHVPUdfEu0tkH8kDMBg-WaRFcYS7r=azWEnfTQ@mail.gmail.com>
Message-ID: <CAMuHMdU=K0o6KHVPUdfEu0tkH8kDMBg-WaRFcYS7r=azWEnfTQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221108_111938_147579_648E6713 
X-CRM114-Status: GOOD (  39.16  )
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

On Tue, Nov 8, 2022 at 6:23 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Nov 8, 2022 at 4:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Nov 8, 2022 at 5:07 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Tue, Nov 8, 2022 at 3:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> > > > > upstream kernel to boot on RZ/Five SMARC EVK board.
> > > > >
> > > > > Alongside enable SERIAL_SH_SCI config so that the serial driver used by
> > > > > RZ/Five SoC is built-in.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > v4 -> v5
> > > > > * No change
> > > > >
> > > > > v3 -> v4
> > > > > * Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
> > > > >   tags with this change)
> > > > > * Used riscv instead of RISC-V in subject line
> > > >
> > > > Thanks for the update!
> > > >
> > > > > --- a/arch/riscv/configs/defconfig
> > > > > +++ b/arch/riscv/configs/defconfig
> > > > > @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > > > >  CONFIG_SOC_SIFIVE=y
> > > > >  CONFIG_SOC_STARFIVE=y
> > > > >  CONFIG_SOC_VIRT=y
> > > > > +CONFIG_ARCH_RENESAS=y
> > > > > +CONFIG_ARCH_R9A07G043=y
> > > >
> > > > You forgot to refresh after moving ARCH_RENESAS in v5 of "riscv:
> > > > Kconfig.socs: Add ARCH_RENESAS kconfig option", and after relying on
> > > > ARCH_R9A07G043 in drivers/soc/renesas/Kconfig.
> > > >
> > > Sorry I missed your point here, could you please elaborate.
> >
> > I mean that the options have moved, so you should update
> > your patch like this:
> >
> Ouch got that.
>
> >     --- a/arch/riscv/configs/defconfig
> >     +++ b/arch/riscv/configs/defconfig
> >     @@ -26,11 +26,10 @@ CONFIG_EXPERT=y
> >      # CONFIG_SYSFS_SYSCALL is not set
> >      CONFIG_PROFILING=y
> >      CONFIG_SOC_MICROCHIP_POLARFIRE=y
> >     +CONFIG_ARCH_RENESAS=y
> >      CONFIG_SOC_SIFIVE=y
> >      CONFIG_SOC_STARFIVE=y
> >      CONFIG_SOC_VIRT=y
> >     -CONFIG_ARCH_RENESAS=y
> >     -CONFIG_ARCH_R9A07G043=y
> >      CONFIG_SMP=y
> >      CONFIG_HOTPLUG_CPU=y
> >      CONFIG_PM=y
> >     @@ -163,6 +159,7 @@ CONFIG_MAILBOX=y
> >      CONFIG_RPMSG_CHAR=y
> >      CONFIG_RPMSG_CTRL=y
> >      CONFIG_RPMSG_VIRTIO=y
> >     +CONFIG_ARCH_R9A07G043=y
> >      CONFIG_EXT4_FS=y
> >      CONFIG_EXT4_FS_POSIX_ACL=y
> >      CONFIG_EXT4_FS_SECURITY=y
> >
> > > > >  CONFIG_SMP=y
> > > > >  CONFIG_HOTPLUG_CPU=y
> > > > >  CONFIG_PM=y
> > > >
> > > > PM and GPIOLIB are auto-selected by ARCH_R9A07G043 (through ARCH_RZG2L)
> > > > resp. SOC_RENESAS, so they can be dropped.  But it's better to do this
> > > > after the release of v6.2-rc1, when all pieces have fallen together.
> > > >
> > > Are you suggesting dropping it from defconfig?
> >
> > Yes, but not right now, as that would make it depend on my
> > renesas-drivers-for-v6.2 branch to keep them enabled.
> >
> I was wondering if that's required by other platforms though.
> CONFIG_PM was added for VIRT machine and GPIOLIB for HiFive.

Does that matter? They would still get it, as long as they use the
defconfig.

If you want to remove unwanted platforms from your configuration,
you do that in the .config file, not in the defconfig file.
If you have CONFIG_PM=y in your .config, it will be retained.

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
