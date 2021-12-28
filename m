Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE76C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XriftxlpHlqAFiKgbrH206nCokvSJONb6j5fQ1EVTU=; b=ntcvbWkJwMUHFy
	4hTTDmjoAmepVnLy/T55oxILdlHwcK6+gYytYinA/+z6ALawNXC7CVmH5y28iHl0pPbw4QnU2Tj39
	+ghbk5wXK3dysryPAMOWqPr4xXz+hUgm2GXVucCmbU3tLK2rXpK//Dhf/t5IfQdC8UasvXbYXc+SD
	pyEW98jnRYOJlRr91hrikN/1B6Xrkt/ionPXBi6UMPyFZ9bx3d9rFIZgE8G4VjEWHN/mpbfcE9rEh
	FQm898IjGvbajolPrvQfqC1tgjwoNvQGziznkZN/xDx6OhpbO6JBM2bbQgONErlhvQ1J6ibxSwm95
	EpaYubd5ECUv12slFKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n29cY-000fIO-AN; Tue, 28 Dec 2021 10:22:18 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n29cV-000fHG-Bc
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 10:22:16 +0000
Received: by mail-ua1-f49.google.com with SMTP id c36so5672836uae.13
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XlHqM3s89iXtoWPBbjZMgYeJo6DHmFUlBr+aZlxVLoA=;
 b=Xfch5SAUW3ZMlYHxr5ymxH1iaNr/DFbb4GSX1nke8niSG8+PBRfQKCC3c8YRCDvZPU
 e7/xt0XTpvvpIP2qKrU0s+fuBBcMnTglzd+WjPAVKuSUkIk1co32JqKdCwMGi/+xh1HV
 86yTw762oHeR6acyh8tIIjLNgoeeCoRIl8HWQbgt2YX2GyppuwPwQku3b/kf2rHWcTMM
 yy1RmV7ly4SJJM/Cf+ILd7V7QBVo6LIIMnHmWyRPt7L5i/NyaKw70l6A52UYpAb5WyZK
 x/KgEBfLdkKwtPg36Zmn1qD42M6/j8y2Ipaz9j1/wPzHXtfiB4kXSEw429Jxvc2LewuA
 UDNA==
X-Gm-Message-State: AOAM533RFSNMWof9x8R670fI9gHUgpJZl+rqkQ7GO2vXQ+7LQbEkW0pS
 W1vSNuLbBfQqD6Ed3KnxLhuED4Djf5HPQw==
X-Google-Smtp-Source: ABdhPJwKDnFksVFK6rnHjGyXlsMRk7wVkDX67HHP7PwcuKArO4elWCBUub5CcKaHguzIYkrX6vXvSA==
X-Received: by 2002:ab0:7a4f:: with SMTP id a15mr2662979uat.73.1640686931318; 
 Tue, 28 Dec 2021 02:22:11 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id a65sm3744296vkg.27.2021.12.28.02.22.10
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:22:10 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id p2so31033879uad.11
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:22:10 -0800 (PST)
X-Received: by 2002:a67:c81c:: with SMTP id u28mr5694404vsk.38.1640686930392; 
 Tue, 28 Dec 2021 02:22:10 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-11-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-11-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 11:21:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcfGhVjB2pNB=ct8dExLeh-cY+Vmb0NWpZ2T0bfa8VdA@mail.gmail.com>
Message-ID: <CAMuHMdXcfGhVjB2pNB=ct8dExLeh-cY+Vmb0NWpZ2T0bfa8VdA@mail.gmail.com>
Subject: Re: [RFC 10/32] i2c: Kconfig: add HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-csky@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_022215_432354_78D602A0 
X-CRM114-Status: GOOD (  20.51  )
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

On Mon, Dec 27, 2021 at 5:49 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -828,6 +828,7 @@ config I2C_NPCM7XX
>
>  config I2C_OCORES
>         tristate "OpenCores I2C Controller"
> +       depends on HAS_IOPORT

While drivers/i2c/busses/i2c-ocores.c does use {in,out}(), I doubt this
is used to access legacy I/O space.

>         help
>           If you say yes to this option, support will be included for the
>           OpenCores I2C controller. For details see
> @@ -1227,6 +1228,7 @@ config I2C_CP2615
>  config I2C_PARPORT
>         tristate "Parallel port adapter"
>         depends on PARPORT
> +       depends on HAS_IOPORT

Same as PRINTER: shouldn't this work with all parport drivers?

>         select I2C_ALGOBIT
>         select I2C_SMBUS
>         help

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
