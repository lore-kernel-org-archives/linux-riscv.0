Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1FECCF9ED
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 06:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvGDjro1Chf3VRH95Mbt6eOyxBL+ePrdLt1GLPqvO2U=; b=dapEFnGocO4FNH
	Tn/2I+LTFSZANpDI/siYXZuRZ0E76sTBzxqu0iJZg7LyV1NpMqjjYTeIi6WZjJl/nCi7qaYCWZPyp
	tfyQtnUpevrF00r6qF/NXn8RUjIoyzxhUftOhobtZvHy/Wb54f4rtJnyhzQMlMxy9ji2bIxqANzJM
	FlEW8f9Yu/A1yRDjNRZrB/v/f0hk1tNwKxh8eIEzZWXA3FBe+4ViL4NxTeIxVUPF96dIi+X17+B4v
	j1KG0szyJmKiYpWkUDyBRMReI3ZGfpiJ/u3jj78VHFlUmdpLDEX9Ohq+6Zm7nWF2vBveX4WTEZ4Wq
	WHine/RG4wX4y7qiJ2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGfJ-0000000DBtg-40Gy;
	Mon, 27 Oct 2025 06:25:14 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGfH-0000000DBrs-1BSW
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 06:25:13 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C81EF26165;
	Mon, 27 Oct 2025 07:25:06 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZHsxAfypXtY; Mon, 27 Oct 2025 07:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761546305; bh=stTFyfLVGp+W4whQthMtW+Y9CwBF66g3n0AdFiL433g=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=DzGTbIhkjVGAqaFY4Ckdcddadvv49E1vqrO3HCLuc17+5EW3y4lck5lJ0QMwwyeWb
	 1/a5SzmCzazKSvbinwNw6Qkqo/a8h5RCLSdDD+1ODTI8k6bMrCQpNDuNFjdIQEvi+2
	 dijh5UfWJvrauNDSLHI95xhtqxWF3OZ9ZbLGsik27ffWxLfvqWSs3Byz7TiPeRF00X
	 vq3dJbLBu5FzMGaHOYJaIQrvcAWRRrMZPpnRbFQB/YEizkSE9b61vHY2kkm+twXGQ3
	 jHIf8wCIN2ETtw82N7mS7irlxSeYgPUk2zrEDFyB4gnTDnJ0vG5jxlm8KJ6WhkN+R4
	 nfZtQYaoe8h1Q==
Date: Mon, 27 Oct 2025 06:24:31 +0000
From: Yao Zi <ziyao@disroot.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <aP8QHwsYDlbQxQJo@pie>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_232511_772611_DDCF1441 
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

On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> > This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> > chip, which is commonly paired with the SpacemiT K1 SoC.
> > 
> > The SpacemiT P1 support is implemented as a MFD driver, so the access is
> > done directly through the regmap interface. Reboot or poweroff is
> > triggered by setting a specific bit in a control register, which is
> > automatically cleared by the hardware afterwards.
> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> > v2:
> >  - Replace the "select" by a "depends on"
> >  - Remove outdated Reviewed-by
> > 
> >  drivers/power/reset/Kconfig              |  9 +++
> >  drivers/power/reset/Makefile             |  1 +
> >  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
> >  3 files changed, 98 insertions(+)
> >  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> > 
> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > index 8248895ca9038..61c16f3d5abc7 100644
> > --- a/drivers/power/reset/Kconfig
> > +++ b/drivers/power/reset/Kconfig
> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> >  	help
> >  	  Reboot support for the KEYSTONE SoCs.
> >  
> > +config POWER_RESET_SPACEMIT_P1
> > +	tristate "SpacemiT P1 poweroff and reset driver"
> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > +	depends on MFD_SPACEMIT_P1
> > +	default m
> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
> I believe that reboot and shutdown are actually essential functionalities,
> so it might make more sense: default ARCH_SPACEMIT?

I don't think there's anything preventing it to be built as module by
default: even though it's "essential", it's unnecessary during kernel
and userspace startup, thus I see no reason to build it in the image.

Building it as module by default shrinks the kernel image, which most
distributions are willing to see, thus helps distro maintainers to
maintain the configuration.

The default value has been discussed in v2 of the series[1], where Emil,
Yixun have expressed preference on "default m". So do I here.

>                                       - Troy

Regards,
Yao Zi

[1]: https://lore.kernel.org/spacemit/aPXAyeDC7YXAketm@aurel32.net/

> > +	help
> > +	  This driver supports power-off and reset operations for the SpacemiT
> > +	  P1 PMIC.
> > +
> >  config POWER_RESET_SYSCON
> >  	bool "Generic SYSCON regmap reset driver"
> >  	depends on OF

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
