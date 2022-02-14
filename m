Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6810C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=di9NxWvNy4vejyl5If42WGFfk9hN/NDLS/f9Lk91C+E=; b=c+gfqhQQ4KOUFZ
	IdRS1vZDVqAuHTEFKZyidBXG995aKpxY8K3KcgckHOYCJaKLPmOKd7mU9qVNm10LsYH1wYTePWj9l
	i7jN834FvCmvwUafbWt2JYrIX7cc+06FktsxH1YkxibnS6IK1FhvyNUHp0Tw0XMvYCjepPynCQ+ag
	WXKCKAv2I36D8w04sp5LuH6L+Lo5EVGyBth2Fjek+mj0hYhXKKxc2CwJyWf2XnQYu2RLaf7YBV1wM
	scFmsAwl5XxvFM3Ap7gKFWHi0RpXlUprm2e5Txp+n9nL2XDEYqijKR33LQqDMq0ojIpMSirTcxRER
	U+JcspkeirRgZVz0eK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWvB-00E002-PQ; Mon, 14 Feb 2022 08:41:22 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWbY-00Drm2-Ss; Mon, 14 Feb 2022 08:21:08 +0000
Received: by mail-ua1-f48.google.com with SMTP id v5so7722372uam.3;
 Mon, 14 Feb 2022 00:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/wocXln3OZyzUJ8vGAcSbzur2Qk8XU2C//sjVsqiZdk=;
 b=sHA49mwKV4lSrQFGdBQTLrSy5PxYw6+S4y7yFaeVO8aDBDSGXDMjlL0L7iCRlVt/us
 y4EzFwXWf9Lq0qyYgbXAr0NJbdtRMzNt2Tlggcx1Ph601w9nkliLnRkkkSQq6B5MKTzj
 vKTZkgJTrOqIqLCe6vcN7SpCrwqtFSE0UD0NvYz0f1eBPUY0XtduVgzRF8g+iwDjbsd9
 Wqw5SYaeuDgohHt6r2f/lNpNi6buN4Lb5yhjzR7VvW5GX+Ed+85RDp5El79QAh9YxUo1
 3s0tSlb8zbwKLEQ6AQaFcR63CJormXCW0sDK5amtApP3o/3CYMbiG/O4pahbW3vu4VuY
 KWBA==
X-Gm-Message-State: AOAM531gQ71hWrfM+PLeqkdJhqH/LXsJnwjL1OKtQQAw8wXoGC7k3MjX
 Js9gnj1IcNCb1L44Z4ooVCqoX7R8ryU/gQ==
X-Google-Smtp-Source: ABdhPJxCMZL3N7RFSEHBTfSIwTLXYyIvdzHPYZzDQbmJHCBYVUi5+bLGhZqZDRfTy5i+VdcKcHUM5w==
X-Received: by 2002:ab0:36b3:: with SMTP id v19mr3265708uat.101.1644826860560; 
 Mon, 14 Feb 2022 00:21:00 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id d25sm5387096vkl.53.2022.02.14.00.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 00:21:00 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id bj24so2668707vkb.8;
 Mon, 14 Feb 2022 00:21:00 -0800 (PST)
X-Received: by 2002:a05:6122:c8f:: with SMTP id
 ba15mr3700134vkb.39.1644826860129; 
 Mon, 14 Feb 2022 00:21:00 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2202122313460.34636@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2202122313460.34636@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 09:20:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-utcFzCZTgqONjxs=U662nF0=aBQu7Zi7FBQouwiA3g@mail.gmail.com>
Message-ID: <CAMuHMdW-utcFzCZTgqONjxs=U662nF0=aBQu7Zi7FBQouwiA3g@mail.gmail.com>
Subject: Re: [PATCH] parport_pc: Also enable driver for PCI systems
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org, 
 Niklas Schnelle <schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_002105_007108_821276F9 
X-CRM114-Status: GOOD (  27.96  )
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

Hi Maciej,

CC Niklas

On Sun, Feb 13, 2022 at 1:45 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> Nowadays PC-style parallel ports come in the form of PCI and PCIe option
> cards and there are some combined parallel/serial option cards as well
> that we handle in the parport subsystem.  There is nothing in particular
> that would prevent them from being used in any system equipped with PCI
> or PCIe connectivity, except that we do not permit the PARPORT_PC config
> option to be selected for platforms for which ARCH_MIGHT_HAVE_PC_PARPORT
> has not been set for.
>
> The only PCI platforms that actually can't make use of PC-style parallel
> port hardware are those newer PCIe systems that have no support for I/O
> cycles in the host bridge, required by such parallel ports.  An example
> of such a host bridge is the POWER9 PHB4 device, but it is an exception
> rather than the norm.  Also it is not clear whether the serial port side

Note that this hardware dependency is being addressed in
"[RFC 00/32] Kconfig: Introduce HAS_IOPORT and LEGACY_PCI options"
https://lore.kernel.org/all/20211227164317.4146918-1-schnelle@linux.ibm.com/

> --- linux-macro.orig/drivers/parport/Kconfig
> +++ linux-macro/drivers/parport/Kconfig
> @@ -42,7 +42,7 @@ if PARPORT
>
>  config PARPORT_PC
>         tristate "PC-style hardware"
> -       depends on ARCH_MIGHT_HAVE_PC_PARPORT
> +       depends on ARCH_MIGHT_HAVE_PC_PARPORT || PCI
>         help
>           You should say Y here if you have a PC-style parallel port. All
>           IBM PC compatible computers and some Alphas have PC-style
> @@ -77,7 +77,7 @@ config PARPORT_PC_FIFO
>
>  config PARPORT_PC_SUPERIO
>         bool "SuperIO chipset support"
> -       depends on PARPORT_PC && !PARISC
> +       depends on ARCH_MIGHT_HAVE_PC_PARPORT && PARPORT_PC && !PARISC
>         help
>           Saying Y here enables some probes for Super-IO chipsets in order to
>           find out things like base addresses, IRQ lines and DMA channels.  It
>

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
