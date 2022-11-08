Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93546C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Tv2ZtRHAg2CT+bo6cX6LjDnbTSsQGHbSWYCNayh92E=; b=HOKI53gwy9QFE2
	6X/M7Fn8Ve57xR+ynV7vp/0lPGtFeRjC1Jl8lFLoB1nYCQ4RAxSKmIF8rr7gL4b8VOddPwgqm08KV
	v8p5uqcPIQn3WN6OEDtGc4+tDiEentJVZ/d4zZS4PMP0CGLtMsMj089Td6TCXb2URLfI4GST/TVTA
	ElBwc2BI97DFDEjguRHdlFZd8Ixcil23tYW7vwMJ2XaB15T2KNpMJZV8ecAIVvaiYu4Yhbvise1uB
	hQPjZfIWeWOggDX1ScKpHIz+068IEKD0AWynIEn3iW8F80hW9/cxBP6WBPwN20esPeqdRfxbIXfNw
	MNV0+XRpeKFWuHLLxyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR88-006cHI-9n; Tue, 08 Nov 2022 16:07:16 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR86-006cGI-DG
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 16:07:15 +0000
Received: by mail-ed1-x52f.google.com with SMTP id i21so23192873edj.10
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 08:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HeqeWmFL1Z0YyXQkc6bAsrYfc1kxzO18e0BuN70nwS0=;
        b=BYSjtEhYQvz8W18ioR+5oUc5WcfvJqkhcFwf0Bi0xYQjaGN4yQq66dRX839UXAe0Wb
         L0pr7etlHmJAcRe5g2vjDiRF1teXr21LJGMSQMJEaHKjSDeOfmdyaWNbQFwE5AI1lLCb
         s4ZMxVpCZpwY8zelV5ujdk51OI+FGqPM9mcbWLOuk7RW76Frieg6rPqlGEPKhfEa4MkA
         /Ul1AnBBgrDGF610joipV2Jwgy+0U2k+surnHRAIdcQKKC6Z7b4N2PPIkrrKs5yn8euQ
         cKdYdIiNPvpOjBsvid9mc9xak6BbTgDgGCXjbEkTa4+eP2w6BA9lUkS+BrL69g4Wexf8
         CZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeqeWmFL1Z0YyXQkc6bAsrYfc1kxzO18e0BuN70nwS0=;
        b=Pifiufz3MmBAexr9tY24jDDcOe6VlxkMnYPNPFQwyjmlCLlu6mAgFp4pNQH82t+IBO
         bqJD6sWDMNuovC5zoWeDSRTdCO2aLhgKO2Vx63Hsg3SvXBumnT9MI2hM6Gv4a/4IW8kE
         FVdf8Vi09rfL+ylyfv9DI+t+HF+jiXcvGxyHWDudKvOEj4wxYaGMePrzBxZDB4MP/8Zq
         9CyrJqqzwapUC1oOwR1RXLX58S8ezJPMioTjoHMwfoE9AeDqij2goP2lEIX4mRRbHRVO
         FwAwvkwmmfSgSD/pbARzxQtEfX12MPdDyLDpOhW40x29B+Y2lPe0LhOoLbGQEB4Tox91
         Bp/w==
X-Gm-Message-State: ACrzQf0wJCc9zA1l/06i3e+da2QZuaZhT+S0WA1IQK4nBWYe7ZoRFVlC
	i2E3g/uDwBA3iwGyw9wP8Lmp3CCq6kcop/60TkY=
X-Google-Smtp-Source: AMsMyM5NzRSSLqSZ7oDkKz/XS4UKz2Nax3sDL4blJ/Li1UlnSK9ag8+QiFSjollPQ2mvGUHtrlY60V5citWqe87J1jw=
X-Received: by 2002:a05:6402:3217:b0:461:d6d7:7f19 with SMTP id
 g23-20020a056402321700b00461d6d77f19mr35135661eda.109.1667923631350; Tue, 08
 Nov 2022 08:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Nov 2022 16:06:44 +0000
Message-ID: <CA+V-a8t5Qah3MNm2m__xnmgK-52=HC9QBPPudnB+1j4-FYJ_NA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221108_080714_472361_0C80DB68 
X-CRM114-Status: GOOD (  20.94  )
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

On Tue, Nov 8, 2022 at 3:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> > upstream kernel to boot on RZ/Five SMARC EVK board.
> >
> > Alongside enable SERIAL_SH_SCI config so that the serial driver used by
> > RZ/Five SoC is built-in.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4 -> v5
> > * No change
> >
> > v3 -> v4
> > * Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
> >   tags with this change)
> > * Used riscv instead of RISC-V in subject line
>
> Thanks for the update!
>
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
> >  CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_STARFIVE=y
> >  CONFIG_SOC_VIRT=y
> > +CONFIG_ARCH_RENESAS=y
> > +CONFIG_ARCH_R9A07G043=y
>
> You forgot to refresh after moving ARCH_RENESAS in v5 of "riscv:
> Kconfig.socs: Add ARCH_RENESAS kconfig option", and after relying on
> ARCH_R9A07G043 in drivers/soc/renesas/Kconfig.
>
Sorry I missed your point here, could you please elaborate.

> >  CONFIG_SMP=y
> >  CONFIG_HOTPLUG_CPU=y
> >  CONFIG_PM=y
>
> PM and GPIOLIB are auto-selected by ARCH_R9A07G043 (through ARCH_RZG2L)
> resp. SOC_RENESAS, so they can be dropped.  But it's better to do this
> after the release of v6.2-rc1, when all pieces have fallen together.
>
Are you suggesting dropping it from defconfig?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
