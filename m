Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0E4C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cey7wEQZvC/hSVSBNn2Uh4xNWq/VNVSRr9iUzr9ODck=; b=WHC62+SKapznYA
	BhWewV9TnPO61dWqMLcNIe7stwdN2/8N8Ot1Wp3W2vQ4ajZmJKhu9xDwbmqXucm6Vp7umAaPnZs3B
	nYEUfgY9B7t1sdIXbul4z54JfvRnYPWWpjPVd+Mo4ACqvyazXQZM44T+Xf65GFveJ7TvtaO0A0KiP
	4GsfPn14pyJJ6VTWvVWWm6ffOkJUo6noxySRwulMeG+7dJcDXuWotycVVebuo2kbRaeKG9pAbCo/E
	/I8pmRf9knUSj3s9ubcmT1U8Sel/iA+rbmJKFHSxJYVBt9aXsGWrS7mQyzJpy3K3/wREV682drBcR
	KJ5Hilz19YSM0EWqnwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgSQ-004z8V-1u;
	Mon, 11 Dec 2023 13:36:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgSE-004z5K-1Z
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 13:36:24 +0000
Date: Mon, 11 Dec 2023 14:36:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702301772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUVN2ssEkdii3K08E1/98BL+0ihkfVFzlz/Q0FL4OUg=;
	b=KZK07WrhyghsvuSIfVC1Bm2il+eSi7oZjLvolLZeZ5H/S6YL2HkuWA7PVnslatpO7QWb7W
	fu7yvTdI8jS4avc2Z0rJ1SxTNs2wO3lSGJB/BbHwdS+JiR16OClVW6nmMJYyY+SfTlSKPg
	YErUYCiQE8mRsWlUUhMyiQgMrpM72LhTToDQJOUasKo66z81Ccr96S3X9jj1gz/3uZ/ilw
	9iEbGfyTVmtV2FYM82DcmtUcsA7actso6CjVVJctdEpfwKVZ4fN+vUySY0s9fZJvxKzogV
	7uEUHLmjy82X9QKPZvpJTC0IMC9DVuvSd+nCPFTRft62jiONOQunwNnOgphWqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702301772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUVN2ssEkdii3K08E1/98BL+0ihkfVFzlz/Q0FL4OUg=;
	b=ea4nKht2x+grJeWHo9KkOymkLO/f67qRoaZdBmqBX4j84BGuOTpe9N2/yl964YAikRFnD5
	KxDI8TwD80q96cDQ==
From: Nam Cao <namcao@linutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jia Jie Ho <jiajie.ho@starfivetech.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Message-ID: <20231211143611.5d0248bf@namcao>
In-Reply-To: <20231128-grandma-guru-4fc6e6950a75@wendy>
References: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
	<20231128102722.fQizGKfo@linutronix.de>
	<20231128-grandma-guru-4fc6e6950a75@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_053615_211802_12C72FC3 
X-CRM114-Status: GOOD (  21.64  )
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

On Tue, 28 Nov 2023 10:59:44 +0000 Conor Dooley <conor.dooley@microchip.com> wrote:
> On Tue, Nov 28, 2023 at 11:27:22AM +0100, Nam Cao wrote:
> > On Thu, May 25, 2023 at 02:18:36PM +0800, Jia Jie Ho wrote:  
> > > Selects ARM_AMBA platform support for StarFive SoCs required by spi and
> > > crypto dma engine.
> > > 
> > > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > > ---
> > >  arch/riscv/Kconfig.socs | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index 1cf69f958f10..381cd46e6373 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -29,6 +29,7 @@ config SOC_STARFIVE
> > >  	bool "StarFive SoCs"
> > >  	select PINCTRL
> > >  	select RESET_CONTROLLER
> > > +	select ARM_AMBA
> > >  	help
> > >  	  This enables support for StarFive SoC platform hardware.  
> > 
> > I'm considering sending this to stable trees. Without this, it is not
> > possible to configure the kernel with SPI driver for the starfive board.
> > 
> > I just want to check with you first, in case I miss something obvious.
> > Any objection to backporting this patch?  
> 
> Personally I would be okay with that, otherwise the driver is dead code
> in those stable versions. Just be sure that the rename of some pl011
> variables (I think that's what it was) that was a pre-req for this being
> merged is in said versions of stable. An allmodconfig should flag
> whether that has happened pretty quickly.

Thanks for the info. I think I found what you are talking about:
a1a5f2c88725 ("dmaengine: pl330: rename _start to prevent build error")

It's been a while and no one else said anything, so I am going forward with
this.

Best regards,
Nam


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
