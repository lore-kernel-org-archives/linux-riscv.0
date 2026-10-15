Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12597CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVBDyvFXIcbdSWvzFINvCACxUpORDcR8cOjBO4jAtus=; b=q2rKyKZ+qjG2Tg
	6OOGaiAuUYxN8qFlO4+8LV1NBsX9kXmxBUTu3txJb2ronOkQVU4yZTtkSzrVsIcpBCU+dTeO2xLYk
	DPPjkuT91FfCZMlmTRIIdyeNVChxT3IrGSo3VlBCvTChExYQemD8Kjg++WRHwXA7iso0uayJ59rqf
	Ez31ZcvoK7/Rt3wbGEtXwe6iMIQBFjfEuRMKHMtnwFaVijKgEso3mvntxFqGKCch9dga1sKcGy/+2
	Le2w4rHfxwUo2NtUiUnCNlb28PCA79SZn+CVXyW/xJ/qQqpHJZgS6uLs6OZ1Lo7gobJEqK3mEcySm
	6K6EnLe2L8617/Pt21gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKGB-000000003aJ-0XGK;
	Thu, 15 Oct 2026 12:08:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKG9-000000003aA-3nts
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 12:08:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54B9843C37;
	Thu, 15 Oct 2026 12:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3459F1F000C4;
	Thu, 15 Oct 2026 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066113;
	bh=dn5PpHk1Moxd3JWutzvn/KsD0M1gf1ufaWfC4bJDCiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WgZyX1P6AzV7X/pRDGW1J8Kg8XUP0oligz6kvE7uF6zhh2ZsZ38xqhVZnNZpYss3f
	 vEIGIoyE2ijf3Zc8vRJOpAlIYKl2kmWzftrQrK5ZJkT34UjL/EHKI3ME8EzPYbDd1J
	 7JJswDv1rC0E8pO6dKx+SW0ocTB05GZ7YdblyNmex15usxcM6HEta7vRmdGj3zZouV
	 r4xXyPGWSSUNKT5/jS/RRyVb/XuAKue3s2kCZ7fhWCDbJqEp+7tjmH3VjxXgadHg29
	 7OU8jt8h0O8nianzB1PZpGcuNx3fE95CwalSZ70XvFOfz4HaV+AST7qCz2aW3hjLli
	 F2jpiB8pY9IzA==
Date: Thu, 15 Oct 2026 19:48:29 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend
 on MMU
Message-ID: <atC9jZIF1T1x0w1X@xhacker>
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
 <atAQAI0WWtwh8kvf@xhacker>
 <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
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

On Thu, Oct 15, 2026 at 09:43:40AM +0200, Geert Uytterhoeven wrote:
> Hi Jisheng,
> 
> On Thu, 15 Oct 2026 at 01:48, Jisheng Zhang <jszhang@kernel.org> wrote:
> > On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> > > These options are irreleant for nommu systems.
> > >
> > > Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
> > >
> > >  config RISCV_ISA_SV48
> > >       bool "Page-Based 48-bit Virtual-Memory System"
> > > -     depends on 64BIT
> > > +     depends on 64BIT && MMU
> > >       default y
> > >       help
> > >         Add support for the Page-Based 48-bit Virtual-Memory System.
> > > @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
> > >
> > >  config RISCV_ISA_SV57
> > >       bool "Page-Based 57-bit Virtual-Memory System"
> > > -     depends on 64BIT
> > > +     depends on 64BIT && MMU
> >
> > hmm, I think we also need to make RISCV_ISA_SV57 depend on
> > RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
> > !RISCV_ISA_SV48. Human won't make this wrong combination, but
> > the random config can.
> 
> Is that really an issue?
> If I build a kernel for an SV57-system, do I really need to enable
> support for SV48, too? It builds fine without...

This is to align with the spec:
"implementations that support Sv57 must also support Sv48"


> 
> > with that change,
> > Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
