Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1319DC10F15
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sIR6JaqGM7VHedCfXwtJmPVz7MKzu7WKt1J8tWi+oFI=; b=1pjhO31dqa7IvChbNVBwbBimHX
	8VKpDILrFcdbrXl4OiXfAYfL1eAKLtgY62QsO3hBaDEBDNHNWpr4fEHFb/r12dmBaY35f9Nyd+qNt
	Bng11AmCwaofy9ahzBEzuXUSivEmUqdJ2gYBM09bVbNtYNcezk1yIXTkdSiX9lcYUsBHYX7HcTbjj
	qNRBiitC8u9/RiYbTlrVd0JeETZXK2AtS/G4npb66vWd0TEr+Dh3VVHO+6zh3aHCKshFqdyVFmia0
	3KR0ogoUrcpfcXmMlsoGwK+30ZIQKZgOlq8Kz3g/D1y6oWftFlXniyd9A/Ug2yQ57spyqWSb6zYns
	LJvX4aWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00Rg-00000008wTu-4Auo;
	Thu, 25 Apr 2024 14:51:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00Rc-00000008wRG-3P8X
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 14:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C961C61E66;
	Thu, 25 Apr 2024 14:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616ACC2BD11;
	Thu, 25 Apr 2024 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714056687;
	bh=8dRgSlgyKdCib/XND4kmdZuDizI/UOhr07F15qMIYPU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iZv8YRIxXsiS0/U/AjsJ2jKOqFhqz58EVRl2afTzNoeFgRS6bzdsSrw6Pxgg3rHZ3
	 25b+r3LQ6pbEHq5Y6qqSdqjWv1KIZVVbbg9RJd+VVL7shgzzkIJ9TlDj0r8YMIBW7g
	 zkmKhKTrh4Xt9xa2k7h/azJknkOuaaw6YmDQiV+6zG2RcGdDsvNC4zDwCXJ5b55F37
	 cknwoekAC65eEx5dnbcnxUnLbU4DcR7vdMsn++8JH0Eo1DPWAhnOikLHiWTafkWQis
	 eFh3EL+o/3R5n5OsxjPb3h1CDP/q2yc73SHk0wtehzTqMUvVI80m3LXUDw9D/jOuz9
	 nxvGxNvf8i14w==
Date: Thu, 25 Apr 2024 09:51:26 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: andi.shyti@kernel.org, jszhang@kernel.org, miquel.raynal@bootlin.com, 
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, guoren@kernel.org, wefu@redhat.com, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, 
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
Message-Id: <171405653346.2527762.16827325392956038580.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_075128_951999_D921A3AA 
X-CRM114-Status: GOOD (  16.86  )
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


On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.
> As there is no clock driver for this board as of today, this patch
> series uses a fixed-clock named i2c_ic_clk.
> There is also no pinctrl driver yet so pinmux must be handled manually
> for now.
> It also fixes the order of the nodes in the device tree to comply with
> device-tree coding-style.
> 
> Thomas Bonnefille (4):
>   dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
>   riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
>   riscv: dts: thead: Add TH1520 I2C nodes
>   riscv: dts: thead: Enable I2C on the BeagleV-Ahead
> 
>  .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
>  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
>  arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
>  3 files changed, 127 insertions(+), 27 deletions(-)
> 
> --
> 2.44.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y thead/th1520-beaglev-ahead.dtb' for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:

arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: clock-frequency:0:0: 50000000 is greater than the maximum of 5000000
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
