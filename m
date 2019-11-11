Return-Path: <SRS0=SgWD=ZD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEA7C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 14:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F552190F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 14:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="no4HZEq0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+PBH9ro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F552190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSJG9zf/IUTOkA8rOdGKAKQ85DQeqN1JfSjN95LUt5I=; b=no4HZEq0bpDtIG
	SHkiokyWSa2+Y/B5do1CSLFQF2iPHe+E54jYsFGmDbWxUr4I2TH02e72QLgKvVAt42JewFpeKaiXI
	70/PAGv1oBt3lN4S5AZwadxscKShfGbHF8hVOVQFuXus13vO/0935cJbd+tISO92XOg/o66YadZsm
	tIbFAIc9RjIECBUKeeURpoYpJwDk0TXyVEnecooGB77c6DkaYP0XeAXZe3xzTcSe2ZaqNnjhnMete
	NhG922IrzKExKsfPbZ4dzSXkWLFY0z5R0HE/D2W4Dg4Zzm303G8r3XBXyb07FZ/TbFQF568dC7KMV
	NJPda8PlUgE3F4dTxEIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUAKr-0001up-4L; Mon, 11 Nov 2019 14:06:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUAKo-0001uB-9G
 for linux-riscv@lists.infradead.org; Mon, 11 Nov 2019 14:06:27 +0000
Received: by mail-wr1-x441.google.com with SMTP id i10so14772612wrs.7
 for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2019 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+/Y2KrElV7WuOlbhVtVkPVZzokBiLzkE9XqPZHWAkRo=;
 b=V+PBH9roG+uCAcjxBMg9abG2Rixd7T7rZJTeWi9rlCB3JwgOQW4JDoCm2FnJR/rHCK
 +TvvQeJmjCyuQeWjVuVij10wQ4Wf8Tp5b8DocHurl5bczScO2d+flwcuFF8LkRVSmbnJ
 tNEj3i+Z66lJ/gTERRJTsH80ffpfkkhw56HPEelAat/7df5znfFS7yvmnIF4YUpfrk1E
 hditUWupkBjHbji9Z/fBaHwT5adp89U4Nael8+gfx8p9H22WClNyYhsDp7dP3THgQiFJ
 WqjIg5TLN9F+f6mpS2zVxKnbYrZUJS2Z/9iWC95blO74NM8BpduPtKWwDHzW8quXr92n
 hoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+/Y2KrElV7WuOlbhVtVkPVZzokBiLzkE9XqPZHWAkRo=;
 b=VcmhEawSWCY/84Wm5dXWGO8ZaLjPdVbJHFmrz4jIy/UL60m0PmaJPEtCt6xZA+UM1p
 6YtBCIS+CDlT/L+26bFa79nt8iO0aLwOR6QW8T/RClepXgBy+GipdBCneeuYbeL/U0A4
 wlcuchl1NBrQgaIZBZgAURnXWQKcXGXN4ghn08DNDVFVXeHdZrCRKu3gNMMHFSkXYIUS
 xVRM0jbgfk5NHY/HmFhsZHrsdzBJk0FhTj7UvMnEkhht/+CvFmL7wAriy5irVysPnmUg
 VcX478Qho9j2e2M8I2oF1bZeNXkuM2/jAlhAY0t3gvYS2zG4jogwjDVgfEcjiFnwBFfN
 1Fvg==
X-Gm-Message-State: APjAAAWdYUGuXj1R0chBxBy6Luy9OuS3LlWj6vsMvNTy0LKoLGRDAj2O
 n5ushjdW3t3Rot48PztuJUpNloD9xEVVyQtqw5s=
X-Google-Smtp-Source: APXvYqzJmR6xKNzmrAO5WakZhRYkbTzcJJBSgDfP/W5waJggUNc7WXU+ecqQovItkxBWOSgNvjzjSKKyRU6lPNvOkeQ=
X-Received: by 2002:adf:c641:: with SMTP id u1mr21451436wrg.361.1573481184040; 
 Mon, 11 Nov 2019 06:06:24 -0800 (PST)
MIME-Version: 1.0
References: <20191111133421.14390-1-anup.patel@wdc.com>
 <MN2PR04MB60612DF0F3191A8240F71F458D740@MN2PR04MB6061.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB60612DF0F3191A8240F71F458D740@MN2PR04MB6061.namprd04.prod.outlook.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 11 Nov 2019 16:05:40 +0200
Message-ID: <CAEn-LTpLu0ht=_HpK11Sa=frSvQt_1Nz48M3XZero=CJPidxDg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Enable SYSCON reboot and poweroff drivers
To: Anup Patel <Anup.Patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_060626_328120_948D84B6 
X-CRM114-Status: GOOD (  15.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 11, 2019 at 3:43 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> Correct Palmer's email address
>
> > -----Original Message-----
> > From: Anup Patel
> > Sent: Monday, November 11, 2019 7:05 PM
> > To: Palmer Dabbelt <palmer@sifive.com>; Paul Walmsley
> > <paul.walmsley@sifive.com>
> > Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> > <Alistair.Francis@wdc.com>; Christoph Hellwig <hch@lst.de>; Anup Patel
> > <anup@brainfault.org>; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Anup Patel <Anup.Patel@wdc.com>
> > Subject: [PATCH] RISC-V: Enable SYSCON reboot and poweroff drivers
> >
> > We can use SYSCON reboot and poweroff drivers for the SiFive test device
> > found on QEMU virt machine and SiFive SOCs.
> >
> > This patch enables SYSCON reboot and poweroff drivers in RV64 and RV32
> > defconfigs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/configs/defconfig      | 4 ++++
> >  arch/riscv/configs/rv32_defconfig | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 420a0dbef386..73a6ee31a7d2 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -63,6 +63,10 @@ CONFIG_HW_RANDOM_VIRTIO=y  CONFIG_SPI=y
> > CONFIG_SPI_SIFIVE=y  # CONFIG_PTP_1588_CLOCK is not set
> > +CONFIG_POWER_RESET=y

Why not to add

    select POWER_RESET

to arch/riscv/Kconfig ?

This seems to be a popular choice (?). I went this path recently while
enabling gpio-restart on SiFive Unleashed on a private branch.

[..]
arch/arm/mach-exynos/Kconfig:   select POWER_RESET
arch/arm/mach-exynos/Kconfig:   select POWER_RESET_SYSCON
arch/arm/mach-exynos/Kconfig:   select POWER_RESET_SYSCON_POWEROFF
arch/arm/mach-gemini/Kconfig:   select POWER_RESET
arch/arm/mach-gemini/Kconfig:   select POWER_RESET_GEMINI_POWEROFF
arch/arm/mach-gemini/Kconfig:   select POWER_RESET_SYSCON
arch/arm/mach-hisi/Kconfig:     select POWER_RESET
arch/arm/mach-hisi/Kconfig:     select POWER_RESET_HISI
arch/arm/mach-integrator/Kconfig:       select POWER_RESET
arch/arm/mach-integrator/Kconfig:       select POWER_RESET_VERSATILE
arch/arm/mach-realview/Kconfig: select POWER_RESET
arch/arm/mach-realview/Kconfig: select POWER_RESET_VERSATILE
arch/arm/mach-versatile/Kconfig:        select POWER_RESET
arch/arm/mach-versatile/Kconfig:        select POWER_RESET_VERSATILE
arch/arm/mach-vexpress/Kconfig: select POWER_RESET
arch/arm/mach-vexpress/Kconfig: select POWER_RESET_VEXPRESS
arch/arm64/Kconfig:     select POWER_RESET
[..]

> > +CONFIG_POWER_RESET_SYSCON=y
> > +CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> > +CONFIG_SYSCON_REBOOT_MODE=y
> >  CONFIG_DRM=y
> >  CONFIG_DRM_RADEON=y
> >  CONFIG_DRM_VIRTIO_GPU=y
> > diff --git a/arch/riscv/configs/rv32_defconfig
> > b/arch/riscv/configs/rv32_defconfig
> > index 87ee6e62b64b..1429e1254295 100644
> > --- a/arch/riscv/configs/rv32_defconfig
> > +++ b/arch/riscv/configs/rv32_defconfig
> > @@ -61,6 +61,10 @@ CONFIG_VIRTIO_CONSOLE=y
> > CONFIG_HW_RANDOM=y  CONFIG_HW_RANDOM_VIRTIO=y  #
> > CONFIG_PTP_1588_CLOCK is not set
> > +CONFIG_POWER_RESET=y
> > +CONFIG_POWER_RESET_SYSCON=y
> > +CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> > +CONFIG_SYSCON_REBOOT_MODE=y
> >  CONFIG_DRM=y
> >  CONFIG_DRM_RADEON=y
> >  CONFIG_DRM_VIRTIO_GPU=y
> > --
> > 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
