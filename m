Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B52CCCD1AF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOO/NdihO1kW+fqsjumfRfVDUnwyOIzhbU/iNhgKia4=; b=BeCEPdqlHLOTae
	xchdz1J8PMk1fwgRTo73+qcQl3j+ryGtUKeef/HR+unhg7n8zfOMdW0CxBDKsRUYpF6u5k6tyq+PI
	m+rpW3gN6F1DhagaBCVKjqchw2f5WG6wpz/Tenkqcatky7c/TS+S5bRZHYwvc6y7o8jtq+eMf9fOQ
	O9IwSSanLB16BrGwWTgM/xFRAUVg6DzeyQdko8Vc3O1SOQTofX1AyLjMSeLCZEYzZ/O3jz1PcFh5T
	3FTQx6UaVI+amEKlKvtMmiEV1kLhm1SrFyg244XPenuTi8TTKpjtflTvB9SYvd80GR8ZjfvBZgkaY
	byr4iDl5Qm2w1P9gx6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHT9-00000000Oic-1SM2;
	Tue, 21 Oct 2025 18:52:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHT6-00000000Oh0-2Kti
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 18:52:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0D2240295;
	Tue, 21 Oct 2025 18:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF73FC4CEF5;
	Tue, 21 Oct 2025 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761072729;
	bh=ZB/5wKX4GVjMeMhEKGtvplG5a7Ce/5sBVRDkGuxOt3M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A2Gt+gY86NYJ/LAdB+LpKwMh85+yFVerVokAhh3p0IkNdwU7w6s2VqoXIY/5I1DIH
	 pKlY7YgXK6qu080HdHW1QJAti7ZaK5Rz5yelMpcMHi5lyMc7Qe/9KanV/X6dwyeXDr
	 CoJ+iFOutyybefoNFGV+y2AXt3D7lHbh/wIxaylU2HuxrebyZGoJhGvQJOTimZoZzR
	 EEmLzSjjC/YVcryETcytDbImk9aSIFgPCSYV04vJFWE4wX3ezUk/eqfW9+adSEtp43
	 A3UaQYxavho4EsrhPiV0PtRKrTiDMGm+5liHVfpT48cNdptaLf4mIn0W88caG212oB
	 y/Q6jNMWqD78Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jinmei Wei <weijinmei@linux.spacemit.com>
In-Reply-To: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
References: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
Subject: Re: [PATCH v5 0/2] ASoC: spacemit: add i2s support to K1 SoC
Message-Id: <176107272657.196841.17126892413935160644.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 19:52:06 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-2a268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_115224_608336_2BBB5D75 
X-CRM114-Status: GOOD (  11.27  )
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

On Fri, 17 Oct 2025 11:16:16 +0800, Troy Mitchell wrote:
> On the K1 SoC, there is a full-duplex I2S controller.
> 
> The I2S is programmable, with the sample width configurable
> to 8, 16, 18, or 32 bits.
> 
> A dedicated FIFO is provided for transmit (TXFIFO) and another
> for receive (RXFIFO). In non-packed mode, both FIFOs are 32
> entries deep and 32 bits wide, giving a total of 32 samples each.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
      commit: 73978d274eba0d9081bc9b5aedebb0bc6abb832c
[2/2] ASoC: spacemit: add i2s support for K1 SoC
      commit: fce217449075d59b29052b8cdac567f0f3e22641

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
