Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7499EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNAwcotcP0HAP1SrbpERjPHLTOF7qChYhKGLBofNbhk=; b=LEjEz0JBivZene
	44h5MFgjsiiQt83SCIky9CG6XPu5r5DhALzM2DXO1GJBgXs3Stwys+uUfPxncEC0M7O0kTMpm2fgA
	p+2cS+NFQTln3bDLQlBHmcsaNYcJISeHXMFhjtgY58ubTNxdCt6QRa7+LhxR7ItaS21dUu1vjdKOp
	O6l5ZVHL1mwk3owzuST6PCziJzbOP4iBONJUN2z2+gzf9qTQQ5Mq1ceSpRNbQyJmWxmbJMWuhCqvN
	Bv3FZ4RUO7ofEhbnAXA7FRxb5aSmbMYPJ7c3LVrcSKN47VBjdqaUKznhZcusJiQAesl9anbrpFk1D
	mSNThleDPq/yLIr8+d9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHMBQ-00D4iy-3r; Tue, 08 Feb 2022 08:49:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHMBA-00D4dm-Nb
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 08:48:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h6so10630635wrb.9
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 00:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EkVxK/LOYz0/eo5az4a2zVWUd5m6LEvFlEjayukrMYk=;
 b=op64XUdgnstjz6QFJUzFkyQ4kvy0o35NYrSG8sjVko8AfwvJWsZX2akrlJ6y8EGQ2e
 wWBJdZQ/tesItUNAXQhq6UMZSjC+HOYBqpC3eKF79QrR3n3MC2iNq/7IvhOYj1Z2uea1
 tY5r5lV/2stL6vROHTELIfSmTXJHuMo+yDi910j2fFQlFc6qmbBoVmiykoU6jJ875/5d
 Z3UsB7FqwI31PKTcHz0xY00UJZoba83/zojhH3ni1KDI1L4I+Lf7wFi2CQr7KBKRatqG
 jqtcWLHmjx2+4Ad1YDmXlJYYJfWbMdIAIvgOj0tTEdyGg1Z07YptGVS00Fw2xCi4CIW+
 JFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EkVxK/LOYz0/eo5az4a2zVWUd5m6LEvFlEjayukrMYk=;
 b=r69grCgdxdXFJmYgVHRhuC9w2IUtG6decTowrJYeKC+27djKB5h2L7Fjl5xkMlvYBz
 XMMLukriaKn30NyGACopq+JfJqcKNuzjpBO9W9C9tNE6E8hrTZdTPXyjLplowBNIyhP4
 Erm+EXZ1AC18sWmotOdyA/QhFzlV0x+gCisZu4VQ59vKFPBRzLL/+sVA5rXU6MVrQ4IU
 XoX1bccp+8WiJYzBwUgN30aNrlfpAICJaf8Ty2Ci2QQ3EDLW8/VafUT/l3XkNW9ydU0j
 CpWw4wXJ2uGHQjRgP4gy4w+Hlsd7fsNs9hWqihfR8p9h9Kz97JtjW8IGD3eaAdahA/aw
 zNbg==
X-Gm-Message-State: AOAM5339fjXEBg3eT6rfDNnwmGN+NEw86r/zmSEMtY19jcgm5htTDCjh
 zKDZG4yB+FGPD+RNiVGYYEJebehbq+FG3BMM4+hwjQ==
X-Google-Smtp-Source: ABdhPJyosXWO+NAe1q63zMby8CE8NyRp3HJT3OqC3u+vUMEXQNCw+EOmmQ/CtbilJrSHEq/padGN1KsmnCaA7OOnan0=
X-Received: by 2002:a05:6000:1e0a:: with SMTP id
 bj10mr2564533wrb.313.1644310130417; 
 Tue, 08 Feb 2022 00:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-9-apatel@ventanamicro.com>
 <CAJF2gTRLcqQ8ZjKwWNmARtaraVW7dD5Hp5=iv+4kHYENvB2gWg@mail.gmail.com>
In-Reply-To: <CAJF2gTRLcqQ8ZjKwWNmARtaraVW7dD5Hp5=iv+4kHYENvB2gWg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Feb 2022 14:18:37 +0530
Message-ID: <CAAhSdy00Yi10M0ECm+aUmbeviaXnm-bV9yLkwJKMSXQ2_7geCw@mail.gmail.com>
Subject: Re: [PATCH v10 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for
 QEMU virt machine
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_004852_862692_042A9AC9 
X-CRM114-Status: GOOD (  22.06  )
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

On Tue, Feb 8, 2022 at 11:56 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Jan 26, 2022 at 7:51 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > We enable RISC-V SBI CPU Idle driver for QEMU virt machine to test
> > SBI HSM Supend on QEMU.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig.socs           | 3 +++
> >  arch/riscv/configs/defconfig      | 1 +
> >  arch/riscv/configs/rv32_defconfig | 1 +
> >  3 files changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 6ec44a22278a..f4097a815201 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -36,6 +36,9 @@ config SOC_VIRT
> >         select GOLDFISH
> >         select RTC_DRV_GOLDFISH if RTC_CLASS
> >         select SIFIVE_PLIC
> > +       select PM_GENERIC_DOMAINS if PM
> > +       select PM_GENERIC_DOMAINS_OF if PM && OF
> > +       select RISCV_SBI_CPUIDLE if CPU_IDLE
> >         help
> >           This enables support for QEMU Virt Machine.
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index a5e0482a4969..b8c882b70b02 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_VIRT=y
> >  CONFIG_SMP=y
> >  CONFIG_HOTPLUG_CPU=y
> > +CONFIG_PM=y
> >  CONFIG_CPU_IDLE=y
> >  CONFIG_VIRTUALIZATION=y
> >  CONFIG_KVM=m
> > diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> rv32_defconfig would be removed. I think you could delete this part.
> https://lore.kernel.org/linux-riscv/20220201150545.1512822-9-guoren@kernel.org/T/#u
>
> I would Cc you in the patch, and you could track the progress.

I am not sure in which order Palmer will merge these patches so I
will let him take care of the conflicts in rv32_defconfig.

Regards,
Anup

>
> > index d1b87db54d68..6f9a7c89bff9 100644
> > --- a/arch/riscv/configs/rv32_defconfig
> > +++ b/arch/riscv/configs/rv32_defconfig
> > @@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
> >  CONFIG_ARCH_RV32I=y
> >  CONFIG_SMP=y
> >  CONFIG_HOTPLUG_CPU=y
> > +CONFIG_PM=y
> >  CONFIG_CPU_IDLE=y
> >  CONFIG_VIRTUALIZATION=y
> >  CONFIG_KVM=m
> > --
> > 2.25.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
