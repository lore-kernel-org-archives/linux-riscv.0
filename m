Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9116C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 21:09:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA95F61152
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA95F61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLQ0Fda1CIq3V1v/Y6dFOM7T8P2K7v0H6M8epBxviZM=; b=126kfkOV+h3Z7s
	33zk0bnzlCPGJtBgM3PiSJ3QApw8aETNI+HCtG30sFal8BAnFEpfIaDLrS/EIqEg1Tz0RIaBJLy2c
	GiLDHZzM1o/JLs2UnqC38fE8pHCFTdgH4Rs4Dy4dYoKw1JoPs36OQMZXL2t71J/M1Jv0EG6oF8fNo
	4iAuMa9mwWQsNKCPbFZ7e0UXXMTv8XMjQ9ykKBLW/fUmzTDE8w8mks/8JxetLk5oy+g0skGbcpOxF
	I14E69ZezM+bMC9qL7c2/Wk19OGCaUie/+XSrFuDwU25P/IuFhWD1mP9ZHZL6tfCtWn1J7oz9Wl4e
	SjNl+t9JGyE//Yu8Z7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYEA8-00FZ2J-VK; Wed, 06 Oct 2021 21:09:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYE9v-00FYxn-Bo; Wed, 06 Oct 2021 21:09:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 042E661186;
 Wed,  6 Oct 2021 21:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633554543;
 bh=7y2OqyGeh/YLbNHB3wW+VV17BTzd0SdtkHXCJgfSaiI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nmyVFfa80O5jZzsTcWIcZuAWEEEYF5NMOGDJXloUs+HRxAEEH5lLT3+3RYK6Qqv+f
 js9uiqolmcT0fZgILXxH/QHLHIv4vmDZZ1X2i5af6VH4P98HIuAQYpxVJ4/7bT2+87
 Tjx8r1WkBDD7aSgBiCUPFipbZMECUQSBJ5yHn5HdJltv8lq0GTNgvwFMkrtaTgW5lU
 cyKcZQj895rFUK4Smg+M5r4VOrvHAz8DJaTYZqb74axtMNPKSRUfbQ831Ibj/tE0qK
 EwSFRMvR6MzkHYXmgT0UCSpCw0MFsEce/S/w+DfAw/75yD3oIS+r4Ix6KEpR6mRR79
 9GIX+zZ3aI+EQ==
Received: by mail-wr1-f53.google.com with SMTP id u18so12668777wrg.5;
 Wed, 06 Oct 2021 14:09:02 -0700 (PDT)
X-Gm-Message-State: AOAM5300nJtRQOa0STnDVJA12AgDy+xxVLDoHmSCFEuuCl5+q/MGRz9b
 SiQv/tWpXmo9CaRa6cOjwL4CdH3qV9HT4klFSA==
X-Google-Smtp-Source: ABdhPJymkbNsN9aT73y46BJl6usZeJjKrfNWWvIOkuSTs2FD7IqIC9KCjaQE7Xpsh+yBqmdTH3WZm/Iyih4k6MZ6upc=
X-Received: by 2002:a05:6402:44c:: with SMTP id
 p12mr678627edw.145.1633554530546; 
 Wed, 06 Oct 2021 14:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
In-Reply-To: <YV4KkAC2p9D4yCnH@antec>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Oct 2021 16:08:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
Message-ID: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
To: Stafford Horne <shorne@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, X86 ML <x86@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Openrisc <openrisc@lists.librecores.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 SH-Linux <linux-sh@vger.kernel.org>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_140903_460742_B25AAA6F 
X-CRM114-Status: GOOD (  20.24  )
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

On Wed, Oct 6, 2021 at 3:44 PM Stafford Horne <shorne@gmail.com> wrote:
>
> On Wed, Oct 06, 2021 at 11:43:26AM -0500, Rob Herring wrote:
> > Replace open coded parsing of CPU nodes' 'reg' property with
> > of_get_cpu_hwid().
> >
> > Cc: Jonas Bonn <jonas@southpole.se>
> > Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> > Cc: Stafford Horne <shorne@gmail.com>
> > Cc: openrisc@lists.librecores.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  arch/openrisc/kernel/smp.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> > index 415e209732a3..7d5a4f303a5a 100644
> > --- a/arch/openrisc/kernel/smp.c
> > +++ b/arch/openrisc/kernel/smp.c
> > @@ -65,11 +65,7 @@ void __init smp_init_cpus(void)
> >       u32 cpu_id;
> >
> >       for_each_of_cpu_node(cpu) {
> > -             if (of_property_read_u32(cpu, "reg", &cpu_id)) {
> > -                     pr_warn("%s missing reg property", cpu->full_name);
> > -                     continue;
> > -             }
> > -
> > +             cpu_id = of_get_cpu_hwid(cpu);

Oops, that should be: of_get_cpu_hwid(cpu, 0);

I thought I double checked all those...

> You have defined of_get_cpu_hwid to return u64, will this create compiler
> warnings when since we are storing a u64 into a u32?

I'm counting on the caller to know the max size for their platform.

>
> It seems only if we make with W=3.
>
> I thought we usually warned on this.  Oh well, for the openrisc bits.

That's only on ptr truncation I think.

> Acked-by: Stafford Horne <shorne@gmail.com>
>
> >               if (cpu_id < NR_CPUS)
> >                       set_cpu_possible(cpu_id, true);
> >       }
> > --
> > 2.30.2
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
