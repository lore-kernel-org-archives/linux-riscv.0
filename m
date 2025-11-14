Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D1CE8D55
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IWpEj8ghJjiyd4Hxza32eyObeLHAJC/XiD+U38MRecU=; b=1zCnV9XJ3YF7wP
	QOozG1BFOL6bIOgxV9xkkU2MfFJ2BFSSVXYKpNm2vAsUsDKOIApWntxXYd55smw0w0XQ1ToUji9D6
	rYtAZ6F+uWiA8TLaVB4jaLpuB6OcujpijCGihfHOgNNbMzTaE6LU4+7e9v/HP1N6nUYOTuN42sJn6
	FwkmzdTKKLD+Z42VGqYGVa4vKzddO5KOKzltSZfUNnic/JOszV8rrm0qf+vXx9/dmsUHjtuhmji6e
	UrI04WngQicvoVsv/CHxWOgOobRmpgYnQEU4GGxqqg92AEt412oN/MVLLPailwnPY30/ilnjh+xa2
	HrsZaThZH8BJ8w1z+PQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxGU-0000000CoPz-3mKK;
	Fri, 14 Nov 2025 17:07:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxGS-0000000CoPD-2BY5
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 17:07:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A8C54342C;
	Fri, 14 Nov 2025 17:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB94C4CEF5;
	Fri, 14 Nov 2025 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763140032;
	bh=igsruaZJbdtmGdaC7B3AS7+DHvBZvaCaPggr5B93CGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UKyK6ruWPWv9yGMBCnINyDrnhMy42aw/EMiYMNaQxh6ockNFFts/0YsAYtXJhav1X
	 D3ZtvvGusUVZl9tWcAHlp32bUnPxx3JZMETxkAsI2F2KgX56YJSKYulbsKi4WcCCN4
	 OuCHNm8MDkeIMEW4qKgeF5qVafuJ/2FwclXcvQ/6LJ6u1egDzZwzD7P30c4WYtK/+C
	 aXOXZQ5ViMcgOUlU6xVJum1LQZnocf0xTHZX7w8Gvb2Q6SezhmsgJ6IgPzB6yF1SCK
	 HyTc6Gw1FiWRkjF7rgPigiWoIuDS8u0dqPK/9YUADf+OjgNagcyOmwoNRAbAZrt3fC
	 ixeTgM2HVSJWw==
From: Mark Brown <broonie@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, 
 Cyril Jean <cyril.jean@microchip.com>
In-Reply-To: <20251114104545.284765-1-prajna.rajendrakumar@microchip.com>
References: <20251114104545.284765-1-prajna.rajendrakumar@microchip.com>
Subject: Re: [PATCH v4 0/3] Add support for Microchip CoreSPI Controller
Message-Id: <176314002988.180192.12322068947585326018.b4-ty@kernel.org>
Date: Fri, 14 Nov 2025 17:07:09 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-88d78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_090712_597055_D88B3CEB 
X-CRM114-Status: GOOD (  14.42  )
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

On Fri, 14 Nov 2025 10:45:42 +0000, Prajna Rajendra Kumar wrote:
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
