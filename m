Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9959C531DC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x296gniGixQpANZcFJGPJbPGE9ArVo06WKGzCYwe2pk=; b=ZLgdF87qZ40WOu
	pAy/7qj/IJ7mKzXCEwUo6qIwP1zA/PkFZfRxQSVvp2cEqYnX5UICiDGzbwSugJzTJ4aSrAszxhLi8
	7mHwrHEB+xKbgejNOyfHLiZVj8wGGKFI3D2tVuoz+9gSAAq77aGOmPmChcV5F8y6/AluACM0mwq3x
	c6tlyKuxZNjyta6O9+S8GNvjFxx9sVLaqj7Izp4nmuHu3Cs6no1dzabFdxaTEUKp2rg4ez25RrCxp
	1JKRtS4vFH1rdNZhlw6rkCHfejj35igJHO/852b4jncHCtm/gW9hv+2MkY1dusev5L91vHs3Fl/GZ
	x1DlCnry5J52y89KZD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHpp-00000007pRp-3G3N;
	Wed, 14 Aug 2024 17:30:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHpj-00000007pNU-3EFp
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 17:30:56 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723656649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tqn57+hZpi2Jjt0F8Cxl8qD8kTNfwnws6c4Z/aS4j3A=;
	b=MSaMv5ELjf6YU252iBOFfNt7fZA7h5IrmObPt8a1Zoju6cViiv8y2MyO0IIcAUMGapaB30
	Zmz4y8qrg27IHBaqcIdTufbm2ch2wq156Z094fRKIBG2dxJBV9uCr58B6QaWfEFCtTTUog
	mcBWt+j/d/D5Pa7OA7DIlKNlRwhrooz4IpT9UK5Q7YBHDDh7DiXq6UWl8AoMGWcIGU/2vT
	CGaPdzcs01jlctdM9zL2LdQ2oxPJAP60WIi6kMuXQ6EZeEGwJbIEZGh/9nDzh6SuwlsejT
	aWNZJAWjPNfUKsqxUMCA/ibJMYlb4jtJi60+LM2NpQ4KG+kBOB/Cgx4Q26jB/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723656649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tqn57+hZpi2Jjt0F8Cxl8qD8kTNfwnws6c4Z/aS4j3A=;
	b=51gIiEmbB93sjEkL/jOUNOL0gex8kw7ZOz+bjn6YvcXCXga0bjPN3vhL3n6FT88T4lM0wb
	1JffiTmJXDiaj4AQ==
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Anup Patel
 <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland
 <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
Date: Wed, 14 Aug 2024 19:30:48 +0200
Message-ID: <87jzgjnh9z.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_103052_000105_0BF883EE 
X-CRM114-Status: GOOD (  18.41  )
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

On Wed, Aug 14 2024 at 16:56, Emil Renner Berthing wrote:
> As described in the thread below[1] I haven't been able to boot my
> boards based on the Allwinner D1 SoC since 6.9 where you converted the
> SiFive PLIC driver to a platform driver.
>
> This is clearly a regression and there haven't really been much progress
> on fixing the issue since then, so here is the revert that fixes it.
>
> If no other fix is found before 6.11 I suggest we apply this.

So this mess has been ignored for two month now?

From the pastebin in the initial report:

[    0.000000] irq: no irq domain found for interrupt-controller@10000000 !
[    0.000000] Failed to map interrupt for /soc/timer@2050000
[    0.000000] Failed to initialize '/soc/timer@2050000': -22

This comes back with -EINVAL. So the timer cannot find an interrupt,
which makes it pretty obvious why the system stops to boot, unless there
is some other timer available.

This is obviously related to the SUN4I_TIMER because that message went
away when it was disabled according to the next pastebin.

Obviously that can't work because the SUN4I timer driver is using
timer_of_init() which cannot handle deferred probing.

Daniel: There was a partial fix for the sun4i driver, which you said you
applied:

  https://lore.kernel.org/all/20240312192519.1602493-1-samuel.holland@sifive.com

But that thing never materialized in a pull request.

And of course everyone involved ignored the problem since March 13th
2024, i.e. almost half a year.

Seriously?

Can you RISCV folks get your act together and ensure to fix things you
broke on the way? Especially when Emil reported this nobody pointed him
to this patch and nobody noticed that it's still not merged?

It took me less than 15 minutes to find that patch and the correlation,
but this is absolutely not my job.

I'm seriously grumpy about that. This is not how it works. If you break
stuff, then you take care to fix it before you shove more changes into
the tree and waste my time.

I'm very much inclined to take the reverts right now, send them to Linus
for -rc5 tagged with cc: stable and ignore/nak any irqchip related riscv
patches until the next merge window is over.

Emil, can you give that sun4i fix a test ride please?

Thanks,

        tglx




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
