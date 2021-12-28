Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4037C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vbe4bHkKAu6v19DZolomKL3g2/r/f8QAIDXTQjnaeHU=; b=oC4EZlQDGqj6qz
	uYs9F6j7JKOc4r0pIfYc3wGIpHZpRC4bDeo8yG1Xpu3KXEPnD3rctphEJynzjigOAwPCvDfiu9CjW
	uEvHNYYvTL6bG2GsNQ86Svij+HH6MCYpEn/gxAusL+R0TZyDEt81qdLdlqnYlHlyrADp3JYLUgdIA
	WCFyJ2rs10PwR85+X+OAPdvWJgoLjW+rZv5P0fcq3DLg5fv53J2zG4Wbf/u63ZavFaSeVfiMhZ6Ni
	zHNMPGMJvosE1CtCIdhMaWSIfhPQcFXDzS5lPLi9vgNk6o+K+VhJiVxjI5zOUyo8A0jOMRfknpKOi
	heYNVn2z3wBuuhPeE0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n29eN-000fiO-LI; Tue, 28 Dec 2021 10:24:11 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n29eJ-000fg3-HJ
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 10:24:08 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so21075296pja.1
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USyrHlhnUayu2FiWb0UtOnf6CbNGk+7whrqJXcO7yr8=;
 b=Cs7LgqD6DsqNl4p5Amnt4bTWuc0Cbn7dPyZH3jfz7/xf154j1SpGRiTvEMHq6l8MP7
 YFovH7dZMrJtCeVtbYZJJSSZH3inHE29ypPTzHIeoMOoSHdPxfE9HdGyMfSyrp0KRWO9
 XGYLWkabORvlK5VwotQreh/v1T0L6HgHYy+cDqNmxUg06VKcpyp20Hrzk68VnIgWsWPY
 jZRZSMne0pk21591XSx3BqrHI2J1ZY5Zwhy05aqIPiM7cTvFjDonPzIynxCydtW0iDVu
 29IpXnMwzA0y2w2BH6s0IZ4UpXpRhy7c4no1lL5OCax27HXZ+9SzPQwwpSPQemc4aZTU
 RZ/Q==
X-Gm-Message-State: AOAM530ADzAhpYySWn+vH6EIgJsjkIYF5Ir5ixf4+euErze/qQELwTZx
 d2eppybHy1wthhChBvit63DCWcLpIqkpjQ==
X-Google-Smtp-Source: ABdhPJwXNWku5ATZfv8wct17aYKCXFFTox3hZ9LfzSX2Gu+cU9MNnAhEixe41zIsi1IGbZaVF4jdIA==
X-Received: by 2002:a17:90b:8c5:: with SMTP id
 ds5mr20655975pjb.169.1640687046642; 
 Tue, 28 Dec 2021 02:24:06 -0800 (PST)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com.
 [209.85.214.179])
 by smtp.gmail.com with ESMTPSA id d13sm14040670pfl.18.2021.12.28.02.24.05
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:24:06 -0800 (PST)
Received: by mail-pl1-f179.google.com with SMTP id u16so13251441plg.9
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:24:05 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr6011121vke.33.1640686631832;
 Tue, 28 Dec 2021 02:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-6-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-6-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 11:17:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2qsZZqE_hAchoD7_41ak8btTZb0UZE6DsXDehhT63fg@mail.gmail.com>
Message-ID: <CAMuHMdW2qsZZqE_hAchoD7_41ak8btTZb0UZE6DsXDehhT63fg@mail.gmail.com>
Subject: Re: [RFC 05/32] char: impi, tpm: depend on HAS_IOPORT
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Corey Minyard <minyard@acm.org>, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-csky@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 linux-integrity <linux-integrity@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_022407_601920_EB147CC6 
X-CRM114-Status: GOOD (  22.54  )
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

Hi Niklas,

Thanks for your patch!

On Mon, Dec 27, 2021 at 5:51 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add this dependency and ifdef
> sections of code using inb()/outb() as alternative access methods.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/char/Kconfig             |  3 ++-

Your oneline-summary doesn't cover this file.

>  drivers/char/ipmi/Makefile       | 11 ++++-------
>  drivers/char/ipmi/ipmi_si_intf.c |  3 ++-
>  drivers/char/ipmi/ipmi_si_pci.c  |  3 +++
>  drivers/char/tpm/Kconfig         |  1 +
>  drivers/char/tpm/tpm_infineon.c  | 14 ++++++++++----
>  drivers/char/tpm/tpm_tis_core.c  | 19 ++++++++-----------
>  7 files changed, 30 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index 740811893c57..3d046e364e53 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -33,6 +33,7 @@ config TTY_PRINTK_LEVEL
>  config PRINTER
>         tristate "Parallel printer support"
>         depends on PARPORT
> +       depends on HAS_IOPORT

Why? drivers/char/lp.c doesn't use I/O accessors, and should work with
all parport drivers.

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
