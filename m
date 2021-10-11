Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E33C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 08:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7C860F22
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 08:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D7C860F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Bv79Y2hDhkWehmmmRc5V68osDyxCCXzHFfK8tEIgYk=; b=APMLhjeBvQCmWq
	KHYB5e0bGxKuEdPAIgsgu0UqmBANwisjqQtIWjX8V61zK2onF2t1ya5eEe5SulQJWu7rS5RUG8J0E
	sj8Vk83eJYBoiyQKuGmGrS27XeXjg5TzCf02pZzYPDO+stN153UYVqW0b3/fb7kRy9H2E//k0pgLY
	gGpM+2i/mqoEaLgWamZFG6PbH9BJZBeEXsw1+dj7D68xCnygPRaRswFKwXuDgp7g5BZTfRg5cTOSh
	/0axM4UB87YhoaZ+Z146oG7fxBE8P51VI+3XJp8lhbq4DJ24nda6BAyjmJfpHjDcW35Jj23GgMCyV
	dCWHqS7+WY+sJtSRDIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZqtF-008ODp-NZ; Mon, 11 Oct 2021 08:42:33 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqsz-008O8w-VL; Mon, 11 Oct 2021 08:42:19 +0000
Received: by mail-ua1-f48.google.com with SMTP id h19so206366uax.5;
 Mon, 11 Oct 2021 01:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILfhQ1xCyJpzVVyTRUeYiOGgGsjH3OkmEIE6ubpYA5A=;
 b=ov2En/hymWIw4R2tqTNT0EcVLYygHtJcMOC+bWQxiwSMI7cVJsQMzTolHZzSaCZGqj
 rGxao5GsSeUubJxpF9iARkS30iuNuk+ItIjCvYO+NzEfMLPXe8L3128w9ubFgdLA932K
 kurMLeRzIe1cmArS7c+CBFg9XFX4FMm1e6oyUr/UrRLc4aqwnKcFWY4Wz45jN6dg/OA8
 oCvKTeh8I7B9oFzNu+PKYLif8p1sGg3wD+g39dvRotfGDKeo6Xxk1TlhJHNNYJU26Gwe
 b/9S/qSmS7WEmVX3ziayMX3riERXsITG2/DFrhYIqvh8WiaiM/4CT4XWPmstmwyNzEXr
 QLNw==
X-Gm-Message-State: AOAM531Zza7vo16nqCrqD3EwPcMsdCDK7rpJMLet8xR6LMQrjl0PNKQ8
 ySFvd4vy6b8BKZGzjdjBkhKwzTPeEC9erF5isqg=
X-Google-Smtp-Source: ABdhPJwa+ZKiDHz9Zuw89anDy7yDddQI/ykQ73DcJ03VPWJOB8v+U/bqxFKnAP+C/tFj6uQTW+VjIp5j6a2L9ifXyto=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr13426605uaa.14.1633941731939; 
 Mon, 11 Oct 2021 01:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210928075216.4193128-1-arnd@kernel.org>
 <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
In-Reply-To: <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Oct 2021 10:42:00 +0200
Message-ID: <CAMuHMdXspk27xd95YAsXa73ES8rfKxii3RUEtsBtxQTk9qLztA@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_014218_022882_645C5347 
X-CRM114-Status: GOOD (  33.55  )
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

On Sat, Oct 9, 2021 at 11:24 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> [Cc: +linuxppc-dev@lists.ozlabs.org]
>
> Am 28.09.21 um 09:50 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Compile-testing drivers that require access to a firmware layer
> > fails when that firmware symbol is unavailable. This happened
> > twice this week:
> >
> >   - My proposed to change to rework the QCOM_SCM firmware symbol
> >     broke on ppc64 and others.
> >
> >   - The cs_dsp firmware patch added device specific firmware loader
> >     into drivers/firmware, which broke on the same set of
> >     architectures.
> >
> > We should probably do the same thing for other subsystems as well,
> > but fix this one first as this is a dependency for other patches
> > getting merged.
> >

> With this change, I have the new entries below in my .config:
>
> ```
> $ diff -u .config.old .config
> --- .config.old 2021-10-07 11:38:39.544000000 +0200
> +++ .config     2021-10-09 10:02:03.156000000 +0200
> @@ -1992,6 +1992,25 @@
>
>   CONFIG_CONNECTOR=y
>   CONFIG_PROC_EVENTS=y
> +
> +#
> +# Firmware Drivers
> +#
> +
> +#
> +# ARM System Control and Management Interface Protocol
> +#
> +# end of ARM System Control and Management Interface Protocol
> +
> +# CONFIG_FIRMWARE_MEMMAP is not set
> +# CONFIG_GOOGLE_FIRMWARE is not set
> +
> +#
> +# Tegra firmware driver
> +#
> +# end of Tegra firmware driver
> +# end of Firmware Drivers
> +
>   # CONFIG_GNSS is not set
>   CONFIG_MTD=m
>   # CONFIG_MTD_TESTS is not set
> ```
>
> No idea if the entries could be hidden for platforms not supporting them.
>
>          ARM System Control and Management Interface Protocol  ----
>      [ ] Add firmware-provided memory map to sysfs
>      [ ] Google Firmware Drivers  ----
>          Tegra firmware driver  ----

GOOGLE_FIRMWARE should probably depend on something.
I highly doubt Google is running servers on e.g. h8300 and nds32.

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
