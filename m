Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9913DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 15:19:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547AF6135F
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 15:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 547AF6135F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bluespec.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOiGkKqjZBx6NWS9AGD5awXMEoR/1YbsjVpvwGFFSXo=; b=aCatatPQfbcLYC
	Z81v4CH8xPE9ZN14is2I7g+Smh2uD5tish6G1MjdGOz6OwbXkaOB0EYNGcEommxkL28Iw4uHmKBpD
	UlCUgkE540ZIerk+vKZGt+cDuZ+VTE9qYFpzMPoS8Gm/GNDdLZ4BAN6gwUSPR3FgPuhQwPqBYs+oC
	NqxhNTGaASFkFofzx+JLk8KNGsQGa7cxNZX78gKt4ad464GfsohaM25+bQKwcITnvv1xMOb8CcgtN
	f7uGa9iVjYVAKrzHu2diYg5RC2wQGs1sHwgleoYUD7BurVktbAj76f/Q05y31garl/h+/bzlSDPUp
	F4HMrAJErf4KwfTriA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDNI-004y9i-Pk; Wed, 20 Oct 2021 15:19:28 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdD4T-004sPR-TY
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 15:00:03 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id v10so2212220qvb.10
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bluespec-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=j/3Lv9j5XzeFoUK9c1kkMM7KIVmL+kIELhS5/SrGfhA=;
 b=YjVtXyEvQFtd4T9i9G5ZZZiAj2qe//i+Ji5oXF9x/MnnQgZGzMzR/fvzW8tVjWuEWA
 JBtkOs8i1VkDvOEakUBdoRkl5A81jjmgHjy08+5til/e8qH3bUQUtYd2v01yosHlJZRV
 RrzAF/j3m9L1upbUvYqHP1pVKTGn9fGJKevh6Z/i9J5lTHpnyThfEQYVl+PSVGmgJ6UK
 UZS4FykPD2Rgzi4vC5OZr3EAMQGRjjw7rGgo4fFZvz0w1AdSYaB0arRctp7Cs4q304FE
 vRZMJ1sDbpXwcHoI+lWn1puf0iJO5A/3ADOEJzZbR+nzf5luddUM7qSLllk0cespH7WS
 eY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=j/3Lv9j5XzeFoUK9c1kkMM7KIVmL+kIELhS5/SrGfhA=;
 b=wKVLpgfzKPYmkkPjA02LQ1LEG6QgMB0QBf8J4pEXMA5JzzNqZu12ZIt+AGcL5lMDM+
 23EVz1XA5Z/zm1s862lsjd9lS6tH61yH8a0MdoGs8ITI5ZM8VeSOTlOjFUrVs3P15ioU
 AnfYm+25WezFflUvHmgwH7uawKlqeII3LioKo6qoNfNkU1pxmBwYDiktQPRonua+kbRf
 fV7rY2xp1JuHuiS0qq+XSftp8+TGQnarR4KmZOcP8NKR2rzlYOcvAWW0wWTgnrUuZ8Xz
 hrvBK2rV/d9ZW2yx+Dfhu/cptnSH5aOARsuBnPpWY3oCr6WGjJJWsMxT8UPClpSw+XvW
 TpNA==
X-Gm-Message-State: AOAM530YMpcA7s46e/f8XrBOWs6+JDWYxPBMyKtlnXQyvih6GPBai4YR
 Un5VrvmT9bJgquByDO1sL79mnROLJm3QQtM=
X-Google-Smtp-Source: ABdhPJzZ/4QzxOv7PQ5H1OdzxglnPuk0q2J/oj5pG9FIBpfMSqvpv6BInjM3vQzOlGhHxM3XTO1B0Q==
X-Received: by 2002:a0c:e210:: with SMTP id q16mr153314qvl.46.1634741998834;
 Wed, 20 Oct 2021 07:59:58 -0700 (PDT)
Received: from bruce.bluespec.com ([154.3.44.94])
 by smtp.gmail.com with ESMTPSA id e13sm1083272qka.117.2021.10.20.07.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:59:58 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:59:56 -0400
From: Darius Rad <darius@bluespec.com>
To: Guo Ren <guoren@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
Message-ID: <YXAu7OS82G1k28bZ@bruce.bluespec.com>
Mail-Followup-To: Guo Ren <guoren@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
 <CAJF2gTRfBxXnG57Y+9z0O+GfwgoB9POmb=HL=CMCpu=uwfYY3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRfBxXnG57Y+9z0O+GfwgoB9POmb=HL=CMCpu=uwfYY3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_080002_083729_FD156A95 
X-CRM114-Status: GOOD (  29.18  )
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

On Wed, Oct 20, 2021 at 10:19:06PM +0800, Guo Ren wrote:
> On Wed, Oct 20, 2021 at 9:34 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Tue, 19 Oct 2021 14:27:02 +0100,
> > Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > > Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > > in a separate bit, then you need to track this by yourself in the
> > > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > > breaks
> > > > > > the HW interrupt state or not.
> > > > > The problem is when enable bit is 0 for that irq_number,
> > > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > > the hw state machine. Then this irq would enter in ack state and no
> > > > > continues irqs could come in.
> > > >
> > > > Really? This means that you cannot mask an interrupt while it is being
> > > > handled? How great...
> > > If the completion ID does not match an interrupt source that is
> > > currently enabled for the target, the completion is silently ignored.
> > > So, C9xx completion depends on enable-bit.
> >
> > Is that what the PLIC spec says? Or what your implementation does? I
> > can understand that one implementation would be broken, but if the
> > PLIC architecture itself is broken, that's far more concerning.
> 
> Here is the description of Interrupt Completion in PLIC spec [1]:
> 
> The PLIC signals it has completed executing an interrupt handler by
> writing the interrupt ID it received from the claim to the claim/complete
> register. The PLIC does not check whether the completion ID is the same
> as the last claim ID for that target. If the completion ID does not match
> an interrupt source that is currently enabled for the target, the
>                                       ^^ ^^^^^^^^^ ^^^^^^^
> completion is silently ignored.
> 
> [1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
> 
> Did we misunderstand the PLIC spec?
> 

That clause sounds to me like it is due to the SiFive implementation, which
the RISC-V PLIC specification is based on.  Since the PLIC spec is still a
draft I would expect it to change before release.                                                                                                                      

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
