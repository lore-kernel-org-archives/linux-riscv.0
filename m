Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6257BC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1NUWaroaxECMCqw4zwtUC0VKE+al/+wkMuA1kODgmk=; b=K4eFYhlvB4Vd1k
	7nH8Ye+I4/LA6x8LznYGo8pfZk1CYUyM6rTB9qudpl7FqNZ/eu8yw2NyUbFqBdGE78gIuc63AeN/+
	c2N8QLLlKTBG+T2KF5WIYumR9H5yTtJF6mjcriWErjha26wG/y5LMSYoRWtOY6ohurubjrGHxrGxp
	8NORyjdvbXVVSuMl/KQ8Z6oukZ/HmxXmuVucwtXqmgU0H+o/57aTtJDOTY3WDZUH85qMAncPRMxiG
	8sbAgJUIJ7kvdxj+C0s9gQqGEEUGdyU6/VlJkHGWyJkUOuV4KbqjlJCuLimb+OoRQU1dYy/qRT8i5
	BEiy4wqB7t52+jF5Ar6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uL8-000000028GS-3M6I;
	Mon, 07 Apr 2025 21:49:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1tl7-000000021v2-2YRp
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 21:11:58 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744060314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=33eB0XJEihdFu7uaA2YoXjeNopOx78bqYoFb1asG3U8=;
	b=cfMm1r2u0L0heM73VpvfdQrU+Usb2myH5nL4Okwu4tuwo+4degqzJF/PHHZsba4cZ/S/aW
	GANlBdwhVxaMTly6gHdDAinHR+Di0rvEAqdSRX9l376eHOoXasHFkF3AG3qx7pLvYiRZS5
	K8CVyo5aJGdA/e9vHEpkyQFbXxD5JELVV3EjhyRihHWedPuqIW5xDj2NoRpatCuE7iUEm1
	NjeJbxtJsOyFM/1FomkBajhRzJ30YC1qlFWB6HbCRJ6d04jM1Cb3V4V4AnFYVSvD+XM1tR
	VfQyZKkK5eWJv8/Z30SAkGxC/iNtMdVfJbFiOtvpvV3Db4swKpEdRIb1/Xg24Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744060314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=33eB0XJEihdFu7uaA2YoXjeNopOx78bqYoFb1asG3U8=;
	b=cNDOwg1H6N3TNeBQw8FgWHEXokZ9o7ZglMD2kL5kjeaBsoRk8PiTYKJMDv66bUB0ODLLYa
	IJWaRs8AQoGAWAAQ==
To: Maxim Kochetkov <fido_max@inbox.ru>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peterz@infradead.org, elver@google.com,
 namcao@linutronix.de, samuel.holland@sifive.com,
 daniel.lezcano@linaro.org, apatel@ventanamicro.com
Subject: Re: [PATCH 1/1] time/sched_clock: move sched_clock_register() out
 of .init section
In-Reply-To: <f57e8a74-4124-457c-b5c9-d193505ba093@inbox.ru>
References: <20250404050540.13507-1-fido_max@inbox.ru> <8734ekwkqk.ffs@tglx>
 <f57e8a74-4124-457c-b5c9-d193505ba093@inbox.ru>
Date: Mon, 07 Apr 2025 23:11:54 +0200
Message-ID: <87wmbvvfqd.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_141157_788374_8A0EEFE6 
X-CRM114-Status: GOOD (  16.05  )
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

On Mon, Apr 07 2025 at 10:25, Maxim Kochetkov wrote:
> 07.04.2025 09:26, Thomas Gleixner wrote:
>> On Fri, Apr 04 2025 at 08:05, Maxim Kochetkov wrote:
>>> The sched_clock_register() is widely used by clocksource timer
>>> drivers. The __init prefix forces them to be initialized using
>>> macro TIMER_OF_DECLARE with __init prefixed function.
>> 
>> No, it does not. It requires that they are built in, not more.
>
> Thank you for review.
>
> Let me explain some more. I'm trying to solve similar problem, as 
> described at 
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20240312192519.1602493-1-samuel.holland@sifive.com/#25759271
>
> I have both PLIC and clocksource module configured as Y (not m) in 
> Kconfig. So both of them are included in kernel Image binary. But I 
> still unable to probe clocksource device because it depends of PLIC irq.
> And PLIC probes much later than TIMER_OF_DECLARE part of the clocksource 
> driver.

Which is not a problem as all built-in drivers probe _before_ the init
section is discarded.

> I tried to convert clocksource driver to regular platform device and
> it works fine except warning:
>
> WARNING: modpost: vmlinux: section mismatch in reference: 
> dw_apb_timer_probe+0x136 (section: .text.unlikely) -> 
> sched_clock_register (section: .init.text)

Of course. The warning is because you invoke sched_clock_register()
from dw_apb_timer_probe(), which is regular text. See

drivers/clocksource/ingenic-ost.c
drivers/clocksource/timer-cadence-ttc.c

how to implement a builtin platform driver, which does not suffer from
that problem despite invoking sched_clock_register() from their init
functions.

> Dropping __init from sched_clock_register() helps to solve this issue.

It solves it at the wrong point for a builtin platform driver

> Anyway, this patch opens opportunity to compile clocksource drivers as 
> modules and probe them much later.

That's an orthogonal issue and needs to be discussed seperately from the
problem at hand.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
