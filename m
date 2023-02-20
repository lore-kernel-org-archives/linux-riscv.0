Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0FCC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0vBwBDTCZEtT3dZLUT0ZKHwZieIZAOMHIFX3do3lRA=; b=skF2Nw/IAOB94i
	8d+nDm1wRXSbMTcOQhtjY87BDvzfVNOvYwO+Vtl1e9W/6ZxPJCvPOWxspY/HNkJSqWnBwKbP99sqt
	0bhtv7k6s/G/nxYyY+zW39pY8604/Rd3RampIzL7GYLk0vTR1CMGDJlL1t9IxLgSkRDesMkHyoIci
	QVVAWEFB36dN4dAtrhMDbrV15ZKm1Hh5oUBkbcEhn4nZ0HRHycBgnLTyzIL8T9Gcr9gZY9mrUInZN
	wbMHRj/zCwOgZMSlqpWZCwUrNId4wf7ISHTR4/JREQ0zAH9qwH7VYakx+YVWD5JC3cYjg8huoqC/x
	Tmig6bv3bbqQl2cQ9fvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2pE-003YQq-5H; Mon, 20 Feb 2023 09:51:12 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2p9-003YPK-G5
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 09:51:10 +0000
Received: by mail-vs1-xe33.google.com with SMTP id df34so1922771vsb.6
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ubrSGGpo/lB1Nbx8tNcTbrObPXZHojbGZX+fWT2u70=;
        b=AlIFBSPCK/k3ooNjwrY3lEN2lm36QZxhwfzlGT3bvzW8aQz4IqFW7iJ3DySrB1UU3R
         hGKjfUpWjD4Mq1shhoT4OyOZrRIJAcqgzCJUrkRPx3ViLm6dzXSyIrSTtTyVY12ig6an
         DFu0ryJzx7wuiFcWiKQ+OcdPJIYmLnH7VNHAY0aJHF+cDgE7Jlj1JDHQ5sQ+IRVz7+CX
         5EwaYEnsOkHn4ipR/mVJCwcrf+hwMcfzu7BVYnOzNelFy/Zyz0CfOH0TSQk4FqlddsOP
         +fvjdjTLHl3LhxMm7zQkcNhsNmcASPhgg4eU8dDSxP9aUrFk7UedzqupicNRIZJ8AaIe
         MBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ubrSGGpo/lB1Nbx8tNcTbrObPXZHojbGZX+fWT2u70=;
        b=GoKD9Ne1pBjRsChtCw3/0oHlJN6QSwnymNDS21kNgCfZfIAU5XIGpSXMZJUoRVRu4v
         udedq/hyrmsghmMqJ8ECxuuJ/Do7wHVnL9EpNhiH4ez4AC+9+bbCVbcX/LixjK07i9bM
         OXFAb2LDtU4OPRb2biuLCCp3bUYvNCcp/5wtVQxESgxNs0VjBsb6N5Er9k38NCuV0RhE
         AuTxjFtEYcZFZXgSD5taTxFIUdzMTcW2DzDEJhl2KGlWxPJ9I5FWM8R6oqXHlBG2hHgl
         nDwBmQq8rSDOAOUtM1CZHMFG8N5ZkG+YapUO8dltjLUGb0vL09+rCDZOQh+Tv3CZ7QdO
         ATzw==
X-Gm-Message-State: AO0yUKXRg9Qou6L/UQtLoxCs57E3MHUtgcme79Wy3maMsGeeOjHhe/4C
	JPyvnzFO1BdrGO0q1JuGMLxKCiKqb/IHsAEAAHHdZQ==
X-Google-Smtp-Source: AK7set8Fjc384404hhcu1ncWe0+xFejdg760zKN5yMZ6v+4ljTHJn2PYDr/3cyvciFET+aE/LrM8fImcsdeLrAWw1kM=
X-Received: by 2002:a05:6102:a05:b0:412:1c0a:1cbe with SMTP id
 t5-20020a0561020a0500b004121c0a1cbemr476510vsa.58.1676886660624; Mon, 20 Feb
 2023 01:51:00 -0800 (PST)
MIME-Version: 1.0
References: <mhng-a886c4b4-d748-420f-889b-76ada4f9a432@palmer-ri-x1c9> <0a0d1a182cef674a8e70347b2ed6f67b@kernel.org>
In-Reply-To: <0a0d1a182cef674a8e70347b2ed6f67b@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Feb 2023 15:20:47 +0530
Message-ID: <CAK9=C2UkeTRipSjhU6dNWjSOmpZu4S9QFpTE_ycpdZDy0EfJEQ@mail.gmail.com>
Subject: Re: [PATCH v16 0/9] RISC-V IPI Improvements
To: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, 
	daniel.lezcano@linaro.org, marcan@marcan.st, sven@svenpeter.dev, 
	alyssa@rosenzweig.io, atishp@atishpatra.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, anup@brainfault.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_015107_561067_89842BEE 
X-CRM114-Status: GOOD (  25.30  )
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

On Mon, Feb 20, 2023 at 2:05 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2023-02-15 03:17, Palmer Dabbelt wrote:
> > On Sun, 05 Feb 2023 03:04:14 PST (-0800), Marc Zyngier wrote:
> >> On Tue, 03 Jan 2023 14:12:12 +0000,
> >> Anup Patel <apatel@ventanamicro.com> wrote:
> >>>
> >>> This series aims to improve IPI support in Linux RISC-V in following
> >>> ways:
> >>>  1) Treat IPIs as normal per-CPU interrupts instead of having custom
> >>> RISC-V
> >>>     specific hooks. This also makes Linux RISC-V IPI support aligned
> >>> with
> >>>     other architectures.
> >>>  2) Remote TLB flushes and icache flushes should prefer local IPIs
> >>> instead
> >>>     of SBI calls whenever we have specialized hardware (such as
> >>> RISC-V AIA
> >>>     IMSIC and RISC-V SWI) which allows S-mode software to directly
> >>> inject
> >>>     IPIs without any assistance from M-mode runtime firmware.
> >>
> >> [...]
> >>
> >> I'm queuing patches 3 and 9 via the irqchip tree as they are
> >> standalone.
> >>
> >> For the rest, I need an Ack from the riscv maintainers as they change
> >> a large amount of arch-specific code, and the couple of irqchip
> >> patches depend on these changes.
> >>
> >> Palmer, Paul?
> >
> > I haven't gotten time to give this a proper review, but I think we've
> > got enough of a mess with our interrupt handling that it doesn't
> > really matter so
> >
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > if you want to take it for this cycle that's fine with me, but I'm
> > also fine holding off so it can have a while to bake in linux-next --
> > there's no real rush for any of this, as there's no hardware yet.
>
> Letting this sort of things simmering in -next is the way.
>
> Now that the basic dependencies are on their way, I'd expect this to be
> rebased on 6.3-rc1, and we can then put the whole thing in -next.

Okay, I will rebase on 6.3-rc1 whenever it is available.

Thanks,
Anup

>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
