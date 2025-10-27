Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74EFCCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 06:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAOS7gJxvd0tTQr2eGqQyvtTT2oWfHGTd7BL8m4oT3E=; b=0CKhVBLoBGV65l
	vT1jkAHIx4/kawzHAFgdvaZcbqI5ZQ+YWlnaEbpNXj5k/XDcczI7GT5jy2ZsL0o/fsnbkmxTQjTBD
	ZfviwSsw+4pkk2BObAVqj2gkR85MzmNkwmdKimr5HLsJdKgaNuuTpQ8Paih9geCPsPAUk/2AZ4nFQ
	wK2Xft46VJrYUYZy7onA8+zR8mBTl7QphQCeC4hoeHSX9yH07nG+d9TzQoVRFEfvtTjr3BbbyAYAp
	bVo/3fiUN7Q/61eVFznj4yzBAQ/u236xF1SH5c+8qPhWprYoHmdpSTt9wrVYOkqHTcwluqbItXY3P
	w8rxpTKn2wBjsnxMYFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGIK-0000000DAEF-2v77;
	Mon, 27 Oct 2025 06:01:28 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGIH-0000000DADj-2sMo
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 06:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=gaYFdwY891p4uuTCbTw+bn5GIMXkeSKRlnDMN0uMIbE=; b=ToPggUCoz7Enp03xT9VVYhZwRd
	DctaY9+fMIm0Jilb2UDw/quz1ygSP/8HF+mp9o8kCfX8GX1P/HTMDJ+UpjisBVIgPVJOnSadvCuHB
	UL3bnQ2YIRWTEkCMge+FLHnEQKvv9gFbm+LYbTRCMSuv32HoiFd3vzE8GjbNWcugqcmecS6zeIloH
	ZthKdMOBOov2OM7RJ72b1v42dUjzCi/DFXdTlB6GCrIO1XAHFUdHQF2yBsolPJrvuFyg/Mrl/gQT4
	TLemeuJIuny0dJy+hfn+UsWXm45JNlpcaYlBa50wuqRbHD8C5xScwBeP3bG6LSnI7zVVac5nYK7ZX
	bWQY/v5Q==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vDGI5-006Wiq-2q;
	Mon, 27 Oct 2025 07:01:13 +0100
Date: Mon, 27 Oct 2025 07:01:13 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <aP8KqZ1hlqfQVPii@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
References: <20251026224424.1891541-1-aurelien@aurel32.net>
 <20251026224424.1891541-2-aurelien@aurel32.net>
 <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A73D83A7055D782E+aP7lAdAk66slv6l7@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_230126_182526_571FC4C8 
X-CRM114-Status: GOOD (  22.49  )
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

On 2025-10-27 11:20, Troy Mitchell wrote:
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
> default m if ARCH_SPACEMIT?

As explained here, this is equivalent:
https://lore.kernel.org/spacemit/CAJM55Z_BzfRo5aKf2VrneTymSizwDQq6OfMK_LNgyoGjp43K8Q@mail.gmail.com/

But I can make a v5 to change that, if it's the preferred form on the 
SpacemiT side.

> Or default ARCH_SPACEMIT?
> I believe that reboot and shutdown are actually essential functionalities,
> so it might make more sense: default ARCH_SPACEMIT?

That was already changed in v3, following a request on v2:
https://lore.kernel.org/spacemit/CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com/

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
