Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98939C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 22:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSleZhFuAfPerHfIRdYnUbkvcPb51tCnobgeepn02Bs=; b=Rq5YJl1CfNxiVJ
	hadA1nteWoqK1dvRc7Il5hYX+a0gMthxPYY4BqYJPNWq11uY9RLzNnBy8q9Jh/OoYNyMmMD/DmD5f
	rFQ/39FEMFhUbRxUe6Dcsoyv5bo+P3WUr70s4NIkV4gyDB4DcDkLtLyt+P5X+uXop1RLRzj4QaYGV
	SoD8sP06zPo+ORCGRSdNaLUdPn6aCHIGYtsnZXhzy96AOdTf5lofVpwodKg/BUPKNoTmFxuHh8dp6
	hHgUa+Ps2GtnbZKOriU5YksVLgCILT0f0U2o/Ulp3k8LWKR7/b1JPy0vZ8pG0lJjGnHLw2uOxC8UW
	36h5SkCI2GJUUJorY0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o48yU-00CQZ6-11; Wed, 22 Jun 2022 22:37:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o48yR-00CQXa-M9
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 22:37:25 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1655937435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8tSupLdVkgmkJxR6XWH1BaGWmi5B6LARumTOlnBjCLU=;
	b=h2dsoGyMgLwZjzVS9szjvLRMkofizn2sHhCAgoKoil5WEmoTfKt5Sv98yHwN1uZtQngl1q
	bHkdqeJ2H5Ld+Vw8Xl4WcZqMqM1ObX/byCfCH7MCKOIcPG/DvDGxH3GeqzDyEHtGlW2xHb
	CiI8wSJuKIXzC1Ve+OEK4GQxdwBdMHE1Cp8ukuW7UApz0g0SiW3v9Xh4hbQfd/icYFzVxF
	NKakt9z2rIMmjHHxJXxd8/DrtogxTSsLjEvxqaEDUq1JoV26ZhL/EBBPhR1dr3EDabFb3d
	xx6PuwQSQRiaYJ8fc3w9YNTAy48otfvkej2CPHfhRCYQYrOIZ4jAxrdVGUUSYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1655937435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8tSupLdVkgmkJxR6XWH1BaGWmi5B6LARumTOlnBjCLU=;
	b=E8vgALv5rGfb7cjIr53AYf3otdbEMlM7X8s97Y88959INfA84zSQz6buqDJN519OKO9haJ
	D05jBbsTXnSy3/Aw==
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <CAMuHMdWjzH6GGkaZ_5cjeC6stc80u9Ly+5rrBuk8rKMvM7==8w@mail.gmail.com>
References: <20220421212250.565456-1-john.ogness@linutronix.de>
 <20220421212250.565456-15-john.ogness@linutronix.de>
 <878rrs6ft7.fsf@jogness.linutronix.de>
 <CAMuHMdWjzH6GGkaZ_5cjeC6stc80u9Ly+5rrBuk8rKMvM7==8w@mail.gmail.com>
Date: Thu, 23 Jun 2022 00:43:15 +0206
Message-ID: <87v8ssgw9w.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_153723_950877_F9A7C79A 
X-CRM114-Status: GOOD (  15.31  )
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

On 2022-06-22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> I have bisected another intriguing issue to this commit: on SiPEED
> MAiX BiT (Canaan K210 riscv), it no longer prints the line detecting
> ttySIF0, i.e. the console output changes like:
>
>      spi-nor spi1.0: gd25lq128d (16384 Kbytes)
>      i2c_dev: i2c /dev entries driver
>      k210-fpioa 502b0000.pinmux: K210 FPIOA pin controller
>     -38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1, base_baud =
> 115200) is a SiFive UART v0
>      printk: console [ttySIF0] enabled
>      printk: bootconsole [sifive0] disabled
>      printk: console [ttySIF0] printing thread started
>
> As this patch does not make any changes to drivers/tty/, and ttySIF0
> does work (it's the console), I looked in /proc/kmsg, and bingo,
> the missing line is there, so it is generated, but never printed.

What is sifive0? Are you using the earlycon driver to create an early
boot console? Can I see your boot args?

There is a known issue the that earlycon does not synchronize with
normal consoles. A patch was recently posted [0] on LKML.

> I tried taking the port spinlock in sifive_serial_startup(), as
> suggested for the meson driver, but that doesn't make a difference.

It may not have made a difference for you, but it should be there.
sifive_serial_startup() is writing to SIFIVE_SERIAL_IE_OFFS without
taking port->lock. sifive_serial_console_write() also writes to this
register (under port->lock). This could lead to RX watermark interrupts
being disabled for some time. The problem is not as bad as it was with
the meson driver because __ssp_enable_rxwm() is updating the shadow
copy. But still, it is a bug. And anyway we shouldn't have 2 CPUs
writing to a register simultaneously.

John Ogness

[0] https://lore.kernel.org/lkml/20220621090900.GB7891@pathway.suse.cz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
