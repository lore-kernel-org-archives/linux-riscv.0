Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343F9C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 14:19:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4839610E6
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 14:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4839610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4O33PAW3KAapcCSt6lf0i1nX8cT91ItKliKw3BgYC0=; b=HfYgHCKtqbxo5H
	JzbI8hL2BhqMDAPU1YVugmzUXhQlVZ6UNtOBzyanTQJIzPA3CtCJwnEnq9EC5w69FYqUK9nIrA2BN
	pTxAVKn4jlvoEtxNGrp5SZMc5Sw/bhThWywk5VTFJx/3x2u98OX3kQxj1jmDdqdlZpasrazpCdhaJ
	m82JulgDaTDD6jV+zxBoyqkqH95ebSGLvUBFKfMtdMi4odq9U67Z9ZQNGS7fZLX9PvxhM7h8iDiCA
	vbtmvLfeHI2DRl3h0qu07H2owtJdzawvvUDATR0PiDaT5VMS0OCRi87h4D5PazfTXngTZ6gb2zXoP
	hp/2KNW5+M5l9ozovrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdCR8-004jYI-Jk; Wed, 20 Oct 2021 14:19:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCR5-004jXh-1d
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 14:19:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80D7561130
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634739558;
 bh=fmi+0bD2m3tiuIJS1w2in+x3YNM1wstFL0HPNrVRe8w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nM3r90b+dwpLL60m0jQscBK0+9Dy10kOWm8uy3/ZKXvif0JDmcnttvbMSqaGcQdLD
 2pHlz2QbN3JzW7UNHBX4lhtaqgzf4U+qF4SQVX3zDuZ8+rVuUlWEqHDf9CPhyrNgBQ
 Xx0AId1V0cQVBKlDBQo3+/XzyWBC71teBm/ATWEkXVDIvs6Ll5RwJUtvSP/mxugprK
 82HFFUsNi7APytpsZdVE8PQH20BU/jU8siZjU7+ozj15+Z6RWZNh7Se5vYoDj/HPzY
 ebPRveXrldpuKIXDineCR7swtCwqJSh7qhdme95Q+y+qweD8vRoWoZzrN099ojeNxO
 WucXNcR8pUNpQ==
Received: by mail-ua1-f51.google.com with SMTP id f3so6902707uap.6
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 07:19:18 -0700 (PDT)
X-Gm-Message-State: AOAM532n4nJNanx1sn/hCFdKUxGWbAIqOuXuCutT7YJbtFMynBOj039b
 u7+cKb8DMSqGClm5dlr0btfikwhW9TVaxZtJ+K0=
X-Google-Smtp-Source: ABdhPJxZX28p4AF2/Hb9dreu2KHUeZrpaHIutQS8IPPcSp3vbwrlkYw+gqn6YZxqPEz2uCrP8JhM/gweaUQ8SVFl0Lc=
X-Received: by 2002:ab0:5b59:: with SMTP id v25mr7354848uae.57.1634739556855; 
 Wed, 20 Oct 2021 07:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
In-Reply-To: <875ytrddma.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Oct 2021 22:19:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRfBxXnG57Y+9z0O+GfwgoB9POmb=HL=CMCpu=uwfYY3w@mail.gmail.com>
Message-ID: <CAJF2gTRfBxXnG57Y+9z0O+GfwgoB9POmb=HL=CMCpu=uwfYY3w@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Marc Zyngier <maz@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_071919_149513_268F46F0 
X-CRM114-Status: GOOD (  26.61  )
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

On Wed, Oct 20, 2021 at 9:34 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 19 Oct 2021 14:27:02 +0100,
> Guo Ren <guoren@kernel.org> wrote:
> >
> > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > Guo Ren <guoren@kernel.org> wrote:
> > >
> > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > in a separate bit, then you need to track this by yourself in the
> > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > breaks
> > > > > the HW interrupt state or not.
> > > > The problem is when enable bit is 0 for that irq_number,
> > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > the hw state machine. Then this irq would enter in ack state and no
> > > > continues irqs could come in.
> > >
> > > Really? This means that you cannot mask an interrupt while it is being
> > > handled? How great...
> > If the completion ID does not match an interrupt source that is
> > currently enabled for the target, the completion is silently ignored.
> > So, C9xx completion depends on enable-bit.
>
> Is that what the PLIC spec says? Or what your implementation does? I
> can understand that one implementation would be broken, but if the
> PLIC architecture itself is broken, that's far more concerning.

Here is the description of Interrupt Completion in PLIC spec [1]:

The PLIC signals it has completed executing an interrupt handler by
writing the interrupt ID it received from the claim to the claim/complete
register. The PLIC does not check whether the completion ID is the same
as the last claim ID for that target. If the completion ID does not match
an interrupt source that is currently enabled for the target, the
                                      ^^ ^^^^^^^^^ ^^^^^^^
completion is silently ignored.

[1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc

Did we misunderstand the PLIC spec?

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
