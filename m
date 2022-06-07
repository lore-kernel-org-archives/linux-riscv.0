Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF62CCA47E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5NvQaGdn3JcHBScWJl1tiQ1HMvMtAiGXbmI/xGTSSU=; b=vgAFWmKCdOG3CP
	7ihr/ZNfUtwCae2YEmNuv5EOsHAHKMtrJ7Rg6RJIv+/LUrs83KnG85vVld1S2ddaQnys9HRmek8gR
	MWYDiq2m4yFLFIUTRQ51l47gwXstWKruaTHpP5i6+/MvGaxC+tb/AvjGL9FZbxG6GHAcujXOHMKpA
	pzEAKxWDO/2H4P0l+9pV8BL1dm/yAiaoycuQUIvexBPtOrj3XHDpcDcXOD62Il96dmkjq1KDO6/Bh
	wr88hBGgbVdrTsA3BusII6Ik3dFBaP29mc/FZgzRjX1QqzRL5sY3bPGEqv3+/TE8HFkJEyWTGxujs
	21zfY8NF4q5mU7kjYwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyd5F-008eA0-PC; Tue, 07 Jun 2022 17:33:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyd5D-008e97-6W
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 17:33:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C825A61521;
	Tue,  7 Jun 2022 17:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2948BC385A5;
	Tue,  7 Jun 2022 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654623214;
	bh=Lk4+xjJRHwdFc/LovKppznE7yFQsbzVIbVHDMQnayTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l4aDlf+uVpJEHdQOfzIMYm09KQjrAuAw2erK07aLAfug5ApRDy1XlakPrXXiRYdjx
	 H16vDx4r+ESt+hngYJXiiLR+NzX5bjXB+UX50eIiQHeC1sQOeRnW2ql7bkXl2FhIFY
	 zvqjlWqXvCxzwZUuRJ47iIY8Sl6vBWGvDk87EojOv2ovl5aTPm4MAW5/Qof+2ZHvIF
	 sQ1u65bcdOaqbZkxoIVS+cTTL3OofM4gnByabptzabArXTJKGrA6Wv1ovXhL0cBfn4
	 TEbO/RAHe4ZpSpMwoI+6bGvSgkXl30yo3ZJb4OBym2lEY88l++N09PII2NnRNC9/7N
	 J8WhjYZ+EDjYg==
From: Mark Brown <broonie@kernel.org>
To: conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, daire.mcnamara@microchip.com
In-Reply-To: <20220607073833.2331539-1-conor.dooley@microchip.com>
References: <20220607073833.2331539-1-conor.dooley@microchip.com>
Subject: Re: [PATCH 0/2] Add support for PolarFire SoC's spi controllers
Message-Id: <165462321288.3040195.2196860226827286633.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 18:33:32 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_103335_312919_38A64C55 
X-CRM114-Status: GOOD (  15.66  )
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

On Tue, 7 Jun 2022 08:38:32 +0100, Conor Dooley wrote:
> Hey Mark,
> 
> As it says on the tin, here's a patch adding support for the spi
> controllers on PolarFire SoC. The binding for them was already
> added in 5.18.
> 
> Thanks,
> Conor.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: add support for microchip fpga spi controllers
      commit: 9ac8d17694b66d54b13e9718b25c14ca36dbebbd
[2/2] MAINTAINERS: add spi to PolarFire SoC entry
      commit: f303c6b26cede1aa137dc3e10eee78a80cde9999

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
