Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720AFCCD184
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 00:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMJGwONp8FPw3nc/n0raZUE78ZnpTMOMNtjx6jwyDg4=; b=1WIhRRx9SVuvs8
	6lMsGOG+hyD8FT5HMre3J/xFT359qk/QTND6a+KCZFtNPDcu/Y6f10FPiMUxagZsbQ9hTWfjw2pDy
	m6ZdSyuk701Tfu5ECGPogpVu+TImvLEXMZvs3iBaTzVyPvPHu1eq5aTzHpY7PHasFSdyJ+2AFnCSw
	/BMio0l7OZ0qhGY1pE6TvtCCurDGsC7G4CmBkIrNDcPErPBZT2dsTrGYK7sGXEjitYCYxvGnbO2GU
	huqL30LG32aHHX7UX6l8g39Ye7X5zS9pGAbu4wa12Npkv7GHqDw9NNZGPH+D1BtuI3UjE4zk087IH
	48ZgWkIc8GHR56s0WoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAdPH-0000000BY9X-2dL5;
	Mon, 20 Oct 2025 00:05:47 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAdPF-0000000BY9A-43zA
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 00:05:47 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B60C6340F21;
	Mon, 20 Oct 2025 00:05:41 +0000 (UTC)
Date: Mon, 20 Oct 2025 08:05:37 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <20251020000537-GYC1506524@gentoo.org>
References: <20251019191519.3898095-1-aurelien@aurel32.net>
 <20251019191519.3898095-2-aurelien@aurel32.net>
 <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_170546_037638_3266C4A0 
X-CRM114-Status: GOOD (  23.92  )
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

Hi Aurelien, 

On 22:53 Sun 19 Oct     , Emil Renner Berthing wrote:
> On Sun, 19 Oct 2025 at 22:34, Aurelien Jarno <aurelien@aurel32.net> wrote:
> >
> > This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> > chip, which is commonly paired with the SpacemiT K1 SoC.
> >
> > The SpacemiT P1 support is implemented as a MFD driver, so the access is
> > done directly through the regmap interface. Reboot or poweroff is
> > triggered by setting a specific bit in a control register, which is
> > automatically cleared by the hardware afterwards.
> >
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> > v2:
> >  - Rebase onto v6.18-rc1
> >  - Use dev_err_probe() to simplify the code
> >  - Fix indentation of patch 1
> >  - Collect Acked-by and Tested-by
> >
> >  drivers/power/reset/Kconfig              |  9 +++
> >  drivers/power/reset/Makefile             |  1 +
> >  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
> >  3 files changed, 98 insertions(+)
> >  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> >
> > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > index 8248895ca9038..063202923d95d 100644
> > --- a/drivers/power/reset/Kconfig
> > +++ b/drivers/power/reset/Kconfig
> > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> >         help
> >           Reboot support for the KEYSTONE SoCs.
> >
> > +config POWER_RESET_SPACEMIT_P1
> > +       bool "SpacemiT P1 poweroff and reset driver"
> 
> The driver code looks to be written to work as a module, but here it
> says "bool" not "tristate".
> 
> > +       depends on ARCH_SPACEMIT || COMPILE_TEST
> > +       select MFD_SPACEMIT_P1
> > +       default ARCH_SPACEMIT
> 
> If it does work as a module I'd prefer "default m" here.
> 
I second this, you can add my RoB if with it fixed

Reviewed-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
