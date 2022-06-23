Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4D4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6C1kGs/fXhnmOIM+oK5Ua8wzMNFs8rETv7NTlMbDk8=; b=rHtdHFYiGIACfA
	Lg4Xdd8VfKwRTrsenj4xZKtJnGN6fwlZq3cN8wrZ8n4pdXFdFejWOgssJ1m+RePaiVmOBCOFNBXnh
	6HDg7ICCaZFzFuoHxoOysp1TBbzCPUKo25asFIXsHcbrJ41UcWsyaHM6kxgXiDt9iBntKPP88eiWr
	Avgi4AWkjMmAjhxF/q8c5Z+c/PlcHlkzfKGpfFQEkjd7+pwj3kRHO4g9604zsP4Ay3KSJa/W7zOz+
	yaztEQmY81egV/7l95TjEXb0qrHcRDtUxebS8MJU/MPW6qIOxfb3iyUCTMDgltYDK8PO/PaKAjIfs
	muZ6irzPYBLLlq0Sp4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4JoI-00ESgK-IA; Thu, 23 Jun 2022 10:11:38 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jmy-00ERwP-VF
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 10:10:18 +0000
Received: by mail-qk1-f171.google.com with SMTP id u124so385862qkb.12
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 03:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tDiN2XUMXdbXoOyZ4jtMq+b+hmbHQgPzlqj2YdQ+bNg=;
        b=A7dUYZaOUumARSUhj8GCidUicp3QIqcZvnMjcJkzsSnmF2IMIUieA29i2nhdzqLoK7
         ukCB2pNOIyBeCCLv9o9jAYMSLY0fnUJfqZaKHHkEmTBbPtjsMfAc3TE5H9gDFYzopWxf
         UoyA8Bnw+Z/Ow2QSkv2pPdLGJWANB4Pkfq7Thj+ef7IpICx3lxdlBnDY7d7ndO9l1ptT
         BL3RqWIJn3LVlhXOu0HPO5bu/O56AD7s3bye4CtxAOt8Z1nN4I9fxzqxKUsn0F7yJV34
         6/AEvol/FghIfJnaeIqA4DShcW3AlK3pfA1W+dGEEFGv43f1lW5W4weIfv6LIDxnJAZl
         LCGQ==
X-Gm-Message-State: AJIora+0nabmls58uOYJFCK3hO3upew94ydiLccpn3DgahZSBWpevA+W
	fT6n+EjkyNqAvvYkpbVCAEz1kgnl2CIIHg==
X-Google-Smtp-Source: AGRyM1urQwSXYXVBynhmP+VUSAnVoEpX5CIDoYQSXtZVKcpDItnTqMyFlskPl/EEHi/cAfQ/PoKnoQ==
X-Received: by 2002:a37:4c1:0:b0:6ae:e60e:7118 with SMTP id 184-20020a3704c1000000b006aee60e7118mr4715401qke.473.1655979013691;
        Thu, 23 Jun 2022 03:10:13 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a430c00b0069fc13ce1fesm18839008qko.47.2022.06.23.03.10.12
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 03:10:12 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3177e60d980so167310257b3.12
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 03:10:12 -0700 (PDT)
X-Received: by 2002:a0d:f801:0:b0:30f:f716:2950 with SMTP id
 i1-20020a0df801000000b0030ff7162950mr9852993ywf.358.1655979012327; Thu, 23
 Jun 2022 03:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220421212250.565456-1-john.ogness@linutronix.de>
 <20220421212250.565456-15-john.ogness@linutronix.de> <878rrs6ft7.fsf@jogness.linutronix.de>
 <CAMuHMdWjzH6GGkaZ_5cjeC6stc80u9Ly+5rrBuk8rKMvM7==8w@mail.gmail.com> <87v8ssgw9w.fsf@jogness.linutronix.de>
In-Reply-To: <87v8ssgw9w.fsf@jogness.linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jun 2022 12:10:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7trsRg0x9w8ZfHp0UHZ8PE+EoddAzf9nmtjGrO4YfPw@mail.gmail.com>
Message-ID: <CAMuHMdV7trsRg0x9w8ZfHp0UHZ8PE+EoddAzf9nmtjGrO4YfPw@mail.gmail.com>
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for per-console locking
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_031017_046594_D7A91B1D 
X-CRM114-Status: GOOD (  25.97  )
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

Hi John,

On Thu, Jun 23, 2022 at 12:37 AM John Ogness <john.ogness@linutronix.de> wrote:
> On 2022-06-22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > I have bisected another intriguing issue to this commit: on SiPEED
> > MAiX BiT (Canaan K210 riscv), it no longer prints the line detecting
> > ttySIF0, i.e. the console output changes like:
> >
> >      spi-nor spi1.0: gd25lq128d (16384 Kbytes)
> >      i2c_dev: i2c /dev entries driver
> >      k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
> >     -38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud =
> > 115200) is a SiFive UART v0
> >      printk: console [ttySIF0] enabled
> >      printk: bootconsole [sifive0] disabled
> >      printk: console [ttySIF0] printing thread started
> >
> > As this patch does not make any changes to drivers/tty/, and ttySIF0
> > does work (it's the console), I looked in /proc/kmsg, and bingo,
> > the missing line is there, so it is generated, but never printed.
>
> What is sifive0? Are you using the earlycon driver to create an early
> boot console? Can I see your boot args?

earlycon: sifive0 at MMIO 0x0000000038000000 (options '115200n8')
printk: bootconsole [sifive0] enabled
Kernel command line: earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro

> There is a known issue the that earlycon does not synchronize with
> normal consoles. A patch was recently posted [0] on LKML.

> [0] https://lore.kernel.org/lkml/20220621090900.GB7891@pathway.suse.cz

Thank you, that did the trick!

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
