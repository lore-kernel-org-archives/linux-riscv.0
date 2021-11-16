Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEBBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 17:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 852786108F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 17:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 852786108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9K/+zq1dGFNqLeY6e2Jkj9z5mfBVd3Wiu95RDzd/Gdk=; b=ZVoVuCRW+BkKJR
	fcv05NfmxLl75NkPzB9Lhi/o/r/gCns5ZDfE2ddRGq85EWbhlEGH+Y7XgLDpfczIZkJmIMVvTeVrg
	V9CYipfLs/GdUjaC/4NyLF3CZs+r4VFTqNRObZptc3azwMeZZxkksqjpDXww6Y3GRWCZClLXmRKjD
	gxDdbX/0sESjeSxiOgtnVcuPfhOQVCcxvyIe+J7+27TZ/EOQZEZrHSfQ4bEVbHRuP18F/FzNyQveQ
	OtXRQRrGf8TKt9IswWQjkZ4fC1BTg/IxxkGxEMu6BZk8shqr9wpRSdi/LLCV8jMiqR9cyLRkPcLEc
	h5PISo+x2hmoJ5yCwVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn2GP-002Sbs-GV; Tue, 16 Nov 2021 17:28:57 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn2GL-002Sb9-Fz
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 17:28:57 +0000
Received: by mail-pg1-f169.google.com with SMTP id h63so11374702pgc.12
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 09:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkA51tWxSsscDQ4OnDVF0gVKl+TpddKexu+rNB6rga4=;
 b=frxlhHEdAJnY1MNNUgQoE0WoMGOJF/5vITaXLY0tUr3UY2MSQPjWI0eSS//sNJpYfp
 O6Z+jS12QNucl7KMFAZZ6yA/sE4hHnIY36xwzhdB9eTWA5f5U/drgLwVkkbz8+Rg0mNl
 OQMm6c0GQ/fQ8lxnEQWnP1Gtpj8UVyzgb2c2Pe+Vsm6MTk1NTFDZCKhIm4NEIquJzqqI
 EFLKgHg2qHIKa6LPqKvFAW81mfOsxL7haXDHC9SpW9jlrsppRMx0R4pBUYGmyJ6yLxvw
 Xx6uYyoPQJzGTsIgvidLeJZOT94JKzio8CEZjdIpDSrY9DxPpq2bq9y8i41FIkMfR4GT
 9htg==
X-Gm-Message-State: AOAM530gM8uuxF2346iWX6t0dAXxWtDaQhmXg5YlotS27k1L7SsjtyK1
 0EaZvWezNQ5uMtXuXH3nYrWJf92OAt0owQ5RhaI=
X-Google-Smtp-Source: ABdhPJztWnQTEvyFBXk/EWoYZuOO/BsO/4j2XiqLi5dCPei8GORqCEcvrDQZtaHkVUqJCHntXdMP/Q0JwesAiwH1PXU=
X-Received: by 2002:a63:3f44:: with SMTP id m65mr422498pga.15.1637083733060;
 Tue, 16 Nov 2021 09:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
 <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
In-Reply-To: <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 16 Nov 2021 18:28:41 +0100
Message-ID: <CANBLGcykFks+EF2m0bdD+j5w43Qy30LBgVnAYJWU+5-WVJH6PA@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_092853_563254_29C4A8D5 
X-CRM114-Status: GOOD (  28.84  )
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

On Tue, 16 Nov 2021 at 17:08, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > This series adds support for the StarFive JH7100 RISC-V SoC. The SoC has
> > many devices that need non-coherent dma operations to work which isn't
> > upstream yet[1], so this just adds basic support to boot up, get a
> > serial console, blink an LED and reboot itself. Unlike the Allwinner D1
> > this chip doesn't use any extra pagetable bits, but instead the DDR RAM
> > appears twice in the memory map, with and without the cache.
> >
> > The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
> > Starlight Beta boards were sent out with them as part of a now cancelled
> > BeagleBoard.org project. However StarFive has produced more of the
> > JH7100s and more boards will be available[2] to buy. I've seen pictures
> > of the new boards now, so hopefully before the end of the year.
> >
> > This series is also available at
> > https://github.com/esmil/linux/commits/starlight-minimal
> > ..but a more complete kernel including drivers for non-coherent
> > peripherals based on this series can be found at
> > https://github.com/starfive-tech/linux/tree/visionfive
> >
> > [1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
> > [2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/
>
> Thanks for adding me to Cc, I've had a look at the series and didn't
> see anything
> wrong with it, and I'm happy to merge it through the SoC tree for the
> initial support
> in 5.17, provided you get an Ack from the arch/riscv maintainers for it.

Cool!

@Palmer, do you mind looking through this? Probably patch 1, 15 and 16
are the most relevant to you.

> Regarding the coherency issue, it's a bit sad to see yet another hacky
> workaround
> in the hardware, but as you say this is unrelated to the driver
> series. I'd actually
> argue that this one isn't that different from the other hack you
> describe, except
> this steals the pagetable bits from the address instead of the reserved flags...

Yeah, it's definitely a hack, but at least it's not using bits the
spec said was reserved. Hopefully the JH7110 will be fully coherent or
maybe implement the new Svpbmt extension.

/Emil


/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
