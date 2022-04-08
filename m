Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8ABC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 13:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bisq/oiSYgyuvqR+pHzDurDm8fTEY4hv6wlJMYpBnko=; b=q1nTLYz3OX6Kbg
	PYkLs5ppc8KCWI3mxH/xk/AudLUml21lofxFo/9QWzBjem3BjNiu6GZw2rtIeLF2Lkgx8xoftFT7d
	RmiC8RmomQp6KuS5O8F7OMZa+37hj+D9veWxpTTlvc1Wd6QTljCV6fkgAYCGDMuvv/KYIR4ctVxKX
	dMWEaX/7fxD4IW+sjBQHth3tc+kTnqlV5P+EbHjLD1v6E/WCek3Kt5k0yGkj0ffTU6AZRKIhVZLf6
	TCw1qJGOtp8fVoVK0/h0Tjmcls8RGMkO4Sv8r8EEYKqtXRTjCMFiKlu55VFuPh9y9qZaJ3+ek8+dF
	QcSlBOeBRLPwINE1HNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncp6Z-00HVm5-Cm; Fri, 08 Apr 2022 13:56:51 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncp6W-00HVlg-Bf
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 13:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=dngIcVIDwXBGuNu1rq593+iPVa4YStJsJHog+HHb5xU=; b=wkK8yny5rMKMJPLI7an5XIOtnY
 OjG1u+YDWkCx0n4aizW/8y44T4ZdpkE1hBbGEAkKixf560sYFXst8jWC3mIfPuZtASACaqP2xMNU+
 aMQYVnGCwdsi0cwwHnq6LXizkyrBaUeDGUnCRiaIHMYOFNflV74nldy94BY5XfPtyLa0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ncp6O-00EpxS-Bb; Fri, 08 Apr 2022 15:56:40 +0200
Date: Fri, 8 Apr 2022 15:56:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
 daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org,
 palmer@rivosinc.com, linux@armlinux.org.uk
Subject: Re: [PATCH v1] clk: microchip: mpfs: don't reset disabled peripherals
Message-ID: <YlA/GEA0uai/s0g4@lunn.ch>
References: <20220408131352.3421559-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408131352.3421559-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_065648_437515_3D81BB13 
X-CRM114-Status: GOOD (  13.65  )
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

On Fri, Apr 08, 2022 at 01:13:53PM +0000, Conor Dooley wrote:
> The current clock driver for PolarFire SoC puts the hardware behind
> "periph" clocks into reset if their clock is disabled. CONFIG_PM was
> recently added to the riscv defconfig and exposed issues caused by this
> behaviour, where the Cadence GEM was being put into reset between its
> bringup & the PHY bringup:
> 
> https://lore.kernel.org/linux-riscv/9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com/
> 
> Fix this by removing the reset enable/disable code from the driver &
> rely (for now) on the bootloader bringing peripherals out of reset
> during boot.

Maybe you should keep the clock enable -> disable reset part, and only
remove the clock disable -> assert reset part. You are making the
assumption that the bootloader disables reset on everything, when in
fact it could only disable resets on peripherals it needs, and it
needs the ethernet for TPTP boot.

What is your long term fix? It seems like you need to add a reset
controller. The macb already seems to support that:

macb_main.c:	/* Fully reset GEM controller at hardware level using zynqmp-reset driver,
macb_main.c:	ret = device_reset_optional(&pdev->dev);

So once you have it, it should be easy to wire up for this
peripheral. Once you have them all using the reset controller, you can
then remove all the reset code from the clock driver.

   Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
