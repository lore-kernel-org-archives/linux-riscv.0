Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1D9CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 05:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wRE9gxFNoAx6qCp46KZfTzuCAUaqNd5dI/520aPlfg=; b=kP3g3NKjLL+Raj
	GShXmvdhlg9IVuDg0/eNvLQ19OYBH9As+S7KTWl+4jPVC1kzq9kd/BYMlU8g7+nFuxAautZZHpjYk
	mkkEGQTsDn3b2PGi4lNy1MWuYg0Vq4oMZZz7ugO28zByMlekytdcPm5w/zK/UHYMtEtxR7AEn7NL9
	bA9pcgLPahKrLOM1CCoO3zookud+HDWq+TN1khduqpF/+E3LLFRnVLOMxfj0DtR32TYUXcR+QE9+f
	UgZU5uWSWPQUqMauzJqJbrM8v6HA4LkbVraK2Ki9sdLPyykTBlKtBUO1yrueA+pRhoqfM2vLXAchb
	iccWbwG/DhTOQBiHL8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAi0c-0000000BuaN-3mUx;
	Mon, 20 Oct 2025 05:00:38 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAi0Z-0000000BuYG-4ATh
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 05:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760936357;
	bh=DpbVwuJ0hNCZpya/CMtmT6R12p5giGePJ0QvCPe4sSo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=VEgSgePc/YwvQorWa+WZySiXYzGfbDz6NHHOuGnfOVktEiJzRBV+W1SSShZRltY/h
	 8rJa0YfIIKFQ2IbvTSpCArqqjnQkgG3JE73WHN1JqLDNx5b2RzQzESetEc86Mxj6ZI
	 uac0p3X69b+m8JrclQs3cmI5CRPI0pkxUAGATKv0=
X-QQ-mid: esmtpsz11t1760936349tfb6addd4
X-QQ-Originating-IP: OhogqkvT3TOqQzaOd3wS30RTmN/HDzTlS9mVV7AHJGs=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 12:59:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13248711578599925219
EX-QQ-RecipientCnt: 13
Date: Mon, 20 Oct 2025 12:59:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
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
Message-ID: <2EE2D63A9E55C55A+aPXBm6t0llG63Knv@kernel.org>
References: <20251019191519.3898095-1-aurelien@aurel32.net>
 <20251019191519.3898095-2-aurelien@aurel32.net>
 <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
 <aPXAyeDC7YXAketm@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPXAyeDC7YXAketm@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M5z4lLHHBhdaxz5RP7nhMuxwhVSyvodbNARvy6h8ltlS930DBDI5w1Mp
	qAbRU0nlv+wsgYMMObCF/BdbKvMqMpT5i4QtAIGEEmOMdg9VGDuiUW5NUoli5uaOmcVPyxA
	WP0ptucg7rOknkVaSa4NoAXT5/j1X2pH3d+TU6TjFSZEmtynHGqLpHrMbJYVrYcRi3TeMN5
	0n/606bjSzKad4UbA/t59zJtdzNcXllFB+/aRkgdLLuRyhoQqJGXoQTUIIO//OY9Si0EP6I
	OURzv7U/OQPREXAPvG09wyVbNxZSW4ZJvn3GEctJGdfOEUW5GZCrFEN5/jGs98tZQu46jf7
	SK09424PFN4XbaeJ1toAnSOvzwL+3DrIYXEhJJoBSqj92m28to1pDtrQTH0m/Ojow0q+cxU
	/de4uoRxMMehEyOMRzJ61+HhMTD/728xDxDB5LUUS+zY603AabNwDyg34G/4HPa4CqsEniu
	Ytzxc8gCVYb6ZTexhDJLqaF700ZMbKH8kdEH8ri4R+mew1KYF4WkVb0IUAK3MDpbYyY4Bvr
	V7pA2CtSdiPtKdXxUVJjqIhSsS65nrMWv5gJnmBg8i3oeN3AAxcm0kWkv1cEbQ0cS24vuMP
	mWRWy1uArvzrEO5jCJ8zpgoNloDJsKYKgnItGPeRoVUKouKy/njYl0WO8RHRN9VqwevtK7e
	Rlut1jz3MRtVuC8f/JQo2fLM4kjUCrdZW1E5XG4/iPfUU2rEGOGf8Iq2/cyCZq0x5bxCwp1
	otkLJswTqwfdHzVtOGvOIybbhA2NV5Slymi1cf6Az7eZLIvzVOfrumifA0ETMj13AGg8/lE
	qul7TZlHy45QMzzwPTP4u43TzvyIaAAYn3KUi2/dGaPFa/mx+ZcmJRg0IR1aSJxSwU+LEFZ
	hy9XW6HLObnZG9uhSmMM2/xT3JqhCiDwG9QcKXGlnueA8JmboU4Bk3Xb+zdP2oNtzNJH+qY
	zlQ7XinBoUQYqnvYRyzskIX0tW0WAv3iLv+HpXG3sqsfKWOBbkdlFsUpIiCRHiZKzuJ+Yxf
	PN5gHXatEFzsDn/KxVVU3l5WX0RRFW9Ryio5L9VjEm7ClnJafkKWAq8QVv2wGAldpuLyj+b
	GPwbVIHmeE+
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_220036_408115_C8216867 
X-CRM114-Status: GOOD (  28.49  )
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

On Mon, Oct 20, 2025 at 06:55:37AM +0200, Aurelien Jarno wrote:
> Hi Emil,
> 
> On 2025-10-19 22:53, Emil Renner Berthing wrote:
> > On Sun, 19 Oct 2025 at 22:34, Aurelien Jarno <aurelien@aurel32.net> wrote:
> > >
> > > This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> > > chip, which is commonly paired with the SpacemiT K1 SoC.
> > >
> > > The SpacemiT P1 support is implemented as a MFD driver, so the access is
> > > done directly through the regmap interface. Reboot or poweroff is
> > > triggered by setting a specific bit in a control register, which is
> > > automatically cleared by the hardware afterwards.
> > >
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
> > > v2:
> > >  - Rebase onto v6.18-rc1
> > >  - Use dev_err_probe() to simplify the code
> > >  - Fix indentation of patch 1
> > >  - Collect Acked-by and Tested-by
> > >
> > >  drivers/power/reset/Kconfig              |  9 +++
> > >  drivers/power/reset/Makefile             |  1 +
> > >  drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
> > >  3 files changed, 98 insertions(+)
> > >  create mode 100644 drivers/power/reset/spacemit-p1-reboot.c
> > >
> > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > index 8248895ca9038..063202923d95d 100644
> > > --- a/drivers/power/reset/Kconfig
> > > +++ b/drivers/power/reset/Kconfig
> > > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > >         help
> > >           Reboot support for the KEYSTONE SoCs.
> > >
> > > +config POWER_RESET_SPACEMIT_P1
> > > +       bool "SpacemiT P1 poweroff and reset driver"
> > 
> > The driver code looks to be written to work as a module, but here it
> > says "bool" not "tristate".
> 
> I have just tested to build it as a module, and it indeed works that 
> way. I'll change that to tristate in the next version.
> 
> > > +       depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +       select MFD_SPACEMIT_P1
> > > +       default ARCH_SPACEMIT
> > 
> > If it does work as a module I'd prefer "default m" here.
> 
> Do you mean "default m" or "default m if ARCH_SPACEMIT"?
I think it's "default m if ARCH_SPACEMIT".
because only SpacemiT uses P1.

                    - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
