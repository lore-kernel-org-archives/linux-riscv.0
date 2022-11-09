Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3ECC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8+R/NuFPZ4mQbW56ykv3QsiMKDwXhW0reBtjjJe/Mc=; b=pemIAY+t4l7GNb
	OU2ZooDNkd/k6LlH5POqpsVMNZAfNyaXPwuRy8M0pqRE2QU5FgRf1mzScE7gtzffpud6izk2+0QFQ
	a6lCy3FABAdpO3ILzs8p5pvU5OnN1Mv0sDA61U1GWZoQWwEiWEcH4JEhllD8GHY4mUN9MPfbg5duQ
	B1wHcyojMyfx1HHd6kHD37kGrPv9GeWyE0Zo9jZzhVebuLdyEoz2PrHpe+r10WKkOb9p2vp0sUZSA
	Jk6f46aMc1q4n+ebLpSIl1EfiswdzK/sLbR+YT1tMmz9WkZ4/LN9E2JRdA6LrD24CYadSABr13cpk
	YyOVwvC4STEmujjCbObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshCl-00CDjr-3a; Wed, 09 Nov 2022 09:17:07 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshCi-00CDhO-35
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 09:17:05 +0000
Received: by mail-ed1-x52a.google.com with SMTP id l11so26266250edb.4
        for <linux-riscv@lists.infradead.org>; Wed, 09 Nov 2022 01:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I1zyBcnmnvpRBfGlxFnRX4M70p2ogoa1GyrlPIeTzdw=;
        b=BjpEbmaoJDNc4n7cpaEjbJmuPNCYnGUspWa3NzYItOh4f0HPEmBap23DjiEmOFJU5/
         FtMVTOcs7n560e1YQjyBknvvsJRvnyEePjSi738SsGAt/YLOk2msL/Nkn+jdRnNyVGJm
         Dtg81dL29fTK86N0pb2x4ajgntrerHFsZ8To4yFWh0rNFvPmmiO+xpqdaPA3K4jg6rf7
         US2+GV1wgs5vzeO8ha4pU5mkyfspmnIFwkNtsh6ozqaMYQY2xVaIGoJOCohIOn/uAxmp
         snrsOq6O2QjuCRC+epuIkzYlFhYg8kDljK2XCOUt/FeWhBlE2RuVHEOan5P9+HyiG9Hv
         R3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1zyBcnmnvpRBfGlxFnRX4M70p2ogoa1GyrlPIeTzdw=;
        b=Z8UZlUaBn2YbxjWxUHv656xWtS2ndeweJYEZoZdvOEzf3MFdvVhQWu6qkQvyTKWuxj
         FbiOwMFE6of8eIE7fP4rgkG+8jaSQNXpB2qt/P+X3YQoRyIeifmHrdbySwT2rUC7Myv+
         l5C7PqxAeDrMzMap994hldjNcfGJTIvqT4aeEoRdTGqwV8W+G2lotkECFkzqp5t8ba6X
         Z5AgFTV3zvoyRn7z0LxKwOAdeG3DRRWW3jPlqvHNqSknqiC+U8Hwzwvzq0uF1/X3JpTu
         H9T93wGTFScE/7/fSCdmzy3xyJFiwTpZWxeAGBJAZu0WFSy60sKsUph1gQYZkpvQX/qI
         2RVw==
X-Gm-Message-State: ACrzQf22UKUp8jwEKtQVXltKw7Zb1L98jW3Q9ym+nkzkuC2G7zW6JlOw
	hJEYRsVxjtDhF9kYS3vWmfS579gq2O82NeCFNXWjJpc3kH4=
X-Google-Smtp-Source: AMsMyM5JTh8OBKn6CyUVPAMPhk00DiERy1AvRNJugn7Gkoi+/k4oghom5cpUyQ4DeRimiTJAJ9q/O2K34KO8p/0rT6Q=
X-Received: by 2002:a05:6402:1219:b0:462:e788:723f with SMTP id
 c25-20020a056402121900b00462e788723fmr59327500edw.319.1667985421580; Wed, 09
 Nov 2022 01:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
 <CA+V-a8t5Qah3MNm2m__xnmgK-52=HC9QBPPudnB+1j4-FYJ_NA@mail.gmail.com>
 <CAMuHMdWTJf24XR+KR8yVJOnfpgs-PkUf9b8B=PX9Dd4mfawD5Q@mail.gmail.com>
 <CA+V-a8vCGDHL1SUTEnD-WvoUGKSVL=xzDeQxy77=1vFJdk+fYg@mail.gmail.com>
 <CAMuHMdU=K0o6KHVPUdfEu0tkH8kDMBg-WaRFcYS7r=azWEnfTQ@mail.gmail.com>
 <CA+V-a8s6Amvb35wRE7pbwXHxwzk8znT8OWsbA9DRpX76E8Uh+w@mail.gmail.com> <CAMuHMdU2cQ_9a6HcXzMQPNUoJ78i4y04oAkZ0HnRLzyYq2MsuA@mail.gmail.com>
In-Reply-To: <CAMuHMdU2cQ_9a6HcXzMQPNUoJ78i4y04oAkZ0HnRLzyYq2MsuA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 9 Nov 2022 09:16:35 +0000
Message-ID: <CA+V-a8v1HR2vL433ZwKy-pTUeSXuiqp1+yAj1arC=t4SCDQ=vg@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20221109_011704_178466_57AB04A7 
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

Hi Geert,

On Wed, Nov 9, 2022 at 7:48 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 8, 2022 at 11:05 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Tue, Nov 8, 2022 at 7:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Nov 8, 2022 at 6:23 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Tue, Nov 8, 2022 at 4:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Tue, Nov 8, 2022 at 5:07 PM Lad, Prabhakar
> > > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > > On Tue, Nov 8, 2022 at 3:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > > On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > >
> > > > > > > > Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> > > > > > > > upstream kernel to boot on RZ/Five SMARC EVK board.
> > > > > > > >
> > > > > > > > Alongside enable SERIAL_SH_SCI config so that the serial driver used by
> > > > > > > > RZ/Five SoC is built-in.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > > ---
> > > > > > > > v4 -> v5
> > > > > > > > * No change
> > > > > > > >
> > > > > > > > v3 -> v4
> > > > > > > > * Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
> > > > > > > >   tags with this change)
> > > > > > > > * Used riscv instead of RISC-V in subject line
> > > > > > >
> > > > > > > Thanks for the update!
> > > > > > >
> > > > > > > > --- a/arch/riscv/configs/defconfig
> > > > > > > > +++ b/arch/riscv/configs/defconfig
> > > > > > > > @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > > > > > > >  CONFIG_SOC_SIFIVE=y
> > > > > > > >  CONFIG_SOC_STARFIVE=y
> > > > > > > >  CONFIG_SOC_VIRT=y
> > > > > > > > +CONFIG_ARCH_RENESAS=y
> > > > > > > > +CONFIG_ARCH_R9A07G043=y
> > > > > > >
> > > > > > > You forgot to refresh after moving ARCH_RENESAS in v5 of "riscv:
> > > > > > > Kconfig.socs: Add ARCH_RENESAS kconfig option", and after relying on
> > > > > > > ARCH_R9A07G043 in drivers/soc/renesas/Kconfig.
> > > > > > >
> > > > > > Sorry I missed your point here, could you please elaborate.
> > > > >
> > > > > I mean that the options have moved, so you should update
> > > > > your patch like this:
> > > > >
> > > > Ouch got that.
> > > >
> > > > >     --- a/arch/riscv/configs/defconfig
> > > > >     +++ b/arch/riscv/configs/defconfig
> > > > >     @@ -26,11 +26,10 @@ CONFIG_EXPERT=y
> > > > >      # CONFIG_SYSFS_SYSCALL is not set
> > > > >      CONFIG_PROFILING=y
> > > > >      CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > > > >     +CONFIG_ARCH_RENESAS=y
> > > > >      CONFIG_SOC_SIFIVE=y
> > > > >      CONFIG_SOC_STARFIVE=y
> > > > >      CONFIG_SOC_VIRT=y
> > > > >     -CONFIG_ARCH_RENESAS=y
> > > > >     -CONFIG_ARCH_R9A07G043=y
> > > > >      CONFIG_SMP=y
> > > > >      CONFIG_HOTPLUG_CPU=y
> > > > >      CONFIG_PM=y
> > > > >     @@ -163,6 +159,7 @@ CONFIG_MAILBOX=y
> > > > >      CONFIG_RPMSG_CHAR=y
> > > > >      CONFIG_RPMSG_CTRL=y
> > > > >      CONFIG_RPMSG_VIRTIO=y
> > > > >     +CONFIG_ARCH_R9A07G043=y
> > > > >      CONFIG_EXT4_FS=y
> > > > >      CONFIG_EXT4_FS_POSIX_ACL=y
> > > > >      CONFIG_EXT4_FS_SECURITY=y
> > > > >
> > > > > > > >  CONFIG_SMP=y
> > > > > > > >  CONFIG_HOTPLUG_CPU=y
> > > > > > > >  CONFIG_PM=y
> > > > > > >
> > > > > > > PM and GPIOLIB are auto-selected by ARCH_R9A07G043 (through ARCH_RZG2L)
> > > > > > > resp. SOC_RENESAS, so they can be dropped.  But it's better to do this
> > > > > > > after the release of v6.2-rc1, when all pieces have fallen together.
> > > > > > >
> > > > > > Are you suggesting dropping it from defconfig?
> > > > >
> > > > > Yes, but not right now, as that would make it depend on my
> > > > > renesas-drivers-for-v6.2 branch to keep them enabled.
> > > > >
> > ^^^
> > > > I was wondering if that's required by other platforms though.
> > > > CONFIG_PM was added for VIRT machine and GPIOLIB for HiFive.
> > >
> > > Does that matter? They would still get it, as long as they use the
> > > defconfig.
> > >
> > Confused, didnt you say about dropping it from defconfig...
>
> Yes, I did, but not right now, only after v6.2-rc1.
>
>   - Once the defconfig has CONFIG_ARCH_R9A07G043=y, ARCH_RZG2L will
>     be auto-selected (commit ebd0e06f3063cc2e ("soc: renesas: Identify
>     RZ/Five SoC") is already upstream), and CONFIG_PM as well. So there
>     is no longer a need for the defconfig to enable it explicitly.
>   - Once the defconfig has CONFIG_ARCH_RENESAS=y, SOC_RENESAS will
>     be auto-selected, but auto-selecting CONFIG_GPIOLIB depends on commit
>     b3acbca3c80e6124 ("soc: renesas: Kconfig: Explicitly select GPIOLIB and
>     PINCTRL config under SOC_RENESAS") is only in renesas-drivers-for-v6.2.
>
> Please run "make savedefconfig", and compare the generated defconfig
> with arch/riscv/configs/defconfig.
>
Thanks for the detailed explanation, I got you now :)

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
