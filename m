Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9908CCF9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sygB8qyFDwO6a1ZXuRoo4k0IRfPV+E7Bx8tGePBQaH0=; b=OzaFjpnl73rpNk
	S0m0RhpuxeFZsLESAaEMPaMt6sknGZoTeOvjQLVKnLi1NYe32PM60mtt8RF1x8hkJKy/lYzt8WHYn
	DUnl62dzUAzsVTw92MHYlNECa5f+r0yVHFGtDIn2hRDK3RVVrh6fFbJf3MQF/+x091Y2MvqOQHlHF
	/vL94uglQEdkyjfRo6BrwSo/CngDi2MVAaSp7CPsh3kyDtPriQ6489rm9+cBeFVEW5wLa7NcuAeGw
	//0rWA4CWuRY6425OGtLcPCdgdRYw/e+th9JO1iusiFJTA06zaOUdQMfEzSdifoDOVlV5ZDf9Ubp3
	PhwxTpyJ826yXJvBmEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJTJ-0000000DWMZ-2Yur;
	Mon, 27 Oct 2025 09:25:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJTF-0000000DWLX-37gM
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 09:24:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AC628260B6;
	Mon, 27 Oct 2025 10:24:54 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBjG5FigbkBP; Mon, 27 Oct 2025 10:24:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761557090; bh=jfdUwDgnq3QfeqzXUtLRsl6YPhRoNT1QEbmdgk2ch84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JpPZECOnKi87MZULsBuohtO3XHj9JWS0ZQmI9CIwmblDBg1PNP/DVR/VPhE3FE3/N
	 krnmsUymLHPPKod8YPhGBFwK3iGfTcTQ3QwaE555bF3FCUr/1AS7SIF4horTM+Meci
	 K4sFQkXbsPolJpnectPctepeKNgsxt5f/ReIjNVT+Fq0O/8m9YXBm9IoMGK3qzM0r1
	 7NpTEOvJYSHA+kMMF7ZwABd3sWNKIs34O2N8QOcNSps0a9tKN+D/qnU8rpyA+pmd6Z
	 JfnIF+KRicxclrDJxePl/xQOuTqeAhHmrc3UOsroq+rUB8ajsSa8/zLPSg3AXYkkrc
	 Ff4VXpTW2YS1Q==
Date: Mon, 27 Oct 2025 09:24:30 +0000
From: Yao Zi <ziyao@disroot.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
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
Message-ID: <aP86TltQ2uqeK6FY@pie>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
 <aP8QHwsYDlbQxQJo@pie>
 <mvmh5vk67in.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvmh5vk67in.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_022458_208231_80F9D185 
X-CRM114-Status: GOOD (  31.86  )
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

On Mon, Oct 27, 2025 at 10:03:44AM +0100, Andreas Schwab wrote:
> On Okt 27 2025, Yao Zi wrote:
> 
> > On Mon, Oct 27, 2025 at 11:20:33AM +0800, Troy Mitchell wrote:
> >> On Sun, Oct 26, 2025 at 11:41:14PM +0100, Aurelien Jarno wrote:
> >> > This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> >> > chip, which is commonly paired with the SpacemiT K1 SoC.
> >> > 
> >> > The SpacemiT P1 support is implemented as a MFD driver, so the access is
> >> > done directly through the regmap interface. Reboot or poweroff is
> >> > triggered by setting a specific bit in a control register, which is
> >> > automatically cleared by the hardware afterwards.
> >> > 
> >> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> >> > ---
> >> > v2:
> >> >  - Replace the "select" by a "depends on"
> >> >  - Remove outdated Reviewed-by
> >> > 
> >> >  drivers/power/reset/Kconfig              |  9 +++
> >> >  drivers/power/reset/Makefile             |  1 +
> >> >  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
> >> >  3 files changed, 98 insertions(+)
> >> >  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> >> > 
> >> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> >> > index 8248895ca9038..61c16f3d5abc7 100644
> >> > --- a/drivers/power/reset/Kconfig
> >> > +++ b/drivers/power/reset/Kconfig
> >> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> >> >  	help
> >> >  	  Reboot support for the KEYSTONE SoCs.
> >> >  
> >> > +config POWER_RESET_SPACEMIT_P1
> >> > +	tristate "SpacemiT P1 poweroff and reset driver"
> >> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> >> > +	depends on MFD_SPACEMIT_P1
> >> > +	default m
> >> default m if ARCH_SPACEMIT? Or default ARCH_SPACEMIT?
> >> I believe that reboot and shutdown are actually essential functionalities,
> >> so it might make more sense: default ARCH_SPACEMIT?
> >
> > I don't think there's anything preventing it to be built as module by
> > default: even though it's "essential", it's unnecessary during kernel
> > and userspace startup, thus I see no reason to build it in the image.
> 
> Wouldn't it be needed in a reboot-on-panic situation?

Oops, yeah, I missed this stuff. Seems systemd automatic boot assessment
could switch to another boot option if one fails to boot. And if it's
caused by a (very early) kernel panic, then reboot support does play a
part here.

So my statement, maybe as well as the module's default value, should be
re-evaluated. Yixun, Emil, what do you think about it?

Best regards,
Yao Zi

> -- 
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
