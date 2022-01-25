Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166E4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNPfX/IdxelAbrOvRm9CfkJ6gLUP8YsCBYy8nrcrIoY=; b=yCObN/NhUkdEYl
	kAoW+fBf24S7Ie0HSLI2OEqPcRBxsHdDtn8+Ua3ULMi/p3q3MU1YOv9x5LRlzse8k+wV4x07Kwh0S
	kS2nZ7JNgzJoZuv7uDEoAMxVwwW1tpKk8gF39Rd/5LfEnlU5vTyqrmns+GPILrOUcvBzWu+HnJvUE
	5Qs7GcTMap44nqfQO0Eo1rWtXBjOWhAJOQH56KGNyK56CRdhVIszEm9uK4zhvubBjCDOyxOy/pJWR
	k1dLRnascS2uuHBKEASQcieTZkzhzMUkDKFv3ONRLsuednzLwzMLKcx1YlSudAMzbl26JXD9+vkny
	qeU1fhvDUkSdJEWvRTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIx6-007PdA-Av; Tue, 25 Jan 2022 10:21:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCIwq-007PZU-IB
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 10:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0F2261614;
 Tue, 25 Jan 2022 10:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85412C340E0;
 Tue, 25 Jan 2022 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106071;
 bh=dDZYgGbA0BHGN18HiUB3PXb8Mel6TNqbFMOFcstIxX0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Dk+O+jx9RNfAIRNl+G5yibdxkkq8aTGXmW91f6mxjLCST3oy+fJt+u4/SRVhCxwpw
 V4COe9T6WaXtk7IlXR17mBCgwBp4NdpQVxrZVQBMRo4fukpDBetZZE/3AhUipDYJfZ
 xDjnOl5awl586lrBjMlr+/CxVsQxyeLRfUN/t+E2n5TSLam4ejfcYmGSP8J+81pjOo
 E1JEbrV6QM5bmj7eTrXB6ABpB8aUHr/6lJay6YVAuVOwXsam2ucGeIdLB6MC6PKHJh
 rs61dpnbb/ib/qZXwyOem11DRLndWGy6AorM4XzUTNqRuyGvWbZ7/xy4q12565R+d4
 GBF9r1mIDxWGQ==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linus.walleij@linaro.org, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, lee.jones@linaro.org,
 jassisinghbrar@gmail.com, linux-usb@vger.kernel.org, thierry.reding@gmail.com,
 palmer@dabbelt.com, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
 gregkh@linuxfoundation.org, bgolaszewski@baylibre.com,
 linux-crypto@vger.kernel.org, robh+dt@kernel.org,
 u.kleine-koenig@pengutronix.de, linux-i2c@vger.kernel.org,
 paul.walmsley@sifive.com
Cc: geert@linux-m68k.org, bin.meng@windriver.com, lewis.hanly@microchip.com,
 ivan.griffin@microchip.com, krzysztof.kozlowski@canonical.com, heiko@sntech.de,
 atishp@rivosinc.com, daire.mcnamara@microchip.com
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v4 00/14] Update the Icicle Kit device tree
Message-Id: <164310606421.75071.15666469655719890555.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:21:04 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_022112_718430_763C67FE 
X-CRM114-Status: GOOD (  14.72  )
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

On Mon, 17 Jan 2022 11:07:41 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This series updates the Microchip Icicle Kit device tree by adding a
> host of peripherals, and some updates to the memory map. In addition,
> the device tree has been split into a third part, which contains "soft"
> peripherals that are in the fpga fabric.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[06/14] dt-bindings: spi: add bindings for microchip mpfs spi
        commit: 2da187304e556ac59cf2dacb323cc78ded988169

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
