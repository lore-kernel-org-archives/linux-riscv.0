Return-Path: <SRS0=/4Rd=NY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA12C432BE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Sep 2021 00:19:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F3760FC0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Sep 2021 00:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79F3760FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ej9a2EJMrCDAyOOKwfHYm3uLLDmTuBD9yf13HyM0pPQ=; b=Sv9yiCpsk2J+xb
	p2KL70/IcD4T5C/aWmvWgksOHNIq9WWpG9havLa1gwfQ1KW6FMCYzzroKec984DH/ImAshePgTpiZ
	Hcq+EnKoeq3xmgsPAByRh2NBS+xbvRIpkIU4fdtTHtiXG0hoOgxMVbdblYpuDZ+i0pj1f+xOFAimL
	zX0sXcRUoybBr/4evCLDc3TYHW7yn7DphyFgPvqPDSWA7hiCbNbQTZuGwsV5j7qpDVovcbRBvDBIZ
	RitAZOyexKEItIVXPZSF6bkpV5SLsTG7ydpEZqGfJfuSOKTjBkqTamelyhhZMmCyorGApqEO70E1t
	r8CDzTLFq2Z5uTL35lzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLaRO-007yfp-7t; Thu, 02 Sep 2021 00:18:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLaRL-007yfO-TD
 for linux-riscv@lists.infradead.org; Thu, 02 Sep 2021 00:18:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19826610A8
 for <linux-riscv@lists.infradead.org>; Thu,  2 Sep 2021 00:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630541925;
 bh=wTvLeD55f/+cT30LFk/ZUgKiLqiOwst0EprdgeqjHco=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W5rwDc+WtZTjMsZXQP/vmM2B3QxWtYh7u9gR9LKrnv82l4ifBZGyKEdYZflIPoB9y
 AcJyT5lvGIvbGECjfQlSYMDiUU9a5sB9T/2jIGwQGqzO4xziNiOht9eit/OXdkguxL
 ZDDLv13iCfD4wNvXdYVmnAWnBfqNbCRZHHLHiAxf47tKeDFtY11ANr6ITf78eI4cfT
 hmPflu3jjKeL8PvSMKw8auBs+yWRCXAUN2ziNB55jpVTNQ1mAnO/ObS1glGL6CvWo3
 yP7BJU1zq/eidcYqFI31XR/gwo6UUKHs4KGMPfuIDnPIDRA4H/jcffFhWCXdiE59pn
 OjC6jZuiyR8xw==
Received: by mail-ed1-f43.google.com with SMTP id z19so128171edi.9
 for <linux-riscv@lists.infradead.org>; Wed, 01 Sep 2021 17:18:45 -0700 (PDT)
X-Gm-Message-State: AOAM533X1IrZjUO7EsErYo86TtYGibUmhZ8dY2FbTgbSNJsEBeW/w+vN
 0cfwDCm5X3EV/y5xo/DD+eLKpb+LFI5Whu+FMw==
X-Google-Smtp-Source: ABdhPJw/7oq9uNIa4Chpq9FqQ2f/nRpfYy4Edcpxq276fzkXwPouM5aTdUgqjj1eGflUgkM8vSZ7aYo8+GzJ6W4bfGM=
X-Received: by 2002:a50:9b52:: with SMTP id a18mr586841edj.165.1630541923672; 
 Wed, 01 Sep 2021 17:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210830041729.237252-1-anup.patel@wdc.com>
 <20210830041729.237252-7-anup.patel@wdc.com>
 <YS7Xk/Np2yc1/wrb@robh.at.kernel.org>
 <CAAhSdy2e8bPXkTodpbtNeEVX-iCxVeyNLYBkL0aCQBZ7wbSCzw@mail.gmail.com>
In-Reply-To: <CAAhSdy2e8bPXkTodpbtNeEVX-iCxVeyNLYBkL0aCQBZ7wbSCzw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 Sep 2021 19:18:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ_Uc5UqCFojUYioXYJycbcBCF-nGryJiTMkhkN5MJhpw@mail.gmail.com>
Message-ID: <CAL_JsqJ_Uc5UqCFojUYioXYJycbcBCF-nGryJiTMkhkN5MJhpw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 06/11] dt-bindings: timer: Update SiFive CLINT
 bindings for IPI support
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_171848_005500_C653A632 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Sep 1, 2021 at 7:00 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Sep 1, 2021 at 6:59 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Aug 30, 2021 at 09:47:24AM +0530, Anup Patel wrote:
> > > The Linux RISC-V now treats IPIs as regular per-CPU IRQs. This means
> > > we have to create a IPI interrupt domain to use CLINT IPI functionality
> > > hence requiring a "interrupt-controller" and "#interrupt-cells" DT
> > > property in CLINT DT nodes.
> > >
> > > Impact of this CLINT DT bindings change only affects Linux RISC-V
> > > NoMMU kernel and has no effect of existing M-mode runtime firmwares
> > > (i.e. OpenSBI).
> >
> > It appears to me you should fix Linux to not need these 2 useless
> > properties. I say useless because #interrupt-cells being 0 is pretty
> > useless.
>
> Linux IRQCHIP framework only probes IRQCHIP DT nodes which
> have "interrupt-controller" DT property.

Right, I believe I wrote that... So what would it look like to fix
that? The simplest thing is just drop the check for
'interrupt-controller'. That's just a sanity check and we have other
ways to do that now (schemas). Do you need this early? You can always
implement your own initcall.


> The "interrupt-cells" DT property
> can be removed because as an interrupt controller SiFive CLINT
> will only provide IPIs to arch code.

The schema will disagree.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
