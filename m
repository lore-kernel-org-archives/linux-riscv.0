Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CA8C83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 06:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K11EuG2v01zqz6KllN/pPR4sZDLLa1K0vQW/qkl9vjQ=; b=PcXOzTlhmKh7Hn
	6LA0rOMG168zm43MBWxTWyz4Dn5WOOG4x4yrdUzhj1YoWgj7H3a0r5v3uBCn0Tf/cootgy5IsUIsG
	6GYxijmQ8g7uSHSswTAWIWc11xN+KP85b9b2h5j2GmjGDL+i8Ny0Aocf6oj4qSYoz0QynFyemGk+O
	Ipdm27ngZTXMrHc9izQEGr5IouIKF3+ehLagQcK/5I46b32K+FKkHFzaKTH6zjOe5WBuizsdT9A+q
	rLm5aloQCNLwrNpehVSlckca8A8alwvlVcHzCGzi7EV8r5XZY1s6YOLRBzbkrJcE7qPiHjqfUitTc
	3FY1qlsfIZ4ndyo0hzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOT0-00000007gaF-37TP;
	Wed, 09 Jul 2025 06:39:42 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOR8-00000007gSS-0myc
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 06:37:47 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 531B0342289;
	Wed, 09 Jul 2025 06:37:43 +0000 (UTC)
Date: Wed, 9 Jul 2025 06:37:38 +0000
From: Yixun Lan <dlan@gentoo.org>
To: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be,
	heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com, Guodong Xu <guodong@riscstar.com>
Cc: elder@riscstar.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT
 K1
Message-ID: <20250709063738-GYA488894@gentoo>
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <175198458423.86859.5882458274157023095.b4-ty@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175198458423.86859.5882458274157023095.b4-ty@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_233746_250480_3CD6D098 
X-CRM114-Status: GOOD (  15.58  )
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

Hi Guodong,

On 22:33 Tue 08 Jul     , Yixun Lan wrote:
> 
> On Tue, 29 Apr 2025 16:50:42 +0800, Guodong Xu wrote:
> > This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA driver
> > and updates related device tree bindings. The changes enable PWM
> > functionality on the K1 platform through driver enhancements,
> > configuration updates, and device tree additions.
> > 
> > Functionality has been verified on the Banana Pi BPI-F3 board using PWM14,
> > configured as a pwm-backlight. Per community feedback, the actual
> > pwm-backlight node is not included in this patchset but can be found in
> > patch 7 of the v1 series, with modification of pwms property to 4-cell
> > format to match updated binding (#pwm-cells = <3>) since v3.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [3/6] riscv: dts: spacemit: add PWM support for K1 SoC
>       https://github.com/spacemit-com/linux/commit/9aebdfc21f755e0d2766683aa251435fb656ea47

found have to re-arrange the nodes according to ascending order of unit address,
so here is new version I've pushed, just FYI, please check (should have
no functionality changes)
       https://github.com/spacemit-com/linux/commit/66f56c7a64213948341521b5310064586a05c80e

> [4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
>       https://github.com/spacemit-com/linux/commit/8709d51024068d4c81dc785d63169d283d147cf3

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
