Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6477CE8D5D
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JL3W3c5+yYJi8b7M9YShdxwNxA/oxMgUiqjjoPTHFe4=; b=DTAQ6tlbqn1WYB
	dWIj0asa7A4xDiWEguoTcyeSdoHx1duLfeAab5D8avreDE1xjyAvgnSocLf6kWAqE7sd7GTfenZnI
	jQuYCX6p03BScSlcS0B0A8c6I/3Vqc0CPDjY4WCjWK1cuPnreLzbpXpeNd8JaDnrTAB+gkmWCp5QR
	2XIRBZCHZ/BHSpFtO+K9+Ns8AwMsDqEfP5+SvRSW2Q2xDrBLIcc5gXEPwCya6KXFUSVyOtwZMHIrs
	x4csl8WOnmpvMMUXpAGqzsWfKTVJ6OLAioMKmR/BLusb313w1Xu6FOxnpbaaq6uNyuG4Pfg4hWiQx
	roj67D+ZyNzDXsLBPvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxGS-0000000CoPK-2WSM;
	Fri, 14 Nov 2025 17:07:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxGQ-0000000CoOH-1Gsg
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 17:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD67C40196;
	Fri, 14 Nov 2025 17:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DCAC4CEF8;
	Fri, 14 Nov 2025 17:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763140029;
	bh=CmRiev1jpdffxZw/zxPg5cVSvwXm3OIigSidm0tBhi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ys1Tv+xlo8I7lq5rRkJ/URGPHIUOu+ZzI1qovH6NLRCpHiJlR9b7sRS+beuEZ5f2i
	 Q9v3AwBX65ow5jw+qqmfUJhV5tGgYbIS6K7pny/UnPvJx6gmV6wFnt2qbOc+EV8lww
	 5B/K08cSE8aCqSnZgMLuOM7+RfMABlyzZ4Ry61YVGNBxA+h/sYOgkrUMWmaPuduHD8
	 25pkySDyQm6+bI4oEN9opnSzqsfi7crDVWYeS3UBlFK+c81+AV8bEXg0gBhCA4z0J9
	 hFPNrGqlGwgUtHFg9BkDH7I2ItNa5q68hMFS5EGPZVifmf1Pwpp+1/z/uR1uFgXrM0
	 YIlVP8xH4e+zQ==
From: Mark Brown <broonie@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, 
 Cyril Jean <cyril.jean@microchip.com>
In-Reply-To: <20251107122104.1389301-1-prajna.rajendrakumar@microchip.com>
References: <20251107122104.1389301-1-prajna.rajendrakumar@microchip.com>
Subject: Re: [PATCH v3 0/3] Add support for Microchip CoreSPI Controller
Message-Id: <176314002747.180192.13977683844281536815.b4-ty@kernel.org>
Date: Fri, 14 Nov 2025 17:07:07 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-88d78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_090710_367380_1C3EF914 
X-CRM114-Status: GOOD (  14.20  )
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

On Fri, 07 Nov 2025 12:21:01 +0000, Prajna Rajendra Kumar wrote:
> This patch series adds support for the Microchip FPGA CoreSPI "soft" IP
> and documents its device tree bindings.
> 
> As preparation, the existing Microchip SPI driver is renamed to clearly
> indicate that it supports only the Microchip PolarFire SoC "hard" controller.
> Although it was originally named with the expectation that it might also
> cover the FPGA CoreSPI "soft" IP, the register layouts differ significantly,
> so separate drivers are required.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: microchip: rename driver file and internal identifiers
      commit: 71c814e98696f2cd53e9e6cef7501c2d667d4c5a
[2/3] spi: dt-binding: document Microchip CoreSPI
      commit: 8ce9a2ed153bcaa750aa494e91ce2e70c3b0cdc5
[3/3] spi: add support for microchip "soft" spi controller
      commit: 059f545832be85d29ac9ccc416a16f647aa78485

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
