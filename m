Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA6CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nV3XisyGm2mxHdVB0y32AOJPFovJwSlPpIH3nNo809Y=; b=ZtqRpmM7xw+Lag
	eQELG0m0IDUy6aCm431EuTJRl1W0GFqYC81fgx8QYtj602OAeYTQPzqSClz8NB9TspvbATxaKE8h9
	nQQEPdJWzIE7L4mm/MILiWETYClxEXsn4LQY7SaOJSnMiKgTH2pC8WbsDhewJMPD+O9DVJTt5Qm4H
	5Zx101eLmbu40LYmLTNq/hyHrpPZ18VDRO1Pwn7eiZWdEtNGJJbQVMExqjs6YaGJmz8/EKUOlLxtX
	PmxBxCVre+u/I8cFMfF4vfXhaMexGnCKEp+3ccPJcWliwmHmPCbB3tyYbL4DlTAbmby/5i1wM4l2u
	Zh1Oy+cO4RlXzU+sGQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhw3-0000000Btk3-1pGI;
	Mon, 20 Oct 2025 04:55:55 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhw0-0000000BtjJ-2rO6
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Pc2eH0TYEK2vWDWx1vyxaWQbgLYdq9hSWdj4iutTehQ=; b=P0I2b8/3fP6rXv5OquxBSDwB5v
	kzi4c80GhQUhRCcf0eJ+dHd7lCsijsbIRS0su2D7p7N1YF93KfdSbet9zwTykv+wLDSe/K/aj4wj5
	DCmNClBOneDOrCUKZiU/Uy5+dXnTxo5nXb53FrNNXU02VHwt4WnCJYc1EmIa3Kyq5M9iBmyliZT66
	U81EkDLNZfCLK9xx0D6i3ROPCQ5e9XR9oDJ/hmmYX6tEIzOzZyeu9mL51Z6bTuIionOpggDZ6fSZZ
	nNntRSj4g0Vg18jhAJfmjEOqmgtcGd8/BCFX+7S9lx4ku8DO/HAygf3tOelNL3+Rk7rlq/Dqo4/bG
	d7z9wFkA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vAhvm-00E83f-16;
	Mon, 20 Oct 2025 06:55:38 +0200
Date: Mon, 20 Oct 2025 06:55:37 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <aPXAyeDC7YXAketm@aurel32.net>
Mail-Followup-To: Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>,
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>
References: <20251019191519.3898095-1-aurelien@aurel32.net>
 <20251019191519.3898095-2-aurelien@aurel32.net>
 <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_215553_149302_E5C79D67 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Emil,

On 2025-10-19 22:53, Emil Renner Berthing wrote:
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

I have just tested to build it as a module, and it indeed works that 
way. I'll change that to tristate in the next version.

> > +       depends on ARCH_SPACEMIT || COMPILE_TEST
> > +       select MFD_SPACEMIT_P1
> > +       default ARCH_SPACEMIT
> 
> If it does work as a module I'd prefer "default m" here.

Do you mean "default m" or "default m if ARCH_SPACEMIT"?

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
