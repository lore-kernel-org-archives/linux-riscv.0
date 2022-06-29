Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927FAC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rvd7Z3zL8sItBjnkbtGlabb7MbHCHNeUYfMSCi5DQk=; b=Yb+IrrW0Fv6EdgQyA4xghj79XK
	o1Q6F0P1F/4W4fQXtCkAqQD9GhAH5Zvtagd+21BNDhAt7fXxJDuIDmXLbgmRcSXglpAbtiU+sz350
	7QW5mHyao9vqt261vQFb3RwXOrBRykB698dvDMEnkbkKRR+wlWHK1bTpr+rbIk2A88/lGr8QPgOpf
	l4J03HZW3mrIrwVzZWTx91TFw6DtHuFhQJAMBzf2sHh6u3BweBoHrOg2sU2WwTnKkRlfJpVnAYPX6
	skXPktrM0w+1SYc8A6C5KiBw0RaOEPC7XTQeZ0E8hojE70c9Le+N5fzR+5/IyhkHkz4zzUd4iU9Iz
	qA9Gai0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ZB7-00Cca0-6a; Wed, 29 Jun 2022 15:00:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ZB4-00CcZU-Bj
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 15:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 956DD61F10;
	Wed, 29 Jun 2022 15:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDF3C34114;
	Wed, 29 Jun 2022 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656514825;
	bh=C99oNYplt1WvYeLmndjR6iicXGPvkgfMnkOoPBfW4/I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nGmcLvwbijS2KPQumHseuOPhSqO1YMl1BcDwtmKkgJSaPZcQKn32Gn2Cjtvt/Zvjq
	 qNbZXxCeptg8Hlwi9wGYTD5tOJuKS7o/YgdFx9WRS74YEFdvfz31x+bpWw10Q//OEW
	 I42QcXHM5mvQPh4rIqVgDZqBKJEf4vDCcUpKCv7d88JZZnnNDEMJlFzloe9QG/iikx
	 hRQZkOwMKOycuIeOk7ZBjvtOB7BnQE5xlD6pN4q/x59Ipw+Jlo34A1R1cjEQtNTAB4
	 8NQwJdWZWX0r3ycvK0GM0d1ewI86lr/uAjvmF4iFcblBrbudcS16YOPp+jcqoBVuJb
	 fdgmcTkN4rlhg==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1o6ZB0-0046Na-LB;
	Wed, 29 Jun 2022 16:00:22 +0100
MIME-Version: 1.0
Date: Wed, 29 Jun 2022 16:00:22 +0100
From: Marc Zyngier <maz@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
In-Reply-To: <20220629134147.GA16868@duo.ucw.cz>
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87wnd3erab.wl-maz@kernel.org>
 <CA+V-a8tcxj_N0sBHhgAZAN8WSJ12JnDzAvUUnCXto3wHLqNVwg@mail.gmail.com>
 <87v8snehwi.wl-maz@kernel.org>
 <CAMuHMdVt9FjCtvMgJcCh=g2b+8b-fgabGbOLDcXNrrPMpC+3jQ@mail.gmail.com>
 <CA+V-a8uLzLJ=wB6oUu0b2oZO=FPSCTSrqb=3m9=BJxATFKmjMw@mail.gmail.com>
 <CAMuHMdUWC_7MPnP6LcOqi96FAhrAENC4iwtv2ksZVnvR8BC4ww@mail.gmail.com>
 <0fdbfdd0ee1c7ca39f8d3e2f86af1194@kernel.org>
 <CA+V-a8u8X+bne_a3LY13zGTKr-hOWhm=R9gGX1JyE8PzWRNXpQ@mail.gmail.com>
 <20220629134147.GA16868@duo.ucw.cz>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <632a70d4d9b434cb126cecb015c69797@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: pavel@ucw.cz, prabhakar.csengg@gmail.com, geert@linux-m68k.org, prabhakar.mahadev-lad.rj@bp.renesas.com, tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sagar.kadam@sifive.com, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_080026_549410_72D53A7D 
X-CRM114-Status: GOOD (  20.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-06-29 14:41, Pavel Machek wrote:
> Hi!
> 
>> > >> +#define PLIC_QUIRK_EDGE_INTERRUPT      BIT(0)
>> > >>
>> > >>  struct plic_priv {
>> > >>         struct cpumask lmask;
>> > >>         struct irq_domain *irqdomain;
>> > >>         void __iomem *regs;
>> > >> +       u32 plic_quirks;
>> > >>  };
>> > >>
>> > >> What about something like above?
>> > >
>> > > LGTM.
>> > >
>> > > Marc suggested to make this unsigned long, but TBH, that won't make
>> > > much of a difference.  PLICs are present on RV32 SoCs, too, so you
>> > > cannot rely on having more than 32 bits anyway.
>> >
>> > But it will make a difference on a 64bit platform, as we want to
>> > use test_bit() and co to check for features.
>> >
>> Ok will change that to unsigned long and use the test_bit/set_bit 
>> instead.
> 
> Is there good enough reason for that? test_bit/... are when you need
> atomicity, and that's not the case here. Plain old & ... should be
> enough.

On any save architecture, '&' and test_bit() are the same thing.
Only RMW operations require atomicity.

'unsigned long' is is.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
