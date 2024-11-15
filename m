Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011A3D68BC6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qaw02I+YWoDYNK0l0a9XnHc0OO2J4EgAF3TMPCZ/cZA=; b=2dbyuJ2Fj9x4ukFaQk5WoUkQZv
	g4WhWpT0pxjUIlYn81LRV7Xx2PU+0eyyIpsnahlV/rNkpUy5kQpWRZaWBrXUUXHozoC19X626pl05
	yGBuJjN3m1iiKfBHvKUkj74eaSmtQEcdIJ9NKNHNEINCpdn8NjFPgPdP7O+WNJ2wru0Z3yJACXyDc
	hVt0JgonqkVy5ou1Q1ENicXV5fnzhREXv7wnNrNgCj/9SYTF3XJkAD0vXVM32QvcHsV1yl41WXVmI
	GAYk59nS/Y2EPvebCXk+IN0dHPf7R5lE7iKNdtl7D3CQRTKuQ/BhsZxbmMQCy/P2i92Squx7Ruc3U
	alhhRY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBy0S-000000037Ou-3R6S;
	Fri, 15 Nov 2024 15:13:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBy0Q-000000037O3-3Ou9
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 15:13:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A88AD5C63C6;
	Fri, 15 Nov 2024 15:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F697C4CED2;
	Fri, 15 Nov 2024 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731683585;
	bh=Hr/+s0xUJhzrAMfMlo9jseH7gO5RsSZov0OYJtU1M40=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bMgqNLvIj0KSNdhi172yJxZJ+4rDfFehZAoc5JIXcq81rGYWCCsDGKJMVHyD1y7kY
	 ZRP+udz5r080bjG93HaFEH0nJyW/qzc5Lj1soWPBPfk9jLhLVusoBPD/+gzvaKsyeB
	 fURhPwM6OTfnd/Ch7ebaKGhmNxgV6PpXZNNARu1duK1UmJomSlZrYDUQogIQ/1YaeR
	 OwHxxKLFRrPHX/t0YEECkRoR1PwGB/VnqqKePeehefOG3aiN9xNn1uTlVWfcJ6opNQ
	 MZ2vGshYIYWTzGdpnwm+jNXpimJ1XMJ8P6+4teqD8Md5NeGhFZH6afRqHLcUe6p8Nh
	 lMqYWQPqcbVfA==
Date: Fri, 15 Nov 2024 09:13:03 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, 
 Jisheng Zhang <jszhang@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Albert Ou <aou@eecs.berkeley.edu>
To: E Shattow <e@freeshell.de>
In-Reply-To: <20241114201805.24143-2-e@freeshell.de>
References: <20241114201805.24143-2-e@freeshell.de>
Message-Id: <173168321484.2749832.8147306978765028453.robh@kernel.org>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-milkv-mars: set host mode
 and vbus pin for on-chip USB 2.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_071306_890287_7212469B 
X-CRM114-Status: GOOD (  15.15  )
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


On Thu, 14 Nov 2024 12:13:40 -0800, E Shattow wrote:
> Enable host mode USB for Milk-V Mars by setting host mode and connect vbus
> pinctrl.
> 
> Note that testing this functionality depends on two features:
> 
> 1.  commit e10c52e7e064038d9bd67b20bf4ce92077d7d84e "phy: starfive:
> jh7110-usb: Fix link configuration to controller"
> 
> 2. Setting the USB over-current register to disable. This is done at
> bootloader phase, for example U-Boot:
> https://patchwork.ozlabs.org/project/uboot/patch/20241012031328.4268-6-minda.chen@starfivetech.com/
> 
> If the over-current register is not prepared for us then the result is no
> change in functional outcome with this patch applied; there is an error
> visible to the user and usb configuration fails (same as it is now).
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  .../boot/dts/starfive/jh7110-milkv-mars.dts    | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
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


New warnings running 'make CHECK_DTBS=y starfive/jh7110-milkv-mars.dtb' for 20241114201805.24143-2-e@freeshell.de:

arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: pinctrl@13040000: usb0-0: 'driver-vbus-pin' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
