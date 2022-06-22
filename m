Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C97C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/07yfQO8EFdiZQRBbCndWGc1iObNZj5BmzAwPLT8V4=; b=gRvux0W3zrW0It
	Eg7jsHhcIvYzaLj6Zttkb686dIIMFbrVikqd22a5gg4D+M+CqIPnGTEkfBAg/Qsb/jDqDw7kj+CYo
	JQHHnOXpnWzLSEt5VYQ1v2k8hjdHy7ioSHpU/5bcn5Gaiew3orwsq2w44c1kH2DAKHJdeOYbyhOXI
	WV4dYxniLG4A55ttziHvDDOjuKsqiw1FLLS3J/abLGVDKpiHtlRqC1BmM30p8ZYh4PRVxG5qUBrM4
	5drSaYy7N+rPYQGPpOsL158l6hsp5on591XCg6BEHGMZu8QMvGQZtCWYf3dG7TewORXvMFJW3aaE3
	uhElNHl8lEtnNLks6ljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wGi-009RUv-S7; Wed, 22 Jun 2022 09:03:24 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wGf-009RRR-Gz
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 09:03:23 +0000
Received: by mail-qv1-f45.google.com with SMTP id p31so24170865qvp.5
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 02:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=65BoBdNEPD+hhMSIaXkfwRdYUnoeWO1j5CRjqrWAPjs=;
        b=L23ntSkXFJPw6UVRQEg2S/DaJkKTmhwoBCGSwUr9OF9wDwWnJCy4dLbW+apbs+SgCH
         wfBE4YQFv3uNwpiiWn7vF4/DnbR3wvz1tE6e5Ku+QK9XsYkkwPPnWUz7SqB0nWB4s+7q
         AprEowNR59k7HbsWO4ABqksnafzq0XmCd2UwwEftr6UoB+GMfqDcc0VAY0NNsEXJ0NHL
         K9XRHCqNTS0dBnzmzVN9ne/TOTyZYGgDO+HzLMw5KbAI+rCM6Ak3w8aMnnfD1CcxcR1O
         wT0W1S0bcE2QqomFpg9Hpl8tTP2dzIacqYxjeUTDSWNVYuiZ5vtv0O2AUsQk7rELKX5R
         Mu6A==
X-Gm-Message-State: AJIora+Y3+UUvYhHDhHPjJSjPtmvLb1rv53VguiYuu3KvT+81H3++KmL
	a2l5iaUVPO5em8ZuQxpyX2hq9/BIXJih3w==
X-Google-Smtp-Source: AGRyM1vEPk8P3B/4qXZKCZj5D6xUh7ATNnJjcklV9TqSBVjmAXd8dYMsx167+oSWrw81abHGs30NIg==
X-Received: by 2002:a05:622a:1a15:b0:305:2db1:8c3 with SMTP id f21-20020a05622a1a1500b003052db108c3mr1976269qtb.256.1655888596632;
        Wed, 22 Jun 2022 02:03:16 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id f5-20020a05620a280500b006a6a6f148e6sm15321659qkp.17.2022.06.22.02.03.15
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 02:03:15 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3177e60d980so134349237b3.12
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jun 2022 02:03:15 -0700 (PDT)
X-Received: by 2002:a81:7c1:0:b0:317:897d:ea90 with SMTP id
 184-20020a8107c1000000b00317897dea90mr2828900ywh.283.1655888595308; Wed, 22
 Jun 2022 02:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220421212250.565456-1-john.ogness@linutronix.de>
 <20220421212250.565456-15-john.ogness@linutronix.de> <878rrs6ft7.fsf@jogness.linutronix.de>
In-Reply-To: <878rrs6ft7.fsf@jogness.linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jun 2022 11:03:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjzH6GGkaZ_5cjeC6stc80u9Ly+5rrBuk8rKMvM7==8w@mail.gmail.com>
Message-ID: <CAMuHMdWjzH6GGkaZ_5cjeC6stc80u9Ly+5rrBuk8rKMvM7==8w@mail.gmail.com>
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for per-console locking
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_020321_581802_589CAA92 
X-CRM114-Status: GOOD (  21.06  )
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

On Tue, Apr 26, 2022 at 10:50 AM John Ogness <john.ogness@linutronix.de> wrote:
> Currently threaded console printers synchronize against each
> other using console_lock(). However, different console drivers
> are unrelated and do not require any synchronization between
> each other. Removing the synchronization between the threaded
> console printers will allow each console to print at its own
> speed.

[...]

> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Thanks for your patch, which is now commit 8e274732115f63c1
("printk: extend console_lock for per-console locking") in
v5.19-rc1.

I have bisected another intriguing issue to this commit: on SiPEED
MAiX BiT (Canaan K210 riscv), it no longer prints the line detecting
ttySIF0, i.e. the console output changes like:

     spi-nor spi1.0: gd25lq128d (16384 Kbytes)
     i2c_dev: i2c /dev entries driver
     k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
    -38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud =
115200) is a SiFive UART v0
     printk: console [ttySIF0] enabled
     printk: bootconsole [sifive0] disabled
     printk: console [ttySIF0] printing thread started

As this patch does not make any changes to drivers/tty/, and ttySIF0
does work (it's the console), I looked in /proc/kmsg, and bingo,
the missing line is there, so it is generated, but never printed.

I tried taking the port spinlock in sifive_serial_startup(), as
suggested for the meson driver, but that doesn't make a difference.

Do you have a clue?
Thanks!

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
