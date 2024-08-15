Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C832C52D7D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JwSuSc2HbndV+ubP/dAERV1cfXFgXbfM1zrwFi518g=; b=yuaz+zDgvWYh6z
	p9p8U/I19y0dcXT6HHVBK5/em+BJaHhEFITcmVVeRi5FkNSVwsHxxZQHTLapyb87GOcCIHK0alUu+
	UFJAbagqyYgn8+YYFIhR8ohM/MEKmi9o+MyTtqgGvWERW4Dj6Q+4pjAIHKuoGrodOjdHNgfXQdYpg
	KciqiHpCzF87AQEpKqU5BKEu9s1A4GLHbdjfEIX7ITDg/iOBfSYOBpz6jwB33g976D5sCxK8W6Tps
	umnDxod1Bs/z4t+mXvlGb6P+syybZJtxXnuoHs8+1+AlXE8tuzhjxbHO2jn/HAcGsMHeYpQ0mRavF
	pF42gAbxlnmOW6E3uJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seabc-0000000A3EH-2sWW;
	Thu, 15 Aug 2024 13:33:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seab1-0000000A35g-3TEa
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 13:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33C7A61EAE;
	Thu, 15 Aug 2024 13:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BFAC32786;
	Thu, 15 Aug 2024 13:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723728775;
	bh=tVIBQ05Sxjj6G+WoRfKXoQawx0KCI2nVwYWMwKVGOt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mARsL9XO3WG5lzHQ8POuslyEpUJ7qN5Px743DAe3TqianZtoX+dE5/IrA3zAuyGPR
	 f/2ZnjQMbEgRaxEj4p+rovvXyqNjHx1wZ3YmSwLv3Skf8ayGjMERhJHsm3Y+pmWSSH
	 +M0auWV5kBL3lRXuS8Mpgx5XYS4NJhLPThy7Q6wObbZCRaVjC8mKrnn6g61VeVOAmS
	 nLSh6gEheuZYtt3Llvls/8knutS8PbPENG01IboYQBpO8sXNb1UcAe9sozvkJDvPv1
	 w7mZoxspV3HQxxGIewK9p2q6TFPPWXAtre1gwTbkehbA2cJVHntdrUAXEB24ZFnco7
	 oIkYCF+IQzgJQ==
From: Mark Brown <broonie@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 pierre-henry.moussay@microchip.com
Cc: linux-riscv@lists.infradead.org
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
Subject: Re: (subset) [PATCH 00/17] Add support for Microchip PIC64GX
 Curiosity Kit
Message-Id: <172372877354.37632.3850182669265541987.b4-ty@kernel.org>
Date: Thu, 15 Aug 2024 14:32:53 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_063255_953687_75264BAB 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu, 25 Jul 2024 13:15:52 +0100, pierre-henry.moussay@microchip.com wrote:
> This patch series aims to add support for Microchip PIC64GX Curiosity
> Kit to the Linux kernel
> 
> Microchip PIC64GX Curiosity Kit is a compact development board based
> on PIC64GX (PIC64GX1000-V/FCS)
> The kit includes:
>  - 1 Gb DDR4 SDRAM
>  - microSD slot (used for boot)
>  - 3x UART (among which 1 is used by the FSB UART 0)
>  - 1x Gb Ethernet
>  - various connectors, including mikroBUS connector,
>    Raspberry PI MIPI RX Connector
>  - 1x JTAG
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/17] dt-bindings: spi: add PIC64GX SPI/QSPI compatibility to MPFS SPI/QSPI bindings
        commit: d6d0af1b9efff4e83ecd5eb2585b6e5f75df7495

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
