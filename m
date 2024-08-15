Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9572CC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 12:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iIma8ojgJ5KV+LVT/jJ+naXtOfCylUyeSfJLyUE2dM8=; b=UcRmN90mqO2OOwYNTSs0ZnFuIZ
	oQMlVCxo5bYpFkELpkvZ/+QhnwDqfV645A+j3hYbBcmOUgPdyTYYn4wVYv2/qYnVnUy+1yfMTCh1G
	OPe5ZT1nYjQbMeVZzon3u7w4Qi+LLi9b5tg78QTxq7p2CPfp2a9BMFQxFBwVtrY2khkzpir5GB5nV
	Qxcy1ewI9uyiadwo3GXCJDyBW+5Z4CnPH5cl8iLoWRP2yE20mUQZ6LZ/w3K1eylhmXRQGTqSISvD8
	58JWH5SkzujzmIoGhr81dseGOLG/MKXjremyf0QYqELprLshvfNM0doc0eLSt5CHAroaPA1oDolDH
	ZF6Ho/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seZMz-00000009rot-4AZD;
	Thu, 15 Aug 2024 12:14:22 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seZMw-00000009rnr-2UzE
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 12:14:20 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 615773F1ED
	for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723724056;
	bh=5LJz5tYO6GlR7aAMJQnBhMkGyX+mgcBglIlt5FhiOes=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=h8OP95W9VQuYvUI6BrY5kmurChbFvkU6pK1JJgm49D57ZlcTzdIyPj6z70zyYhpo0
	 gweAQNgYErpVUTDj0sQeX/pdzol4M2+2HgkyX3+rFdZdlNkU+lvj84+w7+T9aEFuef
	 ROsKXmJuWD1IYpLdjI2C88W/7pLBVpNYrLpuGbhK3iXvaHuwvD78/7urNUwpsLwmLJ
	 OscAg/hy5IZLm6kKrpaDmw5VD2kuXDkHXZ0avNjicvQ8ExsLOmjFTQ9eDiLtpULX/g
	 zn2VDi6HD2pS4yq7G52o9z3IgwO4f5aqaN0cdsew+HXusfseIqY9cpfIf2Fp2oDhk4
	 EQXxLuGgGp87A==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-45029fafac8so36211731cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 05:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723724055; x=1724328855;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LJz5tYO6GlR7aAMJQnBhMkGyX+mgcBglIlt5FhiOes=;
        b=j28dGw9/cNDW21mWOFR1eZYeqFHbm+UdUyk8DFe6la+aBk/tqbNm8fLwTWF6AGhL26
         yf1KI2OSvzGU7mabD1EZPgbbcQKP19X8FWDVLrvdUr/0UTDLH5dVwnqsGpbYiYlPycy8
         5kbQarPOTVJnJOpkeNzDLSPhqKkZyvlffC+JQgbsQXGOKAl6f9AcRKAQUf/4PYf6mgZm
         Drk8Ax7TZIXvxaZJtsUYZOANyrEAmveSKSucaCt7J4IssDiyS5zeITbnIgN1ADRgzvi0
         Tlov60+HEDHdj/E0u2IWThpIWkSDGcDOy6ow6hSfynqVvJg0/87g/q9UX5pudCEWaagP
         m19A==
X-Forwarded-Encrypted: i=1; AJvYcCX7PtB8LdgbWTvic18LXWHgxaV54APRyYfN2VrSGlBLWlMbS5gp2HR88TLDoXJX7uWg8GgrLBJTlspFHSAlubJSMZFOWQ9mb3oMKCMqW2vE
X-Gm-Message-State: AOJu0YzEORVUrbODLm5uQOzfguAyJwPoMEKinvWAH/uYMouwPqmTLH4Z
	s1Wi2fplVclmiG0xnOlPagD14Mr9ySFfr2VhOy8c3t5HDe/LLFVUyPNded0zdmnWsjo+sy4lh30
	ExcBAtc4nFe0IdwMrd3AHokC9Ov4w1ftMUEPf4svpGtBmIH08P2/gHBWlLwXv4AClMH9HEdEKFu
	862Zc3XYNZn5sSneeCvdYXbJfRmjdLwIGtcv18HCRTRKq5bmWBf+Xh3Sy7
X-Received: by 2002:ac8:6905:0:b0:453:5b3f:2a39 with SMTP id d75a77b69052e-45367845732mr58163801cf.1.1723724055295;
        Thu, 15 Aug 2024 05:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWXFFrqF7jEACs/vjXZynr3mlRXA4KoVr/szdxXifNlUQpmZ78stjsP7LYQ+pbSsvCJWHNB94E8LTSJkPZ+6U=
X-Received: by 2002:ac8:6905:0:b0:453:5b3f:2a39 with SMTP id
 d75a77b69052e-45367845732mr58163351cf.1.1723724054897; Thu, 15 Aug 2024
 05:14:14 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Aug 2024 05:14:14 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx> <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx> <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
Mime-Version: 1.0
Date: Thu, 15 Aug 2024 05:14:14 -0700
Message-ID: <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_051418_785722_7C97C995 
X-CRM114-Status: GOOD (  19.76  )
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

Emil Renner Berthing wrote:
> Thomas Gleixner wrote:
> > On Thu, Aug 15 2024 at 03:29, Emil Renner Berthing wrote:
> > > Thomas Gleixner wrote:
> > > Thanks for looking at this! Unfortunately the above patch isn't enough to fix
> > > the issue:
> > >
> > > https://termbin.com/7sgc
> > >
> > > It still hangs after the "[    0.176451] cpuidle: using governor teo" message
> > > until the watchdog reboots the systems.
> >
> > So what's puzzling is that there is a timer installed early on:
> >
> > [    0.000000] clocksource: riscv_clocksource: ....
> >
> > That same init function installs the per cpu riscv clockevent, so there
> > should be a timer available.
> >
> > The deffered probing of the PLIC driver delays obviously the probing of
> > the sun4i timer, but that should not matter when another timer is
> > available. So the sun4i driver might be a red herring.
> >
> > Can you please add "ignore_loglevel initcall_debug" to the command line
> > and provide the output of a booting and a failing kernel?
>
> 6.11-rc3 + these reverts:  https://termbin.com/q6wk
> 6.11-rc3 + Samuel's patch: https://termbin.com/7cgs

I think this confirms what Charlie found here:
https://lore.kernel.org/linux-riscv/ZoydV7vad5JWIcZb@ghost/

>
> > And on the booting kernel please provide the output from:
> >
> > # cat /sys/devices/system/clockevents/clockevent0/current_device
> > # cat /sys/devices/system/clockevents/broadcast/current_device
> > # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
>
> On both a 6.8.6 kernel and 6.11-rc3 + reverts I get:
>
>   # cat /sys/devices/system/clockevents/clockevent0/current_device
>   sun4i_tick
>   # cat /sys/devices/system/clockevents/broadcast/current_device
>   riscv_timer_clockevent
>   # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
>   riscv_clocksource
>
> /Emil
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
